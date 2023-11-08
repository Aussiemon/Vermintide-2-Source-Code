require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCritterNurglingRoamAction = class(BTCritterNurglingRoamAction, BTNode)

BTCritterNurglingRoamAction.init = function (self, ...)
	BTCritterNurglingRoamAction.super.init(self, ...)
end

BTCritterNurglingRoamAction.name = "BTCritterNurglingRoamAction"

BTCritterNurglingRoamAction.enter = function (self, unit, blackboard, t)
	blackboard.navigation_extension:set_max_speed(blackboard.breed.walk_speed)

	blackboard.action = self._tree_node.action_data

	self:start_idle_animation(unit, blackboard)
end

BTCritterNurglingRoamAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_max_speed(blackboard.breed.run_speed)
	self:start_idle_animation(unit, blackboard)

	blackboard.move_pos = nil
	blackboard.idle = nil
	blackboard.wait_time = nil
	blackboard.action = nil
end

BTCritterNurglingRoamAction.run = function (self, unit, blackboard, t)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	if not blackboard.move_pos then
		local move_pos = self:find_move_pos(blackboard, action)

		if move_pos then
			blackboard.move_pos = Vector3Box(move_pos)

			navigation_extension:move_to(move_pos)
		end
	end

	if navigation_extension:number_failed_move_attempts() > 0 then
		blackboard.move_pos = nil

		if blackboard.move_state ~= "idle" then
			self:start_idle_animation(unit, blackboard)
		end

		return "running"
	end

	if navigation_extension:is_following_path() and blackboard.move_state ~= "moving" then
		self:start_move_animation(unit, blackboard)
	end

	if navigation_extension:has_reached_destination() then
		return self:try_exit_state(unit, blackboard, action, t)
	end

	return "running"
end

BTCritterNurglingRoamAction.find_move_pos = function (self, blackboard, action)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local data = action.find_move_pos
	local center_pos = blackboard.altar_pos:unbox()

	return ConflictUtils.get_spawn_pos_on_circle(nav_world, center_pos, data.radius, data.spread, data.tries)
end

BTCritterNurglingRoamAction.start_move_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "walk")

	blackboard.move_state = "moving"
end

BTCritterNurglingRoamAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

BTCritterNurglingRoamAction.try_exit_state = function (self, unit, blackboard, action, t)
	if self:has_overlap(unit, blackboard, action) then
		blackboard.move_pos = nil

		return "running"
	end

	return "done"
end

local broadphase_query_result = {}

BTCritterNurglingRoamAction.has_overlap = function (self, unit, blackboard, action)
	local num_results = Broadphase.query(blackboard.group_blackboard.broadphase, blackboard.move_pos:unbox(), action.check_overlap_radius, broadphase_query_result)

	return num_results > 1
end
