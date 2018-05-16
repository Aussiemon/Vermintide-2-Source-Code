require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTGreySeerMountedAction = class(BTGreySeerMountedAction, BTNode)
local PLAYER_POSITIONS = PLAYER_POSITIONS
local PLAYER_UNITS = PLAYER_UNITS

BTGreySeerMountedAction.init = function (self, ...)
	BTGreySeerMountedAction.super.init(self, ...)
end

BTGreySeerMountedAction.name = "BTGreySeerMountedAction"

BTGreySeerMountedAction.enter = function (self, unit, blackboard, t)
	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
	Managers.state.network:anim_event(unit, "to_combat")

	self.game = Managers.state.network:game()
	local unit_storage = Managers.state.unit_storage
	self.go_id = unit_storage:go_id(unit)
	blackboard.move_state = "moving"
end

BTGreySeerMountedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)
end

local Unit_alive = Unit.alive

BTGreySeerMountedAction.run = function (self, unit, blackboard, t, dt)
	local mounted_data = blackboard.mounted_data

	if Unit.alive(mounted_data.mount_unit) and not mounted_data.knocked_off_mounted_timer and not blackboard.knocked_off_mount then
		local mount_rotation = Unit.local_rotation(mounted_data.mount_unit, 0)
		local mount_position = Unit.local_position(mounted_data.mount_unit, 0)

		Unit.set_local_position(unit, 0, mount_position)
		Unit.set_local_rotation(unit, 0, mount_rotation)
	end

	return "running"
end

return
