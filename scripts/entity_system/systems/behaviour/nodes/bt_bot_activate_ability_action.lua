require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotActivateAbilityAction = class(BTBotActivateAbilityAction, BTNode)
BTBotActivateAbilityAction.init = function (self, ...)
	BTBotActivateAbilityAction.super.init(self, ...)

	return 
end
BTBotActivateAbilityAction.name = "BTBotActivateAbilityAction"
BTBotActivateAbilityAction.enter = function (self, unit, blackboard, t)
	local action_data = self._tree_node.action_data
	local career_extension = blackboard.career_extension
	local career_name = career_extension.career_name(career_extension)
	local ability_action_data = action_data[career_name]
	local activate_ability_data = blackboard.activate_ability_data
	activate_ability_data.is_using_ability = true
	activate_ability_data.do_start_input = true
	activate_ability_data.started = false
	activate_ability_data.enter_time = t
	activate_ability_data.activation = ability_action_data.activation
	activate_ability_data.wait_action = ability_action_data.wait_action
	activate_ability_data.end_condition = ability_action_data.end_condition

	if activate_ability_data.activation.action == "aim_at_target" then
		local aim_position = activate_ability_data.aim_position:unbox()
		local input_extension = blackboard.input_extension

		input_extension.set_aiming(input_extension, true, true, false)
		input_extension.set_aim_position(input_extension, aim_position)
	end

	return 
end
BTBotActivateAbilityAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local activate_ability_data = blackboard.activate_ability_data

	if activate_ability_data.activation.action == "aim_at_target" then
		local input_extension = blackboard.input_extension

		input_extension.set_aiming(input_extension, false)
	end

	activate_ability_data.is_using_ability = false

	return 
end
BTBotActivateAbilityAction._start_ability = function (self, activate_ability_data, blackboard, t)
	local started = nil
	local do_start_input = activate_ability_data.do_start_input
	local activation_data = activate_ability_data.activation
	local activation_action = activation_data.action

	if do_start_input then
		local input_extension = blackboard.input_extension

		input_extension.activate_ability(input_extension)

		local enter_time = activate_ability_data.enter_time
		local min_hold_time = activation_data.min_hold_time or 0

		if enter_time + min_hold_time <= t then
			if activation_action == "aim_at_target" then
				local first_person_extension = blackboard.first_person_extension
				local camera_position = first_person_extension.current_position(first_person_extension)
				local current_rotation = first_person_extension.current_rotation(first_person_extension)
				local current_forward = Quaternion.forward(current_rotation)
				local aim_position = activate_ability_data.aim_position:unbox()
				local aim_direction = Vector3.normalize(aim_position - camera_position)
				local aim_dot = Vector3.dot(current_forward, aim_direction)

				if 0.995 <= aim_dot then
					started = false
					do_start_input = false
				else
					started = false
					do_start_input = true
				end
			else
				started = false
				do_start_input = false
			end
		else
			started = false
			do_start_input = true
		end
	elseif activation_data.wait_on_career_weapon_done then
		local inventory_extension = blackboard.inventory_extension
		local wielded_slot_data = inventory_extension.get_wielded_slot_data(inventory_extension)

		if wielded_slot_data.id == "slot_career_skill_weapon" then
			started = false
			do_start_input = false
		else
			started = true
			do_start_input = false
		end
	else
		started = true
		do_start_input = false
	end

	return do_start_input, started
end
BTBotActivateAbilityAction._perform_wait_action = function (self, activate_ability_data, unit, blackboard)
	local wait_action = activate_ability_data.wait_action

	if wait_action.input then
		local input_extension = blackboard.input_extension

		input_extension[wait_action.input](input_extension)
	end

	return 
end
BTBotActivateAbilityAction._evaluate_end_condition = function (self, activate_ability_data, unit, blackboard, t)
	local end_condition = activate_ability_data.end_condition

	if end_condition == nil then
		return "done"
	end

	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local ability_buff = nil
	local buffs = end_condition.buffs
	local num_buffs = #buffs

	for i = 1, num_buffs, 1 do
		local buff_name = buffs[i]
		ability_buff = buff_extension.get_non_stacking_buff(buff_extension, buff_name)

		if ability_buff then
			break
		end
	end

	local duration = t - activate_ability_data.enter_time
	local min_duration = 0.5
	local done_when_arriving_at_destination = end_condition.done_when_arriving_at_destination
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocitiy = locomotion_extension.current_velocity(locomotion_extension)
	local speed_sq = Vector3.length_squared(current_velocitiy)
	local min_speed_sq = 0.04000000000000001

	if done_when_arriving_at_destination and min_duration < duration and (navigation_extension.destination_reached(navigation_extension) or speed_sq <= min_speed_sq) then
		return "done"
	end

	local offset_time = end_condition.offset_time

	if (offset_time and ability_buff and ability_buff.end_time and ability_buff.end_time - offset_time < t) or ability_buff == nil then
		return "done"
	else
		return "running"
	end

	return 
end
BTBotActivateAbilityAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.activate_ability_data

	if not data.started then
		data.do_start_input, data.started = self._start_ability(self, data, blackboard, t)

		return "running"
	end

	if data.wait_action then
		self._perform_wait_action(self, data, unit, blackboard)
	end

	return self._evaluate_end_condition(self, data, unit, blackboard, t)
end

return 
