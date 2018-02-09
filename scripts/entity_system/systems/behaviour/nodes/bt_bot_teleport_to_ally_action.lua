require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotTeleportToAllyAction = class(BTBotTeleportToAllyAction, BTNode)
BTBotTeleportToAllyAction.name = "BTBotTeleportToAllyAction"
local MAX_ALLOWED_TELEPORT_DISTANCE = 10
BTBotTeleportToAllyAction.init = function (self, ...)
	BTBotTeleportToAllyAction.super.init(self, ...)

	return 
end
BTBotTeleportToAllyAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local a_star = blackboard.teleport.a_star
	blackboard.teleport = nil

	if not GwNavAStar.processing_finished(a_star) then
		GwNavAStar.cancel(a_star)
	end

	GwNavAStar.destroy(a_star)

	return 
end
BTBotTeleportToAllyAction.enter = function (self, unit, blackboard, t)
	blackboard.teleport = {
		state = "init",
		position = Vector3Box(Vector3.invalid_vector()),
		a_star = GwNavAStar.create()
	}

	if BTConditions.cant_reach_ally(blackboard) then
		local bot_position = POSITION_LOOKUP[unit]
		local player_manager = Managers.player
		local player = player_manager.owner(player_manager, unit)
		local profile_index = player.profile_index(player)
		local offset = Vector3(0, 0, 1.5)*(profile_index - 1)
		local follow_data = blackboard.follow
		local target_position = follow_data.target_position:unbox()
		local between_position = Vector3.lerp(bot_position, target_position, 0.5)

		QuickDrawerStay:sphere(bot_position, 0.5, Colors.get("red"))
		QuickDrawerStay:sphere(target_position, 0.5, Colors.get("red"))
		QuickDrawerStay:line(bot_position, target_position, Colors.get("red"))
		QuickDrawerStay:line(between_position, between_position + Vector3(0, 0, 3) + offset, Colors.get("red"))

		local debug_text_1 = string.format("LD Warning! (%s)", player.profile_display_name(player))
		local debug_text_2 = string.format("Bot Pathing Between Navmeshes Failed!")
		local debug_text_3 = string.format("pos(%.2f, %.2f, %.2f)", bot_position.x, bot_position.y, bot_position.z)
		local debug_text_4 = string.format("pos(%.2f, %.2f, %.2f)", target_position.x, target_position.y, target_position.z)

		Debug.world_sticky_text(between_position + Vector3(0, 0, 3) + offset, debug_text_1, "red")
		Debug.world_sticky_text(between_position + Vector3(0, 0, 2.5) + offset, debug_text_2, "red")
		Debug.world_sticky_text(between_position + Vector3(0, 0, 2) + offset, debug_text_3, "red")
		Debug.world_sticky_text(between_position + Vector3(0, 0, 1.5) + offset, debug_text_4, "red")
	end

	return 
end
BTBotTeleportToAllyAction.run = function (self, unit, blackboard, t, dt)
	local target_ally_unit = blackboard.target_ally_unit
	local tp_bb = blackboard.teleport
	local a_star = tp_bb.a_star
	local state = tp_bb.state

	if Unit.alive(target_ally_unit) and state == "init" then
		local target_pos = POSITION_LOOKUP[target_ally_unit]
		local pos = LocomotionUtils.new_random_goal_uniformly_distributed(blackboard.nav_world, nil, target_pos, 2, 5, 5)

		if pos then
			tp_bb.position:store(pos)

			tp_bb.state = "a_star_search"

			GwNavAStar.start(a_star, blackboard.nav_world, target_pos, pos, Managers.state.bot_nav_transition:traverse_logic())
		end
	elseif state == "a_star_search" and GwNavAStar.processing_finished(a_star) then
		if GwNavAStar.path_found(a_star) and GwNavAStar.path_distance(a_star) < MAX_ALLOWED_TELEPORT_DISTANCE and 0 < GwNavAStar.node_count(a_star) then
			local node_count = GwNavAStar.node_count(a_star)
			local destination = GwNavAStar.node_at_index(a_star, node_count)
			local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

			locomotion_extension.teleport_to(locomotion_extension, destination)

			tp_bb.state = "done"
			blackboard.has_teleported = true

			blackboard.navigation_extension:teleport(destination)
			blackboard.ai_extension:clear_failed_paths()

			blackboard.follow.needs_target_position_refresh = true

			return "done"
		else
			tp_bb.state = "init"
		end
	end

	return "running"
end

return 
