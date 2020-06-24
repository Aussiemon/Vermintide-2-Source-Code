local Snippets = {
	load_level = function (level_key)
		Testify:make_request("load_level", level_key)
		Testify:make_request("wait_for_level_loaded")
	end,
	wait_for_player_to_spawn = function ()
		Testify:make_request("wait_for_player_to_spawn")
	end,
	wait_for_cutscene_to_finish = function ()
		Testify:make_request("wait_for_cutscene_to_finish")
	end,
	request_profiles = function (affiliation)
		return Testify:make_request("request_profiles", affiliation or "heroes")
	end,
	request_weapons_for_career = function (career_name)
		return Testify:make_request("request_weapons_for_career", career_name)
	end,
	player_wield_weapon = function (weapon)
		Testify:make_request("player_wield_weapon", weapon)
		Testify:make_request("wait_for_weapon_asset_to_be_loaded")
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
	set_script_data = function (options)
		Testify:make_request("set_script_data", options)
	end,
	sleep = function (seconds)
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
		local active_phase = Testify:make_request("get_active_weave_phase")

		return active_phase
	end,
	weave_remaining_time = function ()
		return Testify:make_request("weave_remaining_time")
	end,
	spawn_essence_on_first_bot_position = function ()
		Testify:make_request("spawn_essence_on_first_bot_position")
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
	level_finished = function ()
		local end_of_level_reached = nil
		local level_end_screen_displayed = Snippets.level_end_screen_displayed()

		if not level_end_screen_displayed then
			end_of_level_reached = Snippets.end_of_the_level_reached()
		end

		return end_of_level_reached or level_end_screen_displayed
	end,
	has_lost = function ()
		return Testify:make_request("has_lost")
	end,
	end_of_the_level_reached = function ()
		return Testify:make_request("end_of_the_level_reached")
	end,
	level_end_screen_displayed = function ()
		return Testify:make_request("level_end_screen_displayed")
	end,
	close_level_end_screen = function ()
		Testify:make_request("close_level_end_screen")
	end,
	teleport_player_forward_on_main_path = function (additional_distance)
		local best_point = Testify:make_request("calculate_best_point_on_main_path", additional_distance)

		Testify:make_request("teleport_player_on_best_point", best_point)
	end,
	teleport_blocked_bots_forward_on_main_path = function (bots_data)
		return Testify:make_request("teleport_blocked_bots_forward_on_main_path", bots_data)
	end,
	are_bots_blocked = function (bots_stuck_data)
		local are_bots_blocked = Testify:make_request("are_bots_blocked", bots_stuck_data)

		return are_bots_blocked
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
	make_player_and_one_bot_invicible = function ()
		Testify:make_request("make_player_and_one_bot_invicible")
	end,
	end_zone_activated = function (end_zone_name)
		return Testify:make_request("end_zone_activated", end_zone_name)
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
	end
}

return Snippets
