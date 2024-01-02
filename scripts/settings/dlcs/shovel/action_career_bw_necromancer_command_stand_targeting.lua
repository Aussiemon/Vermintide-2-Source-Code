require("scripts/settings/profiles/career_constants")

local target_decal_unit_name = "fx/bw_necromancer_ability_indicator"
local indicator_radius = 0.35
local raycast_speed = 11
local raycast_gravity = -10
local right_spacing = 0.55
local forward_spacing = 0.9
ActionCareerBwNecromancerCommandStandTargetingUtility = {
	generate_positions = function (target_center, fp_rotation, num_positions, optional_cached_positions)
		local navified_spawn_positions = optional_cached_positions or {}
		local num_per_rank = math.min(num_positions, CareerConstants.bw_necromancer.pets_per_rank)

		if num_per_rank == 0 then
			table.clear(navified_spawn_positions)

			return navified_spawn_positions
		end

		local above = 2
		local below = 2
		local fp_rotation_flat = Quaternion.axis_angle(Vector3.up(), Quaternion.yaw(fp_rotation))
		local forward = Quaternion.forward(fp_rotation_flat)
		local right = Quaternion.right(fp_rotation_flat)
		local valid_position = nil
		local ranks = math.ceil(num_positions / num_per_rank)

		for rank_i = 1, ranks do
			local num_this_rank = math.min(num_positions - (rank_i - 1) * num_per_rank, num_per_rank)
			local wanted_width = (indicator_radius + right_spacing) * num_this_rank
			local left_wanted = -right * wanted_width
			local right_wanted = right * wanted_width
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local _, left_bound = GwNavQueries.raycast(nav_world, target_center, target_center + left_wanted)
			local _, right_bound = GwNavQueries.raycast(nav_world, target_center, target_center + right_wanted)
			local left_delta = left_bound - target_center
			local right_delta = right_bound - target_center
			local left_actual_wanted = left_wanted * 0.5
			local right_actual_wanted = right_wanted * 0.5
			local offset_left = Vector3.length_squared(right_delta) < Vector3.length_squared(right_actual_wanted) and right_delta - right_actual_wanted or Vector3.zero()
			local offset_right = Vector3.length_squared(left_delta) < Vector3.length_squared(left_actual_wanted) and left_delta - left_actual_wanted or Vector3.zero()
			right_bound = Geometry.closest_point_on_line(target_center + right_actual_wanted + offset_right, left_bound, right_bound)
			left_bound = Geometry.closest_point_on_line(target_center + left_actual_wanted + offset_left, left_bound, right_bound)
			local offset = Vector3.length(right_bound - left_bound) / num_this_rank

			for i = 1, num_this_rank do
				local position = left_bound + right * offset * (i - 0.5) - forward * forward_spacing * (rank_i - 1)
				local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, above, below)
				local idx = (rank_i - 1) * num_per_rank + i

				if not nav_position then
					local horizontal_tolerance = 3
					local distance_from_obstacle = 0.5
					nav_position = GwNavQueries.inside_position_from_outside_position(nav_world, position, above, below, horizontal_tolerance, distance_from_obstacle)
				end

				if nav_position then
					navified_spawn_positions[idx] = Vector3Box(nav_position)
					valid_position = valid_position or nav_position
				else
					navified_spawn_positions[idx] = false
				end
			end
		end

		if not valid_position then
			table.clear(navified_spawn_positions)

			return navified_spawn_positions
		end

		for i = 1, num_positions do
			if not navified_spawn_positions[i] then
				navified_spawn_positions[i] = Vector3Box(valid_position)
			else
				valid_position = navified_spawn_positions[i]:unbox()
			end
		end

		for i = num_positions + 1, #navified_spawn_positions do
			navified_spawn_positions[i] = nil
		end

		return navified_spawn_positions
	end
}
ActionCareerBwNecromancerCommandStandTargeting = class(ActionCareerBwNecromancerCommandStandTargeting, ActionBase)

ActionCareerBwNecromancerCommandStandTargeting.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBwNecromancerCommandStandTargeting.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._ai_navigation_system = Managers.state.entity:system("ai_navigation_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self._commander_extension = ScriptUnit.extension(owner_unit, "ai_commander_system")
	self._world = world
	self._owner_unit = owner_unit
	self._last_valid_spawn_position = Vector3Box()
	self._fp_rotation = QuaternionBox()
	self._decal_diameter_id = World.find_particles_variable(self._world, target_decal_unit_name, "diameter")

	self._nav_callback = function ()
		local t = Managers.time:time("game")

		self:_update_targeting(t)
	end
end

ActionCareerBwNecromancerCommandStandTargeting.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBwNecromancerCommandStandTargeting.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self._weapon_extension:set_mode(true)

	self._controlled_unit_template = new_action.controlled_unit_template
	self._breed_to_spawn = new_action.breed_to_spawn
	self._spawn_decal_ids = {}
	local owner_pos = POSITION_LOOKUP[self._owner_unit]

	self._last_valid_spawn_position:store(owner_pos)
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBwNecromancerCommandStandTargeting.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	self._ai_navigation_system:add_safe_navigation_callback(self._nav_callback)
end

ActionCareerBwNecromancerCommandStandTargeting._update_targeting = function (self, t)
	local spawn_positions = self:_update_spawn_positions()
	local num_positions = #spawn_positions
	local world = self._world
	local decal_ids = self._spawn_decal_ids

	for i = 1, num_positions do
		local position = spawn_positions[i]
		local decal_id = decal_ids[i]
		position = position:unbox()

		if not decal_id then
			decal_id = World.create_particles(world, target_decal_unit_name, position)
			decal_ids[i] = decal_id

			World.set_particles_variable(world, decal_id, self._decal_diameter_id, Vector3(indicator_radius * 2, indicator_radius * 2, 1))
		end

		World.move_particles(world, decal_id, position)
	end

	for i = num_positions + 1, #decal_ids do
		local decal_id = decal_ids[i]

		if decal_id then
			World.destroy_particles(world, decal_id)
		end

		decal_ids[i] = nil
	end
end

ActionCareerBwNecromancerCommandStandTargeting._update_spawn_positions = function (self)
	local commander_extension = self._commander_extension
	local pet_array = table.keys(commander_extension:get_controlled_units())

	table.array_remove_if(pet_array, function (value)
		local breed = Unit.get_data(value, "breed")

		return breed.name == "pet_skeleton_armored" and commander_extension:command_state(value) ~= CommandStates.Following
	end)

	local num_pets = #pet_array
	local center = nil
	local good_target, target_pos = self:_get_projectile_position(raycast_speed)

	if good_target then
		center = target_pos

		self._last_valid_spawn_position:store(target_pos)
	else
		center = self._last_valid_spawn_position:unbox()
	end

	local fp_rotation = self._first_person_extension:current_rotation()
	fp_rotation = Quaternion.axis_angle(Vector3.up(), Quaternion.yaw(fp_rotation))

	self._fp_rotation:store(fp_rotation)

	self._spawn_positions = ActionCareerBwNecromancerCommandStandTargetingUtility.generate_positions(center, fp_rotation, num_pets, self._spawn_positions)

	return self._spawn_positions
end

ActionCareerBwNecromancerCommandStandTargeting._get_projectile_position = function (self)
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_adept_teleport"
	local player_position, raycast_direction = self:_get_first_person_position_direction()
	local velocity = raycast_direction * raycast_speed
	local gravity = Vector3(0, 0, raycast_gravity)
	local good_target_position, target_position = WeaponHelper:ground_target(physics_world, self._owner_unit, player_position, velocity, gravity, collision_filter)

	if good_target_position then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local above = 1
		local below = 1
		local nav_position = LocomotionUtils.pos_on_mesh(nav_world, target_position, above, below)

		if not nav_position then
			local horizontal_tolerance = 3
			local distance_from_obstacle = 0.5
			nav_position = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, above, below, horizontal_tolerance, distance_from_obstacle)
		end

		good_target_position = not not nav_position
		target_position = nav_position
	end

	return good_target_position, target_position
end

ActionCareerBwNecromancerCommandStandTargeting._get_first_person_position_direction = function (self)
	local first_person_extension = self._first_person_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local min_pitch = math.rad(45)
	local max_pitch = math.rad(12.5)
	local yaw = Quaternion.yaw(player_rotation)
	local pitch = math.clamp(Quaternion.pitch(player_rotation), -min_pitch, max_pitch)
	local yaw_rotation = Quaternion(Vector3.up(), yaw)
	local pitch_rotation = Quaternion(Vector3.right(), pitch)
	local raycast_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local raycast_direction = Quaternion.forward(raycast_rotation)

	return player_position, raycast_direction
end

ActionCareerBwNecromancerCommandStandTargeting.finish = function (self, reason)
	local world = self._world
	local decal_ids = self._spawn_decal_ids
	local spawn_positions = self._spawn_positions

	if not spawn_positions then
		return nil
	end

	for i = 1, #decal_ids do
		local decal_id = decal_ids[i]

		if decal_id then
			World.destroy_particles(world, decal_ids[i])

			decal_ids[i] = nil
		end
	end

	if reason == "new_interupting_action" then
		local targeting_data = {
			target_center = self._last_valid_spawn_position,
			fp_rotation = self._fp_rotation
		}

		return targeting_data
	end

	return nil
end
