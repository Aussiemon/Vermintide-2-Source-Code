require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRatlingGunnerShootAction = class(BTRatlingGunnerShootAction, BTNode)
local PI = math.pi
local TWO_PI = PI * 2
local BOT_THREAT_UPDATE_TIME = 1
CLIENT_CONTROLLED_RATLING_GUN = true

BTRatlingGunnerShootAction.init = function (self, ...)
	BTRatlingGunnerShootAction.super.init(self, ...)
end

BTRatlingGunnerShootAction.name = "BTRatlingGunnerShootAction"

BTRatlingGunnerShootAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local data = blackboard.attack_pattern_data or {}
	local new_target, node_name, old_target_visible = PerceptionUtils.pick_ratling_gun_target(unit, blackboard)
	local target_unit = new_target or data.target_unit
	blackboard.action = action
	data.target_unit = target_unit
	data.target_node_name = node_name or data.target_node_name

	if not Unit.alive(target_unit) then
		return
	end

	data.shoot_start = nil
	data.shots_fired = nil
	data.time_between_shots_at_start = 1 / action.fire_rate_at_start
	data.time_between_shots_at_end = 1 / action.fire_rate_at_end
	data.max_fire_rate_at_percentage_modifier = 1 / action.max_fire_rate_at_percentage
	data.target_switch_distance_squared = AiUtils.random(action.target_switch_distance[1], action.target_switch_distance[2])^2
	data.target_obscured = false
	data.target_check = t + 0.2 + Math.random() * 0.1
	data.peer_id = data.peer_id or Network.peer_id()
	data.update_bot_threat_t = t
	self._use_obstacle = false

	if self._use_obstacle then
		local lof_nav_obs, aos_nav_obs = self:_create_nav_obstacles(unit, target_unit, blackboard.nav_world, action)
		data.line_of_fire_nav_obstacle = lof_nav_obs
		data.arc_of_sight_nav_obstacle = aos_nav_obs
	end

	blackboard.first_shots_fired = true
	blackboard.attack_pattern_data = data

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	data.shoot_direction_box = Vector3Box(Quaternion.forward(Unit.world_rotation(unit, Unit.node(unit, "c_spine"))))

	self:_start_align_towards_target(unit, blackboard, data, target_unit, t)
	blackboard.locomotion_extension:use_lerp_rotation(false)
	self:_notify_attacking(unit, target_unit)
end

BTRatlingGunnerShootAction._create_nav_obstacles = function (self, unit, target_unit, nav_world, action)
	local pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[target_unit]
	local local_center = Vector3(0, 0, 0)
	local half_extents_fire = action.line_of_fire_nav_obstacle_half_extents:unbox()
	local half_extents_sight = action.arc_of_sight_nav_obstacle_half_extents:unbox()
	local is_exclusive = false
	local color = Color(255, 0, 0)
	local layer_id = LAYER_ID_MAPPING[action.nav_obstacle_layer_name]
	local fire_nav_obstacle = GwNavBoxObstacle.create(nav_world, pos, local_center, half_extents_fire, is_exclusive, color, layer_id)
	local sight_nav_obstacle = GwNavBoxObstacle.create(nav_world, pos, local_center, half_extents_sight, is_exclusive, color, layer_id)

	return fire_nav_obstacle, sight_nav_obstacle
end

BTRatlingGunnerShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.anim_cb_attack_shoot_start_finished = nil
	blackboard.anim_cb_attack_shoot_random_shot = nil
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "BTRatlingGunnerShootAction"
	})

	drawer:reset()

	local data = blackboard.attack_pattern_data
	data.shoot_direction_box = nil
	data.aim_position_box = nil
	data.current_aim_rotation = nil
	data.shoot_duration = nil
	data.shoot_start = nil
	data.shots_fired = nil
	data.time_between_shots_at_start = nil
	data.time_between_shots_at_end = nil
	data.max_fire_rate_at_percentage_modifier = nil
	data.target_switch_distance_squared = nil
	data.target_obscured = nil
	data.last_known_target_position = nil
	data.last_known_unit_position = nil
	data.last_fired = t

	if data.is_shooting then
		self:stop_shooting(unit, data)
	end

	if self._use_obstacle and data.line_of_fire_nav_obstacle and data.arc_of_sight_nav_obstacle then
		GwNavBoxObstacle.destroy(data.line_of_fire_nav_obstacle)
		GwNavBoxObstacle.destroy(data.arc_of_sight_nav_obstacle)

		data.line_of_fire_nav_obstacle = nil
		data.arc_of_sight_nav_obstacle = nil
	end

	self:_notify_no_longer_attacking(unit, data.target_unit)

	if not destroy then
		blackboard.locomotion_extension:use_lerp_rotation(true)
	end

	blackboard.navigation_extension:set_enabled(true)
end

BTRatlingGunnerShootAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.attack_pattern_data
	local target_unit = data.target_unit

	if not HEALTH_ALIVE[target_unit] then
		return "done"
	end

	if data.state == "align" then
		local switched_target = self:_update_target(unit, blackboard, self._tree_node.action_data, data, t, dt)

		if switched_target then
			self:_start_align_towards_target(unit, blackboard, data, data.target_unit, t)
		end

		local done = self:_update_align_towards_target(unit, blackboard, t, dt)

		if done and not script_data.disable_ratling_gun_fire then
			self:_end_align_towards_target(unit, data)
		end

		return "running"
	elseif data.state == "ready" then
		local realign = self:_aim_at_target(unit, blackboard, t, dt)
		local switched_target = self:_update_target(unit, blackboard, self._tree_node.action_data, data, t, dt)

		if realign or switched_target then
			self:_start_align_towards_target(unit, blackboard, data, data.target_unit, t)

			return "running"
		end

		if blackboard.anim_cb_attack_shoot_random_shot then
			self:_start_shooting(blackboard, unit, data, t)
		end

		return "running"
	elseif data.state == "shoot" then
		local switched_target = self:_update_target(unit, blackboard, self._tree_node.action_data, data, t, dt)

		if switched_target then
			self:stop_shooting(unit, data)
			self:_start_align_towards_target(unit, blackboard, data, data.target_unit, t)

			return "running"
		end

		local realign = self:_aim_at_target(unit, blackboard, t, dt)

		if realign then
			self:stop_shooting(unit, data)
			self:_start_align_towards_target(unit, blackboard, data, data.target_unit, t)

			return "running"
		end

		self:_update_shooting(unit, blackboard, data, t, dt)

		if t > data.shoot_start + data.shoot_duration then
			return "done"
		end

		return "running"
	end
end

BTRatlingGunnerShootAction._notify_attacking = function (self, self_unit, target_unit)
	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(self_unit, target_unit, "ratling_gun_fire")

	if Unit.alive(target_unit) then
		local status_extension = ScriptUnit.extension(target_unit, "status_system")
		status_extension.under_ratling_gunner_attack = true
	end
end

BTRatlingGunnerShootAction._notify_no_longer_attacking = function (self, self_unit, target_unit)
	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(self_unit, target_unit, "ratling_gun_fire")

	if Unit.alive(target_unit) then
		local status_extension = ScriptUnit.extension(target_unit, "status_system")
		status_extension.under_ratling_gunner_attack = false
	end
end

BTRatlingGunnerShootAction.stop_shooting = function (self, unit, data)
	data.is_shooting = nil
	local owner_unit_id = Managers.state.unit_storage:go_id(unit)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_ai_weapon_shoot_end", owner_unit_id)
	Managers.state.entity:system("weapon_system"):rpc_ai_weapon_shoot_end(Network.peer_id(), owner_unit_id)

	if self._use_obstacle then
		GwNavBoxObstacle.remove_from_world(data.line_of_fire_nav_obstacle)
		GwNavBoxObstacle.remove_from_world(data.arc_of_sight_nav_obstacle)
	end

	if CLIENT_CONTROLLED_RATLING_GUN then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_clients_continuous_shoot_stop", owner_unit_id)
	end
end

BTRatlingGunnerShootAction._update_shooting = function (self, unit, blackboard, data, t, dt)
	local time_in_shoot_action = t - data.shoot_start
	local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.shoot_duration * data.max_fire_rate_at_percentage_modifier, 0, 1)
	local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
	local shots_to_fire = math.floor(time_in_shoot_action / current_time_between_shots) + 1 - data.shots_fired

	for i = 1, shots_to_fire do
		data.shots_fired = data.shots_fired + 1

		self:_shoot(unit, blackboard, t, dt)
	end

	if data.update_bot_threat_t < t then
		self:_create_bot_threat_box(unit, data, BOT_THREAT_UPDATE_TIME)

		data.update_bot_threat_t = t + BOT_THREAT_UPDATE_TIME
	end

	if self._use_obstacle then
		local fire_extents = blackboard.action.line_of_fire_nav_obstacle_half_extents:unbox()
		local sight_extents = blackboard.action.arc_of_sight_nav_obstacle_half_extents:unbox()
		local fire_position, fire_direction = self:_fire_from_position_direction(blackboard, data)
		local direction = Vector3.normalize(fire_direction)
		local lof_position = fire_position + direction * fire_extents.y
		local aos_position = fire_position + direction * sight_extents.y
		local rotation = Quaternion.look(direction, Vector3.up())
		local fire_pose = Matrix4x4.from_quaternion_position(rotation, lof_position)
		local sight_pose = Matrix4x4.from_quaternion_position(rotation, aos_position)
		self.last_t = self.last_t or t
		local fire_obstacle = data.line_of_fire_nav_obstacle
		local sight_obstacle = data.arc_of_sight_nav_obstacle

		if t > self.last_t + 1 then
			GwNavBoxObstacle.set_does_trigger_tagvolume(fire_obstacle, false)
			GwNavBoxObstacle.remove_from_world(fire_obstacle)
			GwNavBoxObstacle.set_transform(fire_obstacle, fire_pose)
			GwNavBoxObstacle.add_to_world(fire_obstacle)
			GwNavBoxObstacle.set_does_trigger_tagvolume(fire_obstacle, true)
			GwNavBoxObstacle.set_does_trigger_tagvolume(sight_obstacle, false)
			GwNavBoxObstacle.remove_from_world(sight_obstacle)
			GwNavBoxObstacle.set_transform(sight_obstacle, sight_pose)
			GwNavBoxObstacle.add_to_world(sight_obstacle)
			GwNavBoxObstacle.set_does_trigger_tagvolume(sight_obstacle, true)

			self.last_t = t
		end
	end
end

BTRatlingGunnerShootAction._start_shooting = function (self, blackboard, unit, data, t)
	local shoot_time = math.round(data.shoot_duration * 100)
	local owner_unit_id = Managers.state.unit_storage:go_id(unit)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_ai_weapon_shoot_start", owner_unit_id, shoot_time)
	Managers.state.entity:system("weapon_system"):rpc_ai_weapon_shoot_start(Network.peer_id(), owner_unit_id, shoot_time)

	data.is_shooting = true
	data.shoot_start = t
	data.shots_fired = 0
	data.state = "shoot"

	if self._use_obstacle then
		local fire_obstacle = data.line_of_fire_nav_obstacle

		GwNavBoxObstacle.add_to_world(fire_obstacle)

		local sight_obstacle = data.arc_of_sight_nav_obstacle

		GwNavBoxObstacle.add_to_world(sight_obstacle)

		local fire_extents = blackboard.action.line_of_fire_nav_obstacle_half_extents:unbox()
		local sight_extents = blackboard.action.arc_of_sight_nav_obstacle_half_extents:unbox()
		local fire_position, fire_direction = self:_fire_from_position_direction(blackboard, data)
		local direction = Vector3.normalize(fire_direction)
		local lof_position = fire_position + direction * fire_extents.y
		local aos_position = fire_position + direction * sight_extents.y
		local rotation = Quaternion.look(direction, Vector3.up())
		local fire_pose = Matrix4x4.from_quaternion_position(rotation, lof_position)
		local sight_pose = Matrix4x4.from_quaternion_position(rotation, aos_position)

		GwNavBoxObstacle.set_transform(fire_obstacle, fire_pose)
		GwNavBoxObstacle.set_transform(sight_obstacle, sight_pose)
		GwNavBoxObstacle.set_does_trigger_tagvolume(fire_obstacle, true)
		GwNavBoxObstacle.set_does_trigger_tagvolume(sight_obstacle, true)
		DialogueSystem:trigger_targeted_by_ratling(data.target_unit)
	end

	if CLIENT_CONTROLLED_RATLING_GUN then
		local action = blackboard.action
		local breed_name = blackboard.breed.name
		local breed_id = NetworkLookup.breeds[breed_name]
		local shoot_duration = data.shoot_duration
		local breed_action_name = blackboard.action.name
		local breed_action_id = NetworkLookup.bt_action_names[breed_action_name]
		local owner_unit_id, owner_is_level_unit = Managers.state.network:game_object_or_level_id(unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_clients_continuous_shoot_start", owner_unit_id, owner_is_level_unit, breed_id, breed_action_id, shoot_duration, data.peer_id)
	end
end

local VIEW_CONE = 0.7071067

BTRatlingGunnerShootAction._update_target = function (self, unit, blackboard, action, data, t, dt)
	local switched_target = false

	if data.target_check < t then
		local old_target = data.target_unit
		local target, node_name, old_target_visible, old_target_visible_node_name, target_distance_sq, old_target_distance_sq = PerceptionUtils.pick_ratling_gun_target(unit, blackboard, old_target, VIEW_CONE, data.shoot_direction_box:unbox())

		if target and target ~= old_target then
			local target_pos = POSITION_LOOKUP[target]
			local old_target_pos = POSITION_LOOKUP[data.target_unit]
			local self_pos = POSITION_LOOKUP[unit]
			local target_switch_distance_sq = data.target_switch_distance_squared

			if target == blackboard.taunt_unit or target_distance_sq < target_switch_distance_sq and target_switch_distance_sq < old_target_distance_sq then
				data.target_unit = target
				data.target_node_name = node_name
				data.target_obscured = false
				switched_target = true

				self:_notify_no_longer_attacking(unit, old_target)
				self:_notify_attacking(unit, target)

				data.target_check = t + 0.1 + Math.random() * 0.05
			elseif old_target_visible then
				data.target_obscured = false
				data.target_node_name = old_target_visible_node_name
				data.target_check = t + 0.1 + Math.random() * 0.05
			else
				data.target_check = t + 0.5 + Math.random() * 0.25
				data.target_obscured = true
			end
		elseif old_target_visible then
			data.target_obscured = false
			data.target_node_name = old_target_visible_node_name
			data.target_check = t + 0.1 + Math.random() * 0.05
		else
			data.target_obscured = true
			data.target_check = t + 0.5 + Math.random() * 0.25
		end

		if not data.target_obscured then
			local target_unit = data.target_unit

			data.last_known_target_position:store(Unit.world_position(target_unit, Unit.node(target_unit, data.target_node_name)))
			data.last_known_unit_position:store(Unit.world_position(unit, Unit.node(unit, "c_spine")))
		end
	end

	return switched_target
end

BTRatlingGunnerShootAction._calculate_wanted_target_position = function (self, unit, target_unit, data)
	local target_position, unit_position = nil
	local obscured = data.target_obscured

	if data.target_obscured then
		target_position = data.last_known_target_position:unbox()
		unit_position = data.last_known_unit_position:unbox()
	else
		target_position = Unit.world_position(target_unit, Unit.node(target_unit, data.target_node_name))
		unit_position = Unit.world_position(unit, Unit.node(unit, "c_spine"))
	end

	local look_at_rotation = LocomotionUtils.look_at_position_flat(unit, target_position)

	return target_position, look_at_rotation, unit_position
end

BTRatlingGunnerShootAction._start_align_towards_target = function (self, unit, blackboard, data, target_unit, t)
	data.state = "align"
	local start_direction = data.shoot_direction_box:unbox()
	local target_position, wanted_rotation, unit_position = self:_calculate_wanted_target_position(unit, target_unit, data)
	local flat_start_direction = Vector3.normalize(Vector3.flat(start_direction))
	local flat_wanted_direction = Vector3.normalize(Vector3.flat(target_position - unit_position))
	local angle = Vector3.flat_angle(flat_start_direction, flat_wanted_direction)
	local action = blackboard.action
	data.align_start = t
	data.shoot_direction_start_box = Vector3Box(start_direction)
	data.shoot_duration = AiUtils.random(action.attack_time[1], action.attack_time[2])
	data.align_speed = 0
	data.aim_position_box = nil
	data.current_aim_rotation = nil
	blackboard.anim_cb_attack_shoot_random_shot = nil

	Managers.state.network:anim_event(unit, "attack_shoot_align")
end

BTRatlingGunnerShootAction._end_align_towards_target = function (self, unit, data)
	data.state = "ready"
	data.align_start = nil
	data.shoot_direction_start = nil
	data.align_speed = nil
	data.aim_position_box = Vector3Box()
	data.current_aim_rotation = QuaternionBox(Quaternion.look(data.shoot_direction_box:unbox(), Vector3.up()))

	Managers.state.network:anim_event(unit, "attack_shoot_start")
end

local MAX_SPEED = 5
local SLOW_SPEED = 1
local STOP_SPEED = SLOW_SPEED * 0.5
local SLOW_DOWN_ANGLE = PI / 12
local ACCELERATION = PI * 12
local DECELERATION = PI * 6
local STOP_ANGLE = PI / 32
local AIM_PIVOT_HEIGHT = 0.7

BTRatlingGunnerShootAction._update_align_towards_target = function (self, unit, blackboard, t, dt)
	local data = blackboard.attack_pattern_data
	local action = blackboard.action
	local target_unit = data.target_unit
	local target_position, wanted_rotation, unit_position = self:_calculate_wanted_target_position(unit, target_unit, data)
	local current_rotation = Unit.local_rotation(unit, 0)
	local speed = data.align_speed
	local angle_left = self:_remaining_angle(current_rotation, wanted_rotation)
	local wanted_speed = self:_angle_to_speed(angle_left)

	if wanted_speed == 0 and speed > 0 then
		speed = math.max(speed - DECELERATION * dt, 0)
	elseif wanted_speed == 0 and speed < 0 then
		speed = math.min(speed + DECELERATION * dt, 0)
	elseif speed < wanted_speed and wanted_speed > 0 then
		speed = math.min(speed + ACCELERATION * dt, wanted_speed)
	elseif wanted_speed < speed and wanted_speed < 0 then
		speed = math.max(speed - ACCELERATION * dt, wanted_speed)
	elseif speed < wanted_speed and wanted_speed < 0 then
		speed = math.min(speed + DECELERATION * dt, wanted_speed)
	else
		speed = math.max(speed - ACCELERATION * dt, wanted_speed)
	end

	data.align_speed = speed
	local angle = 0 + speed * dt
	local new_rot = Quaternion.multiply(current_rotation, Quaternion(Vector3.up(), angle))
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(new_rot)

	local lerp_value = math.min(dt * 3, 1)
	local new_shoot_direction = Vector3.lerp(data.shoot_direction_box:unbox(), Quaternion.forward(new_rot), lerp_value)

	data.shoot_direction_box:store(new_shoot_direction)

	return math.abs(angle_left) < STOP_ANGLE
end

BTRatlingGunnerShootAction._angle_to_speed = function (self, angle_left)
	if SLOW_DOWN_ANGLE < angle_left then
		return MAX_SPEED
	elseif angle_left < -SLOW_DOWN_ANGLE then
		return -MAX_SPEED
	elseif angle_left > 0 then
		return math.auto_lerp(SLOW_DOWN_ANGLE, 0, MAX_SPEED, SLOW_SPEED, angle_left)
	else
		return math.auto_lerp(-SLOW_DOWN_ANGLE, 0, -MAX_SPEED, -SLOW_SPEED, angle_left)
	end
end

BTRatlingGunnerShootAction._aim_at_target = function (self, unit, blackboard, t, dt)
	local data = blackboard.attack_pattern_data
	local action = blackboard.action
	local target_unit = data.target_unit
	local target_position, wanted_rotation, unit_position = self:_calculate_wanted_target_position(unit, target_unit, data)
	local current_rotation = Unit.local_rotation(unit, 0)
	local angle = Quaternion.yaw(wanted_rotation) - Quaternion.yaw(current_rotation)
	local normalized_angle = (angle % TWO_PI + PI) % TWO_PI - PI
	local self_pos = POSITION_LOOKUP[unit]
	local pivot = self_pos + Vector3(0, 0, AIM_PIVOT_HEIGHT)
	local wanted_aim_position_offset = target_position - pivot
	local wanted_aim_rotation = Quaternion.look(wanted_aim_position_offset, Vector3.up())
	local current_aim_rotation = data.current_aim_rotation:unbox()
	local lerped_rotation = self:_rotate_from_to(current_aim_rotation, wanted_aim_rotation, action.radial_speed_upper_body_shooting, dt)
	local aim_position = pivot + Quaternion.forward(lerped_rotation) * Vector3.length(wanted_aim_position_offset)

	data.current_aim_rotation:store(lerped_rotation)

	local lerped_rot, angle_left = self:_rotate_from_to(current_rotation, wanted_rotation, action.radial_speed_feet_shooting, dt)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(lerped_rot)
	data.aim_position_box:store(aim_position)
	data.shoot_direction_box:store(aim_position - pivot)

	local owner_unit_id, owner_is_level_unit = Managers.state.network:game_object_or_level_id(unit)

	if not owner_is_level_unit then
		local game = Managers.state.network:game()
		local position_constant = NetworkConstants.position
		local min = position_constant.min
		local max = position_constant.max

		GameSession.set_game_object_field(game, owner_unit_id, "aim_position", Vector3.clamp(aim_position, min, max))
	end

	local realign = normalized_angle > PI / 3 or normalized_angle < -PI
	local physics_world = World.get_data(blackboard.world, "physics_world")

	PhysicsWorld.prepare_actors_for_raycast(physics_world, pivot, Vector3.normalize(aim_position - pivot), action.spread)

	return realign
end

BTRatlingGunnerShootAction._remaining_angle = function (self, from, to)
	local from_forward = Quaternion.forward(from)
	local to_forward = Quaternion.forward(to)
	local from_angle = math.atan2(from_forward.y, from_forward.x)
	local to_angle = math.atan2(to_forward.y, to_forward.x)
	local pi = PI
	local pi2 = pi * 2
	local angle_diff = to_angle - from_angle
	local normalized_angle_diff = (angle_diff % pi2 + pi) % pi2 - pi

	return normalized_angle_diff
end

BTRatlingGunnerShootAction._rotate_from_to = function (self, from, to, max_angle_speed, dt)
	local max_delta = max_angle_speed * dt
	local inner_product = Quaternion.dot(to, from)
	local angle_difference = 2 * math.acos(math.clamp(inner_product, -1, 1))
	local normalized_angle_diff = math.abs((angle_difference % TWO_PI + PI) % TWO_PI - PI)
	local lerp_t = angle_difference == 0 and 1 or math.min(max_delta / angle_difference, 1)

	return Quaternion.lerp(from, to, lerp_t), math.max(normalized_angle_diff - max_delta, 0)
end

BTRatlingGunnerShootAction._fire_from_position_direction = function (self, blackboard, data)
	local ratling_gun_unit = data.ratling_gun_unit
	local fire_node = Unit.node(ratling_gun_unit, "p_fx")
	local position = Unit.world_position(ratling_gun_unit, fire_node)
	local direction = nil

	if blackboard.in_hit_reaction then
		direction = Quaternion.forward(Unit.world_rotation(ratling_gun_unit, fire_node))
	else
		direction = data.aim_position_box:unbox() - position
	end

	local fire_pos = position - Vector3.normalize(direction) * 0.25

	return fire_pos, direction
end

BTRatlingGunnerShootAction._shoot = function (self, unit, blackboard)
	local action = blackboard.action
	local data = blackboard.attack_pattern_data
	local light_weight_projectile_template_name = action.light_weight_projectile_template_name
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local from_position, direction = self:_fire_from_position_direction(blackboard, data)
	local normalized_direction = Vector3.normalize(direction)
	local spread_angle = Math.random() * light_weight_projectile_template.spread
	local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
	local pitch = Quaternion(Vector3.right(), spread_angle)
	local roll = Quaternion(Vector3.forward(), Math.random() * TWO_PI)
	local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
	local spread_direction = Quaternion.forward(spread_rot)
	local collision_filter = "filter_enemy_player_afro_ray_projectile"
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank]
	local action_data = {
		power_level = power_level,
		damage_profile = light_weight_projectile_template.damage_profile,
		hit_effect = light_weight_projectile_template.hit_effect,
		player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed),
		projectile_linker = light_weight_projectile_template.projectile_linker,
		first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events
	}
	local projectile_system = Managers.state.entity:system("projectile_system")
	local peer_id = data.peer_id
	local skip_rpc = CLIENT_CONTROLLED_RATLING_GUN

	projectile_system:create_light_weight_projectile(blackboard.breed.name, unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, nil, nil, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, peer_id, nil, skip_rpc)
end

BTRatlingGunnerShootAction._create_bot_threat_box = function (self, unit, attack_data, duration)
	local self_pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[attack_data.target_unit]

	if self_pos and target_pos then
		local to_target = target_pos - self_pos
		local distance = Vector3.length(to_target)
		local obstacle_position, obstacle_rotation, obstacle_size = AiUtils.calculate_oobb(distance * 2, self_pos, Quaternion.look(to_target))
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

		ai_bot_group_system:aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, duration)
	end
end
