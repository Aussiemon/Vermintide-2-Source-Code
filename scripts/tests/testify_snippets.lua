local TestifySnippets = {
	load_level = function (level_settings)
		Testify:make_request("load_level", level_settings)
		Testify:make_request("wait_for_level_to_be_loaded")
	end
}

TestifySnippets.disable_level_intro_dialogue = function ()
	TestifySnippets.set_script_data({
		disable_level_intro_dialogue = true
	})
end

TestifySnippets.set_player_profile = function (profile_name, career_name)
	Testify:make_request("set_player_profile", {
		profile_name = profile_name,
		career_name = career_name
	})
	Testify:make_request("wait_for_player_to_spawn")
end

TestifySnippets.set_bot_profile = function (profile_name, career_name)
	Testify:make_request("set_bot_profile", {
		profile_name = profile_name,
		career_name = career_name
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
end

TestifySnippets.open_hero_view = function ()
	local params = {
		transition = "hero_view_force",
		transition_params = {
			menu_state_name = "overview"
		}
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
					hotspot_name = hotspot_name
				}

				Testify:make_request("set_slot_hotspot_on_right_click", params)
			end
		end
	end
end

return TestifySnippets
