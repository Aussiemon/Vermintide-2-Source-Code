BTSpawnAllies = class(BTSpawnAllies, BTNode)

BTSpawnAllies.init = function (self, ...)
	BTSpawnAllies.super.init(self, ...)
end

BTSpawnAllies.name = "BTSpawnAllies"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTSpawnAllies.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTSpawnAllies
	blackboard.disable_improve_slot_position = true
	local stay_still = action.stay_still
	local find_spawn_points = action.find_spawn_points
	local call_position, data = nil

	if blackboard.has_call_position then
		data = blackboard.spawning_allies
		call_position = action.stay_still or data.call_position:unbox()
		blackboard.has_call_position = false
	elseif find_spawn_points then
		data = {
			end_time = math.huge
		}
		blackboard.spawning_allies = data
		call_position = BTSpawnAllies.find_spawn_point(unit, blackboard, action, data)
	end

	if blackboard.override_spawn_allies_call_position then
		call_position = blackboard.override_spawn_allies_call_position:unbox()

		data.call_position:store(call_position)

		stay_still = false
	end

	if stay_still then
		if action.animation then
			Managers.state.network:anim_event(unit, randomize(action.animation))
		end

		blackboard.navigation_extension:set_enabled(false)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
	else
		local nav_ext = blackboard.navigation_extension

		nav_ext:set_max_speed(action.run_to_spawn_speed)
		nav_ext:move_to(call_position)

		blackboard.run_speed_overridden = true

		if blackboard.move_state ~= "moving" then
			local start_anim, anim_locked = LocomotionUtils.get_start_anim(unit, blackboard, action.start_anims)

			if anim_locked then
				LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
				blackboard.locomotion_extension:use_lerp_rotation(false)

				blackboard.follow_animation_locked = anim_locked
				blackboard.anim_cb_rotation_start = nil
				blackboard.move_animation_name = start_anim
				local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, POSITION_LOOKUP[blackboard.target_unit], start_anim, action.start_anims_data)

				LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)

				blackboard.move_animation_name = nil
			end

			Managers.state.network:anim_event(unit, start_anim or action.move_anim)

			blackboard.move_state = "moving"
		end
	end

	if action.has_ward then
		self:_activate_ward(unit, blackboard)
	end

	local stinger_name = action.stinger_name

	if stinger_name and not blackboard.played_stinger then
		local wwise_world = Managers.world:wwise_world(blackboard.world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, stinger_name)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[stinger_name])

		blackboard.played_stinger = true
	end
end

BTSpawnAllies.leave = function (self, unit, blackboard, t, reason)
	local nav_ext = blackboard.navigation_extension

	nav_ext:set_enabled(true)

	blackboard.disable_improve_slot_position = false

	if blackboard.action.stay_still then
		if blackboard.action.defensive_mode_duration then
			if type(blackboard.action.defensive_mode_duration) == "table" then
				local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
				blackboard.defensive_mode_duration = blackboard.action.defensive_mode_duration[difficulty_rank]
			else
				blackboard.defensive_mode_duration = blackboard.action.defensive_mode_duration
			end
		end

		blackboard.action = nil
		blackboard.spawning_allies = nil
		blackboard.spawned_allies_wave = blackboard.spawned_allies_wave + 1
	else
		nav_ext:set_max_speed(blackboard.run_speed)

		blackboard.run_speed_overridden = nil

		if blackboard.action.defensive_mode_duration and type(blackboard.action.defensive_mode_duration) == "table" then
			local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
			blackboard.defensive_mode_duration = blackboard.action.defensive_mode_duration[difficulty_rank]
		else
			blackboard.defensive_mode_duration = blackboard.action.defensive_mode_duration or 20
		end

		blackboard.action = nil
		blackboard.spawning_allies = nil
		blackboard.spawned_allies_wave = blackboard.spawned_allies_wave + 1
	end

	if blackboard.follow_animation_locked and not destroy then
		self:_release_animation_lock(unit, blackboard)
	end

	blackboard.active_node = nil
end

BTSpawnAllies._activate_ward = function (self, unit, blackboard)
	local ward_function = blackboard.action.ward_function

	if not blackboard.ward_active then
		blackboard.ward_active = true

		ward_function(unit, true, true)
	end
end

local function draw(shape, ...)
	if script_data.ai_champion_spawn_debug then
		QuickDrawerStay[shape](QuickDrawerStay, ...)
	end
end

local function dprint(...)
	if script_data.ai_champion_spawn_debug then
		print(...)
	end
end

local SPAWN_POS_TEMP = {}

BTSpawnAllies.find_spawn_point = function (unit, blackboard, action, data, override_spawn_group)
	local spawn_group = override_spawn_group or action.optional_go_to_spawn or action.spawn_group
	local spawner_system = Managers.state.entity:system("spawner_system")
	local spawners_raw = spawner_system._id_lookup[spawn_group]

	if not spawners_raw and action.use_fallback_spawners then
		spawners_raw = spawner_system._enabled_spawners
	end

	fassert(spawners_raw, "Level %s is lacking spawners of spawner group %s, this is necessary to use BTSpawnAllies behaviour in breed %s", Managers.state.game_mode:level_key(), spawn_group, blackboard.breed.name)

	local spawners = table.clone(spawners_raw)
	local side = blackboard.side
	local ENEMY_PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local average_player_position = Vector3(0, 0, 0)
	local num_players = 0

	for i, pos in ipairs(ENEMY_PLAYER_AND_BOT_POSITIONS) do
		local player_unit = ENEMY_PLAYER_AND_BOT_UNITS[i]

		if not ScriptUnit.extension(player_unit, "status_system"):is_disabled() then
			num_players = num_players + 1
			average_player_position = average_player_position + pos
		end
	end

	local Vector3_distance_squared = Vector3.distance_squared
	local call_position = POSITION_LOOKUP[unit]

	if num_players > 0 then
		local flat_average_player_position = Vector3.flat(average_player_position / num_players)
		local best_dist_sq = -math.huge
		local best_index = nil
		local num_spawners = #spawners

		for i = 1, num_spawners, 1 do
			local spawner = spawners[i]
			local pos = ScriptUnit.extension(spawner, "spawner_system"):spawn_position()
			SPAWN_POS_TEMP[i] = pos
			local dist_sq = Vector3_distance_squared(Vector3.flat(pos), flat_average_player_position)

			if best_dist_sq < dist_sq then
				best_dist_sq = dist_sq
				best_index = i
			end
		end

		for i, pos in pairs(SPAWN_POS_TEMP) do
			draw("sphere", pos, 0.05, Color(255, 255, 255))
		end

		local best_pos = SPAWN_POS_TEMP[best_index]
		local best_other_index = nil
		local best_other_dist_sq = math.huge

		for i = 1, num_spawners, 1 do
			if i ~= best_index then
				local pos = SPAWN_POS_TEMP[i]
				local dist_sq = Vector3_distance_squared(Vector3.flat(pos), Vector3.flat(best_pos))

				if dist_sq < best_other_dist_sq then
					best_other_index = i
					best_other_dist_sq = dist_sq
				end
			end
		end

		local spawner_1 = spawners[best_index]
		local spawner_2 = spawners[best_other_index]
		local fwd = Vector3.normalize(Vector3.flat(Quaternion.forward(ScriptUnit.extension(spawner_1, "spawner_system"):spawn_rotation()) + Quaternion.forward(ScriptUnit.extension(spawner_2, "spawner_system"):spawn_rotation())))
		local pos1 = SPAWN_POS_TEMP[best_index]
		local pos2 = SPAWN_POS_TEMP[best_other_index]

		draw("sphere", pos1, 0.34, Color(0, 255, 255))
		draw("sphere", pos2, 0.34, Color(0, 255, 255))

		local average_pos = (SPAWN_POS_TEMP[best_index] + SPAWN_POS_TEMP[best_other_index]) * 0.5
		average_pos.z = math.max(SPAWN_POS_TEMP[best_index].z, SPAWN_POS_TEMP[best_other_index].z)

		draw("sphere", average_pos, 0.34, Color(0, 255, 255))
		draw("line", pos1, pos2, Color(0, 255, 255))

		local step = 0.25
		local nav_world = blackboard.nav_world
		local check_pos = average_pos + fwd * 1.5
		local above = 0.25
		local below = 10
		local success, z = nil

		draw("line", average_pos, check_pos, Color(0, 255, 255))

		for i = 1, 10, 1 do
			local old_check = check_pos
			check_pos = check_pos + step * fwd
			success, z = GwNavQueries.triangle_from_position(nav_world, check_pos, above, below)

			if success then
				call_position = Vector3(check_pos.x, check_pos.y, z)

				dprint("success")
				draw("line", old_check, call_position, Color(0, 255, 0))
				draw("sphere", call_position, 0.34, Color(0, 255, 255))

				break
			else
				dprint("fail")
				draw("line", old_check, check_pos, Color(255, 0, 0))
				draw("sphere", check_pos, 0.34, Color(255, 0, 0))
			end
		end

		data.spawn_forward = Vector3Box(fwd)
		data.spawners = {
			spawners[best_index],
			spawners[best_other_index]
		}

		table.clear(SPAWN_POS_TEMP)
	else
		data.spawn_forward = Vector3Box(Quaternion.forward(Unit.local_rotation(unit, 0)))
		data.spawners = {
			spawners[1],
			spawners[2]
		}
	end

	data.call_position = Vector3Box(call_position)

	return call_position
end

BTSpawnAllies._spawn = function (self, unit, data, blackboard, t)
	local action = blackboard.action

	if action.animation then
		Managers.state.network:anim_event(unit, randomize(action.animation))
	end

	blackboard.navigation_extension:set_enabled(false)

	local side = blackboard.side
	local side_id = side.side_id
	local loc_ext = blackboard.locomotion_extension

	loc_ext:set_wanted_velocity(Vector3.zero())
	loc_ext:use_lerp_rotation(true)

	if not action.dont_rotate then
		loc_ext:set_wanted_rotation(Quaternion.look(data.spawn_forward:unbox(), Vector3.up()))
	end

	local difficulty = Managers.state.difficulty:get_difficulty()

	if action.difficulty_spawn_list or action.spawn_list then
		local spawn_list = action.difficulty_spawn_list[difficulty] or action.spawn_list
		local spawners = data.spawners

		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.enemy_spawn_allies, "attack_tag", "spawn_allies")

		local spawner_system = Managers.state.entity:system("spawner_system")

		for i = 1, #spawn_list, 1 do
			local unit = spawners[(i - 1) % #spawners + 1]

			spawner_system:spawn_horde(unit, {
				spawn_list[i]
			}, side_id)
		end
	end

	if action.difficulty_spawn or action.spawn then
		local strictly_not_close_to_players = true
		local silent = true
		local composition_type = action.difficulty_spawn[difficulty] or action.spawn
		local limit_spawners = action.limit_spawners
		local use_closest_spawners = action.use_closest_spawners
		local source_unit = unit
		local terror_event_id = action.terror_event_id
		local conflict_director = Managers.state.conflict
		local group_template = {
			size = 0,
			template = "horde",
			id = Managers.state.entity:system("ai_group_system"):generate_group_id()
		}
		local horde = conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, group_template, strictly_not_close_to_players, nil, use_closest_spawners, source_unit)
		blackboard.spawn_allies_horde = horde
	end
end

BTSpawnAllies.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.spawning_allies

	if not data then
		return "done"
	end

	if data.end_time < t then
		blackboard.played_stinger = nil

		return "done"
	else
		local action = blackboard.action

		if not data.spawned and (action.stay_still or Vector3.distance_squared(POSITION_LOOKUP[unit], data.call_position:unbox()) < 0.5 or blackboard.navigation_extension:number_failed_move_attempts() > 1) then
			data.spawned = true
			data.end_time = t + action.duration

			if blackboard.follow_animation_locked then
				self:_release_animation_lock(unit, blackboard)
			end

			self:_spawn(unit, data, blackboard, t)
		elseif data.spawned then
			blackboard.locomotion_extension:set_wanted_rotation(Quaternion.look(data.spawn_forward:unbox(), Vector3.up()))
		elseif blackboard.follow_animation_locked and blackboard.anim_cb_rotation_start then
			self:_release_animation_lock(unit, blackboard)
		end

		return "running"
	end
end

BTSpawnAllies._release_animation_lock = function (self, unit, blackboard)
	blackboard.follow_animation_locked = nil

	LocomotionUtils.set_animation_driven_movement(unit, false)
	blackboard.locomotion_extension:use_lerp_rotation(true)
end

return
