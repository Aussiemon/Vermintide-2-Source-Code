-- chunkname: @scripts/tests/testify_snippets.lua

local TestifySnippets = {}

TestifySnippets.load_level = function (level_settings)
	Testify:make_request("load_level", level_settings)
	Testify:make_request("wait_for_level_to_be_loaded")
end

TestifySnippets.disable_level_intro_dialogue = function ()
	TestifySnippets.set_script_data({
		disable_level_intro_dialogue = true,
	})
end

TestifySnippets.set_player_profile = function (profile_name, career_name)
	Testify:make_request("set_player_profile", {
		profile_name = profile_name,
		career_name = career_name,
	})
	Testify:make_request("wait_for_player_to_spawn")
end

TestifySnippets.set_bot_profile = function (profile_name, career_name)
	Testify:make_request("set_bot_profile", {
		profile_name = profile_name,
		career_name = career_name,
	})
	Testify:make_request("disable_bots")
	Testify:make_request("enable_bots")
	Testify:make_request("wait_for_bots_to_spawn")
end

TestifySnippets.set_script_data = function (options)
	Testify:make_request("set_script_data", options)
end

TestifySnippets.wait = function (seconds)
	local now = os.clock()

	while seconds > os.clock() - now do
		coroutine.yield()
	end
end

TestifySnippets.load_weave = function (weave_name)
	Testify:make_request("set_next_weave", weave_name)
	Testify:make_request("load_weave", weave_name)
	Testify:make_request("wait_for_level_to_be_loaded")
end

TestifySnippets.disable_ai = function ()
	TestifySnippets.set_script_data({
		ai_boss_spawning_disabled = true,
		ai_bots_disabled = true,
		ai_champion_spawn_debug = true,
		ai_critter_spawning_disabled = true,
		ai_horde_spawning_disabled = true,
		ai_mini_patrol_disabled = true,
		ai_pacing_disabled = true,
		ai_roaming_patrols_disabled = true,
		ai_roaming_spawning_disabled = true,
		ai_rush_intervention_disabled = true,
		ai_specials_spawning_disabled = true,
		ai_terror_events_disabled = true,
		disable_globadier = true,
		disable_gutter_runner = true,
		disable_pack_master = true,
		disable_plague_sorcerer = true,
		disable_ratling_gunner = true,
		disable_vortex_sorcerer = true,
		disable_warpfire_thrower = true,
	})
end

TestifySnippets.open_hero_view = function ()
	local params = {
		transition = "hero_view_force",
		transition_params = {
			menu_state_name = "overview",
		},
	}

	Testify:make_request("transition_with_fade", params)
	Testify:make_request("wait_for_hero_view")
end

TestifySnippets.open_cosmetics_inventory = function ()
	Testify:make_request("set_hero_window_layout", 4)
	Testify:make_request("wait_for_cosmetics_inventory_window")
end

TestifySnippets.equip_hats = function ()
	local item_grid = Testify:make_request("get_hero_window_cosmetics_inventory_item_grid")
	local content = item_grid._widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for j = 1, columns do
			local name_suffix = "_" .. i .. "_" .. j
			local hotspot_name = "hotspot" .. name_suffix
			local slot_hotspot = content[hotspot_name]
			local reserved = slot_hotspot.reserved
			local unwieldable = slot_hotspot.unwieldable

			if not reserved and not unwieldable then
				local params = {
					value = true,
					hotspot_name = hotspot_name,
				}

				Testify:make_request("set_slot_hotspot_on_right_click", params)
			end
		end
	end
end

TestifySnippets.versus_server_wait_for_full_server = function ()
	Testify:make_request("wait_for_game_mode_state", {
		game_mode = "inn_vs",
		state = "dedicated_server_waiting_for_fully_reserved",
	})
	Testify:make_request("wait_for_game_mode_state", {
		game_mode = "inn_vs",
		state = "dedicated_server_starting_game",
	})
end

TestifySnippets.versus_client_wait_for_full_server = function ()
	Testify:make_request("wait_for_matchmaking_substate", {
		state = "MatchmakingStateReserveLobby",
		substate = "waiting_for_join_message",
	})
	Testify:make_request("wait_for_matchmaking_state", "MatchmakingStateRequestJoinGame")
	Testify:make_request("wait_for_matchmaking_state", "MatchmakingStateJoinGame")
end

TestifySnippets.versus_complete_all_objectives = function ()
	local early_end = false

	Testify:make_request("wait_for_objectives_to_activate")

	local current_main_objective = tonumber(Testify:make_request("get_current_main_objective"))
	local num_main_objectives = tonumber(Testify:make_request("get_num_main_objectives"))

	while current_main_objective and current_main_objective <= num_main_objectives do
		TestifySnippets.versus_complete_next_objective()
		TestifySnippets.wait(1)

		local party_won_early = Testify:make_request("versus_party_won_early")

		if party_won_early then
			return true
		end

		current_main_objective = Testify:make_request("get_current_main_objective")
	end

	return false
end

TestifySnippets.versus_complete_next_objective = function ()
	local objective_type = Testify:make_request("versus_objective_type")
	local num_human_players_in_hero_party = tonumber(Testify:make_request("num_human_players_on_side", "heroes"))

	if num_human_players_in_hero_party == 0 or objective_type == "objective_not_supported" then
		TestifySnippets.wait(1)
		Testify:make_request("versus_complete_objectives")
		TestifySnippets.wait(1)
	elseif objective_type == "objective_volume" or objective_type == "objective_capture_point" then
		local num_players_inside

		if objective_type == "objective_volume" then
			num_players_inside = Testify:make_request("versus_volume_objective_get_num_players_inside")
		else
			num_players_inside = Testify:make_request("versus_capture_point_objective_get_num_players_inside")
		end

		if num_players_inside < 1 then
			local objective_data = Testify:make_request("versus_current_objective_position")
			local boxed_position
			local main_path_pos = objective_data.main_path_position
			local random_pos = objective_data.random_position

			if Vector3.distance(main_path_pos, random_pos) > 10 then
				boxed_position = Vector3Box(random_pos)
			else
				boxed_position = Vector3Box(main_path_pos)
			end

			Testify:make_request("teleport_all_players_to_position", boxed_position)
		end
	elseif objective_type == "objective_interact" then
		local objective_data = Testify:make_request("versus_current_objective_position")
		local boxed_position = Vector3Box(objective_data.position)

		Testify:make_request("teleport_all_players_to_position", boxed_position)
		Testify:make_request("versus_objective_simulate_interaction")
	end
end

return TestifySnippets
