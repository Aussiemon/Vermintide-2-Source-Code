-- chunkname: @scripts/unit_extensions/weapons/area_damage/liquid/liquid_area_damage_extension.lua

require("scripts/unit_extensions/weapons/area_damage/liquid/hex_grid")
require("scripts/managers/debug/debug_manager")

LiquidAreaDamageExtension = class(LiquidAreaDamageExtension)

local function debug_print(...)
	if script_data.debug_liquid_system then
		print("[LiquidSystem]:", ...)
	end
end

LiquidAreaDamageExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local entity_manager = extension_init_context.entity_manager
	local ai_system = entity_manager:system("ai_system")
	local world = extension_init_context.world

	self._world = world
	self._unit = unit
	self._network_transmit = extension_init_context.network_transmit
	self._ai_system = ai_system
	self._nav_world = ai_system:nav_world()
	self._audio_system = entity_manager:system("audio_system")

	local template_name = extension_init_data.liquid_template
	local template = LiquidAreaDamageTemplates.templates[template_name]

	self._liquid_area_damage_template = template_name

	local unit_position = Unit.world_position(unit, 0)
	local above = template.above
	local below = template.below
	local position = self:_find_point(unit_position, above, below) or unit_position
	local cell_size = template.cell_size
	local max_liquid = extension_init_data.max_liquid or template.max_liquid or 50
	local xy_extents = math.min(max_liquid + 10, 50)

	self._grid = HexGrid:new(position, xy_extents, 10, cell_size, 1)

	local t = Managers.time:time("game")
	local delay = template.delay or 0

	self._next_pulse = t + delay
	self._time_to_start = t + delay
	self._time_to_remove = t + template.time_of_life + delay
	self._spread_function = LiquidAreaDamageTemplates[template.liquid_spread_function]

	local buff_system = entity_manager:system("buff_system")

	self._buff_system = buff_system
	self._flow = {}
	self._active_flow = {}
	self._inactive_flow = {}
	self._num_liquid = 0
	self._max_liquid = max_liquid
	self._starting_pressure = template.starting_pressure or 5
	self._end_pressure = template.end_pressure or 0.5
	self._spawned_unit_index = 1
	self._cell_radius = cell_size / 2
	self._do_direct_damage_ai = template.do_direct_damage_ai
	self._do_direct_damage_player = template.do_direct_damage_player
	self._hit_player_function = template.hit_player_function

	local difficulty_name = Managers.state.difficulty:get_difficulty()

	self._damage_table = extension_init_data.damage_table or template.difficulty_direct_damage[difficulty_name]
	self._damage_type = template.damage_type

	local use_nav_cost_map_volumes = template.use_nav_cost_map_volumes

	self._use_nav_cost_map_volumes = use_nav_cost_map_volumes
	self._apply_buff_to_ai = template.apply_buff_to_ai
	self._apply_buff_to_player = template.apply_buff_to_player
	self._buff_name = template.buff_template_name
	self._buff_type = template.buff_template_type
	self._damage_buff_name = template.damage_buff_template_name

	local fx_name_rim = template.fx_name_rim

	self._fx_name_rim = fx_name_rim
	self._fx_name_filled = template.fx_name_filled
	self._fx_name_start_delayed = template.fx_name_start_delayed
	self._override_fx_life_time = template.override_fx_life_time

	Unit.set_unit_visibility(unit, false)

	local sfx_name_start = template.sfx_name_start

	self._sfx_name_start = sfx_name_start
	self._sfx_name_start_delayed = template.sfx_name_start_delayed
	self._sfx_name_stop = template.sfx_name_stop

	local flat_flow_dir = Vector3.flat(extension_init_data.flow_dir)
	local starting_angle = math.atan2(flat_flow_dir.y, flat_flow_dir.x)

	self._flow_dir = Vector3Box(flat_flow_dir)
	self._starting_flow_angle = starting_angle
	self._linearized_flow = template.linearized_flow
	self._immune_breeds = template.immune_breeds
	self._colliding_units = {}
	self._buff_affected_units = {}
	self._affected_player_units = {}
	self._source_attacker_unit = extension_init_data.source_unit or unit
	self._done = false
	self._started = delay <= 0

	local source_attacker_unit = self._source_attacker_unit
	local player = Managers.player:owner(source_attacker_unit)

	if not player then
		local attacker_buff_extension = ScriptUnit.has_extension(source_attacker_unit, "buff_system")

		if attacker_buff_extension then
			self.buff_damage_multiplier = attacker_buff_extension:apply_buffs_to_value(1, "damage_dealt")
		end
	end

	if use_nav_cost_map_volumes then
		local nav_cost_map_cost_type = template.nav_cost_map_cost_type
		local num_volumes_guess = self._max_liquid

		self._nav_cost_map_cost_type = nav_cost_map_cost_type
		self._nav_cost_map_id = ai_system:create_nav_cost_map(nav_cost_map_cost_type, num_volumes_guess)
	end

	local init_function = template.init_function

	if init_function then
		LiquidAreaDamageTemplates[init_function](self, t)
	end

	local update_function = template.update_function

	if update_function then
		self._liquid_update_function = LiquidAreaDamageTemplates[update_function]
	end

	local buff_condition_function = template.buff_condition_function

	if buff_condition_function then
		self._buff_condition = LiquidAreaDamageTemplates[buff_condition_function]
	end

	if sfx_name_start then
		WwiseUtils.trigger_unit_event(world, sfx_name_start, unit, 0)
	end
end

LiquidAreaDamageExtension.ready = function (self)
	local unit = self._unit

	self._unit_id = Managers.state.unit_storage:go_id(unit)

	local position = Unit.local_position(unit, 0)
	local grid = self._grid
	local i, j, k = grid:find_index(position)

	debug_print("CREATING LIQUID AT: ", i, j, k)

	local real_index = grid:real_index(i, j, k)
	local i1, j1, k1 = grid:ijk(real_index)

	fassert(i1 == i and j1 == j and k1 == k, "FAIL, %i:%i %i:%i %i:%i", i, i1, j, j1, k, k1)

	local test_pos = grid:find_position(i, j, k)
	local test_dist_sq = Vector3.distance_squared(position, test_pos)

	fassert(test_dist_sq < 1, "FAIL test_pos %s and pos %s too far apart %q", tostring(test_pos), tostring(position), test_dist_sq)

	local starting_angle = self._starting_flow_angle

	self:_create_liquid(real_index, starting_angle)
	self:_set_active(real_index)

	local flow_dir = self._flow_dir

	self._damage_direction = flow_dir
end

LiquidAreaDamageExtension._set_active = function (self, real_index)
	local flow = self._flow
	local liquid = flow[real_index]
	local position = liquid.position:unbox()

	liquid.full = true
	liquid.amount = 1

	if liquid.fx_id then
		World.stop_spawning_particles(self._world, liquid.fx_id)
	end

	local fx_name_filled = self._fx_name_filled

	if not script_data.debug_liquid_system and fx_name_filled then
		local rotation = liquid.rotation:unbox()

		liquid.fx_id = World.create_particles(self._world, fx_name_filled, position, rotation)

		local override_life_time = self._override_fx_life_time

		if override_life_time then
			World.set_particles_life_time(self._world, liquid.fx_id, override_life_time)
		end
	else
		liquid.fx_id = nil
	end

	local network_transmit = self._network_transmit

	network_transmit:send_rpc_clients("rpc_update_liquid_damage_blob", self._unit_id, real_index, NetworkLookup.liquid_damage_blob_states.filled)

	self._active_flow[real_index] = liquid
	self._inactive_flow[real_index] = nil
	self._num_liquid = self._num_liquid + 1

	if self._use_nav_cost_map_volumes then
		local ai_system = self._ai_system
		local cost_map_id = self._nav_cost_map_id
		local nav_cost_map_volume_id = ai_system:add_nav_cost_map_sphere_volume(position, self._cell_radius, cost_map_id)

		liquid.nav_cost_map_volume_id = nav_cost_map_volume_id
	end

	for dir, index in pairs(liquid.neighbours) do
		local already_exists = flow[index]

		if not already_exists then
			self:_create_liquid(index, liquid.angle)
		end
	end
end

LiquidAreaDamageExtension.stop_fx = function (self)
	if script_data.debug_liquid_system then
		self._fx_stopped = true
	else
		for _, liquid in pairs(self._flow) do
			if liquid.fx_id then
				World.stop_spawning_particles(self._world, liquid.fx_id)
			end
		end
	end
end

LiquidAreaDamageExtension._create_liquid = function (self, real_index, angle)
	local grid = self._grid
	local i, j, k = grid:ijk(real_index)
	local position = grid:find_position(i, j, k)
	local nav_world = self._nav_world
	local dirs = grid:directions()
	local success, z, vertex_1, vertex_2, vertex_3 = GwNavQueries.triangle_from_position(nav_world, position, 2, 2)
	local from, rotation

	if success then
		local v1_to_v2 = Vector3.normalize(vertex_2 - vertex_1)
		local v1_to_v3 = Vector3.normalize(vertex_3 - vertex_1)
		local normal = Vector3.normalize(Vector3.cross(v1_to_v2, v1_to_v3))

		rotation = Quaternion.look(v1_to_v2, normal)
		from = Vector3(position.x, position.y, z)
	else
		rotation = Quaternion.identity()
		from = position
	end

	local neighbours = {}

	for index = 1, #dirs do
		local dir = dirs[index]
		local new_i, new_j, new_k = i + dir[1], j + dir[2], k
		local point = grid:find_position(new_i, new_j, new_k)
		local to = self:_find_point(point)

		if to and GwNavQueries.raycango(nav_world, from, to) then
			local neighbour_real_index = grid:real_index(grid:find_index(to))

			neighbours[index] = neighbour_real_index
		end
	end

	local fx_id
	local fx_name_rim = self._fx_name_rim

	if not script_data.debug_liquid_system and fx_name_rim then
		fx_id = World.create_particles(self._world, fx_name_rim, from, rotation)

		local override_life_time = self._override_fx_life_time

		if override_life_time then
			World.set_particles_life_time(self._world, fx_id, override_life_time)
		end
	end

	local is_filled = false
	local network_transmit = self._network_transmit

	network_transmit:send_rpc_clients("rpc_add_liquid_damage_blob", self._unit_id, real_index, from, is_filled)

	local liquid = {
		amount = 0,
		full = false,
		neighbours = neighbours,
		position = Vector3Box(from),
		rotation = QuaternionBox(rotation),
		fx_id = fx_id,
		angle = angle or 0,
	}

	self._flow[real_index] = liquid
	self._inactive_flow[real_index] = liquid
end

LiquidAreaDamageExtension._find_point = function (self, position, above, below)
	local nav_world = self._nav_world
	local success, z = GwNavQueries.triangle_from_position(nav_world, position, above or 2, below or 2)

	if success then
		return Vector3(position.x, position.y, z)
	else
		local navmesh_pos = GwNavQueries.inside_position_from_outside_position(nav_world, position, above or 2, below or 2, 2, 0.5)

		if navmesh_pos then
			return navmesh_pos
		end

		return nil
	end
end

LiquidAreaDamageExtension.destroy = function (self)
	local liquid_unit = self._unit
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop then
		local world = self._world

		WwiseUtils.trigger_unit_event(world, sfx_name_stop, liquid_unit, 0)
	end

	for unit, server_buff_id in pairs(self._buff_affected_units) do
		if Unit.alive(unit) then
			local buff_system = self._buff_system

			buff_system:remove_server_controlled_buff(unit, server_buff_id)
		end

		self._buff_affected_units[unit] = nil
	end

	local sides = Managers.state.side:sides()

	for k = 1, #sides do
		local side = sides[k]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_player_units = #player_and_bot_units

		for i = 1, num_player_units do
			local player_unit = player_and_bot_units[i]

			if Unit.alive(player_unit) then
				local is_colliding = self._colliding_units[player_unit]
				local status_extension = is_colliding and ScriptUnit.extension(player_unit, "status_system")

				if is_colliding and status_extension.in_liquid_unit == liquid_unit then
					StatusUtils.set_in_liquid_network(player_unit, false)
				end
			end

			self._colliding_units[player_unit] = nil
		end
	end

	if self._use_nav_cost_map_volumes then
		local ai_system = self._ai_system
		local cost_map_id = self._nav_cost_map_id

		for real_index, liquid in pairs(self._flow) do
			local volume_id = liquid.nav_cost_map_volume_id

			if volume_id then
				ai_system:remove_nav_cost_map_volume(volume_id, cost_map_id)
			end
		end

		ai_system:destroy_nav_cost_map(cost_map_id)
	end

	table.clear(self._affected_player_units)
	self:stop_fx()
end

local remove_list = {}
local add_list = {}
local fill_list = {
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
	{
		angle = 0,
		index = 0,
		weight = 0,
	},
}

LiquidAreaDamageExtension.update = function (self, unit, input, dt, context, t)
	local liquid_left = 1 - self._num_liquid / self._max_liquid
	local pressure_coeff = liquid_left
	local pressure = math.lerp(self._end_pressure, self._starting_pressure, pressure_coeff)
	local active_flow = self._active_flow
	local flow = self._flow

	table.clear(remove_list)
	table.clear(add_list)

	if not self._started then
		if t < self._time_to_start then
			return
		end

		self._started = true

		if self._sfx_name_start_delayed then
			WwiseUtils.trigger_unit_event(self._world, self._sfx_name_start_delayed, self._unit, 0)
		end

		if self._fx_name_start_delayed then
			local position = Unit.world_position(unit, 0)
			local rotation = Unit.world_rotation(unit, 0)

			World.create_particles(self._world, self._fx_name_start_delayed, position, rotation)
		end
	end

	if t > self._time_to_remove then
		Managers.state.unit_spawner:mark_for_deletion(self._unit)

		return
	end

	if not self._done then
		local spread_function = self._spread_function
		local directions = self._grid:directions()
		local pi = math.pi
		local two_pi = 2 * pi

		for real_index, liquid in pairs(self._active_flow) do
			local all_done = true
			local fill_list_index = 0
			local total_weight = 0
			local flow_angle = liquid.angle

			for dir, neighbour_index in pairs(liquid.neighbours) do
				local neighbour = flow[neighbour_index]
				local neighbour_angle = directions[dir].angle
				local forward_angle, backward_angle

				if flow_angle < neighbour_angle then
					forward_angle = neighbour_angle - flow_angle
					backward_angle = two_pi - neighbour_angle + flow_angle
				else
					forward_angle = two_pi - flow_angle + neighbour_angle
					backward_angle = flow_angle - neighbour_angle
				end

				local angle

				if forward_angle < backward_angle then
					angle = forward_angle
				else
					angle = -backward_angle
				end

				local weight = spread_function(math.abs(angle))

				total_weight = total_weight + weight

				if not active_flow[neighbour_index] and not neighbour.full and weight > 0 then
					fill_list_index = fill_list_index + 1

					local fill_list_entry = fill_list[fill_list_index]

					fill_list_entry.index = neighbour_index
					fill_list_entry.weight = weight
					fill_list_entry.angle = neighbour_angle
					fill_list_entry.relative_angle = angle
				end
			end

			local starting_angle = self._starting_flow_angle
			local use_linearized_flow = self._linearized_flow

			for i = 1, fill_list_index do
				local entry = fill_list[i]
				local neighbour_index = entry.index
				local weight = entry.weight
				local neighbour = flow[neighbour_index]
				local flow_fraction = weight / total_weight
				local new_amount = dt * pressure * flow_fraction
				local old_amount = neighbour.amount
				local total_amount = new_amount + old_amount

				fassert(new_amount > 0)
				fassert(total_amount > 0)
				fassert(old_amount >= 0)

				if use_linearized_flow then
					local relative_angle = entry.relative_angle
					local new_angle = starting_angle - relative_angle

					neighbour.angle = new_angle
					neighbour.amount = total_amount
				else
					neighbour.amount = total_amount
				end

				if neighbour.amount >= 1 then
					add_list[neighbour_index] = true
				end

				all_done = false
			end

			if all_done then
				remove_list[real_index] = true
			end
		end

		for real_index, _ in pairs(remove_list) do
			active_flow[real_index] = nil
		end

		for real_index, _ in pairs(add_list) do
			self:_set_active(real_index)

			if self._num_liquid == self._max_liquid then
				self._done = true

				break
			end
		end
	end

	self:_update_collision_detection(dt, t)

	while t > self._next_pulse do
		self._next_pulse = self._next_pulse + 0.75

		self:_pulse_damage()
	end

	local liquid_update_function = self._liquid_update_function

	if liquid_update_function then
		local result = self._liquid_update_function(self, t, dt)

		if not result then
			self._liquid_update_function = nil
		end
	end
end

LiquidAreaDamageExtension._add_buff_helper_function = function (self, unit, liquid_unit, buff_name, buff_condition, buff_system)
	local is_condition_fulfilled

	if buff_condition then
		is_condition_fulfilled = buff_condition(unit)
	else
		is_condition_fulfilled = true
	end

	if self._buff_affected_units[unit] == nil then
		if is_condition_fulfilled then
			self._buff_affected_units[unit] = buff_system:add_buff(unit, buff_name, liquid_unit, true)
		end
	elseif not is_condition_fulfilled then
		local server_buff_id = self._buff_affected_units[unit]

		buff_system:remove_server_controlled_buff(unit, server_buff_id)

		self._buff_affected_units[unit] = nil
	end
end

local UNITS_PER_FRAME = 10

LiquidAreaDamageExtension._update_collision_detection = function (self, dt, t)
	local units_per_frame = UNITS_PER_FRAME
	local grid = self._grid
	local liquid_unit = self._unit
	local apply_buff_to_player = self._apply_buff_to_player
	local do_direct_damage_player = self._do_direct_damage_player

	self._check_player_units = (apply_buff_to_player or do_direct_damage_player) and self._check_player_units

	local buff_system = self._buff_system
	local buff_name = self._buff_name
	local buff_template_type = self._buff_type
	local buff_condition = self._buff_condition
	local immune_breeds = self._immune_breeds

	if self._check_player_units then
		local sides = Managers.state.side:sides()

		for k = 1, #sides do
			local side = sides[k]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_player_units = #player_and_bot_units

			for i = 1, num_player_units do
				local unit = player_and_bot_units[i]
				local player_breed = Unit.get_data(unit, "breed")

				if player_breed and not immune_breeds[player_breed.name] then
					local status_extension = ScriptUnit.extension(unit, "status_system")

					if self:_is_unit_colliding(grid, unit) then
						self._colliding_units[unit] = 4

						if status_extension.in_liquid_unit ~= liquid_unit then
							StatusUtils.set_in_liquid_network(unit, true, liquid_unit)
						end

						if not self._affected_player_units[unit] and self._hit_player_function then
							self._affected_player_units[unit] = true

							self._hit_player_function(unit, player_and_bot_units, self._source_attacker_unit)
						end

						local buff_extension = ScriptUnit.extension(unit, "buff_system")

						if buff_name and apply_buff_to_player and not buff_extension:has_buff_type(buff_template_type) then
							self:_add_buff_helper_function(unit, liquid_unit, buff_name, buff_condition, buff_system)
						end
					else
						self._colliding_units[unit] = nil

						if status_extension.in_liquid_unit == liquid_unit then
							StatusUtils.set_in_liquid_network(unit, false)
						end

						if buff_name and self._buff_affected_units[unit] then
							local server_buff_id = self._buff_affected_units[unit]

							buff_system:remove_server_controlled_buff(unit, server_buff_id)

							self._buff_affected_units[unit] = nil
						end
					end
				end
			end

			self._check_player_units = false
			units_per_frame = units_per_frame - num_player_units
		end
	end

	local units, num_units = Managers.state.conflict:all_spawned_units()
	local index = self._spawned_unit_index
	local end_index = math.min(index + units_per_frame, num_units)
	local apply_buff_to_ai = self._apply_buff_to_ai
	local BLACKBOARDS = BLACKBOARDS

	while index <= end_index do
		local unit = units[index]
		local blackboard = BLACKBOARDS[unit]
		local breed = blackboard.breed

		if breed and not immune_breeds[breed.name] then
			if self:_is_unit_colliding(grid, unit) then
				self._colliding_units[unit] = breed.armor_category or 1

				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

				if buff_name and apply_buff_to_ai and buff_extension and not buff_extension:has_buff_type(buff_template_type) then
					self:_add_buff_helper_function(unit, liquid_unit, buff_name, buff_condition, buff_system)
				end
			else
				self._colliding_units[unit] = nil

				if buff_name and self._buff_affected_units[unit] then
					local server_buff_id = self._buff_affected_units[unit]

					buff_system:remove_server_controlled_buff(unit, server_buff_id)

					self._buff_affected_units[unit] = nil
				end
			end
		end

		index = index + 1
	end

	if num_units < index then
		self._spawned_unit_index = 1
		self._check_player_units = true
	else
		self._spawned_unit_index = index
	end
end

LiquidAreaDamageExtension._is_unit_colliding = function (self, grid, unit)
	local unit_pos = POSITION_LOOKUP[unit]

	if unit_pos then
		for i = 0, 1 do
			local i, j, k = grid:find_index(unit_pos + i * Vector3.up())

			if grid:is_out_of_bounds(i, j, k) then
				break
			end

			local real_index = grid:real_index(i, j, k)
			local liquid = self._flow[real_index]

			if liquid then
				if liquid.full then
					return true
				else
					break
				end
			end
		end
	end

	return false
end

local buff_params = {}

LiquidAreaDamageExtension._pulse_damage = function (self)
	local remove_i = 0
	local damage_dir = self._damage_direction:unbox()
	local damage_type = self._damage_type
	local source_attacker_unit = self._source_attacker_unit
	local is_player_attacker = source_attacker_unit and DamageUtils.is_player_unit(source_attacker_unit)
	local do_direct_damage_player = self._do_direct_damage_player
	local do_direct_damage_ai = self._do_direct_damage_ai
	local damage_buff_template_name = self._damage_buff_name
	local liquid_unit = self._unit
	local damage_table = self._damage_table

	for unit, armor_category in pairs(self._colliding_units) do
		local is_player = DamageUtils.is_player_unit(unit)

		if HEALTH_ALIVE[unit] then
			if is_player and do_direct_damage_player or not is_player and do_direct_damage_ai then
				local damage = damage_table[armor_category] or damage_table[1]

				DamageUtils.add_damage_network(unit, unit, damage, "torso", damage_type, nil, damage_dir, self._liquid_area_damage_template, nil, source_attacker_unit, nil, nil, nil, nil, nil, nil, nil, nil, 1)

				if is_player_attacker then
					local breed = AiUtils.unit_breed(unit)

					if breed and not breed.is_hero then
						AiUtils.alert_unit_of_enemy(unit, source_attacker_unit)
					end
				end

				if damage_buff_template_name then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					buff_extension:add_buff(damage_buff_template_name, buff_params)
				end
			end
		else
			remove_i = remove_i + 1
			remove_list[remove_i] = unit

			local status_extension = is_player and ScriptUnit.extension(unit, "status_system")

			if is_player and status_extension.in_liquid_unit == liquid_unit then
				StatusUtils.set_in_liquid_network(unit, false)
			end
		end
	end

	for i = 1, remove_i do
		local unit = remove_list[i]

		self._colliding_units[unit] = nil
	end
end

LiquidAreaDamageExtension.is_position_inside = function (self, position, nav_cost_map_table)
	local grid = self._grid
	local i, j, k = grid:find_index(position)

	if grid:is_out_of_bounds(i, j, k) then
		return false
	end

	local nav_cost_map_cost_type = self._nav_cost_map_cost_type

	if nav_cost_map_cost_type == nil or nav_cost_map_table and nav_cost_map_table[nav_cost_map_cost_type] == 1 then
		return false
	end

	local real_index = grid:real_index(i, j, k)
	local liquid = self._flow[real_index]

	if liquid and liquid.full then
		return true
	else
		return false
	end
end

LiquidAreaDamageExtension.get_rim_nodes = function (self)
	return self._inactive_flow, false
end

LiquidAreaDamageExtension.hot_join_sync = function (self, peer_id)
	local flow = self._flow
	local liquid_unit_id = self._unit_id
	local network_transmit = self._network_transmit

	for real_index, liquid in pairs(flow) do
		local position = liquid.position:unbox()
		local is_filled = liquid.full

		network_transmit:send_rpc("rpc_add_liquid_damage_blob", peer_id, liquid_unit_id, real_index, position, is_filled)
	end
end

LiquidAreaDamageExtension.get_source_attacker_unit = function (self)
	return self._source_attacker_unit
end
