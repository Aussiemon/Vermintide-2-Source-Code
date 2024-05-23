-- chunkname: @scripts/settings/mutators/mutator_curse_egg_of_tzeentch.lua

local MONSTERS = {
	"chaos_troll",
	"chaos_spawn",
	"skaven_rat_ogre",
	"skaven_stormfiend",
	"beastmen_minotaur",
}
local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local NEXT_EGG_COOLDOWN = {
	[NORMAL] = 30,
	[HARD] = 30,
	[HARDER] = 30,
	[HARDEST] = 30,
	[CATACLYSM] = 30,
}
local EGG_AMOUNT = {
	[NORMAL] = math.huge,
	[HARD] = math.huge,
	[HARDER] = math.huge,
	[HARDEST] = math.huge,
	[CATACLYSM] = math.huge,
}
local EGG_HEALTH = {
	[NORMAL] = 100,
	[HARD] = 150,
	[HARDER] = 200,
	[HARDEST] = 250,
	[CATACLYSM] = 300,
}
local SOUND_EVENTS = {
	ALERT_HIGH = "Play_curse_egg_of_tzeentch_alert_high",
	ALERT_LOW = "Play_curse_egg_of_tzeentch_alert_low",
	ALERT_MEDIUM = "Play_curse_egg_of_tzeentch_alert_medium",
	EGG_DESTROYED = "Play_curse_egg_of_tzeentch_alert_egg_destroyed",
	EGG_EXPLOSION = "Play_curse_egg_of_tzeentch_explosion",
}
local VFX_EGG_EXPLOSION = "fx/magic_wind_essence_explosion_02"
local EGG_MISSION_NAME = "egg_of_tzeentch"
local EGG_UNIT_TEMPLATE = "egg_of_tzeentch_unit"
local EGG_UNIT_NAME = "units/props/egg_of_tzeentch"
local EGG_EXTENSION_INIT_DATA = {
	buff_system = {
		initial_buff_names = {
			"objective_unit",
			"health_bar",
		},
	},
	health_system = {},
	death_system = {
		death_reaction_template = "destructible_buff_objective_unit",
	},
	hit_reaction_system = {
		hit_reaction_template = "level_object",
	},
	timed_spawner_system = {
		max_spawn_amount = 1,
	},
}

local function filter_by_available_breeds(breeds, contained_breeds)
	local available_breeds = {}

	for _, breed_name in ipairs(breeds) do
		if contained_breeds[breed_name] then
			table.insert(available_breeds, breed_name)
		end
	end

	return available_breeds
end

local function get_position_on_nav_mesh(nav_world, position)
	local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, 1, 1)

	nav_position = nav_position or GwNavQueries.inside_position_from_outside_position(nav_world, position, 6, 6, 8, 0.5)

	return nav_position
end

local function spawn_egg_on_path(conflict_director, unit_spawner, nav_world, mission_system, extension_init_data, spawn_distance)
	spawn_distance = math.clamp(spawn_distance, 0, MainPathUtils.total_path_dist() - 0.1)

	local main_paths = conflict_director.level_analysis:get_main_paths()
	local position = MainPathUtils.point_on_mainpath(main_paths, spawn_distance)
	local nav_position = position and get_position_on_nav_mesh(nav_world, position)

	if not nav_position then
		mutator_dprint("Couldn't find a spawn position on the navmesh")

		return
	end

	local random_rotation_rad = math.random() * math.pi * 2
	local rotation = Quaternion.from_elements(0, 0, random_rotation_rad, 0)
	local egg_unit = unit_spawner:spawn_network_unit(EGG_UNIT_NAME, EGG_UNIT_TEMPLATE, extension_init_data, nav_position, rotation)

	mission_system:request_mission("egg_of_tzeentch")

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_2d_audio_event(SOUND_EVENTS.ALERT_LOW)

	return egg_unit
end

local function is_valid_spawn_distance(ahead_player_travel_dist, egg_spawn_distance, ahead_peak_distance, peaks)
	local total_path_dist = MainPathUtils.total_path_dist()

	if total_path_dist < egg_spawn_distance then
		return false
	end

	local is_egg_ahead_last_peak = false
	local last_peak_distance = 0
	local ahead_player_closest_peak_distance = math.huge

	for _, peak_travel_distance in ipairs(peaks) do
		if ahead_player_travel_dist < peak_travel_distance and peak_travel_distance < ahead_player_closest_peak_distance then
			ahead_player_closest_peak_distance = peak_travel_distance
		end

		if last_peak_distance < peak_travel_distance then
			last_peak_distance = peak_travel_distance
			is_egg_ahead_last_peak = last_peak_distance <= egg_spawn_distance
		end
	end

	local closest_valid_peak_distance = ahead_player_closest_peak_distance - ahead_peak_distance

	if is_egg_ahead_last_peak or closest_valid_peak_distance < egg_spawn_distance then
		return false
	else
		return true
	end
end

return {
	description = "curse_egg_of_tzeentch_desc",
	display_name = "curse_egg_of_tzeentch_name",
	icon = "deus_curse_tzeentch_01",
	packages = {
		"resource_packages/mutators/mutator_curse_egg_of_tzeentch",
	},
	client_start_function = function (context, data)
		data.vfx_ids = {}
		data.wwise_world = Managers.world:wwise_world(context.world)
	end,
	server_start_function = function (context, data)
		data.seed = Managers.mechanism:get_level_seed()
		data.difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		data.mission_system = Managers.state.entity:system("mission_system")
		data.unit_spawner = Managers.state.unit_spawner

		local ai_system = Managers.state.entity:system("ai_system")

		data.nav_world = ai_system:nav_world()
		data.num_available_eggs = EGG_AMOUNT[data.difficulty_rank] or EGG_AMOUNT[NORMAL]
		data.num_destroyed_eggs = 0
		data.monster_spawned = data.template.monster_spawned

		Managers.state.event:register(data, "spawned_timed_breed", "monster_spawned")
	end,
	tweak_zones = function (context, data, conflict_director_name, zones, num_zones)
		data.conflict_director = Managers.state.conflict
		data.peaks = data.conflict_director:get_peaks()
	end,
	update_conflict_settings = function (context, data)
		local boss_settings = CurrentBossSettings

		boss_settings.disabled = true
	end,
	server_players_left_safe_zone = function (context, data)
		data.timer = MutatorCommonSettings.deus.initial_activation_delay
	end,
	server_update_function = function (context, data, dt, t)
		local mission_system = data.mission_system
		local active_missions = mission_system:get_missions()
		local num_missions = table.size(active_missions)

		if not data.timer and num_missions >= 2 and ALIVE[data.egg_unit] and mission_system:has_active_mission(EGG_MISSION_NAME) then
			AiUtils.kill_unit(data.egg_unit)

			data.alert_timer = nil
			data.alert_high_triggered = false
			data.alert_medium_triggered = false
		end

		local pacing_frozen = data.conflict_director.pacing:get_state() == "pacing_frozen"

		if HEALTH_ALIVE[data.last_spawned_monster] or pacing_frozen or num_missions > 0 then
			return
		end

		local egg_mission = Missions.egg_of_tzeentch
		local alert_timer = data.alert_timer
		local new_alert_timer = alert_timer and alert_timer - dt

		data.alert_timer = new_alert_timer

		if new_alert_timer then
			if new_alert_timer < egg_mission.alert_medium_timer and not data.alert_medium_triggered then
				data.alert_medium_triggered = true

				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:play_2d_audio_event(SOUND_EVENTS.ALERT_MEDIUM)

				local dialogue_system = Managers.state.entity:system("dialogue_system")
				local player_unit = dialogue_system:get_random_player()

				if player_unit then
					local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
					local event_data = FrameTable.alloc_table()

					dialogue_input:trigger_dialogue_event("curse_move_on", event_data)
				end
			elseif new_alert_timer < egg_mission.alert_high_timer and not data.alert_high_triggered then
				data.alert_high_triggered = true

				local audio_system = Managers.state.entity:system("audio_system")

				audio_system:play_2d_audio_event(SOUND_EVENTS.ALERT_HIGH)

				data.alert_timer = nil
			end
		end

		local timer = data.timer
		local new_timer = timer and timer - dt
		local timer_unfinished = new_timer and new_timer > 0

		if not new_timer or timer_unfinished then
			data.timer = new_timer

			return
		end

		local conflict_director = data.conflict_director
		local main_path_info = conflict_director.main_path_info
		local ahead_player_info = conflict_director.main_path_player_info[main_path_info.ahead_unit]

		if not ahead_player_info then
			return
		end

		local ahead_player_travel_dist = ahead_player_info.travel_dist
		local egg_spawn_distance = egg_mission.distance + ahead_player_travel_dist
		local ahead_peak_distance = egg_mission.ahead_peak_distance

		if not is_valid_spawn_distance(ahead_player_travel_dist, egg_spawn_distance, ahead_peak_distance, data.peaks) then
			return
		end

		data.timer = nil

		local difficulty = Managers.state.difficulty:get_difficulty()
		local contained_breeds = CurrentConflictSettings.contained_breeds[difficulty]
		local available_monsters = filter_by_available_breeds(MONSTERS, contained_breeds)
		local egg_hatch_time = egg_mission.duration
		local egg_extension_init_data = table.clone(EGG_EXTENSION_INIT_DATA)

		egg_extension_init_data.health_system.health = EGG_HEALTH[data.difficulty_rank] or EGG_HEALTH[NORMAL]

		local timed_spawner_system = egg_extension_init_data.timed_spawner_system

		timed_spawner_system.spawn_rate = egg_hatch_time
		timed_spawner_system.spawnable_breeds = available_monsters

		timed_spawner_system.cb_unit_spawned_function = function (unit)
			data.last_spawned_monster = unit

			local audio_system = Managers.state.entity:system("audio_system")

			audio_system:play_2d_audio_event(SOUND_EVENTS.EGG_DESTROYED)
		end

		data.alert_timer = egg_hatch_time
		data.alert_high_triggered = false
		data.alert_medium_triggered = false
		data.egg_unit = spawn_egg_on_path(conflict_director, data.unit_spawner, data.nav_world, data.mission_system, egg_extension_init_data, egg_spawn_distance)
	end,
	server_level_object_killed_function = function (context, data, killed_unit)
		if Unit.is_a(killed_unit, EGG_UNIT_NAME) then
			data.template.on_egg_destroyed(data, killed_unit)

			local mission_system = data.mission_system

			if mission_system:has_active_mission(EGG_MISSION_NAME) then
				mission_system:end_mission(EGG_MISSION_NAME, true)
			end

			local dialogue_system = Managers.state.entity:system("dialogue_system")
			local player_unit = dialogue_system:get_random_player()

			if player_unit then
				local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("curse_objective_achieved", event_data)
			end
		end
	end,
	on_egg_destroyed = function (data, unit)
		if not Unit.is_a(unit, EGG_UNIT_NAME) then
			return
		end

		data.num_destroyed_eggs = data.num_destroyed_eggs + 1

		if data.num_destroyed_eggs < data.num_available_eggs then
			data.timer = NEXT_EGG_COOLDOWN[data.difficulty_rank] or NEXT_EGG_COOLDOWN[NORMAL]
		else
			data.timer = nil
		end
	end,
	monster_spawned = function (data, unit)
		data.template.on_egg_destroyed(data, unit)

		local dialogue_system = Managers.state.entity:system("dialogue_system")
		local player_unit = dialogue_system:get_random_player()

		if player_unit then
			local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("curse_very_negative_effect_happened", event_data)
		end
	end,
	server_stop_function = function (context, data, is_destroy)
		local boss_settings = CurrentBossSettings

		boss_settings.disabled = false
	end,
	client_level_object_killed_function = function (context, data, killed_unit)
		if Unit.is_a(killed_unit, EGG_UNIT_NAME) then
			local position = POSITION_LOOKUP[killed_unit]

			data.template.play_effect(context, data, position, VFX_EGG_EXPLOSION, SOUND_EVENTS.EGG_EXPLOSION)
		end

		data.alert_timer = nil
	end,
	play_effect = function (context, data, position, vfx_name, sound_event_name)
		if vfx_name then
			local vfx_id = World.create_particles(context.world, vfx_name, position)

			table.insert(data.vfx_ids, vfx_id)
		end

		if sound_event_name then
			WwiseUtils.trigger_position_event(context.world, sound_event_name, position)
		end
	end,
	client_stop_function = function (context, data)
		for _, vfx_id in ipairs(data.vfx_ids) do
			World.destroy_particles(context.world, vfx_id)
		end
	end,
}
