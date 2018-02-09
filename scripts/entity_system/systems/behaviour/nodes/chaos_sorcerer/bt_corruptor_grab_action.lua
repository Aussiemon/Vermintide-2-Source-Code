require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCorruptorGrabAction = class(BTCorruptorGrabAction, BTNode)
BTCorruptorGrabAction.init = function (self, ...)
	BTCorruptorGrabAction.super.init(self, ...)

	return 
end
BTCorruptorGrabAction.name = "BTCorruptorGrabAction"
BTCorruptorGrabAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTCorruptorGrabAction
	blackboard.attacks_done = 0
	blackboard.attack_aborted = nil
	blackboard.attack_success = nil
	blackboard.drain_life_at = t
	blackboard.projectile_position = Vector3Box()
	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, blackboard.target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id)

	blackboard.target_unit_status_extension = ScriptUnit.has_extension(blackboard.target_unit, "status_system") or nil

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	return 
end
BTCorruptorGrabAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local sound_event = blackboard.action.grabbed_sound_event_2d_stop

	self.play_grabbed_2d_sound(self, unit, blackboard, sound_event)

	blackboard.move_state = nil

	blackboard.navigation_extension:set_enabled(true)

	blackboard.target_unit_status_extension = nil
	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attack_finished = nil
	blackboard.attack_success = nil
	blackboard.attack_cooldown = t + blackboard.action.cooldown
	blackboard.action = nil
	blackboard.ready_to_summon = nil
	blackboard.disable_player_timer = nil
	blackboard.play_grabbed_loop = nil
	blackboard.drain_life_at = nil
	blackboard.drag_target_unit = nil
	blackboard.projectile_position = nil

	if reason == "aborted" and blackboard.stagger then
		blackboard.corruptor_grab_stagger = true
	end

	if Unit.alive(blackboard.grabbed_unit) then
		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_released", blackboard.target_unit, false, unit)
		self.set_beam_state(self, unit, blackboard, "stop_beam")
		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, blackboard.grabbed_unit, "corruptor_grabbed")

		blackboard.grabbed_unit = nil
	else
		self.set_beam_state(self, unit, blackboard, "stop_beam")
	end

	blackboard.vanish_countdown = t

	return 
end
BTCorruptorGrabAction.run = function (self, unit, blackboard, t, dt)
	if not AiUtils.is_of_interest_to_corruptor(unit, blackboard.target_unit) then
		return "failed"
	end

	if blackboard.attack_aborted then
		local network_manager = Managers.state.network

		network_manager.anim_event(network_manager, unit, "idle")

		return "failed"
	end

	if blackboard.attack_success then
		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_grabbed", blackboard.target_unit, true, unit)

		blackboard.attack_success = nil
		blackboard.play_grabbed_loop = true
		blackboard.grabbed_unit = blackboard.target_unit
		blackboard.disable_player_timer = t + blackboard.action.disable_player_time

		self.set_beam_state(self, unit, blackboard, "start_beam")
		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, blackboard.grabbed_unit, "corruptor_grabbed")
		Managers.state.network:anim_event(unit, blackboard.action.drag_in_anim)
	end

	local success = self.attack(self, unit, t, dt, blackboard)

	if not blackboard.drag_target_unit then
		self.overlap_players(self, unit, t, dt, blackboard)
	end

	if blackboard.attack_finished and blackboard.play_grabbed_loop then
		blackboard.attack_finished = nil

		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_dragging", blackboard.target_unit, true, unit)
	end

	if blackboard.grabbed_unit and blackboard.drain_life_at < t then
		local distance_to_grabbed_unit = Vector3.distance(POSITION_LOOKUP[blackboard.grabbed_unit], POSITION_LOOKUP[unit])

		if distance_to_grabbed_unit < 2 then
			self.drain_life(self, unit, blackboard)

			blackboard.drain_life_at = t + blackboard.action.drain_life_tick_rate
		end
	end

	if not success or (blackboard.attack_finished and not blackboard.play_grabbed_loop) or (blackboard.disable_player_timer and blackboard.disable_player_timer < t) then
		return "done"
	end

	return "running"
end
BTCorruptorGrabAction.attack = function (self, unit, t, dt, blackboard)
	local action = blackboard.action
	local locomotion_extension = blackboard.locomotion_extension
	local target_unit = blackboard.target_unit
	local self_pos = POSITION_LOOKUP[unit] + Vector3.up()
	local target_unit_pos = POSITION_LOOKUP[target_unit] + Vector3.up()
	local world = blackboard.world
	local physics_world = World.physics_world(world)
	local is_target_in_line_of_sight = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos, target_unit_pos, physics_world)

	if is_target_in_line_of_sight then
		if blackboard.move_state ~= "attacking" then
			blackboard.move_state = "attacking"

			locomotion_extension.use_lerp_rotation(locomotion_extension, true)
			LocomotionUtils.set_animation_driven_movement(unit, true, false, true)
			Managers.state.network:anim_event(unit, action.attack_anim)
		end

		local rotation = LocomotionUtils.rotation_towards_unit(unit, blackboard.target_unit)

		locomotion_extension.set_wanted_rotation(locomotion_extension, rotation)

		return true
	end

	return false
end
BTCorruptorGrabAction.drain_life = function (self, unit, blackboard)
	local grabbed_unit = blackboard.grabbed_unit
	local action = blackboard.action

	AiUtils.damage_target(grabbed_unit, unit, action, action.damage)

	local heal_type = "leech"
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local heal_amount = action.health_leech[difficulty_level]
	heal_amount = DamageUtils.networkify_damage(heal_amount)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension.add_heal(health_extension, unit, heal_amount, nil, heal_type)

	return 
end
BTCorruptorGrabAction.anim_cb_damage = function (self, unit, blackboard)
	if blackboard.active_node and blackboard.active_node == BTCorruptorGrabAction then
		self.set_beam_state(self, unit, blackboard, "projectile")
	end

	return 
end
BTCorruptorGrabAction.overlap_players = function (self, unit, t, dt, blackboard)
	local target_unit = blackboard.target_unit
	local projectile_position = blackboard.projectile_position:unbox()
	local action = blackboard.action
	local radius = action.projectile_radius
	local target_position = POSITION_LOOKUP[target_unit]
	local to_target = target_position - projectile_position
	local dist = Vector3.length(Vector3.flat(to_target))

	if dist < radius then
		self.grab_player(self, unit, blackboard)
	end

	return 
end
BTCorruptorGrabAction.grab_player = function (self, unit, blackboard)
	local target_unit = blackboard.target_unit
	local self_pos = POSITION_LOOKUP[unit]
	local target_unit_pos = POSITION_LOOKUP[target_unit]
	local target_status_ext = blackboard.target_unit_status_extension
	local world = blackboard.world
	local physics_world = World.physics_world(world)

	if target_status_ext and (target_status_ext.get_is_dodging(target_status_ext) or target_status_ext.is_invisible(target_status_ext)) then
		local dodge_pos = target_unit_pos
		local dir = Vector3.normalize(Vector3.flat(dodge_pos - self_pos))
		local forward = Quaternion.forward(Unit.local_rotation(unit, 0))
		local dot_value = Vector3.dot(dir, forward)
		local angle = math.acos(dot_value)
		local distance_squared = Vector3.distance_squared(self_pos, dodge_pos)

		if math.radians_to_degrees(angle) <= blackboard.action.dodge_angle and distance_squared < blackboard.action.dodge_distance*blackboard.action.dodge_distance then
			blackboard.attack_success = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos, target_unit_pos, physics_world)
		else
			blackboard.attack_success = false
		end
	else
		blackboard.attack_success = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos + Vector3.up(), target_unit_pos + Vector3.up(), physics_world)
	end

	if blackboard.attack_success then
		local first_person_extension = ScriptUnit.has_extension(blackboard.target_unit, "first_person_system")

		if blackboard.attack_success and first_person_extension then
			first_person_extension.animation_event(first_person_extension, "shake_get_hit")
		end

		blackboard.drag_target_unit = blackboard.target_unit
		local sound_event = blackboard.action.grabbed_sound_event_2d

		self.play_grabbed_2d_sound(self, unit, blackboard, sound_event)
	else
		blackboard.attack_aborted = true
	end

	return 
end
BTCorruptorGrabAction.set_beam_state = function (self, unit, blackboard, state)
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, blackboard.target_unit) or network_manager.unit_game_object_id(network_manager, blackboard.grabbed_unit)

	if unit_id and target_unit_id then
		Managers.state.network.network_transmit:send_rpc_all("rpc_set_corruptor_beam_state", unit_id, state, target_unit_id)
	else
		print("Corruptor Sorcerer failed to set beam state ", state, ". Unit: ", unit, " Target Unit: ", blackboard.target_unit, " Grabbed Unit: ", blackboard.grabbed_unit)
	end

	return 
end
BTCorruptorGrabAction.play_grabbed_2d_sound = function (self, unit, blackboard, sound_event)
	local player_unit = blackboard.target_unit
	local player = Managers.player:unit_owner(player_unit)

	if not player.bot_player then
		local audio_system_extension = Managers.state.entity:system("audio_system")
		local sound_event_id = NetworkLookup.sound_events[sound_event]
		local unit_id = NetworkUnit.game_object_id(player_unit)

		if player.local_player then
			WwiseUtils.trigger_unit_event(audio_system_extension.world, sound_event, player_unit, 0)
		elseif unit_id then
			Managers.state.network.network_transmit:send_rpc("rpc_server_audio_unit_event", player.peer_id, sound_event_id, unit_id, 0)
		end
	end

	return 
end

return 
