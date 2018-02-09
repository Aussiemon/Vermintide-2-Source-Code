require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterSkulkAroundAction = class(BTPackMasterSkulkAroundAction, BTNode)
BTPackMasterSkulkAroundAction.init = function (self, ...)
	BTPackMasterSkulkAroundAction.super.init(self, ...)

	self.navigation_group_manager = Managers.state.conflict.navigation_group_manager

	return 
end
BTPackMasterSkulkAroundAction.name = "BTPackMasterSkulkAroundAction"
BTPackMasterSkulkAroundAction.enter = function (self, unit, blackboard, t)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, blackboard.breed.run_speed)

	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.skulk_time = blackboard.skulk_time or t + action.skulk_time
	blackboard.skulk_time_force_attack = blackboard.skulk_time_force_attack or t + action.skulk_time_force_attack
	blackboard.skulk_goal_get_fails = 0
	blackboard.skulk_debug_state = "enter"
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_rotation_speed(locomotion_extension, 5)

	blackboard.attack_cooldown = blackboard.attack_cooldown or 0

	return 
end
BTPackMasterSkulkAroundAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.skulk_in_los = nil
	blackboard.skulk_dogpile = nil
	blackboard.skulk_debug_state = nil
	blackboard.skulk_goal_get_fails = nil

	if reason == "aborted" then
		blackboard.move_state = nil
	elseif reason == "failed" then
		blackboard.target_unit = nil
		blackboard.skulk_time = nil
		blackboard.skulk_time_left = nil
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	return 
end
local test_points = {}
BTPackMasterSkulkAroundAction.run = function (self, unit, blackboard, t, dt)
	if not AiUtils.is_of_interest_to_packmaster(unit, blackboard.target_unit) then
		return "failed"
	end

	local locomotion_extension = blackboard.locomotion_extension
	local breed = blackboard.breed
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]

	if script_data.debug_ai_movement then
		blackboard.skulk_time_left = string.format("%.2f", blackboard.skulk_time - t)

		self.debug(self, unit, blackboard)
	end

	if blackboard.skulk_time < t and blackboard.attack_cooldown < t then
		local action = blackboard.action
		local waited_too_long = blackboard.skulk_time_force_attack < t
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")
		local dogpile = ai_slot_system.slots_count(ai_slot_system, blackboard.target_unit)
		local enough_aggro_on_player = action.dogpile_aggro_needed <= dogpile or script_data.ai_packmaster_ignore_dogpile

		if enough_aggro_on_player or waited_too_long then
			blackboard.skulk_pos = nil
			blackboard.skulk_around_dir = nil

			return "done"
		end

		blackboard.skulk_dogpile = dogpile
		blackboard.skulk_time = t + 1
	end

	if not blackboard.skulk_pos then
		self.get_new_goal(self, unit, blackboard)

		blackboard.skulk_debug_state = "get_new_goal"

		return "running"
	end

	local navigation_extension = blackboard.navigation_extension
	local is_computing_path = navigation_extension.is_computing_path(navigation_extension)

	if blackboard.move_state ~= "moving" and not is_computing_path then
		local network_manager = Managers.state.network
		blackboard.move_state = "moving"

		network_manager.anim_event(network_manager, unit, blackboard.action.skulk_animation or "move_fwd")
		navigation_extension.set_enabled(navigation_extension, true)
	end

	local goal_pos = blackboard.skulk_pos:unbox()
	local position = POSITION_LOOKUP[unit]
	local goal_distance_sq = Vector3.distance_squared(goal_pos, position)

	locomotion_extension.set_wanted_rotation(locomotion_extension, nil)

	if goal_distance_sq < 9 then
		local goal_found = self.get_new_goal(self, unit, blackboard)

		if goal_found then
			blackboard.skulk_debug_state = "new goal found"
		else
			table.clear(test_points)

			local pos = LocomotionUtils.new_random_goal(blackboard.nav_world, blackboard, target_pos, 15, 30, 10, test_points)

			if pos then
				blackboard.skulk_debug_state = "fallback"
				blackboard.skulk_pos = Vector3Box(pos)

				navigation_extension.move_to(navigation_extension, pos)
			else
				blackboard.skulk_debug_state = "fallback fail"
			end
		end
	end

	local distance_to_target_squared = Vector3.distance_squared(target_pos, position)
	local melee_override_distance_sqr = blackboard.action.melee_override_distance_sqr

	if distance_to_target_squared < melee_override_distance_sqr and blackboard.attack_cooldown < t then
		blackboard.skulk_pos = nil
		blackboard.skulk_around_dir = nil

		return "done"
	end

	return "running"
end
BTPackMasterSkulkAroundAction.get_new_goal = function (self, unit, blackboard)
	local target_unit = blackboard.target_unit

	if Unit.alive(target_unit) then
		local fails = blackboard.skulk_goal_get_fails
		local pos = nil
		local min_dist = 10
		local max_dist = 25
		local dir = blackboard.skulk_around_dir
		dir = dir or math.random(0, 1)*2 - 1
		blackboard.skulk_around_dir = dir
		local angle = math.random(10, 180)*dir
		local above_below = fails*5 + 5
		pos = LocomotionUtils.outside_goal(blackboard.nav_world, POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit], min_dist, max_dist, angle, 5, above_below, above_below)

		if pos then
			blackboard.skulk_goal_get_fails = 0
			blackboard.skulk_pos = Vector3Box(pos)
			local navigation_extension = blackboard.navigation_extension

			navigation_extension.move_to(navigation_extension, pos)

			return true
		else
			blackboard.skulk_goal_get_fails = fails + 1
		end
	end

	return 
end
BTPackMasterSkulkAroundAction.debug = function (self, unit, blackboard)
	local pos = POSITION_LOOKUP[unit]

	if blackboard.skulk_pos then
		local skulk_pos = blackboard.skulk_pos:unbox()

		QuickDrawer:sphere(skulk_pos + Vector3(0, 0, 1), 0.5, Color(255, 144, 43, 207))
		QuickDrawer:sphere(skulk_pos + Vector3(0, 0, 1.5), 0.25, Color(255, 144, 43, 207))
		QuickDrawer:sphere(skulk_pos + Vector3(0, 0, 1.725), 0.125, Color(255, 144, 43, 207))

		if blackboard.in_los then
			QuickDrawer:sphere(skulk_pos + Vector3(0, 0, 2), 0.25, Color(255, 144, 43, 43))
		end
	else
		QuickDrawer:sphere(pos + Vector3(0, 0, 1), 0.5, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.55), 0.25, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.725), 0.125, Color(255, 144, 43, 207))
	end

	if not blackboard.skulk_in_los then
		QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.25, Colors.get("red"))
	end

	for i = 1, #test_points, 1 do
		local pos = test_points[i]:unbox()

		QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.5, Color(255, 43, 43, 207))
	end

	return 
end

return 
