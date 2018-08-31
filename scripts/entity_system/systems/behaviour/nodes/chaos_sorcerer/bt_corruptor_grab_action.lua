require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCorruptorGrabAction = class(BTCorruptorGrabAction, BTNode)

BTCorruptorGrabAction.init = function (self, ...)
	BTCorruptorGrabAction.super.init(self, ...)
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
	blackboard.has_dealed_damage = false
	blackboard.projectile_position = Vector3Box()
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")

	blackboard.corruptor_target = blackboard.target_unit
	blackboard.target_unit_status_extension = ScriptUnit.has_extension(blackboard.corruptor_target, "status_system") or nil

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

BTCorruptorGrabAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local sound_event = blackboard.action.grabbed_sound_event_2d_stop
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
	blackboard.has_grabbed_unit = nil
	blackboard.projectile_position = nil
	blackboard.target_dodged = nil
	blackboard.projectile_target_position = nil

	blackboard.locomotion_extension:use_lerp_rotation(false)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	if reason == "aborted" and blackboard.stagger and blackboard.play_grabbed_loop then
		blackboard.corruptor_grab_stagger = true
	end

	if Unit.alive(blackboard.grabbed_unit) then
		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_released", blackboard.grabbed_unit, false, unit)
		self:set_beam_state(unit, blackboard, "stop_beam")
	else
		self:set_beam_state(unit, blackboard, "stop_beam")
	end

	Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, blackboard.corruptor_target, "corruptor_grabbed")

	blackboard.corruptor_target = nil
	blackboard.grabbed_unit = nil
	blackboard.vanish_countdown = t
end

BTCorruptorGrabAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local corruptor_target = blackboard.corruptor_target

	if not AiUtils.is_of_interest_to_corruptor(unit, corruptor_target) then
		return "failed"
	end

	if blackboard.attack_aborted then
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "idle")

		return "failed"
	end

	if blackboard.attack_success then
		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_grabbed", corruptor_target, true, unit)

		blackboard.attack_success = nil
		blackboard.play_grabbed_loop = true
		blackboard.disable_player_timer = t + action.disable_player_time

		self:set_beam_state(unit, blackboard, "start_beam")
		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, corruptor_target, "corruptor_grabbed")
		Managers.state.network:anim_event(unit, action.drag_in_anim)
	end

	local success = self:attack(unit, t, dt, blackboard)

	if not blackboard.grabbed_unit then
		local target_status_ext = blackboard.target_unit_status_extension

		if target_status_ext and target_status_ext:get_is_dodging() then
			blackboard.target_dodged = true
		end

		self:overlap_players(unit, t, dt, blackboard)
	end

	if blackboard.attack_finished and blackboard.play_grabbed_loop then
		blackboard.attack_finished = nil

		StatusUtils.set_grabbed_by_corruptor_network("chaos_corruptor_dragging", corruptor_target, true, unit)
	end

	if blackboard.grabbed_unit and corruptor_target and blackboard.drain_life_at < t then
		local distance_to_corruptor_target = Vector3.distance(POSITION_LOOKUP[corruptor_target], POSITION_LOOKUP[unit])

		if distance_to_corruptor_target < 2.5 then
			self:drain_life(unit, blackboard)

			blackboard.drain_life_at = t + action.drain_life_tick_rate
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
	local corruptor_target = blackboard.corruptor_target
	local self_pos = POSITION_LOOKUP[unit] + Vector3.up()
	local target_unit_pos = POSITION_LOOKUP[corruptor_target] + Vector3.up()
	local world = blackboard.world
	local physics_world = World.physics_world(world)
	local is_target_in_line_of_sight = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos, target_unit_pos, physics_world)

	if is_target_in_line_of_sight then
		if blackboard.move_state ~= "attacking" then
			blackboard.move_state = "attacking"

			locomotion_extension:use_lerp_rotation(true)
			LocomotionUtils.set_animation_driven_movement(unit, true, false, true)
			Managers.state.network:anim_event(unit, action.attack_anim)
		end

		local rotation = LocomotionUtils.rotation_towards_unit(unit, blackboard.corruptor_target)

		locomotion_extension:set_wanted_rotation(rotation)

		return true
	end

	return false
end

BTCorruptorGrabAction.drain_life = function (self, unit, blackboard)
	local corruptor_target = blackboard.corruptor_target
	local action = blackboard.action

	AiUtils.damage_target(corruptor_target, unit, action, action.damage)

	local heal_type = "leech"
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local heal_amount = action.health_leech[difficulty_level]
	heal_amount = DamageUtils.networkify_damage(heal_amount)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension:add_heal(unit, heal_amount, nil, heal_type)

	blackboard.has_dealed_damage = true
end

BTCorruptorGrabAction.anim_cb_damage = function (self, unit, blackboard)
	if blackboard.active_node and blackboard.active_node == BTCorruptorGrabAction then
		self:set_beam_state(unit, blackboard, "projectile")
	end
end

BTCorruptorGrabAction.overlap_players = function (self, unit, t, dt, blackboard)
	if not blackboard.projectile_target_position then
		return
	end

	local target_unit = blackboard.corruptor_target
	local projectile_position = blackboard.projectile_position:unbox()
	local projectile_target_position = blackboard.projectile_target_position:unbox()
	local action = blackboard.action
	local radius = 2
	local target_position = projectile_target_position
	local to_target = projectile_target_position - projectile_position
	local dist = Vector3.length(Vector3.flat(to_target))

	if dist < radius then
		self:grab_player(unit, blackboard)
	end
end

BTCorruptorGrabAction.grab_player = function (self, unit, blackboard)
	local target_unit = blackboard.corruptor_target
	local self_pos = POSITION_LOOKUP[unit]
	local target_unit_pos = POSITION_LOOKUP[target_unit]
	local projectile_position = blackboard.projectile_position:unbox()
	local projectile_target_position = blackboard.projectile_target_position:unbox()
	local target_status_ext = blackboard.target_unit_status_extension
	local world = blackboard.world
	local physics_world = World.physics_world(world)
	local target_distance_squared = Vector3.distance_squared(projectile_target_position, target_unit_pos)

	if blackboard.target_dodged or target_status_ext:is_invisible() then
		local dodge_pos = target_unit_pos
		local dir = Vector3.normalize(Vector3.flat(dodge_pos - self_pos))
		local forward = Quaternion.forward(Unit.local_rotation(unit, 0))
		local dot_value = Vector3.dot(dir, forward)
		local angle = math.acos(dot_value)
		local distance_squared = Vector3.distance_squared(self_pos, dodge_pos)

		if (distance_squared < blackboard.action.min_dodge_angle_squared and math.radians_to_degrees(angle) <= blackboard.action.dodge_angle) or target_distance_squared < blackboard.action.dodge_distance * blackboard.action.dodge_distance then
			blackboard.attack_success = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos, target_unit_pos, physics_world)
		else
			QuestSettings.check_corruptor_dodge(target_unit)

			blackboard.attack_success = false
		end
	elseif blackboard.action.max_distance_squared < Vector3.distance_squared(self_pos, target_unit_pos) or target_distance_squared > 25 then
		blackboard.attack_success = false
	else
		blackboard.attack_success = PerceptionUtils.is_position_in_line_of_sight(unit, self_pos + Vector3.up(), target_unit_pos + Vector3.up(), physics_world)
	end

	if blackboard.attack_success then
		local first_person_extension = ScriptUnit.has_extension(blackboard.corruptor_target, "first_person_system")

		if blackboard.attack_success and first_person_extension then
			first_person_extension:animation_event("shake_get_hit")
		end

		blackboard.grabbed_unit = blackboard.corruptor_target
		slot13 = blackboard.action.grabbed_sound_event_2d
	else
		blackboard.attack_aborted = true
	end
end

BTCorruptorGrabAction.set_beam_state = function (self, unit, blackboard, state)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local target_unit_id = network_manager:unit_game_object_id(blackboard.corruptor_target or blackboard.grabbed_unit)

	if unit_id then
		Managers.state.network.network_transmit:send_rpc_all("rpc_set_corruptor_beam_state", unit_id, state, target_unit_id or unit_id)
	end
end

return
