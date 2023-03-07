require("scripts/unit_extensions/generic/generic_state_machine")

PlayerWhereaboutsExtension = class(PlayerWhereaboutsExtension)
local position_lookup = POSITION_LOOKUP

PlayerWhereaboutsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._player = extension_init_data.player
	self.closest_positions = {}
	self._input = {}

	self:_setup(self._nav_world, unit)

	self._last_onground_pos_on_nav_mesh = Vector3Box(Vector3.invalid_vector())
	self._jumping = false
	self._falling = false
	self._nav_traverse_logic = Managers.state.bot_nav_transition:traverse_logic()
	self._jump_position = Vector3Box(Vector3.invalid_vector())
	self._fall_position = Vector3Box(Vector3.invalid_vector())
	self._free_fall_position = Vector3Box(Vector3.invalid_vector())
end

PlayerWhereaboutsExtension._setup = function (self, nav_world, unit)
	local position = position_lookup[unit]
	local level_settings = LevelHelper:current_level_settings()
	local nav_world_available = not level_settings.no_bots_allowed

	if nav_world_available then
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, position)
		self._last_pos_on_nav_mesh = Vector3Box(position.x, position.y, altitude or position.z)
	else
		self._last_pos_on_nav_mesh = Vector3Box(Vector3.invalid_vector())
	end
end

PlayerWhereaboutsExtension.destroy = function (self)
	return
end

PlayerWhereaboutsExtension.set_is_onground = function (self)
	self._input.is_onground = true
end

PlayerWhereaboutsExtension.set_fell = function (self, player_state)
	self._input.fell = true
	self._input.player_state = player_state
end

PlayerWhereaboutsExtension.set_jumped = function (self)
	self._input.jumped = true
end

PlayerWhereaboutsExtension.set_landed = function (self)
	self._input.landed = true
end

PlayerWhereaboutsExtension.set_no_landing = function (self)
	self._input.no_landing = true
end

PlayerWhereaboutsExtension.update = function (self, unit, input, dt, context, t)
	local pos = position_lookup[unit]
	local input = self._input

	self:_get_closest_positions(pos, input.is_onground, self.closest_positions)

	local nav_world = self._nav_world
	local last_pos_on_nav_mesh = self:last_position_on_navmesh()

	if last_pos_on_nav_mesh and not self.player_on_nav_mesh then
		local success = GwNavQueries.triangle_from_position(nav_world, last_pos_on_nav_mesh, 0.2, 0.3)

		if not success then
			self._last_pos_on_nav_mesh:store(Vector3.invalid_vector())
		end
	end

	local last_onground_pos_on_nav_mesh = self:last_position_onground_on_navmesh()

	if last_onground_pos_on_nav_mesh and (not self.player_on_nav_mesh or not input.is_onground) then
		local success = GwNavQueries.triangle_from_position(nav_world, last_onground_pos_on_nav_mesh, 0.2, 0.3)

		if not success then
			self._last_onground_pos_on_nav_mesh:store(Vector3.invalid_vector())
		end
	end

	local player = self._player

	if not player.remote then
		self:_check_bot_nav_transition(nav_world, input, pos)
	end

	if self.hang_ledge_position then
		self:_calculate_hang_ledge_spawn_position(self.hang_ledge_position:unbox())

		self.hang_ledge_position = nil
	end

	table.clear(input)
end

PlayerWhereaboutsExtension.last_position_on_navmesh = function (self)
	local pos = self._last_pos_on_nav_mesh:unbox()

	return Vector3.is_valid(pos) and pos or nil
end

PlayerWhereaboutsExtension.last_position_onground_on_navmesh = function (self)
	local pos = self._last_onground_pos_on_nav_mesh:unbox()

	return Vector3.is_valid(pos) and pos or nil
end

local EPSILON = 0.0001

PlayerWhereaboutsExtension._find_start_position = function (self, current_position, perform_distance_check)
	local last_pos = self._last_onground_pos_on_nav_mesh:unbox()

	if Vector3.is_valid(last_pos) then
		local offset = current_position - last_pos

		if EPSILON < Vector3.length_squared(offset) then
			local new_last_pos = GwNavQueries.move_on_navmesh(self._nav_world, last_pos, offset, 1, self._nav_traverse_logic)

			if not perform_distance_check or Vector3.distance_squared(current_position, new_last_pos) < 4 then
				return new_last_pos
			end
		else
			return last_pos
		end
	end
end

PlayerWhereaboutsExtension._check_bot_nav_transition = function (self, nav_world, input, current_position)
	if input.jumped then
		fassert(not self._falling and not self._jumping, "Tried to jump or fall while falling without aborting landing")

		self._jumping = true
		local perform_distance_check = input.player_state == nil or input.player_state ~= "lunging" and input.player_state ~= "leaping"
		local pos = self:_find_start_position(current_position, perform_distance_check)

		if pos then
			self._jump_position:store(pos)
			self._free_fall_position:store(current_position)
		end
	elseif input.fell then
		fassert(not self._jumping and not self._falling, "Tried to fall or jump while jumping without aborting landing")

		self._falling = true
		local perform_distance_check = input.player_state == nil or input.player_state ~= "lunging" and input.player_state ~= "leaping"
		local pos = self:_find_start_position(current_position, perform_distance_check)

		if pos then
			self._fall_position:store(pos)
			self._free_fall_position:store(current_position)
		end
	end

	if input.no_landing then
		fassert(self._jumping or self._falling, "Tried to not land without falling or jumping")

		self._jumping = false
		self._falling = false
		local invalid_vector = Vector3.invalid_vector()

		self._jump_position:store(invalid_vector)
		self._fall_position:store(invalid_vector)
		self._free_fall_position:store(invalid_vector)
	elseif input.landed then
		fassert(self._jumping or self._falling, "Tried to land without falling or jumping")

		if self._jumping then
			local jump_pos = self._jump_position:unbox()

			if Vector3.is_valid(jump_pos) then
				Managers.state.bot_nav_transition:create_transition(jump_pos, self._free_fall_position:unbox(), current_position, true)
			end

			local invalid_vector = Vector3.invalid_vector()

			self._jump_position:store(invalid_vector)
			self._free_fall_position:store(invalid_vector)

			self._jumping = false
		elseif self._falling then
			local fall_pos = self._fall_position:unbox()

			if Vector3.is_valid(fall_pos) then
				Managers.state.bot_nav_transition:create_transition(fall_pos, self._free_fall_position:unbox(), current_position, false)
			end

			local invalid_vector = Vector3.invalid_vector()

			self._fall_position:store(invalid_vector)
			self._free_fall_position:store(invalid_vector)

			self._falling = false
		end
	end
end

PlayerWhereaboutsExtension._get_closest_positions = function (self, pos, is_onground, point_list)
	local nav_world = self._nav_world
	self.player_on_nav_mesh = GwNavQueries.triangle_from_position(nav_world, pos, 0.2, 0.3)

	if self.player_on_nav_mesh then
		self._last_pos_on_nav_mesh:store(pos)

		if is_onground then
			self._last_onground_pos_on_nav_mesh:store(pos)
		end

		return
	end

	local p = GwNavQueries.inside_position_from_outside_position(nav_world, pos, 3, 3, 2.1, 0.5)

	if p then
		point_list[1] = Vector3Box(p)

		for i = 2, #point_list do
			point_list[i] = nil
		end

		return
	end

	local p = GwNavQueries.inside_position_from_outside_position(nav_world, pos, 5, 5, 10, 0.5)

	if p then
		point_list[1] = Vector3Box(p)

		for i = 2, #point_list do
			point_list[i] = nil
		end

		return
	end

	local list_size = #point_list

	for i = 1, list_size do
		point_list[i] = nil
	end

	LocomotionUtils.closest_mesh_positions_outward(nav_world, pos, 10, point_list)
end

PlayerWhereaboutsExtension.closest_positions_when_outside_navmesh = function (self)
	return self.closest_positions, self.player_on_nav_mesh
end

PlayerWhereaboutsExtension.set_new_hang_ledge_position = function (self, hang_ledge_position)
	self.hang_ledge_position = Vector3Box(hang_ledge_position)
end

PlayerWhereaboutsExtension._calculate_hang_ledge_spawn_position = function (self, hang_ledge_position)
	local nav_world = self._nav_world
	local p = GwNavQueries.inside_position_from_outside_position(nav_world, hang_ledge_position, 5, 5, 10, 0.25)

	if p then
		self.hang_ledge_spawn_position = Vector3Box(p)
	else
		print("Could not find spawn position for hang ledge.")

		self.hang_ledge_spawn_position = Vector3Box(hang_ledge_position)
	end
end

PlayerWhereaboutsExtension.get_hang_ledge_spawn_position = function (self)
	return self.hang_ledge_spawn_position:unbox()
end

PlayerWhereaboutsExtension._debug_draw = function (self, unit_position, point_list, t)
	local last_onground_pos_on_nav_mesh = self._last_onground_pos_on_nav_mesh:unbox()
	local cos_t = math.abs(math.cos(t))
	local cos_2t = math.abs(math.cos(2 * t))
	local sin_t = math.abs(math.sin(t))

	if Vector3.is_valid(last_onground_pos_on_nav_mesh) then
		local debug_color = Color(cos_t * 255, sin_t * 255, cos_t * 255)

		QuickDrawer:sphere(last_onground_pos_on_nav_mesh, 0.25, debug_color)
		QuickDrawer:line(unit_position, last_onground_pos_on_nav_mesh, debug_color)
		QuickDrawer:sphere(unit_position, cos_2t * 0.2 + 0.05, debug_color)
	end

	local last_pos_on_nav_mesh = self._last_pos_on_nav_mesh:unbox()

	if Vector3.is_valid(last_pos_on_nav_mesh) then
		local debug_color = Color(0, sin_t * 125, cos_t * 125)

		QuickDrawer:sphere(last_pos_on_nav_mesh, 0.1, debug_color)
		QuickDrawer:line(unit_position, last_pos_on_nav_mesh, debug_color)
		QuickDrawer:sphere(unit_position, cos_2t * 0.05 + 0.05, debug_color)
	end

	for i = 1, #point_list do
		local pos = point_list[i]:unbox()

		QuickDrawer:sphere(pos + Vector3(0, 0, 0.25), 0.77, Color(255, 144, 23, 67))
	end
end
