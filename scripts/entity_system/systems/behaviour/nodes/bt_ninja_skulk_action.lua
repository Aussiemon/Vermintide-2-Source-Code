require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTNinjaSkulkAction = class(BTNinjaSkulkAction, BTNode)
BTNinjaSkulkAction.name = "BTNinjaSkulkAction"
local position_lookup = POSITION_LOOKUP
local script_data = script_data
BTNinjaSkulkAction.init = function (self, ...)
	BTNinjaSkulkAction.super.init(self, ...)

	return 
end

local function debug3d(unit, text, color_name)
	if script_data.debug_ai_movement then
		Debug.world_sticky_text(position_lookup[unit], text, color_name)
	end

	return 
end

BTNinjaSkulkAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	LocomotionUtils.set_animation_driven_movement(unit, false)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")
	network_manager.anim_event(network_manager, unit, "move_fwd")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, blackboard.breed.run_speed)

	blackboard.target_skulk_time = t + 0.5
	blackboard.skulk_jump_tries = blackboard.skulk_jump_tries or 0
	local locomotion = blackboard.locomotion_extension

	locomotion.set_rotation_speed(locomotion, 5)
	locomotion.set_movement_type(locomotion, "snap_to_navmesh")

	if not blackboard.skulk_data then
		blackboard.skulk_data = {}
	end

	local skulk_data = blackboard.skulk_data

	if blackboard.skulk_pos then
		local pos = blackboard.skulk_pos:unbox()
		local ai_navigation = blackboard.navigation_extension

		ai_navigation.move_to(ai_navigation, pos)
	end

	return 
end
BTNinjaSkulkAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if reason == "aborted" then
	end

	blackboard.in_los = nil
	blackboard.action = nil
	blackboard.ninja_approach = false
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	return 
end
local test_points = {}
local close_range = 8
BTNinjaSkulkAction.run = function (self, unit, blackboard, t, dt)
	local locomotion = blackboard.locomotion_extension
	local breed = blackboard.breed

	if not blackboard.skulk_pos then
		local success = self.get_new_goal(self, unit, blackboard)

		if not success then
			aiprint("Tried to find new GR skulk goal, but could not")
		end

		local success = self.get_fallback_goal(self, unit, blackboard)

		if not success then
			debug3d(unit, "SkulkAction 2nd fallback goal 1", "green")
			aiprint("Failed finding 2nd fallback goal")

			return "done"
		end
	end

	if blackboard.dodging then
		if blackboard.dodging < t then
			blackboard.dodging = nil
		end
	else
		local dodge_vec, aim_vec = LocomotionUtils.in_crosshairs_dodge(unit, blackboard, t, 1, nil)

		if dodge_vec then
			self.dodge(self, unit, blackboard, dodge_vec, aim_vec)

			local network_manager = Managers.state.network

			network_manager.anim_event(network_manager, unit, "dodge_run_fwd")

			blackboard.dodging = t + 1.5
		end
	end

	if blackboard.dodge_pos then
		local dodge_pos = blackboard.dodge_pos:unbox()
		local pos = position_lookup[unit]
		local to_dodge_pos = dodge_pos - pos
		local rot = Unit.local_rotation(unit, 0)
		local forward = Quaternion.forward(rot)
		local dot = Vector3.dot(Vector3.normalize(to_dodge_pos), forward)

		if dot < 0 then
			blackboard.dodge_pos = nil
			local ai_navigation = blackboard.navigation_extension

			ai_navigation.move_to(ai_navigation, blackboard.skulk_pos:unbox())

			if script_data.debug_ai_movement then
				QuickDrawerStay:line(pos, pos + Vector3(0, 0, 3), Color(255, 0, 0))
			end
		else
			return "running"
		end
	end

	if not blackboard.urgency_to_engage or 0 < blackboard.urgency_to_engage then
		local dist = blackboard.target_dist
		local in_close_range = dist < close_range

		if blackboard.target_skulk_time < t or in_close_range then
			if dist < breed.jump_range then
				blackboard.skulk_jump_tries = blackboard.skulk_jump_tries + 1
				local rand = math.random()
				local growing_aggro = true

				if growing_aggro then
					blackboard.in_los = BTNinjaSkulkAction:check_free_los(unit, blackboard)

					if blackboard.in_los then
						blackboard.skulk_jump_tries = 0

						debug3d(unit, "SkulkAction in LOS done!", "green")

						return "done"
					end

					debug3d(unit, "SkulkAction not in LOS", "yellow")
				elseif in_close_range then
					blackboard.in_los = BTNinjaSkulkAction:check_free_los(unit, blackboard)

					if blackboard.in_los then
						blackboard.skulk_jump_tries = 0

						debug3d(unit, "SkulkAction in LOS(close) done!", "green")

						return "done"
					end

					self.get_new_goal(self, unit, blackboard)
					debug3d(unit, "SkulkAction not in LOS", "yellow")
				end
			else
				aiprint("Too far away to crazy jump")
			end

			blackboard.target_skulk_time = t + 0.5

			aiprint("skulk try failed:", blackboard.skulk_jump_tries)
		end
	else
		aiprint("GR no urgency to engage")
	end

	if script_data.debug_ai_movement then
		self.debug(self, unit, blackboard)
	end

	locomotion.set_wanted_rotation(locomotion, nil)

	local goal_pos = blackboard.skulk_pos:unbox()

	if Vector3.distance(goal_pos, position_lookup[unit]) < 3 then
		local success = self.get_new_goal(self, unit, blackboard)

		if success then
			return "running"
		end

		blackboard.in_los = LocomotionUtils.target_in_los(unit, blackboard)

		if blackboard.in_los then
			debug3d(unit, "SkulkAction in LOS first fallback", "green")

			return "done"
		end

		local success = self.get_fallback_goal(self, unit, blackboard)

		if not success then
			aiprint("Failed finding 2nd fallback goal")
			debug3d(unit, "SkulkAction in LOS 2nd fallback goal 2", "green")

			return "done"
		end
	end

	local bot = blackboard.navigation_extension._nav_bot
	local is_path_recomputation_needed = GwNavBot.is_path_recomputation_needed(bot)
	local is_path_found = GwNavBot.is_following_path(bot)

	if is_path_recomputation_needed or not is_path_found then
		Debug.text("NEED NEW GOAL")
		self.set_goal_at_target(self, unit, blackboard)
	end

	if blackboard.waiting_for_path then
		local is_path_found = GwNavBot.is_following_path(bot)

		if is_path_found then
			blackboard.waiting_for_path = nil

			if blackboard.move_state == "idle" then
				blackboard.move_state = "moving"

				Managers.state.network:anim_event(unit, "move_fwd")
			end
		elseif blackboard.move_state ~= "idle" then
			blackboard.move_state = "idle"

			Managers.state.network:anim_event(unit, "idle")
		end
	end

	return "running"
end
local segment_list = {}
local relative_positions = {
	0.4,
	0.5,
	-4,
	0.5,
	0,
	1.5
}
BTNinjaSkulkAction.check_free_los = function (self, unit, blackboard, data)
	local p2 = Unit.world_position(blackboard.target_unit, 0) + Vector3(0, 0, 0.2)
	local enemy_pos = POSITION_LOOKUP[blackboard.target_unit]

	if p2.z < enemy_pos.z then
		Vector3.set_z(p2, enemy_pos.z + 0.1)
	end

	local p1 = position_lookup[unit] + Vector3(0, 0, 0.2)
	local height_diff = p1.z - p2.z
	local in_los = nil

	if math.abs(height_diff) < 2 then
		local physics_world = World.get_data(blackboard.world, "physics_world")
		in_los = WeaponHelper.multi_ray_test(physics_world, p1, p2, relative_positions)
	else
		in_los = BTPrepareForCrazyJumpAction.test_trajectory(blackboard, p1, p2, segment_list)
	end

	return in_los
end
BTNinjaSkulkAction.try_dodge_pos = function (self, unit, blackboard, pos, dodge_pos)
	local success, z = GwNavQueries.triangle_from_position(blackboard.nav_world, dodge_pos, 3, 3)

	if success then
		Vector3.set_z(dodge_pos, z)

		if script_data.debug_ai_movement then
			QuickDrawerStay:sphere(pos, 0.25)
			QuickDrawerStay:sphere(dodge_pos, 0.25, Color(0, 0, 100))
			QuickDrawerStay:line(pos, dodge_pos)
		end

		local success = GwNavQueries.raycast(blackboard.nav_world, pos, dodge_pos)

		if success then
			if script_data.debug_ai_movement then
				QuickDrawerStay:line(dodge_pos, dodge_pos + Vector3(0, 0, 0.5), Color(0, 255, 120))
			end

			blackboard.navigation_extension:move_to(dodge_pos)

			return true
		end
	end

	return 
end
local dodge_dist = 2
local dodge_dist_check = dodge_dist - 0.3
BTNinjaSkulkAction.dodge = function (self, unit, blackboard, dodge_vec, aim_vec)
	local pos = position_lookup[unit]
	local velocity = blackboard.locomotion_extension:current_velocity()
	local normalized_velocity = Vector3.normalize(velocity)
	local normalized_dodge_vec = Vector3.normalize(dodge_vec)
	local left_right = Vector3.cross(-aim_vec, Vector3.up())

	if 0 < Vector3.cross(normalized_dodge_vec, aim_vec).z then
		left_right = -left_right
	end

	local dodge_dir = left_right*2 + normalized_velocity
	local dodge_pos = pos + dodge_dir*dodge_dist

	if self.try_dodge_pos(self, unit, blackboard, pos, dodge_pos) then
		local pass_check_pos = pos + dodge_dir*dodge_dist_check
		blackboard.dodge_pos = Vector3Box(pass_check_pos)

		return 
	end

	dodge_pos = pos - dodge_dir*dodge_dist

	if self.try_dodge_pos(self, unit, blackboard, pos, dodge_pos) then
		local pass_check_pos = pos - dodge_dir*dodge_dist_check
		blackboard.dodge_pos = Vector3Box(pass_check_pos)
	end

	return 
end
BTNinjaSkulkAction.in_crosshairs = function (self, unit, blackboard, t, data)
	local units = PLAYER_AND_BOT_UNITS

	for i = 1, #units, 1 do
		local player_unit = units[i]
		status_extension = ScriptUnit.extension(player_unit, "status_system")

		if data.aiming_at_me then
			if status_extension.aim_unit ~= data.aiming_at_me then
				data.aim_at_me_timer = t + 0.5
			elseif data.aim_at_me_timer < t then
				return true
			end
		end

		if status_extension.aim_unit then
			data.aiming_at_me = status_extension.aim_unit
		end
	end

	return 
end
BTNinjaSkulkAction.get_fallback_goal = function (self, unit, blackboard)
	table.clear(test_points)

	local target_pos = position_lookup[blackboard.target_unit]
	local pos = LocomotionUtils.new_random_goal(blackboard.nav_world, blackboard, target_pos, 1, 5, 10, test_points)

	if pos then
		blackboard.debug_state = "2nd fallback"

		aiprint("skulk around 2nd fallback -> success")

		blackboard.skulk_pos = Vector3Box(pos)
		local ai_navigation = blackboard.navigation_extension

		ai_navigation.move_to(ai_navigation, pos)

		return true
	end

	return 
end
BTNinjaSkulkAction.set_goal_at_target = function (self, unit, blackboard)
	local pos = POSITION_LOOKUP[blackboard.target_unit] + Vector3(0, 0, 0)
	pos = ConflictUtils.find_center_tri(blackboard.nav_world, pos)

	if pos then
		blackboard.skulk_pos:store(pos)

		blackboard.waiting_for_path = true

		blackboard.navigation_extension:move_to(pos)
	end

	return 
end
BTNinjaSkulkAction.get_new_goal = function (self, unit, blackboard)
	local target_unit = blackboard.target_unit

	if Unit.alive(target_unit) then
		local pos = nil
		local min_dist = 10
		local max_dist = 15
		local dir = blackboard.skulk_around_dir
		dir = dir or math.random(0, 1)*2 - 1
		blackboard.skulk_around_dir = dir
		local angle = math.random(10, 35)*dir
		local max_tries = 5
		pos = LocomotionUtils.outside_goal(blackboard.nav_world, POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit], min_dist, max_dist, angle, max_tries)

		if pos then
			blackboard.skulk_pos = Vector3Box(pos)
			local ai_navigation = blackboard.navigation_extension

			ai_navigation.move_to(ai_navigation, pos)

			return true
		end
	end

	return 
end
BTNinjaSkulkAction.anim_cb_dodge_finished = function (self, unit, params)
	blackboard.anim_cb_dodge_finished = nil

	return 
end
BTNinjaSkulkAction.debug = function (self, unit, blackboard)
	if blackboard.skulk_pos then
		local pos = blackboard.skulk_pos:unbox()

		QuickDrawer:sphere(pos + Vector3(0, 0, 1), 0.5, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.5), 0.25, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.725), 0.125, Color(255, 144, 43, 207))

		if blackboard.in_los then
			QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.25, Color(255, 144, 43, 43))
		end
	else
		local pos = position_lookup[unit]

		QuickDrawer:sphere(pos + Vector3(0, 0, 1), 0.5, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.55), 0.25, Color(255, 144, 43, 207))
		QuickDrawer:sphere(pos + Vector3(0, 0, 1.725), 0.125, Color(255, 144, 43, 207))
	end

	for i = 1, #test_points, 1 do
		local pos = test_points[i]:unbox()

		QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.5, Color(255, 43, 43, 207))
	end

	return 
end

return 
