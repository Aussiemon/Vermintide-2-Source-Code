-- chunkname: @scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_tether_skulk_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosSorcererTetherSkulkAction = class(BTChaosSorcererTetherSkulkAction, BTNode)

local BTChaosSorcererTetherSkulkAction = BTChaosSorcererTetherSkulkAction
local POSITION_LOOKUP = POSITION_LOOKUP

BTChaosSorcererTetherSkulkAction.init = function (self, ...)
	BTChaosSorcererTetherSkulkAction.super.init(self, ...)
end

BTChaosSorcererTetherSkulkAction.name = "BTChaosSorcererTetherSkulkAction"

BTChaosSorcererTetherSkulkAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local skulk_data = blackboard.skulk_data or {}

	blackboard.skulk_data = skulk_data
	skulk_data.direction = skulk_data.direction or action.direction or 1 - math.random(0, 1) * 2
	skulk_data.radius = skulk_data.radius or blackboard.target_dist
	skulk_data.last_reference_pos = skulk_data.last_reference_pos or Vector3Box()

	skulk_data.last_reference_pos:store(Vector3.zero())

	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		self:move_to(move_pos, unit, blackboard)
	end

	blackboard.health_extension = ScriptUnit.extension(unit, "health_system")

	blackboard.locomotion_extension:use_lerp_rotation(true)
	blackboard.locomotion_extension:set_rotation_speed(math.pi)
end

BTChaosSorcererTetherSkulkAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local skulk_data = blackboard.skulk_data
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end
	end

	skulk_data.animation_state = nil
	blackboard.action = nil

	blackboard.locomotion_extension:use_lerp_rotation(false)
	blackboard.locomotion_extension:set_rotation_speed(nil)

	if reason == "failed" then
		blackboard.target_unit = nil
	end
end

BTChaosSorcererTetherSkulkAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.target_unit) then
		return "failed"
	end

	local ai_navigation = blackboard.navigation_extension
	local path_found = ai_navigation:is_following_path()
	local failed_attempts = ai_navigation:number_failed_move_attempts()

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	if blackboard.vanish_timer and t < blackboard.vanish_timer then
		local ping_system = Managers.state.entity:system("ping_system")

		ping_system:remove_ping_from_unit(unit)

		return "running"
	end

	local position = blackboard.move_pos

	if position then
		local at_goal = self:at_goal(unit, blackboard)

		if at_goal or failed_attempts > 0 then
			blackboard.move_pos = nil
		end

		return "running"
	end

	position = self:get_skulk_target(unit, blackboard)

	if position then
		self:move_to(position, unit, blackboard)

		return "running"
	end

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	return "running"
end

BTChaosSorcererTetherSkulkAction.at_goal = function (self, unit, blackboard)
	local position_boxed = blackboard.move_pos
	local unit_position = POSITION_LOOKUP[unit]

	if not position_boxed then
		return false
	end

	local goal_position = position_boxed:unbox()

	if (goal_position[3] - unit_position[3])^2 > 0.5 then
		return false
	end

	return (goal_position[1] - unit_position[1])^2 + (goal_position[2] - unit_position[2])^2 < 1
end

BTChaosSorcererTetherSkulkAction.move_to = function (self, position, unit, blackboard)
	local ai_navigation = blackboard.navigation_extension

	ai_navigation:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTChaosSorcererTetherSkulkAction.idle = function (self, unit, blackboard)
	self:anim_event(unit, blackboard, "idle")

	blackboard.move_state = "idle"
end

BTChaosSorcererTetherSkulkAction.start_move_animation = function (self, unit, blackboard)
	local move_animation = blackboard.action.move_animation

	self:anim_event(unit, blackboard, move_animation)

	blackboard.move_state = "moving"
end

BTChaosSorcererTetherSkulkAction.anim_event = function (self, unit, blackboard, anim)
	local skulk_data = blackboard.skulk_data

	if skulk_data.animation_state ~= anim then
		Managers.state.network:anim_event(unit, anim)

		skulk_data.animation_state = anim
	end
end

local TRIES = 30

BTChaosSorcererTetherSkulkAction.get_skulk_target = function (self, unit, blackboard, teleporting)
	local target_unit = blackboard.target_unit

	if not target_unit then
		return
	end

	local action = blackboard.action
	local skulk_data = blackboard.skulk_data
	local direction = skulk_data.direction
	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local last_reference_pos = skulk_data.last_reference_pos:unbox()

	if Vector3.length_squared(last_reference_pos) <= 0 then
		last_reference_pos = unit_position
	end

	local to_target = target_position - last_reference_pos
	local dir = Vector3.normalize(to_target)
	local preferred_distance_variance = action.preferred_distance_variance or 0
	local preferred_distance = (action.preferred_distance or 20) + math.lerp(-preferred_distance_variance, preferred_distance_variance, math.random())
	local distance_before_turn = action.distance_before_turn or 5
	local circumference = preferred_distance * 2 * math.pi

	assert(distance_before_turn < circumference * 0.25, "preferred distance is too small to move %s units before turning. Minimum %s (quarter of the circumference)", distance_before_turn, circumference * 0.25)

	local pie_angle = math.tau * (distance_before_turn / circumference)
	local target_to_wanted = Quaternion.rotate(Quaternion.axis_angle(Vector3.up() * direction, pie_angle), -dir) * preferred_distance
	local wanted_pos_on_circle = target_position + target_to_wanted
	local to_circle = wanted_pos_on_circle - unit_position
	local raycango = GwNavQueries.raycango
	local nav_world = blackboard.nav_world
	local traverse_logic = blackboard.navigation_extension:traverse_logic()
	local angle_per_try = math.pi * 2 / TRIES
	local axis_angle = Quaternion.axis_angle(Vector3(0, 0, math.sign(Vector3.cross(target_to_wanted, to_circle)[3])), angle_per_try)
	local wanted_dir = Vector3.normalize(to_circle)
	local pos, fallback_pos

	for i = 1, TRIES do
		local new_pos = unit_position + wanted_dir * distance_before_turn

		new_pos = LocomotionUtils.pos_on_mesh(nav_world, new_pos, 5, 5) or new_pos

		local success, hit = raycango(nav_world, unit_position, new_pos, traverse_logic)

		if success then
			new_pos = LocomotionUtils.pos_on_mesh(nav_world, new_pos, 2, 2)

			if new_pos then
				pos = new_pos
			end

			break
		end

		if hit then
			local new_fallback_pos = LocomotionUtils.pos_on_mesh(nav_world, unit_position + (hit - unit_position) * 0.5, 1, 1)

			if new_fallback_pos then
				fallback_pos = new_fallback_pos
			end
		end

		wanted_dir = Quaternion.rotate(axis_angle, wanted_dir)
	end

	pos = pos or fallback_pos

	skulk_data.last_reference_pos:store(wanted_pos_on_circle)

	return pos
end
