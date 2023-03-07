require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSmashDoorAction = class(BTSmashDoorAction, BTNode)
BTSmashDoorAction.StateInit = class(BTSmashDoorAction.StateInit)
BTSmashDoorAction.StateMovingToSmartObjectEntrance = class(BTSmashDoorAction.StateMovingToSmartObjectEntrance)
BTSmashDoorAction.StateAttacking = class(BTSmashDoorAction.StateAttacking)
BTSmashDoorAction.StateOpening = class(BTSmashDoorAction.StateOpening)
BTSmashDoorAction.StateMovingToSmartObjectExit = class(BTSmashDoorAction.StateMovingToSmartObjectExit)
BTSmashDoorAction.StateExitingSmartObject = class(BTSmashDoorAction.StateExitingSmartObject)

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTSmashDoorAction.init = function (self, ...)
	BTSmashDoorAction.super.init(self, ...)
end

BTSmashDoorAction.name = "BTSmashDoorAction"

BTSmashDoorAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local smart_object = blackboard.next_smart_object_data
	local target_unit = smart_object.smart_object_data.unit
	blackboard.action = action
	blackboard.is_smashing_door = nil
	blackboard.is_opening_door = nil
	blackboard.active_node = BTSmashDoorAction
	blackboard.attacks_done = 0
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.smash_door = blackboard.smash_door or {}
	blackboard.smash_door.done = false
	blackboard.smash_door.frames_to_done = nil
	blackboard.smash_door.failed = false
	blackboard.smash_door.target_unit = target_unit
	local params = {
		unit = unit,
		blackboard = blackboard,
		action = action,
		entrance_pos = smart_object.entrance_pos,
		exit_pos = smart_object.exit_pos,
		exit_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(smart_object.exit_pos:unbox() - smart_object.entrance_pos:unbox()))),
		start_t = t
	}
	blackboard.smash_door.state_machine = StateMachine:new(self, BTSmashDoorAction.StateInit, params)
	local rotation_speed = action.rotation_speed or 10
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_affected_by_gravity(false)
	locomotion_extension:set_movement_type("snap_to_navmesh")
	locomotion_extension:set_rotation_speed(rotation_speed)

	blackboard.spawn_to_running = nil
end

BTSmashDoorAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_affected_by_gravity(true)
		locomotion_extension:set_movement_type("snap_to_navmesh")
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	if navigation_extension:is_using_smart_object() then
		local success = navigation_extension:use_smart_object(false)

		if not success then
			local target_unit = blackboard.smash_door.target_unit

			if ALIVE[target_unit] then
				local door_extension = ScriptUnit.extension(target_unit, "door_system")

				door_extension:register_breed_failed_leaving_smart_object(unit)
			end
		end
	end

	blackboard.action = nil
	blackboard.is_smart_objecting = nil
	blackboard.is_smashing_door = nil
	blackboard.is_opening_door = nil
	blackboard.smash_door.target_unit = nil
end

BTSmashDoorAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.smash_door.target_unit) then
		return "failed"
	end

	if blackboard.attack_aborted then
		return "failed"
	end

	if blackboard.smash_door.failed then
		return "failed"
	end

	if blackboard.smash_door.done then
		local frames_to_done = blackboard.smash_door.frames_to_done or 2

		if frames_to_done == 0 then
			return "done"
		end

		blackboard.smash_door.frames_to_done = frames_to_done - 1
	end

	blackboard.smash_door.state_machine:update(dt, t)

	return "running"
end

BTSmashDoorAction.StateInit.on_enter = function (self, params)
	self.blackboard = params.blackboard
	self.unit = params.unit
	self.entrance_pos = params.entrance_pos
end

BTSmashDoorAction.StateInit.update = function (self, dt, t)
	local unit = self.unit
	local blackboard = self.blackboard
	local unit_position = POSITION_LOOKUP[unit]
	local distance_squared = Vector3.distance_squared(self.entrance_pos:unbox(), unit_position)

	if distance_squared < 1 then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_wanted_velocity(Vector3.zero())

		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(false)

		if navigation_extension:use_smart_object(true) then
			blackboard.is_smart_objecting = true
			blackboard.is_smashing_door = true

			return BTSmashDoorAction.StateMovingToSmartObjectEntrance
		else
			print("BTSmashDoorAction - Failing to use smart object")

			blackboard.smash_door.failed = true
		end
	end
end

BTSmashDoorAction.StateMovingToSmartObjectEntrance.on_enter = function (self, params)
	self.blackboard = params.blackboard
	self.unit = params.unit
	self.target_unit = params.blackboard.smash_door.target_unit
	self.entrance_pos = params.entrance_pos
	self.exit_lookat_direction = params.exit_lookat_direction

	if params.action.move_anim then
		Managers.state.network:anim_event(params.unit, params.action.move_anim)
	end
end

BTSmashDoorAction.StateMovingToSmartObjectEntrance.update = function (self, dt, t)
	local unit = self.unit
	local blackboard = self.blackboard
	local action = blackboard.action
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_pos = self.entrance_pos:unbox()
	local vector_to_target = entrance_pos - unit_position
	local distance_to_target_sq = Vector3.length_squared(vector_to_target)
	local wanted_distance_sq = (action.door_attack_distance or 0.1)^2

	if distance_to_target_sq > wanted_distance_sq then
		local look_direction_wanted = self.exit_lookat_direction:unbox()
		local direction_to_target = Vector3.normalize(vector_to_target)
		local locomotion_extension = blackboard.locomotion_extension
		local move_speed = action.move_speed or blackboard.breed.walk_speed

		locomotion_extension:set_wanted_velocity(direction_to_target * move_speed)
		locomotion_extension:set_wanted_rotation(Quaternion.look(look_direction_wanted))
	else
		local preferred_door_action = blackboard.preferred_door_action

		if preferred_door_action and preferred_door_action == "open" then
			local target_unit = self.target_unit
			local door_extension = ScriptUnit.extension(target_unit, "door_system")

			if door_extension.num_attackers == 0 then
				return BTSmashDoorAction.StateOpening
			end
		end

		return BTSmashDoorAction.StateAttacking
	end
end

BTSmashDoorAction.StateOpening.on_enter = function (self, params)
	local blackboard = params.blackboard
	local unit = params.unit
	local action = params.action
	local target_unit = blackboard.smash_door.target_unit
	self.blackboard = blackboard
	self.unit = unit
	self.action = action
	self.target_unit = target_unit
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local rotation = LocomotionUtils.rotation_towards_unit(unit, target_unit)

	locomotion_extension:set_wanted_rotation(rotation)
end

BTSmashDoorAction.StateOpening.update = function (self, dt, t)
	local blackboard = self.blackboard
	local target_unit = self.target_unit
	local health_extension = ScriptUnit.extension(target_unit, "health_system")

	if not health_extension:is_alive() then
		return BTSmashDoorAction.StateMovingToSmartObjectExit
	end

	local door_extension = ScriptUnit.extension(target_unit, "door_system")

	if door_extension:is_open() and not door_extension:is_opening() then
		return BTSmashDoorAction.StateMovingToSmartObjectExit
	elseif not door_extension:is_open() then
		local unit = self.unit

		door_extension:interacted_with(unit)

		blackboard.is_opening_door = true
	end
end

BTSmashDoorAction.StateAttacking.on_enter = function (self, params)
	local target_unit = params.blackboard.smash_door.target_unit
	local blackboard = params.blackboard
	self.blackboard = blackboard
	self.unit = params.unit
	self.action = params.action
	self.target_unit = target_unit
	self.start_t = params.start_t
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local door_extension = ScriptUnit.extension(target_unit, "door_system")
	door_extension.num_attackers = door_extension.num_attackers + 1

	self:attack()
end

BTSmashDoorAction.StateAttacking.update = function (self, dt, t)
	local blackboard = self.blackboard
	local target_unit = self.target_unit
	local health_extension = ScriptUnit.extension(target_unit, "health_system")
	local door_extension = ScriptUnit.extension(target_unit, "door_system")

	if not health_extension:is_alive() or door_extension:is_open() and not door_extension:is_opening() then
		if door_extension.move_to_exit_when_opened then
			return BTSmashDoorAction.StateMovingToSmartObjectExit
		else
			blackboard.smash_door.done = true
		end
	end

	if blackboard.attack_finished then
		self:attack()

		if door_extension.ai_attack_re_eval_time and t > door_extension.ai_attack_re_eval_time + self.start_t then
			blackboard.attack_aborted = true
		end
	end
end

BTSmashDoorAction.StateAttacking.on_exit = function (self)
	local target_unit = self.target_unit
	local door_extension = ScriptUnit.extension(target_unit, "door_system")
	door_extension.num_attackers = door_extension.num_attackers - 1
end

BTSmashDoorAction.StateAttacking.attack = function (self)
	local target_unit = self.target_unit
	local unit = self.unit
	local blackboard = self.blackboard
	local action = self.action
	local rotation = LocomotionUtils.rotation_towards_unit(unit, target_unit)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(rotation)

	if action.attack_anim then
		local anim = randomize(action.attack_anim)
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, anim)

		blackboard.attack_finished = false
	else
		AiUtils.kill_unit(blackboard.smash_door.target_unit, unit)

		blackboard.attack_finished = true
	end
end

BTSmashDoorAction.StateMovingToSmartObjectExit.on_enter = function (self, params)
	self.blackboard = params.blackboard
	self.unit = params.unit
	self.exit_pos = params.exit_pos
	self.exit_lookat_direction = params.exit_lookat_direction

	if params.action.move_anim then
		Managers.state.network:anim_event(params.unit, params.action.move_anim)
	end
end

BTSmashDoorAction.StateMovingToSmartObjectExit.update = function (self, dt, t)
	local unit = self.unit
	local blackboard = self.blackboard
	local unit_position = POSITION_LOOKUP[unit]
	local exit_pos = self.exit_pos:unbox()
	local vector_to_target = Vector3.flat(exit_pos - unit_position)
	local distance_to_target_sq = Vector3.length_squared(vector_to_target)
	local wanted_distance_sq = 0.010000000000000002

	if distance_to_target_sq > wanted_distance_sq then
		local look_direction_wanted = self.exit_lookat_direction:unbox()
		local direction_to_target = Vector3.normalize(vector_to_target)
		local locomotion_extension = blackboard.locomotion_extension
		local move_speed = blackboard.action.move_speed or blackboard.breed.walk_speed

		locomotion_extension:set_wanted_velocity(direction_to_target * move_speed)
		locomotion_extension:set_wanted_rotation(Quaternion.look(look_direction_wanted))
	else
		blackboard.smash_door.done = true
	end
end

BTSmashDoorAction.anim_cb_damage = function (self, unit, blackboard)
	if blackboard.smash_door.target_unit then
		local action = blackboard.action

		AiUtils.damage_target(blackboard.smash_door.target_unit, unit, action, action.damage)
	end
end
