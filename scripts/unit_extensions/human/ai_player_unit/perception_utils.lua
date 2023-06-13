require("scripts/unit_extensions/human/ai_player_unit/ai_utils")

PerceptionUtils = {}
local AiUtils_unit_alive = AiUtils.unit_alive
local unit_knocked_down = AiUtils.unit_knocked_down
local POSITION_LOOKUP = POSITION_LOOKUP
local AI_UTILS = AI_UTILS
local ScriptUnit_extension = ScriptUnit.extension

PerceptionUtils.troll_crouch_check = function (unit, blackboard, t)
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local ray_length = 1.2
	local pos = Unit.local_position(unit, 0)
	local fwd = Vector3.normalize(Quaternion.forward(Unit.world_rotation(unit, 0)))
	local above_pos = pos + Vector3(0, 0, 2)
	local infront_pos = above_pos + fwd
	local result, hit_position = PhysicsWorld.immediate_raycast(physics_world, infront_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local result2, hit_position2 = PhysicsWorld.immediate_raycast(physics_world, above_pos, Vector3(0, 0, 1), ray_length, "closest", "collision_filter", "filter_ai_mover")
	local crouching = result and hit_position or result2 and hit_position2

	if crouching then
		blackboard.crouch_sticky_timer = t + 1
	end

	blackboard.needs_to_crouch = t < blackboard.crouch_sticky_timer
end

PerceptionUtils.perception_continuous_chaos_troll = function (unit, blackboard, breed, t, dt)
	AiUtils.push_intersecting_players(unit, unit, blackboard.displaced_units, breed.displace_players_data, t, dt)
	PerceptionUtils.troll_crouch_check(unit, blackboard, t)
	AiUtils.update_aggro(unit, blackboard, breed, t, dt)

	return true
end

PerceptionUtils.perception_continuous_chaos_spawn = function (unit, blackboard, breed, t, dt)
	AiUtils.update_aggro(unit, blackboard, breed, t, dt)

	blackboard.grabbed_time = blackboard.grabbed_time + dt

	return true
end

PerceptionUtils.perception_continuous_rat_ogre = function (unit, blackboard, breed, t, dt)
	AiUtils.update_aggro(unit, blackboard, breed, t, dt)

	return true
end

PerceptionUtils.perception_continuous_keep_target = function (unit, blackboard, breed, t, dt)
	local target_unit = blackboard.target_unit
	local side = blackboard.side
	local target_alive = AiUtils_unit_alive(target_unit)

	return not target_alive or DamageUtils.is_player_unit(target_unit) and not side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[target_unit]
end

PerceptionUtils.perception_no_seeing = function (self, unit, blackboard, breed, pick_target_func, t)
	return
end

PerceptionUtils.perception_all_seeing = function (unit, blackboard, breed, pick_target_func, t)
	local target_unit = blackboard.target_unit
	local closest_enemy, closest_dist = pick_target_func(unit, blackboard, breed)

	if closest_enemy then
		if closest_enemy ~= target_unit then
			if breed.special then
				local special_targets = blackboard.group_blackboard.special_targets

				if target_unit then
					special_targets[target_unit] = nil
				end

				special_targets[closest_enemy] = unit
			end

			blackboard.previous_target_unit = blackboard.target_unit
			blackboard.target_unit = closest_enemy
			blackboard.target_unit_found_time = t
			blackboard.is_passive = false
		end

		blackboard.target_dist = closest_dist
	else
		if breed.special and target_unit then
			blackboard.group_blackboard.special_targets[target_unit] = nil
		end

		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = nil
		blackboard.target_dist = math.huge
	end
end

PerceptionUtils.perception_all_seeing_boss = function (unit, blackboard, breed, pick_target_func, t)
	PerceptionUtils.perception_all_seeing(unit, blackboard, breed, pick_target_func, t)

	if blackboard.aggro_unit ~= blackboard.target_unit then
		local old_aggro_unit = blackboard.aggro_unit
		local new_aggro_unit = blackboard.target_unit
		blackboard.aggro_unit = new_aggro_unit

		if breed.trigger_dialogue_on_target_switch and new_aggro_unit then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.attack_tag = breed.dialogue_target_switch_attack_tag or "enemy_target_changed"
			event_data.target_name = ScriptUnit.extension(new_aggro_unit, "dialogue_system").context.player_profile

			dialogue_input:trigger_networked_dialogue_event(breed.dialogue_target_switch_event or "enemy_target_changed", event_data)
		end

		local sound_effect_system = Managers.state.entity:system("sound_effect_system")

		sound_effect_system:aggro_unit_changed(old_aggro_unit, unit, false)
		sound_effect_system:aggro_unit_changed(new_aggro_unit, unit, true)
	end
end

PerceptionUtils.perception_standard_bearer = function (unit, blackboard, breed, pick_target_func, t)
	if blackboard.spawn_category == "patrol" then
		local ai_group_extension = ScriptUnit.has_extension(unit, "ai_group_system")

		if ai_group_extension and ai_group_extension.in_patrol then
			return
		end
	end

	local target_unit = blackboard.target_unit
	local closest_enemy, closest_dist = pick_target_func(unit, blackboard, breed)

	if closest_enemy and closest_enemy ~= target_unit then
		local special_targets = blackboard.group_blackboard.special_targets

		if target_unit then
			special_targets[target_unit] = nil
		end

		special_targets[closest_enemy] = unit
		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = closest_enemy
		blackboard.target_unit_found_time = t
		blackboard.target_dist = closest_dist
		blackboard.is_passive = false
	elseif closest_enemy then
		blackboard.target_dist = closest_dist
	else
		if target_unit then
			blackboard.group_blackboard.special_targets[target_unit] = nil
		end

		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = nil
		blackboard.target_dist = math.huge
	end
end

PerceptionUtils.perception_pack_master = function (unit, blackboard, breed, pick_target_func, t)
	if blackboard.drag_target_unit then
		return
	end

	local target_unit = blackboard.target_unit
	local closest_enemy, closest_dist = pick_target_func(unit, blackboard, breed)

	if closest_enemy and closest_enemy ~= target_unit then
		local special_targets = blackboard.group_blackboard.special_targets

		if target_unit then
			special_targets[target_unit] = nil
		end

		special_targets[closest_enemy] = unit
		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = closest_enemy
		blackboard.target_unit_found_time = t
		blackboard.target_dist = closest_dist
		blackboard.is_passive = false
	elseif closest_enemy then
		blackboard.target_dist = closest_dist
	else
		if target_unit then
			blackboard.group_blackboard.special_targets[target_unit] = nil
		end

		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = nil
		blackboard.target_dist = math.huge
	end
end

PerceptionUtils.perception_rat_ogre = function (unit, blackboard, breed, pick_target_func, t, dt)
	if blackboard.keep_target then
		return
	end

	PerceptionUtils.perception_all_seeing_re_evaluate(unit, blackboard, breed, pick_target_func, t)

	local target_unit = blackboard.target_unit

	if ALIVE[target_unit] then
		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

		if status_extension then
			blackboard.target_is_not_downed = not status_extension.is_ledge_hanging and not status_extension.knocked_down
			local self_pos = POSITION_LOOKUP[unit]
			local offset = POSITION_LOOKUP[target_unit] - self_pos
			local x = offset.x
			local y = offset.y
			local z = offset.z
			blackboard.target_flat_distance = math.sqrt(x * x + y * y)
			blackboard.target_height_distance = z
			local is_on_ladder, ladder_unit = status_extension:get_is_on_ladder()

			if is_on_ladder then
				local foot, top = ScriptUnit.extension(ladder_unit, "ladder_system"):ladder_extents()
				blackboard.target_on_ladder = ladder_unit
				local foot_offset = self_pos - foot
				local ladder_vector = top - foot
				local ladder_up_dir = Vector3.normalize(ladder_vector)
				local height_on_ladder = Vector3.dot(foot_offset, ladder_up_dir)

				if height_on_ladder < 0 then
					blackboard.ladder_distance = Vector3.length(foot_offset)
				elseif Vector3.length(ladder_vector) < height_on_ladder then
					blackboard.ladder_distance = Vector3.length(self_pos - top)
				else
					blackboard.ladder_distance = Vector3.length(foot_offset - ladder_up_dir * height_on_ladder)
				end
			else
				blackboard.ladder_distance = math.huge
			end
		else
			blackboard.target_is_not_downed = true
		end
	end

	if blackboard.aggro_unit ~= target_unit then
		local old_aggro_unit = blackboard.aggro_unit
		local new_aggro_unit = target_unit
		blackboard.aggro_unit = new_aggro_unit
		local old_aggro = blackboard.aggro_list[old_aggro_unit]

		if old_aggro then
			blackboard.aggro_list[old_aggro_unit] = old_aggro * breed.perception_weights.old_target_aggro_mul
		end

		if breed.trigger_dialogue_on_target_switch and new_aggro_unit then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.attack_tag = breed.dialogue_target_switch_attack_tag or "rat_ogre_change_target"
			event_data.target_name = ScriptUnit.extension(new_aggro_unit, "dialogue_system").context.player_profile

			dialogue_input:trigger_networked_dialogue_event(breed.dialogue_target_switch_event or "enemy_attack", event_data)
		end

		local sound_effect_system = Managers.state.entity:system("sound_effect_system")

		sound_effect_system:aggro_unit_changed(old_aggro_unit, unit, false)
		sound_effect_system:aggro_unit_changed(new_aggro_unit, unit, true)
	end
end

PerceptionUtils.perception_all_seeing_re_evaluate = function (unit, blackboard, breed, pick_target_func, t)
	local target_unit = blackboard.target_unit
	local target_alive = AiUtils_unit_alive(target_unit)
	local best_enemy, enemy_dist, urgency_to_engage = pick_target_func(unit, blackboard, breed, t)

	if target_alive and best_enemy == target_unit then
		blackboard.target_dist = enemy_dist
		blackboard.urgency_to_engage = urgency_to_engage
	elseif best_enemy and best_enemy ~= target_unit then
		if breed.special then
			local special_targets = blackboard.group_blackboard.special_targets

			if target_unit then
				special_targets[target_unit] = nil
			end

			special_targets[best_enemy] = unit
		end

		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_changed = true
		blackboard.target_unit = best_enemy
		blackboard.target_unit_found_time = t
		blackboard.target_dist = enemy_dist
		blackboard.urgency_to_engage = urgency_to_engage
		blackboard.remembered_threat_pos = nil
	else
		if breed.special then
			local special_targets = blackboard.group_blackboard.special_targets

			if special_targets[target_unit] == unit then
				special_targets[target_unit] = nil
			end
		end

		blackboard.previous_target_unit = blackboard.target_unit
		blackboard.target_unit = nil
		blackboard.target_dist = math.huge
		blackboard.urgency_to_engage = nil
	end
end

PerceptionUtils.perception_regular = function (unit, blackboard, breed, pick_target_func, t)
	local target_unit = blackboard.target_unit
	local target_alive = AiUtils_unit_alive(target_unit)

	if blackboard.keep_target then
		return false
	end

	local best_enemy = pick_target_func(unit, blackboard, breed, t)

	if target_unit and target_alive and best_enemy == target_unit then
		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

		if status_extension then
			blackboard.target_is_not_downed = not status_extension.is_ledge_hanging and not status_extension.knocked_down
		else
			blackboard.target_is_not_downed = true
		end
	else
		if best_enemy and best_enemy ~= target_unit then
			blackboard.previous_target_unit = blackboard.target_unit
			blackboard.target_unit = best_enemy
			blackboard.target_unit_found_time = t
			blackboard.slot = nil
			blackboard.slot_layer = nil
			blackboard.is_passive = false
			blackboard.target_changed = true
		elseif blackboard.delayed_target_unit and AiUtils_unit_alive(blackboard.delayed_target_unit) and blackboard.target_unit == nil then
			blackboard.previous_target_unit = blackboard.target_unit
			blackboard.target_unit = blackboard.delayed_target_unit
			blackboard.target_unit_found_time = t
			blackboard.is_passive = false
			blackboard.target_changed = true
		else
			blackboard.previous_target_unit = blackboard.target_unit
			blackboard.target_unit = nil

			if blackboard.confirmed_player_sighting then
				local is_horde = blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden"

				if not is_horde then
					AiUtils.deactivate_unit(blackboard)
				end
			end
		end

		blackboard.delayed_target_unit = nil
	end
end

PerceptionUtils.keep_target_until_invalid = function (unit, blackboard, breed, pick_target_func, t)
	local target_unit = blackboard.target_unit
	local health_ext = ScriptUnit.has_extension(target_unit, "health_system")
	local status_ext = ScriptUnit.has_extension(target_unit, "status_system")

	if not ALIVE[target_unit] or health_ext and health_ext:is_dead() or status_ext and status_ext:is_invisible() then
		blackboard.override_target_selection_name = nil
	end

	return target_unit
end

PerceptionUtils.perception_regular_update_aggro = function (unit, blackboard, breed, pick_target_func, t, dt)
	AiUtils.update_aggro(unit, blackboard, breed, t, dt)
	PerceptionUtils.perception_regular(unit, blackboard, breed, pick_target_func, t, dt)

	if blackboard.aggro_unit ~= blackboard.target_unit then
		local old_aggro_unit = blackboard.aggro_unit
		local new_aggro_unit = blackboard.target_unit
		blackboard.aggro_unit = new_aggro_unit
		local aggro_list = blackboard.aggro_list
		local aggro = aggro_list[old_aggro_unit]

		if aggro then
			blackboard.aggro_list[old_aggro_unit] = aggro * breed.perception_weights.old_target_aggro_mul
		end

		if breed.trigger_dialogue_on_target_switch and new_aggro_unit then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.attack_tag = "enemy_target_changed"
			event_data.target_name = ScriptUnit.extension(new_aggro_unit, "dialogue_system").context.player_profile

			dialogue_input:trigger_networked_dialogue_event("enemy_target_changed", event_data)
		end

		local sound_effect_system = Managers.state.entity:system("sound_effect_system")

		sound_effect_system:aggro_unit_changed(old_aggro_unit, unit, false)
		sound_effect_system:aggro_unit_changed(new_aggro_unit, unit, true)
	end
end

local ai_units = {}

PerceptionUtils.alert_enemies_within_range = function (___world, player_unit, is_server, alert_position, alert_radius)
	if not is_server then
		return
	end

	local ScriptUnit_extension = ScriptUnit.extension
	local num_ai_units = AiUtils.broadphase_query(alert_position, alert_radius, ai_units)

	for i = 1, num_ai_units do
		local ai_unit = ai_units[i]

		ScriptUnit_extension(ai_unit, "ai_system"):enemy_alert(ai_unit, player_unit)
	end
end

PerceptionUtils.pack_master_has_line_of_sight_for_attack = function (physics_world, packmaster_unit, target_unit)
	local start_pos = Unit.world_position(packmaster_unit, Unit.node(packmaster_unit, "j_spine"))
	local end_pos = Unit.world_position(target_unit, Unit.node(target_unit, "j_neck"))
	local radius = 0.15
	local max_hits = 1
	local offset = start_pos - end_pos
	local success = nil
	local hits = PhysicsWorld.linear_sphere_sweep(physics_world, start_pos, end_pos, radius, max_hits, "types", "both", "collision_filter", "filter_ai_mover", "report_initial_overlap")

	if hits then
		local hit_offset = hits[1].position - start_pos
		local sweep_offset = end_pos - start_pos
		local hit_dist = Vector3.dot(hit_offset, Vector3.normalize(sweep_offset))

		if Vector3.length(sweep_offset) < hit_dist then
			success = true
		else
			success = false
		end
	else
		success = true
	end

	return success
end

PerceptionUtils.clear_target_unit = function (blackboard)
	if blackboard.breed.special then
		local special_targets = blackboard.group_blackboard.special_targets

		if special_targets[target_unit] == unit then
			special_targets[target_unit] = nil
		end
	end

	blackboard.previous_target_unit = blackboard.target_unit
	blackboard.target_unit = nil
	blackboard.target_dist = math.huge
	blackboard.urgency_to_engage = nil
end

local found_units = {}
local healthy_targets = {}
local healthy_target_positions = {}
local num_healthy_targets = 0

PerceptionUtils.special_opportunity = function (unit, blackboard)
	num_healthy_targets = 0
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local num_enemies = #PLAYER_AND_BOT_UNITS
	local urgency_to_engage = 0

	for i = 1, #healthy_target_positions do
		healthy_target_positions[i] = nil
	end

	for i = 1, num_enemies do
		local player_unit = PLAYER_AND_BOT_UNITS[i]
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] and not status_extension.using_transport then
			if status_extension:is_knocked_down() then
				urgency_to_engage = 10
			elseif status_extension:is_grabbed_by_pack_master() then
				urgency_to_engage = 10
			elseif status_extension:get_is_ledge_hanging() then
				urgency_to_engage = 10
			elseif status_extension:is_pounced_down() then
				urgency_to_engage = 10
			elseif status_extension.under_ratling_gunner_attack then
				urgency_to_engage = 10
			elseif ScriptUnit.extension(player_unit, "health_system"):is_alive() then
				num_healthy_targets = num_healthy_targets + 1
				healthy_targets[num_healthy_targets] = player_unit
				healthy_target_positions[num_healthy_targets] = PLAYER_AND_BOT_POSITIONS[i]
			end
		end
	end

	if num_healthy_targets <= 0 then
		return 0
	end

	local rats_per_player_slot = blackboard.total_slots_count / num_healthy_targets

	if rats_per_player_slot >= 4 then
		urgency_to_engage = 10
	end

	if urgency_to_engage > 0 then
		local pos = POSITION_LOOKUP[unit]
		local closest_dist = math.huge
		local closest_unit = nil

		for i = 1, num_healthy_targets do
			local enemy_unit = healthy_targets[i]
			local sqr_dist = Vector3.distance_squared(pos, healthy_target_positions[i])

			if sqr_dist < closest_dist then
				closest_dist = sqr_dist
				closest_unit = enemy_unit
			end
		end

		return 10, closest_unit
	end

	return 0

	local cluster_utility, loneliest_index, loneliest_value, loneliness = conflictutils.cluster_weight_and_loneliness(healthy_target_positions, 10)
	local loneliest_enemy_unit = healthy_targets[loneliest_index]
	local sqr_dist_to_loneliest = Vector3.distance_squared(healthy_target_positions[loneliest_index], POSITION_LOOKUP[unit])

	if sqr_dist_to_loneliest < 30 then
		urgency_to_engage = 10
		local dist_to_loneliest = math.sqrt(sqr_dist_to_loneliest)

		return loneliest_enemy_unit, dist_to_loneliest, urgency_to_engage
	end

	return urgency_to_engage
end
