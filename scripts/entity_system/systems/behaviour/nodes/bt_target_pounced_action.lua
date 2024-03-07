-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_target_pounced_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTargetPouncedAction = class(BTTargetPouncedAction, BTNode)

BTTargetPouncedAction.init = function (self, ...)
	BTTargetPouncedAction.super.init(self, ...)
end

BTTargetPouncedAction.name = "BTTargetPouncedAction"

local POSITION_LOOKUP = POSITION_LOOKUP

BTTargetPouncedAction.enter = function (self, unit, blackboard, t)
	local locomotion_extension = blackboard.locomotion_extension
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTTargetPouncedAction
	blackboard.start_pouncing_time = t

	local jump_data = blackboard.jump_data
	local target_unit = jump_data.target_unit
	local target_position = POSITION_LOOKUP[target_unit]

	if not AiUtils.is_of_interest_to_gutter_runner(unit, jump_data.target_unit, blackboard, true) then
		blackboard.already_pounced = true

		Mover.set_position(Unit.mover(unit), target_position)
		locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
		locomotion_extension:set_affected_by_gravity(true)

		return
	end

	local breed = blackboard.breed

	if action.stab_until_target_is_killed then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		ai_extension:set_perception("perception_no_seeing", "pick_no_targets")
	end

	blackboard.pouncing_target = true

	blackboard.navigation_extension:set_enabled(false)

	local target_position, target_rotation = POSITION_LOOKUP[target_unit], Unit.local_rotation(target_unit, 0)

	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:teleport_to(target_position)

	local mover = Unit.mover(unit)

	Mover.set_position(mover, target_position)
	LocomotionUtils.separate_mover_fallbacks(mover, 1)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, mover_position, Quaternion.identity())
	LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	target_status_extension:set_pounced_down(true, unit)
	target_status_extension:add_pacing_intensity(CurrentIntensitySettings.intensity_add_pounced_down)

	local dist = jump_data.total_distance
	local breed_name = breed.name
	local impact_damage = DamageUtils.calculate_damage(breed.pounce_impact_damage) + dist * breed.pounce_bonus_dmg_per_meter

	DamageUtils.add_damage_network(target_unit, unit, impact_damage, "torso", "cutting", nil, Vector3(1, 0, 0), breed_name, nil, nil, nil, action.hit_react_type)
	BTTargetPouncedAction.impact_pushback(unit, target_position, action.close_impact_radius, action.far_impact_radius, action.impact_speed_given, blackboard.target_unit)

	local disabled_by_special = blackboard.group_blackboard.disabled_by_special

	if not disabled_by_special[target_unit] then
		disabled_by_special[target_unit] = unit
	end

	if script_data.debug_player_intensity then
		Managers.state.conflict.pacing:annotate_graph("pounced", "red")
	end
end

BTTargetPouncedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	aiprint("LEAVE TARGET POUNCED ACTION")

	local jump_data = blackboard.jump_data
	local target_unit = jump_data.target_unit

	blackboard.active_node = nil

	if not blackboard.already_pounced then
		if blackboard.action.stab_until_target_is_killed then
			local breed = blackboard.breed
			local ai_extension = ScriptUnit.extension(unit, "ai_system")

			ai_extension:set_perception(breed.perception, breed.target_selection)
		end

		local disabled_by_special = blackboard.group_blackboard.disabled_by_special

		if disabled_by_special[target_unit] == unit then
			disabled_by_special[target_unit] = nil
		end

		if Unit.alive(target_unit) then
			local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

			target_status_extension:set_pounced_down(false, unit)

			if not destroy then
				LocomotionUtils.set_animation_driven_movement(unit, false)
			end
		end

		if not destroy then
			blackboard.locomotion_extension:set_wanted_rotation(nil)
		end
	else
		blackboard.already_pounced = nil
	end

	blackboard.high_ground_opportunity = nil
	blackboard.jump_data = nil
	blackboard.action = nil
	blackboard.pouncing_target = nil

	if not destroy then
		blackboard.locomotion_extension:set_movement_type("snap_to_navmesh")
	end

	blackboard.navigation_extension:set_enabled(true)

	if blackboard.stagger then
		blackboard.ninja_vanish = true
	end
end

BTTargetPouncedAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.already_pounced then
		return "failed"
	end

	local jump_data = blackboard.jump_data

	if not AiUtils.is_of_interest_to_gutter_runner(unit, jump_data.target_unit, blackboard, blackboard.action.stab_until_target_is_killed) then
		local network_manager = Managers.state.network

		if blackboard.action.foff_after_pounce_kill then
			blackboard.ninja_vanish = true
		else
			network_manager:anim_event(unit, "idle")
		end

		return "failed"
	end

	return "running"
end

BTTargetPouncedAction.impact_pushback = function (pouncing_unit, impact_position, close_impact_radius, far_impact_radius, impact_speed_given, excluded_player_unit)
	local side = Managers.state.side.side_by_unit[pouncing_unit]
	local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #player_and_bot_units do
		local player_unit = player_and_bot_units[i]

		if player_unit ~= excluded_player_unit then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			if not status_ext:is_disabled() then
				local to_player = POSITION_LOOKUP[player_unit] - impact_position
				local player_dist = Vector3.length(to_player)

				if player_dist < far_impact_radius then
					local push_velocity

					if player_dist <= close_impact_radius then
						push_velocity = Vector3.normalize(to_player) * impact_speed_given
					else
						push_velocity = Vector3.normalize(to_player) * (1 - (player_dist - close_impact_radius) / (far_impact_radius - close_impact_radius)) * impact_speed_given
					end

					if script_data.debug_ai_movement then
						aiprint("Gutter runner pounced: push-speed:", Vector3.length(push_velocity), "dist:", player_dist, "unit:", player_unit)
					end

					local player_locomotion = ScriptUnit.extension(player_unit, "locomotion_system")

					player_locomotion:add_external_velocity(push_velocity)
				end
			end
		end
	end
end

local temp_damage_triplett = {
	0,
	0,
	0,
}

BTTargetPouncedAction.direct_damage = function (unit, blackboard)
	local action = blackboard.action

	if not action then
		return
	end

	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local ramp_damage_time = action.time_before_ramping_damage[difficulty_rank] or action.time_before_ramping_damage[2]
	local time_to_reach_final_multiplier = action.time_to_reach_final_damage_multiplier[difficulty_rank] or action.time_to_reach_final_damage_multiplier[2]
	local t = Managers.time:time("game")
	local pounced_time = (t - blackboard.start_pouncing_time - ramp_damage_time) / time_to_reach_final_multiplier
	local normalized_time = math.clamp(pounced_time, 0, 1)
	local base_damage = action.damage
	local multiplier = 1 + normalized_time * action.final_damage_multiplier

	base_damage = base_damage * multiplier

	local jump_data = blackboard.jump_data
	local target_unit = jump_data.target_unit

	AiUtils.damage_target(target_unit, unit, blackboard.action, base_damage)
end
