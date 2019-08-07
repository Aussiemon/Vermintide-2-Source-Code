require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTMountUnitAction = class(BTMountUnitAction, BTNode)

BTMountUnitAction.init = function (self, ...)
	BTMountUnitAction.super.init(self, ...)
end

BTMountUnitAction.name = "BTMountUnitAction"

BTMountUnitAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local action = self._tree_node.action_data
	blackboard.action = action
	local animation = action.animation or "idle"
	local optional_spawn_data = blackboard.optional_spawn_data

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
	network_manager:anim_event(unit, animation)

	local mounted_data = blackboard.mounted_data
	blackboard.waiting_for_pickup = nil

	if mounted_data then
		local mount_unit = mounted_data.mount_unit

		if AiUtils.unit_alive(mount_unit) then
			local mount_position = POSITION_LOOKUP[mount_unit]
			local mount_rotation = Unit.local_rotation(mount_unit, 0)

			Unit.set_local_position(unit, 0, mount_position)
			Unit.set_local_rotation(unit, 0, mount_rotation)
		end
	end
end

BTMountUnitAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.mounting_finished = nil
	blackboard.should_mount_unit = nil
	blackboard.goal_destination = nil
	local mounted_data = blackboard.mounted_data

	if mounted_data then
		mounted_data.knocked_off_mounted_timer = nil
	end
end

local Unit_alive = Unit.alive

BTMountUnitAction.run = function (self, unit, blackboard, t, dt)
	local mounting_finished = blackboard.mounting_finished
	local action = blackboard.action

	if mounting_finished then
		local mounted_data = blackboard.mounted_data

		if mounted_data then
			local mount_unit = mounted_data.mount_unit

			if AiUtils.unit_alive(mount_unit) then
				local mount_blackboard = BLACKBOARDS[mount_unit]
				mount_blackboard.mounting_finished = true
				mount_blackboard.linked_unit = unit
				blackboard.hp_at_knocked_off = nil
				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(mount_unit)
				local target_go_id = Managers.state.unit_storage:go_id(unit)

				if game and go_id and target_go_id then
					GameSession.set_game_object_field(game, go_id, "animation_synced_unit_id", target_go_id)
				end
			end
		end

		return "done"
	else
		return "running"
	end
end

return
