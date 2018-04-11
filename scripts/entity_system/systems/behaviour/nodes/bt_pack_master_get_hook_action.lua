require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterGetHookAction = class(BTPackMasterGetHookAction, BTNode)
BTPackMasterGetHookAction.name = "BTPackMasterGetHookAction"
local DRAG_DESTINATIONS_N = 10
local DESTINATION_POS_I = 1
local DESTINATION_SCORE_I = 2
BTPackMasterGetHookAction.init = function (self, ...)
	BTPackMasterGetHookAction.super.init(self, ...)

	self.navigation_group_manager = Managers.state.conflict.navigation_group_manager

	return 
end
BTPackMasterGetHookAction.enter = function (self, unit, blackboard, t)
	if not blackboard.best_cover then
		blackboard.end_time = t + 10

		blackboard.navigation_extension:move_to(POSITION_LOOKUP[unit])
	end

	Managers.state.network:anim_event(unit, "run_away")

	return 
end
BTPackMasterGetHookAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason == "done" then
		AiUtils.show_polearm(unit, true)

		blackboard.needs_hook = nil
		blackboard.best_cover = nil
		blackboard.best_cover_score = nil
	end

	Managers.state.network:anim_event(unit, "move_fwd")

	return 
end
BTPackMasterGetHookAction.run = function (self, unit, blackboard, t, dt)
	local player_center_pos = ConflictUtils.average_player_position()

	if player_center_pos == nil then
		return "failed"
	end

	local position = POSITION_LOOKUP[unit]
	local nav_world = blackboard.nav_world

	if blackboard.navigation_extension:has_reached_destination(1) then
		if blackboard.end_time < t then
			return "done"
		end

		self.find_hidden_cover(self, position, player_center_pos, blackboard)

		if not blackboard.best_cover then
			return "done"
		end

		if blackboard.best_cover_score < 0 then
			return "done"
		end

		blackboard.navigation_extension:move_to(blackboard.best_cover:unbox())
	end

	if script_data.debug_ai_movement and blackboard.best_cover then
		local cover_pos = blackboard.best_cover:unbox()
		local high_pos = cover_pos + Vector3(0, 0, 15)

		QuickDrawer:sphere(cover_pos, 0.75, Color(255, 0, 150), 6)
		QuickDrawer:line(cover_pos, high_pos, Color(255, 0, 150))
		QuickDrawer:sphere(high_pos, 0.75, Color(255, 0, 150), 6)
	end

	return "running"
end
BTPackMasterGetHookAction.find_hidden_cover = function (self, position, player_center_pos, blackboard)
	blackboard.best_cover_score = -math.huge
	blackboard.best_cover = nil
	local found_cover_units = FrameTable.alloc_table()
	local wanted_direction = Vector3.normalize(position - player_center_pos)
	local max_rad = 19
	local min_rad = 5
	local unit_position = Unit.local_position
	local distance_squared = Vector3.distance_squared
	local distance = Vector3.distance
	local normalize = Vector3.normalize
	local dot = Vector3.dot
	local max = math.max
	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	local found_cover_units_n = Broadphase.query(bp, position, max_rad, found_cover_units)
	min_rad = min_rad * min_rad
	max_rad = max_rad * max_rad

	if script_data.debug_ai_movement then
		QuickDrawerStay:sphere(player_center_pos, 2, Colors.get("cyan"))
		QuickDrawerStay:vector(player_center_pos, wanted_direction * 4, Colors.get("cyan"))
	end

	local max_i = math.min(found_cover_units_n, 15)

	for i = 1, max_i, 1 do
		local unit = found_cover_units[i]
		local pos = unit_position(unit, 0)
		local dist_squared = distance_squared(pos, position)

		if min_rad <= dist_squared and dist_squared < max_rad then
			local rot = Unit.local_rotation(unit, 0)
			local pm_to_cover_point = pos - position
			local direction_dot = dot(pm_to_cover_point, wanted_direction)
			local hidden_dot = dot(Quaternion.forward(rot), -wanted_direction)

			if blackboard.best_cover_score < direction_dot and 0 < hidden_dot then
				blackboard.best_cover_score = direction_dot
				blackboard.best_cover = Vector3Box(pos)
			end

			if script_data.debug_ai_movement then
				local color = Color(255, 255 * max(-direction_dot, 0), 255 * max(direction_dot, 0), 255 * max(0, hidden_dot))

				QuickDrawerStay:sphere(pos, 1, color)
				QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), color)
			end
		end
	end

	return 
end

return 
