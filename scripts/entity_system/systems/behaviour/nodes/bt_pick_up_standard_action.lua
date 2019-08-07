require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPickupStandardAction = class(BTPickupStandardAction, BTNode)

BTPickupStandardAction.init = function (self, ...)
	BTPickupStandardAction.super.init(self, ...)
end

BTPickupStandardAction.name = "BTPickupStandardAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTPickupStandardAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTPickupStandardAction
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)

	local position = Unit.local_position(blackboard.standard_unit, 0)

	blackboard.navigation_extension:move_to(position)

	blackboard.standard_position_boxed = Vector3Box(position)
	blackboard.anim_cb_picked_up_standard = nil
	blackboard.moving_to_pick_up_standard = true

	Managers.state.network:anim_event(unit, "move_start_fwd")

	local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
	local wanted_set = 2

	ai_inventory_ext:unwield_set(wanted_set)

	blackboard.move_state = "moving"
end

BTPickupStandardAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(default_move_speed)

	blackboard.active_node = nil
	blackboard.action = nil
	blackboard.picking_up_standard = nil
	blackboard.standard_position_boxed = nil
	blackboard.anim_cb_picked_up_standard = nil
	blackboard.moving_to_pick_up_standard = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	blackboard.move_state = "idle"
end

BTPickupStandardAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.anim_cb_picked_up_standard then
		return "done"
	end

	local standard_position = blackboard.standard_position_boxed:unbox()
	local self_position = POSITION_LOOKUP[unit]
	local distance = Vector3.distance(standard_position, self_position)

	if distance < 1.5 and not blackboard.picking_up_standard then
		blackboard.locomotion_extension:use_lerp_rotation(false)

		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.standard_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rot)

		blackboard.picking_up_standard = true

		blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
		Managers.state.network:anim_event(unit, randomize(blackboard.action.pick_up_standard_animation))

		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(false)
	end

	return "running"
end

BTPickupStandardAction.anim_cb_pick_up_standard = function (self, unit, blackboard)
	AiUtils.kill_unit(blackboard.standard_unit, blackboard.standard_unit, nil, nil, nil, "suicide")

	blackboard.standard_unit = nil
	blackboard.has_placed_standard = nil
	local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
	local wanted_set = 1

	ai_inventory_ext:wield_item_set(wanted_set, true)

	blackboard.inventory_item_set = wanted_set

	if not blackboard.triggered_standard_chanting_sound then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(blackboard.action.chanting_sound_event, unit)

		blackboard.triggered_standard_chanting_sound = true
	end
end

return
