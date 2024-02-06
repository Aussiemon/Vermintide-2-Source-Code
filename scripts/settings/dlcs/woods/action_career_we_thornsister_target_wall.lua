-- chunkname: @scripts/settings/dlcs/woods/action_career_we_thornsister_target_wall.lua

ActionCareerWEThornsisterTargetWall = class(ActionCareerWEThornsisterTargetWall, ActionBase)

local MAX_SIM_STEPS = 10
local MAX_SIM_TIME = 1.5
local COLLISION_FILTER = "filter_geiser_check"
local target_decal_unit_name = "units/decals/decal_thorn_sister_wall_target"
local WALL_OVERLAP_THICKNESS = 0.15
local WALL_OVERLAP_WIDTH = 0.15
local WALL_OVERLAP_HEIGHT = 0.3
local WALL_MAX_HEIGHT_OFFSET = 0.5
local WALL_OVERLAP_HEIGHT_OFFSET = 0.9 + WALL_OVERLAP_HEIGHT
local WALL_SHAPES = table.enum("linear", "radial")

ActionCareerWEThornsisterTargetWall.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEThornsisterTargetWall.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self._decal_unit = nil
	self._unit_spawner = Managers.state.unit_spawner
	self._target_pos = Vector3Box()
	self._target_rot = QuaternionBox()
	self._segment_positions = {
		{
			num_segments = 0,
		},
		{
			num_segments = 0,
		},
	}
	self._valid_segment_positions_idx = 0
	self._current_segment_positions_idx = 1
	self._num_segments = 0
	self._max_segments = 0
	self._wall_left_offset = 0
	self._wall_right_offset = 0
	self._wall_shape = WALL_SHAPES.linear
end

ActionCareerWEThornsisterTargetWall.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerWEThornsisterTargetWall.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._valid_segment_positions_idx = 0
	self._current_segment_positions_idx = 1

	self._weapon_extension:set_mode(false)

	self._target_sim_gravity = new_action.target_sim_gravity
	self._target_sim_speed = new_action.target_sim_speed
	self._target_width = new_action.target_width
	self._target_thickness = new_action.target_thickness
	self._vertical_rotation = new_action.vertical_rotation
	self._wall_shape = WALL_SHAPES.linear

	if self.talent_extension:has_talent("kerillian_thorn_sister_debuff_wall") then
		self._target_thickness = 5
		self._target_width = 5
		self._wall_shape = WALL_SHAPES.radial
		self._num_segmetns_to_check = 3
		self._radial_center_offset = 0.5
		self._bot_target_unit = true
	elseif self.talent_extension:has_talent("kerillian_thorn_sister_tanky_wall") then
		self._target_width = 8

		local half_thickness = self._target_thickness / 2

		self._num_segmetns_to_check = math.floor(self._target_width / half_thickness)
		self._bot_target_unit = false
	else
		local half_thickness = self._target_thickness / 2

		self._num_segmetns_to_check = math.floor(self._target_width / half_thickness)
		self._bot_target_unit = false
	end

	local max_segments = self._max_segments
	local segment_count = self._num_segmetns_to_check

	if max_segments < segment_count then
		local segment_positions = self._segment_positions

		for i = max_segments, segment_count do
			for idx = 1, 2 do
				segment_positions[idx][i + 1] = Vector3Box()
			end
		end

		self._max_segments = segment_count
	end

	self:_update_targeting()
end

ActionCareerWEThornsisterTargetWall.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	self:_update_targeting()
end

ActionCareerWEThornsisterTargetWall._update_targeting = function (self)
	local start_pos, start_rot = self._first_person_extension:get_projectile_start_position_rotation()
	local wall_direction_func = self._vertical_rotation and Quaternion.right or Quaternion.forward
	local player_direction_flat = Vector3.flat(wall_direction_func(start_rot))
	local player_rotation_flat = Quaternion.look(player_direction_flat, Vector3.up())
	local velocity = Quaternion.forward(start_rot) * self._target_sim_speed
	local gravity = Vector3(0, 0, self._target_sim_gravity)
	local success, target_pos

	if self.is_bot then
		success = true

		local blackboard = BLACKBOARDS[self.owner_unit]
		local target_unit = blackboard.target_unit

		if self._bot_target_unit and ALIVE[target_unit] then
			target_pos = POSITION_LOOKUP[target_unit]
		else
			target_pos = blackboard.activate_ability_data.aim_position:unbox()
		end
	else
		success, target_pos = WeaponHelper:ballistic_raycast(self.physics_world, MAX_SIM_STEPS, MAX_SIM_TIME, start_pos, velocity, gravity, COLLISION_FILTER)
	end

	if success then
		local valid, right_offset, left_offset

		if self._wall_shape == WALL_SHAPES.radial then
			valid, right_offset, left_offset = self:_check_wall_radial(target_pos, player_rotation_flat, self._target_width, self._target_thickness)
		else
			valid, right_offset, left_offset = self:_check_wall_linear(target_pos, player_rotation_flat, self._target_width, self._target_thickness)
		end

		if valid then
			self._target_pos:store(target_pos)
			self._target_rot:store(player_rotation_flat)

			self._valid_segment_positions_idx = self._current_segment_positions_idx
			self._current_segment_positions_idx = self._current_segment_positions_idx % 2 + 1
			self._wall_right_offset = right_offset
			self._wall_left_offset = left_offset

			self._weapon_extension:set_mode(true)
		end
	end

	if not self._decal_unit and self._valid_segment_positions_idx > 0 and not self.is_bot then
		self._decal_unit = self._unit_spawner:spawn_local_unit(target_decal_unit_name)
	end

	if self._decal_unit then
		local half_thickness = self._target_thickness * 0.5
		local wall_start_offset = self._wall_left_offset * 0.5
		local wall_end_offset = self._wall_right_offset * 0.5
		local wall_target_offset = Quaternion.right(player_rotation_flat) * ((wall_end_offset - wall_start_offset) * 0.5)
		local target_pos = self._target_pos:unbox() + wall_target_offset
		local target_rot = self._target_rot:unbox()

		Unit.set_local_position(self._decal_unit, 0, target_pos)
		Unit.set_local_rotation(self._decal_unit, 0, target_rot)

		local wall_width_scale

		if self._wall_shape == WALL_SHAPES.radial then
			wall_width_scale = self._target_width * 0.5
		else
			wall_width_scale = self._target_width * 0.5 + half_thickness * (wall_start_offset + wall_end_offset + 1)
		end

		Unit.set_local_scale(self._decal_unit, 0, Vector3(wall_width_scale, half_thickness, 3))
	end
end

ActionCareerWEThornsisterTargetWall.finish = function (self, reason)
	if self._decal_unit then
		self._unit_spawner:mark_for_deletion(self._decal_unit)

		self._decal_unit = nil
	end

	if reason == "new_interupting_action" then
		if self._valid_segment_positions_idx > 0 then
			self._weapon_extension:set_mode(true)

			local targeting_data = {
				position = self._target_pos,
				rotation = self._target_rot,
				segments = self._segment_positions[self._valid_segment_positions_idx],
				num_segments = self._segment_positions[self._valid_segment_positions_idx].num_segments,
			}

			return targeting_data
		end
	else
		self._inventory_extension:wield_previous_non_level_slot()
	end

	return nil
end

ActionCareerWEThornsisterTargetWall._check_wall_linear = function (self, center, wall_rotation, width, thickness)
	local game_session = Network.game_session()

	if game_session then
		local half_width = width / 2
		local half_thickness = thickness / 2
		local segment_count = self._num_segmetns_to_check
		local middle_segment = math.floor(segment_count / 2)
		local segment_positions = self._segment_positions[self._current_segment_positions_idx]
		local forward = Quaternion.forward(wall_rotation)
		local right = Quaternion.right(wall_rotation)
		local segment_increment = right * half_thickness
		local wall_start = center - right * (half_width - half_thickness) - segment_increment * 0.5
		local current_segment_idx = 0
		local previous_pos
		local wall_right_offset = 0

		for i = middle_segment, segment_count - 1 do
			local position = wall_start + segment_increment * i

			previous_pos = self:_check_segment(previous_pos, position, forward)

			if previous_pos then
				current_segment_idx = current_segment_idx + 1

				segment_positions[current_segment_idx]:store(previous_pos)
			else
				wall_right_offset = i - segment_count

				break
			end
		end

		previous_pos = nil

		local wall_left_offset = 0

		for i = middle_segment - 1, 0, -1 do
			local position = wall_start + segment_increment * i

			previous_pos = self:_check_segment(previous_pos, position, forward)

			if previous_pos then
				current_segment_idx = current_segment_idx + 1

				segment_positions[current_segment_idx]:store(previous_pos)
			else
				wall_left_offset = -i - 1

				break
			end
		end

		segment_positions.num_segments = current_segment_idx

		return current_segment_idx > 0, wall_right_offset, wall_left_offset
	end

	return nil
end

ActionCareerWEThornsisterTargetWall._check_wall_radial = function (self, center, wall_rotation, width, thickness)
	local game_session = Network.game_session()

	if game_session then
		local half_width = width / 2
		local half_thickness = thickness / 2
		local segment_count = self._num_segmetns_to_check
		local middle_segment = math.floor(segment_count / 2)
		local segment_positions = self._segment_positions[self._current_segment_positions_idx]
		local forward = Quaternion.forward(wall_rotation)
		local segment_increment = 2 * math.pi / segment_count
		local forward_offset = forward * self._radial_center_offset
		local current_segment_idx = 0

		for i = 1, segment_count do
			local position = center + Quaternion.rotate(Quaternion(Vector3.up(), segment_increment * i), forward_offset)

			position = self:_check_segment(center, position, forward)

			if position then
				current_segment_idx = current_segment_idx + 1

				segment_positions[current_segment_idx]:store(position)
			end
		end

		segment_positions.num_segments = current_segment_idx

		return current_segment_idx > 0, 0, 0
	end

	return nil
end

ActionCareerWEThornsisterTargetWall._check_segment = function (self, prev_position, position, forward)
	if position then
		local physics_world = self.physics_world
		local from = position

		if prev_position then
			from.z = prev_position.z + WALL_MAX_HEIGHT_OFFSET
		else
			from.z = position.z + WALL_MAX_HEIGHT_OFFSET
		end

		local normalized_direction = Vector3.down()
		local distance = 2 * WALL_MAX_HEIGHT_OFFSET
		local result, hit_position, length = PhysicsWorld.immediate_raycast(physics_world, from, normalized_direction, distance, "closest", "types", "statics", "collision_filter", "filter_player_mover")

		if result then
			if prev_position and math.abs(hit_position.z - prev_position.z) > WALL_MAX_HEIGHT_OFFSET then
				return false
			end

			local actor_count = 0
			local overlap_pos = hit_position + Vector3.up() * WALL_OVERLAP_HEIGHT_OFFSET
			local overlap_size = Vector3(WALL_OVERLAP_WIDTH, WALL_OVERLAP_THICKNESS, WALL_OVERLAP_HEIGHT)
			local overlap_rot = Quaternion.look(forward, Vector3.up())

			if prev_position then
				local sweep_from = prev_position + Vector3.up() * WALL_OVERLAP_HEIGHT_OFFSET
				local sweep_results = PhysicsWorld.linear_obb_sweep(physics_world, sweep_from, overlap_pos, overlap_size, overlap_rot, 5, "collision_filter", "filter_player_mover", "types", "statics", "report_initial_overlap")

				actor_count = sweep_results and #sweep_results or 0
			else
				local hit_actors

				hit_actors, actor_count = PhysicsWorld.immediate_overlap(physics_world, "position", overlap_pos, "rotation", overlap_rot, "size", overlap_size, "shape", "oobb", "types", "statics", "collision_filter", "filter_player_mover")
			end

			if actor_count > 0 then
				return false
			end

			return hit_position
		end
	end

	return false
end
