require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotActivateAbilityAction = class(BTBotActivateAbilityAction, BTNode)

BTBotActivateAbilityAction.init = function (self, ...)
	BTBotActivateAbilityAction.super.init(self, ...)
end

BTBotActivateAbilityAction.name = "BTBotActivateAbilityAction"

local function update_target_location(target, aim_position)
	local node = 0
	local target_unit_blackboard = BLACKBOARDS[target]
	local target_breed = target_unit_blackboard and target_unit_blackboard.breed
	local aim_node = target_breed and (target_breed.bot_melee_aim_node or "j_spine") or "rp_center"

	if Unit.has_node(target, aim_node) then
		node = Unit.node(target, aim_node)
	end

	local aim_pos = Unit.world_position(target, node)

	aim_position:store(aim_pos)

	return aim_pos
end

BTBotActivateAbilityAction.enter = function (self, unit, blackboard, t)
	local action_data = self._tree_node.action_data
	local career_extension = blackboard.career_extension
	local career_name = career_extension:career_name()
	local ability_action_data = action_data[career_name]
	local inventory_extension = blackboard.inventory_extension
	local activate_ability_data = blackboard.activate_ability_data
	activate_ability_data.is_using_ability = true
	activate_ability_data.do_start_input = true
	activate_ability_data.started = false
	activate_ability_data.enter_time = t
	activate_ability_data.next_repath_t = t
	activate_ability_data.activation = ability_action_data.activation
	activate_ability_data.wait_action = ability_action_data.wait_action
	activate_ability_data.end_condition = ability_action_data.end_condition
	activate_ability_data.is_weapon_ability = inventory_extension:get_slot_data("slot_career_skill_weapon") ~= nil

	if activate_ability_data.activation.action == "aim_at_target" then
		local aim_position = activate_ability_data.aim_position:unbox()
		local input_extension = blackboard.input_extension
		local soft_aim = not ability_action_data.fast_aim

		input_extension:set_aiming(true, soft_aim, false)
		input_extension:set_aim_position(aim_position)
	end
end

BTBotActivateAbilityAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local activate_ability_data = blackboard.activate_ability_data

	if activate_ability_data.activation.action == "aim_at_target" then
		local input_extension = blackboard.input_extension

		input_extension:set_aiming(false)
	end

	activate_ability_data.is_using_ability = false
	activate_ability_data.move_to_position_set = false

	if reason ~= "done" then
		self:_cancel_ability(activate_ability_data, blackboard, t)
	end
end

BTBotActivateAbilityAction._start_ability = function (self, activate_ability_data, blackboard, t)
	local started = false
	local do_start_input = activate_ability_data.do_start_input
	local activation_data = activate_ability_data.activation
	local activation_action = activation_data.action

	if do_start_input then
		local input_extension = blackboard.input_extension

		input_extension:activate_ability()

		local enter_time = activate_ability_data.enter_time
		local min_hold_time = activation_data.min_hold_time or 0

		if t >= enter_time + min_hold_time then
			if activation_action == "aim_at_target" then
				local first_person_extension = blackboard.first_person_extension
				local camera_position = first_person_extension:current_position()
				local current_rotation = first_person_extension:current_rotation()
				local current_forward = Quaternion.forward(current_rotation)
				local aim_position = activate_ability_data.aim_position:unbox()
				local aim_direction = Vector3.normalize(aim_position - camera_position)
				local aim_dot = Vector3.dot(current_forward, aim_direction)

				if aim_dot >= 0.995 then
					do_start_input = activation_data.max_distance_sq and activation_data.max_distance_sq < Vector3.distance_squared(camera_position, aim_position)
				else
					do_start_input = true
				end
			else
				do_start_input = false
			end
		else
			do_start_input = true
		end
	elseif activate_ability_data.is_weapon_ability then
		local inventory_extension = blackboard.inventory_extension
		local wielded_slot_data = inventory_extension:get_wielded_slot_data()

		if wielded_slot_data.id ~= "slot_career_skill_weapon" then
			started = false
			do_start_input = true
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

BTBotActivateAbilityAction._cancel_ability = function (self, activate_ability_data, blackboard, t)
	local input_extension = blackboard.input_extension

	input_extension:cancel_ability()
end

BTBotActivateAbilityAction._perform_wait_action = function (self, activate_ability_data, unit, blackboard)
	local wait_action = activate_ability_data.wait_action

	if wait_action.input then
		local input_extension = blackboard.input_extension

		input_extension[wait_action.input](input_extension)
	end
end

BTBotActivateAbilityAction._evaluate_end_condition = function (self, activate_ability_data, unit, blackboard, t)
	local end_condition = activate_ability_data.end_condition

	if end_condition == nil then
		return "done"
	end

	if end_condition.is_slot_not_wielded then
		local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot

		if not table.contains(end_condition.is_slot_not_wielded, wielded_slot) then
			return "done"
		end
	end

	if end_condition.buffs then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local ability_buff = nil
		local buffs = end_condition.buffs
		local num_buffs = #buffs

		for i = 1, num_buffs do
			local buff_name = buffs[i]
			ability_buff = buff_extension:get_non_stacking_buff(buff_name)

			if ability_buff then
				break
			end
		end

		local offset_time = end_condition.offset_time

		if ability_buff == nil or offset_time and ability_buff and ability_buff.end_time and t > ability_buff.end_time - offset_time then
			return "done"
		end
	end

	if end_condition.done_when_arriving_at_destination then
		local navigation_extension = blackboard.navigation_extension
		local locomotion_extension = blackboard.locomotion_extension
		local current_velocitiy = locomotion_extension:current_velocity()
		local speed_sq = Vector3.length_squared(current_velocitiy)
		local min_speed_sq = 0.04000000000000001
		local duration = t - activate_ability_data.enter_time
		local min_duration = 0.5

		if duration > min_duration and (navigation_extension:destination_reached() or speed_sq <= min_speed_sq) then
			return "done"
		end
	end

	return "running"
end

BTBotActivateAbilityAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.activate_ability_data
	local activation_data = data.activation

	if activation_data.dynamic_target_unit then
		local target_unit = activation_data.custom_target_unit and data.target_unit or blackboard.target_unit

		if ALIVE[target_unit] then
			if target_unit == unit then
				local input_extension = blackboard.input_extension

				input_extension:set_aiming(true, true, false)

				local first_person_extension = blackboard.first_person_extension
				local camera_position = first_person_extension:current_position()
				local current_rotation = first_person_extension:current_rotation()
				local current_forward = Quaternion.forward(current_rotation)

				input_extension:set_aim_position(camera_position + current_forward)
			else
				local aim_position = update_target_location(target_unit, data.aim_position)
				local input_extension = blackboard.input_extension

				input_extension:set_aiming(true, true, false)
				input_extension:set_aim_position(aim_position)

				if activation_data.move_to_target_unit and data.next_repath_t <= t then
					blackboard.navigation_destination_override:store(aim_position)

					data.move_to_position_set = true
					data.next_repath_t = t + 0.5
				end
			end
		else
			return "failed"
		end
	end

	if blackboard.status_extension:is_disabled() then
		return "failed"
	end

	if not data.started then
		data.do_start_input, data.started = self:_start_ability(data, blackboard, t)

		return "running"
	end

	if data.is_weapon_ability and data.started then
		blackboard.input_extension:release_ability_hold()
	end

	if data.wait_action then
		self:_perform_wait_action(data, unit, blackboard)
	end

	return self:_evaluate_end_condition(data, unit, blackboard, t)
end
