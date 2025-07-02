-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_melee_overlap_attack_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")

BTMeleeOverlapAttackAction = class(BTMeleeOverlapAttackAction, BTNode)

BTMeleeOverlapAttackAction.init = function (self, ...)
	BTMeleeOverlapAttackAction.super.init(self, ...)
end

BTMeleeOverlapAttackAction.name = "BTMeleeOverlapAttackAction"

local Vector3_dot = Vector3.dot

local function closest_point_on_line(p, p1, p2)
	local diff = p - p1
	local dir = p2 - p1
	local dot1 = Vector3_dot(diff, dir)

	if dot1 <= 0 then
		return p1, dot1 < 0
	end

	local dot2 = Vector3_dot(dir, dir)

	if dot2 <= dot1 then
		return p2, dot2 < dot1
	end

	local t = dot1 / dot2

	return p1 + t * dir, false
end

BTMeleeOverlapAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTMeleeOverlapAttackAction
	blackboard.attack_token = true

	local target_unit = blackboard.override_target_unit or blackboard.target_unit

	blackboard.locked_target_unit = target_unit

	local should_attack = self:_init_attack(unit, target_unit, blackboard, action, t, 1)

	if not should_attack then
		blackboard.attack_finished = true
	else
		blackboard.attack_finished = false
	end

	blackboard.move_state = "attacking"
	blackboard.attack_aborted = false
	blackboard.keep_target = true
	blackboard.past_damage_in_attack = false

	local side = Managers.state.side.side_by_unit[unit]
	local is_conflict_enemy = side and side.side_id == Managers.state.conflict.default_enemy_side_id

	if is_conflict_enemy then
		local attack = blackboard.attack
		local freeze_intensity_decay_time = attack.freeze_intensity_decay_time or 15

		if freeze_intensity_decay_time > 0 then
			Managers.state.conflict:freeze_intensity_decay(freeze_intensity_decay_time)
		end
	end

	AiUtils.add_attack_intensity(target_unit, action, blackboard)
end

local function debug_print(...)
	if script_data.debug_ai_attack then
		print("BTMeleeOverlapAttackAction:", ...)
	end
end

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

local function incremental_randomize(event, blackboard)
	if type(event) == "table" then
		if blackboard.attack_random_index then
			blackboard.attack_random_index = blackboard.attack_random_index % #event + 1
		else
			blackboard.attack_random_index = 1
		end

		return event[blackboard.attack_random_index]
	else
		return event
	end
end

BTMeleeOverlapAttackAction._init_attack = function (self, unit, target_unit, blackboard, action, t, start_attack_index)
	if blackboard.last_combo_attack then
		blackboard.last_combo_attack = nil

		return false
	end

	local locomotion_extension = blackboard.locomotion_extension

	blackboard.target_unit_status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	local use_running_attack

	if action.running_attacks then
		local target_locomotion_extension = ScriptUnit.has_extension(target_unit, "locomotion_system")
		local target_velocity = target_locomotion_extension and target_locomotion_extension:current_velocity() or Vector3.zero()
		local velocity_threshold = action.target_running_velocity_threshold
		local target_running_distance_threshold = action.target_running_distance_threshold
		local to_target = POSITION_LOOKUP[target_unit] - POSITION_LOOKUP[unit]
		local target_distance = Vector3.length(to_target)
		local to_target_normalized = Vector3.normalize(to_target)
		local dot = Vector3.dot(target_velocity, to_target_normalized)
		local target_in_front = dot > 0.5
		local target_is_running

		if target_running_distance_threshold then
			target_is_running = target_running_distance_threshold < target_distance
		else
			target_is_running = velocity_threshold < dot and target_in_front
		end

		local self_running_speed_threshold = action.self_running_speed_threshold

		if self_running_speed_threshold and not target_is_running then
			local current_velocity = locomotion_extension:current_velocity()
			local current_speed_sq = Vector3.length_squared(current_velocity)

			use_running_attack = current_speed_sq > self_running_speed_threshold^2
		else
			use_running_attack = target_is_running
		end
	end

	local attacks = use_running_attack and action.running_attacks or action.attacks
	local attack

	if action.is_combo_attack then
		attack = attacks[start_attack_index or blackboard.next_combo_index]
		blackboard.next_combo_index = attack.next_combo_index

		if not blackboard.next_combo_index then
			blackboard.last_combo_attack = true
		end
	else
		attack = randomize(attacks)
	end

	local anim_driven = attack.anim_driven
	local rotation_time = attack.rotation_time
	local attack_anim, rot_scale

	if attack.multi_attack_anims then
		local target_pos = POSITION_LOOKUP[target_unit]

		attack_anim = AiAnimUtils.get_start_move_animation(unit, target_pos, attack.multi_attack_anims)

		if not attack_anim or attack_anim == attack.multi_attack_anims.fwd then
			anim_driven = false
			attack_anim = attack.multi_attack_anims.fwd
		else
			rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, attack_anim, attack.multi_anims_data)

			LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)

			anim_driven = true
			rotation_time = 0
		end
	else
		attack_anim = incremental_randomize(attack.attack_anim, blackboard)
	end

	if not attack.enable_nav_extension then
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:stop()
		navigation_extension:set_enabled(false)
		locomotion_extension:set_wanted_velocity_flat(Vector3.zero())
	end

	blackboard.anim_locked = t + attack.attack_time
	blackboard.attack = attack
	blackboard.attack_anim_driven = anim_driven
	blackboard.attack_rotation_update_timer = t + rotation_time
	blackboard.attacking_target = target_unit
	blackboard.attack_started_at_t = t
	blackboard.physics_world = blackboard.physics_world or World.get_data(blackboard.world, "physics_world")

	local to_target_rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

	blackboard.attack_rotation = QuaternionBox(to_target_rotation)

	local translation_scale = attack.animation_translation_scale

	if anim_driven and translation_scale then
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(translation_scale, translation_scale, translation_scale))
	end

	local affected_by_gravity = true
	local script_driven_rotation = rotation_time > 0

	if anim_driven and attack.blend_time and not blackboard.attack_blend_end_t then
		blackboard.attack_blend_end_t = t + attack.blend_time
	else
		LocomotionUtils.set_animation_driven_movement(unit, anim_driven, affected_by_gravity, script_driven_rotation)
	end

	locomotion_extension:use_lerp_rotation(not anim_driven)
	Managers.state.network:anim_event(unit, attack_anim)

	local continious_overlap = attack.continious_overlap

	if continious_overlap then
		local overlap_data = continious_overlap[attack_anim]
		local inventory_unit

		if overlap_data.use_inventory_unit then
			local breed = blackboard.breed
			local inventory_template = breed.default_inventory_template
			local inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")

			inventory_unit = inventory_extension:get_unit(inventory_template)
		end

		local weapon_unit = inventory_unit or unit
		local base_node_name = overlap_data.base_node_name
		local base_node = Unit.node(weapon_unit, base_node_name)
		local tip_node_name = overlap_data.tip_node_name
		local tip_node = Unit.node(weapon_unit, tip_node_name)

		blackboard.continous_overlap_data = blackboard.continous_overlap_data or {}

		local data = blackboard.continous_overlap_data

		data.weapon_unit = weapon_unit
		data.start_time = t + overlap_data.start_time
		data.base_node = base_node
		data.tip_node = tip_node
		data.hit_units = {
			[unit] = true,
		}
		data.perform_overlap = true
	end

	local wall_collision = attack.wall_collision

	if wall_collision then
		blackboard.wall_collision_data = blackboard.wall_collision_data or {}

		local data = blackboard.wall_collision_data

		data.animation = wall_collision.animation
		data.stun_time = wall_collision.stun_time
		data.check_range = wall_collision.check_range
		data.check_time = t + wall_collision.start_check_time
		data.perform_check = true
	end

	local push_units_data = attack.push_units_in_the_way

	if push_units_data then
		self:push_close_units(unit, blackboard, t, push_units_data)
	end

	local bot_threats = attack.bot_threats and (attack.bot_threats[attack_anim] or attack.bot_threats[1] and attack.bot_threats)

	if bot_threats then
		local current_threat_index = 1
		local bot_threat = bot_threats[current_threat_index]
		local bot_threat_start_time, bot_threat_duration = AiUtils.calculate_bot_threat_time(bot_threat)

		blackboard.create_bot_threat_at_t = t + bot_threat_start_time
		blackboard.current_bot_threat_index = current_threat_index
		blackboard.bot_threat_duration = bot_threat_duration
		blackboard.bot_threats_data = bot_threats
	end

	local damage_done_time = attack.damage_done_time

	if damage_done_time then
		if type(damage_done_time) == "table" then
			blackboard.damage_done_time = t + damage_done_time[attack_anim]
		else
			blackboard.damage_done_time = t + damage_done_time
		end
	end

	local lock_attack_time = attack.lock_attack_time

	if lock_attack_time then
		blackboard.attack_locked_in_t = t + lock_attack_time
	end

	if blackboard.breed.use_backstab_vo then
		self:_backstab_sound(unit, blackboard)
	end

	return true
end

BTMeleeOverlapAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local locomotion_extension = blackboard.locomotion_extension

	if not destroy then
		if not blackboard.attack.enable_nav_extension then
			locomotion_extension:set_rotation_speed(nil)
			blackboard.navigation_extension:set_enabled(true)
		else
			blackboard.navigation_extension:reset_destination()
		end

		local wall_collision_data = blackboard.wall_collision_data

		if blackboard.attack_anim_driven then
			LocomotionUtils.set_animation_rotation_scale(unit, 1)
			LocomotionUtils.set_animation_driven_movement(unit, false)
			locomotion_extension:use_lerp_rotation(true)

			local is_stunned = wall_collision_data and wall_collision_data.is_stunned

			if blackboard.attack.animation_translation_scale or is_stunned then
				LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))
			end
		end

		if wall_collision_data then
			table.clear(wall_collision_data)
		end
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.attack_token = nil
	blackboard.anim_locked = nil
	blackboard.attack = nil
	blackboard.attack_anim_driven = nil
	blackboard.attack_rotation = nil
	blackboard.attack_rotation_update_timer = nil
	blackboard.attacking_target = nil
	blackboard.attack_started_at_t = nil
	blackboard.keep_target = nil
	blackboard.target_unit_status_extension = nil
	blackboard.last_combo_attack = nil
	blackboard.create_bot_threat_at_t = nil
	blackboard.current_bot_threat_index = nil
	blackboard.bot_threats_data = nil
	blackboard.bot_threat_duration = nil
	blackboard.damage_done_time = nil
	blackboard.attack_finished = nil
	blackboard.attack_aborted = nil
	blackboard.locked_target_unit = nil
	blackboard.past_damage_in_attack = nil
	blackboard.attack_locked_in_t = nil
	blackboard.backstab_attack_trigger = nil
	blackboard.attack_blend_end_t = nil

	if blackboard.continous_overlap_data then
		table.clear(blackboard.continous_overlap_data)
	end
end

BTMeleeOverlapAttackAction._attack_finished = function (self, unit, blackboard, t, dt)
	local action = blackboard.action

	if action.is_combo_attack and ALIVE[blackboard.locked_target_unit] then
		return not self:_init_attack(unit, blackboard.locked_target_unit, blackboard, action, t)
	end

	return true
end

BTMeleeOverlapAttackAction._calculate_cylinder_collision = function (self, attack, bot_threat, self_pos, self_rot)
	local radius = bot_threat.radius or attack.radius
	local height = bot_threat.height or attack.height
	local offset_up = bot_threat.offset_up or attack.offset_up
	local offset_forward = bot_threat.offset_forward or attack.offset_forward
	local half_height = height * 0.5
	local size = Vector3(radius, radius, half_height)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local cylinder_center = self_pos + forward * offset_forward + up * (half_height + offset_up)
	local rotation = Quaternion.look(up, Vector3.up())

	return cylinder_center, rotation, size
end

BTMeleeOverlapAttackAction._calculate_oobb_collision = function (self, attack, bot_threat, self_pos, self_rot)
	local range = bot_threat.range or attack.range
	local height = bot_threat.height or attack.height
	local width = bot_threat.width or attack.width
	local offset_up = bot_threat.offset_up or attack.offset_up
	local offset_forward = bot_threat.offset_forward or attack.offset_forward
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local size = Vector3(half_width, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward()) * (offset_forward + half_range)
	local up = Vector3.up() * (offset_up + half_height)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end

BTMeleeOverlapAttackAction._create_bot_aoe_threat = function (self, unit, attack_rotation, attack, bot_threat, bot_threat_duration)
	local unit_position = POSITION_LOOKUP[unit]
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	if bot_threat.collision_type == "cylinder" then
		local obstacle_position, _, obstacle_size = self:_calculate_cylinder_collision(attack, bot_threat, unit_position, attack_rotation)

		ai_bot_group_system:aoe_threat_created(obstacle_position, "cylinder", obstacle_size, nil, bot_threat_duration)
	elseif bot_threat.collision_type == "oobb" or not bot_threat.collision_type then
		local obstacle_position, obstacle_rotation, obstacle_size = self:_calculate_oobb_collision(attack, bot_threat, unit_position, attack_rotation)

		ai_bot_group_system:aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, bot_threat_duration)
	end
end

BTMeleeOverlapAttackAction._check_wall_collision = function (self, unit, blackboard, check_range, dt)
	local above, below = 1, 1
	local nav_world = blackboard.nav_world
	local from = POSITION_LOOKUP[unit]
	local success, z = GwNavQueries.triangle_from_position(nav_world, from, above, below)

	if not success then
		return true
	end

	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local speed = Vector3.length(velocity)
	local direction

	if speed > 0.01 then
		direction = Vector3.normalize(velocity)
	else
		local rotation = Unit.local_rotation(unit, 0)

		direction = Quaternion.forward(rotation)
	end

	local length = check_range + dt * speed
	local to = from + direction * length
	local success2, z2 = GwNavQueries.triangle_from_position(nav_world, to, above, below)

	if not success2 then
		return true
	end

	local ray_start = Vector3(from.x, from.y, z)
	local ray_end = Vector3(to.x, to.y, z2)
	local ray_can_go = GwNavQueries.raycango(nav_world, ray_start, ray_end)

	return not ray_can_go
end

BTMeleeOverlapAttackAction.run = function (self, unit, blackboard, t, dt)
	if not ALIVE[blackboard.locked_target_unit] or blackboard.attack_aborted then
		if blackboard.attack_locked_in_t and t <= blackboard.attack_locked_in_t then
			return "running"
		else
			return "done"
		end
	end

	if blackboard.attack_blend_end_t and t > blackboard.attack_blend_end_t then
		local attack = blackboard.attack
		local script_driven_rotation = attack.rotation_time and attack.rotation_time > 0

		blackboard.attack_blend_end_t = nil
		blackboard.attack_rotation_update_timer = attack.rotation_time + t

		LocomotionUtils.set_animation_driven_movement(unit, true, true, script_driven_rotation)
	end

	if t <= blackboard.anim_locked then
		local attack = blackboard.attack

		if blackboard.attack_rotation_update_timer then
			local locomotion_extension = blackboard.locomotion_extension
			local target_status_extension = blackboard.target_unit_status_extension

			if t < blackboard.attack_rotation_update_timer and (not target_status_extension or not target_status_extension:is_invisible() and (attack.ignores_dodging or not target_status_extension:get_is_dodging())) then
				local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.locked_target_unit)
				local rotation_speed = attack.rotation_speed

				if rotation_speed then
					locomotion_extension:use_lerp_rotation(true)
					locomotion_extension:set_rotation_speed(rotation_speed)
				end

				locomotion_extension:set_wanted_rotation(rot)
				blackboard.attack_rotation:store(rot)
			else
				blackboard.attack_rotation_update_timer = nil

				if blackboard.attack_anim_driven and not blackboard.attack_blend_end_t then
					locomotion_extension:set_animation_driven(true, true, false)
				end
			end
		end

		if blackboard.damage_done_time and t > blackboard.damage_done_time then
			blackboard.attacking_target = nil
			blackboard.damage_done_time = nil
		end

		local wall_collision_data = blackboard.wall_collision_data

		if wall_collision_data then
			if wall_collision_data.is_stunned then
				return "running"
			elseif wall_collision_data.perform_check and t > wall_collision_data.check_time then
				local collision = self:_check_wall_collision(unit, blackboard, wall_collision_data.check_range, dt)

				if collision then
					blackboard.anim_locked = t + wall_collision_data.stun_time
					blackboard.attacking_target = nil
					wall_collision_data.is_stunned = true

					Managers.state.network:anim_event(unit, randomize(wall_collision_data.animation))
					LocomotionUtils.set_animation_translation_scale(unit, Vector3.zero())
				end
			end
		end

		local push_units_data_continuous = attack.push_units_in_the_way_continuous

		if push_units_data_continuous then
			self:push_close_units(unit, blackboard, t, push_units_data_continuous)
		end

		local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

		if create_bot_threat_at_t and create_bot_threat_at_t < t then
			local attack_rotation = blackboard.attack_rotation:unbox()
			local bot_threats = blackboard.bot_threats_data
			local current_bot_threat_index = blackboard.current_bot_threat_index
			local current_bot_threat = bot_threats[current_bot_threat_index]
			local bot_threat_duration = blackboard.bot_threat_duration

			self:_create_bot_aoe_threat(unit, attack_rotation, attack, current_bot_threat, bot_threat_duration)

			local next_bot_threat_index = current_bot_threat_index + 1
			local next_bot_threat = bot_threats[next_bot_threat_index]

			if next_bot_threat then
				local attack_started_at_t = blackboard.attack_started_at_t
				local next_bot_threat_time, next_bot_threat_duration = AiUtils.calculate_bot_threat_time(next_bot_threat)

				blackboard.create_bot_threat_at_t = attack_started_at_t + next_bot_threat_time
				blackboard.bot_threat_duration = next_bot_threat_duration
				blackboard.current_bot_threat_index = next_bot_threat_index
			else
				blackboard.create_bot_threat_at_t = nil
				blackboard.bot_threat_duration = nil
				blackboard.current_bot_threat_index = nil
			end
		end

		local overlap_data = blackboard.continous_overlap_data

		if overlap_data and overlap_data.perform_overlap and t > overlap_data.start_time then
			local action = blackboard.action
			local physics_world = blackboard.physics_world

			self:weapon_sweep_overlap(unit, blackboard, action, attack, overlap_data, physics_world, t, dt)
		end

		if (not blackboard.attack_locked_in_t or t >= blackboard.attack_locked_in_t) and blackboard.attack_finished then
			blackboard.attack_finished = false

			if self:_attack_finished(unit, blackboard, t, dt) then
				return "done"
			end
		end

		return "running"
	elseif (not blackboard.attack_locked_in_t or t >= blackboard.attack_locked_in_t) and self:_attack_finished(unit, blackboard, t, dt) then
		return "done"
	end
end

BTMeleeOverlapAttackAction.push_player = function (self, unit, hit_unit, push_speed, push_speed_z, catapult_player)
	local self_pos = POSITION_LOOKUP[unit]
	local hit_unit_pos = POSITION_LOOKUP[hit_unit]
	local to_hit_unit = hit_unit_pos - self_pos
	local velocity = push_speed * Vector3.normalize(to_hit_unit)

	if push_speed_z then
		Vector3.set_z(velocity, push_speed_z)
	end

	if catapult_player then
		StatusUtils.set_catapulted_network(hit_unit, true, velocity)
	else
		local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

		locomotion_extension:add_external_velocity(velocity)
	end
end

BTMeleeOverlapAttackAction.hit_player = function (self, unit, blackboard, hit_unit, action, attack)
	local hit_unit_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")
	local attack_direction = action.attack_directions and action.attack_directions[blackboard.attack_anim]
	local dealt_damage = false

	if DamageUtils.check_block(unit, hit_unit, action.fatigue_type, attack_direction) then
		if not action.ignore_shield_block and DamageUtils.check_ranged_block(unit, hit_unit, action.shield_blocked_fatigue_type or "shield_blocked_slam") then
			self:push_player(unit, hit_unit, attack.player_push_speed_blocked, attack.player_push_speed_blocked_z, false)
		else
			if action.blocked_damage then
				AiUtils.damage_target(hit_unit, unit, action, action.blocked_damage)

				dealt_damage = true
			end

			if attack.player_push_speed_blocked and not hit_unit_status_extension.knocked_down then
				self:push_player(unit, hit_unit, attack.player_push_speed_blocked, attack.player_push_speed_blocked_z, attack.catapult_player)
			end
		end
	else
		AiUtils.damage_target(hit_unit, unit, action, action.damage)

		dealt_damage = true

		if attack.player_push_speed and not hit_unit_status_extension.knocked_down then
			self:push_player(unit, hit_unit, attack.player_push_speed, attack.player_push_speed_z, attack.catapult_player)
		end
	end

	if attack.hit_player_func then
		attack.hit_player_func(unit, blackboard, hit_unit, action, attack, dealt_damage)
	end
end

BTMeleeOverlapAttackAction.hit_ai = function (self, unit, hit_unit, action, attack, blackboard, t)
	local push_data = attack.push_ai
	local immune_breeds = attack.immune_breeds
	local damage_target_only = attack.damage_target_only
	local hit_unit_blackboard = BLACKBOARDS[hit_unit]

	if hit_unit_blackboard.is_illusion then
		return
	end

	if immune_breeds then
		local breed_name = hit_unit_blackboard.breed and hit_unit_blackboard.breed.name

		if immune_breeds[breed_name] then
			return
		end
	end

	if push_data then
		local stagger_type, stagger_duration = DamageUtils.calculate_stagger(push_data.stagger_impact, push_data.stagger_duration, hit_unit, unit)

		if stagger_type > 0 then
			local self_pos = POSITION_LOOKUP[unit]
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local direction = Vector3.normalize(hit_unit_pos - self_pos)
			local should_play_push_sound = true

			should_play_push_sound = not blackboard.commander_unit

			AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, direction, push_data.stagger_distance, stagger_type, stagger_duration, nil, t, nil, nil, nil, should_play_push_sound)
		end
	end

	if hit_unit == blackboard.attacking_target or not action.ignore_ai_damage then
		AiUtils.damage_target(hit_unit, unit, action, action.damage)
	end

	if attack.hit_ai_func then
		attack.hit_ai_func(unit, blackboard, hit_unit, action, attack)
	end

	if action.hit_ai_func then
		action.hit_ai_func(unit, blackboard, hit_unit, action, attack)
	end
end

BTMeleeOverlapAttackAction.anim_cb_frenzy_damage = function (self, unit, blackboard)
	self:anim_cb_damage(unit, blackboard)
end

BTMeleeOverlapAttackAction.anim_cb_damage = function (self, unit, blackboard)
	if not blackboard.attacking_target then
		return
	end

	blackboard.past_damage_in_attack = true

	local attack = blackboard.attack
	local width = attack.width
	local range = attack.range
	local height = attack.height
	local offset_up = attack.offset_up
	local offset_forward = attack.offset_forward
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local hit_size = Vector3(half_width, half_range, half_height)
	local unit_rotation = Unit.local_rotation(unit, 0)
	local forward = Quaternion.rotate(unit_rotation, Vector3.forward()) * (offset_forward + half_range)
	local unit_position = POSITION_LOOKUP[unit]
	local up = Vector3.up() * (offset_up + half_height)
	local oobb_pos = unit_position + forward + up
	local time_manager = Managers.time
	local t = time_manager:time("game")
	local action = blackboard.action
	local physics_world = blackboard.physics_world
	local overlap_update_radius = math.max(range, math.max(height, width))
	local hit_units = FrameTable.alloc_table()

	hit_units[unit] = true

	self:overlap_checks(unit, blackboard, physics_world, t, action, attack, oobb_pos, unit_rotation, hit_size, hit_units, overlap_update_radius)

	local push_units_data = attack.push_units_in_the_way

	if attack.push_close_units_during_attack and push_units_data then
		self:push_close_units(unit, blackboard, t, push_units_data)
	end
end

BTMeleeOverlapAttackAction.push_close_units = function (self, unit, blackboard, t, data)
	local self_rotation = Unit.local_rotation(unit, 0)
	local self_forward = Quaternion.forward(self_rotation)
	local self_pos = POSITION_LOOKUP[unit]
	local forward_offset = data.push_forward_offset
	local push_pos = self_pos + self_forward * forward_offset
	local dist = data.ahead_dist
	local forward_pos = push_pos + self_forward * dist
	local radius = math.max(data.push_width, dist) * 1.5
	local radius_sq = radius * radius
	local hit_units = FrameTable.alloc_table()
	local num_results = AiUtils.broadphase_query(push_pos, radius, hit_units)
	local push_width_sq = data.push_width^2
	local BLACKBOARDS = BLACKBOARDS

	for i = 1, num_results do
		local hit_unit = hit_units[i]

		if hit_unit ~= unit then
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local pos_projected_on_forward_move_dir, outside_interval = closest_point_on_line(hit_unit_pos, push_pos, forward_pos)
			local side_vector = hit_unit_pos - pos_projected_on_forward_move_dir

			if not outside_interval and push_width_sq > Vector3.length_squared(side_vector) then
				local stagger_type, stagger_duration = DamageUtils.calculate_stagger(data.push_stagger_impact, data.push_stagger_duration, hit_unit, unit)

				if stagger_type > stagger_types.none then
					local direction = Vector3.normalize(side_vector)
					local hit_unit_blackboard = BLACKBOARDS[hit_unit]

					AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, direction, data.push_stagger_distance, stagger_type, stagger_duration, nil, t)
				end
			end
		end
	end

	local side = blackboard.side
	local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #ENEMY_PLAYER_AND_BOT_UNITS do
		local hit_unit = ENEMY_PLAYER_AND_BOT_UNITS[i]
		local hit_unit_pos = POSITION_LOOKUP[hit_unit]
		local to_target = hit_unit_pos - push_pos

		if radius_sq > Vector3.length_squared(to_target) then
			local pos_projected_on_forward_move_dir, outside_interval = closest_point_on_line(hit_unit_pos, push_pos, forward_pos)
			local side_vector = hit_unit_pos - pos_projected_on_forward_move_dir

			if not outside_interval and push_width_sq > Vector3.length_squared(side_vector) then
				local hit_unit_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

				if not hit_unit_status_extension.knocked_down then
					local pushed_velocity = data.player_pushed_speed * Vector3.normalize(to_target)
					local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

					locomotion_extension:add_external_velocity(pushed_velocity)
				end
			end
		end
	end
end

BTMeleeOverlapAttackAction.weapon_sweep_overlap = function (self, unit, blackboard, action, attack, data, physics_world, t, dt)
	if blackboard.is_illusion then
		return
	end

	local weapon_unit = data.weapon_unit
	local to_old_frame_tip_node_pos
	local tip_node = data.tip_node
	local tip_node_pos = Unit.world_position(weapon_unit, tip_node)

	if data.tip_node_pos then
		local old_tip_node_pos = data.tip_node_pos:unbox()

		to_old_frame_tip_node_pos = old_tip_node_pos - tip_node_pos

		data.tip_node_pos:store(tip_node_pos)
	else
		to_old_frame_tip_node_pos = Vector3.zero()
		data.tip_node_pos = Vector3Box(tip_node_pos)
	end

	local frame_dist = Vector3.length(to_old_frame_tip_node_pos)
	local base_node = data.base_node
	local base_pos = Unit.world_position(data.weapon_unit, base_node)
	local width = attack.width + frame_dist
	local range = attack.range
	local height = attack.height
	local offset_up = attack.offset_up
	local offset_forward = attack.offset_forward
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local box_size = Vector3(half_width, half_range, half_height)
	local box_rot
	local base_to_tip = tip_node_pos - base_pos
	local up, forward

	if base_node == tip_node then
		box_rot = Unit.local_rotation(weapon_unit, base_node)
		up = Quaternion.up(box_rot) * (offset_up + half_height)
		forward = Quaternion.forward(box_rot) * (offset_forward + half_range)
	else
		box_rot = Quaternion.look(base_to_tip, Vector3.up())
		up = Quaternion.up(box_rot) * offset_up
		forward = Quaternion.forward(box_rot) * offset_forward
	end

	local mid_pos = base_pos + base_to_tip * 0.5
	local oobb_pos = mid_pos + up + forward + to_old_frame_tip_node_pos * 0.5
	local overlap_update_radius = math.max(range, math.max(height, width))
	local hit_units = data.hit_units
	local num_hit_units = self:overlap_checks(unit, blackboard, physics_world, t, action, attack, oobb_pos, box_rot, box_size, hit_units, overlap_update_radius)

	if not attack.hit_multiple_targets and num_hit_units > 0 then
		data.perform_overlap = false
	end
end

local debug_drawer_info = {
	mode = "retained",
	name = "BTMeleeOverlapAttackAction",
}

BTMeleeOverlapAttackAction.overlap_checks = function (self, unit, blackboard, physics_world, t, action, attack, oobb_pos, box_rot, box_size, hit_units, overlap_update_radius)
	if blackboard.is_illusion then
		return 0
	end

	local filter_name = attack.hit_only_players and "filter_player_hit_box_check" or "filter_player_and_enemy_hit_box_check"

	PhysicsWorld.prepare_actors_for_overlap(physics_world, oobb_pos, overlap_update_radius)

	local hit_actors, num_hit_actors = PhysicsWorld.immediate_overlap(physics_world, "position", oobb_pos, "rotation", box_rot, "size", box_size, "shape", "oobb", "types", "dynamics", "collision_filter", filter_name)

	if Development.parameter("debug_weapons") then
		local drawer = Managers.state.debug:drawer(debug_drawer_info)

		drawer:reset()

		local pose = Matrix4x4.from_quaternion_position(box_rot, oobb_pos)

		drawer:box(pose, box_size)
	end

	local self_pos = POSITION_LOOKUP[unit]
	local unit_rotation = Unit.local_rotation(unit, 0)
	local forward_dir = Quaternion.forward(unit_rotation)
	local hit_multiple_targets = attack.hit_multiple_targets
	local damage_target_only = attack.damage_target_only
	local num_hit_units = 0
	local allow_friendly_fire = action.allow_friendly_fire
	local side_manager = Managers.state.side

	for i = 1, num_hit_actors do
		local hit_actor = hit_actors[i]
		local hit_unit = hit_actor and Actor.unit(hit_actor)

		if Unit.alive(hit_unit) and not hit_units[hit_unit] then
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]

			if hit_unit_pos then
				local valid_side = true

				if not allow_friendly_fire then
					valid_side = Managers.state.side:is_enemy(unit, hit_unit)
				end

				if valid_side then
					local attack_dir = Vector3.normalize(hit_unit_pos - self_pos)

					if not attack.ignore_targets_behind or Vector3.dot(attack_dir, forward_dir) > 0 then
						if Managers.player:owner(hit_unit) then
							self:hit_player(unit, blackboard, hit_unit, action, attack)

							hit_units[hit_unit] = true
							num_hit_units = num_hit_units + 1

							if not hit_multiple_targets then
								break
							end
						elseif Unit.has_data(hit_unit, "breed") then
							self:hit_ai(unit, hit_unit, action, attack, blackboard, t)

							hit_units[hit_unit] = true
							num_hit_units = num_hit_units + 1

							if not hit_multiple_targets then
								break
							end
						end
					end
				end
			else
				print("BTMeleeOverlapAttackAction: HIT UNIT MISSING POSITION_LOOKUP ENTRY!", hit_unit)
			end
		end
	end

	return num_hit_units
end

BTMeleeOverlapAttackAction.anim_cb_attack_overlap_done = function (self, unit, blackboard)
	local overlap_data = blackboard.continous_overlap_data

	overlap_data.perform_overlap = nil
end

BTMeleeOverlapAttackAction.anim_cb_attack_grabbed_smash = function (self, unit, blackboard)
	local action = blackboard.action

	AiUtils.damage_target(blackboard.victim_grabbed, unit, action, action.damage)
end

BTMeleeOverlapAttackAction._backstab_sound = function (self, unit, blackboard)
	local breed = blackboard.breed
	local target_unit = blackboard.locked_target_unit

	if not blackboard.target_unit_status_extension or not target_unit then
		return
	end

	local player = Managers.player:unit_owner(target_unit)

	if not player or player.bot_player then
		return
	end

	local is_flanking = AiUtils.unit_is_flanking_player(unit, target_unit)

	if not is_flanking then
		return
	end

	if player.local_player then
		local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, unit, dialogue_extension.voice_node)
		local sound_event = breed.backstab_player_sound_event
		local audio_system_extension = Managers.state.entity:system("audio_system")

		audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
	else
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local unit_id = network_manager:unit_game_object_id(unit)
		local peer_id = player:network_id()

		network_transmit:send_rpc("rpc_check_trigger_backstab_sfx", peer_id, unit_id)
	end

	blackboard.backstab_attack_trigger = true
end
