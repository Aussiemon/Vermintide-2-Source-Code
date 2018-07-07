require("scripts/settings/terror_event_blueprints")

TerrorEventMixer = TerrorEventMixer or {}
local TerrorEventMixer = TerrorEventMixer
local amount = {
	0,
	0
}
TerrorEventMixer.active_events = TerrorEventMixer.active_events or {}
TerrorEventMixer.start_event_list = TerrorEventMixer.start_event_list or {}
TerrorEventMixer.optional_data = TerrorEventMixer.optional_data or {}
TerrorEventMixer.init_functions = {
	text = function (event, element, t)
		event.ends_at = t + ConflictUtils.random_interval(element.duration)
	end,
	delay = function (event, element, t)
		event.ends_at = t + ConflictUtils.random_interval(element.duration)
	end,
	spawn = function (event, element, t)
		return
	end,
	spawn_at_raw = function (event, element, t)
		if Managers.player.is_server then
			local conflict_director = Managers.state.conflict
			local breed_name = nil
			local check_name = element.breed_name

			if type(check_name) == "table" then
				breed_name = check_name[Math.random(1, #check_name)]
			else
				breed_name = check_name
			end

			conflict_director:spawn_at_raw_spawner(Breeds[breed_name], element.spawner_id, element.optional_data)
		end
	end,
	spawn_patrol = function (event, element, t)
		return
	end,
	roaming_patrol = function (event, element, t)
		return
	end,
	continue_when = function (event, element, t)
		if element.duration then
			event.ends_at = t + ConflictUtils.random_interval(element.duration)
		end
	end,
	control_pacing = function (event, element, t)
		local conflict_director = Managers.state.conflict

		if element.enable then
			conflict_director.pacing:enable()
		else
			conflict_director.pacing:disable()
		end
	end,
	control_specials = function (event, element, t)
		local conflict_director = Managers.state.conflict
		local specials_pacing = conflict_director.specials_pacing

		if specials_pacing then
			specials_pacing:enable(element.enable)
		end
	end,
	horde = function (event, element, t)
		event.ends_at = t + ((element.duration and ConflictUtils.random_interval(element.duration)) or 0)
		event.num_hordes = 0
		event.spawn_check = 0
		event.spawned = 0
	end,
	debug_horde = function (event, element, t)
		event.ends_at = t + ((element.duration and ConflictUtils.random_interval(element.duration)) or 0)
	end,
	event_horde = function (event, element, t)
		event.ends_at = t + ((element.duration and ConflictUtils.random_interval(element.duration)) or 0)
		local conflict_director = Managers.state.conflict
		local horde_data = conflict_director:event_horde(t, element.spawner_id, element.composition_type, element.limit_spawners, element.horde_silent)
		element.horde_data = horde_data
	end,
	reset_event_horde = function (event, element, t)
		Managers.state.entity:system("spawner_system"):reset_spawners_with_event_id(element.event_id)
	end,
	force_horde = function (event, element, t)
		event.ends_at = t + ((element.duration and ConflictUtils.random_interval(element.duration)) or 0)
		local horde_type = element.horde_type
		local valid_horde_type = horde_type == "vector" or horde_type == "ambush" or horde_type == "" or horde_type == "random" or not horde_type

		assert(valid_horde_type, "Bad terror event element 'horde_type' was set to %s", horde_type)

		if horde_type == "" or horde_type == "random" then
			horde_type = nil
		end

		Managers.state.conflict.horde_spawner:horde(horde_type)
	end,
	start_event = function (event, element, t)
		print("starting terror event: ", element.start_event_name)

		local start_events = TerrorEventMixer.start_event_list
		start_events[#start_events + 1] = element.start_event_name
	end,
	stop_event = function (event, element, t)
		print("stopping terror event: ", element.stop_event_name)

		local event = TerrorEventMixer.find_event(element.stop_event_name)

		if event then
			event.destroy = true
		end
	end,
	set_master_event_running = function (event, element, t)
		Managers.state.conflict:set_master_event_running(element.name)
	end,
	stop_master_event = function (event, element, t)
		Managers.state.conflict:set_master_event_running()
	end,
	flow_event = function (event, element, t)
		local conflict_director = Managers.state.conflict
		local flow_event = element.flow_event_name

		conflict_director:level_flow_event(flow_event)

		local network_manager = Managers.state.network

		if not element.disable_network_send and network_manager:game() then
			local event_id = NetworkLookup.terror_flow_events[flow_event]

			network_manager.network_transmit:send_rpc_clients("rpc_terror_event_trigger_flow", event_id)
		end
	end,
	play_stinger = function (event, element, t)
		local stinger_name = element.stinger_name or "enemy_terror_event_stinger"
		local optional_pos = element.optional_pos
		local wwise_world = Managers.world:wwise_world(Managers.state.conflict._world)

		if optional_pos then
			local pos = Vector3(optional_pos[1], optional_pos[2], optional_pos[3])
			local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, stinger_name)

			Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[stinger_name], pos)
		else
			local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, stinger_name)

			Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[stinger_name])
		end
	end,
	force_load_breed_package = function (event, element, t)
		local enemy_package_loader = Managers.state.game_mode.level_transition_handler.enemy_package_loader

		if not enemy_package_loader.breed_processed[breed_name] then
			local ignore_breed_limits = true

			enemy_package_loader:request_breed(element.breed_name, ignore_breed_limits)
		end
	end,
	enable_bots_in_carry_event = function (event, element, t)
		Managers.state.entity:system("ai_bot_group_system"):set_in_carry_event(true)
	end,
	disable_bots_in_carry_event = function (event, element, t)
		Managers.state.entity:system("ai_bot_group_system"):set_in_carry_event(false)
	end,
	enable_kick = function (event, element, t)
		Managers.state.voting:set_vote_kick_enabled(true)
	end,
	disable_kick = function (event, element, t)
		Managers.state.voting:set_vote_kick_enabled(false)
	end,
	set_freeze_condition = function (event, element, t)
		event.max_active_enemies = element.max_active_enemies or math.huge
	end,
	set_breed_event_horde_spawn_limit = function (event, element, t)
		Managers.state.entity:system("spawner_system"):set_breed_event_horde_spawn_limit(element.breed_name, element.limit)
	end,
	create_boss_door_group = function (event, element, t)
		local data = event.data
		local ai_group_system = Managers.state.entity:system("ai_group_system")
		local group_data = {
			template = "boss_door_closers",
			id = ai_group_system:generate_group_id(),
			size = element.group_size
		}
		data.group_data = group_data
	end,
	close_boss_doors = function (event, element, t)
		local data = event.data
		local map_section = data.map_section or element.map_section
		local group_data = data.group_data
		local group_id = group_data.id

		if map_section then
			local breed_name = element.breed_name
			local door_system = Managers.state.entity:system("door_system")

			door_system:close_boss_doors(map_section, group_id, breed_name)
		end
	end,
	spawn_encampment = function (event, element, t)
		local encampment_id, unit_compositions_id, rotation = nil
		local event_data = event.data

		if event_data then
			encampment_id = event_data.encampment_id
			unit_compositions_id = event_data.unit_compositions_id
			rotation = Unit.local_rotation(event_data.gizmo_unit, 0)
		else
			encampment_id = element.encampment_id
			unit_compositions_id = element.unit_compositions_id
			dir = event_data.dir
			rotation = (dir and Quaternion.look(Vector3(dir[1], dir[2], 0))) or Quaternion.look(Vector3(0, 1, 0))
		end

		local position = nil
		local pos_from_recycler = event_data and event_data.optional_pos

		if pos_from_recycler then
			position = pos_from_recycler:unbox()
		else
			local optional_pos = element.optional_pos
			position = Vector3(optional_pos[1], optional_pos[2], optional_pos[3])
		end

		print("encampment_id:", encampment_id, "unit_compositions_id:", unit_compositions_id, event_data)

		local encampment_template = EncampmentTemplates[encampment_id]
		local encampment = FormationUtils.make_encampment(encampment_template)
		local unit_composition = encampment_template.unit_compositions[unit_compositions_id]

		FormationUtils.spawn_encampment(encampment, position, rotation, unit_composition)
	end,
	teleport_player = function (event, element, t)
		local portal_unit = element.portal_id
		local local_player = Managers.player:local_player()

		if local_player then
			local player_unit = local_player.player_unit

			if Unit.alive(player_unit) then
				local portals = ConflictUtils.get_teleporter_portals()
				local portal_id = element.portal_id
				local pos = portals[portal_id][1]:unbox()
				local rot = portals[portal_id][2]:unbox()
				local locomotion = ScriptUnit.extension(player_unit, "locomotion_system")
				local world = Managers.world:world("level_world")

				LevelHelper:flow_event(world, "teleport_" .. portal_id)
				locomotion:teleport_to(pos, rot)
			end
		end
	end,
	run_benchmark_func = function (event, element, t)
		local func_name = element.func_name

		script_data.benchmark[func_name](script_data.benchmark, element, t)
	end,
	set_time_challenge = function (event, element, t, dt)
		local optional_data = TerrorEventMixer.optional_data
		local time_challenge_name = element.time_challenge_name
		local challenge_threshold = QuestSettings[time_challenge_name]
		local duration = t + challenge_threshold
		local current_difficulty = Managers.state.difficulty:get_difficulty()
		local allowed_difficulties = QuestSettings.allowed_difficulties[time_challenge_name]
		local allowed_difficulty = allowed_difficulties[current_difficulty]

		if allowed_difficulty and not optional_data[time_challenge_name] then
			optional_data[time_challenge_name] = duration
		end
	end,
	has_completed_time_challenge = function (event, element, t, dt)
		local optional_data = TerrorEventMixer.optional_data
		local time_challenge_name = element.time_challenge_name
		local duration = optional_data[time_challenge_name]

		if duration then
			local completed = t < duration
			local time_left = math.abs(t - duration)

			if completed then
				optional_data[time_challenge_name] = nil
				local stat_name = time_challenge_name
				local statistics_db = Managers.player:statistics_db()

				statistics_db:increment_stat_and_sync_to_clients(stat_name)
				QuestSettings.send_completed_message(stat_name)
			else
				optional_data[time_challenge_name] = nil
			end
		end
	end,
	do_volume_challenge = function (event, element, t, dt)
		local optional_data = TerrorEventMixer.optional_data
		local volume_name = element.volume_name

		fassert(optional_data[volume_name] == nil, "Already started a volume challenge for volume_name=(%s)", volume_name)

		local challenge_duration = QuestSettings[volume_name]
		local allowed_difficulties = QuestSettings.allowed_difficulties[volume_name]
		local difficulty = Managers.state.difficulty:get_difficulty()
		local on_allowed_difficulty = allowed_difficulties[difficulty]
		local terminate = not on_allowed_difficulty
		optional_data[volume_name] = {
			time_inside = 0,
			duration = challenge_duration,
			terminate = terminate
		}
	end
}
TerrorEventMixer.run_functions = {
	spawn = function (event, element, t, dt)
		local data = event.data
		local optional_data = nil
		local gizmo_unit = data.gizmo_unit

		if gizmo_unit then
			local spawn_behind_door = Unit.get_data(gizmo_unit, "is_behind_door")

			if spawn_behind_door then
				optional_data = {
					spawn_behind_door = spawn_behind_door
				}
			end
		end

		local position = data.optional_pos and data.optional_pos:unbox()
		local conflict_director = Managers.state.conflict
		local group_data = data.group_data
		local breed_name = element.breed_name

		conflict_director:spawn_one(Breeds[breed_name], position, group_data, optional_data)

		return true
	end,
	spawn_at_raw = function (event, element, t, dt)
		return true
	end,
	spawn_patrol = function (event, element, t, dt)
		local data = event.data
		local position = data and data.optional_pos and data.optional_pos:unbox()
		local conflict_director = Managers.state.conflict
		local ai_group_system = Managers.state.entity:system("ai_group_system")
		local patrol_template = element.patrol_template
		local main_path_patrol = element.main_path_patrol
		local patrol_data = {}

		if main_path_patrol then
			local breed = Breeds[element.breed_name]
			patrol_data.breed = breed
			patrol_data.group_type = "main_path_patrol"

			conflict_director:spawn_group(patrol_template, position, patrol_data)
		else
			local formations = (data and data.formations) or element.formations
			local num_formations = #formations
			local random_index = (num_formations > 1 and math.random(num_formations)) or 1
			local formation_name = formations[random_index]

			assert(PatrolFormationSettings[formation_name], "No such formation exists in PatrolFormationSettings")

			local spline_name = nil
			local splines = element.splines

			if splines then
				local num_splines = #splines
				local random_index = (num_splines > 1 and math.random(num_splines)) or 1
				spline_name = splines[random_index]
			else
				spline_name = data and data.spline_id
			end

			local ai_group_system = Managers.state.entity:system("ai_group_system")
			local spline_start_position = nil
			local difficulty = Managers.state.difficulty:get_difficulty()
			local formation = PatrolFormationSettings[formation_name][difficulty]
			formation.settings = PatrolFormationSettings[formation_name].settings
			local spline_way_points = data and data.spline_way_points

			if not spline_way_points then
				local route_data, waypoints, start_pos = conflict_director.level_analysis:get_waypoint_spline(spline_name)

				if route_data then
					spline_way_points = waypoints
					spline_start_position = start_pos
				end
			end

			local spline_type = (data and data.spline_type) or element.spline_type
			patrol_data.spline_name = spline_name
			patrol_data.formation = formation
			patrol_data.group_type = "spline_patrol"
			patrol_data.spline_way_points = spline_way_points
			patrol_data.spline_type = spline_type
			patrol_data.despawn_at_end = true

			conflict_director:spawn_spline_group(patrol_template, spline_start_position, patrol_data)
		end

		return true
	end,
	roaming_patrol = function (event, element, t, dt)
		local data = event.data
		local position = data.optional_pos and data.optional_pos:unbox()
		local conflict_director = Managers.state.conflict
		local ai_group_system = Managers.state.entity:system("ai_group_system")
		local patrol_template = element.patrol_template or "spline_patrol"
		local patrol_data = {}
		local spline_name = data.spline_name
		local pack = data.pack
		local formation = PatrolFormationSettings.random_roaming_formation(pack)
		patrol_data.spline_name = spline_name
		patrol_data.formation = formation
		patrol_data.group_type = "roaming_patrol"
		patrol_data.spline_way_points = data.spline_way_points
		patrol_data.spline_type = data.spline_type
		patrol_data.despawn_at_end = false
		patrol_data.zone_data = data.zone_data

		conflict_director:spawn_spline_group(patrol_template, position, patrol_data)

		return true
	end,
	continue_when = function (event, element, t, dt)
		if element.duration and event.ends_at < t then
			return true
		end

		return element.condition(t)
	end,
	control_pacing = function (event, element, t, dt)
		return true
	end,
	control_specials = function (event, element, t, dt)
		return true
	end,
	event_horde = function (event, element, t, dt)
		if event.ends_at < t then
			return true
		end
	end,
	reset_event_horde = function (event, element, t, dt)
		return true
	end,
	force_horde = function (event, element, t, dt)
		if event.ends_at < t then
			return true
		end
	end,
	horde = function (event, element, t, dt)
		local conflict_director = Managers.state.conflict

		if event.ends_at < t then
			return true
		end

		if t < event.spawn_check then
			return
		end

		local living_horde = conflict_director:horde_size_total()

		if element.peak_amount < living_horde then
			event.spawn_check = t + 1
		elseif living_horde < element.min_amount then
			local missing = element.peak_amount - living_horde
			local minimum = math.clamp(missing - 5, 1, missing)
			amount[1] = minimum
			amount[2] = missing

			conflict_director:insert_horde(t, amount, 0)
			print("horde spawning:", minimum, missing)

			event.num_hordes = event.num_hordes + 1
			event.spawn_check = t + math.random(5, 7)
		else
			event.spawn_check = t + 1
		end
	end,
	debug_horde = function (event, element, t, dt)
		if event.ends_at < t then
			return true
		end

		local conflict_director = Managers.state.conflict
		local spawned_units = conflict_director:spawned_units()
		local amount = #spawned_units

		if amount < element.amount then
			local center_pos = PLAYER_AND_BOT_POSITIONS[1]
			local pos = ConflictUtils.get_spawn_pos_on_circle(conflict_director.nav_world, center_pos, 25, 15, 5)

			if pos then
				local dir = center_pos - pos
				local spawn_rot = Quaternion.look(Vector3(dir.x, dir.y, 1))
				local breed = Breeds[conflict_director._debug_breed]

				conflict_director:spawn_queued_unit(breed, Vector3Box(pos), QuaternionBox(spawn_rot), "constant_70", nil, "horde_hidden")
			end
		end
	end,
	delay = function (event, element, t, dt)
		if event.ends_at < t then
			return true
		end
	end,
	text = function (event, element, t, dt)
		local time_left = event.ends_at - t

		if time_left >= 0 then
			Debug.text(tostring(element.text))
		else
			return true
		end
	end,
	start_event = function (event, element, t, dt)
		return true
	end,
	stop_event = function (event, element, t, dt)
		return true
	end,
	flow_event = function (event, element, t, dt)
		return true
	end,
	play_stinger = function (event, element, t)
		return true
	end,
	force_load_breed_package = function (event, element, t)
		return true
	end,
	set_master_event_running = function (event, element, t, dt)
		return true
	end,
	stop_master_event = function (event, element, t, dt)
		return true
	end,
	enable_bots_in_carry_event = function (event, element, t)
		return true
	end,
	disable_bots_in_carry_event = function (event, element, t)
		return true
	end,
	enable_kick = function (event, element, t)
		return true
	end,
	disable_kick = function (event, element, t)
		return true
	end,
	set_freeze_condition = function (event, element, t)
		return true
	end,
	set_breed_event_horde_spawn_limit = function (event, element, t)
		return true
	end,
	create_boss_door_group = function (event, element, t)
		return true
	end,
	close_boss_doors = function (event, element, t)
		return true
	end,
	spawn_encampment = function (event, element, t, dt)
		return true
	end,
	teleport_player = function (event, element, t, dt)
		return true
	end,
	run_benchmark_func = function (event, element, t, dt)
		return true
	end,
	set_time_challenge = function (event, element, t, dt)
		return true
	end,
	has_completed_time_challenge = function (event, element, t, dt)
		return true
	end,
	do_volume_challenge = function (event, element, t, dt)
		local volume_name = element.volume_name
		local optional_data = TerrorEventMixer.optional_data[volume_name]

		if optional_data.terminate then
			return true
		end

		local all_inside = true
		local human_players = Managers.player:human_players()

		for _, player in pairs(human_players) do
			local player_unit = player.player_unit

			if not AiUtils.unit_alive(player_unit) then
				all_inside = false

				break
			end

			local volume_extension = ScriptUnit.extension(player_unit, "volume_system")

			if not volume_extension:is_inside_volume(volume_name) then
				all_inside = false

				break
			end
		end

		if all_inside then
			optional_data.time_inside = optional_data.time_inside + dt
		else
			optional_data.time_inside = 0
		end

		if optional_data.duration <= optional_data.time_inside then
			local increment_stat_name = element.increment_stat_name
			local statistics_db = Managers.player:statistics_db()

			statistics_db:increment_stat_and_sync_to_clients(increment_stat_name)
			QuestSettings.send_completed_message(increment_stat_name)

			return true
		else
			return false
		end
	end
}
TerrorEventMixer.debug_functions = {
	control_pacing = function (event, element, t, dt)
		return (element.enable and "enable") or "disable"
	end,
	control_specials = function (event, element, t, dt)
		return (element.enable and "enable") or "disable"
	end,
	delay = function (event, element, t, dt)
		return
	end,
	horde = function (event, element, t, dt)
		local size = Managers.state.conflict:horde_size()

		return string.format(" alive: %d, min-amount: %d, peak-amount: %d", size, element.min_amount, element.peak_amount)
	end,
	debug_horde = function (event, element, t, dt)
		local spawned_units = Managers.state.conflict:spawned_units()
		local amount = #spawned_units

		return string.format(" alive: %d, max-amount: %d", amount, element.amount)
	end,
	event_horde = function (event, element, t, dt)
		local horde_data = element.horde_data

		if horde_data then
			if horde_data.started then
				if horde_data.failed then
					return string.format(" horde failed!")
				else
					return string.format(" amount: %d ", horde_data.amount)
				end
			else
				return "waiting to start..."
			end
		else
			return string.format("waiting to start...")
		end
	end,
	reset_event_horde = function (event, element, t, dt)
		return string.format(element.event_id)
	end,
	force_horde = function (event, element, t, dt)
		return string.format(element.horde_type)
	end,
	spawn = function (event, element, t, dt)
		return element.breed_name
	end,
	spawn_at_raw = function (event, element, t, dt)
		local debug_text = nil

		if type(element.breed_name) == "table" then
			debug_text = table.dump_string(element.breed_name)
		else
			debug_text = element.breed_name
		end

		return element.spawner_id .. " -> " .. debug_text
	end,
	spawn_patrol = function (event, element, t, dt)
		return element.breed_name
	end,
	roaming_patrol = function (event, element, t, dt)
		return "roaming_patrol"
	end,
	start_event = function (event, element, t, dt)
		return "event_name: " .. element.start_event_name
	end,
	stop_event = function (event, element, t, dt)
		return "event_name: " .. element.stop_event_name
	end,
	flow_event = function (event, element, t, dt)
		return "event_name: " .. tostring(element.flow_event_name)
	end,
	set_master_event_running = function (event, element, t, dt)
		return "name: " .. element.name
	end,
	play_stinger = function (event, element, t)
		local p = element.optional_pos

		if p then
			return string.format(" stinger-name: %s, pos: (%.1f,%.1f,%.1f) ", element.stinger_name, p[1], p[2], p[3])
		else
			return " stinger-name:" .. element.stinger_name
		end
	end,
	force_load_breed_package = function (event, element, t, dt)
		return "breed_name: " .. element.breed_name
	end,
	stop_master_event = function (event, element, t, dt)
		return ""
	end,
	spawn_encampment = function (event, element, t, dt)
		return ""
	end,
	teleport_player = function (event, element, t, dt)
		return "teleport to portal_id:" .. element.portal_id
	end,
	run_benchmark_func = function (event, element, t, dt)
		return "func_name:" .. element.func_name
	end,
	set_time_challenge = function (event, element, t, dt)
		return "Time challenge started "
	end,
	do_volume_challenge = function (event, element, t, dt)
		local volume_name = element.volume_name
		local optional_data = TerrorEventMixer.optional_data[volume_name]
		local time_inside = optional_data.time_inside
		local duration = optional_data.duration
		local complete_status = time_inside / duration

		return string.format("%.2f/%.2f - %.2f", time_inside, duration, complete_status)
	end
}

TerrorEventMixer.reset = function ()
	table.clear(TerrorEventMixer.active_events)
	table.clear(TerrorEventMixer.start_event_list)
	table.clear(TerrorEventMixer.optional_data)
end

TerrorEventMixer.add_to_start_event_list = function (event_name)
	local start_events = TerrorEventMixer.start_event_list
	start_events[#start_events + 1] = event_name
end

TerrorEventMixer.start_random_event = function (event_chunk_name)
	local event_chunk = WeightedRandomTerrorEvents[event_chunk_name]

	assert(event_chunk, "Cannot find a WeightedRandomTerrorEvent called %s", tostring(event_chunk_name))

	local index = LoadedDice.roll_easy(event_chunk.loaded_probability_table)
	local index = index * 2 - 1
	local event_name = event_chunk[index]

	TerrorEventMixer.add_to_start_event_list(event_name)
	print("TerrorEventMixer.start_random_event:", event_chunk_name, "->", event_name)
end

TerrorEventMixer.start_event = function (event_name, data)
	local active_events = TerrorEventMixer.active_events
	local elements = TerrorEventBlueprints[event_name]

	fassert(elements, "No terror event called '%s', exists", event_name)
	print("TerrorEventMixer.start_event:", event_name)

	if script_data.debug_terror then
		elements = table.clone(elements)
	end

	local new_event = {
		index = 1,
		ends_at = 0,
		name = event_name,
		elements = elements,
		data = data,
		max_active_enemies = math.huge
	}
	active_events[#active_events + 1] = new_event
	local t = Managers.time:time("game")
	local element = elements[1]
	local func_name = element[1]

	TerrorEventMixer.init_functions[func_name](new_event, element, t)
	Managers.telemetry.events:terror_event_started(event_name)
end

TerrorEventMixer.stop_event = function (event_name)
	print("TerrorEventMixer.stop_event:", event_name)

	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events

	for i = 1, num_events, 1 do
		local event = active_events[i]

		if event.name == event_name then
			active_events[i] = active_events[num_events]
			active_events[num_events] = nil

			break
		end
	end
end

TerrorEventMixer.find_event = function (event_name)
	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events

	for i = 1, num_events, 1 do
		local event = active_events[i]

		if event.name == event_name then
			return event
		end
	end
end

TerrorEventMixer.update = function (t, dt, gui)
	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events
	local num_events_at_start_of_update = num_events
	local i = 1

	while num_events >= i do
		local event = active_events[i]

		if not event then
			printf("TerrorEventMixer.update -> nil event, num_events: %d num_events_at_start_of_update: %d i:%d", num_events, num_events_at_start_of_update, i)
			table.dump(active_events, "active_events")
		end

		local event_completed = TerrorEventMixer.run_event(event, t, dt)

		if event_completed then
			active_events[i] = active_events[num_events]
			active_events[num_events] = nil
			num_events = num_events - 1
		else
			i = i + 1
		end
	end

	local start_events = TerrorEventMixer.start_event_list

	for i = 1, #start_events, 1 do
		local data = {}

		TerrorEventMixer.start_event(start_events[i], data)

		start_events[i] = nil
	end

	if script_data.debug_terror and gui then
		TerrorEventMixer.debug(gui, active_events, t, dt)
	end
end

TerrorEventMixer.run_event = function (event, t, dt)
	local elements = event.elements
	local index = event.index
	local element = elements[index]
	local active_enemies = Managers.state.performance:num_active_enemies()

	if event.max_active_enemies < active_enemies then
		element.ends_at = (element.ends_at or 0) + dt
	else
		local func_name = element[1]
		local continue = TerrorEventMixer.run_functions[func_name](event, element, t, dt)

		if continue then
			if event.destroy then
				return true
			end

			index = index + 1

			if index > #elements then
				return true
			end

			event.index = index
			local element = elements[index]
			local func_name = element[1]

			TerrorEventMixer.init_functions[func_name](event, element, t)
		end
	end
end

local tiny_font_size = 16
local tiny_font = "gw_arial_16"
local tiny_font_mtrl = "materials/fonts/" .. tiny_font
local resx, resy = Application.resolution()
local debug_win_width = 330
local debug_x = 0

TerrorEventMixer.debug = function (gui, active_events, t, dt)
	if DebugKeyHandler.key_pressed("mouse_middle_held", "pan terror event mixer", "ai debugger") then
		local input_service = Managers.free_flight.input_manager:get_service("Debug")
		local look = input_service:get("look")
		debug_x = debug_x - look.x * 0.001
	end

	local x = 0
	local y = 0

	for i = 1, #active_events, 1 do
		local event = active_events[i]

		if event then
			TerrorEventMixer.debug_event(gui, event, t, dt, x, y, debug_x * resx, i == 1)

			x = x + debug_win_width + 15
		end
	end

	for name, value in pairs(TerrorEventMixer.optional_data) do
		if type(value) == "number" then
			local duration = math.abs(t - value)

			Debug.text("Time challenge running: %s Time left: %0.1f ", name, duration)
		end
	end
end

TerrorEventMixer.debug_event = function (gui, event, t, dt, x1, y1, panning_x, render_master)
	local elements = event.elements
	local index = event.index
	local element = elements[index]
	local func_name = element[1]
	local borderx = 20 + panning_x
	local bordery = 280
	x1 = x1 + borderx + 20
	y1 = y1 + bordery + 20
	local y2 = y1
	local layer = 200
	local completed_color = Colors.get_color_with_alpha("gray", 255)
	local running_color = Colors.get_color_with_alpha("lavender", 255)
	local unrun_color = Colors.get_color_with_alpha("cadet_blue", 255)
	local header_color = Colors.get_color_with_alpha("orange", 255)

	ScriptGUI.ictext(gui, resx, resy, "Event: " .. event.name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, header_color)

	y2 = y2 + 20
	local start_index = 1

	if index > 9 then
		start_index = index - 9
	end

	local end_index = #elements

	if end_index - start_index > 18 then
		end_index = start_index + 18
	end

	for i = start_index, index - 1, 1 do
		local element = elements[i]
		local func_name = element[1]
		local debug_text = (TerrorEventMixer.debug_functions[func_name] and TerrorEventMixer.debug_functions[func_name](event, element, t, dt)) or ""
		local text = string.format(" %d] %s %s", i, func_name, debug_text)

		ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, completed_color)

		y2 = y2 + 20
	end

	local element = elements[index]
	local func_name = element[1]
	local debug_text = (TerrorEventMixer.debug_functions[func_name] and TerrorEventMixer.debug_functions[func_name](event, element, t, dt)) or ""
	local ends_at = (element.duration and string.format("time: %.1f", event.ends_at - t)) or ""
	local text = string.format(" %d] %s %s %s", index, func_name, debug_text, ends_at)

	ScriptGUI.ictext(gui, resx, resy, "==>", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 20, y2, layer, running_color)
	ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, running_color)

	y2 = y2 + 20

	for i = index + 1, end_index, 1 do
		local element = elements[i]
		local func_name = element[1]
		local duration = ""
		local text = string.format(" %d] %s %s", i, func_name, duration)

		ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, unrun_color)

		y2 = y2 + 20
	end

	ScriptGUI.icrect(gui, resx, resy, borderx, bordery, x1 + debug_win_width, y2, layer - 1, Color(200, 20, 20, 20))

	if render_master then
		local disabled_color = Colors.get_color_with_alpha("red", 255)
		local master_color = Colors.get_color_with_alpha("lawn_green", 255)
		local running_master_event = Managers.state.conflict.running_master_event

		if running_master_event then
			ScriptGUI.ictext(gui, resx, resy, "Master Event: ", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, bordery - 6, layer, header_color)
			ScriptGUI.ictext(gui, resx, resy, running_master_event, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10 + 75, bordery - 6, layer, master_color)
		else
			ScriptGUI.ictext(gui, resx, resy, "Master Event: ", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, bordery - 6, layer, header_color)
			ScriptGUI.ictext(gui, resx, resy, "disabled", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10 + 75, bordery - 6, layer, disabled_color)
		end

		ScriptGUI.icrect(gui, resx, resy, borderx, bordery - 22, x1 + debug_win_width * 0.66, bordery - 2, layer - 1, Color(200, 20, 20, 20))
	end
end

local fail = nil
local s = "\n"

for event_name, elements in pairs(TerrorEventBlueprints) do
	for i = 1, #elements, 1 do
		local element_name = elements[i][1]

		if not TerrorEventMixer.init_functions[element_name] then
			s = s .. string.format("Bad terror event: '%s', there is no element called '%s'. \n", tostring(event_name), tostring(element_name))
			fail = true
		end
	end
end

if fail then
	assert(false, s)
end

return
