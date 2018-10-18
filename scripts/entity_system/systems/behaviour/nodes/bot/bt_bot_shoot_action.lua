require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotShootAction = class(BTBotShootAction, BTNode)

BTBotShootAction.init = function (self, ...)
	BTBotShootAction.super.init(self, ...)
end

BTBotShootAction.name = "BTBotShootAction"
local DEFAULT_AIM_DATA = {
	min_radius_pseudo_random_c = 0.0557,
	max_radius_pseudo_random_c = 0.01475,
	min_radius = math.pi / 72,
	max_radius = math.pi / 16
}
local THIS_UNIT = nil

local function dprint(...)
	if script_data.ai_bots_weapon_debug and script_data.debug_unit == THIS_UNIT then
		print(...)
	end
end

BTBotShootAction.enter = function (self, unit, blackboard, t)
	local input_ext = blackboard.input_extension
	local soft_aiming = false

	input_ext:set_aiming(true, soft_aiming, true)

	local target_unit = blackboard.target_unit
	local action_data = self._tree_node.action_data
	local inventory_extension = blackboard.inventory_extension
	local wielded_slot_name = action_data.slot_name or inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(wielded_slot_name)
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	local attack_meta_data = item_template.attack_meta_data or {}
	local base_attack_action = item_template.actions[attack_meta_data.base_action_name or "action_one"]
	local attack_action = base_attack_action.default
	local charged_attack_action = base_attack_action[attack_meta_data.charged_attack_action_name or "shoot_charged"] or attack_action
	blackboard.shoot = {
		obstructed = true,
		charging_shot = false,
		num_aim_rolls = 0,
		attack_meta_data = attack_meta_data,
		attack_action = attack_action,
		charged_attack_action = charged_attack_action,
		aim_data = attack_meta_data.aim_data or DEFAULT_AIM_DATA,
		aim_data_charged = attack_meta_data.aim_data_charged or attack_meta_data.aim_data or DEFAULT_AIM_DATA,
		reevaluate_aim_time = t,
		can_charge_shot = attack_meta_data.can_charge_shot,
		charge_shot_delay = attack_meta_data.charge_shot_delay,
		fire_input = attack_meta_data.fire_input or "fire",
		next_evaluate = t + action_data.evaluation_duration,
		next_evaluate_without_firing = t + action_data.evaluation_duration_without_firing,
		minimum_charge_time = attack_meta_data.minimum_charge_time,
		reevaluate_obstruction_time = t,
		charge_range_squared = (attack_meta_data.charge_above_range and attack_meta_data.charge_above_range^2) or nil,
		max_range_squared = (attack_meta_data.max_range and attack_meta_data.max_range^2) or math.huge,
		max_range_squared_charged = (attack_meta_data.max_range_charged and attack_meta_data.max_range_charged^2) or (attack_meta_data.max_range and attack_meta_data.max_range^2) or math.huge,
		charge_when_obstructed = attack_meta_data.charge_when_obstructed,
		charge_when_outside_max_range = attack_meta_data.charge_when_outside_max_range,
		charge_when_outside_max_range_charged = attack_meta_data.charge_when_outside_max_range_charged == nil or attack_meta_data.charge_when_outside_max_range_charged,
		charge_against_armored_enemy = attack_meta_data.charge_against_armored_enemy,
		always_charge_before_firing = attack_meta_data.always_charge_before_firing,
		aim_at_node = attack_meta_data.aim_at_node or "j_spine",
		aim_at_node_charged = attack_meta_data.aim_at_node_charged or attack_meta_data.aim_at_node or "j_spine",
		projectile_info = attack_action.projectile_info,
		projectile_info_charged = charged_attack_action.projectile_info,
		projectile_speed = attack_action.min_speed or attack_action.speed,
		projectile_speed_charged = charged_attack_action.max_speed or charged_attack_action.min_speed or charged_attack_action.speed,
		obstruction_fuzzyness_range = attack_meta_data.obstruction_fuzzyness_range,
		obstruction_fuzzyness_range_charged = attack_meta_data.obstruction_fuzzyness_range_charged or attack_meta_data.obstruction_fuzzyness_range
	}
	blackboard.ranged_obstruction_by_static = nil
	local shoot_bb = blackboard.shoot

	self:_set_new_aim_target(unit, t, shoot_bb, target_unit, blackboard.first_person_extension)
	self:_update_collision_filter(target_unit, shoot_bb, blackboard.priority_target_enemy, blackboard.target_ally_unit, blackboard.target_ally_needs_aid, blackboard.target_ally_need_type)
end

BTBotShootAction._update_collision_filter = function (self, target_unit, shoot_blackboard, priority_target_enemy, target_ally_unit, target_ally_needs_aid, need_type)
	local attack_meta_data = shoot_blackboard.attack_meta_data
	local target_bb = BLACKBOARDS[target_unit]
	local has_important_target = target_unit == priority_target_enemy or (target_ally_needs_aid and (need_type == "hook" or need_type == "knocked_down" or need_type == "ledge") and target_bb and target_bb.target_unit == target_ally_unit)

	if has_important_target then
		shoot_blackboard.collision_filter = "filter_bot_ranged_line_of_sight_no_allies_no_enemies"
		shoot_blackboard.collision_filter_charged = "filter_bot_ranged_line_of_sight_no_allies_no_enemies"

		return
	end

	local ignore_enemies_for_obstruction = attack_meta_data.ignore_enemies_for_obstruction
	local ignore_enemies_for_obstruction_charged = (attack_meta_data.ignore_enemies_for_obstruction_charged == nil and ignore_enemies_for_obstruction) or attack_meta_data.ignore_enemies_for_obstruction_charged
	local ff_ranged = Managers.state.difficulty:get_difficulty_settings().friendly_fire_ranged
	local ignore_hitting_allies, ignore_hitting_allies_charged = nil

	if ff_ranged then
		ignore_hitting_allies = attack_meta_data.ignore_allies_for_obstruction
		ignore_hitting_allies_charged = attack_meta_data.ignore_allies_for_obstruction_charged
	else
		ignore_hitting_allies = true
		ignore_hitting_allies_charged = true
	end

	shoot_blackboard.collision_filter = (ignore_enemies_for_obstruction and ignore_hitting_allies and "filter_bot_ranged_line_of_sight_no_allies_no_enemies") or (ignore_hitting_allies and "filter_bot_ranged_line_of_sight_no_allies") or (ignore_enemies_for_obstruction and "filter_bot_ranged_line_of_sight_no_enemies") or "filter_bot_ranged_line_of_sight"
	shoot_blackboard.collision_filter_charged = (ignore_enemies_for_obstruction_charged and ignore_hitting_allies_charged and "filter_bot_ranged_line_of_sight_no_allies_no_enemies") or (ignore_hitting_allies_charged and "filter_bot_ranged_line_of_sight_no_allies") or (ignore_enemies_for_obstruction_charged and "filter_bot_ranged_line_of_sight_no_enemies") or "filter_bot_ranged_line_of_sight"
end

BTBotShootAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local input_ext = blackboard.input_extension

	input_ext:set_aiming(false)

	local action_data = self._tree_node.action_data
	local shoot_blackboard = blackboard.shoot

	if shoot_blackboard.charging_shot and action_data.abort_input then
		input_ext[action_data.abort_input](input_ext)
	end

	blackboard.shoot = nil
end

BTBotShootAction.run = function (self, unit, blackboard, t, dt)
	THIS_UNIT = unit
	local done, evaluate = self:_aim(unit, blackboard, dt, t)

	if done then
		return "done", "evaluate"
	else
		return "running", (evaluate and "evaluate") or nil
	end
end

BTBotShootAction._set_new_aim_target = function (self, self_unit, t, shoot_blackboard, target_unit, first_person_ext)
	local camera_position = first_person_ext:current_position()
	local camera_rotation = first_person_ext:current_rotation()
	local projectile_info, projectile_speed, aim_at_node = nil
	local breed = Unit.get_data(target_unit, "breed")

	if shoot_blackboard.charging_shot then
		projectile_info = shoot_blackboard.projectile_info_charged
		projectile_speed = shoot_blackboard.projectile_speed_charged
		aim_at_node = breed.override_bot_target_node or shoot_blackboard.aim_at_node_charged
	else
		projectile_info = shoot_blackboard.projectile_info
		projectile_speed = shoot_blackboard.projectile_speed
		aim_at_node = breed.override_bot_target_node or shoot_blackboard.aim_at_node
	end

	local wanted_aim_rotation = self:_wanted_aim_rotation(self_unit, target_unit, camera_position, projectile_info, projectile_speed, aim_at_node)
	local diff_rotation = Quaternion.multiply(Quaternion.inverse(camera_rotation), wanted_aim_rotation)
	local angle = Quaternion.angle(diff_rotation)
	shoot_blackboard.target_unit = target_unit
	shoot_blackboard.aim_start_time = t
	shoot_blackboard.aim_speed_yaw = 0
	shoot_blackboard.aim_speed_pitch = 0
	shoot_blackboard.target_breed = breed
	shoot_blackboard.reevaluate_obstruction_time = t
	shoot_blackboard.obstructed = false
end

local function draw_estimated_arc(max_steps, max_time, position, velocity, gravity)
	local time_step = max_time / max_steps

	for i = 1, max_steps, 1 do
		local new_position = position + velocity * time_step
		local delta = new_position - position

		QuickDrawer:line(position, new_position, Color(100, 200, 200))

		velocity = velocity + gravity * time_step
		position = new_position
	end
end

BTBotShootAction._wanted_aim_rotation = function (self, self_unit, target_unit, current_position, projectile_info, projectile_speed, aim_at_node)
	local target_node = Unit.node(target_unit, aim_at_node)
	local target_pos = Unit.world_position(target_unit, target_node)
	local target_locomotion_extension = ScriptUnit.has_extension(target_unit, "locomotion_system")
	local target_current_velocity = (target_locomotion_extension and target_locomotion_extension:current_velocity()) or Vector3.zero()
	local target_rotation, target_position = nil
	local prediction_function = projectile_info and ProjectileTemplates.trajectory_templates[projectile_info.trajectory_template_name].prediction_function

	if prediction_function then
		local gravity_setting = ProjectileGravitySettings[projectile_info.gravity_settings]
		local angle = nil

		Profiler.start("trajectory prediction")

		angle, target_position = prediction_function(projectile_speed / 100, -gravity_setting, current_position, target_pos, target_current_velocity)

		Profiler.stop("trajectory prediction")

		if not angle then
			if self_unit == script_data.debug_unit then
				print("BTBotShootAction no angle found, target out of range")
			end

			angle = math.pi * 0.25
		end

		target_rotation = Quaternion.multiply(Quaternion.look(Vector3.normalize(Vector3.flat(target_position - current_position)), Vector3.up()), Quaternion(Vector3.right(), angle))

		if self_unit == script_data.debug_unit then
			QuickDrawer:sphere(target_position, 0.1, Color(0, 0, 255))
			QuickDrawer:sphere(current_position, 0.1, Color(0, 0, 255))
			QuickDrawer:vector(current_position, Quaternion.forward(target_rotation) * 3, Color(0, 0, 255))
			draw_estimated_arc(100, 1, current_position, Quaternion.forward(target_rotation) * projectile_speed * 0.01, Vector3(0, 0, gravity_setting))
		end
	else
		target_position = target_pos
		target_rotation = Quaternion.look(Vector3.normalize(target_position - current_position), Vector3.up())
	end

	return target_rotation, target_position
end

BTBotShootAction._aim_position = function (self, dt, t, self_unit, current_position, current_rotation, target_unit, shoot_blackboard)
	local projectile_info, projectile_speed, aim_at_node = nil

	if shoot_blackboard.charging_shot then
		projectile_info = shoot_blackboard.projectile_info_charged
		projectile_speed = shoot_blackboard.projectile_speed_charged
		aim_at_node = shoot_blackboard.target_breed.override_bot_target_node or shoot_blackboard.aim_at_node_charged
	else
		projectile_info = shoot_blackboard.projectile_info
		projectile_speed = shoot_blackboard.projectile_speed
		aim_at_node = shoot_blackboard.target_breed.override_bot_target_node or shoot_blackboard.aim_at_node
	end

	local wanted_rotation, aim_position = self:_wanted_aim_rotation(self_unit, target_unit, current_position, projectile_info, projectile_speed, aim_at_node)
	local current_yaw = Quaternion.yaw(current_rotation)
	local current_pitch = Quaternion.pitch(current_rotation)
	local wanted_yaw = Quaternion.yaw(wanted_rotation)
	local wanted_pitch = Quaternion.pitch(wanted_rotation)
	local yaw_speed, pitch_speed = self:_calculate_aim_speed(self_unit, dt, current_yaw, current_pitch, wanted_yaw, wanted_pitch, shoot_blackboard.aim_speed_yaw, shoot_blackboard.aim_speed_pitch)
	shoot_blackboard.aim_speed_yaw = yaw_speed
	shoot_blackboard.aim_speed_pitch = pitch_speed
	local new_yaw = current_yaw + yaw_speed * dt
	local new_pitch = current_pitch + pitch_speed * dt
	local yaw_rot = Quaternion(Vector3.up(), new_yaw)
	local pitch_rot = Quaternion(Vector3.right(), new_pitch)
	local actual_rotation = Quaternion.multiply(yaw_rot, pitch_rot)
	local pi = math.pi
	local yaw_offset = (new_yaw - wanted_yaw + pi) % (pi * 2) - pi
	local pitch_offset = new_pitch - wanted_pitch

	return yaw_offset, pitch_offset, wanted_rotation, actual_rotation, aim_position
end

BTBotShootAction._calculate_aim_speed = function (self, self_unit, dt, current_yaw, current_pitch, wanted_yaw, wanted_pitch, current_yaw_speed, current_pitch_speed)
	local pi = math.pi
	local yaw_offset = (wanted_yaw - current_yaw + pi) % (pi * 2) - pi
	local pitch_offset = wanted_pitch - current_pitch
	local yaw_offset_sign = math.sign(yaw_offset)
	local yaw_speed_sign = math.sign(current_yaw_speed)
	local has_overshot = yaw_speed_sign ~= 0 and yaw_offset_sign ~= yaw_speed_sign
	local wanted_yaw_speed = yaw_offset * math.pi * 10
	local new_yaw_speed = nil
	local acceleration = 7.5
	local deceleration = 25

	if has_overshot and yaw_offset_sign > 0 then
		new_yaw_speed = math.min(current_yaw_speed + deceleration * dt, 0)
	elseif has_overshot then
		new_yaw_speed = math.max(current_yaw_speed - deceleration * dt, 0)
	elseif yaw_offset_sign > 0 then
		if current_yaw_speed <= wanted_yaw_speed then
			new_yaw_speed = math.min(current_yaw_speed + acceleration * dt, wanted_yaw_speed)
		else
			new_yaw_speed = math.max(current_yaw_speed - deceleration * dt, wanted_yaw_speed)
		end
	elseif wanted_yaw_speed <= current_yaw_speed then
		new_yaw_speed = math.max(current_yaw_speed - acceleration * dt, wanted_yaw_speed)
	else
		new_yaw_speed = math.min(current_yaw_speed + deceleration * dt, wanted_yaw_speed)
	end

	local lerped_pitch_speed = pitch_offset / dt

	return new_yaw_speed, lerped_pitch_speed
end

BTBotShootAction._may_attack = function (self, enemy_unit, shoot_blackboard, range_squared, t)
	local ai_extension = ScriptUnit.has_extension(enemy_unit, "ai_system")

	if not ai_extension then
		return false
	end

	local bb = ai_extension:blackboard()
	local charging = shoot_blackboard.charging_shot
	local sufficiently_charged = not shoot_blackboard.minimum_charge_time or (not shoot_blackboard.always_charge_before_firing and not charging) or (charging and shoot_blackboard.minimum_charge_time <= t - shoot_blackboard.charge_start_time)
	local max_range_squared = (charging and shoot_blackboard.max_range_squared_charged) or shoot_blackboard.max_range_squared
	local may_fire = sufficiently_charged and not bb.hesitating and not bb.in_alerted_state and not shoot_blackboard.obstructed and range_squared < max_range_squared

	return may_fire
end

BTBotShootAction._aim = function (self, unit, blackboard, dt, t)
	local target_unit = blackboard.target_unit

	if not Unit.alive(target_unit) then
		return true
	end

	local shoot_bb = blackboard.shoot
	local first_person_ext = blackboard.first_person_extension
	local camera_position = first_person_ext:current_position()
	local camera_rotation = first_person_ext:current_rotation()

	if target_unit ~= shoot_bb.target_unit then
		self:_set_new_aim_target(unit, t, shoot_bb, target_unit, first_person_ext)
	end

	local action_data = self._tree_node.action_data
	local yaw_offset, pitch_offset, wanted_aim_rotation, actual_aim_rotation, actual_aim_position = self:_aim_position(dt, t, unit, camera_position, camera_rotation, target_unit, shoot_bb)

	if shoot_bb.reevaluate_obstruction_time <= t then
		if self:_reevaluate_obstruction(unit, shoot_bb, action_data, t, World.get_data(blackboard.world, "physics_world"), camera_position, wanted_aim_rotation, unit, target_unit, actual_aim_position, blackboard.priority_target_enemy, blackboard.target_ally_unit, blackboard.target_ally_needs_aid, blackboard.target_ally_need_type) then
			if not blackboard.ranged_obstruction_by_static then
				local obstructed_by_static = {
					timer = t
				}
			end

			obstructed_by_static.unit = target_unit
			blackboard.ranged_obstruction_by_static = obstructed_by_static
		else
			blackboard.ranged_obstruction_by_static = nil
		end
	end

	local input_ext = blackboard.input_extension
	local range_squared = Vector3.distance_squared(camera_position, actual_aim_position)

	if self:_should_charge(shoot_bb, range_squared, target_unit, t) then
		self:_charge_shot(shoot_bb, action_data, input_ext, t)
	end

	input_ext:set_aim_rotation(actual_aim_rotation)

	if self:_aim_good_enough(dt, t, shoot_bb, yaw_offset, pitch_offset) and self:_may_attack(target_unit, shoot_bb, range_squared, t) then
		self:_fire_shot(shoot_bb, action_data, input_ext, t)
	end

	local evaluate = (shoot_bb.fired and shoot_bb.next_evaluate < t) or shoot_bb.next_evaluate_without_firing < t

	if evaluate then
		shoot_bb.next_evaluate = t + action_data.evaluation_duration
		shoot_bb.next_evaluate_without_firing = t + action_data.evaluation_duration_without_firing
		shoot_bb.fired = false
	end

	return false, evaluate
end

BTBotShootAction._aim_good_enough = function (self, dt, t, shoot_blackboard, yaw_offset, pitch_offset)
	local bb = shoot_blackboard

	if not bb.reevaluate_aim_time then
		bb.reevaluate_aim_time = 0
	end

	if bb.reevaluate_aim_time < t then
		local aim_data = (bb.charging_shot and bb.aim_data_charged) or bb.aim_data
		local offset = math.sqrt(pitch_offset * pitch_offset + yaw_offset * yaw_offset)

		if aim_data.max_radius < offset then
			bb.aim_good_enough = false

			dprint("bad aim - offset:", offset)
		else
			local success = nil
			local num_rolls = bb.num_aim_rolls + 1

			if offset < aim_data.min_radius then
				success = Math.random() < aim_data.min_radius_pseudo_random_c * num_rolls
			else
				local prob = math.auto_lerp(aim_data.min_radius, aim_data.max_radius, aim_data.min_radius_pseudo_random_c, aim_data.max_radius_pseudo_random_c, offset) * num_rolls
				success = Math.random() < prob
			end

			if success then
				bb.aim_good_enough = true
				bb.num_aim_rolls = 0

				dprint("fire! - offset:", offset, " num_rolls:", num_rolls)
			else
				bb.aim_good_enough = false
				bb.num_aim_rolls = num_rolls

				dprint("not yet - offset:", offset, " num_rolls:", num_rolls)
			end
		end

		bb.reevaluate_aim_time = t + 0.1
	end

	return bb.aim_good_enough
end

BTBotShootAction._should_charge = function (self, shoot_blackboard, range_squared, target_unit, t)
	local next_charge_shot_t = shoot_blackboard.next_charge_shot_t

	if not shoot_blackboard.can_charge_shot or (next_charge_shot_t and t < next_charge_shot_t) then
		return false
	end

	local max_range_squared_charged = shoot_blackboard.max_range_squared_charged

	if shoot_blackboard.max_range_squared_charged < range_squared and not shoot_blackboard.charge_when_outside_max_range_charged then
		return false
	end

	if shoot_blackboard.obstructed then
		return shoot_blackboard.charge_when_obstructed or false
	end

	local max_range_squared = shoot_blackboard.max_range_squared

	if max_range_squared < range_squared then
		return shoot_blackboard.charge_when_outside_max_range
	end

	return shoot_blackboard.always_charge_before_firing or shoot_blackboard.charging_shot or (shoot_blackboard.charge_range_squared and shoot_blackboard.charge_range_squared < range_squared) or (shoot_blackboard.charge_against_armored_enemy and (not shoot_blackboard.target_breed or shoot_blackboard.target_breed.armor_category == 2))
end

BTBotShootAction._fire_shot = function (self, shoot_blackboard, action_data, input_extension, t)
	shoot_blackboard.charging_shot = false
	shoot_blackboard.charge_start_time = nil
	shoot_blackboard.fired = true

	if action_data.fire_input ~= "none" then
		local input = action_data.fire_input or shoot_blackboard.fire_input

		input_extension[input](input_extension)
	end

	if shoot_blackboard.charge_shot_delay then
		shoot_blackboard.next_charge_shot_t = t + shoot_blackboard.charge_shot_delay
	end
end

BTBotShootAction._charge_shot = function (self, shoot_blackboard, action_data, input_extension, t)
	if not shoot_blackboard.charging_shot then
		shoot_blackboard.charge_start_time = t
		shoot_blackboard.charging_shot = true
	end

	local input = action_data.charge_input or "charge_shot"

	input_extension[input](input_extension)
end

BTBotShootAction._reevaluate_obstruction = function (self, unit, shoot_blackboard, action_data, t, physics_world, ray_from, wanted_aim_rotation, self_unit, target_unit, actual_aim_position, priority_target_enemy, target_ally_unit, target_ally_needs_aid, target_ally_need_type)
	self:_update_collision_filter(target_unit, shoot_blackboard, priority_target_enemy, target_ally_unit, target_ally_needs_aid, target_ally_need_type)

	local direction = Quaternion.forward(wanted_aim_rotation)
	local min = action_data.minimum_obstruction_reevaluation_time
	local max = action_data.maximum_obstruction_reevaluation_time
	local collision_filter = (shoot_blackboard.charging_shot and shoot_blackboard.collision_filter_charged) or shoot_blackboard.collision_filter
	local obstructed, distance_from_target, obstructed_by_static = self:_is_shot_obstructed(physics_world, ray_from, direction, unit, target_unit, actual_aim_position, collision_filter)
	local fuzzyness = nil

	if obstructed then
		if shoot_blackboard.charging_shot then
			fuzzyness = shoot_blackboard.obstruction_fuzzyness_range_charged
		else
			fuzzyness = shoot_blackboard.obstruction_fuzzyness_range
		end

		if fuzzyness and distance_from_target <= fuzzyness then
			obstructed = false
		end
	end

	shoot_blackboard.obstructed = obstructed
	shoot_blackboard.reevaluate_obstruction_time = t + min + Math.random() * (max - min)

	return obstructed_by_static
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

BTBotShootAction._is_shot_obstructed = function (self, physics_world, from, direction, self_unit, target_unit, actual_aim_position, collision_filter)
	local max_distance = Vector3.length(actual_aim_position - from)

	PhysicsWorld.prepare_actors_for_raycast(physics_world, from, direction, 0.01, 0.5, max_distance * max_distance)

	local raycast_hits = PhysicsWorld.immediate_raycast(physics_world, from, direction, max_distance, "all", "collision_filter", collision_filter)

	if not raycast_hits then
		return false
	end

	local num_hits = #raycast_hits

	for i = 1, num_hits, 1 do
		local hit = raycast_hits[i]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)

		if hit_unit == target_unit then
			return false
		elseif hit_unit ~= self_unit then
			local obstructed_by_static = Actor.is_static(hit_actor)

			if script_data.debug_unit == self_unit and script_data.ai_bots_weapon_debug then
				QuickDrawerStay:line(from, hit[INDEX_POSITION])
				QuickDrawerStay:sphere(hit[INDEX_POSITION], 0.05, Color(255, 0, 0))
			end

			return true, max_distance - hit[INDEX_DISTANCE], obstructed_by_static
		end
	end

	return false
end

return
