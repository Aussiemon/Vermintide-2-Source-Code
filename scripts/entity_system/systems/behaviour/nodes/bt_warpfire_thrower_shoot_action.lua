require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")
BTWarpfireThrowerShootAction = class(BTWarpfireThrowerShootAction, BTNode)

BTWarpfireThrowerShootAction.init = function (self, ...)
	BTWarpfireThrowerShootAction.super.init(self, ...)
end

BTWarpfireThrowerShootAction.name = "BTWarpfireThrowerShootAction"
local hit_ai_units = {}

BTWarpfireThrowerShootAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.attack_finished = false
	local world = blackboard.world
	blackboard.physics_world = blackboard.physics_world or World.get_data(world, "physics_world")
	local attack_data = blackboard.attack_pattern_data or {}
	blackboard.attack_pattern_data = attack_data
	local inventory_template = blackboard.breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")
	local warpfire_gun_unit = inventory_extension:get_unit(inventory_template)
	attack_data.warpfire_gun_unit = warpfire_gun_unit
	attack_data.state = "align"
	local rotation = Unit.local_rotation(unit, 0)
	local forward_direction = Quaternion.forward(rotation)
	attack_data.shoot_direction_box = Vector3Box(forward_direction)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:stop()
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	attack_data.constraint_target = attack_data.constraint_target or Unit.animation_find_constraint_target(unit, "aim_target")
	local target_unit = blackboard.target_unit

	self:_start_align_towards_target(unit, blackboard, attack_data, target_unit)

	blackboard.move_state = "attacking"
	blackboard.attack_aborted = false
	blackboard.line_of_sight_raycast_timer = t + 0.5
	blackboard.close_attack_cooldown = 0
	local data = blackboard.warpfire_data or {}
	blackboard.warpfire_data = data
	data.is_firing = false

	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, target_unit, "warpfire_thrower_fire")
end

BTWarpfireThrowerShootAction._init_attack = function (self, unit, target_unit, blackboard, action)
	local target_position = POSITION_LOOKUP[target_unit]
	local attack_is_ok = nil

	if target_position then
		local unit_position = POSITION_LOOKUP[unit]
		local attack_minimum_length = action.minimum_length
		local end_pos_distance_sq = Vector3.distance_squared(unit_position, target_position)
		attack_is_ok = end_pos_distance_sq > attack_minimum_length^2
	else
		attack_is_ok = false
	end

	return attack_is_ok
end

BTWarpfireThrowerShootAction._abort_shooting = function (self, t, warpfire_data)
	warpfire_data.blob_extension:stop_placing_blobs(t)

	warpfire_data.is_firing = false
end

BTWarpfireThrowerShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local warpfire_data = blackboard.warpfire_data

	if warpfire_data.is_firing then
		self:_abort_shooting(t, warpfire_data)
	end

	Managers.state.network:anim_event(unit, "attack_shoot_end")

	local target_unit = blackboard.target_unit

	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, target_unit, "warpfire_thrower_fire")

	blackboard.action = nil
	blackboard.attack_aborted = nil
	blackboard.anim_cb_attack_shoot_random_shot = nil
	blackboard.create_bot_threat_at_t = nil

	for unit, _ in pairs(hit_ai_units) do
		hit_ai_units[unit] = nil
	end
end

BTWarpfireThrowerShootAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted then
		return "failed"
	end

	local action = blackboard.action
	local target_unit = blackboard.target_unit
	local warpfire_data = blackboard.warpfire_data
	local attack_pattern_data = blackboard.attack_pattern_data

	if attack_pattern_data.state == "align" then
		local old_target_unit = blackboard.old_target_unit
		local switched_target = not old_target_unit or target_unit ~= old_target_unit

		if switched_target then
			self:_start_align_towards_target(unit, blackboard, attack_pattern_data, target_unit)

			blackboard.old_target_unit = target_unit
		end

		local done = self:_update_align_towards_target(unit, blackboard, attack_pattern_data, target_unit, dt)

		if done then
			self:_end_align_towards_target(unit, warpfire_data, attack_pattern_data, blackboard, t)

			local bot_threat_start_time = action.bot_threat_start_time

			if bot_threat_start_time then
				blackboard.create_bot_threat_at_t = t + bot_threat_start_time
			end
		end

		return "running"
	elseif attack_pattern_data.state == "ready" then
		local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

		if create_bot_threat_at_t and create_bot_threat_at_t < t then
			self:_create_bot_aoe_threat(unit, action)

			blackboard.create_bot_threat_at_t = nil
		end

		if blackboard.anim_cb_attack_shoot_random_shot then
			if t < warpfire_data.stop_firing_t then
				if not warpfire_data.is_firing then
					if self:_init_attack(unit, target_unit, blackboard, action) then
						self:_attack_fire(unit, warpfire_data, action, blackboard, t)

						blackboard.warpfire_face_timer = t + blackboard.target_dist * 0.08
						local unit_position = POSITION_LOOKUP[unit]
						local to_target = Vector3.flat(POSITION_LOOKUP[target_unit] - unit_position)
						local to_target_normalized = Vector3.normalize(to_target)
						local forward = Vector3.flat(Quaternion.forward(Unit.local_rotation(unit, 0)))
						local forward_normalized = Vector3.normalize(forward)
						local dot = Vector3.dot(to_target_normalized, forward_normalized)

						if dot < 0 then
							blackboard.warpfire_face_timer = blackboard.warpfire_face_timer + math.abs(dot)
						end
					else
						return "done"
					end
				else
					local should_use_close_range_attack = self:_close_range_attack_check(blackboard, action, t)

					if should_use_close_range_attack and blackboard.warpfire_face_timer and blackboard.warpfire_face_timer < t then
						self:_close_range_attack(unit, attack_pattern_data, blackboard, action, t)
					end

					local realign, new_target = self:_aim_at_target(unit, target_unit, attack_pattern_data, blackboard, action, t, dt)

					if new_target then
						blackboard.warpfire_face_timer = t + blackboard.target_dist * 0.08
					end

					if realign then
						return "done"
					end

					self:_move_warpfire_blob(unit, warpfire_data, blackboard, action, dt)

					return "running"
				end
			else
				return "done"
			end
		end
	end

	return "running"
end

BTWarpfireThrowerShootAction._move_warpfire_blob = function (self, unit, warpfire_data, blackboard, action, dt)
	local blob_unit = warpfire_data.blob_unit
	local blob_position = POSITION_LOOKUP[blob_unit]

	if blob_unit and blob_position then
		local target_unit = blackboard.target_unit
		local target_dist = blackboard.target_dist
		local target_position = POSITION_LOOKUP[target_unit]
		local lerp_value, wanted_position = nil
		local close_attack_range = action.close_attack_range
		local warpfire_follow_target_speed = action.warpfire_follow_target_speed

		if close_attack_range < target_dist then
			lerp_value = math.min(dt * warpfire_follow_target_speed, 1)
			wanted_position = target_position
		else
			lerp_value = math.min(dt * warpfire_follow_target_speed * 6, 1)
			local unit_position = POSITION_LOOKUP[unit]
			local unit_to_target = Vector3.normalize(target_position - unit_position)
			wanted_position = unit_position + unit_to_target * close_attack_range
		end

		local new_blob_position = Vector3.lerp(blob_position, wanted_position, lerp_value)

		Unit.set_local_position(blob_unit, 0, new_blob_position)
	end
end

BTWarpfireThrowerShootAction._end_align_towards_target = function (self, unit, warpfire_data, attack_pattern_data, blackboard, t)
	attack_pattern_data.state = "ready"
	attack_pattern_data.shoot_direction_start = nil
	attack_pattern_data.current_aim_rotation = QuaternionBox(Quaternion.look(attack_pattern_data.shoot_direction_box:unbox(), Vector3.up()))
	local action = blackboard.action
	warpfire_data.stop_firing_t = t + action.firing_time

	Managers.state.network:anim_event(unit, "attack_shoot_start")

	blackboard.close_attack_cooldown = 0
end

BTWarpfireThrowerShootAction._start_align_towards_target = function (self, unit, blackboard, data, target_unit)
	data.state = "align"
	data.align_speed = 0
	data.current_aim_rotation = nil
	blackboard.anim_cb_attack_shoot_random_shot = nil
	local action = blackboard.action
	local target_position, _, unit_position = self:_calculate_wanted_target_position(unit, target_unit)
	local flat_wanted_direction = Vector3.normalize(Vector3.flat(target_position - unit_position))
	local rotation = Unit.world_rotation(unit, 0)
	local forward_vector = Quaternion.forward(rotation)
	local right_vector = Quaternion.right(rotation)
	local turn_animation = self:_calculate_align_animation(right_vector, forward_vector, flat_wanted_direction, action.attack_anims, unit_position)

	Managers.state.network:anim_event(unit, turn_animation)
end

local PI = math.pi
local TWO_PI = PI * 2
local ACCELERATION = PI * 24
local DECELERATION = PI * 6
local STOP_ANGLE = PI / 32
local AIM_PIVOT_HEIGHT = 0.7

BTWarpfireThrowerShootAction._remaining_angle = function (self, from, to)
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

BTWarpfireThrowerShootAction._angle_to_speed = function (self, speed, angle_left)
	if angle_left > 0 then
		return speed
	else
		return -speed
	end
end

BTWarpfireThrowerShootAction._update_align_towards_target = function (self, unit, blackboard, attack_pattern_data, target_unit, dt)
	local _, wanted_rotation, _ = self:_calculate_wanted_target_position(unit, target_unit)
	local action = blackboard.action
	local current_rotation = Unit.local_rotation(unit, 0)
	local angle_left = self:_remaining_angle(current_rotation, wanted_rotation)
	local wanted_speed = self:_angle_to_speed(action.rotation_speed, angle_left)
	local speed = attack_pattern_data.align_speed

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

	attack_pattern_data.align_speed = speed
	local angle = speed * dt
	local new_rot = Quaternion.multiply(current_rotation, Quaternion(Vector3.up(), angle))
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(new_rot)

	local lerp_value = math.min(dt * 3, 1)
	local new_shoot_direction = Vector3.lerp(attack_pattern_data.shoot_direction_box:unbox(), Quaternion.forward(new_rot), lerp_value)

	attack_pattern_data.shoot_direction_box:store(new_shoot_direction)

	return math.abs(angle_left) < STOP_ANGLE
end

BTWarpfireThrowerShootAction._close_range_attack_check = function (self, blackboard, action, t)
	local target_distance = blackboard.target_dist

	return target_distance < action.close_attack_range and blackboard.close_attack_cooldown < t
end

BTWarpfireThrowerShootAction._close_range_attack = function (self, unit, attack_pattern_data, blackboard, action, t)
	local node_name = action.muzzle_node
	local warpfire_unit = attack_pattern_data.warpfire_gun_unit
	local muzzle_node = Unit.node(warpfire_unit, node_name)
	local muzzle_pos = Unit.world_position(warpfire_unit, muzzle_node)
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local to_target = Vector3.flat(target_pos - muzzle_pos)
	local distance = Vector3.length(to_target)
	local warpfire_unit = attack_pattern_data.warpfire_gun_unit
	local forward = Vector3.flat(Quaternion.forward(Unit.world_rotation(warpfire_unit, muzzle_node)))
	local forward_normalized = Vector3.normalize(forward)
	local aim_pos = muzzle_pos + forward_normalized * action.close_attack_range
	muzzle_pos = muzzle_pos - forward_normalized * 0.5
	local physics_world = blackboard.physics_world
	local radius = action.hit_radius
	local max_hits = 10
	local result = PhysicsWorld.linear_sphere_sweep(physics_world, muzzle_pos, aim_pos, radius, max_hits, "collision_filter", "filter_character_trigger", "report_initial_overlap")
	local buff_system = Managers.state.entity:system("buff_system")

	if result then
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local actor = hit.actor
			local hit_unit = Actor.unit(actor)

			if hit_unit ~= unit then
				local is_ai_unit = DamageUtils.is_enemy(blackboard.target_unit, hit_unit)
				local is_player_unit = DamageUtils.is_player_unit(hit_unit)
				local unit_is_character = is_ai_unit or is_player_unit

				if unit_is_character then
					local buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

					if buff_extension then
						local buff_name = action.buff_name

						if is_ai_unit and not hit_ai_units[hit_unit] and AiUtils.unit_alive(hit_unit) then
							local ai_push_data = action.ai_push_data
							local stagger_impact = ai_push_data.stagger_impact
							local duration_table = ai_push_data.stagger_duration
							local stagger_distance = ai_push_data.stagger_distance
							local stagger_type, stagger_duration = DamageUtils.calculate_stagger(stagger_impact, duration_table, hit_unit, unit)
							local hit_unit_pos = POSITION_LOOKUP[hit_unit]
							local direction = Vector3.normalize(hit_unit_pos - muzzle_pos)
							local hit_unit_blackboard = BLACKBOARDS[hit_unit]

							if stagger_types.none < stagger_type then
								AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, direction, stagger_distance, stagger_type, stagger_duration, nil, t)
							end

							hit_ai_units[hit_unit] = true
						end

						if is_player_unit then
							local target_status_extension = ScriptUnit.has_extension(blackboard.target_unit, "status_system")
							local target_buff_extension = ScriptUnit.has_extension(blackboard.target_unit, "buff_system")
							local target_power_block_perk = target_buff_extension:has_buff_perk("power_block")
							local target_blocking, shield_block = target_status_extension:is_blocking()
							local is_valid_player_status = target_status_extension and not target_status_extension:is_invisible()
							local to_target_normalized = Vector3.normalize(to_target)
							local dot = Vector3.dot(to_target_normalized, forward_normalized)
							local is_valid_target = (dot > 0.99 or (distance < action.aim_rotation_override_distance and dot > 0.55)) and is_valid_player_status

							if target_power_block_perk and target_blocking and shield_block then
								if is_valid_target and not DamageUtils.check_ranged_block(unit, hit_unit, dot, "blocked_berzerker") then
									buff_system:add_buff(hit_unit, buff_name, unit)
								end
							elseif is_valid_target then
								buff_system:add_buff(hit_unit, buff_name, unit)
							end
						elseif AiUtils.unit_alive(hit_unit) then
							buff_system:add_buff(hit_unit, buff_name, unit)
						end
					end
				end
			end
		end
	end

	blackboard.close_attack_cooldown = t + action.close_attack_cooldown
end

BTWarpfireThrowerShootAction._aim_at_target = function (self, unit, target_unit, attack_pattern_data, blackboard, action, t, dt)
	local aim_pos, wanted_rotation, _, target_position = self:_calculate_wanted_target_position(unit, target_unit)
	local target_status_extension = ScriptUnit.has_extension(blackboard.target_unit, "status_system")
	local target_is_dodging = target_status_extension and target_status_extension:get_is_dodging()
	local aim_rotation_override_distance = action.aim_rotation_override_distance
	local aim_rotation_override_speed_multiplier = action.aim_rotation_override_speed_multiplier
	local aim_rotation_dodge_multipler = action.aim_rotation_dodge_multipler
	local self_pos = POSITION_LOOKUP[unit]
	local pivot = self_pos + Vector3(0, 0, AIM_PIVOT_HEIGHT)
	local wanted_aim_position_offset = aim_pos - pivot
	local wanted_aim_rotation = Quaternion.look(wanted_aim_position_offset, Vector3.up())
	local current_aim_rotation = attack_pattern_data.current_aim_rotation:unbox()
	local distance_to_target = Vector3.distance(self_pos, target_position)
	local aim_rotation_modifier = (distance_to_target < aim_rotation_override_distance and aim_rotation_override_speed_multiplier) or (target_is_dodging and aim_rotation_dodge_multipler) or math.max(1 - distance_to_target / action.close_attack_range, 0.1)
	local upper_body_rotation_speed = action.radial_speed_upper_body_shooting * math.min(aim_rotation_modifier, aim_rotation_override_speed_multiplier)
	local lerped_rotation = self:_rotate_from_to(current_aim_rotation, wanted_aim_rotation, upper_body_rotation_speed, dt)
	local aim_position = pivot + Quaternion.forward(lerped_rotation) * Vector3.length(wanted_aim_position_offset)

	attack_pattern_data.current_aim_rotation:store(lerped_rotation)

	local current_rotation = Unit.local_rotation(unit, 0)
	local lerped_rot = self:_rotate_from_to(current_rotation, wanted_rotation, action.radial_speed_feet_shooting, dt)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(lerped_rot)
	attack_pattern_data.shoot_direction_box:store(aim_position - pivot)

	local physics_world = blackboard.physics_world

	PhysicsWorld.prepare_actors_for_raycast(physics_world, pivot, Vector3.normalize(aim_position - pivot), action.spread)

	local realign = false

	if action.target_switch_distance < blackboard.target_dist then
		realign = true
	elseif blackboard.line_of_sight_raycast_timer < t then
		local filter = "filter_ai_line_of_sight_check"
		local self_to_target = target_position - self_pos
		local is_hit, _ = PhysicsWorld.immediate_raycast(physics_world, self_pos + Vector3.up(), Vector3.normalize(self_to_target), Vector3.length(self_to_target), "closest", "collision_filter", filter)

		if is_hit then
			realign = true
		end

		blackboard.line_of_sight_raycast_timer = t + 0.5
	end

	local new_target_unit = false

	if blackboard.old_target_unit ~= target_unit then
		new_target_unit = true
		blackboard.old_target_unit = target_unit
	end

	return realign, new_target_unit
end

BTWarpfireThrowerShootAction._rotate_from_to = function (self, from, to, max_angle_speed, dt)
	local inner_product = Quaternion.dot(to, from)
	local angle_difference = 2 * math.acos(math.clamp(inner_product, -1, 1))
	local max_delta = max_angle_speed * dt
	local lerp_t = (angle_difference == 0 and 1) or math.min(max_delta / angle_difference, 1)
	local normalized_angle_diff = math.abs((angle_difference % TWO_PI + PI) % TWO_PI - PI)

	return Quaternion.lerp(from, to, lerp_t), math.max(normalized_angle_diff - max_delta, 0)
end

BTWarpfireThrowerShootAction._calculate_wanted_target_position = function (self, unit, target_unit)
	local unit_position = Unit.world_position(unit, Unit.node(unit, "c_spine"))
	local target_position = POSITION_LOOKUP[target_unit] + Vector3.up()
	local unit_to_target = target_position - unit_position
	local mid_pos = unit_position + unit_to_target * 0.5
	local length = Vector3.length(target_position - unit_position)
	mid_pos.z = mid_pos.z + length * 0.01

	if length < 2 then
		mid_pos = target_position
	end

	local look_at_rotation = LocomotionUtils.look_at_position_flat(unit, mid_pos)

	return mid_pos, look_at_rotation, unit_position, target_position
end

BTWarpfireThrowerShootAction._calculate_align_animation = function (self, right_vector, forward_vector, dir, attack_anims)
	local right_dot = Vector3.dot(right_vector, dir)
	local fwd_dot = Vector3.dot(forward_vector, dir)
	local abs_right = math.abs(right_dot)
	local abs_fwd = math.abs(fwd_dot)
	local anim = nil
	local is_left_or_right = abs_fwd < abs_right

	if is_left_or_right and right_dot > 0.5 then
		anim = attack_anims.right
	elseif is_left_or_right and right_dot < -0.5 then
		anim = attack_anims.left
	elseif fwd_dot > 0 then
		anim = attack_anims.fwd
	else
		anim = attack_anims.bwd
	end

	return anim
end

BTWarpfireThrowerShootAction._attack_fire = function (self, unit, warpfire_data, action, blackboard, t)
	self:_create_warpfire_blob(unit, warpfire_data, action, blackboard, t)

	warpfire_data.is_firing = true
	blackboard.has_fired = true
end

BTWarpfireThrowerShootAction._create_warpfire_blob = function (self, unit, data, action, blackboard, t)
	local attack_pattern_data = blackboard.attack_pattern_data
	local warpfire_data = blackboard.warpfire_data
	local warpfire_unit = attack_pattern_data.warpfire_gun_unit
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local extension_init_data = {
		area_damage_system = {
			damage_blob_template_name = "warpfire",
			source_unit = unit
		}
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local damage_blob_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "damage_blob_unit", extension_init_data, target_position)
	local damage_blob_extension = ScriptUnit.extension(damage_blob_unit, "area_damage_system")
	warpfire_data.blob_unit = damage_blob_unit
	warpfire_data.blob_extension = damage_blob_extension
	local length = Vector3.length(target_position - unit_position)
	local wait_time = length / 10

	damage_blob_extension:start_placing_blobs(wait_time, t)
end

BTWarpfireThrowerShootAction._calculate_cylinder_collision = function (self, action, self_pos, self_rot)
	local radius = action.bot_threat_radius
	local height = action.bot_threat_height
	local offset_up = action.bot_threat_offset_up
	local offset_forward = action.bot_threat_offset_forward
	local half_height = height * 0.5
	local size = Vector3(radius, radius, half_height)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local cylinder_center = self_pos + forward * offset_forward + up * (half_height + offset_up)

	return cylinder_center, size
end

BTWarpfireThrowerShootAction._create_bot_aoe_threat = function (self, unit, action)
	local unit_position = POSITION_LOOKUP[unit]
	local unit_rotation = Unit.local_rotation(unit, 0)
	local bot_threat_duration = action.bot_threat_duration
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local obstacle_position, obstacle_size = self:_calculate_cylinder_collision(action, unit_position, unit_rotation)

	ai_bot_group_system:aoe_threat_created(obstacle_position, "cylinder", obstacle_size, nil, bot_threat_duration)
end

return
