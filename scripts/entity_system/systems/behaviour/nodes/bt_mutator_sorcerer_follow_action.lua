require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTMutatorSorcererFollowAction = class(BTMutatorSorcererFollowAction, BTNode)

BTMutatorSorcererFollowAction.init = function (self, ...)
	BTMutatorSorcererFollowAction.super.init(self, ...)
end

BTMutatorSorcererFollowAction.name = "BTMutatorSorcererFollowAction"

BTMutatorSorcererFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	local start_anims_table = action.start_anims_name
	local target_position = POSITION_LOOKUP[blackboard.target_unit]
	local start_animation = AiAnimUtils.get_start_move_animation(unit, target_position, start_anims_table)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
	navigation_extension:set_enabled(true)

	local network_manager = Managers.state.network
	blackboard.move_state = "moving"

	network_manager:anim_event(unit, "float_into")
	network_manager:anim_event(unit, start_animation)

	blackboard.physics_world = blackboard.physics_world or World.get_data(blackboard.world, "physics_world")
	local audio_system = Managers.state.entity:system("audio_system")
	local skulking_sound_event = action.skulking_sound_event

	audio_system:play_audio_unit_event(skulking_sound_event, unit)
end

BTMutatorSorcererFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local audio_system = Managers.state.entity:system("audio_system")
	local stop_skulking_sound_event = blackboard.action.stop_skulking_sound_event

	audio_system:play_audio_unit_event(stop_skulking_sound_event, unit)

	if blackboard.played_fast_movespeed_sound then
		local stop_fast_move_speed_sound_event = blackboard.action.stop_fast_move_speed_sound_event

		audio_system:play_audio_unit_event(stop_fast_move_speed_sound_event, unit)

		blackboard.played_fast_movespeed_sound = nil
	end

	local current_hunting_target = blackboard.current_hunting_target

	if Unit.alive(current_hunting_target) then
		local stop_hunting_sound_event = blackboard.action.stop_hunting_sound_event
		local player = Managers.player:unit_owner(current_hunting_target)
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local unit_id = network_manager.unit_storage:go_id(unit)

		network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, NetworkLookup.sound_events[stop_hunting_sound_event], unit_id, false, 0)
	end

	blackboard.action = nil
	blackboard.start_anim_locked = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.start_finished = nil
end

BTMutatorSorcererFollowAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.target_unit
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	if not AiUtils.is_of_interest_to_corruptor(unit, target_unit) then
		return "failed"
	end

	local current_position = POSITION_LOOKUP[unit]
	local target_position = POSITION_LOOKUP[target_unit]

	self:handle_movement_speed_bonus(unit, blackboard, action, current_position, target_position, target_unit)

	local distance_sq = Vector3.distance_squared(current_position, target_position)
	local attack_distance = action.distance_to_attack

	if distance_sq < attack_distance * attack_distance then
		local has_line_of_sight = PerceptionUtils.pack_master_has_line_of_sight_for_attack(blackboard.physics_world, unit, target_unit)

		if has_line_of_sight then
			return "done"
		end
	end

	local whereabouts_extension = ScriptUnit.extension(target_unit, "whereabouts_system")
	local pos_list, player_position_on_mesh = whereabouts_extension:closest_positions_when_outside_navmesh()

	if player_position_on_mesh then
		navigation_extension:move_to(target_position)
	elseif #pos_list > 0 then
		local position = pos_list[1]

		navigation_extension:move_to(position:unbox())
	else
		return "failed"
	end

	local hunting_sound_distance_sq = action.hunting_sound_distance * action.hunting_sound_distance
	local current_hunting_target = blackboard.current_hunting_target
	local hunting_sound_event = action.hunting_sound_event
	local stop_hunting_sound_event = action.stop_hunting_sound_event

	if distance_sq <= hunting_sound_distance_sq and current_hunting_target ~= target_unit then
		local player = Managers.player:unit_owner(target_unit)
		local is_player_controlled = player and player:is_player_controlled()

		if is_player_controlled then
			local peer_id = player:network_id()
			local network_manager = Managers.state.network
			local unit_id = network_manager.unit_storage:go_id(unit)

			network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, NetworkLookup.sound_events[hunting_sound_event], unit_id, false, 0)

			if Unit.alive(current_hunting_target) then
				player = Managers.player:unit_owner(current_hunting_target)
				peer_id = player:network_id()

				network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, NetworkLookup.sound_events[stop_hunting_sound_event], unit_id, false, 0)
			end

			blackboard.current_hunting_target = target_unit
		end
	elseif hunting_sound_distance_sq < distance_sq and Unit.alive(current_hunting_target) then
		local player = Managers.player:unit_owner(current_hunting_target)
		local is_player_controlled = player and player:is_player_controlled()

		if is_player_controlled then
			local peer_id = player:network_id()
			local network_manager = Managers.state.network
			local unit_id = network_manager.unit_storage:go_id(unit)

			network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, NetworkLookup.sound_events[stop_hunting_sound_event], unit_id, false, 0)
		end

		blackboard.current_hunting_target = nil
	end

	return "running"
end

BTMutatorSorcererFollowAction.check_infront = function (self, unit, target_unit, action)
	local target_unit_pos = Unit.world_position(target_unit, 0)
	local unit_pos = Unit.world_position(unit, 0)
	local target_unit_to_unit_dir = Vector3.normalize(unit_pos - target_unit_pos)
	local first_person_extension = ScriptUnit.has_extension(target_unit, "first_person_system")
	local unit_direction = nil

	if first_person_extension then
		unit_direction = Quaternion.forward(first_person_extension:current_rotation())
	else
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(target_unit)
		unit_direction = GameSession.game_object_field(network_manager:game(), unit_id, "aim_direction")
	end

	local angle = Vector3.dot(unit_direction, target_unit_to_unit_dir)
	local is_infront = angle >= 0.6 and angle <= 1
	local movement_value = math.abs((1 - angle) / 0.4 - 1) * action.infront_movement_multiplier

	return is_infront, movement_value
end

BTMutatorSorcererFollowAction.handle_movement_speed_bonus = function (self, unit, blackboard, action, current_position)
	local is_infront, movement_value, has_line_of_sight = nil
	local fast_move_speed_sound_event = action.fast_move_speed_sound_event
	local stop_fast_move_speed_sound_event = action.stop_fast_move_speed_sound_event
	local navigation_extension = blackboard.navigation_extension
	local target_position = nil
	local blackboard_target_unit = blackboard.target_unit
	local side = Managers.state.side.side_by_unit[blackboard_target_unit]
	local PLAYER_AND_BOT_UNITS = side.PLAYER_AND_BOT_UNITS

	for k, target_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		target_position = POSITION_LOOKUP[target_unit]
		is_infront, movement_value = self:check_infront(unit, target_unit, action)
		has_line_of_sight = PerceptionUtils.is_position_in_line_of_sight(unit, current_position + Vector3.up(), target_position + Vector3.up(), blackboard.physics_world)

		if is_infront and has_line_of_sight then
			break
		end
	end

	local distance = Vector3.distance(current_position, POSITION_LOOKUP[blackboard.target_unit])

	if is_infront and Vector3.length(current_position - target_position) > 0 and has_line_of_sight then
		local move_speed = action.slow_down_on_look_at and action.slow_move_speed or action.fast_move_speed * movement_value

		navigation_extension:set_max_speed(move_speed)

		if move_speed == action.slow_move_speed and blackboard.played_fast_movespeed_sound then
			self:play_movement_sound(unit, stop_fast_move_speed_sound_event)

			blackboard.played_fast_movespeed_sound = nil
		elseif not action.slow_down_on_look_at and not blackboard.played_fast_movespeed_sound then
			self:play_movement_sound(unit, fast_move_speed_sound_event)

			blackboard.played_fast_movespeed_sound = true
		end
	elseif action.catchup_distance < distance or not has_line_of_sight then
		local catchup_speed = action.catchup_speed

		navigation_extension:set_max_speed(catchup_speed)

		if not blackboard.played_fast_movespeed_sound then
			self:play_movement_sound(unit, fast_move_speed_sound_event)

			blackboard.played_fast_movespeed_sound = true
		end
	else
		local move_speed = action.slow_down_on_look_at and action.fast_move_speed * 4 or action.slow_move_speed

		navigation_extension:set_max_speed(move_speed)

		if action.slow_down_on_look_at and not blackboard.played_fast_movespeed_sound then
			self:play_movement_sound(unit, fast_move_speed_sound_event)

			blackboard.played_fast_movespeed_sound = true
		elseif move_speed == action.slow_move_speed then
			self:play_movement_sound(unit, stop_fast_move_speed_sound_event)

			blackboard.played_fast_movespeed_sound = nil
		end
	end
end

BTMutatorSorcererFollowAction.play_movement_sound = function (self, unit, sound_event)
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event(sound_event, unit)
end
