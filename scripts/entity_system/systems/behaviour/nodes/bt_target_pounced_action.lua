require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTargetPouncedAction = class(BTTargetPouncedAction, BTNode)
BTTargetPouncedAction.init = function (self, ...)
	BTTargetPouncedAction.super.init(self, ...)

	return 
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
		locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3(0, 0, 0))
		locomotion_extension.set_affected_by_gravity(locomotion_extension, true)

		return 
	end

	local breed = blackboard.breed

	if action.stab_until_target_is_killed then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		ai_extension.set_perception(ai_extension, "perception_no_seeing", "pick_no_targets")
	end

	blackboard.pouncing_target = true

	blackboard.navigation_extension:set_enabled(false)

	local target_position = POSITION_LOOKUP[target_unit]
	local target_rotation = Unit.local_rotation(target_unit, 0)

	locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3.zero())
	locomotion_extension.teleport_to(locomotion_extension, target_position)

	local mover = Unit.mover(unit)

	Mover.set_position(mover, target_position)
	LocomotionUtils.separate_mover_fallbacks(mover, 1)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)

	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, mover_position, Quaternion.identity())
	LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	target_status_extension.set_pounced_down(target_status_extension, true, unit)
	target_status_extension.add_intensity(target_status_extension, CurrentIntensitySettings.intensity_add_pounced_down)

	local dist = jump_data.total_distance
	local breed_name = breed.name
	local impact_damage = DamageUtils.calculate_damage(breed.pounce_impact_damage) + dist*breed.pounce_bonus_dmg_per_meter

	DamageUtils.add_damage_network(target_unit, unit, impact_damage, "torso", "cutting", Vector3(1, 0, 0), breed_name, nil, nil, nil, action.hit_react_type)
	BTTargetPouncedAction.impact_pushback(target_position, action.close_impact_radius, action.far_impact_radius, action.impact_speed_given, blackboard.target_unit)

	local disabled_by_special = blackboard.group_blackboard.disabled_by_special

	if not disabled_by_special[target_unit] then
		disabled_by_special[target_unit] = unit
	end

	if script_data.debug_player_intensity then
		Managers.state.conflict.pacing:annotate_graph("pounced", "red")
	end

	return 
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

			ai_extension.set_perception(ai_extension, breed.perception, breed.target_selection)
		end

		local disabled_by_special = blackboard.group_blackboard.disabled_by_special

		if disabled_by_special[target_unit] == unit then
			disabled_by_special[target_unit] = nil
		end

		if Unit.alive(target_unit) then
			local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

			target_status_extension.set_pounced_down(target_status_extension, false, unit)
			LocomotionUtils.set_animation_driven_movement(unit, false)
		end

		blackboard.locomotion_extension:set_wanted_rotation(nil)
	else
		blackboard.already_pounced = nil
	end

	blackboard.high_ground_opportunity = nil
	blackboard.jump_data = nil
	blackboard.action = nil
	blackboard.pouncing_target = nil

	blackboard.locomotion_extension:set_movement_type("snap_to_navmesh")
	blackboard.navigation_extension:set_enabled(true)

	if blackboard.stagger then
		blackboard.ninja_vanish = true
	end

	return 
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
			network_manager.anim_event(network_manager, unit, "idle")
		end

		return "failed"
	end

	return "running"
end
BTTargetPouncedAction.impact_pushback = function (impact_position, close_impact_radius, far_impact_radius, impact_speed_given, excluded_player_unit)
	local player_and_bot_units = PLAYER_AND_BOT_UNITS

	for i = 1, #player_and_bot_units, 1 do
		local player_unit = player_and_bot_units[i]

		if player_unit ~= excluded_player_unit then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			if not status_ext.is_disabled(status_ext) then
				local to_player = POSITION_LOOKUP[player_unit] - impact_position
				local player_dist = Vector3.length(to_player)

				if player_dist < far_impact_radius then
					local push_velocity = nil

					if player_dist <= close_impact_radius then
						push_velocity = Vector3.normalize(to_player)*impact_speed_given
					else
						push_velocity = Vector3.normalize(to_player)*((player_dist - close_impact_radius)/(far_impact_radius - close_impact_radius) - 1)*impact_speed_given
					end

					if script_data.debug_ai_movement then
						aiprint("Gutter runner pounced: push-speed:", Vector3.length(push_velocity), "dist:", player_dist, "unit:", player_unit)
					end

					local player_locomotion = ScriptUnit.extension(player_unit, "locomotion_system")

					player_locomotion.add_external_velocity(player_locomotion, push_velocity)
				end
			end
		end
	end

	return 
end
local temp_damage_triplett = {
	0,
	0,
	0
}
BTTargetPouncedAction.direct_damage = function (unit, blackboard)
	local action = blackboard.action

	if not action then
		return 
	end

	local t = Managers.time:time("game")
	local pounced_time = (t - blackboard.start_pouncing_time - action.time_before_ramping_damage)/action.time_to_reach_final_damage_multiplier
	local normalized_time = math.clamp(pounced_time, 0, 1)
	local base_damage = action.damage
	local multiplier = normalized_time*action.final_damage_multiplier + 1
	temp_damage_triplett[1] = base_damage[1]*multiplier
	temp_damage_triplett[2] = base_damage[2]*multiplier
	temp_damage_triplett[3] = base_damage[3]*multiplier

	AiUtils.damage_target(blackboard.target_unit, unit, blackboard.action, temp_damage_triplett)

	return 
end

return 
