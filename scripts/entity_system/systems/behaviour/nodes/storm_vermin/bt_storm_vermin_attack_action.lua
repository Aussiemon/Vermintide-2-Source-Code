-- chunkname: @scripts/entity_system/systems/behaviour/nodes/storm_vermin/bt_storm_vermin_attack_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormVerminAttackAction = class(BTStormVerminAttackAction, BTNode)

BTStormVerminAttackAction.init = function (self, ...)
	BTStormVerminAttackAction.super.init(self, ...)
end

BTStormVerminAttackAction.name = "BTStormVerminAttackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTStormVerminAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTStormVerminAttackAction
	blackboard.attack_range = action.range
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.target_speed = 0
	blackboard.attack_token = true
	blackboard.play_sound_delay = t + (action.sound_delay or 0)

	if action.blocked_anim then
		blackboard.blocked_anim = action.blocked_anim
	end

	local target_unit = blackboard.target_unit
	local target_unit_status_extension = ScriptUnit.has_extension(target_unit, "status_system") or nil

	blackboard.target_unit_status_extension = target_unit_status_extension
	blackboard.attacking_target = blackboard.target_unit

	self:_init_attack(unit, blackboard, t)

	if not blackboard.moving_attack then
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
		blackboard.navigation_extension:set_enabled(false)
	end

	blackboard.spawn_to_running = nil

	if target_unit_status_extension then
		local breed = blackboard.breed

		if breed.use_backstab_vo then
			local player = Managers.player:unit_owner(target_unit)

			if player and not player.bot_player then
				local is_flanking = AiUtils.unit_is_flanking_player(unit, target_unit)

				if player.local_player then
					if is_flanking then
						local dialogue_extension = ScriptUnit.extension(unit, "dialogue_system")
						local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, unit, dialogue_extension.voice_node)
						local sound_event = breed.backstab_player_sound_event
						local audio_system_extension = Managers.state.entity:system("audio_system")

						audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
					end
				else
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_id = network_manager:unit_game_object_id(unit)
					local peer_id = player:network_id()

					network_transmit:send_rpc("rpc_check_trigger_backstab_sfx", peer_id, unit_id)
				end
			end
		end

		AiUtils.add_attack_intensity(target_unit, action, blackboard)

		if blackboard.moving_attack and ScriptUnit.has_extension(unit, "ai_slot_system") then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system:set_release_slot_lock(unit, true)

			blackboard.keep_target = true
		end
	end

	blackboard.attacking_target_is_ai_breed = target_unit_status_extension == nil

	if action.attack_finished_duration then
		local difficulty = Managers.state.difficulty:get_difficulty()
		local attack_finished_duration = action.attack_finished_duration[difficulty]

		if attack_finished_duration then
			blackboard.attack_finished_t = t + Math.random_range(attack_finished_duration[1], attack_finished_duration[2])
		end
	end
end

BTStormVerminAttackAction._init_attack = function (self, unit, blackboard, t)
	local action = blackboard.action

	blackboard.move_state = "attacking"

	local attack_anim
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
		local should_use_step_attack = step_attack_target_speed_away < target_speed_away and step_attack_distance < flat_distance or step_attack_target_speed_away_override < target_speed_away or step_attack_distance_override < flat_distance

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

	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)

	blackboard.attack_rotation = QuaternionBox(rotation)

	if blackboard.moving_attack and action.rotation_time_step then
		blackboard.attack_rotation_update_timer = t + action.rotation_time_step
	else
		blackboard.attack_rotation_update_timer = t + action.rotation_time
	end

	local bot_threat_duration = action.bot_threat_duration

	if bot_threat_duration and not action.bot_threat_start_time then
		self:_create_bot_threat(unit, blackboard)
	elseif action.bot_threat_start_time then
		if blackboard.moving_attack and action.bot_threat_start_time_step then
			blackboard.bot_threat_at_t = t + action.bot_threat_start_time_step
		else
			blackboard.bot_threat_at_t = t + action.bot_threat_start_time
		end
	end
end

BTStormVerminAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.active_node = nil
	blackboard.anim_cb_stagger_immune = nil
	blackboard.attack_aborted = nil
	blackboard.attack_finished_at_t = nil
	blackboard.attack_rotation = nil
	blackboard.attack_rotation_update_timer = nil
	blackboard.reset_attack = nil
	blackboard.target_unit_status_extension = nil

	if blackboard.moving_attack and ScriptUnit.has_extension(unit, "ai_slot_system") then
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system:set_release_slot_lock(unit, false)

		blackboard.keep_target = nil
	end

	blackboard.anim_cb_attack_cooldown = nil
	blackboard.attack_finished_t = nil
	blackboard.attack_token = nil
	blackboard.attacking_target = nil
	blackboard.moving_attack = nil
	blackboard.reset_attack = nil
	blackboard.reset_attack_animation_locked = nil
	blackboard.reset_attack_delay = nil
	blackboard.past_damage_in_attack = nil

	local action = blackboard.action
	local reset_stagger_count = action.reset_stagger_count

	if reset_stagger_count then
		local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

		ai_base_extension:reset_stagger_count()
	end

	blackboard.action = nil
end

BTStormVerminAttackAction.run = function (self, unit, blackboard, t, dt)
	self:update_reset_attack(unit, t, dt, blackboard)

	if blackboard.attack_aborted then
		return "done"
	end

	local target_is_valid = Unit.alive(blackboard.attacking_target)

	if target_is_valid then
		self:attack(unit, t, dt, blackboard)
	else
		return "done"
	end

	if blackboard.catapult_hit then
		BTStormVerminAttackAction.catapult_enemies(unit, blackboard)
	end

	if blackboard.anim_cb_attack_cooldown and blackboard.attack_finished_t and t > blackboard.attack_finished_t or not blackboard.attack_finished_t and blackboard.attack_finished then
		return "done"
	end

	if blackboard.play_sound_delay and t > blackboard.play_sound_delay then
		local sound_event = blackboard.action.sound_event

		if sound_event then
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_audio_unit_event(sound_event, unit)
		end

		blackboard.play_sound_delay = nil
	end

	if blackboard.moving_attack then
		local breed = blackboard.breed
		local navigation_extension = blackboard.navigation_extension
		local distance = blackboard.target_dist
		local target_speed = blackboard.target_speed_away_small_sample

		if distance > 2.5 then
			if blackboard.set_dodge_rotation_timer then
				target_speed = breed.run_speed * 0.25
			else
				target_speed = breed.run_speed
			end
		elseif distance > 1.5 then
			target_speed = blackboard.set_dodge_rotation_timer and 0 or target_speed * 1.15
		end

		if math.abs(target_speed - blackboard.target_speed) > 0.25 then
			blackboard.target_speed = target_speed

			navigation_extension:set_max_speed(math.clamp(target_speed, 0, breed.run_speed))
		end
	end

	if target_is_valid and blackboard.bot_threat_at_t and t > blackboard.bot_threat_at_t then
		self:_create_bot_threat(unit, blackboard)

		blackboard.bot_threat_at_t = nil
	end

	return "running"
end

BTStormVerminAttackAction._create_bot_threat = function (self, unit, blackboard)
	local action = blackboard.action
	local bot_threat_duration = action.bot_threat_duration

	if bot_threat_duration then
		if action.collision_type == "cylinder" then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)
			local pos = self:_calculate_cylinder_collision(action, POSITION_LOOKUP[unit], rot)
			local size = Vector3(action.radius, action.radius, action.height * 0.5)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "cylinder", size, nil, bot_threat_duration)
		elseif action.collision_type == "oobb" or not action.collision_type then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)
			local pos, rot, size = self:_calculate_oobb_collision(action, POSITION_LOOKUP[unit], rot)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "oobb", size, rot, bot_threat_duration)
		end
	end
end

BTStormVerminAttackAction.anim_cb_attack_vce = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game and blackboard.target_unit_status_extension then
		DialogueSystem:trigger_attack(blackboard, blackboard.target_unit, unit, false, false)
	end
end

BTStormVerminAttackAction.anim_cb_attack_vce_long = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game and blackboard.target_unit_status_extension then
		DialogueSystem:trigger_attack(blackboard, blackboard.target_unit, unit, false, true)
	end
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
end

BTStormVerminAttackAction.attack = function (self, unit, t, dt, blackboard)
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")
	local target_status_ext = blackboard.target_unit_status_extension
	local zoink = target_status_ext and (target_status_ext:get_is_dodging() or target_status_ext:is_invisible())

	if zoink then
		blackboard.attack_rotation_update_timer = t
	end

	if t < blackboard.attack_rotation_update_timer then
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)

		blackboard.attack_rotation = QuaternionBox(rotation)
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_rotation(blackboard.attack_rotation:unbox())
end

local debug_drawer_info = {
	mode = "retained",
	name = "BTStormVerminAttackAction",
}

BTStormVerminAttackAction.anim_cb_damage = function (self, unit, blackboard)
	local action = blackboard.action

	blackboard.past_damage_in_attack = true

	local world = Unit.world(unit)
	local pw = World.get_data(world, "physics_world")
	local range = action.range
	local height = action.height
	local width = action.width
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local half_range = range * 0.5
	local half_height = height * 0.5
	local hit_size = Vector3(width * 0.5, half_range, half_height)
	local rat_pos = Unit.local_position(unit, 0)
	local rat_rot = Unit.local_rotation(unit, 0)
	local forward = Quaternion.rotate(rat_rot, Vector3.forward()) * (offset_forward + half_range)
	local up = Vector3.up() * (half_height + offset_up)
	local oobb_pos = rat_pos + forward + up
	local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", oobb_pos, "rotation", rat_rot, "size", hit_size, "shape", "oobb", "types", "dynamics", "collision_filter", "filter_player_hit_box_check")

	if Development.parameter("debug_weapons") then
		local drawer = Managers.state.debug:drawer(debug_drawer_info)

		drawer:reset()

		local pose = Matrix4x4.from_quaternion_position(rat_rot, oobb_pos)

		drawer:box(pose, hit_size)
	end

	local hit_units = FrameTable.alloc_table()

	if blackboard.moving_attack then
		blackboard.navigation_extension:set_enabled(false)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))
	else
		local t = Managers.time:time("game")
	end

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

					player_locomotion:add_external_velocity(push_speed * shove_dir, action.max_player_push_speed)
				end
			end
		end
	end

	if blackboard.attacking_target_is_ai_breed then
		AiUtils.damage_target(blackboard.attacking_target, unit, action, action.damage)
	end
end

BTStormVerminAttackAction.anim_cb_attack_finished = function (self, unit, blackboard)
	blackboard.attack_finished = true
end

BTStormVerminAttackAction._calculate_cylinder_collision = function (self, action, self_pos, self_rot)
	local radius = action.radius
	local height = action.height
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local offset_right = action.offset_right
	local half_height = height * 0.5
	local size = Vector3(radius, half_height, radius)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local right = Quaternion.right(self_rot)
	local cylinder_center = self_pos + forward * (radius + offset_forward) + up * (half_height + offset_up) + right * offset_right
	local rotation = Quaternion.look(up, Vector3.up())

	return cylinder_center, size, rotation
end

BTStormVerminAttackAction._calculate_oobb_collision = function (self, action, self_pos, self_rot)
	local range = action.range
	local height = action.height
	local width = action.width
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local half_range = range * 0.5
	local half_height = height * 0.5
	local size = Vector3(width * 0.5, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward()) * (offset_forward + half_range)
	local up = Vector3.up() * (half_height + offset_up)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end

BTStormVerminAttackAction.tag_catapult_enemy = function (unit, blackboard, action, target_unit, blocked)
	blackboard.catapult_list = blackboard.catapult_list or {}
	blackboard.catapult_list[target_unit] = blocked
	blackboard.catapult_hit = true
end

BTStormVerminAttackAction.catapult_enemies = function (unit, blackboard)
	local list = blackboard.catapult_list

	if list then
		local catapult_enemy_func = BTStormVerminAttackAction.catapult_enemy
		local action = blackboard.action

		for target_unit, blocked in pairs(list) do
			if Unit.alive(target_unit) then
				catapult_enemy_func(unit, blackboard, action, target_unit, blocked)
			end

			list[target_unit] = nil
		end
	end

	blackboard.catapult_hit = false
end

BTStormVerminAttackAction.catapult_enemy = function (unit, blackboard, action, target_unit, blocked)
	if not action.catapult then
		return
	end

	if blocked then
		-- Nothing
	else
		AiUtils.damage_target(target_unit, unit, action, action.damage)
	end

	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	if not target_status_extension.knocked_down then
		local self_pos = POSITION_LOOKUP[unit]
		local enemy_pos = POSITION_LOOKUP[target_unit]
		local shove_dir = Vector3.normalize(enemy_pos - self_pos)
		local shove_speed = action.shove_speed
		local push_velocity = shove_dir * shove_speed

		Vector3.set_z(push_velocity, action.shove_z_speed)
		StatusUtils.set_catapulted_network(target_unit, true, push_velocity)
	end
end
