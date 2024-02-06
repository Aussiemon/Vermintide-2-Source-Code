-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_interact_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotInteractAction = class(BTBotInteractAction, BTNode)

BTBotInteractAction.init = function (self, ...)
	BTBotInteractAction.super.init(self, ...)
end

BTBotInteractAction.name = "BTBotInteractAction"

local unit_alive = Unit.alive

BTBotInteractAction.enter = function (self, unit, blackboard, t)
	local interaction_unit = blackboard.interaction_unit

	blackboard.current_interaction_unit = interaction_unit

	local interaction_ext = blackboard.interaction_extension

	interaction_ext:set_exclusive_interaction_unit(interaction_unit)

	blackboard.interact = {
		tried = false,
		wait_on_previous_interaction = interaction_ext:is_interacting(),
	}

	local input_ext = blackboard.input_extension
	local soft_aiming = true

	input_ext:set_aiming(true, soft_aiming)
end

BTBotInteractAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.interact = false

	local interaction_ext = blackboard.interaction_extension

	interaction_ext:set_exclusive_interaction_unit(nil)

	local input_ext = blackboard.input_extension

	input_ext:set_aiming(false)

	blackboard.current_interaction_unit = nil
end

BTBotInteractAction.run = function (self, unit, blackboard, t, dt)
	local interaction_unit = blackboard.current_interaction_unit

	if not unit_alive(interaction_unit) or interaction_unit ~= blackboard.interaction_unit and blackboard.interaction_unit then
		return "failed"
	end

	local action_data = self._tree_node.action_data
	local status_ext = blackboard.status_extension
	local interaction_ext = blackboard.interaction_extension
	local input_ext = blackboard.input_extension
	local state = interaction_ext.state
	local bb = blackboard.interact
	local do_interaction = true

	if action_data and action_data.use_block_interaction then
		input_ext:defend()

		do_interaction = status_ext:is_blocking()
	end

	if do_interaction then
		local input = action_data and action_data.input or "interact"

		if bb.wait_on_previous_interaction then
			bb.wait_on_previous_interaction = false
		elseif state == "waiting_to_interact" and not bb.tried then
			input_ext[input](input_ext)

			bb.tried = true
		elseif state == "waiting_to_interact" then
			bb.tried = false
		else
			input_ext[input](input_ext)
		end
	end

	local aim_position

	if action_data and Unit.has_node(interaction_unit, action_data.aim_node) then
		aim_position = Unit.world_position(interaction_unit, Unit.node(interaction_unit, action_data.aim_node))
	else
		aim_position = Unit.world_position(interaction_unit, 0)
	end

	input_ext:set_aim_position(aim_position)

	return "running"
end
