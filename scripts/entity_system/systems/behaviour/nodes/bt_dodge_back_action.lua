require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTDodgeBackAction = class(BTDodgeBackAction, BTNode)

BTDodgeBackAction.init = function (self, ...)
	BTDodgeBackAction.super.init(self, ...)
end

BTDodgeBackAction.name = "BTDodgeBackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTDodgeBackAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.active_node = BTDodgeBackAction
	blackboard.start_finished = nil
	blackboard.start_started_since = t
	local navigation_extension = blackboard.navigation_extension
	local action = blackboard.action
	local dodge_back_animation = action.dodge_back_animation
	local new_speed = action.move_speed

	if new_speed then
		navigation_extension:set_max_speed(new_speed)
	end

	local animation = randomize(dodge_back_animation)
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, animation)

	blackboard.move_state = "moving"
	local position = POSITION_LOOKUP[unit]
	local target_position = POSITION_LOOKUP[blackboard.target_unit]
	local wanted_dodge_direction = Vector3.normalize(position - target_position)
	local wanted_dodge_distance = action.dodge_distance
	local wanted_dodge_position = position + wanted_dodge_direction * wanted_dodge_distance
	local above = 2
	local below = 2
	local nav_world = blackboard.nav_world
	local is_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, wanted_dodge_position, above, below)
	local position_on_navmesh = nil

	if is_on_navmesh then
		position_on_navmesh = Vector3.copy(wanted_dodge_position)
		position_on_navmesh.z = altitude
	else
		local horizontal_limit = 1
		local distance_from_nav_border = 0.05
		position_on_navmesh = GwNavQueries.inside_position_from_outside_position(nav_world, wanted_dodge_position, above, below, horizontal_limit, distance_from_nav_border)
	end

	if position_on_navmesh then
		navigation_extension:move_to(position_on_navmesh)

		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system:do_slot_search(unit, false)
	end
end

BTDodgeBackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.start_finished = nil
	blackboard.start_started_since = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	blackboard.active_node = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTDodgeBackAction.run = function (self, unit, blackboard, t, dt)
	Profiler.start("BTDodgeBackAction")

	if blackboard.start_finished or t - blackboard.start_started_since > 10 then
		Profiler.stop("BTDodgeBackAction")

		return "done"
	end

	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(rotation)
	Profiler.stop("BTDodgeBackAction")

	return "running"
end

BTDodgeBackAction.anim_cb_combat_step_stop = function (self, unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	if navigation_extension:is_following_path() then
		navigation_extension:stop()
	end
end

return
