-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_teleport_to_ally_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotTeleportToAllyAction = class(BTBotTeleportToAllyAction, BTNode)

BTBotTeleportToAllyAction.init = function (self, ...)
	BTBotTeleportToAllyAction.super.init(self, ...)
end

BTBotTeleportToAllyAction.name = "BTBotTeleportToAllyAction"

BTBotTeleportToAllyAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTBotTeleportToAllyAction.enter = function (self, unit, blackboard, t)
	return
end

local CHECKS_PER_DIRECTION = 5
local ANGLE_INCREMENT = math.pi / (2 * CHECKS_PER_DIRECTION)
local CHECK_DISTANCE = 5

BTBotTeleportToAllyAction.run = function (self, unit, blackboard, t, dt)
	local follow_unit = blackboard.ai_bot_group_extension.data.follow_unit
	local nav_world = blackboard.nav_world
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension:traverse_logic()
	local check_direction
	local game = Managers.state.network:game()

	if game then
		local game_object_id = Managers.state.unit_storage:go_id(follow_unit)

		check_direction = -GameSession.game_object_field(game, game_object_id, "aim_direction")
	else
		local rotation = Unit.local_rotation(follow_unit, 0)

		check_direction = -Quaternion.forward(rotation)
	end

	local follow_unit_whereabouts_extension = ScriptUnit.extension(follow_unit, "whereabouts_system")
	local from_position = follow_unit_whereabouts_extension:last_position_on_navmesh()
	local best_position, best_distance_sq = nil, -math.huge
	local angle_sign = 1

	for i = 0, CHECKS_PER_DIRECTION do
		local directions_to_check = i > 0 and 2 or 1
		local done = false

		for j = 1, directions_to_check do
			local angle = angle_sign * ANGLE_INCREMENT * i
			local rotation = Quaternion.axis_angle(Vector3.up(), angle)
			local new_direction = Quaternion.rotate(rotation, check_direction)
			local to_position = from_position + new_direction * CHECK_DISTANCE
			local success, hit_position = GwNavQueries.raycast(nav_world, from_position, to_position, traverse_logic)

			if success then
				best_position = hit_position
				best_distance_sq = CHECK_DISTANCE
				done = true

				break
			end

			local distance_sq = Vector3.distance_squared(from_position, hit_position)

			if best_distance_sq < distance_sq then
				best_position = hit_position
				best_distance_sq = distance_sq
			end

			angle_sign = -angle_sign
		end

		if done then
			break
		end
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:teleport_to(best_position)

	local status_extension = blackboard.status_extension

	if status_extension then
		status_extension:set_falling_height(true, best_position.z)
		status_extension:set_ignore_next_fall_damage(true)
	end

	blackboard.has_teleported = true

	navigation_extension:teleport(best_position)
	blackboard.ai_extension:clear_failed_paths()

	blackboard.follow.needs_target_position_refresh = true

	return "done"
end
