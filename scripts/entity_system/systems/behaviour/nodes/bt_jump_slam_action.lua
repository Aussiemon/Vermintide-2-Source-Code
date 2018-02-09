require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local position_lookup = POSITION_LOOKUP
BTJumpSlamAction = class(BTJumpSlamAction, BTNode)
BTJumpSlamAction.init = function (self, ...)
	BTJumpSlamAction.super.init(self, ...)

	return 
end
BTJumpSlamAction.name = "BTJumpSlamAction"
BTJumpSlamAction.enter = function (self, unit, blackboard, t)
	local data = blackboard.jump_slam_data
	data.anim_jump_rot_var = Unit.animation_find_variable(unit, "jump_rotation")
	data.start_jump_time = t
	data.landing_time = t + data.time_of_flight
	blackboard.keep_target = true
	local animation_system = Managers.state.entity:system("animation_system")

	animation_system.start_anim_variable_update_by_time(animation_system, unit, data.anim_jump_rot_var, data.time_of_flight, 2)
	BTJumpSlamAction.progress_to_in_flight(blackboard, unit, data.initial_velociy_boxed:unbox())
	Managers.state.conflict:freeze_intensity_decay(15)

	local action = self._tree_node.action_data
	local bot_threats = action.bot_threats

	if bot_threats then
		local current_threat_index = 1
		local bot_threat = bot_threats[current_threat_index]
		local bot_threat_start_time = bot_threat.start_time_before_landing
		local landing_time = data.landing_time
		blackboard.create_bot_threat_at_t = math.max(landing_time - bot_threat_start_time, 0)
		blackboard.current_bot_threat_index = current_threat_index
		blackboard.bot_threats_data = bot_threats
	end

	blackboard.action = action

	return 
end
BTJumpSlamAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local animation_system = Managers.state.entity:system("animation_system")

	animation_system.set_update_anim_variable_done(animation_system, unit)

	blackboard.jump_slam_data.updating_jump_rot = false

	blackboard.navigation_extension:set_enabled(true)

	local data = blackboard.jump_slam_data

	if data.constrained then
		LocomotionUtils.constrain_on_clients(unit, false, Vector3.zero(), Vector3.zero())
	end

	if reason == "aborted" then
		LocomotionUtils.set_animation_driven_movement(unit, false, true)

		blackboard.keep_target = nil
		blackboard.jump_slam_data = nil
	end

	blackboard.action = nil
	blackboard.create_bot_threat_at_t = nil
	blackboard.current_bot_threat_index = nil
	blackboard.bot_threats_data = nil

	return 
end
BTJumpSlamAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.jump_slam_data
	local velocity = blackboard.locomotion_extension:current_velocity()
	local z_speed = velocity.z

	if z_speed < 0 and not data.constrained then
		data.constrained = true
		local constrain_max = POSITION_LOOKUP[unit] + Vector3.up()*2
		local constrain_min = data.target_pos:unbox()

		LocomotionUtils.constrain_on_clients(unit, true, constrain_min, constrain_max)
	end

	local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

	if create_bot_threat_at_t and create_bot_threat_at_t < t then
		local action = blackboard.action
		local bot_threats = blackboard.bot_threats_data
		local attack_rotation = data.attack_rotation:unbox()
		local current_bot_threat_index = blackboard.current_bot_threat_index
		local current_bot_threat = bot_threats[current_bot_threat_index]

		self._create_bot_aoe_threat(self, data, attack_rotation, action, current_bot_threat)

		local next_bot_threat_index = current_bot_threat_index + 1
		local next_bot_threat = bot_threats[next_bot_threat_index]

		if next_bot_threat then
			local landing_time = data.landing_time
			blackboard.create_bot_threat_at_t = landing_time - next_bot_threat.start_time_before_landing
			blackboard.current_bot_threat_index = next_bot_threat_index
		else
			blackboard.create_bot_threat_at_t = nil
			blackboard.current_bot_threat_index = nil
		end
	end

	if data.landing_time <= t + dt then
		BTJumpSlamAction.progress_to_landing(blackboard, unit, data)

		return "done"
	end

	return "running"
end
BTJumpSlamAction._calculate_sphere_collision = function (self, action, bot_threat, self_pos, self_rot)
	local radius = bot_threat.radius or action.radius
	local offset_forward = bot_threat.offset_forward or action.forward_offset
	local forward = Quaternion.forward(self_rot)
	local sphere_center = self_pos + forward*offset_forward

	return sphere_center, radius
end
BTJumpSlamAction._create_bot_aoe_threat = function (self, jump_data, attack_rotation, action, bot_threat)
	local bot_threat_duration = bot_threat.duration
	local hit_position = jump_data.target_pos:unbox()
	local obstacle_position, obstacle_size = self._calculate_sphere_collision(self, action, bot_threat, hit_position, attack_rotation)
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	ai_bot_group_system.aoe_threat_created(ai_bot_group_system, obstacle_position, "sphere", obstacle_size, nil, bot_threat_duration)

	return 
end
BTJumpSlamAction.progress_to_landing = function (blackboard, unit, data)
	LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	Managers.state.network:anim_event(unit, "attack_jump_land")

	local locomotion = blackboard.locomotion_extension

	locomotion.set_movement_type(locomotion, "snap_to_navmesh")
	locomotion.set_wanted_velocity(locomotion, Vector3.zero())
	locomotion.set_gravity(locomotion, nil)

	return 
end
BTJumpSlamAction.progress_to_in_flight = function (blackboard, unit, velocity)
	LocomotionUtils.set_animation_driven_movement(unit, false, true)

	local locomotion = blackboard.locomotion_extension

	locomotion.set_movement_type(locomotion, "script_driven")
	locomotion.set_gravity(locomotion, blackboard.breed.jump_slam_gravity)
	locomotion.set_wanted_velocity(locomotion, velocity)

	return 
end

return 
