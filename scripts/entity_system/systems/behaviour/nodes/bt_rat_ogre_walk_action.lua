require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRatOgreWalkAction = class(BTRatOgreWalkAction, BTNode)
BTRatOgreWalkAction.init = function (self, ...)
	BTRatOgreWalkAction.super.init(self, ...)

	return 
end
BTRatOgreWalkAction.name = "BTRatOgreWalkAction"
local walk_distance = 5
BTRatOgreWalkAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.wait_for_ogre = false
	local navigation_extension = blackboard.navigation_extension
	local patrol_goal_pos = nil

	if blackboard.patroling then
		patrol_goal_pos = blackboard.patrol_goal_pos:unbox()
	else
		blackboard.patroling = {}
		patrol_goal_pos = self.find_patrol_goal(self, unit, blackboard, walk_distance)

		if patrol_goal_pos then
			blackboard.patrol_goal_pos = Vector3Box(patrol_goal_pos)
		end
	end

	if patrol_goal_pos then
		local network_manager = Managers.state.network

		network_manager.anim_event(network_manager, unit, "to_combat")
		network_manager.anim_event(network_manager, unit, "walk_fwd")
		blackboard.locomotion_extension:set_rotation_speed(10)
		navigation_extension.move_to(navigation_extension, patrol_goal_pos)
		navigation_extension.set_max_speed(navigation_extension, blackboard.breed.patrol_walk_speed)
	else
		blackboard.ratogre_walking = false
	end

	return 
end
BTRatOgreWalkAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason == "aborted" then
		blackboard.wait_for_ogre = true
	else
		blackboard.ratogre_walking = false
	end

	return 
end
BTRatOgreWalkAction.run = function (self, unit, blackboard, t, dt)
	local locomotion = blackboard.locomotion_extension

	self.follow(self, unit, t, dt, blackboard, locomotion)

	return "running", "evaluate"
end
local hit_units = {}
BTRatOgreWalkAction.follow = function (self, unit, t, dt, blackboard, locomotion)
	if 1 < blackboard.navigation_extension:number_failed_move_attempts() then
		blackboard.move_state = nil
	end

	local navigation_extension = blackboard.navigation_extension
	local patrol_goal_pos = blackboard.patrol_goal_pos:unbox()
	local to_vec = patrol_goal_pos - POSITION_LOOKUP[unit]

	Vector3.set_z(to_vec, 0)

	local distance = Vector3.length(to_vec)

	if distance < 1 then
		local patrol_goal_pos = self.find_patrol_goal(self, unit, blackboard, walk_distance)
		blackboard.patrol_goal_pos = Vector3Box(patrol_goal_pos)
		local navigation_extension = blackboard.navigation_extension

		navigation_extension.move_to(navigation_extension, patrol_goal_pos)
		navigation_extension.set_max_speed(navigation_extension, blackboard.breed.patrol_walk_speed)
	end

	QuickDrawer:sphere(blackboard.patrol_goal_pos:unbox(), math.sin(t*7) + 1.2)

	if blackboard.move_state ~= "moving" and 0.5 < distance then
		blackboard.move_state = "moving"
		local action = self._tree_node.action_data
		local start_anim = nil

		Managers.state.network:anim_event(unit, start_anim or action.move_anim)
	elseif blackboard.move_state ~= "idle" and distance < 0.2 then
		blackboard.move_state = "idle"

		Managers.state.network:anim_event(unit, "idle")
	end

	return 
end
BTRatOgreWalkAction.find_patrol_goal = function (self, unit, blackboard, distance_passed_player)
	local conflict_director = Managers.state.conflict
	local info = conflict_director.main_path_info
	local player_info = conflict_director.main_path_player_info
	local main_paths = info.main_paths
	local goal_pos = nil
	local pos_at_path, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, POSITION_LOOKUP[unit])

	QuickDrawerStay:sphere(pos_at_path, 1.5, Color(0, 100, 255))

	if info.ahead_unit then
		local data = player_info[info.ahead_unit]
		local enemy_pos_at_path = data.path_pos:unbox()
		local enemy_travel_dist = data.travel_dist

		QuickDrawerStay:sphere(enemy_pos_at_path, 3, Color(255, 10, 255))

		if enemy_travel_dist < travel_dist then
			goal_pos = MainPathUtils.point_on_mainpath(main_paths, enemy_travel_dist - distance_passed_player)
		else
			goal_pos = MainPathUtils.point_on_mainpath(main_paths, enemy_travel_dist + distance_passed_player)
		end

		QuickDrawerStay:sphere(goal_pos, 2, Color(0, 10, 255))
	end

	return goal_pos
end

return 
