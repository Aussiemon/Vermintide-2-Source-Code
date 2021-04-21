local Snippets = {
	load_level = function (level_key)
		Testify:make_request("load_level", level_key)
		Testify:make_request("wait_for_level_loaded")
	end,
	wait_for_state_ingame_reached = function ()
		Testify:make_request("wait_for_state_ingame_reached")
	end,
	wait_for_player_to_spawn = function ()
		Testify:make_request("wait_for_player_to_spawn")
	end,
	wait_for_cutscene_to_finish = function ()
		Testify:make_request("wait_for_cutscene_to_finish")
	end,
	skip_cutscene = function ()
		Testify:make_request("skip_cutscene")
	end,
	disable_level_intro_dialogue = function ()
		Snippets.set_script_data({
			disable_level_intro_dialogue = true
		})
	end,
	request_profiles = function (affiliation)
		return Testify:make_request("request_profiles", affiliation or "heroes")
	end,
	request_non_magic_weapons_for_career = function (career_name)
		return Testify:make_request("request_non_magic_weapons_for_career", career_name)
	end,
	request_magic_weapons_for_career = function (career_name)
		return Testify:make_request("request_magic_weapons_for_career", career_name)
	end,
	wait_for_players_inventory_ready = function ()
		Testify:make_request("wait_for_players_inventory_ready")
	end,
	player_wield_weapon = function (weapon)
		Testify:make_request("player_wield_weapon", weapon)
		Testify:make_request("wait_for_weapon_assets_to_be_loaded")
	end,
	bot_wield_weapon = function (weapon)
		Testify:make_request("bot_wield_weapon", weapon)
	end,
	set_player_profile = function (profile_name, career_name)
		Testify:make_request("set_player_profile", {
			profile_name = profile_name,
			career_name = career_name
		})
		Snippets.wait_for_player_to_spawn()
	end,
	set_bot_profile = function (profile_name, career_name)
		Testify:make_request("set_bot_profile", {
			profile_name = profile_name,
			career_name = career_name
		})
		Testify:make_request("disable_bots")
		Testify:make_request("enable_bots")
		Testify:make_request("wait_for_bots_to_spawn")
	end,
	add_all_weapon_skins = function ()
		Testify:make_request("add_all_weapon_skins")
	end,
	get_available_deus_talent_power_up_tests = function ()
		return Testify:make_request("get_available_deus_talent_power_up_tests")
	end,
	get_available_deus_generic_power_up_tests = function (power_up_type)
		return Testify:make_request("get_available_deus_generic_power_up_tests")
	end,
	activate_bots_deus_power_up = function (power_up_name, rarity)
		local request_parameter = {
			power_up_name = power_up_name,
			rarity = rarity
		}

		Testify:make_request("activate_bots_deus_power_up", request_parameter)
	end,
	activate_player_deus_power_up = function (power_up_name, rarity)
		local request_parameter = {
			power_up_name = power_up_name,
			rarity = rarity
		}

		Testify:make_request("activate_player_deus_power_up", request_parameter)
	end,
	reset_deus_power_ups = function ()
		Testify:make_request("reset_deus_power_ups")
	end,
	set_script_data = function (options)
		Testify:make_request("set_script_data", options)
	end,
	add_buffs_to_heroes = function (buffs)
		Testify:make_request("add_buffs_to_heroes", buffs)
	end,
	wait = function (seconds)
		local now = os.clock()

		while seconds > os.clock() - now do
			coroutine.yield()
		end
	end,
	set_game_mode_to_weave = function ()
		Testify:make_request("set_game_mode_to_weave")
	end,
	load_weave = function (weave_name)
		Testify:make_request("set_next_weave", weave_name)
		Testify:make_request("load_weave", weave_name)
		Testify:make_request("wait_for_level_loaded")
	end,
	get_weave_end_zone = function (weave_number)
		return Testify:make_request("get_weave_end_zone", weave_number)
	end,
	get_active_weave_phase = function ()
		return Testify:make_request("get_active_weave_phase")
	end,
	weave_remaining_time = function ()
		return Testify:make_request("weave_remaining_time")
	end,
	weave_spawn_essence_on_first_bot_position = function ()
		Testify:make_request("weave_spawn_essence_on_first_bot_position")
	end,
	versus_objective_add_time = function (time)
		Testify:make_request("versus_objective_add_time", time)
	end,
	versus_current_objective_position = function ()
		return Testify:make_request("versus_current_objective_position")
	end,
	versus_complete_objectives = function ()
		Snippets.wait(1)
		Testify:make_request("versus_complete_objectives")
		Snippets.wait(1)
	end,
	versus_objective_name = function ()
		return Testify:make_request("versus_objective_name")
	end,
	versus_objective_type = function ()
		return Testify:make_request("versus_objective_type")
	end,
	versus_objective_simulate_interaction = function ()
		Testify:make_request("versus_objective_simulate_interaction")
	end,
	versus_has_lost = function ()
		return Testify:make_request("versus_has_lost")
	end,
	set_camera_to_observe_first_bot = function ()
		Testify:make_request("set_camera_to_observe_first_bot")
	end,
	update_camera_to_follow_first_bot_rotation = function ()
		Testify:make_request("update_camera_to_follow_first_bot_rotation")
	end,
	set_player_unit_not_visible = function ()
		Testify:make_request("set_player_unit_not_visible")
	end,
	has_lost = function ()
		return Testify:make_request("has_lost")
	end,
	total_main_path_distance = function ()
		return Testify:make_request("total_main_path_distance")
	end,
	level_end_screen_displayed = function ()
		return Testify:make_request("level_end_screen_displayed")
	end,
	peaks = function ()
		return Testify:make_request("peaks")
	end,
	terror_event_finished = function (event_name)
		return Testify:make_request("terror_event_finished", event_name)
	end,
	reset_terror_event_mixer = function ()
		Testify:make_request("reset_terror_event_mixer")
	end,
	start_terror_event = function (event_name)
		Testify:make_request("start_terror_event", event_name)
	end,
	kill_nearby_enemies = function ()
		Testify:make_request("kill_nearby_enemies")
	end,
	close_level_end_screen = function ()
		Testify:make_request("close_level_end_screen")
	end,
	teleport_player_to_main_path_point = function (main_path_point)
		Testify:make_request("teleport_player_to_main_path_point", main_path_point)
	end,
	closest_travel_distance_to_player = function ()
		return Testify:make_request("closest_travel_distance_to_player")
	end,
	teleport_player_to_position = function (position)
		local stored_position = Vector3Box(Vector3(-999, -999, -999))

		stored_position:store(position)
		Testify:make_request("teleport_player_to_position", stored_position)
	end,
	teleport_bots_forward_on_main_path_if_blocked = function (bots_data)
		return Testify:make_request("teleport_bots_forward_on_main_path_if_blocked", bots_data)
	end,
	are_bots_blocked = function (bot_teleportation_data)
		return Testify:make_request("are_bots_blocked", bot_teleportation_data)
	end,
	teleport_player_randomly_on_main_path = function ()
		Testify:make_request("teleport_player_randomly_on_main_path")
	end,
	make_game_ready_for_next_weave = function ()
		Testify:make_request("make_game_ready_for_next_weave")
	end,
	make_players_invicible = function ()
		Testify:make_request("make_players_invicible")
	end,
	make_player_and_two_bots_invicible = function ()
		Testify:make_request("make_player_and_two_bots_invicible")
	end,
	is_end_zone_activated = function (end_zone_name)
		return Testify:make_request("is_end_zone_activated", end_zone_name)
	end,
	teleport_player_to_end_zone_position = function (end_zone_name)
		Testify:make_request("teleport_player_to_end_zone_position", end_zone_name)
	end,
	load_level_with_variation = function (weather_variation)
		Testify:make_request("load_level_with_variation", weather_variation)
		Testify:make_request("wait_for_level_loaded")
	end,
	get_level_weather_variations = function (level_key)
		return Testify:make_request("get_level_weather_variations", level_key)
	end,
	set_telemetry_settings = function (settings)
		Testify:make_request("set_telemetry_settings", settings)
	end,
	disable_ai = function ()
		Snippets.set_script_data({
			ai_mini_patrol_disabled = true,
			disable_plague_sorcerer = true,
			ai_roaming_spawning_disabled = true,
			disable_gutter_runner = true,
			ai_boss_spawning_disabled = true,
			ai_bots_disabled = true,
			ai_roaming_patrols_disabled = true,
			ai_terror_events_disabled = true,
			ai_critter_spawning_disabled = true,
			disable_globadier = true,
			disable_warpfire_thrower = true,
			ai_pacing_disabled = true,
			disable_pack_master = true,
			ai_rush_intervention_disabled = true,
			disable_ratling_gunner = true,
			disable_vortex_sorcerer = true,
			ai_horde_spawning_disabled = true,
			ai_specials_spawning_disabled = true,
			ai_champion_spawn_debug = true
		})
	end,
	get_main_path_points = function (nb_points)
		return Testify:make_request("get_main_path_points", nb_points)
	end,
	activate_free_flight = function ()
		Testify:make_request("activate_free_flight")
	end,
	move_free_flight_camera = function (data)
		Testify:make_request("move_free_flight_camera", data)
	end,
	set_difficulty = function (difficulty)
		Testify:make_request("set_difficulty", difficulty)
	end,
	get_player_current_position = function ()
		return Testify:make_request("get_player_current_position")
	end,
	get_all_breeds = function ()
		return Testify:make_request("get_all_breeds")
	end,
	spawn_unit = function (unit_data)
		return Testify:make_request("spawn_unit", unit_data)
	end,
	get_unit_of_breed = function (breed_name)
		return Testify:make_request("get_unit_of_breed", breed_name)
	end,
	is_unit_alive = function (unit)
		return Testify:make_request("is_unit_alive", unit)
	end,
	get_unit_health_values = function (unit)
		return Testify:make_request("get_unit_health_values", unit)
	end,
	kill_unit = function (unit)
		Testify:make_request("kill_unit", unit)
	end,
	destroy_all_units = function ()
		Testify:make_request("destroy_all_units")
	end,
	fail_test = function (message)
		Testify:make_request("fail_test", message)
	end,
	memory_usage = function (index)
		Testify:make_request("memory_usage", index)
	end,
	start_measure_fps = function ()
		Testify:make_request("start_measure_fps")
	end,
	stop_measure_fps = function (point_id)
		Testify:make_request("stop_measure_fps", point_id)
	end
}

return Snippets
