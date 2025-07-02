-- chunkname: @scripts/managers/conflict_director/terror_event_mixer.lua

require("scripts/settings/terror_event_blueprints")

function create_spawn_counter()
	local spawn_counter = {}
	local mt = {
		__index = function ()
			return 0
		end,
	}

	setmetatable(spawn_counter, mt)

	return spawn_counter
end

local function add_spawned_counting(event, optional_data, spawn_counter_category)
	optional_data = optional_data or {}

	local function spawned_func_counter(_, _, _)
		event.data.spawn_counter = event.data.spawn_counter or create_spawn_counter()
		event.data.spawn_counter[spawn_counter_category] = (event.data.spawn_counter[spawn_counter_category] or 0) + 1
	end

	local function despawned_func_counter(_, _, _)
		event.data.spawn_counter[spawn_counter_category] = event.data.spawn_counter[spawn_counter_category] - 1
	end

	if not optional_data.spawned_func then
		optional_data.spawned_func = spawned_func_counter
	else
		local prev_spawned_func = optional_data.spawned_func

		optional_data.spawned_func = function (unit, breed, optional_data)
			prev_spawned_func(unit, breed, optional_data)
			spawned_func_counter(unit, breed, optional_data)
		end
	end

	if not optional_data.despawned_func then
		optional_data.despawned_func = despawned_func_counter
	else
		local prev_despawned_func = optional_data.despawned_func

		optional_data.despawned_func = function (unit, breed, optional_data)
			prev_despawned_func(unit, breed, optional_data)
			despawned_func_counter(unit, breed, optional_data)
		end
	end

	return optional_data
end

TerrorEventMixer = TerrorEventMixer or {}

local TerrorEventMixer = TerrorEventMixer

TerrorEventMixer.active_events = TerrorEventMixer.active_events or {}
TerrorEventMixer.active_event_i = -1
TerrorEventMixer.start_event_list = TerrorEventMixer.start_event_list or {}
TerrorEventMixer.finished_events = TerrorEventMixer.finished_events or {}
TerrorEventMixer.optional_data = TerrorEventMixer.optional_data or {}
TerrorEventMixer.incrementing_id = 1
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
	spawn_special = function (event, element, t)
		return
	end,
	spawn_weave_special = function (event, element, t)
		return
	end,
	spawn_weave_special_event = function (event, element, t)
		return
	end,
	spawn_at_raw = function (event, element, t)
		return
	end,
	spawn_patrol = function (event, element, t)
		return
	end,
	roaming_patrol = function (event, element, t)
		return
	end,
	spawn_around_player = function (event, element, t)
		return
	end,
	spawn_around_origin_unit = function (event, element, t)
		local breed_spawn_table_per_difficulty = element.breed_spawn_table_per_difficulty

		if not breed_spawn_table_per_difficulty then
			local breed_name = element.breed_name
			local num_to_spawn = element.amount or 1
			local num_to_spawn_scaled = element.difficulty_amount

			if type(breed_name) == "table" then
				breed_name = breed_name[Math.random(1, #breed_name)]
			end

			if num_to_spawn_scaled then
				local chosen_amount = Managers.state.difficulty:get_difficulty_value_from_table(num_to_spawn_scaled)

				chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

				if type(chosen_amount) == "table" then
					num_to_spawn = chosen_amount[Math.random(1, #chosen_amount)]
				else
					num_to_spawn = chosen_amount
				end
			elseif type(num_to_spawn) == "table" then
				num_to_spawn = num_to_spawn[Math.random(1, #num_to_spawn)]
			end

			local spawn_table = {}

			for i = 1, num_to_spawn do
				spawn_table[i] = breed_name
			end

			breed_spawn_table_per_difficulty = {
				default = spawn_table,
			}
		end

		local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()
		local spawn_table = breed_spawn_table_per_difficulty[difficulty] or breed_spawn_table_per_difficulty.default
		local num_to_spawn = #spawn_table
		local distance_to_enemies = element.distance_to_enemies or 2
		local optional_data_table = {}

		for i = 1, num_to_spawn do
			local optional_data = element.optional_data and table.clone(element.optional_data) or {}

			if element.spawn_counter_category then
				optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
			end

			local breed_name = spawn_table[i]

			if element.pre_spawn_func then
				optional_data = element.pre_spawn_func(optional_data, difficulty, breed_name, event, difficulty_tweak, element.enhancement_list)
			end

			optional_data_table[i] = optional_data
		end

		event.optional_data_table = optional_data_table

		local invalid_pos_list = {}
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local spawn_positions = {}

		event.spawn_at = t + (element.spawn_delay or 0)
		event.spawn_positions = spawn_positions
		event.optional_data_table = optional_data_table
		event.spawn_table = spawn_table

		local center_unit = event.data.origin_unit
		local center_position = event.data.origin_position

		if center_unit and Unit.alive(center_unit) then
			center_position = Unit.local_position(center_unit, 0)
		elseif not center_position then
			Application.warning("[TerrorEventMixer] spawn_around_origin_unit present in a terror event that is started without an origin_unit or origin_position, falling back to a random player")

			local random_player = PlayerUtils.get_random_alive_hero()

			center_position = POSITION_LOOKUP[random_player]
		end

		local row_distance = element.row_distance
		local circle_subdivision = element.circle_subdivision
		local min_distance = element.min_distance
		local max_distance = element.max_distance
		local above_max = element.above_max
		local below_max = element.below_max
		local tries = element.tries or 30
		local check_line_of_sight = center_unit and element.check_line_of_sight or false
		local world = Managers.world:world("level_world")
		local physics_world = World.physics_world(world)

		ConflictUtils.find_positions_around_position(center_position, spawn_positions, nav_world, min_distance, max_distance, num_to_spawn, invalid_pos_list, distance_to_enemies, tries, circle_subdivision, row_distance, above_max, below_max, check_line_of_sight, physics_world, center_unit)

		event.center_position = Vector3Box(center_position)

		for i = 1, #spawn_positions do
			local spawn_pos = spawn_positions[i]
			local boxed_spawn_pos = Vector3Box(spawn_pos)

			if element.pre_spawn_unit_func then
				local actual_breed_name = spawn_table[i]

				element.pre_spawn_unit_func(event, element, boxed_spawn_pos, actual_breed_name)
			end

			spawn_positions[i] = boxed_spawn_pos
		end

		if element.spawn_failed_func and table.is_empty(spawn_positions) then
			element.spawn_failed_func(center_position)
		end

		return true
	end,
	vs_assign_boss_profile = function (event, element, t)
		local game_mode = Managers.state.game_mode:game_mode()

		game_mode:set_playable_boss_can_be_picked(true)

		if script_data.debug_playable_boss then
			-- Nothing
		end
	end,
	spawn_around_origin_unit_staggered = function (event, element, t)
		return TerrorEventMixer.init_functions.spawn_around_origin_unit(event, element, t)
	end,
	continue_when = function (event, element, t)
		if element.duration then
			event.ends_at = t + ConflictUtils.random_interval(element.duration)
		end
	end,
	control_hordes = function (event, element, t)
		local conflict_director = Managers.state.conflict

		conflict_director.pacing:enable_hordes(element.enable)
	end,
	control_specials = function (event, element, t)
		local conflict_director = Managers.state.conflict
		local specials_pacing = conflict_director.specials_pacing

		if specials_pacing then
			specials_pacing:enable(element.enable)

			if element.enable then
				local delay = math.random(20, 30)
				local per_unit_delay = math.random(8, 16)
				local t = Managers.time:time("game")

				specials_pacing:delay_spawning(t, delay, per_unit_delay, true)
			end
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
	debug_horde = function (event, element, t)
		event.ends_at = t + (element.duration and ConflictUtils.random_interval(element.duration) or 0)
	end,
	event_horde = function (event, element, t)
		event.ends_at = t + (element.duration and ConflictUtils.random_interval(element.duration) or 0)

		local conflict_director = Managers.state.conflict
		local terror_event_type = element.spawner_id or element.spawner_ids
		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		local limit_spawner_ids = element.limit_spawner_ids

		if limit_spawner_ids then
			terror_event_type = table.clone(element.spawner_ids)

			table.shuffle(terror_event_type)

			for i = limit_spawner_ids + 1, #terror_event_type do
				terror_event_type[i] = nil
			end
		end

		local horde_data = conflict_director:event_horde(t, terror_event_type, element.side_id, element.composition_type, element.limit_spawners, element.horde_silent, nil, element.sound_settings, optional_data)

		element.horde_data = horde_data
	end,
	ambush_horde = function (event, element, t)
		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		event.ends_at = t + (element.duration and ConflictUtils.random_interval(element.duration) or 0)

		local conflict_director = Managers.state.conflict
		local override_epicenter_pos
		local composition_type = element.composition_type

		if event.data and event.data.main_path_trigger_distance then
			override_epicenter_pos = MainPathUtils.point_on_mainpath(nil, event.data.main_path_trigger_distance)
		end

		local extra_data = {
			sound_settings = element.sound_settings,
			override_composition_type = composition_type,
		}
		local horde_data = conflict_director.horde_spawner:execute_ambush_horde(extra_data, conflict_director.default_enemy_side_id, false, override_epicenter_pos, optional_data)

		element.horde_data = horde_data
	end,
	reset_event_horde = function (event, element, t)
		Managers.state.entity:system("spawner_system"):reset_spawners_with_event_id(element.event_id)
	end,
	force_horde = function (event, element, t)
		event.ends_at = t + (element.duration and ConflictUtils.random_interval(element.duration) or 0)

		local horde_type = element.horde_type
		local valid_horde_type = horde_type == "vector" or horde_type == "ambush" or horde_type == "" or horde_type == "random" or not horde_type

		assert(valid_horde_type, "Bad terror events element 'horde_type' was set to %s", horde_type)

		if horde_type == "" or horde_type == "random" then
			horde_type = nil
		end

		local side_id = element.side_id
		local extra_data

		Managers.state.conflict.horde_spawner:horde(horde_type, extra_data, side_id)
	end,
	start_event = function (event, element, t)
		print("starting terror event: ", element.start_event_name)

		local start_events = TerrorEventMixer.start_event_list
		local id = TerrorEventMixer.incrementing_id

		TerrorEventMixer.incrementing_id = TerrorEventMixer.incrementing_id + 1
		start_events[#start_events + 1] = {
			name = element.start_event_name,
			data = {},
			id = id,
		}
	end,
	stop_event = function (event, element, t)
		print("stopping terror event: ", element.stop_event_name)

		local event = TerrorEventMixer.find_event(element.stop_event_name)

		if event then
			event.destroy = true
		end
	end,
	start_mission = function (event, element, t)
		local mission_name = element.mission_name

		Managers.state.entity:system("mission_system"):request_mission(mission_name)
	end,
	end_mission = function (event, element, t)
		local mission_name = element.mission_name

		Managers.state.entity:system("mission_system"):end_mission(mission_name, true)
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
		local use_origin_unit_position = element.use_origin_unit_position
		local origin_unit = event.data.origin_unit
		local optional_pos = element.optional_pos or use_origin_unit_position and Unit.alive(origin_unit) and Unit.local_position(origin_unit, 0)
		local world = Managers.state.conflict._world
		local wwise_world = Managers.world:wwise_world(world)

		if optional_pos then
			local pos = Vector3(optional_pos[1], optional_pos[2], optional_pos[3])

			if not DEDICATED_SERVER then
				WwiseUtils.trigger_position_event(world, stinger_name, pos)
			end

			local rpc = optional_pos and "rpc_server_audio_position_event" or "rpc_server_audio_event"

			Managers.state.network.network_transmit:send_rpc_clients(rpc, NetworkLookup.sound_events[stinger_name], pos)
		else
			if not DEDICATED_SERVER then
				WwiseWorld.trigger_event(wwise_world, stinger_name)
			end

			Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[stinger_name])
		end
	end,
	force_load_breed_package = function (event, element, t)
		local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader
		local breed_name = element.breed_name

		print("terror_event_mixer->force_load_breed_package, breed_name=", breed_name)

		if not enemy_package_loader:is_breed_processed(breed_name) then
			local ignore_breed_limits = true

			enemy_package_loader:request_breed(breed_name, ignore_breed_limits)
		end
	end,
	enable_bots_in_carry_event = function (event, element, t)
		local side = Managers.state.side:get_side_from_name("heroes")

		Managers.state.entity:system("ai_bot_group_system"):set_in_carry_event(true, side)
	end,
	disable_bots_in_carry_event = function (event, element, t)
		local side = Managers.state.side:get_side_from_name("heroes")

		Managers.state.entity:system("ai_bot_group_system"):set_in_carry_event(false, side)
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
			size = element.group_size,
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
		local encampment_id, unit_compositions_id, rotation
		local event_data = event.data

		if event_data.gizmo_unit then
			encampment_id = event_data.encampment_id
			unit_compositions_id = event_data.unit_compositions_id
			rotation = Unit.local_rotation(event_data.gizmo_unit, 0)
		else
			encampment_id = element.encampment_id
			unit_compositions_id = element.unit_compositions_id

			local dir = event_data.dir

			rotation = dir and Quaternion.look(Vector3(dir[1], dir[2], 0)) or Quaternion.look(Vector3(0, 1, 0))
		end

		local side_id = event_data.side_id or element.side_id or 2
		local position
		local pos_from_recycler = event_data.optional_pos

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

		FormationUtils.spawn_encampment(encampment, position, rotation, unit_composition, side_id)
	end,
	teleport_player = function (event, element, t)
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

		Managers.benchmark[func_name](Managers.benchmark, element, t)
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
			else
				optional_data[time_challenge_name] = nil
			end
		end
	end,
	do_volume_challenge = function (event, element, t, dt)
		local optional_data = TerrorEventMixer.optional_data
		local volume_name = element.volume_name

		fassert(optional_data[volume_name] == nil, "Already started a volume challenge for volume_name=(%s)", volume_name)

		local challenge_name = element.challenge_name
		local challenge_duration = QuestSettings[challenge_name]
		local allowed_difficulties = QuestSettings.allowed_difficulties[challenge_name]
		local difficulty = Managers.state.difficulty:get_difficulty()
		local on_allowed_difficulty = allowed_difficulties[difficulty]
		local terminate = not on_allowed_difficulty

		optional_data[volume_name] = {
			time_inside = 0,
			duration = challenge_duration,
			player_units = {},
			terminate = terminate,
		}
	end,
	increase_weave_progress = function (event, element, t, dt)
		if not Managers.weave:get_active_weave() then
			return
		end

		local amount = element.amount

		fassert(amount ~= nil, string.format("'amount' in 'increase_weave_progress' event in terror event '%s' is not defined", event.name))
		Managers.weave:increase_bar_score(amount)
	end,
	complete_weave = function (event, element, t, dt)
		local weave_manager = Managers.weave

		if not weave_manager:get_active_weave() then
			return
		end

		weave_manager:final_objective_completed()
		Managers.state.game_mode:complete_level()
	end,
	activate_mutator = function (event, element, t, dt)
		return
	end,
	set_wwise_override_state = function (event, element, t, dt)
		return
	end,
	freeze_story_trigger = function (event, element, t, dt)
		return
	end,
	continue_when_spawned_count = function (event, element, t, dt)
		if element.duration then
			event.ends_at = t + ConflictUtils.random_interval(element.duration)
		end
	end,
	run_func = function (event, element, t, dt)
		return
	end,
}
TerrorEventMixer.run_functions = {
	vs_assign_boss_profile = function (event, element, t, dt)
		return
	end,
	spawn = function (event, element, t, dt)
		local data = event.data
		local optional_data = element.optional_data and table.clone(element.optional_data)
		local gizmo_unit = data.gizmo_unit

		if gizmo_unit then
			local spawn_behind_door = Unit.get_data(gizmo_unit, "is_behind_door")

			if spawn_behind_door then
				optional_data = optional_data or {}
				optional_data.spawn_behind_door = spawn_behind_door
			end
		end

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		local position = data.optional_pos and data.optional_pos:unbox() or data.origin_position and data.origin_position:unbox()
		local conflict_director = Managers.state.conflict
		local group_data = data.group_data
		local breed_name = element.breed_name

		if type(breed_name) == "table" then
			breed_name = breed_name[Math.random(1, #breed_name)]
		end

		if element.pre_spawn_func then
			local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()

			optional_data = element.pre_spawn_func(optional_data, difficulty, breed_name, event, difficulty_tweak, element.enhancement_list)
		end

		conflict_director:spawn_one(Breeds[breed_name], position, group_data, optional_data)

		return true
	end,
	spawn_special = function (event, element, t, dt)
		local breed_name
		local check_name = element.breed_name
		local num_to_spawn = element.amount or 1
		local num_to_spawn_scaled = element.difficulty_amount
		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		local conflict_director = Managers.state.conflict

		if num_to_spawn_scaled then
			local chosen_amount = Managers.state.difficulty:get_difficulty_value_from_table(num_to_spawn_scaled)

			chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

			if type(chosen_amount) == "table" then
				num_to_spawn = chosen_amount[Math.random(1, #chosen_amount)]
			else
				num_to_spawn = chosen_amount
			end
		elseif type(num_to_spawn) == "table" then
			num_to_spawn = num_to_spawn[Math.random(1, #num_to_spawn)]
		end

		if type(check_name) == "table" then
			breed_name = check_name[Math.random(1, #check_name)]
		else
			breed_name = check_name
		end

		for i = 1, num_to_spawn do
			local hidden_pos = conflict_director.specials_pacing:get_special_spawn_pos()

			conflict_director:spawn_one(Breeds[breed_name], hidden_pos, nil, optional_data)
		end

		return true
	end,
	spawn_weave_special = function (event, element, t, dt)
		local check_name = element.breed_name
		local num_to_spawn = element.amount or 1
		local conflict_director = Managers.state.conflict
		local data = event.data
		local main_path_trigger_distance = data.main_path_trigger_distance
		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		for i = 1, num_to_spawn do
			local override_epicenter_pos = MainPathUtils.point_on_mainpath(nil, main_path_trigger_distance)
			local hidden_pos = Managers.weave:weave_spawner():get_hidden_spawn_pos_from_position_seeded(override_epicenter_pos)
			local breed_name

			if type(check_name) == "table" then
				local seed, index = Math.next_random(data.seed, 1, #check_name)

				breed_name = check_name[index]
				data.seed = seed
			else
				breed_name = check_name
			end

			conflict_director:spawn_one(Breeds[breed_name], hidden_pos, nil, optional_data)
		end

		return true
	end,
	spawn_weave_special_event = function (event, element, t, dt)
		local breed_name
		local check_name = element.breed_name
		local num_to_spawn = element.amount or 1
		local num_to_spawn_scaled = element.difficulty_amount
		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		local data = event.data
		local seed = data.seed
		local conflict_director = Managers.state.conflict

		if num_to_spawn_scaled then
			local chosen_amount = Managers.state.difficulty:get_difficulty_value_from_table(num_to_spawn_scaled)

			chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

			if type(chosen_amount) == "table" then
				local index

				seed, index = Math.next_random(seed, 1, #chosen_amount)
				num_to_spawn = chosen_amount[index]
			else
				num_to_spawn = chosen_amount
			end
		elseif type(num_to_spawn) == "table" then
			local index

			seed, index = Math.next_random(seed, 1, #num_to_spawn)
			num_to_spawn = num_to_spawn[index]
		end

		if type(check_name) == "table" then
			local index

			seed, index = Math.next_random(seed, 1, #check_name)
			breed_name = check_name[index]
		else
			breed_name = check_name
		end

		for i = 1, num_to_spawn do
			local hidden_pos = conflict_director.specials_pacing:get_special_spawn_pos()

			conflict_director:spawn_one(Breeds[breed_name], hidden_pos, nil, optional_data)
		end

		data.seed = seed

		return true
	end,
	spawn_at_raw = function (event, element, t, dt)
		if Managers.player.is_server then
			local breed_name
			local check_name = element.breed_name
			local num_to_spawn = element.amount or 1
			local num_to_spawn_scaled = element.difficulty_amount
			local optional_data = element.optional_data and table.clone(element.optional_data)

			if element.spawn_counter_category then
				optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
			end

			if num_to_spawn_scaled then
				local chosen_amount = Managers.state.difficulty:get_difficulty_value_from_table(num_to_spawn_scaled)

				chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

				if type(chosen_amount) == "table" then
					num_to_spawn = chosen_amount[Math.random(1, #chosen_amount)]
				else
					num_to_spawn = chosen_amount
				end
			elseif type(num_to_spawn) == "table" then
				num_to_spawn = num_to_spawn[Math.random(1, #num_to_spawn)]
			end

			if type(check_name) == "table" then
				breed_name = check_name[Math.random(1, #check_name)]
			else
				breed_name = check_name
			end

			if element.pre_spawn_func then
				local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()

				optional_data = element.pre_spawn_func(optional_data, difficulty, breed_name, event, difficulty_tweak, element.enhancement_list)
			end

			local conflict_director = Managers.state.conflict

			for i = 1, num_to_spawn do
				local spawner_id

				if element.spawner_ids then
					local spawner_ids = element.spawner_ids
					local random_index = Math.random(1, #spawner_ids)

					spawner_id = spawner_ids[random_index]
				else
					spawner_id = element.spawner_id
				end

				conflict_director:spawn_at_raw_spawner(Breeds[breed_name], spawner_id, optional_data, element.side_id)
			end
		end

		return true
	end,
	spawn_patrol = function (event, element, t, dt)
		local data = event.data
		local position = data and data.optional_pos and data.optional_pos:unbox()
		local conflict_director = Managers.state.conflict
		local patrol_template = element.patrol_template
		local main_path_patrol = element.main_path_patrol
		local patrol_data = {}

		if main_path_patrol then
			local breed = Breeds[element.breed_name]

			patrol_data.breed = breed
			patrol_data.group_type = "main_path_patrol"
			patrol_data.side_id = element.side_id

			local side_id = element.side_id

			conflict_director:spawn_group(patrol_template, position, patrol_data)
		else
			local formations = data and data.formations or element.formations
			local num_formations = #formations
			local random_index = num_formations > 1 and math.random(num_formations) or 1
			local formation_name = formations[random_index]

			assert(PatrolFormationSettings[formation_name], "No such formation exists in PatrolFormationSettings")

			local spline_name
			local splines = element.splines

			if splines then
				local num_splines = #splines
				local random_index = num_splines > 1 and math.random(num_splines) or 1

				spline_name = splines[random_index]
			else
				spline_name = data and data.spline_id
			end

			local spline_start_position
			local formation = Managers.state.difficulty:get_difficulty_value_from_table(PatrolFormationSettings[formation_name])
			local despawn_at_end = data.one_directional

			formation.settings = PatrolFormationSettings[formation_name].settings

			local spline_way_points = data and data.spline_way_points

			if not spline_way_points then
				local route_data, waypoints, start_pos, one_directional = conflict_director.level_analysis:get_waypoint_spline(spline_name)

				if route_data then
					spline_way_points = waypoints
					spline_start_position = start_pos
					despawn_at_end = one_directional
				end
			end

			local spline_type = data and data.spline_type or element.spline_type

			patrol_data.spline_name = spline_name
			patrol_data.formation = formation
			patrol_data.group_type = "spline_patrol"
			patrol_data.spline_way_points = spline_way_points
			patrol_data.spline_type = spline_type
			patrol_data.despawn_at_end = despawn_at_end
			patrol_data.spawn_all_at_same_position = true

			conflict_director:spawn_spline_group(patrol_template, spline_start_position, patrol_data)
		end

		return true
	end,
	roaming_patrol = function (event, element, t, dt)
		local data = event.data
		local position = data.optional_pos and data.optional_pos:unbox()
		local conflict_director = Managers.state.conflict
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
		patrol_data.spawn_all_at_same_position = false

		conflict_director:spawn_spline_group(patrol_template, position, patrol_data)

		return true
	end,
	spawn_around_player = function (event, element, t, dt)
		local breed_name
		local check_name = element.breed_name
		local num_to_spawn = element.amount or 1
		local num_to_spawn_scaled = element.difficulty_amount

		if type(check_name) == "table" then
			breed_name = check_name[Math.random(1, #check_name)]
		else
			breed_name = check_name
		end

		if num_to_spawn_scaled then
			local chosen_amount = Managers.state.difficulty:get_difficulty_value_from_table(num_to_spawn_scaled)

			chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

			if type(chosen_amount) == "table" then
				num_to_spawn = chosen_amount[Math.random(1, #chosen_amount)]
			else
				num_to_spawn = chosen_amount
			end
		elseif type(num_to_spawn) == "table" then
			num_to_spawn = num_to_spawn[Math.random(1, #num_to_spawn)]
		end

		local optional_data = element.optional_data and table.clone(element.optional_data)

		if element.spawn_counter_category then
			optional_data = add_spawned_counting(event, optional_data, element.spawn_counter_category)
		end

		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local player_positions = hero_side.PLAYER_AND_BOT_POSITIONS
		local distance_to_players = element.distance_to_players or 2
		local distance_to_enemies = element.distance_to_enemies or 2

		local function filter_func(pos, invalid_pos_list)
			local min_dist_players_sqr = math.pow(distance_to_players, 2)

			for i = 1, #player_positions do
				if min_dist_players_sqr > Vector3.distance_squared(pos, player_positions[i]) then
					return false
				end
			end

			local min_dist_enemies_sqr = math.pow(distance_to_enemies, 2)

			for i = 1, #invalid_pos_list do
				if min_dist_enemies_sqr > Vector3.distance_squared(pos, invalid_pos_list[i]) then
					return false
				end
			end

			return true
		end

		if element.pre_spawn_func then
			local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()

			optional_data = element.pre_spawn_func(optional_data, difficulty, breed_name, event, difficulty_tweak, element.enhancement_list)
		end

		local invalid_pos_list = {}
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local conflict_director = Managers.state.conflict

		for i = 1, num_to_spawn do
			local random_player = PlayerUtils.get_random_alive_hero()
			local player_position = POSITION_LOOKUP[random_player]
			local distance = element.spawn_distance or 10
			local spread = element.spread or 10
			local spawn_pos = ConflictUtils.get_spawn_pos_on_circle_with_func(nav_world, player_position, distance, spread, 30, filter_func, invalid_pos_list)

			if spawn_pos then
				table.insert(invalid_pos_list, spawn_pos)
				conflict_director:spawn_one(Breeds[breed_name], spawn_pos, nil, optional_data)
			end
		end

		return true
	end,
	spawn_around_origin_unit = function (event, element, t, dt)
		if t > event.spawn_at then
			local conflict_director = Managers.state.conflict
			local spawn_table = event.spawn_table
			local optional_data_table = event.optional_data_table
			local spawn_positions = event.spawn_positions
			local group_data

			if element.group_template then
				group_data = {
					id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
					size = #spawn_positions,
					template = element.group_template,
				}
			end

			local center_position_unboxed = event.center_position:unbox()

			for i = 1, #spawn_positions do
				local spawn_pos = spawn_positions[i]
				local spawn_pos_unboxed = spawn_pos:unbox()
				local breed_name = spawn_table[i]
				local breed = Breeds[breed_name]
				local optional_data = optional_data_table[i]
				local rotation

				if element.face_unit then
					local direction = center_position_unboxed - spawn_pos_unboxed

					rotation = Quaternion.look(direction, Vector3.up())
				end

				if element.face_nearest_player_of_side then
					local side = Managers.state.side:get_side_from_name(element.face_nearest_player_of_side)
					local player_positions = side.PLAYER_AND_BOT_POSITIONS
					local player_units = side.PLAYER_AND_BOT_UNITS

					if #player_positions then
						local nearest_distance_squared = math.huge
						local nearest_position

						for player_position_index = 1, #player_positions do
							local player_position = player_positions[player_position_index]
							local distance_squared = Vector3.length_squared(spawn_pos_unboxed - player_position)
							local player_unit = player_units[player_position_index]

							if ALIVE[player_unit] and not ScriptUnit.extension(player_unit, "status_system"):is_invisible() and distance_squared < nearest_distance_squared then
								nearest_position = player_position
							end
						end

						if nearest_position then
							local direction = nearest_position - spawn_pos_unboxed

							rotation = Quaternion.look(direction, Vector3.up())
						end
					end
				end

				rotation = rotation or Quaternion.identity()

				conflict_director:spawn_one(breed, spawn_pos_unboxed, group_data, optional_data, rotation)

				if element.post_spawn_unit_func then
					element.post_spawn_unit_func(event, element, spawn_pos)
				end
			end

			event.spawn_positions = nil

			return true
		end

		return false
	end,
	spawn_around_origin_unit_staggered = function (event, element, t, dt)
		if t >= event.spawn_at and (not event.next_spawn_t or t >= event.next_spawn_t) then
			local conflict_director = Managers.state.conflict
			local spawn_table = event.spawn_table
			local optional_data_table = event.optional_data_table
			local spawn_positions = event.spawn_positions
			local group_data = event.group_data

			if element.group_template and not group_data then
				group_data = {
					id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
					size = #spawn_positions,
					template = element.group_template,
				}
				event.group_data = group_data
			end

			local center_position_unboxed = event.center_position:unbox()
			local num_to_spawn = #spawn_positions
			local num_spawned = event.num_spawned and event.num_spawned + 1 or 1
			local spawn_batch_size = Math.random(element.staggered_spawn_batch_size[1], element.staggered_spawn_batch_size[2])
			local next_spawn_count = math.min(num_spawned + spawn_batch_size, num_to_spawn)

			for i = num_spawned, next_spawn_count do
				local spawn_pos = spawn_positions[i]
				local spawn_pos_unboxed = spawn_pos:unbox()
				local breed_name = spawn_table[i]
				local breed = Breeds[breed_name]
				local optional_data = optional_data_table[i]
				local rotation

				if element.face_unit then
					local direction = center_position_unboxed - spawn_pos_unboxed

					rotation = Quaternion.look(direction, Vector3.up())
				end

				conflict_director:spawn_one(breed, spawn_pos_unboxed, group_data, optional_data, rotation)

				if element.post_spawn_unit_func then
					element.post_spawn_unit_func(event, element, spawn_pos)
				end
			end

			if next_spawn_count <= num_spawned then
				event.next_spawn_t = nil
				event.num_spawned = nil
				event.spawn_positions = nil

				return true
			end

			event.num_spawned = next_spawn_count

			local random_min = element.staggered_spawn_delay[1]
			local random_range = element.staggered_spawn_delay[2] - random_min

			event.next_spawn_t = t + math.random() * random_range + random_min
		end

		return false
	end,
	continue_when = function (event, element, t, dt)
		if element.duration and t > event.ends_at then
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
	control_hordes = function (event, element, t, dt)
		return true
	end,
	event_horde = function (event, element, t, dt)
		if t > event.ends_at then
			return true
		end
	end,
	ambush_horde = function (event, element, t, dt)
		if t > event.ends_at then
			return true
		end
	end,
	reset_event_horde = function (event, element, t, dt)
		return true
	end,
	force_horde = function (event, element, t, dt)
		if t > event.ends_at then
			return true
		end
	end,
	debug_horde = function (event, element, t, dt)
		if t > event.ends_at then
			return true
		end

		local conflict_director = Managers.state.conflict
		local spawned_units = conflict_director:spawned_enemies()
		local amount = #spawned_units

		if amount < element.amount then
			local side = Managers.state.side:get_side(conflict_director.default_hero_side_id)
			local center_pos = side.PLAYER_AND_BOT_POSITIONS[1]
			local pos = ConflictUtils.get_spawn_pos_on_circle(conflict_director.nav_world, center_pos, 25, 15, 5)

			if pos then
				local dir = center_pos - pos
				local spawn_rot = Quaternion.look(Vector3(dir.x, dir.y, 1))
				local breed = Breeds[conflict_director._debug_breed or "skaven_slave"]
				local optional_data

				conflict_director:spawn_queued_unit(breed, Vector3Box(pos), QuaternionBox(spawn_rot), "constant_70", nil, "horde_hidden", optional_data)
			end
		end
	end,
	delay = function (event, element, t, dt)
		if t > event.ends_at then
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
	start_mission = function (event, element, t)
		return true
	end,
	end_mission = function (event, element, t)
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

		local player_units = optional_data.player_units
		local all_inside = true
		local human_players = Managers.player:human_players()

		for _, player in pairs(human_players) do
			local player_unit = player.player_unit

			if not HEALTH_ALIVE[player_unit] then
				all_inside = false

				break
			end

			player_units[#player_units + 1] = player_unit
		end

		if all_inside then
			local volume_system = Managers.state.entity:system("volume_system")

			all_inside = EngineOptimizedExtensions.volume_has_all_units_inside(volume_system._volume_system, volume_name, unpack(player_units))
		end

		table.clear(player_units)

		if all_inside then
			optional_data.time_inside = optional_data.time_inside + dt
		else
			optional_data.time_inside = 0
		end

		if optional_data.time_inside >= optional_data.duration then
			local increment_stat_name = element.increment_stat_name
			local statistics_db = Managers.player:statistics_db()

			statistics_db:increment_stat_and_sync_to_clients(increment_stat_name)

			return true
		else
			return false
		end
	end,
	increase_weave_progress = function (event, element, t, dt)
		return true
	end,
	complete_weave = function (event, element, t, dt)
		return true
	end,
	activate_mutator = function (event, element, t, dt)
		local name = element.name

		if Managers.state.game_mode then
			local mutator_handler = Managers.state.game_mode._mutator_handler

			if not mutator_handler:has_activated_mutator(name) then
				mutator_handler:initialize_mutators({
					name,
				})
				mutator_handler:activate_mutator(name)
			end
		end

		return true
	end,
	set_wwise_override_state = function (event, element, t, dt)
		local name = element.name

		Managers.music:set_music_group_state("combat_music", "override", name)

		return true
	end,
	freeze_story_trigger = function (event, element, t, dt)
		local freeze = element.freeze
		local dialogue_system = Managers.state.entity:system("dialogue_system")

		if freeze then
			dialogue_system:freeze_story_trigger()
		else
			dialogue_system:unfreeze_story_trigger()
		end

		return true
	end,
	continue_when_spawned_count = function (event, element, t, dt)
		if element.duration and t > event.ends_at then
			return true
		end

		event.data.spawn_counter = event.data.spawn_counter or create_spawn_counter()

		return not element.condition or element.condition(event.data.spawn_counter)
	end,
	run_func = function (event, element, t, dt)
		element.func()

		return true
	end,
}
TerrorEventMixer.debug_functions = {
	vs_assign_boss_profile = function (event, element, t, dt)
		return "vs_assign_boss_profile"
	end,
	control_pacing = function (event, element, t, dt)
		return element.enable and "enable" or "disable"
	end,
	control_specials = function (event, element, t, dt)
		return element.enable and "enable" or "disable"
	end,
	delay = function (event, element, t, dt)
		return
	end,
	set_freeze_condition = function (event, element, t, dt)
		return string.format(": max enemies %d", event.max_active_enemies)
	end,
	debug_horde = function (event, element, t, dt)
		local spawned_units = Managers.state.conflict:spawned_enemies()
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
	ambush_horde = function (event, element, t, dt)
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
		local debug_text

		if type(element.breed_name) == "table" then
			debug_text = table.dump_string(element.breed_name)
		else
			debug_text = element.breed_name
		end

		local terror_event_type = element.spawner_id or table.tostring(element.spawner_ids)

		return terror_event_type .. " -> " .. debug_text
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
	start_mission = function (event, element, t)
		return "mission_name: " .. element.mission_name
	end,
	end_mission = function (event, element, t)
		return "mission_name: " .. element.mission_name
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
	end,
	activate_mutator = function (event, element, t, dt)
		local name = element.name

		return name
	end,
	set_wwise_override_state = function (event, element, t, dt)
		local name = element.name

		return name
	end,
	freeze_story_trigger = function (event, element, t, dt)
		local freeze = element.freeze

		return freeze
	end,
}

TerrorEventMixer.reset = function ()
	table.clear(TerrorEventMixer.active_events)
	table.clear(TerrorEventMixer.start_event_list)
	table.clear(TerrorEventMixer.finished_events)
	table.clear(TerrorEventMixer.optional_data)
end

TerrorEventMixer.add_to_start_event_list = function (event_name, seed, origin_unit, origin_position)
	local start_events = TerrorEventMixer.start_event_list
	local id = TerrorEventMixer.incrementing_id

	TerrorEventMixer.incrementing_id = TerrorEventMixer.incrementing_id + 1
	start_events[#start_events + 1] = {
		name = event_name,
		data = {
			seed = seed,
			origin_unit = origin_unit,
			origin_position = origin_position,
		},
		id = id,
	}

	return id
end

TerrorEventMixer.start_random_event = function (event_chunk_name)
	local level_transition_handler = Managers.level_transition_handler

	if level_transition_handler:needs_level_load() then
		print("TerrorEventMixer.start_random_event:", event_chunk_name, " ignored because game is transitioning away.")

		return
	end

	local level_key = level_transition_handler:get_current_level_keys()
	local event_chunk = WeightedRandomTerrorEvents[level_key][event_chunk_name]

	fassert(event_chunk, "Cannot find a WeightedRandomTerrorEvent called %s", tostring(event_chunk_name))

	local index = LoadedDice.roll_easy(event_chunk.loaded_probability_table)

	index = index * 2 - 1

	local event_name = event_chunk[index]
	local id = TerrorEventMixer.add_to_start_event_list(event_name)

	print("TerrorEventMixer.start_random_event:", event_chunk_name, "->", event_name)

	return id
end

local function is_element_available(element, data)
	local active_tags = data.active_tags
	local factions = data.factions
	local current_difficulty = data.current_difficulty
	local current_difficulty_tweak = data.current_difficulty_tweak

	if element.minimum_difficulty_tweak and current_difficulty_tweak < element.minimum_difficulty_tweak then
		return false
	end

	if element.difficulty_requirement then
		if current_difficulty < element.difficulty_requirement then
			return false
		end
	elseif element.only_on_difficulty and current_difficulty ~= element.only_on_difficulty then
		return false
	end

	if factions and element.faction_requirement then
		local requirement = element.faction_requirement

		if not table.contains(factions, requirement) then
			return false
		end
	end

	if factions and element.faction_requirement_list then
		local requirements = element.faction_requirement_list

		for _, requirement in ipairs(requirements) do
			if not table.contains(factions, requirement) then
				return false
			end
		end
	end

	if element.tag_requirement_list then
		local tags = element.tag_requirement_list

		for _, tag in ipairs(tags) do
			if not active_tags or not table.contains(active_tags, tag) then
				return false
			end
		end
	end

	return true
end

local process_terror_event_recursive

local function process_terror_event_recursive_element(element, data, processed_elements, base_event_name, depth)
	if element[1] == "inject_event" then
		local injected_event_name

		if element.event_name_list then
			local seed, index = Math.next_random(data.seed, 1, #element.event_name_list)

			injected_event_name = element.event_name_list[index]
			data.seed = seed
		elseif element.weighted_event_names then
			local total_weight = 0

			for _, sub_element in ipairs(element.weighted_event_names) do
				total_weight = total_weight + sub_element.weight
			end

			local seed, random = Math.next_random(data.seed, 0, total_weight)

			data.seed = seed

			local weight_sum = 0

			for _, sub_element in ipairs(element.weighted_event_names) do
				weight_sum = weight_sum + sub_element.weight

				if random <= weight_sum then
					injected_event_name = sub_element.event_name

					break
				end
			end

			if injected_event_name == nil then
				assert(false, "Failed getting a random weighted element.")
			end
		else
			injected_event_name = element.event_name
		end

		process_terror_event_recursive(processed_elements, data, depth + 1, injected_event_name)
	elseif element[1] == "one_of" then
		for _, possible_element in ipairs(element[2]) do
			if is_element_available(possible_element, data) then
				process_terror_event_recursive_element(possible_element, data, processed_elements, base_event_name, depth)

				break
			end
		end
	else
		element.base_event_name = base_event_name
		processed_elements[#processed_elements + 1] = element
	end
end

local MAX_INJECTION_DEPTH = 10

function process_terror_event_recursive(processed_elements, data, depth, event_name)
	fassert(depth < MAX_INJECTION_DEPTH, "Injecting terror events lead to high level of recursion, please check if there is a possible loop, or increase MAX_INJECTION_DEPTH.")

	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local injected_elements = TerrorEventBlueprints[level_key][event_name] or GenericTerrorEvents[event_name]

	fassert(injected_elements, "No terror event called '%s', exists. Make sure it is added to level %s, or generic, terror event file if its supposed to be there.", event_name, level_key)

	for _, element in ipairs(injected_elements) do
		if is_element_available(element, data) then
			process_terror_event_recursive_element(element, data, processed_elements, event_name, depth)
		end
	end

	return processed_elements
end

local function process_terror_event(data, base_event_name)
	local active_tags = Managers.state.game_mode._mutator_handler:get_terror_event_tags()
	local conflict_director = Managers.state.conflict
	local director = ConflictDirectors[conflict_director.initial_conflict_settings]
	local factions = director.factions
	local current_difficulty, current_difficulty_tweak = Managers.state.difficulty:get_difficulty_rank()

	data.current_difficulty = current_difficulty
	data.current_difficulty_tweak = current_difficulty_tweak
	data.factions = factions
	data.active_tags = active_tags

	local processed_elements = process_terror_event_recursive({}, data, 0, base_event_name)

	if script_data.debug_terror then
		print("process_terror_event: " .. table.tostring(processed_elements))
	end

	return processed_elements
end

TerrorEventMixer.start_event = function (event_name, data, id)
	if script_data.only_allowed_terror_event ~= event_name and script_data.ai_terror_events_disabled then
		return
	end

	if data then
		data.seed = data.seed or 0
	else
		data = {
			seed = 0,
		}
	end

	local seed, _ = Math.next_random(data.seed)

	data.seed = seed

	print(string.format("TerrorEventMixer.start_event: %s (seed: %d)", event_name, data.seed))

	local active_events = TerrorEventMixer.active_events
	local elements = process_terror_event(data, event_name)

	Managers.state.game_mode:post_process_terror_event(elements)

	if not id then
		id = TerrorEventMixer.incrementing_id
		TerrorEventMixer.incrementing_id = TerrorEventMixer.incrementing_id + 1
	end

	if #elements > 0 then
		local new_event = {
			ends_at = 0,
			index = 1,
			name = event_name,
			elements = elements,
			data = data,
			max_active_enemies = math.huge,
			id = id,
		}

		active_events[#active_events + 1] = new_event

		local element = elements[1]
		local func_name = element[1]
		local t = Managers.time:time("game")

		TerrorEventMixer.init_functions[func_name](new_event, element, t)
	end

	Managers.telemetry_events:terror_event_started(event_name)
end

TerrorEventMixer.stop_event = function (event_name)
	print("TerrorEventMixer.stop_event:", event_name)

	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events

	for i = 1, num_events do
		local event = active_events[i]

		if event.name == event_name then
			table.remove(active_events, i)
			table.insert(TerrorEventMixer.finished_events, event.name)

			if i <= TerrorEventMixer.active_event_i then
				TerrorEventMixer.active_event_i = TerrorEventMixer.active_event_i - 1
			end

			break
		end
	end
end

TerrorEventMixer.find_event = function (event_name)
	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events

	for i = 1, num_events do
		local event = active_events[i]

		if event.name == event_name then
			return event
		end
	end
end

TerrorEventMixer.is_event_id_active_or_pending = function (id)
	local active_events = TerrorEventMixer.active_events
	local num_events = #active_events

	for i = 1, num_events do
		local event = active_events[i]

		if event.id == id then
			return true
		end
	end

	local start_event_list = TerrorEventMixer.start_event_list

	num_events = #start_event_list

	for i = 1, num_events do
		local event = start_event_list[i]

		if event.id == id then
			return true
		end
	end

	return false
end

TerrorEventMixer.update = function (t, dt, gui)
	local active_events = TerrorEventMixer.active_events

	TerrorEventMixer.active_event_i = 1

	while TerrorEventMixer.active_event_i <= #active_events do
		local event = active_events[TerrorEventMixer.active_event_i]
		local event_completed = TerrorEventMixer.run_event(event, t, dt)

		if event_completed and TerrorEventMixer.find_event(event.name) then
			table.remove(active_events, TerrorEventMixer.active_event_i)
			table.insert(TerrorEventMixer.finished_events, event.name)
		else
			TerrorEventMixer.active_event_i = TerrorEventMixer.active_event_i + 1
		end
	end

	TerrorEventMixer.active_event_i = -1

	local start_events = TerrorEventMixer.start_event_list

	for i = 1, #start_events do
		local event = start_events[i]
		local event_name = event.name
		local data = event.data
		local id = event.id

		TerrorEventMixer.start_event(event_name, data, id)

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

	if active_enemies > event.max_active_enemies then
		element.ends_at = (element.ends_at or 0) + dt
	else
		local func_name = element[1]
		local element_name = element and element.composition_type or element.breed_name

		if script_data.debug_terror and element_name then
			printf("[Terror event] Started terror even function: %s with %s", func_name, element_name)
		end

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

local tiny_font_size = 12
local tiny_font = "arial"
local tiny_font_mtrl = "materials/fonts/" .. tiny_font
local resx, resy = Application.resolution()
local debug_win_width = 400
local debug_x = 0

TerrorEventMixer.debug = function (gui, active_events, t, dt)
	if DebugKeyHandler.key_pressed("mouse_middle_held", "pan terror event mixer", "ai debugger") then
		local input_service = Managers.free_flight.input_manager:get_service("Debug")
		local look = input_service:get("look")

		debug_x = debug_x - look.x * 0.001
	end

	local x, y = 0, 0

	for i = 1, #active_events do
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
	local borderx, bordery = 20 + panning_x, 280

	x1 = x1 + borderx + 20
	y1 = y1 + bordery + 40

	local y2 = y1
	local layer = 200
	local completed_color = Colors.get_color_with_alpha("gray", 255)
	local frozen_color = Colors.get_color_with_alpha("cyan", 255)
	local running_color = Colors.get_color_with_alpha("lavender", 255)
	local unrun_color = Colors.get_color_with_alpha("cadet_blue", 255)
	local header_color = Colors.get_color_with_alpha("orange", 255)

	ScriptGUI.ictext(gui, resx, resy, "Event: " .. event.name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, header_color)

	y2 = y2 + 20

	if event.data.spawn_counter then
		for spawn_counter_category, count in pairs(event.data.spawn_counter) do
			local text = string.format("#%s:%d", spawn_counter_category, count)

			ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, unrun_color)

			y2 = y2 + 20
		end
	end

	local start_index = 1

	if index > 9 then
		start_index = index - 9
	end

	local end_index = #elements

	if end_index - start_index > 18 then
		end_index = start_index + 18
	end

	for i = start_index, index - 1 do
		local element = elements[i]
		local func_name = element[1]
		local base_event_name = element.base_event_name
		local debug_text = TerrorEventMixer.debug_functions[func_name] and TerrorEventMixer.debug_functions[func_name](event, element, t, dt) or ""
		local text = string.format(" %d] %s: %s %s", i, base_event_name, func_name, debug_text)

		ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, completed_color)

		y2 = y2 + 20
	end

	local active_enemies = Managers.state.performance:num_active_enemies()
	local event_frozen

	if active_enemies > event.max_active_enemies then
		event_frozen = true
	end

	local element = elements[index]
	local func_name = element[1]
	local base_event_name = element.base_event_name
	local debug_text = TerrorEventMixer.debug_functions[func_name] and TerrorEventMixer.debug_functions[func_name](event, element, t, dt) or ""
	local ends_at = element.duration and string.format("time: %.1f", event.ends_at - t) or ""
	local text

	if event_frozen then
		text = string.format(" %d] %s: %s %s %s FROZEN: %d / %d", index, base_event_name, func_name, debug_text, ends_at, active_enemies, event.max_active_enemies)
	else
		text = string.format(" %d] %s: %s %s %s", index, base_event_name, func_name, debug_text, ends_at)
	end

	ScriptGUI.ictext(gui, resx, resy, "==>", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 20, y2, layer, event_frozen and frozen_color or running_color)
	ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1, y2, layer, event_frozen and frozen_color or running_color)

	y2 = y2 + 20

	for i = index + 1, end_index do
		local element = elements[i]
		local func_name = element[1]
		local base_event_name = element.base_event_name
		local duration = ""
		local text = string.format(" %d] %s: %s %s", i, base_event_name, func_name, duration)

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
			ScriptGUI.ictext(gui, resx, resy, running_master_event, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10 + 100, bordery - 6, layer, master_color)
		else
			ScriptGUI.ictext(gui, resx, resy, "Master Event: ", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, bordery - 6, layer, header_color)
			ScriptGUI.ictext(gui, resx, resy, "disabled", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10 + 75, bordery - 6, layer, disabled_color)
		end

		ScriptGUI.ictext(gui, resx, resy, string.format("Active enemies: %d / %d", active_enemies, event.max_active_enemies), tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, bordery + 12, layer, event_frozen and disabled_color or master_color)
		ScriptGUI.icrect(gui, resx, resy, borderx, bordery - 22, x1 + debug_win_width, bordery, layer - 1, Color(200, 20, 20, 20))
	end
end

local fail
local s = "\n"

for event_name, elements in pairs(TerrorEventBlueprints) do
	for i = 1, #elements do
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
