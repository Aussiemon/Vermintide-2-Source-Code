require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local command_to_query_concept = {
	clan_rat_attack = "commanding"
}
BTGiveCommandAction = class(BTGiveCommandAction, BTNode)
BTGiveCommandAction.init = function (self, ...)
	BTGiveCommandAction.super.init(self, ...)

	return 
end
BTGiveCommandAction.name = "BTGiveCommandAction"
BTGiveCommandAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "order")

	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)

	local tutorial_message_template = action.tutorial_message_template

	if tutorial_message_template then
		local template_id = NetworkLookup.tutorials[tutorial_message_template]
		local message_id = NetworkLookup.tutorials[blackboard.breed.name]

		network_manager.network_transmit:send_rpc_all("rpc_tutorial_message", template_id, message_id)
	end

	return 
end
BTGiveCommandAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	blackboard.target_unit = blackboard.command_target

	AiUtils.activate_unit(blackboard)

	blackboard.command_target_previous = blackboard.command_target
	blackboard.anim_cb_order_finished = nil
	blackboard.give_command = nil
	blackboard.command_target = nil
	blackboard.command_num_units = nil
	blackboard.anim_cb_stormvermin_voice = nil

	return 
end
BTGiveCommandAction.run = function (self, unit, blackboard, t, dt)
	local command_target = blackboard.command_target

	if not unit_alive(command_target) then
		return "failed"
	end

	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, command_target)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_wanted_rotation(locomotion_extension, rot)

	if blackboard.anim_cb_stormvermin_voice then
		blackboard.anim_cb_stormvermin_voice = nil
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		local order = blackboard.give_command

		if order == "clan_rat_attack" then
			event_data.target_name = ScriptUnit.extension(command_target, "dialogue_system").context.player_profile
			event_data.num_units = blackboard.command_num_units

			if blackboard.command_target_previous == nil or command_target == blackboard.command_target_previous then
				dialogue_input.trigger_networked_dialogue_event(dialogue_input, "commanding", event_data)
			else
				dialogue_input.trigger_networked_dialogue_event(dialogue_input, "command_change_target", event_data)
			end
		elseif order == "cheer" then
		elseif order == "rally" then
		elseif order == "command_globadier" then
			dialogue_input.trigger_networked_dialogue_event(dialogue_input, "command_globadier", event_data)
		elseif order == "command_gutter_runner" then
			dialogue_input.trigger_networked_dialogue_event(dialogue_input, "command_gutter_runner", event_data)
		elseif order == "command_rat_ogre" then
			dialogue_input.trigger_networked_dialogue_event(dialogue_input, "command_rat_ogre", event_data)
		end
	end

	if blackboard.anim_cb_order_finished then
		return "done"
	end

	return "running", "evaluate"
end

return 
