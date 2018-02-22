require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormVerminAttackAction = class(BTStormVerminAttackAction, BTNode)
BTStormVerminAttackAction.init = function (self, ...)
	BTStormVerminAttackAction.super.init(self, ...)

	return 
end
BTStormVerminAttackAction.name = "BTStormVerminAttackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end

	return 
end

BTStormVerminAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTStormVerminAttackAction
	blackboard.attack_range = action.range
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.has_engaged = true
	blackboard.target_speed = 0
	blackboard.keep_target = true

	if action.blocked_anim then
		blackboard.blocked_anim = action.blocked_anim
	end

	local target_unit = blackboard.target_unit
	blackboard.target_unit_status_extension = (ScriptUnit.has_extension(target_unit, "status_system") and ScriptUnit.extension(target_unit, "status_system")) or nil
	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	blackboard.special_attacking_target = blackboard.target_unit

	self._init_attack(self, unit, blackboard, t)

	if not blackboard.moving_attack then
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
		blackboard.navigation_extension:set_enabled(false)
	end

	blackboard.spawn_to_running = nil
	local breed = blackboard.breed

	if breed.attack_player_sound_event and not breed.uses_attack_sfx_callback then
		self.trigger_attack_sound(self, action, unit, target_unit, blackboard, blackboard.target_unit_status_extension)
	end

	local attack_intensity = (blackboard.moving_attack and action.moving_attack_intensity) or action.attack_intensity or 0.75
	local target_unit_status_extension = blackboard.target_unit_status_extension

	if target_unit_status_extension then
		target_unit_status_extension.add_attack_intensity(target_unit_status_extension, attack_intensity*(math.random()*0.5 + 0.75))
	end

	return 
end
BTStormVerminAttackAction._init_attack = function (self, unit, blackboard, t)
	local action = blackboard.action
	blackboard.move_state = "attacking"
	local attack_anim = nil
	local target_is_knocked_down = blackboard.target_unit_status_extension and blackboard.target_unit_status_extension:is_knocked_down()

	if target_is_knocked_down and action.knocked_down_attack_anim then
		local self_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_unit] or Unit.world_position(unit, 0)
		local z_offset = target_pos.z - self_pos.z

		if z_offset < action.knocked_down_attack_threshold then
			attack_anim = randomize(action.knocked_down_attack_anim)
		else
			attack_anim = randomize(action.attack_anim)
		end
	elseif action.step_attack_anim then
		local self_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_unit] or Unit.world_position(unit, 0)
		local flat_distance = Vector3.distance(Vector3.flat(self_pos), Vector3.flat(target_pos))
		local step_attack_target_speed_away = action.step_attack_target_speed_away or 1
		local step_attack_distance = action.step_attack_distance or 1.5
		local step_attack_target_speed_away_override = action.step_attack_target_speed_away_override or 2
		local step_attack_distance_override = action.step_attack_distance_override or 3
		local target_speed_away = blackboard.target_speed_away_small_sample
		local should_use_step_attack = (step_attack_target_speed_away < target_speed_away and step_attack_distance < flat_distance) or step_attack_target_speed_away_override < target_speed_away or step_attack_distance_override < flat_distance

		if should_use_step_attack then
			blackboard.moving_attack = true
			attack_anim = randomize(action.step_attack_anim)
		else
			attack_anim = randomize(action.attack_anim)
		end
	else
		blackboard.moving_attack = action.moving_attack
		attack_anim = randomize(action.attack_anim)
	end

	Managers.state.network:anim_event(unit, attack_anim)

	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
	blackboard.attack_rotation = QuaternionBox(rotation)

	if blackboard.moving_attack and action.rotation_time_step then
		blackboard.attack_rotation_update_timer = t + action.rotation_time_step
	else
		blackboard.attack_rotation_update_timer = t + action.rotation_time
	end

	local bot_threat_duration = action.bot_threat_duration

	if bot_threat_duration and not action.bot_threat_start_time then
		self._create_bot_threat(self, unit, blackboard)
	elseif action.bot_threat_start_time then
		if blackboard.moving_attack and action.bot_threat_start_time_step then
			blackboard.bot_threat_at_t = t + action.bot_threat_start_time_step
		else
			blackboard.bot_threat_at_t = t + action.bot_threat_start_time
		end
	end

	return 
end
BTStormVerminAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.move_state = nil

	blackboard.navigation_extension:set_enabled(true)

	blackboard.target_unit_status_extension = nil
	blackboard.update_timer = 0
	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attack_rotation = nil
	blackboard.attack_rotation_update_timer = nil
	blackboard.reset_attack = nil
	blackboard.anim_cb_stagger_immune = nil
	blackboard.moving_attack = nil
	blackboard.special_attacking_target = nil
	blackboard.reset_attack = nil
	blackboard.reset_attack_delay = nil
	blackboard.reset_attack_animation_locked = nil
	blackboard.keep_target = nil
	local action = blackboard.action
	local reset_stagger_count = action.reset_stagger_count

	if reset_stagger_count then
		local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

		ai_base_extension.reset_stagger_count(ai_base_extension)
	end

	blackboard.action = nil

	return 
end
BTStormVerminAttackAction.run = function (self, unit, blackboard, t, dt)
	self.update_reset_attack(self, unit, t, dt, blackboard)

	if Unit.alive(blackboard.special_attacking_target) then
		self.attack(self, unit, t, dt, blackboard)
	end

	if blackboard.catapult_hit then
		BTStormVerminAttackAction.catapult_enemies(unit, blackboard)
	end

	if blackboard.attack_finished then
		return "done"
	end

	if blackboard.moving_attack then
		local breed = blackboard.breed
		local navigation_extension = blackboard.navigation_extension
		local distance = blackboard.target_dist
		local target_speed = blackboard.target_speed_away_small_sample

		if 2.5 < distance then
			if blackboard.set_dodge_rotation_timer then
				target_speed = breed.run_speed*0.25
			else
				target_speed = breed.run_speed
			end
		elseif 1.5 < distance then
			if blackboard.set_dodge_rotation_timer then
				target_speed = 0
			else
				target_speed = target_speed*1.15
			end
		end

		if 0.25 < math.abs(target_speed - blackboard.target_speed) then
			blackboard.target_speed = target_speed

			navigation_extension.set_max_speed(navigation_extension, math.clamp(target_speed, 0, breed.run_speed))
		end
	end

	if blackboard.special_attacking_target and blackboard.bot_threat_at_t and blackboard.bot_threat_at_t < t then
		self._create_bot_threat(self, unit, blackboard)

		blackboard.bot_threat_at_t = nil
	end

	return "running"
end
BTStormVerminAttackAction._create_bot_threat = function (self, unit, blackboard)
	local action = blackboard.action
	local bot_threat_duration = action.bot_threat_duration

	if bot_threat_duration then
		if action.collision_type == "cylinder" then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
			local pos = self._calculate_cylinder_collision(self, action, POSITION_LOOKUP[unit], rot)
			local size = Vector3(action.radius, action.radius, action.height*0.5)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "cylinder", size, nil, bot_threat_duration)
		elseif action.collision_type == "oobb" or not action.collision_type then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
			local pos, rot, size = self._calculate_oobb_collision(self, action, POSITION_LOOKUP[unit], rot)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "oobb", size, rot, bot_threat_duration)
		end
	end

	return 
end
BTStormVerminAttackAction.anim_cb_attack_vce = function (self, unit, blackboard)
	if blackboard.target_unit_status_extension then
		self.trigger_attack_sound(self, blackboard.action, unit, blackboard.target_unit, blackboard, blackboard.target_unit_status_extension)
	end

	return 
end
BTStormVerminAttackAction.trigger_attack_sound = function (self, action, unit, target_unit, blackboard)
	local breed = blackboard.breed
	local is_behind_player = AiUtils.unit_is_behind_player(unit, target_unit)
	local should_backstab = breed.use_backstab_vo and blackboard.total_slots_count < 5 and is_behind_player

	DialogueSystem:TriggerAttack(target_unit, unit, should_backstab, blackboard)

	if should_backstab then
		blackboard.backstab_attack_trigger = true
	end

	return 
end
BTStormVerminAttackAction.update_reset_attack = function (self, unit, t, dt, blackboard)
	local action = blackboard.action
	local reset_attack = blackboard.reset_attack
	local reset_attack_delay = blackboard.reset_attack_delay
	local reset_attack_animation_locked = blackboard.reset_attack_animation_locked

	if reset_attack and not reset_attack_animation_locked then
		local attack_anim = randomize(action.reset_attack_animations)

		Managers.state.network:anim_event_with_variable_float(unit, attack_anim, "reset_speed", 0.1)

		blackboard.reset_attack = false
	end

	if reset_attack_delay then
		blackboard.reset_attack_delay = reset_attack_delay - dt

		if reset_attack_delay < 0 then
			local reset_attack_animation_speed = action.reset_attack_animation_speed

			fassert(reset_attack_animation_speed, "no reset_attack_animation_speed for action %s", action.name)
			Managers.state.network:anim_set_variable_float(unit, "reset_speed", reset_attack_animation_speed)

			blackboard.reset_attack_delay = nil
		end
	end

	return 
end
BTStormVerminAttackAction.attack = function (self, unit, t, dt, blackboard)
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	local target_status_ext = blackboard.target_unit_status_extension

	if t < blackboard.attack_rotation_update_timer and target_status_ext and not target_status_ext.get_is_dodging(target_status_ext) and not target_status_ext.is_invisible(target_status_ext) then
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
		blackboard.attack_rotation = QuaternionBox(rotation)
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_wanted_rotation(locomotion_extension, blackboard.attack_rotation:unbox())

	return 
end
local debug_drawer_info = {
	mode = "retained",
	name = "BTStormVerminAttackAction"
}
BTStormVerminAttackAction.anim_cb_damage = function (self, unit, blackboard)
	local action = blackboard.action
	local world = Unit.world(unit)
	local pw = World.get_data(world, "physics_world")
	local range = action.range
	local height = action.height
	local width = action.width
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local half_range = range*0.5
	local half_height = height*0.5
	local hit_size = Vector3(width*0.5, half_range, half_height)
	local rat_pos = Unit.local_position(unit, 0)
	local rat_rot = Unit.local_rotation(unit, 0)
	local forward = Quaternion.rotate(rat_rot, Vector3.forward())*(offset_forward + half_range)
	local up = Vector3.up()*(half_height + offset_up)
	local oobb_pos = rat_pos + forward + up
	local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", oobb_pos, "rotation", rat_rot, "size", hit_size, "shape", "oobb", "types", "dynamics", "collision_filter", "filter_player_hit_box_check", "use_global_table")

	if Development.parameter("debug_weapons") then
		local drawer = Managers.state.debug:drawer(debug_drawer_info)

		drawer.reset(drawer)

		local pose = Matrix4x4.from_quaternion_position(rat_rot, oobb_pos)

		drawer.box(drawer, pose, hit_size)
	end

	local hit_units = FrameTable.alloc_table()

	if blackboard.moving_attack then
		blackboard.navigation_extension:set_enabled(false)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
	end

	blackboard.attack_rotation_update_timer = math.huge

	for _, actor in ipairs(hit_actors) do
		local target_unit = Actor.unit(actor)
		hit_units[target_unit] = true
	end

	for target_unit, _ in pairs(hit_units) do
		if not Unit.alive(target_unit) then
			return 
		end

		local attack_direction = action.attack_directions and action.attack_directions[blackboard.attack_anim]
		local blocked = DamageUtils.check_block(unit, target_unit, action.fatigue_type, attack_direction)

		if action.damage then
			if not blocked then
				AiUtils.damage_target(target_unit, unit, action, action.damage)
			elseif blocked and action.blocked_damage then
				AiUtils.damage_target(target_unit, unit, action, action.blocked_damage)
			end

			if DamageUtils.is_player_unit(target_unit) and blocked and action.fatigue_type == "complete" then
				SurroundingAwareSystem.add_event(target_unit, "breaking_hit", DialogueSettings.grabbed_broadcast_range, "profile_name", ScriptUnit.extension(target_unit, "dialogue_system").context.player_profile)
			end
		end

		if action.catapult then
			BTStormVerminAttackAction.tag_catapult_enemy(unit, blackboard, action, target_unit, blocked)
		end

		if action.push then
			local self_pos = POSITION_LOOKUP[unit]
			local enemy_pos = POSITION_LOOKUP[target_unit]
			local shove_dir = Vector3.normalize(enemy_pos - self_pos)
			local is_player_unit = DamageUtils.is_player_unit(target_unit)
			local push_speed = action.player_push_speed

			if is_player_unit and push_speed then
				local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

				if not target_status_extension.knocked_down then
					local player_locomotion = ScriptUnit.extension(target_unit, "locomotion_system")

					player_locomotion.add_external_velocity(player_locomotion, push_speed*shove_dir, action.max_player_push_speed)
				end
			end
		end
	end

	blackboard.special_attacking_target = nil

	return 
end
BTStormVerminAttackAction._calculate_cylinder_collision = function (self, action, self_pos, self_rot)
	local radius = action.radius
	local height = action.height
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local offset_right = action.offset_right
	local half_height = height*0.5
	local size = Vector3(radius, half_height, radius)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local right = Quaternion.right(self_rot)
	local cylinder_center = self_pos + forward*(radius + offset_forward) + up*(half_height + offset_up) + right*offset_right
	local rotation = Quaternion.look(up, Vector3.up())

	return cylinder_center, size, rotation
end
BTStormVerminAttackAction._calculate_oobb_collision = function (self, action, self_pos, self_rot)
	local range = action.range
	local height = action.height
	local width = action.width
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local half_range = range*0.5
	local half_height = height*0.5
	local size = Vector3(width*0.5, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward())*(offset_forward + half_range)
	local up = Vector3.up()*(half_height + offset_up)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end
BTStormVerminAttackAction.tag_catapult_enemy = function (unit, blackboard, action, target_unit, blocked)
	blackboard.catapult_list = blackboard.catapult_list or {}
	blackboard.catapult_list[target_unit] = blocked
	blackboard.catapult_hit = true

	return 
end
BTStormVerminAttackAction.catapult_enemies = function (unit, blackboard)
	local list = blackboard.catapult_list

	if list then
		local catapult_enemy_func = BTStormVerminAttackAction.catapult_enemy
		local action = blackboard.action

		for target_unit, blocked in pairs(list) do
			catapult_enemy_func(unit, blackboard, action, target_unit, blocked)

			list[target_unit] = nil
		end
	end

	blackboard.catapult_hit = false

	return 
end
BTStormVerminAttackAction.catapult_enemy = function (unit, blackboard, action, target_unit, blocked)
	if blocked then
	else
		AiUtils.damage_target(target_unit, unit, action, action.damage)
	end

	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	if not target_status_extension.knocked_down then
		local self_pos = POSITION_LOOKUP[unit]
		local enemy_pos = POSITION_LOOKUP[target_unit]
		local shove_dir = Vector3.normalize(enemy_pos - self_pos)
		local shove_speed = action.shove_speed
		local push_velocity = shove_dir*shove_speed

		Vector3.set_z(push_velocity, action.shove_z_speed)
		StatusUtils.set_catapulted_network(target_unit, true, push_velocity)
	end

	return 
end

return 
