require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVictimGrabbedThrowAwayAction = class(BTVictimGrabbedThrowAwayAction, BTNode)
BTVictimGrabbedThrowAwayAction.name = "BTVictimGrabbedThrowAwayAction"
local PLAYER_POSITIONS = PLAYER_POSITIONS
local PLAYER_UNITS = PLAYER_UNITS
BTVictimGrabbedThrowAwayAction.init = function (self, ...)
	BTVictimGrabbedThrowAwayAction.super.init(self, ...)

	return 
end
BTVictimGrabbedThrowAwayAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local animation = "attack_grabbed_throw"
	local action = self._tree_node.action_data
	blackboard.action = action

	network_manager.anim_event(network_manager, unit, animation)

	if blackboard.move_state ~= "idle" then
		blackboard.move_state = "idle"
	end

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	if Unit.alive(blackboard.victim_grabbed) then
		StatusUtils.set_grabbed_by_chaos_spawn_status_network(blackboard.victim_grabbed, "thrown_away")
	end

	blackboard.anim_cb_finished = nil
	blackboard.chaos_spawn_is_throwing = true
	blackboard.grabbed_state = "throw_away"
	blackboard.throw_direction = Vector3Box()
	local ray_length = 3.5
	local can_go = nil

	if Unit.alive(blackboard.target_unit) then
		local nav_world = blackboard.nav_world
		local pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_unit]
		local block_check_pos = pos + (target_pos - pos)*ray_length
		can_go = GwNavQueries.raycango(nav_world, pos, block_check_pos)
	end

	if not can_go then
		local new_direction = self.find_throw_direction(self, unit, blackboard, ray_length)

		if new_direction then
			blackboard.throw_direction:store(new_direction)

			blackboard.use_stored_throw_direction = true
		else
			blackboard.drop_grabbed_player = true
		end
	end

	return 
end
BTVictimGrabbedThrowAwayAction.find_throw_direction = function (self, unit, blackboard, ray_length)
	local pos = POSITION_LOOKUP[unit] + Vector3.up()
	local rot = Unit.local_rotation(unit, 0)
	local nav_world = blackboard.nav_world

	for dir = 1, 4, 1 do
		local qua = Quaternion.forward

		if dir == 2 or dir == 4 then
			qua = Quaternion.right
		end

		local direction = qua(rot)

		if dir == 3 or dir == 4 then
			direction = -direction
		end

		local space_check_pos = pos + direction*ray_length
		local can_go = GwNavQueries.raycango(nav_world, pos, space_check_pos)

		if can_go then
			return direction
		end
	end

	return nil
end
BTVictimGrabbedThrowAwayAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.anim_cb_throw = false

	if Unit.alive(blackboard.victim_grabbed) and (reason == "aborted" or (blackboard.drop_grabbed_player and blackboard.victim_grabbed)) then
		StatusUtils.set_grabbed_by_chaos_spawn_network(blackboard.victim_grabbed, false, unit)
	end

	blackboard.attack_grabbed_attacks = 0
	blackboard.has_grabbed_victim = false
	blackboard.victim_grabbed = nil
	blackboard.chaos_spawn_is_throwing = false
	blackboard.grabbed_state = nil
	blackboard.wants_to_throw = false
	blackboard.throw_direction = nil
	blackboard.use_stored_throw_direction = nil
	blackboard.drop_grabbed_player = nil
	blackboard.chew_attacks_done = 0

	return 
end
BTVictimGrabbedThrowAwayAction.catapult_player = function (self, unit, blackboard, throw_speed, throw_speed_z)
	local victim_unit = blackboard.victim_grabbed
	local victim_pos = POSITION_LOOKUP[victim_unit]
	local target_pos = nil

	if blackboard.target_unit then
		target_pos = POSITION_LOOKUP[blackboard.target_unit]
	else
		target_pos = victim_pos + Quaternion.forward(Unit.local_rotation(unit, 0))*10
	end

	local saved_throw_dir = blackboard.use_stored_throw_direction and blackboard.throw_direction:unbox()
	local throw_dir = saved_throw_dir or Vector3.normalize(target_pos - victim_pos)
	local velocity = throw_speed*throw_dir

	if throw_speed_z then
		Vector3.set_z(velocity, throw_speed_z)
	end

	StatusUtils.set_grabbed_by_chaos_spawn_network(victim_unit, false, unit)
	StatusUtils.set_catapulted_network(victim_unit, true, velocity)

	blackboard.anim_cb_throw = nil

	return 
end
local Unit_alive = Unit.alive
BTVictimGrabbedThrowAwayAction.run = function (self, unit, blackboard, t, dt)
	local should_exit = blackboard.attack_finished or not Unit.alive(blackboard.victim_grabbed) or blackboard.drop_grabbed_player

	if should_exit then
		return "done"
	elseif blackboard.anim_cb_throw then
		self.catapult_player(self, unit, blackboard, 25, 1)
	end

	local target_unit = blackboard.target_unit
	local saved_throw_dir = blackboard.use_stored_throw_direction and blackboard.throw_direction:unbox()
	local rot = (saved_throw_dir and Quaternion.look(saved_throw_dir)) or (Unit_alive(target_unit) and LocomotionUtils.rotation_towards_unit_flat(unit, target_unit))

	blackboard.locomotion_extension:set_wanted_rotation(rot)

	return "running"
end

return 
