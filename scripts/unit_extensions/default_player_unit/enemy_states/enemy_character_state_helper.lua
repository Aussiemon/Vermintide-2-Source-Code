-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_helper.lua

EnemyCharacterStateHelper = EnemyCharacterStateHelper or {}

local EnemyCharacterStateHelper = EnemyCharacterStateHelper

EnemyCharacterStateHelper.get_enemies_in_line_of_sight = function (player_unit, first_player_unit, physics_world, ...)
	local player_position = POSITION_LOOKUP[first_player_unit]
	local player_rotation = Unit.world_rotation(first_player_unit, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local player_breed = Unit.get_data(player_unit, "breed")
	local check_within_range_func

	if player_breed.name == "vs_packmaster" then
		return EnemyCharacterStateHelper._check_within_line_of_sight_packmaster(player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, ...)
	elseif player_breed.name == "vs_ratling_gunner" then
		return EnemyCharacterStateHelper._check_within_line_of_sight_ratling_gunner(player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, ...)
	elseif player_breed.name == "vs_warpfire_thrower" then
		return EnemyCharacterStateHelper._check_within_line_of_sight_warpfire_thrower(player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, ...)
	elseif player_breed.name == "vs_gutter_runner" then
		return EnemyCharacterStateHelper._check_within_line_of_sight_gutter_runner(player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, ...)
	elseif player_breed.name == "vs_poison_wind_globadier" then
		return EnemyCharacterStateHelper._check_within_impact_globadier(player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, ...)
	end
end

EnemyCharacterStateHelper._check_within_line_of_sight_packmaster = function (player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world)
	local side = Managers.state.side.side_by_unit[player_unit]
	local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local breed = PlayerBreeds.vs_packmaster
	local range = breed.grab_hook_range
	local dot_threshold = breed.grab_hook_cone_dot
	local best_enemy_target
	local best_distance = 0
	local best_dot_value = 0

	for _, enemy_unit in ipairs(enemy_units) do
		repeat
			local target_status_extension = ScriptUnit.has_extension(enemy_unit, "status_system")

			if not target_status_extension or target_status_extension:is_disabled() then
				break
			end

			if not Unit.has_node(enemy_unit, "j_claw_attach") then
				break
			end

			local in_range, dot_value, distance = EnemyCharacterStateHelper._check_within_cone(player_position, player_direction, enemy_unit, range, dot_threshold)

			if not in_range then
				break
			end

			local in_los = PerceptionUtils.pack_master_has_line_of_sight_for_attack(physics_world, player_unit, enemy_unit)

			if not in_los then
				break
			end

			if best_dot_value <= dot_value then
				best_dot_value = dot_value
				best_enemy_target = enemy_unit
				best_distance = distance
			end
		until true
	end

	return best_enemy_target, best_distance
end

EnemyCharacterStateHelper._check_within_cone = function (player_position, player_direction, target, range, dot_threshold)
	local target_position = Unit.world_position(target, Unit.node(target, "j_claw_attach"))
	local target_direction = Vector3.normalize(target_position - player_position)
	local target_cos_alpha = Vector3.dot(player_direction, target_direction)
	local distance = Vector3.distance(target_position, player_position)
	local within_range = distance < range

	if dot_threshold <= target_cos_alpha and within_range and EnemyCharacterStateHelper.is_infront_player(player_position, player_direction, target_position) then
		return true, target_cos_alpha, distance
	end
end

EnemyCharacterStateHelper.is_infront_player = function (player_position, player_direction, hit_position)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if dot > 0 then
		return true
	end
end

EnemyCharacterStateHelper._check_within_line_of_sight_ratling_gunner = function (player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world)
	local side = Managers.state.side.side_by_unit[player_unit]
	local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local spread = LightWeightProjectiles.ratling_gunner_vs.spread * 2
	local in_range_units = {}

	for _, enemy_unit in ipairs(enemy_units) do
		repeat
			local enemy_position = Unit.world_position(enemy_unit, Unit.node(enemy_unit, "c_spine"))
			local target_direction = Vector3.normalize(enemy_position - player_position)
			local target_cos_alpha = Vector3.dot(player_direction, target_direction)
			local angle_radians = math.acos(target_cos_alpha)

			if spread < angle_radians then
				break
			end

			local distance = Vector3.distance(enemy_position, player_position)
			local hit, position1, distance1, normal, actor1 = PhysicsWorld.immediate_raycast(physics_world, player_position, target_direction, distance, "closest", "collision_filter", "filter_husk_in_line_of_sight")

			if hit then
				break
			end

			in_range_units[#in_range_units + 1] = {
				unit = enemy_unit,
				distance = distance,
			}
		until true
	end

	return #in_range_units > 0 and in_range_units
end

EnemyCharacterStateHelper._check_within_line_of_sight_warpfire_thrower = function (player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world)
	local breed = PlayerBreeds.vs_warpfire_thrower
	local warpfire_data = BLACKBOARDS[player_unit].warpfire_data
	local attack_half_range = warpfire_data.attack_range / 2
	local attack_radius = warpfire_data.hit_radius
	local attack_cone = breed.shoot_warpfire_close_attack_dot
	local box_size = Vector3(attack_radius, attack_half_range, attack_radius)
	local oobb_pos = player_position + player_direction * attack_half_range
	local hit_target_radius_multiplier = 0.5
	local filter_name = "filter_character_trigger"

	PhysicsWorld.prepare_actors_for_overlap(physics_world, oobb_pos, math.max(attack_half_range, attack_radius))

	local hit_actors, num_hit_actors = PhysicsWorld.immediate_overlap(physics_world, "position", oobb_pos, "rotation", player_rotation, "size", box_size, "shape", "oobb", "types", "dynamics", "collision_filter", filter_name)
	local enemies_in_range = {}
	local hit_units = {}

	for i = 1, num_hit_actors do
		local hit_actor = hit_actors[i]
		local hit_unit = Actor.unit(hit_actor)
		local not_same_unit_and_alive = hit_unit ~= player_unit and Unit.alive(hit_unit)
		local not_hit_yet = not hit_units[hit_unit]

		if not_same_unit_and_alive and not_hit_yet then
			hit_units[hit_unit] = true

			local is_enemy_unit = DamageUtils.is_enemy(player_unit, hit_unit)
			local is_player_unit = DamageUtils.is_player_unit(hit_unit)
			local unit_is_character = is_enemy_unit or is_player_unit
			local target_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")
			local is_valid_player_status = target_status_extension

			if unit_is_character and is_valid_player_status and is_enemy_unit then
				local unit_breed = Unit.get_data(hit_unit, "breed")
				local radius, height = DamageUtils.calculate_aoe_size(hit_unit, unit_breed)
				local vertical_offset = Vector3(0, 0, height / 2)
				local horizontal_offset = Quaternion.rotate(player_rotation, Vector3(radius * hit_target_radius_multiplier, 0, 0))
				local hit_unit_pos = POSITION_LOOKUP[hit_unit] + Vector3(0, 0, height / 2 + 0.1)
				local to_target = hit_unit_pos - player_position
				local dist_to_target = math.max(Vector3.length(to_target), 0.0001)
				local to_target_normalized = Vector3.divide(to_target, dist_to_target)
				local dot = Vector3.dot(to_target_normalized, player_direction)

				if attack_cone < dot then
					local hit_boss = PerceptionUtils.is_boss_in_los(player_unit, player_position, hit_unit_pos, physics_world)
					local los = not hit_boss and PerceptionUtils.is_position_in_line_of_sight(player_unit, player_position, hit_unit_pos, physics_world, "filter_ai_line_of_sight_check")

					if not hit_boss and is_player_unit then
						los = los or PerceptionUtils.is_position_in_line_of_sight(player_unit, player_position, hit_unit_pos + horizontal_offset, physics_world, "filter_ai_line_of_sight_check")
						los = los or PerceptionUtils.is_position_in_line_of_sight(player_unit, player_position, hit_unit_pos - horizontal_offset, physics_world, "filter_ai_line_of_sight_check")
						los = los or PerceptionUtils.is_position_in_line_of_sight(player_unit, player_position, hit_unit_pos + vertical_offset, physics_world, "filter_ai_line_of_sight_check")
						los = los or PerceptionUtils.is_position_in_line_of_sight(player_unit, player_position, hit_unit_pos - vertical_offset, physics_world, "filter_ai_line_of_sight_check")
					end

					if los then
						enemies_in_range[#enemies_in_range + 1] = {
							unit = hit_unit,
							distance = dist_to_target,
						}
					end
				end
			end
		end
	end

	return #enemies_in_range > 0 and enemies_in_range
end

EnemyCharacterStateHelper._check_within_line_of_sight_gutter_runner = function (player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world)
	local breed = PlayerBreeds.vs_gutter_runner
	local jump_speed = breed.pounce_speed
	local pounce_upwards_amount = breed.pounce_upwards_amount
	local pounce_hit_radius = 0.2
	local collision_filter = "filter_melee_sweep"
	local dt = Managers.time:mean_dt()
	local look_direction = Vector3.normalize(player_direction + Vector3(0, 0, pounce_upwards_amount))
	local current_velocity = look_direction * jump_speed
	local current_position = player_position
	local prev_position = current_position
	local enemy_hit, distance
	local time_step = 0.05

	PhysicsWorld.prepare_actors_for_overlap(physics_world, current_position, jump_speed)

	for t = time_step, 5, time_step do
		local fall_speed = current_velocity.z

		fall_speed = fall_speed - breed.pounce_gravity * t
		current_velocity.z = fall_speed
		current_position = current_position + Vector3.multiply(current_velocity, t)

		local sweep_result = PhysicsWorld.linear_sphere_sweep(physics_world, prev_position, current_position, pounce_hit_radius, 10, "collision_filter", collision_filter)

		if sweep_result then
			local should_break = false

			for i = 1, #sweep_result do
				local data = sweep_result[i]
				local hit_unit = Actor.unit(data.actor)

				if hit_unit ~= player_unit then
					should_break = true

					if DamageUtils.is_enemy(player_unit, hit_unit) and BLACKBOARDS[hit_unit] then
						local hit_unit_pos = Unit.world_position(hit_unit, Unit.node(hit_unit, "c_spine"))

						distance = Vector3.distance(player_position, hit_unit_pos)
						enemy_hit = hit_unit

						break
					end
				end
			end

			if should_break then
				break
			end
		end

		prev_position = current_position
		pounce_hit_radius = math.lerp(time_step, breed.pounce_hit_radius, time_step * 2.5)
	end

	return enemy_hit and {
		{
			unit = enemy_hit,
			distance = distance,
		},
	}
end

EnemyCharacterStateHelper._check_within_impact_globadier = function (player_unit, first_player_unit, player_position, player_rotation, player_direction, physics_world, impact_position)
	local breed = PlayerBreeds.vs_poison_wind_globadier
	local radius = breed.globe_throw_aoe_radius
	local side = Managers.state.side.side_by_unit[player_unit]
	local enemy_units = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local enemies = {}
	local POSITION_LOOKUP = POSITION_LOOKUP

	for enemy_unit, _ in pairs(enemy_units) do
		local enemy_position = POSITION_LOOKUP[enemy_unit]
		local distance = Vector3.distance(enemy_position, impact_position)

		if distance <= radius then
			enemies[#enemies + 1] = {
				unit = enemy_unit,
				distance = distance,
			}
		end
	end

	return #enemies > 0 and enemies
end
