-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_grey_seer_mounted_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTGreySeerMountedAction = class(BTGreySeerMountedAction, BTNode)

BTGreySeerMountedAction.init = function (self, ...)
	BTGreySeerMountedAction.super.init(self, ...)
end

BTGreySeerMountedAction.name = "BTGreySeerMountedAction"

BTGreySeerMountedAction.enter = function (self, unit, blackboard, t)
	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local game = Managers.state.network:game()
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage:go_id(unit)

	blackboard.move_state = "moving"

	local network_manager = Managers.state.network
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local hit_reaction_extension = blackboard.hit_reaction_extension
	local network_transmit = network_manager.network_transmit

	hit_reaction_extension:set_hit_effect_template_id("HitEffectsSkavenGreySeerMounted")

	health_extension.is_invincible = true

	GameSession.set_game_object_field(game, go_id, "show_health_bar", false)
	network_transmit:send_rpc_clients("rpc_set_hit_reaction_template", go_id, "HitEffectsSkavenGreySeerMounted")

	blackboard.current_hit_reaction_type = "mounted"
end

BTGreySeerMountedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	local network_manager = Managers.state.network
	local game = network_manager:game()
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage:go_id(unit)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local hit_reaction_extension = blackboard.hit_reaction_extension
	local network_transmit = network_manager.network_transmit

	hit_reaction_extension:set_hit_effect_template_id("HitEffectsSkavenGreySeer")

	health_extension.is_invincible = false

	GameSession.set_game_object_field(game, go_id, "show_health_bar", true)
	network_transmit:send_rpc_clients("rpc_set_hit_reaction_template", go_id, "HitEffectsSkavenGreySeer")

	blackboard.current_hit_reaction_type = "on_ground"
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
