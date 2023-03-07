require("scripts/utils/debug_hero_templates")

local function save_statistics()
	local backend_manager = Managers.backend
	local stats_interface = backend_manager:get_interface("statistics")

	stats_interface:save()
	backend_manager:commit(true)
end

local function add_items(items, skip_autosave)
	local backend_mirror = Managers.backend._backend_mirror
	local request = {
		FunctionName = "devGrantItems",
		FunctionParameter = {
			items = items
		}
	}

	local function cb(result)
		local items = result.FunctionResult.items
		local item_interface = Managers.backend:get_interface("items")

		for i = 1, #items do
			if skip_autosave and i == #items then
				skip_autosave = nil
			end

			local item = items[i]

			backend_mirror:add_item(item.ItemInstanceId, item, skip_autosave)
		end
	end

	local request_queue = backend_mirror:request_queue()

	request_queue:enqueue(request, cb, false)
end

local settings = {
	{
		description = [[
* Open and close menu using right and left keyboard arrows (no gamepad support yet).
		* Use the same keys to 'open' a category.
		* Use CTRL+up/down/left/right for quick-travel and quick-change.
		* Press "F" to add something as a favorite. Press "F" on a favorite to remove it.
		* Press a key on your numpad on a category to assign that key as a hotkey to flip through the options.]],
		bitmap = "hud_debug_screen_logo",
		setting_name = "Debug menu instructions (press right arrow key to open)",
		category = "Allround useful stuff!",
		bitmap_size = 128
	},
	{
		description = "Takes you straight to the menu. Great to combine with auto_host_level.",
		is_boolean = true,
		setting_name = "skip_splash",
		category = "Allround useful stuff!"
	},
	{
		description = "Skips trailer. Always.",
		is_boolean = true,
		setting_name = "skip_intro_trailer",
		category = "Allround useful stuff!"
	},
	{
		description = "Shows which keys can be used for debug stuff.",
		is_boolean = true,
		setting_name = "debug_key_handler_visible",
		category = "Allround useful stuff!"
	},
	{
		description = "Activates Third Person Mode",
		is_boolean = true,
		setting_name = "third_person_mode",
		category = "Allround useful stuff!"
	},
	{
		description = "Caps the maximum frame time to 0.2 seconds. Really useful when you're debugging.",
		is_boolean = true,
		setting_name = "disable_long_timesteps",
		category = "Allround useful stuff!"
	},
	{
		description = "Allows clients to join an ongoing weave game mode",
		is_boolean = true,
		setting_name = "allow_weave_joining",
		category = "Allround useful stuff!"
	},
	{
		description = "Allows items from different mechanisms to show in the inventory",
		is_boolean = true,
		setting_name = "disable_mechanism_item_filter",
		category = "Allround useful stuff!"
	},
	{
		description = "Disables the network hash check when connecting",
		is_boolean = true,
		setting_name = "ignore_network_hash",
		category = "Allround useful stuff!"
	},
	{
		description = "Disables the engine revision network hash check when connecting",
		is_boolean = true,
		setting_name = "ignore_engine_revision_in_network_hash",
		category = "Allround useful stuff!"
	}
}
settings[11] = {
	setting_name = "teleport player",
	description = "Teleports the player to a portal hub element",
	category = "Allround useful stuff!",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local portals = ConflictUtils.get_teleporter_portals()

		for key, _ in pairs(portals) do
			options[#options + 1] = key
		end
	end,
	func = function (options, index)
		local local_player = Managers.player:local_player()

		if local_player then
			local player_unit = local_player.player_unit

			if Unit.alive(player_unit) then
				local portals = ConflictUtils.get_teleporter_portals()
				local portal_id = options[index]
				local pos = portals[portal_id][1]:unbox()
				local rot = portals[portal_id][2]:unbox()
				local locomotion = ScriptUnit.extension(player_unit, "locomotion_system")
				local world = Managers.world:world("level_world")

				LevelHelper:flow_event(world, "teleport_" .. options[index])
				locomotion:teleport_to(pos, rot)
			end
		end

		print("TELEPORT")
	end
}
settings[12] = {
	setting_name = "teleport player to player",
	description = "Teleports the player to another player.",
	category = "Allround useful stuff!",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local data = {}
		options.data = data
		local players = Managers.player:players()
		local local_player = Managers.player:local_player()

		for _, player in pairs(players) do
			if player ~= local_player then
				options[#options + 1] = player:name()
				data[#data + 1] = player
			end
		end
	end,
	func = function (options, index)
		local local_player = Managers.player:local_player()
		local data = options.data

		if local_player then
			local player_unit = local_player.player_unit

			if not Unit.alive(player_unit) then
				return
			end

			local target_player_unit = data[index].player_unit

			if not Unit.alive(target_player_unit) then
				return
			end

			local player_locomotion_ext = ScriptUnit.extension(player_unit, "locomotion_system")
			local target_locomotion_ext = ScriptUnit.extension(target_player_unit, "locomotion_system")
			local mover = Unit.mover(target_player_unit)
			local pos = Mover.position(mover)
			local rot = target_locomotion_ext:current_rotation()

			player_locomotion_ext:teleport_to(pos, rot)
		end
	end
}
settings[13] = {
	description = "Teleports the bots to the local player.",
	category = "Allround useful stuff!",
	setting_name = "teleport bots to local player",
	func = function ()
		local bots = Managers.player:bots()
		local local_player = Managers.player:local_player()

		if local_player and local_player.player_unit then
			local player_unit = local_player.player_unit
			local player_locomotion_ext = ScriptUnit.extension(player_unit, "locomotion_system")
			local mover = Unit.mover(player_unit)
			local pos = Mover.position(mover)
			local rot = player_locomotion_ext:current_rotation()

			for _, bot in pairs(bots) do
				local locomotion_ext = ScriptUnit.extension(bot.player_unit, "locomotion_system")

				locomotion_ext:teleport_to(pos, rot)
			end
		end
	end
}
settings[14] = {
	description = "Will change the network pong timeout from 15 seconds to 10000 seconds.",
	is_boolean = true,
	setting_name = "network_timeout_really_long",
	category = "Allround useful stuff!"
}
settings[15] = {
	description = "Disables the auto-start of tutorial if it's not completed.",
	is_boolean = true,
	setting_name = "disable_tutorial_at_start",
	category = "Allround useful stuff!"
}
settings[16] = {
	description = "Will disable afk kick",
	is_boolean = true,
	setting_name = "debug_disable_afk_kick",
	category = "Allround useful stuff!"
}
settings[17] = {
	description = "Will enable gift popup debug (use F3 to spawn)",
	is_boolean = true,
	setting_name = "debug_gift_popup",
	category = "Allround useful stuff!"
}
settings[18] = {
	description = "Do not clear the unseen_rewards field",
	is_boolean = true,
	setting_name = "dont_clear_unseen_rewards",
	category = "Allround useful stuff!"
}
settings[19] = {
	description = "Do not show unseen rewards at login",
	is_boolean = true,
	setting_name = "dont_show_unseen_rewards",
	category = "Allround useful stuff!"
}
settings[20] = {
	description = "Use LAN instead of Steam",
	is_boolean = true,
	setting_name = "use_lan_backend",
	category = "Allround useful stuff!"
}
settings[21] = {
	description = "When resetting saves, give all items",
	is_boolean = true,
	setting_name = "give_all_lan_backend_items",
	category = "Allround useful stuff!"
}
settings[22] = {
	description = "In the shop, write the master list key on each item icon",
	is_boolean = true,
	setting_name = "show_shop_item_keys",
	category = "Allround useful stuff!"
}
settings[23] = {
	description = "hide version info hud",
	is_boolean = true,
	setting_name = "hide_version_info",
	category = "Allround useful stuff!"
}
settings[24] = {
	description = "hide fps counter hud",
	is_boolean = true,
	setting_name = "hide_fps",
	category = "Allround useful stuff!"
}
settings[25] = {
	description = "Will change all true booleans to false, and if there are no true ones, then all will be set to nil (cleared). Press right arrow to do it!",
	category = "Allround useful stuff!",
	setting_name = "reset_settings",
	func = function ()
		DebugScreen.reset_settings()
	end
}
settings[26] = {
	description = "Requires restart. Gives you all items of a certain rarity",
	setting_name = "all_items_of_rarity",
	category = "Allround useful stuff!",
	item_source = {
		common = true,
		plentiful = true,
		rare = true,
		exotic = true
	}
}
settings[27] = {
	description = "Disable popup warning when trying to exit the game",
	is_boolean = true,
	setting_name = "disable_exit_popup_warning",
	category = "Allround useful stuff!"
}
settings[28] = {
	description = "Sets the fadeout time to zero when exiting the game",
	is_boolean = true,
	setting_name = "zero_exit_time",
	category = "Allround useful stuff!"
}
settings[29] = {
	setting_name = "load_level",
	description = "Loads the selected level.",
	category = "Allround useful stuff!",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)
		table.keys(LevelSettings, options)
		table.sort(options, function (a, b)
			local settings_a = LevelSettings[a]
			local settings_b = LevelSettings[b]
			local act_a_index = table.find(GameActsOrder, settings_a.act) or math.huge
			local act_b_index = table.find(GameActsOrder, settings_b.act) or math.huge

			if act_a_index < act_b_index then
				return true
			elseif act_a_index == act_b_index then
				local act_presentation_order_a = settings_a.act_presentation_order
				local act_presentation_order_b = settings_b.act_presentation_order

				if act_presentation_order_a or act_presentation_order_b then
					return (act_presentation_order_a or math.huge) < (act_presentation_order_b or math.huge)
				else
					local debug_sorting_a = settings_a.map_settings and settings_a.map_settings.sorting
					local debug_sorting_b = settings_b.map_settings and settings_b.map_settings.sorting

					if debug_sorting_a or debug_sorting_b then
						return (debug_sorting_a or math.huge) < (debug_sorting_b or math.huge)
					else
						return a < b
					end
				end
			else
				return false
			end
		end)

		for i = #options, 1, -1 do
			local level_name = options[i]
			local level_settings = LevelSettings[level_name]
			local variations = level_settings.environment_variations

			if variations then
				for variation_id = #variations, 1, -1 do
					local combined_name = level_name .. "_" .. variations[variation_id]

					table.insert(options, i + 1, combined_name)

					options[combined_name] = {
						level_name,
						variation_id
					}
				end
			end
		end
	end,
	func = function (options, index)
		local level_name = options[index]
		local environment_id = 0
		local combined_name = options[level_name]

		if combined_name then
			level_name = combined_name[1]
			environment_id = combined_name[2]
		end

		local level_settings = LevelSettings[level_name]

		if level_settings.hub_level then
			Managers.mechanism:override_hub_level(level_name)
		end

		Debug.load_level(level_name, environment_id, level_settings.debug_environment_level_flow_event)
	end
}
settings[30] = {
	description = "Converts all IRC messages to a random vote",
	is_boolean = true,
	setting_name = "twitch_randomize_votes",
	category = "Twitch"
}
settings[31] = {
	description = "Allow multiple votes from the same user",
	is_boolean = true,
	setting_name = "twitch_allow_multiple_votes",
	category = "Twitch"
}
settings[32] = {
	description = "Disables the effect of the Twitch vote",
	is_boolean = true,
	setting_name = "twitch_disable_result",
	category = "Twitch"
}
settings[33] = {
	description = "Activates twitch game mode and randomized twich votes without connected to stream",
	setting_name = "twitch_debug_voting",
	category = "Twitch",
	is_boolean = true,
	func = function ()
		Managers.twitch:debug_activate_twitch_game_mode()
	end
}
settings[34] = {
	description = "Display your current matchmaking settings on the screen for easier testing/debug",
	is_boolean = true,
	setting_name = "debug_weave_matchmaking",
	category = "Weave Matchmaking"
}
settings[35] = {
	description = "",
	setting_name = "Default development settings",
	category = "Presets",
	preset = {
		skippable_cutscenes = true,
		disable_long_timesteps = true,
		disable_mechanism_item_filter = false,
		use_lan_backend = true,
		network_timeout_really_long = true,
		skip_splash = true
	}
}
settings[36] = {
	description = "",
	setting_name = "Make player imba kthx",
	category = "Presets",
	preset = {
		ledge_hanging_turned_off = true,
		player_mechanics_goodness_debug = true,
		infinite_ammo = true,
		disable_gamemode_end = true,
		disable_fatigue_system = true,
		player_invincible = true,
		use_super_jumps = true
	}
}
settings[37] = {
	description = "",
	setting_name = "Disable all specials",
	category = "Presets",
	preset = {
		disable_tentacle_sorcerer = true,
		disable_ratling_gunner = true,
		disable_warpfire_thrower = true,
		disable_gutter_runner = true,
		disable_vortex_sorcerer = true,
		disable_pack_master = true,
		disable_plague_sorcerer = true,
		disable_globadier = true
	}
}
settings[38] = {
	description = "",
	setting_name = "Enable all specials",
	category = "Presets",
	preset = {
		disable_tentacle_sorcerer = false,
		disable_ratling_gunner = false,
		disable_warpfire_thrower = false,
		disable_gutter_runner = false,
		disable_vortex_sorcerer = false,
		disable_pack_master = false,
		disable_plague_sorcerer = false,
		disable_globadier = false
	}
}
settings[39] = {
	description = "",
	setting_name = "No bots or AI spawn",
	category = "Presets",
	preset = {
		ai_mini_patrol_disabled = true,
		ai_critter_spawning_disabled = true,
		ai_horde_spawning_disabled = true,
		ai_roaming_spawning_disabled = true,
		ai_boss_spawning_disabled = true,
		ai_rush_intervention_disabled = true,
		ai_terror_events_disabled = true,
		ai_bots_disabled = true,
		ai_specials_spawning_disabled = true,
		ai_pacing_disabled = true,
		ai_speed_run_intervention_disabled = true
	}
}
settings[40] = {
	description = "",
	setting_name = "Bots or AI can spawn",
	category = "Presets",
	preset = {
		ai_mini_patrol_disabled = false,
		ai_critter_spawning_disabled = false,
		ai_horde_spawning_disabled = false,
		ai_roaming_spawning_disabled = false,
		ai_boss_spawning_disabled = false,
		ai_rush_intervention_disabled = false,
		ai_terror_events_disabled = false,
		ai_bots_disabled = false,
		ai_specials_spawning_disabled = false,
		ai_pacing_disabled = false,
		ai_speed_run_intervention_disabled = false
	}
}
settings[41] = {
	description = "",
	setting_name = "Main Path Boss Debug",
	category = "Presets",
	preset = {
		ai_mini_patrol_disabled = true,
		ai_critter_spawning_disabled = true,
		ai_horde_spawning_disabled = true,
		ai_roaming_spawning_disabled = true,
		ai_boss_spawning_disabled = false,
		debug_ai_recycler = true,
		debug_ai_pacing = true,
		ai_terror_events_disabled = true,
		debug_player_intensity = true,
		ai_bots_disabled = true,
		ai_specials_spawning_disabled = true,
		ai_pacing_disabled = false,
		ai_rush_intervention_disabled = true,
		ai_speed_run_intervention_disabled = true
	}
}
settings[42] = {
	description = "",
	setting_name = "QA - General stuff",
	category = "Presets",
	preset = {
		debug_player_position = true,
		paste_revision_to_clipboard = true
	}
}
settings[43] = {
	description = "",
	setting_name = "QA-Network/join/sync/matchmaking",
	category = "Presets",
	preset = {
		network_log_messages = true,
		network_debug = true,
		debug_interactions = true,
		package_debug = true,
		matchmaking_debug = true,
		network_debug_connections = true
	}
}
settings[44] = {
	description = "",
	setting_name = "QA - Player debug",
	category = "Presets",
	preset = {
		debug_interactions = true,
		debug_player_animations = true,
		debug_state_machines = true
	}
}
settings[45] = {
	description = "",
	setting_name = "Screenshot mode",
	category = "Presets",
	preset = {
		disable_info_slate_ui = true,
		disable_debug_draw = true,
		disable_tutorial_ui = true,
		bone_lod_disable = true,
		hide_version_info = true,
		hide_fps = true
	}
}
settings[46] = {
	description = "",
	setting_name = "Screenshot mode - no hud",
	category = "Presets",
	preset = {
		disable_debug_draw = true,
		disable_info_slate_ui = true,
		disable_loading_icon = true,
		hide_version_info = true,
		disable_ui = true,
		disable_water_mark = true,
		bone_lod_disable = true,
		disable_outlines = true,
		disable_tutorial_ui = true,
		hide_fps = true
	}
}
settings[47] = {
	description = "",
	setting_name = "Disable screenshot mode",
	category = "Presets",
	preset = {
		disable_debug_draw = false,
		disable_info_slate_ui = false,
		disable_loading_icon = false,
		hide_version_info = false,
		disable_ui = false,
		disable_water_mark = false,
		bone_lod_disable = false,
		disable_outlines = false,
		disable_tutorial_ui = false,
		hide_fps = false
	}
}
settings[48] = {
	description = "ctrl+F to cycle between graphs, ctrl+G to use special function in graph. (respawn level atm)",
	setting_name = "Show Graphs",
	category = "Presets",
	preset = {
		debug_player_intensity = true,
		debug_ai_pacing = true,
		ai_pacing_disabled = false
	}
}
settings[49] = {
	description = "This is used to turn off screen effects affecting the main character in case the camera is changed into a 3rd person view.",
	setting_name = "Replay Settings",
	category = "Presets",
	preset = {
		screen_space_player_camera_reactions = false,
		fade_on_camera_ai_collision = false
	}
}
settings[50] = {
	description = "This is used to restore settings after working with replays.",
	setting_name = "Non-Replay Settings",
	category = "Presets",
	preset = {
		screen_space_player_camera_reactions = true,
		fade_on_camera_ai_collision = true
	}
}
settings[51] = {
	description = "Make the player unkillable.",
	is_boolean = true,
	setting_name = "player_invincible",
	category = "Player mechanics recommended"
}
settings[52] = {
	description = "Everything dies instantly when it receives damage",
	is_boolean = true,
	setting_name = "insta_death",
	category = "Player mechanics recommended"
}
settings[53] = {
	description = "Toggles player invisibility for local player.",
	setting_name = "toggle_player_invisibility",
	category = "Player mechanics recommended",
	func = function ()
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local player_unit = local_player and local_player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local invisibility = not status_extension:is_invisible()

			status_extension:set_invisible(invisibility)

			local debug_text = invisibility and "Local player is now invisible" or "Local player is now visible"

			Debug.sticky_text(debug_text)
		end
	end
}
settings[54] = {
	description = [[
Features that make player mechanics nicer to work with.
 * Enables increasing/decreasing the player run speed via ALT+MouseScroll.
 * Allows you to press 'B' to take debug damage.
 * Kill yourself on 'CTRL' + 'V'
 * Revive yourself on 'CTRL' + 'B'
 * (requests go here...)]],
	is_boolean = true,
	setting_name = "player_mechanics_goodness_debug",
	category = "Player mechanics recommended"
}
settings[55] = {
	description = "Increases jump height and allows you to jump multiple times whilst in the air.",
	is_boolean = true,
	setting_name = "use_super_jumps",
	category = "Player mechanics recommended"
}
settings[56] = {
	description = "Sets the profile you would like to start the game with.",
	setting_name = "wanted_profile",
	category = "Player mechanics recommended",
	item_source = {
		witch_hunter = true,
		empire_soldier = true,
		dwarf_ranger = true,
		wood_elf = true,
		bright_wizard = true
	}
}
settings[57] = {
	description = "Sets the career index you would like to start the game with.",
	setting_name = "wanted_career_index",
	category = "Player mechanics recommended",
	item_source = {
		1,
		2,
		3,
		4
	}
}
settings[58] = {
	setting_name = "switch_class",
	description = "Switch player class to play",
	category = "Player mechanics recommended",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local data = {}
		options.data = data
		local player = Managers.player:local_player()
		local peer_id = player:network_id()
		local local_player_id = player:local_player_id()
		local party_manager = Managers.party
		local party = party_manager:get_party_from_player_id(peer_id, local_player_id)
		local side = Managers.state.side.side_by_party[party]
		local available_profiles = side.available_profiles
		available_profiles = available_profiles or PROFILES_BY_AFFILIATION.heroes

		for k = 1, #available_profiles do
			local profile_name = available_profiles[k]
			local index = #options + 1
			options[index] = profile_name
			data[index] = profile_name
		end
	end,
	func = function (options, index)
		local profile_name = options.data[index]

		if profile_name then
			local profile_index = FindProfileIndex(profile_name)
			local careers = SPProfiles[profile_index].careers
			local career = careers[script_data.wanted_career_index] or careers[1]
			local force_respawn = true

			Managers.state.network:request_profile(1, profile_name, career.display_name, force_respawn)
		end
	end
}
settings[59] = {
	setting_name = "switch_party",
	description = "Switch party you you want to spawn in. Note: you need to 'switch_class' for it to be fulfilled",
	category = "Player mechanics recommended",
	item_source = {},
	load_items_source_func = function (options)
		local party_manager = Managers.party
		local parties = party_manager:parties()

		table.clear(options)

		local data = {}
		options.data = data

		for k, party in ipairs(parties) do
			local index = #options + 1
			local num_used_slots = party.num_used_slots - party.num_bots

			if num_used_slots < party.num_slots then
				options[index] = string.format("%s (%d/%d)", party.party_id, num_used_slots, party.num_slots)
			else
				options[index] = string.format("%s (%d/%d) FULL!", party.party_id, num_used_slots, party.num_slots)
			end

			data[index] = party.party_id
		end
	end,
	func = function (options, index)
		local party_id = options.data[index]

		if party_id then
			local party = Managers.party:get_party(party_id)

			if party.num_open_slots + party.num_bots > 0 then
				print("Debug switching wanted party to:", party_id)

				local player = Managers.player:local_player()
				local local_player_id = player:local_player_id()
				local peer_id = player:network_id()
				local mechanism_name = Managers.mechanism:current_mechanism_name()
				local side = Managers.state.side.side_by_party[party]

				Managers.party:request_join_party(peer_id, local_player_id, party_id)

				if player and player:needs_despawn() then
					Managers.state.spawn:delayed_despawn(player)
				end

				local available_profiles = side.available_profiles or PROFILES_BY_AFFILIATION.heroes

				if available_profiles then
					for k = 1, #available_profiles do
						local profile_name = available_profiles[k]

						if profile_name then
							local profile_index = FindProfileIndex(profile_name)
							local career_index = 1
							local career_name = SPProfiles[profile_index].careers[career_index].display_name

							if Managers.mechanism:profile_available(profile_name, career_name) then
								local force_respawn = true

								Managers.state.network:request_profile(1, profile_name, career_name, force_respawn)

								local camera_system = Managers.state.entity:system("camera_system")
								local player = Managers.player:local_player()

								camera_system:initialize_camera_states(player, profile_index, career_index)

								break
							end
						end
					end
				end

				local sides = Managers.state.side:sides()
				local object_set_name, enable = nil

				for i = 1, #sides do
					local current_side = sides[i]
					object_set_name = string.format("%s_%s", mechanism_name, current_side:name())
					enable = current_side == side

					Managers.state.game_mode:set_object_set_enabled(object_set_name, enable)
				end
			end
		end
	end
}
settings[60] = {
	setting_name = "wanted_party",
	description = "automatically puts you in selected party on join",
	category = "Player mechanics",
	item_source = {},
	load_items_source_func = function (options)
		local party_manager = Managers.party
		local parties = party_manager:parties()

		table.clear(options)

		options[#options + 1] = "none"

		for i = 1, #parties do
			local party = parties[i]
			options[#options + 1] = party.party_id
		end
	end,
	func = function (options, index)
		local party_tag = options[index]

		if party_tag then
			-- Nothing
		end
	end
}
settings[61] = {
	setting_name = "switch_ai_debug_spawning_party",
	description = "Switch what party you want debugging spawning (P) AI units to belong to",
	category = "Player mechanics recommended",
	item_source = {},
	load_items_source_func = function (options)
		local side_manager = Managers.state.side
		local sides = side_manager:sides()

		table.clear(options)

		for k, side in pairs(sides) do
			local index = #options + 1
			options[index] = side.side_id
		end
	end,
	func = function (options, index)
		local side_id = options[index]

		if side_id then
			Managers.state.conflict:set_debug_spawn_side(side_id)
		end
	end
}
settings[62] = {
	description = "Show the units currently equipped in left/right hand.",
	is_boolean = true,
	setting_name = "show_equipped_weapon_units",
	category = "Player mechanics"
}
settings[63] = {
	description = "For enabling melee weapon debugging.",
	is_boolean = true,
	setting_name = "debug_weapons",
	category = "Player mechanics"
}
settings[64] = {
	description = "The enemy that got target will always get hit",
	is_boolean = true,
	setting_name = "debug_weapons_always_hit_target",
	category = "Player mechanics"
}
settings[65] = {
	description = "Damage debugging.",
	is_boolean = true,
	setting_name = "damage_debug",
	category = "Player mechanics"
}
settings[66] = {
	description = "Enables ground targetting.",
	is_boolean = true,
	setting_name = "debug_ground_target",
	category = "Player mechanics"
}
settings[67] = {
	description = "Logs a ton of stuff, and adds a debug arrow to the knee... err.. screen.",
	is_boolean = true,
	setting_name = "camera_debug",
	category = "Player mechanics"
}
settings[68] = {
	description = "Shows area of active AreaDamageExtensions",
	is_boolean = true,
	setting_name = "debug_area_damage",
	category = "Player mechanics"
}
settings[69] = {
	description = "Enable state logging for all state machines",
	is_boolean = true,
	setting_name = "debug_state_machines",
	category = "Player mechanics"
}
settings[70] = {
	description = "Enable interactor/interactable debugging.",
	is_boolean = true,
	setting_name = "debug_interactions",
	category = "Player mechanics"
}
settings[71] = {
	description = "Disables the nice movement by Markus, Peder and Platt.",
	is_boolean = true,
	setting_name = "disable_nice_movement",
	category = "Player mechanics"
}
settings[72] = {
	description = "Disables the aim lead/rig motion",
	is_boolean = true,
	setting_name = "disable_aim_lead_rig_motion",
	category = "Player mechanics"
}
settings[73] = {
	description = "Shows debug spheres for the first rig motion",
	is_boolean = true,
	setting_name = "debug_rig_motion",
	category = "Player mechanics"
}
settings[74] = {
	description = "When enabled you will no longer get fatigued.",
	is_boolean = true,
	setting_name = "disable_fatigue_system",
	category = "Player mechanics"
}
settings[75] = {
	description = "Can always reload.",
	is_boolean = true,
	setting_name = "infinite_ammo",
	category = "Player mechanics"
}
settings[76] = {
	description = "Activated ability cooldowns set to 5 seconds",
	is_boolean = true,
	setting_name = "short_ability_cooldowns",
	category = "Player mechanics"
}
settings[77] = {
	description = "Unlock all talent points - Requires Restart",
	is_boolean = true,
	setting_name = "debug_unlock_talents",
	category = "Player mechanics"
}
settings[78] = {
	description = "Resets all talents for the current career. Needs to be done outside of a menu to take effect",
	category = "Player mechanics",
	setting_name = "reset_career_talents",
	func = function ()
		local backend_manager = Managers.backend
		local player = Managers.player:local_player()
		local career_name = player:career_name()

		backend_manager:get_interface("talents"):set_talents(career_name, {
			0,
			0,
			0,
			0,
			0
		})
		backend_manager:commit(true)
	end
}
settings[79] = {
	description = "Enable hero stats in inventory",
	is_boolean = true,
	setting_name = "hero_statistics",
	category = "Player mechanics"
}
settings[80] = {
	description = "Enable Animation Logging In The Console For The First Person Local Player.",
	is_boolean = true,
	setting_name = "debug_player_animations",
	category = "Player mechanics"
}
settings[81] = {
	description = "Enable \"legendary\" traits for all weapons, and adds some debug prints/draws",
	is_boolean = true,
	setting_name = "debug_legendary_traits",
	category = "Player mechanics"
}
settings[82] = {
	description = "Show damage numbers above enemies heads. - Requires restart of level",
	is_boolean = true,
	setting_name = "debug_show_damage_numbers",
	category = "Player mechanics"
}
settings[83] = {
	description = "Enable Animation Logging In The Console For The Local Player.",
	is_boolean = true,
	setting_name = "debug_first_person_player_animations",
	category = "Player mechanics"
}
settings[84] = {
	description = "Visualize ledges",
	is_boolean = true,
	setting_name = "visualize_ledges",
	category = "Player mechanics"
}
settings[85] = {
	description = "Enable Buff Debug Information",
	is_boolean = true,
	setting_name = "buff_debug",
	category = "Player mechanics"
}
settings[86] = {
	description = "Disable Buff system optimization",
	is_boolean = true,
	setting_name = "buff_no_opt",
	category = "Player mechanics"
}
settings[87] = {
	description = "Adds any buff in the game to player.",
	setting_name = "Add Buff",
	category = "Player mechanics",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local buff_templates = BuffTemplates

		for key, item in pairs(buff_templates) do
			if item.buffs and item.buffs[1] and not item.buffs[1].dormant then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local key = options[index]
		local player_manager = Managers.player
		local player = player_manager:local_player()
		local unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")
		local server_controlled = false

		buff_system:add_buff(unit, key, unit, server_controlled)
	end
}
settings[88] = {
	description = "Enable OverCharge Debug Information",
	is_boolean = true,
	setting_name = "overcharge_debug",
	category = "Player mechanics"
}
settings[89] = {
	description = "Enable OverCharge Debug Information",
	is_boolean = true,
	setting_name = "disable_overcharge",
	category = "Player mechanics"
}
settings[90] = {
	description = "Enable Energy Debug Information",
	is_boolean = true,
	setting_name = "energy_debug",
	category = "Player mechanics"
}
settings[91] = {
	description = "Disables Energy loss",
	is_boolean = true,
	setting_name = "disable_energy",
	category = "Player mechanics"
}
settings[92] = {
	description = "Makes it so you cant fall and hang from ledges.",
	is_boolean = true,
	setting_name = "ledge_hanging_turned_off",
	category = "Player mechanics"
}
settings[93] = {
	description = "Visualizes hang ledges positioning and rotation",
	is_boolean = true,
	setting_name = "debug_hang_ledges",
	category = "Player mechanics"
}
settings[94] = {
	description = "Makes it so you dont die when you hang from ledge and fall.",
	is_boolean = true,
	setting_name = "ledge_hanging_fall_and_die_turned_off",
	category = "Player mechanics"
}
settings[95] = {
	description = "Tutorial stuffs",
	is_boolean = true,
	setting_name = "tutorial_disabled",
	category = "Player mechanics"
}
settings[96] = {
	description = "Tutorial stuffs",
	is_boolean = true,
	setting_name = "tutorial_debug",
	category = "Player mechanics"
}
settings[97] = {
	description = "Debug statistics stuff",
	is_boolean = true,
	setting_name = "statistics_debug",
	category = "Player mechanics"
}
settings[98] = {
	description = "Debug achievements/trophies",
	is_boolean = true,
	setting_name = "achievement_debug",
	category = "Player mechanics"
}
settings[99] = {
	description = "Use debug platform for achievements",
	is_boolean = true,
	setting_name = "achievement_debug_platform",
	category = "Player mechanics"
}
settings[100] = {
	description = "RESETS all achievements/trophies",
	category = "Player mechanics",
	setting_name = "achievement_reset",
	func = function ()
		Managers.state.achievement:reset()
	end
}
settings[101] = {
	description = "Debug in game challenges",
	is_boolean = true,
	setting_name = "debug_in_game_challenges",
	category = "Player mechanics"
}
settings[102] = {
	description = "Debug info for missions",
	is_boolean = true,
	setting_name = "debug_mission_system",
	category = "Player mechanics"
}
settings[103] = {
	description = "Show the player's position on the screen",
	is_boolean = true,
	setting_name = "debug_player_position",
	category = "Player mechanics"
}
settings[104] = {
	description = "Never causes critical strikes",
	is_boolean = true,
	setting_name = "no_critical_strikes",
	category = "Player mechanics"
}
settings[105] = {
	description = "Always causes critical strikes",
	is_boolean = true,
	setting_name = "always_critical_strikes",
	category = "Player mechanics"
}
settings[106] = {
	description = "Causes a critical strike every second attack",
	is_boolean = true,
	setting_name = "alternating_critical_strikes",
	category = "Player mechanics"
}
settings[107] = {
	description = "Draws debug lines to show your blocking arcs",
	is_boolean = true,
	setting_name = "debug_draw_block_arcs",
	category = "Player mechanics"
}
settings[108] = {
	description = "Draws debug lines to show your pushing arcs",
	is_boolean = true,
	setting_name = "debug_draw_push_arcs",
	category = "Player mechanics"
}
settings[109] = {
	description = "Sets a static power level, ignoring actual career and equipment power",
	category = "Player mechanics",
	setting_name = "power_level_override",
	item_source = {
		200,
		225,
		250,
		275,
		300,
		325,
		350,
		375,
		400,
		425,
		450,
		475,
		500,
		525,
		550,
		575,
		600,
		625,
		650,
		675,
		700,
		725,
		750,
		775,
		800,
		825,
		850,
		875,
		900,
		925,
		950,
		975,
		1000,
		1200,
		1400,
		1600
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end
}
settings[110] = {
	description = "Sets the power level of the damage dealt when triggering debug damage.",
	category = "Player mechanics",
	setting_name = "debug_damage_power_level",
	item_source = {
		100,
		200,
		225,
		250,
		275,
		300,
		325,
		350,
		375,
		400,
		425,
		450,
		475,
		500,
		525,
		550,
		575,
		600,
		625,
		650,
		675,
		700,
		725,
		750,
		775,
		800
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end
}
settings[111] = {
	description = "Show player health",
	is_boolean = true,
	setting_name = "show_player_health",
	category = "Player mechanics"
}
settings[112] = {
	description = "Show player ammo",
	is_boolean = true,
	setting_name = "show_player_ammo",
	category = "Player mechanics"
}
settings[113] = {
	description = "Enables players and bots to respawn quickly at respawn points",
	is_boolean = true,
	setting_name = "fast_respawns",
	category = "Player mechanics"
}
settings[114] = {
	description = "Disables triggering weapon animations for third person. Useful for testing new weapons. öddfg (to spite Seb)",
	is_boolean = true,
	setting_name = "disable_third_person_weapon_animation_events",
	category = "Player mechanics"
}
settings[115] = {
	description = "Draw some helpful lines for player leaps",
	is_boolean = true,
	setting_name = "debug_draw_player_leap",
	category = "Player mechanics"
}
settings[116] = {
	description = "Stops Manny from cheating in playtests. Hopefully.",
	is_boolean = true,
	setting_name = "disable_time_travel",
	category = "Player mechanics"
}
settings[117] = {
	description = "Disables external velocity influences (Knockback from punches or enemies pushing the player)",
	is_boolean = true,
	setting_name = "disable_external_velocity",
	category = "Player mechanics"
}
settings[118] = {
	description = "Disables catapulting players (Ratogre has a attack that catapults the player for example)",
	is_boolean = true,
	setting_name = "disable_catapulting",
	category = "Player mechanics"
}
settings[119] = {
	description = "Will show debug lines for projectiles when true",
	is_boolean = true,
	setting_name = "debug_projectiles",
	category = "Weapons"
}
settings[120] = {
	description = "Will show debug lines for projectiles when true",
	is_boolean = true,
	setting_name = "debug_light_weight_projectiles",
	category = "Weapons"
}
settings[121] = {
	description = "Writes into the console whenever a new action starts or finishes",
	is_boolean = true,
	setting_name = "log_actions",
	category = "Weapons"
}
settings[122] = {
	description = "Add/remove test attachments",
	is_boolean = true,
	setting_name = "attachment_debug",
	category = "Attachments"
}
settings[123] = {
	description = "Turns on chieftain spawn debug",
	is_boolean = true,
	setting_name = "ai_champion_spawn_debug",
	category = "AI recommended"
}
settings[124] = {
	description = "Disables AI spawning due to pacing.",
	is_boolean = true,
	setting_name = "ai_pacing_disabled",
	category = "AI recommended"
}
settings[125] = {
	description = "Disables AI rush intervention (specials & hordes)",
	is_boolean = true,
	setting_name = "ai_rush_intervention_disabled",
	category = "AI recommended"
}
settings[126] = {
	description = "Disables AI speed run intervention(specials and small hordes)",
	is_boolean = true,
	setting_name = "ai_speed_run_intervention_disabled",
	category = "AI recommended"
}
settings[127] = {
	description = "Disables AI roam spawning.",
	is_boolean = true,
	setting_name = "ai_roaming_spawning_disabled",
	category = "AI recommended"
}
settings[128] = {
	description = "Disables AI roaming patrols spawning. (there will only be normal packs)",
	is_boolean = true,
	setting_name = "ai_roaming_patrols_disabled",
	category = "AI recommended"
}
settings[129] = {
	description = "Disables boss/rare event spawning.",
	is_boolean = true,
	setting_name = "ai_boss_spawning_disabled",
	category = "AI recommended"
}
settings[130] = {
	description = "Disables specials spawning",
	is_boolean = true,
	setting_name = "ai_specials_spawning_disabled",
	category = "AI recommended"
}
settings[131] = {
	description = "Disables critter spawning",
	is_boolean = true,
	setting_name = "ai_critter_spawning_disabled",
	category = "AI recommended"
}
settings[132] = {
	description = "Disables AI terror events spawning",
	is_boolean = true,
	setting_name = "ai_terror_events_disabled",
	category = "AI recommended"
}
settings[133] = {
	description = "Disables gutter runners from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_gutter_runner",
	category = "AI recommended"
}
settings[134] = {
	description = "Disables globadiers from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_globadier",
	category = "AI recommended"
}
settings[135] = {
	description = "Disables pack masters from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_pack_master",
	category = "AI recommended"
}
settings[136] = {
	description = "Disables ratling gunners from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_ratling_gunner",
	category = "AI recommended"
}
settings[137] = {
	description = "Disables warpfire throwers from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_warpfire_thrower",
	category = "AI recommended"
}
settings[138] = {
	description = "Disables vortex sorcerers from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_vortex_sorcerer",
	category = "AI recommended"
}
settings[139] = {
	description = "Disables plague sorcerers from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_plague_sorcerer",
	category = "AI recommended"
}
settings[140] = {
	description = "Disables tentacle sorcerers from spawning (requires restart!!!)",
	is_boolean = true,
	setting_name = "disable_tentacle_sorcerer",
	category = "AI recommended"
}
settings[141] = {
	description = "Disables hordes spawning",
	is_boolean = true,
	setting_name = "ai_horde_spawning_disabled",
	category = "AI recommended"
}
settings[142] = {
	description = "When pressing 'h for a debug horde, set what kind of horde will spawn, instead of a random variant",
	setting_name = "ai_set_horde_type_debug",
	category = "AI recommended",
	item_source = {
		vector_blob = "vector_blob",
		vector = "vector",
		ambush = "ambush",
		random = "random"
	}
}
settings[143] = {
	description = "Disables mini patrols from spawning",
	is_boolean = true,
	setting_name = "ai_mini_patrol_disabled",
	category = "AI recommended"
}
settings[144] = {
	setting_name = "debug spawn mini patrol",
	description = "Spawns a mini patrol right now",
	category = "AI",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for k, setting in pairs(HordeSettings) do
			options[#options + 1] = setting.mini_patrol_composition
		end
	end,
	func = function (options, index)
		local composition = options[index]

		if composition then
			print("Debug spawning mini patrol of composition:", composition)

			local group_template = {
				size = 0,
				template = "mini_patrol",
				id = Managers.state.entity:system("ai_group_system"):generate_group_id()
			}
			local t = Managers.time:time("game")
			local side_id = nil

			Managers.state.conflict:mini_patrol(t, nil, side_id, composition, group_template)
		end
	end
}
settings[145] = {
	description = "Enemy ragdolls are despawned immediately.",
	is_boolean = true,
	setting_name = "disable_ragdolls",
	category = "AI"
}
settings[146] = {
	description = "Players deal no direct damage to enemies.",
	is_boolean = true,
	setting_name = "players_deal_no_damage",
	category = "AI"
}
settings[147] = {
	description = "Enables horde logging in console",
	is_boolean = true,
	setting_name = "ai_horde_logging",
	category = "AI recommended"
}
settings[148] = {
	description = "Presents current amount of alive breeds on screen.",
	is_boolean = true,
	setting_name = "show_alive_ai",
	category = "AI recommended"
}
settings[149] = {
	description = "Writes out max-health / current health above ai units",
	is_boolean = true,
	setting_name = "show_ai_health",
	category = "AI recommended"
}
settings[150] = {
	description = "Writes out from what BreedPack the unit was picked. What zone he spawned in. If he was replaced.",
	is_boolean = true,
	setting_name = "show_ai_spawn_info",
	category = "AI recommended"
}
settings[151] = {
	description = "Draws a spinning line abouve each pickup in game",
	is_boolean = true,
	setting_name = "show_spawned_pickups",
	category = "AI recommended"
}
settings[152] = {
	description = "Collects the data needed for drawing pickup spawners and spawn sections. Restart required.",
	is_boolean = true,
	setting_name = "debug_pickup_spawners",
	category = "Pickup Spawners"
}
settings[153] = {
	description = "The debug_pickup_spawners option must be set to true when using this feature",
	category = "Pickup Spawners",
	setting_name = "Toggle Pickup Spawners Draw Mode",
	func = function ()
		Managers.state.entity:system("pickup_system"):debug_draw_spread_pickups()
	end
}
settings[154] = {
	description = "Draws lines up in the sky where each ai is",
	is_boolean = true,
	setting_name = "show_where_ai_is",
	category = "AI recommended"
}
settings[155] = {
	description = "Draws lines up in the sky where each inactive ai is",
	is_boolean = true,
	setting_name = "show_where_inactive_ai_is",
	category = "AI recommended"
}
settings[156] = {
	description = "turns on animation debug on your current ai debug target.",
	is_boolean = true,
	setting_name = "anim_debug_ai_debug_target",
	category = "AI recommended"
}
settings[157] = {
	description = "Choose between different conflict director settings.",
	setting_name = "override_conflict_settings",
	category = "Conflict & Pacing",
	item_source = ConflictDirectors
}
settings[158] = {
	description = "Displays current conflict settings on screen.",
	is_boolean = true,
	setting_name = "show_current_conflict_settings",
	category = "Conflict & Pacing"
}
settings[159] = {
	description = "Shows the contained breeds of the current conflict_director.",
	is_boolean = true,
	setting_name = "debug_conflict_director_breeds",
	category = "Conflict & Pacing"
}
settings[160] = {
	description = "Displays current threat value from aggroed enemies, and what systems will delay their spawning.",
	is_boolean = true,
	setting_name = "debug_current_threat_value",
	category = "Conflict & Pacing"
}
settings[161] = {
	description = "Dump lots of debug in the console when constructing the zones & packs. Will draw 1m spheres around units that gets replaced via BreedPacks zone_checks. Each hi/low segment will have the same colored spheres. Units that are not replaced, but counted will have small spheres.",
	is_boolean = true,
	setting_name = "debug_zone_baker",
	category = "Conflict & Pacing"
}
settings[162] = {
	description = "Draws zones on screen, and lots of debug on ground",
	is_boolean = true,
	setting_name = "debug_zone_baker_on_screen",
	category = "Conflict & Pacing"
}
settings[163] = {
	description = "Show all hidden spawners with vertical lines.",
	is_boolean = true,
	setting_name = "show_hidden_spawners",
	category = "Conflict & Pacing"
}
settings[164] = {
	description = "Shows clustering, loneliness, crumbs...",
	is_boolean = true,
	setting_name = "debug_player_positioning",
	category = "Conflict & Pacing"
}
settings[165] = {
	description = "Shows rushing player...",
	is_boolean = true,
	setting_name = "debug_rush_intervention",
	category = "Conflict & Pacing"
}
settings[166] = {
	description = "Handles speedrunners by spawning specials or small hordes ahead of players, activate this to see its states",
	is_boolean = true,
	setting_name = "debug_speed_running_intervention",
	category = "Conflict & Pacing"
}
settings[167] = {
	description = "Show data for pacing of the game",
	is_boolean = true,
	setting_name = "debug_ai_pacing",
	category = "Conflict & Pacing"
}
settings[168] = {
	description = "Shows player intensity",
	is_boolean = true,
	setting_name = "debug_player_intensity",
	category = "Conflict & Pacing"
}
settings[169] = {
	description = "debug the peak delayer.",
	is_boolean = true,
	setting_name = "debug_peak_delayer",
	category = "Conflict & Pacing"
}
settings[170] = {
	description = "Show exclamation point icon above heads of alerted skaven",
	is_boolean = true,
	setting_name = "enable_alert_icon",
	category = "AI"
}
settings[171] = {
	description = "Make AI not perceive anyone",
	is_boolean = true,
	setting_name = "disable_ai_perception",
	category = "AI"
}
settings[172] = {
	description = "Check no spawn volumes when spawning specials",
	is_boolean = true,
	setting_name = "check_no_spawn_volumes_for_special_spawning",
	category = "AI"
}
settings[173] = {
	description = "Shows perception for some units",
	is_boolean = true,
	setting_name = "debug_ai_perception",
	category = "AI"
}
settings[174] = {
	description = "Shows attack patterns for enemies. Gray -> has no slot. Lime -> has slot. Red -> is attacking. Orange -> is in attack cooldown. Blue -> is staggered or blocked.",
	is_boolean = true,
	setting_name = "debug_ai_attack_pattern",
	category = "AI"
}
settings[175] = {
	description = "Automagically destroys AI that are at a far enough distance from all the players.",
	is_boolean = true,
	setting_name = "ai_far_off_despawn_disabled",
	category = "AI"
}
settings[176] = {
	description = "Shows the workings of the ai recycler and area sets",
	is_boolean = true,
	setting_name = "debug_ai_recycler",
	category = "AI"
}
settings[177] = {
	description = "Shows frozen breed units",
	is_boolean = true,
	setting_name = "debug_breed_freeze",
	category = "AI"
}
settings[178] = {
	description = "Disables AI freeze optimization",
	is_boolean = true,
	setting_name = "disable_breed_freeze_opt",
	category = "AI"
}
settings[179] = {
	description = "Enemy recycler will spawn rats wile in free-flight",
	is_boolean = true,
	setting_name = "recycler_in_freeflight",
	category = "AI"
}
settings[180] = {
	description = "Shows the active respawns as yellow spheres with distance from start. removed respawns due to crossroads are bluish spheres",
	is_boolean = true,
	setting_name = "debug_player_respawns",
	category = "AI"
}
settings[181] = {
	description = "Horde debugging, shows how it picks spawn points",
	is_boolean = true,
	setting_name = "debug_hordes",
	category = "AI"
}
settings[182] = {
	description = "Mini patrol debugging",
	is_boolean = true,
	setting_name = "debug_mini_patrols",
	category = "AI"
}
settings[183] = {
	description = "Draws patrols routes",
	category = "AI",
	setting_name = "draw_patrol_routes",
	func = function ()
		Managers.state.conflict.level_analysis:draw_patrol_routes()
	end
}
settings[184] = {
	description = "Draws patrol start positions",
	category = "AI",
	setting_name = "draw_patrol_start_positions",
	func = function ()
		Managers.state.conflict.level_analysis:draw_patrol_start_positions()
	end
}
settings[185] = {
	description = "Spawns a boss patrol at the closest spawner, use draw_patrol_start_positions to see spawners",
	category = "AI",
	setting_name = "spawn_patrol_at_closest_spawner",
	func = function ()
		Managers.state.conflict:debug_spawn_spline_patrol_closest_spawner()
	end
}
settings[186] = {
	description = "AI behviour trees text over unit.",
	is_boolean = true,
	setting_name = "debug_behaviour_trees",
	category = "AI"
}
settings[187] = {
	description = "Show debug data for terror events.",
	is_boolean = true,
	setting_name = "debug_terror",
	category = "AI"
}
settings[188] = {
	description = "Change which difficulty terror events will be played at",
	setting_name = "terror_event_difficulty",
	category = "AI",
	item_source = DifficultySettings
}
settings[189] = {
	setting_name = "terror_event_difficulty_tweak",
	category = "AI",
	description = "Change which difficulty tweak terror events will be played at.",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for i = -DifficultyTweak.range, DifficultyTweak.range do
			options[#options + 1] = i
		end

		table.sort(options)

		options[#options + 1] = "[clear value]"
	end
}
settings[190] = {
	description = "Draws a sphere and text at each respawner unit in the level. Must set 'debug_ai_recycler=true'",
	category = "AI",
	setting_name = "debug_spawn_ogre_from_closest_boss_spawner",
	func = function ()
		if script_data.debug_ai_recycler then
			local only_draw = false

			Managers.state.conflict.level_analysis:debug_spawn_boss_from_closest_spawner_to_player(only_draw)
		end
	end
}
settings[191] = {
	description = "Injects all patrols into the main path'",
	category = "AI",
	setting_name = "debug_spawn_all_boss_patrols",
	func = function ()
		print("All boss patrols injected into the main path now")
		Managers.state.conflict.level_analysis:spawn_all_boss_spline_patrols()
	end
}
settings[192] = {
	description = "Injects all bosses into the main path'",
	category = "AI",
	setting_name = "debug_inject_bosses_in_all_boss_spawners",
	func = function ()
		print("All boss enemies are now injected into the main path!")
		Managers.state.conflict.level_analysis:inject_all_bosses_into_main_path()
	end
}
settings[193] = {
	description = "Debug spawns one special through the specials spawning system.",
	category = "AI",
	setting_name = "debug_spawn_special",
	func = function ()
		Managers.state.conflict.specials_pacing:debug_spawn()
	end
}
settings[194] = {
	description = "Enable navigation group debugging.",
	is_boolean = true,
	setting_name = "debug_navigation_group_manager",
	category = "AI"
}
settings[195] = {
	description = "Draws lines between all navigation-groups. Remove lines by pressing 'X'. ",
	category = "AI",
	setting_name = "draw_navigation_group_connections",
	func = function ()
		Managers.state.conflict.navigation_group_manager:draw_group_connections()
	end
}
settings[196] = {
	description = "Enables debugging for spawning packs using perlin noise.",
	is_boolean = true,
	setting_name = "debug_perlin_noise_spawning",
	category = "AI"
}
settings[197] = {
	description = "Visual debugging for movement.",
	setting_name = "debug_ai_movement",
	category = "AI",
	item_source = {
		graphics_only = "graphics_only",
		text_and_graphics = "text_and_graphics"
	}
}
settings[198] = {
	description = "Shows which of nav tag volume layer 20-29 that are enabled.",
	is_boolean = true,
	setting_name = "debug_nav_tag_volume_layers",
	category = "AI"
}
settings[199] = {
	description = "Visual debugging for skeleton for debug_unit.",
	is_boolean = true,
	setting_name = "debug_skeleton",
	category = "AI"
}
settings[200] = {
	description = "Fades out debug_unit.",
	is_boolean = true,
	setting_name = "fade_debug_unit",
	category = "AI"
}
settings[201] = {
	description = "Visual debugging for big boy turning.",
	is_boolean = true,
	setting_name = "debug_big_boy_turning",
	category = "AI"
}
settings[202] = {
	description = "Visual debugging when enemy AI pathfinding fails.",
	is_boolean = true,
	setting_name = "ai_debug_failed_pathing",
	category = "AI"
}
settings[203] = {
	description = "Will hide then node-history list on the left side of the screen, when in the behavior debugger screen. (CTRL+B)",
	is_boolean = true,
	setting_name = "hide_behavior_tree_node_history",
	category = "AI"
}
settings[204] = {
	description = "Displays engine debug for EngineOptimizedExtensions",
	is_boolean = true,
	setting_name = "show_engine_locomotion_debug",
	category = "AI"
}
settings[205] = {
	description = "Policy to use for the enemy package loader (see EnemyPackageLoaderSettings). [NEED TO RESTART GAME]",
	setting_name = "enemy_package_loader_policy",
	category = "AI",
	item_source = {
		console = "console"
	}
}
settings[206] = {
	description = "Shows which dynamic packages that have been loaded or unloaded.",
	is_boolean = true,
	setting_name = "debug_enemy_package_loader",
	category = "AI"
}
settings[207] = {
	description = "Visual debugging for ai attacks",
	is_boolean = true,
	setting_name = "debug_ai_attack",
	category = "AI"
}
settings[208] = {
	description = "Visual debugging for ai targeting.",
	is_boolean = true,
	setting_name = "debug_ai_targets",
	category = "AI"
}
settings[209] = {
	description = "Only enables AI debugger during freeflight",
	is_boolean = true,
	setting_name = "ai_debugger_freeflight_only",
	category = "AI"
}
settings[210] = {
	description = "Shows the aoe targeting alternatives and which target position chosen",
	is_boolean = true,
	setting_name = "ai_debug_aoe_targeting",
	category = "AI"
}
settings[211] = {
	description = "Shows the raycasts when testing trajectories",
	is_boolean = true,
	setting_name = "ai_debug_trajectory_raycast",
	category = "AI"
}
settings[212] = {
	description = "Visualize AI slots",
	is_boolean = true,
	setting_name = "ai_debug_slots",
	category = "AI"
}
settings[213] = {
	description = "Will log when stuff happens",
	is_boolean = true,
	setting_name = "ai_debug_inventory",
	category = "AI"
}
settings[214] = {
	description = "Will visualize ai sound detection and reactions",
	is_boolean = true,
	setting_name = "ai_debug_sound_detection",
	category = "AI"
}
settings[215] = {
	description = "Visual debugging and logging for groups/patrols",
	is_boolean = true,
	setting_name = "ai_debug_smartobject",
	category = "AI"
}
settings[216] = {
	description = "Pack master will attack regardless of if the player is already under attack or not.",
	is_boolean = true,
	setting_name = "ai_packmaster_ignore_dogpile",
	category = "AI"
}
settings[217] = {
	description = "If not true, when quick-spawning enemies the ai debugger will auto select them.",
	is_boolean = true,
	setting_name = "ai_disable_auto_ai_debugger_target",
	category = "AI"
}
settings[218] = {
	description = "show globadiers areas for decision making",
	is_boolean = true,
	setting_name = "ai_globadier_behavior",
	category = "AI"
}
settings[219] = {
	description = "show gutter runner debug",
	is_boolean = true,
	setting_name = "ai_gutter_runner_behavior",
	category = "AI"
}
settings[220] = {
	description = "show loot rat debug",
	is_boolean = true,
	setting_name = "ai_loot_rat_behavior",
	category = "AI"
}
settings[221] = {
	description = "Toggle navmesh debug draw mode.",
	setting_name = "nav_mesh_debug",
	category = "AI",
	item_source = {
		retained = "retained",
		continuous = "continuous"
	}
}
settings[222] = {
	description = "Shows cover points as green spheres. Bad cover points as red capsules, only draws at level startup.",
	is_boolean = true,
	setting_name = "show_hidden_cover_points",
	category = "AI"
}
settings[223] = {
	description = "Shows all coverpoints within 35m from the player",
	is_boolean = true,
	setting_name = "debug_near_cover_points",
	category = "AI"
}
settings[224] = {
	description = "AI group/patrols",
	is_boolean = true,
	setting_name = "ai_group_debug",
	category = "AI"
}
settings[225] = {
	description = "Debug patrols",
	is_boolean = true,
	setting_name = "debug_patrols",
	category = "AI"
}
settings[226] = {
	description = "Debug which groups are being considered for despawning by recycler",
	is_boolean = true,
	setting_name = "debug_group_recycling",
	category = "AI"
}
settings[227] = {
	description = "Debug chaos troll",
	is_boolean = true,
	setting_name = "debug_chaos_troll",
	category = "AI"
}
settings[228] = {
	description = "Debug Skaven Stormfiend",
	is_boolean = true,
	setting_name = "debug_stormfiend",
	category = "AI"
}
settings[229] = {
	description = "Debug the Chaos Vortex",
	is_boolean = true,
	setting_name = "debug_vortex",
	category = "AI"
}
settings[230] = {
	description = "Debug liquid system used for AoE effects.",
	is_boolean = true,
	setting_name = "debug_liquid_system",
	category = "AI"
}
settings[231] = {
	description = "Debug damage wave used for AoE attacks.",
	is_boolean = true,
	setting_name = "debug_damage_wave",
	category = "AI"
}
settings[232] = {
	description = "Debug damage blobs used for AoE attacks.",
	is_boolean = true,
	setting_name = "debug_damage_blobs",
	category = "AI"
}
settings[233] = {
	description = "AI interest points",
	is_boolean = true,
	setting_name = "ai_interest_point_debug",
	category = "AI"
}
settings[234] = {
	description = "AI interest points gets randomly disabled without this",
	is_boolean = true,
	setting_name = "ai_dont_randomize_interest_points",
	category = "AI"
}
settings[235] = {
	description = "ratling gunner debug",
	is_boolean = true,
	setting_name = "ai_ratling_gunner_debug",
	category = "AI"
}
settings[236] = {
	description = "disable to debug crashes more clearly or to profile.",
	is_boolean = true,
	setting_name = "navigation_thread_disabled",
	category = "AI"
}
settings[237] = {
	description = "Disable rats spreading out more.",
	is_boolean = true,
	setting_name = "disable_crowd_dispersion",
	category = "AI"
}
settings[238] = {
	description = "Sets the time available for pathfinding",
	setting_name = "navigation_pathfinder_budget",
	category = "AI",
	item_source = {
		default = true,
		short = true,
		long = true
	},
	func = function (options, index)
		local option = options[index]
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()

		if option == "off" then
			print("Not changing pathfinding budget")
		elseif option == "short" then
			local ms = 0.1

			printf("Changing pathfinding budget to %.1fms", ms)
			GwNavWorld.set_pathfinder_budget(nav_world, ms * 0.001)
		else
			local ms = 100

			printf("Changing pathfinding budget to %.1fms", ms)
			GwNavWorld.set_pathfinder_budget(nav_world, ms * 0.001)
		end
	end
}
settings[239] = {
	description = "Enables visual debugging.",
	category = "AI",
	setting_name = "navigation_visual_debug_enabled",
	callback = "enable_navigation_visual_debug",
	is_boolean = true
}
settings[240] = {
	description = "Show stagger immunity info on enemies.",
	is_boolean = true,
	setting_name = "debug_stagger",
	category = "AI"
}
settings[241] = {
	description = "Shows the values for current attack intensity",
	is_boolean = true,
	setting_name = "debug_attack_intensity",
	category = "AI"
}
settings[242] = {
	description = "Find it annoying that the game ends every time you die? Well enable this setting then!",
	is_boolean = true,
	setting_name = "disable_gamemode_end",
	category = "Gamemode/level"
}
settings[243] = {
	description = "Unlock all levels in the map",
	is_boolean = true,
	setting_name = "unlock_all_levels",
	category = "Gamemode/level"
}
settings[244] = {
	description = "Unlock all difficulties in the map",
	is_boolean = true,
	setting_name = "unlock_all_difficulties",
	category = "Gamemode/level"
}
settings[245] = {
	description = "Various level debug stuff",
	is_boolean = true,
	setting_name = "debug_level",
	category = "Gamemode/level"
}
settings[246] = {
	description = "Shows debug information about Weave spawning",
	is_boolean = true,
	setting_name = "debug_weave_spawning",
	category = "Gamemode/level"
}
settings[247] = {
	description = "Save debug info for server seeded randoms, can be printed on server/client with debug_print_random_values() in console",
	is_boolean = true,
	setting_name = "debug_server_seeded_random",
	category = "Gamemode/level"
}
settings[248] = {
	description = "Normally the level_seed will be 0 when starting a map from toolcenter, but with this you will get a random level-seed.",
	is_boolean = true,
	setting_name = "random_level_seed_from_toolcenter",
	category = "Gamemode/level"
}
settings[249] = {
	description = "Enables room debuging using f1-f4",
	is_boolean = true,
	setting_name = "debug_rooms",
	category = "Gamemode/level"
}
settings[250] = {
	description = "Allows you to skip ingame cutscenes",
	is_boolean = true,
	setting_name = "skippable_cutscenes",
	category = "Gamemode/level"
}
settings[251] = {
	description = "Change which difficulty you play at. Restart required.",
	setting_name = "current_difficulty_setting",
	category = "Gamemode/level",
	item_source = DifficultySettings
}
settings[252] = {
	setting_name = "current_difficulty_tweak_setting",
	category = "Gamemode/level",
	description = "Change which difficulty tweak you play at. Restart required.",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for i = -DifficultyTweak.range, DifficultyTweak.range do
			options[#options + 1] = i
		end

		table.sort(options)

		options[#options + 1] = "[clear value]"
	end
}
settings[253] = {
	description = "Set difficulty. No restart required for most stuff, mostly used for testing enemies. Some stuff might need restart of level.",
	setting_name = "set_difficulty",
	category = "Gamemode/level",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for _, difficulty in pairs(Difficulties) do
			options[#options + 1] = difficulty
		end

		table.sort(options)
	end,
	func = function (options, index)
		local difficulty = options[index]
		local _, current_difficulty_tweak = Managers.state.difficulty:get_difficulty()

		Managers.state.difficulty:set_difficulty(difficulty, current_difficulty_tweak)

		local side = Managers.state.side:get_side_from_name("heroes")
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local player_unit = player_and_bot_units[i]
			local player_unit_attack_intensity_extension = ScriptUnit.has_extension(player_unit, "attack_intensity_system")

			if player_unit_attack_intensity_extension then
				player_unit_attack_intensity_extension:refresh_difficulty()
			end
		end

		print("Set difficulty to " .. difficulty .. current_difficulty_tweak)
	end
}
settings[254] = {
	setting_name = "set_difficulty_tweak",
	category = "Gamemode/level",
	description = "Set difficulty tweak to make the current difficulty slightly easier/harder. " .. "No restart required for most stuff, mostly used for testing enemies. Some stuff might need restart of level.",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for i = -DifficultyTweak.range, DifficultyTweak.range do
			options[#options + 1] = i
		end

		table.sort(options)
	end,
	func = function (options, index)
		local current_difficulty, _ = Managers.state.difficulty:get_difficulty()
		local difficulty_tweak = options[index]

		Managers.state.difficulty:set_difficulty(current_difficulty, difficulty_tweak)
		print("Set difficulty to " .. current_difficulty .. difficulty_tweak)
	end
}
settings[255] = {
	description = "Enables debug options for mutators",
	is_boolean = true,
	setting_name = "debug_mutators",
	category = "Gamemode/level"
}
settings[256] = {
	description = "Debug for darkness in drachenfells castle dungeon level.",
	is_boolean = true,
	setting_name = "debug_darkness",
	category = "Gamemode/level"
}
settings[257] = {
	description = "Shows state of the game-mode and in what parties different players are.",
	is_boolean = true,
	setting_name = "show_gamemode_debug",
	category = "Gamemode/level"
}
settings[258] = {
	description = "Disable horde surge events.",
	is_boolean = true,
	setting_name = "disable_horde_surge",
	category = "Gamemode/level"
}
settings[259] = {
	description = "Displays debug info for Horde Surge events.",
	is_boolean = true,
	setting_name = "debug_horde_surge",
	category = "Gamemode/level"
}
settings[260] = {
	description = "Disables the level introduction by Lohner / Olesya",
	is_boolean = true,
	setting_name = "disable_level_intro_dialogue",
	category = "Visual/audio"
}
settings[261] = {
	description = "Debug print Hit Effects Templates",
	is_boolean = true,
	setting_name = "debug_hit_effects_templates",
	category = "Visual/audio"
}
settings[262] = {
	description = "Prints total ammount of particles currently simulated in the game world",
	is_boolean = true,
	setting_name = "debug_particle_simulation",
	category = "Visual/audio"
}
settings[263] = {
	description = "Disabled blood splatter on screen from other players' kills",
	is_boolean = true,
	setting_name = "disable_remote_blood_splatter",
	category = "Visual/audio"
}
settings[264] = {
	description = "Disabled blood splatter on screen from behind camera",
	is_boolean = true,
	setting_name = "disable_behind_blood_splatter",
	category = "Visual/audio"
}
settings[265] = {
	description = "Disable combat music",
	is_boolean = true,
	setting_name = "debug_disable_combat_music",
	category = "Visual/audio"
}
settings[266] = {
	description = "Show material effect visual debug info.",
	is_boolean = true,
	setting_name = "debug_material_effects",
	category = "Visual/audio"
}
settings[267] = {
	description = "Sound debugging",
	is_boolean = true,
	setting_name = "sound_debug",
	category = "Visual/audio"
}
settings[268] = {
	description = "Shows Wwise Timestamp.",
	is_boolean = true,
	setting_name = "debug_wwise_timestamp",
	category = "Visual/audio"
}
settings[269] = {
	description = "Visual debug for the sound sector system",
	is_boolean = true,
	setting_name = "sound_sector_system_debug",
	category = "Visual/audio"
}
settings[270] = {
	description = "debug info for sound environments",
	is_boolean = true,
	setting_name = "debug_sound_environments",
	category = "Visual/audio"
}
settings[271] = {
	description = "music stuff",
	is_boolean = true,
	setting_name = "debug_music",
	category = "Visual/audio"
}
settings[272] = {
	description = "debug lua_elevation parameter sent to wwise",
	is_boolean = true,
	setting_name = "debug_wwise_elevation",
	category = "Visual/audio"
}
settings[273] = {
	description = "debug current environment blend",
	is_boolean = true,
	setting_name = "debug_environment_blend",
	category = "Visual/audio"
}
settings[274] = {
	description = "debug nav mesh pasted particle effects",
	is_boolean = true,
	setting_name = "debug_nav_mesh_vfx",
	category = "Visual/audio"
}
settings[275] = {
	description = "debug sorting for proximity dependent sfx and vfx",
	is_boolean = true,
	setting_name = "debug_proximity_fx",
	category = "Visual/audio"
}
settings[276] = {
	description = "show values sent to wwise",
	is_boolean = true,
	setting_name = "debug_drunk_sound_values",
	category = "Visual/audio"
}
settings[277] = {
	description = "maximum allowed skaven to play proximity dependent sfx and vfx settings: 5/10/12/15/20/25/30/40/60",
	setting_name = "max_allowed_proximity_fx",
	category = "Visual/audio",
	item_source = {
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		true,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		true,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		true
	}
}
settings[278] = {
	no_nil = true,
	description = "Stuffs",
	setting_name = "visual_debug",
	category = "Visual/audio",
	command_list = {
		{
			description = "off",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Albedo XYZ Luminance",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Albedo XYZ Luminance Clipping",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Albedo Lab Luminance",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Albedo Lab Luminance Clipping",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Albedo",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Normals",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Roughness",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Specular",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Metallic",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Ambient Diffuse",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Velocity",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Ambient Occlusion",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Sun Shadow",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"true"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Bloom",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Light Shafts",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Eye Adaptation",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Cascaded shadow map",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Atlased shadow mapping",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Cached atlased shadow mapping",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"true"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"false"
				}
			}
		},
		{
			description = "Static Shadow Map",
			commands = {
				{
					"renderer",
					"settings",
					"debug_rendering",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_xyz_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_lab_luminance_clipping_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_albedo_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_normal_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_roughness_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_specular_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_metallic_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ambient_diffuse_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_velocity_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_ao_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"gbuffer_sun_shadow_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"bloom_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"light_shafts_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"eye_adaptation_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"cached_shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"shadow_atlas_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"sun_shadow_map_visualization",
					"false"
				},
				{
					"renderer",
					"settings",
					"static_shadow_visualization",
					"true"
				}
			}
		}
	}
}
settings[279] = {
	description = "Bind to a numpad key and do it.",
	category = "Visual/audio",
	setting_name = "take_screenshot",
	func = function ()
		FrameCapture.screen_shot("console_send", 2)
	end
}
settings[280] = {
	description = "Disables all debug draws",
	is_boolean = true,
	setting_name = "disable_debug_draw",
	category = "Visual/audio"
}
settings[281] = {
	description = "Draw pretty lines for sound occlusion.",
	setting_name = "visualize_sound_occlusion",
	callback = "visualize_sound_occlusion",
	category = "Visual/audio",
	item_source = {
		["toggle sound occlusion"] = true
	}
}
settings[282] = {
	description = "Print out debugging for VoIP",
	is_boolean = true,
	setting_name = "debug_voip",
	category = "Visual/audio"
}
settings[283] = {
	description = "Disable VoIP",
	is_boolean = true,
	setting_name = "disable_voip",
	category = "Visual/audio"
}
settings[284] = {
	setting_name = "simulate_color_blindness",
	category = "Visual/audio",
	description = BUILD == "dev" and "Enables or disables different color blindness simulations." or "This is only available in dev builds for performance reasons. Switch exe to dev to see the effects of the changes.",
	item_source = {
		common_deuteranomaly = true,
		off = true,
		rare_protanomaly = true,
		very_rare_tritanomaly = true
	},
	func = function (options, index)
		local option = options[index]
		local on = true
		local mode = 0

		if option == "off" then
			on = false
		elseif option == "rare_protanomaly" then
			mode = 0
		elseif option == "common_deuteranomaly" then
			mode = 1
		else
			mode = 2
		end

		if on then
			printf("Turning on mode %d of color blindness simulation.", mode)
			Application.set_user_setting("render_settings", "color_blindness_mode", mode)
		else
			printf("Turning off color blindness simulation.")
		end

		Application.set_user_setting("render_settings", "simulate_color_blindness", on)
		Application.apply_user_settings()
	end
}
settings[285] = {
	description = "This is used to turn off the fading of AI characters that collide with the camera. This is useful when recording cutscenes.",
	is_boolean = true,
	setting_name = "fade_on_camera_ai_collision",
	category = "Replay"
}
settings[286] = {
	description = "This is used to turn off the screenspace effects that is aimed at a first person view. This is useful when recording cutscenes.",
	is_boolean = true,
	setting_name = "screen_space_player_camera_reactions",
	category = "Replay"
}
settings[287] = {
	no_nil = true,
	description = "Enables chain constraints",
	setting_name = "enable_chain_constraints",
	callback = "enable_chain_constraints",
	category = "Constraints",
	is_boolean = true
}
settings[288] = {
	description = "Network debugging",
	is_boolean = true,
	setting_name = "network_debug",
	category = "Network"
}
settings[289] = {
	description = "Fakes mismatching network hash",
	is_boolean = true,
	setting_name = "fake_network_hash",
	category = "Network"
}
settings[290] = {
	description = "Keeps track of the number of times an rpc send request has been triggered from a certain code row and prints the top 5 most occurring ones. Note: Disregards exclusive local rpc send calls.",
	is_boolean = true,
	setting_name = "rpc_send_count_debug",
	category = "Network"
}
settings[291] = {
	description = "Set network logging to Network.MESSAGES on startup",
	is_boolean = true,
	setting_name = "network_log_messages",
	category = "Network"
}
settings[292] = {
	description = "Set network logging to Network.SPEW on startup",
	is_boolean = true,
	setting_name = "network_log_spew",
	category = "Network"
}
settings[293] = {
	description = "matchmaking debug logging",
	is_boolean = true,
	setting_name = "matchmaking_debug",
	category = "Network"
}
settings[294] = {
	no_nil = true,
	description = "Sets latency",
	setting_name = "network_latency",
	category = "Network",
	command_list = {
		{
			description = "off",
			commands = {
				{
					"network",
					"latency",
					"0",
					"0"
				}
			}
		},
		{
			description = "0.05-0.2 seconds",
			commands = {
				{
					"network",
					"latency",
					"0.05",
					"0.2"
				}
			}
		},
		{
			description = "0.2-0.5 seconds",
			commands = {
				{
					"network",
					"latency",
					"0.2",
					"0.5"
				}
			}
		},
		{
			description = "1 seconds",
			commands = {
				{
					"network",
					"latency",
					"1",
					"1"
				}
			}
		},
		{
			description = "1-2 seconds",
			commands = {
				{
					"network",
					"latency",
					"1",
					"2"
				}
			}
		},
		{
			description = "5 seconds",
			commands = {
				{
					"network",
					"latency",
					"5",
					"5"
				}
			}
		},
		{
			description = "low latency",
			commands = {
				{
					"network",
					"latency",
					"0.010",
					"0.012"
				}
			}
		},
		{
			description = "medium latency",
			commands = {
				{
					"network",
					"latency",
					"0.035",
					"0.040"
				}
			}
		},
		{
			description = "high latency",
			commands = {
				{
					"network",
					"latency",
					"0.070",
					"0.080"
				}
			}
		},
		{
			description = "very high latency",
			commands = {
				{
					"network",
					"latency",
					"0.090",
					"0.100"
				}
			}
		}
	}
}
settings[295] = {
	description = "Sets Backend Response Latency",
	setting_name = "backend_response_latency",
	category = "Network",
	item_source = {
		0,
		1,
		2,
		4,
		8,
		16
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end,
	func = function (options, index)
		local option = options[index]
		script_data.backend_response_latency = option
	end
}
settings[296] = {
	no_nil = true,
	description = "Sets packet loss",
	setting_name = "packet_loss",
	category = "Network",
	command_list = {
		{
			description = "off",
			commands = {
				{
					"network",
					"packet_loss",
					"0",
					"0"
				}
			}
		},
		{
			description = "0.5%",
			commands = {
				{
					"network",
					"packet_loss",
					"0.005"
				}
			}
		},
		{
			description = "1%",
			commands = {
				{
					"network",
					"packet_loss",
					"0.01"
				}
			}
		},
		{
			description = "2%",
			commands = {
				{
					"network",
					"packet_loss",
					"0.02"
				}
			}
		}
	}
}
settings[297] = {
	no_nil = true,
	description = "Sets bandwidth limits",
	setting_name = "network connection",
	category = "Network",
	command_list = {
		{
			description = "off",
			commands = {
				{
					"network",
					"limit"
				}
			}
		},
		{
			description = "Crappy cable 192/192",
			commands = {
				{
					"network",
					"limit",
					"192",
					"192"
				}
			}
		},
		{
			description = "Crappy cable, 128/512",
			commands = {
				{
					"network",
					"limit",
					"128",
					"512"
				}
			}
		},
		{
			description = "Crappy ADSL, 512/2048",
			commands = {
				{
					"network",
					"limit",
					"512",
					"2048"
				}
			}
		},
		{
			description = "4mbit half duplex",
			commands = {
				{
					"network",
					"limit",
					"2048",
					"2048"
				}
			}
		},
		{
			description = "10mbit half duplex",
			commands = {
				{
					"network",
					"limit",
					"5000",
					"5000"
				}
			}
		}
	}
}
settings[298] = {
	description = "Shows the current clock time",
	is_boolean = true,
	setting_name = "network_clock_debug",
	category = "Network"
}
settings[299] = {
	description = "Debug Print Profile Package Loading",
	is_boolean = true,
	setting_name = "profile_package_loading_debug",
	category = "Network"
}
settings[300] = {
	description = "Debugs connections for the network",
	is_boolean = true,
	setting_name = "network_debug_connections",
	category = "Network"
}
settings[301] = {
	description = "Debugs lobbies and matchmaking",
	is_boolean = true,
	setting_name = "debug_lobbies",
	category = "Network"
}
settings[302] = {
	description = "Shows lobby data key/values",
	is_boolean = true,
	setting_name = "debug_lobby_data",
	category = "Network"
}
settings[303] = {
	description = "Debug draw peer state machine states.",
	is_boolean = true,
	setting_name = "network_draw_peer_states",
	category = "Network"
}
settings[304] = {
	description = "Logs information about the profile synchronizer. Best used together with shared_state_debug.",
	is_boolean = true,
	setting_name = "profile_synchronizer_debug_logging",
	category = "Network"
}
settings[305] = {
	description = "Allows host to query himself. Fixes the time_left of votes to 1s.",
	is_boolean = true,
	setting_name = "debug_vote_manager",
	category = "Network"
}
settings[306] = {
	description = "Do not check the network hash when joining a game as a client.",
	is_boolean = true,
	setting_name = "do_not_check_network_hash_when_joining",
	category = "Network"
}
settings[307] = {
	description = "Do not blacklist lobbies when exiting/cancelling as a client.",
	is_boolean = true,
	setting_name = "do_not_add_broken_lobby_client",
	category = "Network"
}
settings[308] = {
	description = "Debug All Contexts",
	is_boolean = true,
	setting_name = "dialogue_debug_all_contexts",
	category = "Dialogue"
}
settings[309] = {
	description = "Debug Last Query",
	is_boolean = true,
	setting_name = "dialogue_debug_last_query",
	category = "Dialogue"
}
settings[310] = {
	description = "Debug Print Successful Queries",
	is_boolean = true,
	setting_name = "dialogue_debug_last_played_query",
	category = "Dialogue"
}
settings[311] = {
	description = "Debug Print Queries",
	is_boolean = true,
	setting_name = "dialogue_debug_queries",
	category = "Dialogue"
}
settings[312] = {
	description = "Debug show Proximities",
	is_boolean = true,
	setting_name = "dialogue_debug_proximity_system",
	category = "Dialogue"
}
settings[313] = {
	description = "Visualize lookat system",
	is_boolean = true,
	setting_name = "dialogue_debug_lookat",
	category = "Dialogue"
}
settings[314] = {
	description = "Debug subtitles",
	is_boolean = true,
	setting_name = "subtitle_debug",
	category = "Dialogue"
}
settings[315] = {
	setting_name = "debug_dialogue_files",
	description = "Used to debug dialog files, facial expressions and missing vo/subtitles. To skip use: DebugVo_jump_to('line_number/line_id')",
	category = "Dialogue",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local dialogue_files = DialogueSettings.auto_load_files

		if dialogue_files ~= nil then
			for _, file in pairs(dialogue_files) do
				options[#options + 1] = string.match(file, "^.+/(.+)$")
			end
		end

		local level_key = Managers.state.game_mode:level_key()
		local level_dialogue_files = DialogueSettings.level_specific_load_files[level_key]

		if level_dialogue_files ~= nil then
			for _, file in pairs(level_dialogue_files) do
				options[#options + 1] = string.match(file, "^.+/(.+)$")
			end
		end
	end,
	func = function (options, index)
		DebugVoByFile(options[index], false)
	end
}
settings[316] = {
	description = "Missing vo sound event triggers an error sound",
	is_boolean = true,
	setting_name = "dialogue_debug_missing_vo_trigger_error_sound",
	category = "Dialogue"
}
settings[317] = {
	description = "Enables Text-To-Speech for ALL dialogues",
	is_boolean = true,
	setting_name = "debug_text_to_speech_forced",
	category = "Dialogue"
}
settings[318] = {
	description = "Enables Text-To-Speech for dialogues with missing VO",
	is_boolean = true,
	setting_name = "debug_text_to_speech_missing",
	category = "Dialogue"
}
settings[319] = {
	description = "Disable auto block on input loss",
	is_boolean = true,
	setting_name = "disable_auto_block",
	category = "Input"
}
settings[320] = {
	description = "Debug print input device statuses",
	is_boolean = true,
	setting_name = "input_debug_device_state",
	category = "Input"
}
settings[321] = {
	description = "Debug input filters output",
	is_boolean = true,
	setting_name = "input_debug_filters",
	category = "Input"
}
settings[322] = {
	description = "Enables additional assertions to help catch errors in UI code. Only has an effect when DEBUG is enabled.",
	is_boolean = true,
	setting_name = "strict_ui_checks",
	category = "UI"
}
settings[323] = {
	description = "Reverts back to the old Deus Map UI in case the new one is buggy",
	is_boolean = true,
	setting_name = "FEATURE_old_map_ui",
	category = "UI"
}
settings[324] = {
	description = "Debug UI Hover elements",
	is_boolean = true,
	setting_name = "ui_debug_hover",
	category = "UI"
}
settings[325] = {
	description = "Enable/Disable the Lorebook (need to restart level to spawn page pickups)",
	is_boolean = true,
	setting_name = "lorebook_enabled",
	category = "UI"
}
settings[326] = {
	description = "Debug UI Scenegraph Areas and Sizes",
	is_boolean = true,
	setting_name = "ui_debug_scenegraph",
	category = "UI"
}
settings[327] = {
	description = "Debug UI Pixeldistance (by keybinding",
	is_boolean = true,
	setting_name = "ui_debug_pixeldistance",
	category = "UI"
}
settings[328] = {
	description = "Debug ui textures.",
	is_boolean = true,
	setting_name = "ui_debug_draw_texture",
	category = "UI"
}
settings[329] = {
	description = "Disable UI Rendering.",
	is_boolean = true,
	setting_name = "disable_ui",
	category = "UI"
}
settings[330] = {
	description = "Disable Outlines.",
	category = "UI",
	setting_name = "disable_outlines",
	callback = "disable_outlines",
	is_boolean = true
}
settings[331] = {
	description = "Disables the screens at the end of the level, getting you directly back to the inn.",
	is_boolean = true,
	setting_name = "disable_end_screens",
	category = "UI"
}
settings[332] = {
	description = "Disable Tutorial UI Rendering.",
	is_boolean = true,
	setting_name = "disable_tutorial_ui",
	category = "UI"
}
settings[333] = {
	description = "Disable Info Slate UI Rendering.",
	is_boolean = true,
	setting_name = "disable_info_slate_ui",
	category = "UI"
}
settings[334] = {
	description = "Disables the loading icon.",
	is_boolean = true,
	setting_name = "disable_loading_icon",
	category = "UI"
}
settings[335] = {
	description = "Disables the Water Mark if present.",
	is_boolean = true,
	setting_name = "disable_water_mark",
	category = "UI"
}
settings[336] = {
	description = "Looks through all the localizations and selects the longest text for each item.",
	is_boolean = true,
	setting_name = "show_longest_localizations",
	category = "UI"
}
settings[337] = {
	description = "Disable localization and show the source strings instead. Useful to find the string being used somewhere.",
	is_boolean = true,
	setting_name = "disable_localization",
	category = "UI"
}
settings[338] = {
	description = "Cycles through available localizations",
	category = "UI",
	setting_name = "enable_localization_cycling",
	callback = "enable_locale_cycling",
	is_boolean = true
}
settings[339] = {
	description = "Turns off positive reinforcement UI",
	is_boolean = true,
	setting_name = "disable_reinforcement_ui",
	category = "UI"
}
settings[340] = {
	description = "Switches reinforcement UI local sound",
	setting_name = "reinforcement_ui_local_sound",
	category = "UI",
	item_source = {
		hud_achievement_unlock_01 = true,
		hud_achievement_unlock_03 = true,
		hud_info = true,
		hud_achievement_unlock_02 = true
	}
}
settings[341] = {
	description = "Toggles reinforcement UI remote sound",
	is_boolean = true,
	setting_name = "enable_reinforcement_ui_remote_sound",
	category = "UI"
}
settings[342] = {
	description = "The whole menu is unlocked, there is no end to the possibilities!",
	is_boolean = true,
	setting_name = "pause_menu_full_access",
	category = "UI"
}
settings[343] = {
	description = "Enables option to give yourself lootboxes for free!",
	is_boolean = true,
	setting_name = "debug_loot_opening",
	category = "UI"
}
settings[344] = {
	description = "If inventory is open it will cycle select items automatically",
	is_boolean = true,
	setting_name = "debug_cycle_select_inventory_item",
	category = "UI"
}
settings[345] = {
	description = "Enables or disables detailed tooltips on weapns, accessable by pressing SHIFT or CTRL",
	is_boolean = true,
	setting_name = "enable_detailed_tooltips",
	category = "UI"
}
settings[346] = {
	description = "Always allow buying bundles (even if you already own them).",
	is_boolean = true,
	setting_name = "always_allow_buying_bundles",
	category = "UI"
}
settings[347] = {
	description = "Show all news feed items when entering the keep.",
	is_boolean = true,
	setting_name = "show_all_news_feed_items",
	category = "UI"
}
settings[348] = {
	description = "Marks all shop items as unseen.",
	category = "UI",
	setting_name = "mark_all_unseen",
	func = function ()
		PlayerData.seen_shop_items = {}

		Managers.save:auto_save(SaveFileName, SaveData)
	end
}
settings[349] = {
	description = "Disables position lookup validation. Can turn this on for extra performance.",
	is_boolean = true,
	setting_name = "disable_debug_position_lookup",
	category = "Misc"
}
settings[350] = {
	description = "Will paste the content and engine revision to the user's clipboard.",
	is_boolean = true,
	setting_name = "paste_revision_to_clipboard",
	category = "Misc"
}
settings[351] = {
	description = "Enable logging of telemetry debugging information.",
	is_boolean = true,
	setting_name = "debug_telemetry",
	category = "Misc"
}
settings[352] = {
	description = "Enable logging of leaderboard debugging information.",
	is_boolean = true,
	setting_name = "debug_leaderboard",
	category = "Misc"
}
settings[353] = {
	description = "Enable logging of the forge",
	is_boolean = true,
	setting_name = "forge_debug",
	category = "Misc"
}
settings[354] = {
	description = "Enables logging for the package manager",
	is_boolean = true,
	setting_name = "package_debug",
	category = "Misc"
}
settings[355] = {
	description = "Shows currently loaded levels and the level_seed.",
	is_boolean = true,
	setting_name = "debug_level_packages",
	category = "Misc"
}
settings[356] = {
	description = "Disable luajit ",
	category = "Misc",
	setting_name = "luajit_disabled",
	callback = "update_using_luajit",
	is_boolean = true
}
settings[357] = {
	description = "Restart the game to view dice chances",
	is_boolean = true,
	setting_name = "dice_chance_simulation",
	category = "Misc"
}
settings[358] = {
	description = "Shows a rect in topcenter of the current color of lightfx. Restart required",
	is_boolean = true,
	setting_name = "debug_lightfx",
	category = "Misc"
}
settings[359] = {
	description = "Spawns all player characters base and husk units, and prints to console if any unit is missing any hit-zone actors etc. Units will spawn in base/husk pairs at (0,0,0) upwards into the sky. They will not be removed.",
	category = "Misc",
	setting_name = "check_player_base_and_husk_hitzones",
	func = function ()
		CHECK_PLAYER_HITZONES()
	end
}
settings[360] = {
	description = "Throttles FPS to a value. Default means no throttle. Note that this doesn't automatically gets set at startup.",
	setting_name = "force_limit_fps",
	category = "Misc",
	item_source = {
		default = true,
		throttle_fps_60 = true,
		throttle_fps_15 = true,
		throttle_fps_1 = true,
		throttle_fps_10 = true,
		throttle_fps_45 = true,
		throttle_fps_25 = true,
		throttle_fps_20 = true,
		throttle_fps_30 = true,
		throttle_fps_5 = true
	},
	func = function (options, index)
		local option = options[index]
		local fps = 60

		if option == "default" then
			Application.set_time_step_policy("no_throttle")

			return
		elseif option == "throttle_fps_1" then
			fps = 1
		elseif option == "throttle_fps_5" then
			fps = 5
		elseif option == "throttle_fps_10" then
			fps = 10
		elseif option == "throttle_fps_15" then
			fps = 15
		elseif option == "throttle_fps_20" then
			fps = 20
		elseif option == "throttle_fps_25" then
			fps = 25
		elseif option == "throttle_fps_30" then
			fps = 30
		elseif option == "throttle_fps_45" then
			fps = 45
		elseif option == "throttle_fps_60" then
			fps = 60
		end

		Application.set_time_step_policy("throttle", fps)
	end
}
settings[361] = {
	description = "Don't show dark background behind debug texts.",
	is_boolean = true,
	setting_name = "hide_debug_text_background",
	category = "Misc"
}
settings[362] = {
	description = "Will log transitions fade in/fade out",
	is_boolean = true,
	setting_name = "debug_transition_manager",
	category = "Misc"
}
settings[363] = {
	description = "Disable that the vortex can attract anything / swirl anything around in the air",
	is_boolean = true,
	setting_name = "disable_vortex_attraction",
	category = "Misc"
}
settings[364] = {
	no_nil = true,
	description = "Sets the time that a stall must take in order for it to be logged. Default is 0.1 seconds.",
	setting_name = "stall_time",
	category = "Performance",
	command_list = {
		{
			description = "default",
			commands = {
				{
					"profiler",
					"stall",
					0.1
				}
			}
		},
		{
			description = "0.05",
			commands = {
				{
					"profiler",
					"stall",
					0.05
				}
			}
		},
		{
			description = "0.2",
			commands = {
				{
					"profiler",
					"stall",
					0.2
				}
			}
		},
		{
			description = "0.5",
			commands = {
				{
					"profiler",
					"stall",
					0.5
				}
			}
		},
		{
			description = "1",
			commands = {
				{
					"profiler",
					"stall",
					1
				}
			}
		},
		{
			description = "10",
			commands = {
				{
					"profiler",
					"stall",
					10
				}
			}
		}
	}
}
settings[365] = {
	description = "Enable logging of mismatched profiling scopes.",
	is_boolean = true,
	setting_name = "debug_profiling_scopes",
	category = "Performance"
}
settings[366] = {
	description = "Enable visual 'profiling' of function calls.",
	is_boolean = true,
	setting_name = "profile_function_calls",
	category = "Performance"
}
settings[367] = {
	description = "Enable asserts on mismatched profiling scopes.",
	is_boolean = true,
	setting_name = "validate_profiling_scopes",
	category = "Performance"
}
settings[368] = {
	description = "Disable lodding of animation bones.",
	is_boolean = true,
	setting_name = "bone_lod_disable",
	category = "Performance"
}
settings[369] = {
	description = "Enable floating text over AI head which states the animation that animation merge is currently enabled for.",
	is_boolean = true,
	setting_name = "animation_merge_debug",
	category = "Performance"
}
settings[370] = {
	no_nil = false,
	description = "Gamma (2.2 default)",
	setting_name = "Gamma",
	category = "Render Settings",
	bitmap = "settings_debug_gamma_correction",
	bitmap_size = 512,
	command_list = {
		{
			description = "1.0",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"1.0"
				}
			}
		},
		{
			description = "2.0",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"2.0"
				}
			}
		},
		{
			description = "2.1",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"2.1"
				}
			}
		},
		{
			description = "2.2",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"2.2"
				}
			}
		},
		{
			description = "2.3",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"2.3"
				}
			}
		},
		{
			description = "2.4",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"2.4"
				}
			}
		},
		{
			description = "3.0",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"3.0"
				}
			}
		},
		{
			description = "3.5",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"3.5"
				}
			}
		},
		{
			description = "4.0",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"4.0"
				}
			}
		},
		{
			description = "4.5",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"4.5"
				}
			}
		},
		{
			description = "5.0",
			commands = {
				{
					"renderer",
					"settings",
					"gamma",
					"5.0"
				}
			}
		}
	}
}
settings[371] = {
	no_nil = false,
	description = "Enabled is default",
	setting_name = "Global Shadows",
	category = "Render Settings",
	command_list = {
		{
			description = "Sun Shadow Enabled",
			commands = {
				{
					"renderer",
					"settings",
					"sun_shadows",
					"true"
				}
			}
		},
		{
			description = "Sun Shadow Disabled",
			commands = {
				{
					"renderer",
					"settings",
					"sun_shadows",
					"false"
				}
			}
		}
	}
}
settings[372] = {
	no_nil = false,
	description = "Enabled is default. You'll need to restart game/engine.",
	setting_name = "Local Light Shadows",
	category = "Render Settings",
	command_list = {
		{
			description = "Local Light Shadow Enabled",
			commands = {
				{
					"renderer",
					"settings",
					"deferred_local_lights_cast_shadows",
					"true"
				},
				{
					"renderer",
					"settings",
					"forward_local_lights_cast_shadows",
					"true"
				}
			}
		},
		{
			description = "Local Light Shadow Disabled",
			commands = {
				{
					"renderer",
					"settings",
					"deferred_local_lights_cast_shadows",
					"false"
				},
				{
					"renderer",
					"settings",
					"forward_local_lights_cast_shadows",
					"false"
				}
			}
		}
	}
}
settings[373] = {
	no_nil = false,
	description = "Enabled is default",
	setting_name = "AO Enable/Disable",
	category = "Render Settings",
	command_list = {
		{
			description = "Enabled",
			commands = {
				{
					"renderer",
					"settings",
					"ao_enabled",
					"true"
				}
			}
		},
		{
			description = "Disabled",
			commands = {
				{
					"renderer",
					"settings",
					"ao_enabled",
					"false"
				}
			}
		}
	}
}
settings[374] = {
	no_nil = false,
	description = "Full is default. You'll need to restart game/engine.",
	setting_name = "AO Resolution",
	category = "Render Settings",
	command_list = {
		{
			description = "Full Res",
			commands = {
				{
					"renderer",
					"settings",
					"ao_half_res",
					"false"
				}
			}
		},
		{
			description = "Half Res",
			commands = {
				{
					"renderer",
					"settings",
					"ao_half_res",
					"true"
				}
			}
		}
	}
}
settings[375] = {
	description = "You have to restart the game for the settings to take effect",
	category = "Render Settings",
	setting_name = "Set high texture quality",
	func = function ()
		DebugScreen.set_texture_quality(0)
	end
}
settings[376] = {
	description = "You have to restart the game for the settings to take effect",
	category = "Render Settings",
	setting_name = "Set low texture quality",
	func = function ()
		DebugScreen.set_texture_quality(3)
	end
}
settings[377] = {
	description = "Don't render the game if the window is not focused",
	is_boolean = true,
	setting_name = "only_render_if_window_focused",
	category = "Render Settings"
}
settings[378] = {
	description = "Show bot debug visualizers",
	is_boolean = true,
	setting_name = "ai_bots_debug",
	category = "Bots"
}
settings[379] = {
	description = "Make bots not see/attack anyone",
	is_boolean = true,
	setting_name = "ai_bots_disable_perception",
	category = "Bots"
}
settings[380] = {
	description = "Bot won't shot at enemy players, but still attack ai enemies. Versus Specific",
	is_boolean = true,
	setting_name = "ai_bots_disable_player_range_attacks",
	category = "Bots"
}
settings[381] = {
	description = "Make bots not dodge attacks",
	is_boolean = true,
	setting_name = "ai_bots_disable_dodging",
	category = "Bots"
}
settings[382] = {
	description = "Bot won't melee at enemy players, but still attack ai enemies. Versus Specific",
	is_boolean = true,
	setting_name = "ai_bots_disable_player_melee_attacks",
	category = "Bots"
}
settings[383] = {
	description = "Bots will only use ranged attacks.",
	is_boolean = true,
	setting_name = "ai_bots_disable_ranged_attacks",
	category = "Bots"
}
settings[384] = {
	description = "Bots will only use melee attacks.",
	is_boolean = true,
	setting_name = "ai_bots_disable_melee_attacks",
	category = "Bots"
}
settings[385] = {
	description = "Bots use ranged attacks as much as possible.",
	is_boolean = true,
	setting_name = "ai_bots_ranged_attack_always_valid",
	category = "Bots"
}
settings[386] = {
	description = "Enable debug printing related to bot weapons.",
	is_boolean = true,
	setting_name = "ai_bots_weapon_debug",
	category = "Bots"
}
settings[387] = {
	description = "Enable debug information related to bot orders - press t to order bot to pickup item using raycast.",
	is_boolean = true,
	setting_name = "ai_bots_order_debug",
	category = "Bots"
}
settings[388] = {
	description = "Shows which inputs that the bot is doing at the moment.",
	is_boolean = true,
	setting_name = "ai_bots_input_debug",
	category = "Bots"
}
settings[389] = {
	description = "Visualizes the AoE threat that the bots are trying to avoid.",
	is_boolean = true,
	setting_name = "ai_bots_aoe_threat_debug",
	category = "Bots"
}
settings[390] = {
	description = "Visualizes nearby breakable smart objects for the selected bot.",
	is_boolean = true,
	setting_name = "ai_bots_proximity_breakables_debug",
	category = "Bots"
}
settings[391] = {
	description = "Bots will not follow player.",
	is_boolean = true,
	setting_name = "bots_dont_follow",
	category = "Bots"
}
settings[392] = {
	description = "Disables automatic spawning of bots",
	is_boolean = true,
	setting_name = "ai_bots_disabled",
	category = "Bots"
}
settings[393] = {
	description = "Enables bots on Weaves",
	is_boolean = true,
	setting_name = "enable_bots_in_weaves",
	category = "Bots"
}
settings[394] = {
	description = "Disables bot usage of career abilities.",
	is_boolean = true,
	setting_name = "ai_bots_career_abilities_disabled",
	category = "Bots"
}
settings[395] = {
	description = "Will cap the total number of bots in game",
	setting_name = "cap_num_bots",
	category = "Bots",
	item_source = {
		0,
		1,
		2
	}
}
settings[396] = {
	description = "Next spawned bot will use this profile if available (Tip: Toggle ai_bots_disabled on/off).",
	setting_name = "wanted_bot_profile",
	category = "Bots",
	item_source = {
		witch_hunter = true,
		empire_soldier = true,
		dwarf_ranger = true,
		wood_elf = true,
		bright_wizard = true
	}
}
settings[397] = {
	description = "Next spawned bot will use this career index, clear to use the last choosen one (Tip: Toggle ai_bots_disabled on/off).",
	setting_name = "wanted_bot_career_index",
	category = "Bots",
	item_source = {
		item_source = {
			1,
			2,
			3
		}
	}
}
settings[398] = {
	description = "Only works together with wanted_bot_profile. Will make all spawned the same as defined in wanted_bot_profile. (Might need to toggle_ai_bots on/off.)",
	is_boolean = true,
	setting_name = "allow_same_bots",
	category = "Bots"
}
settings[399] = {
	no_nil = false,
	description = "",
	setting_name = "Perfhud Artist",
	category = "Perfhud",
	command_list = {
		{
			description = "Default",
			commands = {
				{
					"perfhud",
					"artist"
				}
			}
		},
		{
			description = "Objects",
			commands = {
				{
					"perfhud",
					"artist",
					"objects"
				}
			}
		},
		{
			description = "Lighting",
			commands = {
				{
					"perfhud",
					"artist",
					"lighting"
				}
			}
		},
		{
			description = "Post Processing",
			commands = {
				{
					"perfhud",
					"artist",
					"post_processing"
				}
			}
		},
		{
			description = "GUI",
			commands = {
				{
					"perfhud",
					"artist",
					"gui"
				}
			}
		}
	}
}
settings[400] = {
	no_nil = false,
	description = "",
	setting_name = "Perfhud Memory",
	category = "Perfhud",
	command_list = {
		{
			description = "Memory",
			commands = {
				{
					"perfhud",
					"memory"
				}
			}
		}
	}
}
settings[401] = {
	description = "Performance Manager Debug",
	is_boolean = true,
	setting_name = "performance_debug",
	category = "Perfhud"
}
settings[402] = {
	description = "Requires restart. Disables the backend and emulates it with a local save.",
	is_boolean = true,
	setting_name = "use_local_backend",
	category = "Backend"
}
settings[403] = {
	description = "Sets the amount of logging on the backend",
	setting_name = "backend_logging_level",
	category = "Backend",
	item_source = {
		off = true,
		verbose = true,
		normal = true
	},
	func = function ()
		Managers.backend:refresh_log_level()
	end
}
settings[404] = {
	description = "Connect to a backend running locally. Can be set to a string to use that as a URL.",
	is_boolean = true,
	setting_name = "backend_base_url",
	category = "Backend"
}
settings[405] = {
	description = "Unlock all careers",
	is_boolean = true,
	setting_name = "unlock_all_careers",
	category = "Progression"
}
settings[406] = {
	description = "You have to reload the inn for the setting to take effect",
	is_boolean = true,
	setting_name = "unlock_full_keep",
	category = "Progression"
}
settings[407] = {
	description = "Win",
	close_when_selected = true,
	setting_name = "Complete current level",
	category = "Progression",
	func = function ()
		Managers.state.game_mode:complete_level()
	end
}
settings[408] = {
	description = "Restart",
	close_when_selected = true,
	setting_name = "Retry current level",
	category = "Progression",
	func = function ()
		Managers.state.game_mode:retry_level()
	end
}
settings[409] = {
	description = "Lose",
	close_when_selected = true,
	setting_name = "Fail current level",
	category = "Progression",
	func = function ()
		Managers.state.game_mode:fail_level()
	end
}
settings[410] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Complete act \"prologue\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("prologue", true)
	end
}
settings[411] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Uncomplete act \"prologue\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("prologue", false)
	end
}
settings[412] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Complete act \"act_1\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_1", true)
	end
}
settings[413] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Uncomplete act \"act_1\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_1", false)
	end
}
settings[414] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Complete act \"act_2\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_2", true)
	end
}
settings[415] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Uncomplete act \"act_2\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_2", false)
	end
}
settings[416] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Complete act \"act_3\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_3", true)
	end
}
settings[417] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Uncomplete act \"act_3\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_3", false)
	end
}
settings[418] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Complete act \"act_4\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_4", true)
	end
}
settings[419] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Uncomplete act \"act_4\"",
	func = function ()
		LevelUnlockUtils.debug_completed_act_levels("act_4", false)
	end
}
settings[420] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Set completed game difficulty Normal",
	func = function ()
		LevelUnlockUtils.debug_set_completed_game_difficulty(2)
	end
}
settings[421] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Set completed game difficulty Hard",
	func = function ()
		LevelUnlockUtils.debug_set_completed_game_difficulty(3)
	end
}
settings[422] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Set completed game difficulty Nightmare",
	func = function ()
		LevelUnlockUtils.debug_set_completed_game_difficulty(4)
	end
}
settings[423] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Set completed game difficulty Cataclysm",
	func = function ()
		LevelUnlockUtils.debug_set_completed_game_difficulty(5)
	end
}
settings[424] = {
	description = " ",
	category = "Progression",
	setting_name = "Complete DLC Celebrate",
	func = function ()
		LevelUnlockUtils.debug_complete_level("dlc_celebrate_crawl")

		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "lua_unlock_challenge_debug_event")
	end
}
settings[425] = {
	setting_name = "Add Experience",
	description = "Adds Experience to your account.",
	category = "Progression",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		options[1] = 1
		options[2] = 10
		options[3] = 100
		options[4] = 1000
		options[5] = 10000
		options[6] = 60850
	end,
	func = function (options, index)
		local backend_manager = Managers.backend
		local experience = options[index] or 1
		local player = Managers.player:local_player(1)
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name

		local function cb(result)
			local function_result = result.FunctionResult
			local hero_attributes = backend_manager:get_interface("hero_attributes")

			hero_attributes:set(display_name, "experience", function_result.data[display_name .. "_experience"])
		end

		local request = {
			FunctionName = "devAddExperience",
			FunctionParameter = {
				hero = display_name,
				experience = experience
			}
		}
		local backend_mirror = backend_manager._backend_mirror
		local request_queue = backend_mirror:request_queue()

		request_queue:enqueue(request, cb, false)
	end
}
settings[426] = {
	description = "Sets experience to 0.",
	category = "Progression",
	setting_name = "Reset Level",
	func = function ()
		local backend_manager = Managers.backend
		local player = Managers.player:local_player(1)
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name
		local hero_attributes = backend_manager:get_interface("hero_attributes")

		local function cb(result)
			hero_attributes:set(display_name, "experience", 0)
		end

		local request = {
			FunctionName = "devAddExperience",
			FunctionParameter = {
				hero = display_name,
				experience = hero_attributes:get(display_name, "experience")
			}
		}
		local backend_mirror = backend_manager._backend_mirror
		local request_queue = backend_mirror:request_queue()

		request_queue:enqueue(request, cb, false)
	end
}
settings[427] = {
	description = "Will add experience to above prestige requirements",
	category = "Progression",
	setting_name = "Level up above prestige level requirements",
	func = function ()
		local backend_manager = Managers.backend
		local player = Managers.player:local_player(1)
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name

		local function cb(result)
			local function_result = result.FunctionResult
			local hero_attributes = backend_manager:get_interface("hero_attributes")

			hero_attributes:set(display_name, "experience", function_result.data[display_name .. "_experience"])
			Debug.load_level("inn_level")
		end

		local request = {
			FunctionName = "devSetExperience",
			FunctionParameter = {
				experience = 1000000,
				hero = display_name
			}
		}
		local backend_mirror = backend_manager._backend_mirror
		local request_queue = backend_mirror:request_queue()

		request_queue:enqueue(request, cb, false)
	end
}
settings[428] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Reset prestige level",
	func = function ()
		local player_manager = Managers.player
		local player = player_manager:local_player(1)
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local hero_attributes = Managers.backend:get_interface("hero_attributes")

		hero_attributes:set(profile.display_name, "prestige", 0)
		Debug.load_level("inn_level")
	end
}
settings[429] = {
	description = "You have to reload the inn for the setting to take effect",
	category = "Progression",
	setting_name = "Wipe all progression(used for prestige)",
	func = function ()
		LevelUnlockUtils.set_all_acts_incompleted()
	end
}
settings[430] = {
	description = "Set sum of best power levels, ignoring actual value in the backend",
	category = "Progression",
	setting_name = "sum_of_best_power_levels_override",
	item_source = {
		0,
		50,
		100,
		150,
		200,
		250,
		300,
		350,
		400,
		450,
		500,
		550,
		600,
		650,
		700,
		750,
		800,
		850,
		900,
		950,
		1000,
		1050,
		1100,
		1150,
		1200,
		1250,
		1300
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end
}
settings[431] = {
	description = "Override the returned value to flow node \"Leader Achievement Completed\"",
	is_boolean = true,
	setting_name = "achievement_completed_flow_override",
	category = "Progression"
}
settings[432] = {
	description = "Override the returned value to flow node \"Leader Has DLC\" when checking for the Collectors Edition (Pre Order) DLC",
	is_boolean = true,
	setting_name = "has_dlc_pre_order_flow_override",
	category = "Progression"
}
settings[433] = {
	description = "Disables the hero power requirements for difficulties",
	is_boolean = true,
	setting_name = "disable_hero_power_requirement",
	category = "Progression"
}
settings[434] = {
	description = "Completely resets all stats for local player. Requires that the player is spawned inside a level. REQUIRES RESTART AFTERWARDS!",
	category = "Progression",
	setting_name = "reset_statistics_database",
	func = function ()
		print("Starting statistics reset!")
		Managers.backend:get_interface("statistics"):reset()
	end
}
settings[435] = {
	description = "Shows test buffs in the buff tray for debugging.",
	is_boolean = true,
	setting_name = "debug_buff_ui",
	category = "HUD"
}
settings[436] = {
	description = "Show more things in the player list UI right-hand panel for debugging.",
	is_boolean = true,
	setting_name = "debug_player_list_ui",
	category = "HUD"
}
settings[437] = {
	description = "Will display all properties on the player",
	is_boolean = true,
	setting_name = "debug_show_player_properties",
	category = "HUD"
}
settings[438] = {
	description = "Will display all properties on the player, all = all properties, limited = buffs chosen by QA",
	setting_name = "debug_show_player_active_buffs",
	category = "HUD",
	is_boolean = true,
	item_source = {
		all = "all",
		limited = "limited"
	}
}
settings[439] = {
	no_nil = false,
	setting_name = "debug_hud_visibility_group",
	description = "Force activate a specific HUD visibility group",
	category = "HUD",
	item_source = {},
	load_items_source_func = function (options)
		if not options.initialized then
			table.clear(options)

			options[#options + 1] = "none"
			local definitions = local_require("scripts/ui/views/ingame_hud_definitions")
			local visibility_groups = definitions.visibility_groups

			for _, settings in ipairs(visibility_groups) do
				local name = settings.name
				options[#options + 1] = name
			end

			options.initialized = true
		end
	end,
	func = function (options, index)
		local item = options[index]

		if not item or item == "none" then
			script_data.debug_hud_visibility_group = nil
		else
			script_data.debug_hud_visibility_group = item
		end
	end
}
settings[440] = {
	description = "Used for spawning world markers on ping input",
	is_boolean = true,
	setting_name = "debug_world_marker_ping",
	category = "UI"
}
settings[441] = {
	description = "Prints the number of server controlled buffs.",
	is_boolean = true,
	setting_name = "debug_server_controlled_buffs",
	category = "Player mechanics"
}
settings[442] = {
	description = "Shows the bones of the player units",
	is_boolean = true,
	setting_name = "debug_player_skeletons",
	category = "Player mechanics"
}
settings[443] = {
	description = "Shows current career sound state",
	is_boolean = true,
	setting_name = "debug_career_sound_state",
	category = "Player mechanics"
}
settings[444] = {
	description = "Disables the weave score UI on screen",
	is_boolean = true,
	setting_name = "disable_weave_score_ui",
	category = "Player mechanics"
}
settings[445] = {
	setting_name = "Add legend end of level chest.",
	description = "Works on non-local backend. Adds a legend vault",
	category = "Progression",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		options[#options + 1] = "tier_1"
		options[#options + 1] = "tier_2"
		options[#options + 1] = "tier_3"
		options[#options + 1] = "tier_4"
		options[#options + 1] = "tier_5"

		table.sort(options)
	end,
	func = function (options, index)
		local item = options[index]
		local loot_interface = Managers.backend:get_interface("loot")
		local player = Managers.player:local_player()
		local display_name = SPProfiles[player:profile_index()].display_name
		local loot_profile_name = "default"

		if item == "tier_1" then
			local end_of_level_rewards_arguments = {
				chest_upgrade_data = {
					grimoire = 0,
					tome = 0,
					game_won = true,
					loot_dice = 0
				}
			}

			loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", display_name, 0, 0, loot_profile_name, nil, nil, "adventure", 0, end_of_level_rewards_arguments)
		elseif item == "tier_2" then
			local end_of_level_rewards_arguments = {
				chest_upgrade_data = {
					grimoire = 0,
					tome = 2,
					game_won = true,
					loot_dice = 0
				}
			}

			loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", display_name, 0, 0, loot_profile_name, nil, nil, "adventure", 0, end_of_level_rewards_arguments)
		elseif item == "tier_3" then
			local end_of_level_rewards_arguments = {
				chest_upgrade_data = {
					grimoire = 1,
					tome = 2,
					game_won = true,
					loot_dice = 0
				}
			}

			loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", display_name, 0, 0, loot_profile_name, nil, nil, "adventure", 0, end_of_level_rewards_arguments)
		elseif item == "tier_4" then
			local end_of_level_rewards_arguments = {
				chest_upgrade_data = {
					grimoire = 2,
					tome = 2,
					game_won = true,
					loot_dice = 1
				}
			}

			loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", display_name, 0, 0, loot_profile_name, nil, nil, "adventure", 0, end_of_level_rewards_arguments)
		elseif item == "tier_5" then
			local end_of_level_rewards_arguments = {
				chest_upgrade_data = {
					grimoire = 3,
					tome = 2,
					game_won = true,
					loot_dice = 4
				}
			}

			loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", display_name, 0, 0, loot_profile_name, nil, nil, "adventure", 0, end_of_level_rewards_arguments)
		end
	end
}
settings[446] = {
	description = "Lists all items with functionality to add them to inventory.",
	setting_name = "Add Hat Items",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local item_master_list = ItemMasterList

		for key, item in pairs(item_master_list) do
			if item.slot_type == "hat" then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local item_interface = Managers.backend:get_interface("items")
		local item = options[index]

		add_items({
			{
				ItemName = item
			}
		})
	end
}
settings[447] = {
	description = "Adds all hat items to your inventory.",
	setting_name = "Add All Hat Items",
	category = "Items",
	func = function ()
		local item_master_list = ItemMasterList
		local hats = {}

		for key, item in pairs(item_master_list) do
			if item.slot_type == "hat" then
				hats[#hats + 1] = {
					ItemName = key
				}
			end
		end

		local skip_autosave = true

		add_items(hats, skip_autosave)
	end
}
settings[448] = {
	description = "Lists all items with functionality to add them to inventory.",
	setting_name = "Add Skin Items",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local item_master_list = ItemMasterList

		for key, item in pairs(item_master_list) do
			if item.slot_type == "skin" then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local item_interface = Managers.backend:get_interface("items")
		local item = options[index]

		add_items({
			{
				ItemName = item
			}
		})
	end
}
settings[449] = {
	description = "Lists all items with functionality to add them to inventory.",
	setting_name = "Add Chest Items",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local item_master_list = ItemMasterList

		for key, item in pairs(item_master_list) do
			if item.slot_type == "loot_chest" then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local item_interface = Managers.backend:get_interface("items")
		local item = options[index]

		add_items({
			{
				ItemName = item
			}
		})
	end
}
settings[450] = {
	description = "Lists all items with functionality to add them to inventory.",
	setting_name = "Add Frame Items",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local item_master_list = ItemMasterList

		for key, item in pairs(item_master_list) do
			if item.slot_type == "frame" then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local item_interface = Managers.backend:get_interface("items")
		local item = options[index]

		add_items({
			{
				ItemName = item
			}
		})
	end
}
settings[451] = {
	description = "Lists all deeds with functionality to add them to inventory.",
	setting_name = "Add Deed Items",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		local item_master_list = ItemMasterList

		for key, item in pairs(item_master_list) do
			if item.slot_type == "deed" then
				options[#options + 1] = key
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		local item_interface = Managers.backend:get_interface("items")
		local item = options[index]

		add_items({
			{
				ItemName = item
			}
		})
	end
}
settings[452] = {
	description = "Adds one weapon per skin with that skin applied.",
	setting_name = "Add All Weapon Skins",
	category = "Items",
	func = function ()
		local item_master_list = ItemMasterList
		local weapon_skins = WeaponSkins
		local item_interface = Managers.backend:get_interface("items")
		local added_skins = {}
		local weapons_to_add = {}

		for key, item in pairs(item_master_list) do
			local slot_type = item.slot_type
			local skin_combination = item.skin_combination_table

			if (slot_type == "melee" or slot_type == "ranged") and skin_combination and item.rarity ~= "magic" then
				local skin_combinations_by_rarity = weapon_skins.skin_combinations[skin_combination]

				for rarity, skins in pairs(skin_combinations_by_rarity) do
					for _, skin_name in ipairs(skins) do
						if not added_skins[skin_name] then
							added_skins[skin_name] = true
							weapons_to_add[#weapons_to_add + 1] = {
								ItemName = key,
								CustomData = {
									skin = skin_name
								}
							}
						end
					end
				end
			end
		end

		local backend_mirror = Managers.backend._backend_mirror
		local request = {
			FunctionName = "devUnlockAllWeaponSkins",
			FunctionParameter = {}
		}
		local skip_autosave = true

		local function cb(result)
			add_items(weapons_to_add, skip_autosave)
		end

		local request_queue = backend_mirror:request_queue()

		request_queue:enqueue(request, cb, false)
	end
}
settings[453] = {
	description = "Lists all mutators with functionality to activate them. Requires restart of level",
	setting_name = "Activate or Deactivate Mutator",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for key, _ in pairs(MutatorTemplates) do
			options[#options + 1] = key
		end

		table.sort(options)
	end,
	func = function (options, index)
		local activated_mutators = script_data.debug_activated_mutators or {}
		local key = options[index]
		local mutator_deactivation_index = nil

		for i = 1, #activated_mutators do
			if activated_mutators[i] == key then
				mutator_deactivation_index = i
			end
		end

		if mutator_deactivation_index then
			table.remove(activated_mutators, mutator_deactivation_index)
			Debug.sticky_text("Deactivated mutator %s", key)
		else
			activated_mutators[#activated_mutators + 1] = key

			Debug.sticky_text("Activated mutator %s", key)
		end

		if #activated_mutators > 0 then
			script_data.debug_activated_mutators = activated_mutators
		else
			script_data.debug_activated_mutators = nil
		end
	end
}
settings[454] = {
	description = "Lists all blessings with functionality to activate them. Requires restart of a deus level or loading the next one",
	setting_name = "Activate or Deactivate Blessings",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for key, _ in pairs(DeusBlessingSettings) do
			options[#options + 1] = key
		end

		table.sort(options)
	end,
	func = function (options, index)
		local activated_blessings = script_data.debug_activated_blessings or {}
		local key = options[index]
		local blessing_deactivation_index = nil

		for i = 1, #activated_blessings do
			if activated_blessings[i] == key then
				blessing_deactivation_index = i
			end
		end

		if blessing_deactivation_index then
			table.remove(activated_blessings, blessing_deactivation_index)
			Debug.sticky_text("Deactivated blessing %s", key)
		else
			activated_blessings[#activated_blessings + 1] = key

			Debug.sticky_text("Activated blessing %s", key)
		end

		if #activated_blessings > 0 then
			script_data.debug_activated_blessings = activated_blessings
		else
			script_data.debug_activated_blessings = nil
		end
	end
}
settings[455] = {
	description = "Lists all Twitch Mode Vote Templates with functionality to activate them.",
	setting_name = "Force Twitch Mode Vote Template",
	category = "Items",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for key, _ in pairs(TwitchVoteTemplates) do
			options[#options + 1] = key
		end

		options[#options + 1] = "clear_votes"

		table.sort(options)
	end,
	func = function (options, index)
		local forced_templates = script_data.debug_activated_mutators or {}
		local key = options[index]

		if key == "clear_votes" then
			script_data.twitch_mode_force_vote_template = nil
		else
			local vote_template = TwitchVoteTemplates[key]
			script_data.twitch_mode_force_vote_template = vote_template
		end
	end
}
settings[456] = {
	description = "Show all paintings etc. You have to reload the inn for the setting to take effect.",
	is_boolean = true,
	setting_name = "debug_keep_decorations",
	category = "Keep Decorations"
}
settings[457] = {
	description = "Unlocks a Challenge by setting by incrementing the appropriate statistics.",
	setting_name = "Unlock Challenges",
	category = "Progression",
	clear_when_selected = true,
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for id, achievement in pairs(AchievementTemplates.achievements) do
			if achievement.debug_unlock then
				table.insert(options, id)
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		if AchievementTemplates then
			local template = AchievementTemplates.achievements[options[index]]

			if template ~= nil then
				if template.debug_unlock then
					local stats_db = Managers.state.game_mode.statistics_db
					local stats_id = Managers.player:local_player():stats_id()

					if stats_db and stats_id then
						template.debug_unlock(stats_db, stats_id)
						print("Unlocked challenge ", options[index])

						local world = Managers.world:world("level_world")

						LevelHelper:flow_event(world, "lua_unlock_challenge_debug_event")
						save_statistics()

						return
					end
				else
					print("Missing 'debug_unlock' on challenge")
				end
			end
		end

		print("Could not unlock challenge ", options[index])
	end
}
settings[458] = {
	description = "Clears a Challenge by setting the appropriate statistics to 0.",
	setting_name = "Clear Challenges",
	category = "Progression",
	clear_when_selected = true,
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for id, achievement in pairs(AchievementTemplates.achievements) do
			if achievement.debug_reset then
				table.insert(options, id)
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		if AchievementTemplates then
			local template = AchievementTemplates.achievements[options[index]]

			if template ~= nil then
				if template.debug_reset then
					local stats_db = Managers.state.game_mode.statistics_db
					local stats_id = Managers.player:local_player():stats_id()

					if stats_db and stats_id then
						template.debug_reset(stats_db, stats_id)
						print("Reset challenge ", options[index])
						save_statistics()

						return
					end
				else
					print("Missing 'debug_reset' function")
				end
			end
		end

		print("Could not reset challenge ", options[index])
	end
}
settings[459] = {
	description = "Sets all Okris challenges to be claimable in the UI",
	is_boolean = true,
	setting_name = "set_all_challenges_claimable",
	category = "Progression"
}
settings[460] = {
	description = "Draws debug information for each active objective",
	is_boolean = true,
	setting_name = "show_weave_objectives",
	category = "Gamemode/level"
}
settings[461] = {
	description = "Activates all objectives for the current weave",
	setting_name = "activate_all_weave_objectives",
	category = "Gamemode/level",
	func = function ()
		local world = Managers.world:world("level_world")
		local units = World.units(world)
		local objectives = {}

		for _, unit in ipairs(units) do
			if not Unit.is_frozen(unit) then
				local name = Unit.debug_name(unit)

				if name:match(".*weave_capture_point_spawner") or name:match(".*weave_interaction_spawner") or name:match(".*weave_prop_skaven_doom_wheel_01_spawner") or name:match(".*weave_limited_item_track_spawner") then
					local objective_id = Unit.get_data(unit, "weave_objective_id")
					local i = #NetworkLookup.weave_objective_names + 1
					NetworkLookup.weave_objective_names[i] = objective_id
					NetworkLookup.weave_objective_names[objective_id] = i
					objectives[objective_id] = {}

					print(name)
				end
			end
		end

		local i = #NetworkLookup.weave_objective_names + 1
		NetworkLookup.weave_objective_names[i] = "kill_enemies"
		NetworkLookup.weave_objective_names.kill_enemies = i
		objectives.kill_enemies = {}
		local weave_objective_system = Managers.state.entity:system("weave_objective_system")

		weave_objective_system:activate_objectives({
			objectives
		})
	end
}
settings[462] = {
	description = "Use the standard loadout in weaves (requires restart)",
	is_boolean = true,
	setting_name = "disable_weave_loadout",
	category = "Player mechanics"
}
settings[463] = {
	description = "Use the standard talents in weaves (requires restart)",
	is_boolean = true,
	setting_name = "disable_weave_talents",
	category = "Player mechanics"
}
settings[464] = {
	description = "Adds 10 Weave Essence to your account",
	setting_name = "10 Weave Essence",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_grant_essence(10)
	end
}
settings[465] = {
	description = "Adds 100 Weave Essence to your account",
	setting_name = "100 Weave Essence",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_grant_essence(100)
	end
}
settings[466] = {
	description = "Adds 1000 Weave Essence to your account",
	setting_name = "1,000 Weave Essence",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_grant_essence(1000)
	end
}
settings[467] = {
	description = "Adds 10000 Weave Essence to your account",
	setting_name = "10,000 Weave Essence",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_grant_essence(10000)
	end
}
settings[468] = {
	description = "Adds $$$ ONE MILLION $$$ Weave Essence to your account",
	setting_name = "1,000,000 Weave Essence",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_grant_essence(1000000)
	end
}
settings[469] = {
	description = "Removes all magic weave weapons from the inventory except for default weapons equipped ones",
	setting_name = "Remove Magic Weave Weapons",
	category = "Gamemode/level",
	func = function ()
		Managers.backend:get_interface("weaves"):debug_remove_magic_items()
	end
}
settings[470] = {
	setting_name = "Weave Onboarding",
	description = "change onboarding stat",
	category = "Onboarding",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		options[#options + 1] = "1"
		options[#options + 1] = "2"
		options[#options + 1] = "3"
		options[#options + 1] = "4"
		options[#options + 1] = "5"
		options[#options + 1] = "6"
		options[#options + 1] = "7"
		options[#options + 1] = "8"
		options[#options + 1] = "9"
		options[#options + 1] = "clear"

		table.sort(options)
	end,
	func = function (options, index)
		local chosen_state = options[index]
		local statistics_db = Managers.player:statistics_db()
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		if chosen_state == "clear" then
			statistics_db:set_stat(stats_id, "scorpion_onboarding_step", 0)
		else
			statistics_db:set_stat(stats_id, "scorpion_onboarding_step", tonumber(chosen_state))
		end

		save_statistics()
	end
}
settings[471] = {
	description = "complete the weave onboarding ui tutorial",
	setting_name = "Weave Onboarding UI",
	category = "Onboarding",
	func = function ()
		local statistics_db = Managers.player:statistics_db()
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		statistics_db:set_stat(stats_id, "scorpion_ui_onboarding_state", -1)
		save_statistics()
	end
}
settings[472] = {
	description = "resets weave onboarding ui tutorial",
	setting_name = "Weave Onboarding UI Reset",
	category = "Onboarding",
	func = function ()
		local statistics_db = Managers.player:statistics_db()
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		statistics_db:set_stat(stats_id, "scorpion_ui_onboarding_state", 0)
		save_statistics()
	end
}
settings[473] = {
	description = "resets the flag keeps track of Olesya's VO that is played when player first fails a weave.",
	setting_name = "Clear Olesya Failed VO Played Flag ",
	category = "Onboarding",
	func = function ()
		local statistics_db = Managers.player:statistics_db()
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()

		statistics_db:set_stat(stats_id, "scorpion_onboarding_weave_first_fail_vo_played", 0)
		save_statistics()
	end
}
settings[474] = {
	description = "Will make it so \"first_time_store_release\" is always triggered when players start the game and enter the keep",
	is_boolean = true,
	setting_name = "always_first_time_store_release",
	category = "Onboarding"
}
settings[475] = {
	description = "Will make it so \"store_new_items\" is always triggered when players start the game and enter the keep",
	is_boolean = true,
	setting_name = "always_store_new_items",
	category = "Onboarding"
}
settings[476] = {
	description = "Will make it so \"shop_closed_item_bought\" is always triggered when players close the store. Exclusive with other \"shop_closed\" events",
	is_boolean = true,
	setting_name = "always_shop_closed_item_bought",
	category = "Onboarding"
}
settings[477] = {
	description = "Will make it so \"shop_closed_golden_key_redeemed\" is always triggered when players close the store. Exclusive with other \"shop_closed\" events",
	is_boolean = true,
	setting_name = "always_shop_closed_golden_key_redeemed",
	category = "Onboarding"
}
settings[478] = {
	description = "Will make it so \"shop_closed_login_reward_claimed\" is always triggered when players close the store. Exclusive with other \"shop_closed\" events",
	is_boolean = true,
	setting_name = "always_shop_closed_login_reward_claimed",
	category = "Onboarding"
}
settings[479] = {
	description = "Trigger the \"first_time_store_release\" level flow event",
	setting_name = "Trigger \"first_time_store_release\"",
	category = "Onboarding",
	func = function ()
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "first_time_store_release")
	end
}
settings[480] = {
	description = "Trigger the \"store_new_items\" level flow event",
	setting_name = "Trigger \"store_new_items\"",
	category = "Onboarding",
	func = function ()
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "store_new_items")
	end
}
settings[481] = {
	description = "Trigger the \"first_time_started_game\" level flow event",
	setting_name = "Trigger \"first_time_started_game\"",
	category = "Onboarding",
	func = function ()
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "first_time_started_game")
	end
}
settings[482] = {
	description = "Disregard the store items set by the backend",
	is_boolean = true,
	setting_name = "disregard_backend_store_items",
	category = "Store"
}
settings[483] = {
	description = "Prints out the current discounted items on screen",
	is_boolean = true,
	setting_name = "show_discounted_store_items",
	category = "Store"
}
settings[484] = {
	description = "Randomizes a bunch of items on sale",
	is_boolean = true,
	setting_name = "fake_store_sale",
	category = "Store"
}
settings[485] = {
	description = "Count owned DLCs as installed. Makes it easier to test DLCs through steam console with enable/disable_license",
	is_boolean = true,
	setting_name = "count_owned_dlc_as_installed",
	category = "DLC"
}
settings[486] = {
	description = "Displays the diorama prototype",
	close_when_selected = true,
	setting_name = "Run Diorama Prototype",
	category = "Diorama",
	func = function ()
		Managers.ui:handle_transition("diorama_prototype", {})
	end
}
settings[487] = {
	description = "Starts a Deus run directly on a map",
	setting_name = "Run Deus Map Node",
	category = "Deus",
	func = function ()
		local mechanism = Managers.mechanism:game_mechanism()

		if mechanism.debug_load_map then
			mechanism:debug_load_map()
		end
	end
}
settings[488] = {
	description = "Starts a Deus run directly on a shrine",
	setting_name = "Run Deus Shrine Node",
	category = "Deus",
	func = function ()
		local mechanism = Managers.mechanism:game_mechanism()

		if mechanism.debug_load_shrine_node then
			mechanism:debug_load_shrine_node()
		end
	end
}
settings[489] = {
	description = "Clears a finished a journey",
	setting_name = "Clear Finished Journey",
	category = "Deus",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for name, settings in pairs(DeusJourneySettings) do
			options[#options + 1] = name
		end

		table.sort(options)
	end,
	func = function (options, index)
		local journey = options[index]

		LevelUnlockUtils.debug_set_completed_journey_difficulty(journey, 0)
	end
}
settings[490] = {
	description = "Sets the completed difficulty for the selected journey temporary.",
	setting_name = "Set completed journey difficulty",
	category = "Deus",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for _, journey_name in ipairs(AvailableJourneyOrder) do
			for _, difficulty_name in ipairs(DefaultDifficulties) do
				options[#options + 1] = journey_name .. "/" .. difficulty_name
			end
		end
	end,
	func = function (options, index)
		local journey_and_difficulty = string.split(options[index], "/")
		local journey_name = journey_and_difficulty[1]
		local difficulty_name = journey_and_difficulty[2]
		local difficulty_id = table.index_of(DefaultDifficulties, difficulty_name)

		LevelUnlockUtils.debug_set_completed_journey_difficulty(journey_name, difficulty_id)
	end
}
settings[491] = {
	description = "Sets the hero completed difficulty for the selected journey temporary.",
	setting_name = "Set completed hero journey difficulty",
	category = "Deus",
	item_source = {},
	load_items_source_func = function (options)
		local journey_name = "journey_citadel"

		table.clear(options)

		for _, hero in ipairs(SPProfilesAbbreviation) do
			for _, difficulty_name in ipairs(DefaultDifficulties) do
				options[#options + 1] = hero .. "/" .. journey_name .. "/" .. difficulty_name
			end
		end
	end,
	func = function (options, index)
		local hero_journey_and_difficulty = string.split(options[index], "/")
		local hero = hero_journey_and_difficulty[1]
		local journey_name = hero_journey_and_difficulty[2]
		local difficulty_name = hero_journey_and_difficulty[3]
		local difficulty_id = table.index_of(DefaultDifficulties, difficulty_name)

		LevelUnlockUtils.debug_set_completed_hero_journey_difficulty(hero, journey_name, difficulty_id)
	end
}
settings[492] = {
	description = "Clears all deus meta progression, which is just rolled over coins at the moment.",
	setting_name = "Clear Deus meta progression",
	category = "Deus",
	func = function ()
		local deus_interface = Managers.backend:get_interface("deus")

		deus_interface:debug_clear_meta_progression()
	end
}
settings[493] = {
	description = "Lists all powerups with functionality to activate them. Needs to be in a deus run.",
	setting_name = "Activate Deus PowerUp",
	category = "Deus",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for rarity, powerups_for_rarity in pairs(DeusPowerUps) do
			for power_up_name, powerup in pairs(powerups_for_rarity) do
				options[#options + 1] = rarity .. "/" .. power_up_name
			end
		end

		table.sort(options)
	end,
	func = function (options, index)
		if not Managers.mechanism:current_mechanism_name() == "deus" then
			return
		end

		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()

		if not deus_run_controller then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_id = local_player:local_player_id()
		local option = options[index]
		local rarity_and_power_up_name = string.split(option, "/")
		local rarity = rarity_and_power_up_name[1]
		local power_up_name = rarity_and_power_up_name[2]
		local existing_power_ups = deus_run_controller:get_player_power_ups(local_player.peer_id, local_player_id)
		local already_added = nil

		for _, existing_power_up in ipairs(existing_power_ups) do
			if existing_power_up.name == power_up_name then
				already_added = true

				break
			end
		end

		if not already_added then
			local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, rarity)

			deus_run_controller:add_power_ups({
				power_up
			}, local_player_id)

			local local_player_unit = local_player.player_unit

			if local_player_unit then
				local buff_system = Managers.state.entity:system("buff_system")
				local talent_interface = Managers.backend:get_talents_interface()
				local deus_backend = Managers.backend:get_interface("deus")
				local profile_index = local_player:profile_index()
				local career_index = local_player:career_index()

				DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, deus_run_controller, local_player_unit, profile_index, career_index)
			end
		end
	end
}
settings[494] = {
	description = "Adds 10.000 deus soft currency",
	setting_name = "add_soft_currency",
	category = "Deus",
	func = function (options, index)
		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local own_peer_id = deus_run_controller._run_state:get_own_peer_id()

		deus_run_controller:_add_soft_currency_to_peer(own_peer_id, 10000)
	end
}
settings[495] = {
	description = "Adds a random boon, the type obtained from boon shrines",
	setting_name = "add_random_boon",
	category = "Deus",
	func = function (options, index)
		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local power_ups = deus_run_controller:generate_random_power_ups(DeusPowerUpSettings.weapon_chest_choice_amount, DeusPowerUpAvailabilityTypes.weapon_chest, math.random_seed())
		local power_up = power_ups[1]
		local local_player = Managers.player:local_player()
		local local_player_id = local_player:local_player_id()

		deus_run_controller:add_power_ups({
			power_up
		}, local_player_id)

		local buff_system = Managers.state.entity:system("buff_system")
		local talent_interface = Managers.backend:get_talents_interface()
		local deus_backend = Managers.backend:get_interface("deus")
		local player_unit = local_player.player_unit
		local profile_index = local_player:profile_index()
		local career_index = local_player:career_index()

		DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, deus_run_controller, player_unit, profile_index, career_index)
		Managers.state.event:trigger("present_rewards", {
			{
				type = "deus_power_up",
				power_up = power_up
			}
		})
	end
}
settings[496] = {
	description = "Activates all non talent Deus PowerUps ",
	setting_name = "Activate all non talent Deus PowerUps",
	category = "Deus",
	item_source = {},
	func = function (options, index)
		if not Managers.mechanism:current_mechanism_name() == "deus" then
			return
		end

		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()

		if not deus_run_controller then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_id = local_player:local_player_id()
		local local_peer_id = local_player:network_id()
		local buff_system = Managers.state.entity:system("buff_system")
		local talent_interface = Managers.backend:get_talents_interface()
		local deus_backend = Managers.backend:get_interface("deus")
		local local_player_unit = local_player.player_unit
		local profile_index = local_player:profile_index()
		local career_index = local_player:career_index()
		local existing_power_ups = deus_run_controller:get_player_power_ups(local_peer_id, local_player_id)

		for rarity, power_ups_for_rarity in pairs(DeusPowerUps) do
			for power_up_name, power_up in pairs(power_ups_for_rarity) do
				if not power_up.talent then
					local already_added = nil

					for _, existing_power_up in ipairs(existing_power_ups) do
						if existing_power_up.name == power_up_name then
							already_added = true

							break
						end
					end

					if not already_added then
						local power_up = DeusPowerUpUtils.generate_specific_power_up(power_up_name, rarity)

						deus_run_controller:add_power_ups({
							power_up
						}, local_player_id)
						DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, deus_run_controller, local_player_unit, profile_index, career_index)
					end
				end
			end
		end
	end
}
settings[497] = {
	description = "Draw the positions of the weapons as a path",
	setting_name = "Draw Weapon Position",
	category = "Weapons",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)
		table.insert(options, "all")
		table.insert(options, "right_hand")
		table.insert(options, "left_hand")
		table.insert(options, "right_hand_ammo")
		table.insert(options, "left_hand_ammo")
		table.insert(options, "[clear value]")
		table.sort(options)
	end,
	func = function (options, index)
		script_data.debug_draw_weapon_position = options[index]
	end
}
settings[498] = {
	description = "Unlocks every deus chest aka weapon shrine",
	is_boolean = true,
	setting_name = "unlock_all_deus_chests",
	category = "Deus"
}
settings[499] = {
	description = "debug any changes to the deus shared state.",
	is_boolean = true,
	setting_name = "shared_state_debug",
	category = "Deus"
}
settings[500] = {
	description = "log any relevant event in the deus run controller.",
	is_boolean = true,
	setting_name = "deus_run_controller_debug",
	category = "Deus"
}
settings[501] = {
	description = "draw a map with debug ui. This will draw either the current run seed being played, or the seed set by imgui_deus_map_gen",
	is_boolean = true,
	setting_name = "deus_debug_draw_map",
	category = "Deus"
}
settings[502] = {
	description = "test fog without saving already seen nodes, essentially everything not accessed is fully foggy",
	is_boolean = true,
	setting_name = "deus_fog_with_no_memory",
	category = "Deus"
}
settings[503] = {
	setting_name = "deus_force_load_run_progress",
	category = "Deus",
	description = "override the run progress when using this menu's load level. 900 == 0.9 ",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for i = 0, 999, 10 do
			options[#options + 1] = i
		end

		table.sort(options)

		options[#options + 1] = "[clear value]"
	end
}
settings[504] = {
	setting_name = "deus_seed",
	category = "Deus",
	description = "Force a default graph seed",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for key, _ in pairs(DeusDefaultGraphs) do
			options[#options + 1] = key
		end

		options[#options + 1] = "[clear value]"

		table.sort(options)
	end
}
settings[505] = {
	setting_name = "deus_journey",
	category = "Deus",
	description = "Force a deus journey",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for _, val in pairs(AvailableJourneyOrder) do
			options[#options + 1] = val
		end

		options[#options + 1] = "[clear value]"

		table.sort(options)
	end
}
settings[506] = {
	setting_name = "deus_dominant_god",
	category = "Deus",
	description = "Force a deus dominant god",
	item_source = {},
	load_items_source_func = function (options)
		table.clear(options)

		for _, val in pairs(DEUS_GOD_INDEX) do
			options[#options + 1] = val
		end

		options[#options + 1] = "[clear value]"

		table.sort(options)
	end
}
settings[507] = {
	description = "Journeys will work in 10minute cycles for debugging. Only works in local backend.",
	is_boolean = true,
	setting_name = "deus_journey_ten_minute_cycle",
	category = "Deus"
}
settings[508] = {
	description = "Shows how many enemies are marked by a curse",
	is_boolean = true,
	setting_name = "debug_deus_marked_enemies",
	category = "Deus"
}
settings[509] = {
	description = "Check how the curse UI looks with all the different curses. Use left shift + q in order to cycle all the variations",
	is_boolean = true,
	setting_name = "deus_curse_ui",
	category = "Deus"
}
settings[510] = {
	description = "Requires a restart/loading the next level/switching career. Unlocks all weapons in the pool used for generating random weapon at reliquaries.",
	is_boolean = true,
	setting_name = "deus_full_weapon_pool",
	category = "Deus"
}
settings[511] = {
	description = "When active the next run you will start will consist only of shops (except start node and arena)",
	is_boolean = true,
	setting_name = "deus_shoppify_run",
	category = "Deus"
}
settings[512] = {
	description = "Force only the new boons to be in the pool",
	is_boolean = true,
	setting_name = "belakor_force_new_boons",
	category = "Deus"
}
settings[513] = {
	description = "Force a specific map layout on the belakor journey for the vertical slice build",
	is_boolean = true,
	setting_name = "belakor_force_vertical_slice_seed",
	category = "Deus"
}
settings[514] = {
	description = "Forces all levels to be cursed by belakor where applicable",
	is_boolean = true,
	setting_name = "belakor_force_curses_on_map",
	category = "Deus"
}
settings[515] = {
	description = "Hides the belakor journey from the UI",
	is_boolean = true,
	setting_name = "belakor_hide_journey",
	category = "Deus"
}
settings[516] = {
	description = "While playing a belakor level, all possible positions for a Locus will be occupied by one",
	is_boolean = true,
	setting_name = "belakor_force_locus_on_all_positions",
	category = "Deus"
}
settings[517] = {
	description = "Primes your user setting to trigger the new UI popup",
	category = "New UI Popup",
	setting_name = "Activate New Popup UI Prompt",
	func = function ()
		Application.set_user_setting("use_pc_menu_layout", false)
		Application.set_user_setting("use_gamepad_menu_layout", false)
		Managers.save:auto_save(SaveFileName, SaveData)
		Application.save_user_settings()
	end
}
settings[518] = {
	description = "",
	setting_name = "Number of Crafted Items",
	category = "Crafting",
	item_source = {
		0,
		10,
		20,
		30,
		40,
		50,
		60,
		70,
		80,
		90,
		100,
		200,
		300,
		400,
		500,
		600,
		700,
		800,
		900,
		1000,
		2000,
		3000,
		4000,
		5000
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end,
	func = function (options, index)
		local option = options[index]

		Managers.state.crafting:debug_set_crafted_items_stat(option)
	end
}
settings[519] = {
	description = "",
	setting_name = "Number of Salvaged Items",
	category = "Crafting",
	item_source = {
		0,
		10,
		20,
		30,
		40,
		50,
		60,
		70,
		80,
		90,
		100,
		200,
		300,
		400,
		500,
		600,
		700,
		800,
		900,
		1000,
		2000,
		3000,
		4000,
		5000
	},
	custom_item_source_order = function (item_source, options)
		for _, v in ipairs(item_source) do
			local option = v
			options[#options + 1] = option
		end
	end,
	func = function (options, index)
		local option = options[index]

		Managers.state.crafting:debug_set_salvaged_items_stat(option)
	end
}
settings[520] = {
	description = "Debug crafting crafting recipes",
	is_boolean = true,
	setting_name = "craft_recipe_debug",
	category = "Crafting"
}

local function add_melee_preset(rarity)
	return {
		{
			description = "Lists all items with functionality to add them to inventory.",
			category = "Items",
			setting_name = "Add Melee Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				local item_master_list = ItemMasterList

				for key, item in pairs(item_master_list) do
					if item.slot_type == "melee" then
						options[#options + 1] = key
					end
				end

				table.sort(options)
			end,
			func = function (options, index)
				local item_interface = Managers.backend:get_interface("items")
				local item = options[index]

				if item then
					item_interface:award_item(item, nil, nil, rarity)
				end
			end
		}
	}
end

local function add_ranged_preset(rarity)
	return {
		{
			description = "Lists all items with functionality to add them to inventory.",
			category = "Items",
			setting_name = "Add Ranged Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				local item_master_list = ItemMasterList

				for key, item in pairs(item_master_list) do
					if item.slot_type == "ranged" then
						options[#options + 1] = key
					end
				end

				table.sort(options)
			end,
			func = function (options, index)
				local item_interface = Managers.backend:get_interface("items")
				local item = options[index]

				if item then
					item_interface:award_item(item, nil, nil, rarity)
				end
			end
		}
	}
end

local function add_ring_preset(rarity)
	return {
		{
			description = "Lists all items with functionality to add them to inventory.",
			category = "Items",
			setting_name = "Add Ring Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				local item_master_list = ItemMasterList

				for key, item in pairs(item_master_list) do
					if item.slot_type == "ring" then
						options[#options + 1] = key
					end
				end

				table.sort(options)
			end,
			func = function (options, index)
				local item_interface = Managers.backend:get_interface("items")
				local item = options[index]

				if item then
					item_interface:award_item(item, nil, nil, rarity)
				end
			end
		}
	}
end

local function add_necklace_preset(rarity)
	return {
		{
			no_nil = true,
			description = "Lists all items with functionality to add them to inventory.",
			category = "Items",
			setting_name = "Add Necklace Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				local item_master_list = ItemMasterList

				for key, item in pairs(item_master_list) do
					if item.slot_type == "necklace" then
						options[#options + 1] = key
					end
				end

				table.sort(options)
			end,
			func = function (options, index)
				local item_interface = Managers.backend:get_interface("items")
				local item = options[index]

				if item then
					item_interface:award_item(item, nil, nil, rarity)
				end
			end
		}
	}
end

local function add_trinket_preset(rarity)
	return {
		{
			description = "Lists all items with functionality to add them to inventory.",
			category = "Items",
			setting_name = "Add Trinket Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				local item_master_list = ItemMasterList

				for key, item in pairs(item_master_list) do
					if item.slot_type == "trinket" then
						options[#options + 1] = key
					end
				end

				table.sort(options)
			end,
			func = function (options, index)
				local item_interface = Managers.backend:get_interface("items")
				local item = options[index]

				if item then
					item_interface:award_item(item, nil, nil, rarity)
				end
			end
		}
	}
end

local item_rarities = {
	"plentiful",
	"common",
	"rare",
	"exotic",
	"unique"
}

for _, rarity in ipairs(item_rarities) do
	table.append(settings, add_melee_preset(rarity))
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, add_ranged_preset(rarity))
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, add_ring_preset(rarity))
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, add_necklace_preset(rarity))
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, add_trinket_preset(rarity))
end

local function equip_preset(slot_type, rarity)
	local function load_items_preset(options)
		table.clear(options)

		local player_manager = Managers.player
		local player = player_manager:local_player()
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local career_index = player:career_index()
		local career_data = profile.careers[career_index]
		local career_name = career_data.name
		local item_master_list = ItemMasterList
		local backend_common = Managers.backend:get_interface("common")

		for item_name, item_data in pairs(item_master_list) do
			if item_data.slot_type == slot_type and backend_common:can_wield(career_name, item_data) then
				options[#options + 1] = item_name
			end
		end

		table.sort(options)
	end

	local function equip_item_preset(options, index)
		local item_name = options[index]

		if not item_name then
			return
		end

		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_key(item_name)

		if not item then
			item_interface:award_item(item_name, nil, nil, rarity)

			item = item_interface:get_item_from_key(item_name)
		end

		if not item then
			return
		end

		local item_data = ItemMasterList[item_name]
		local player_manager = Managers.player
		local player = player_manager:local_player()
		local player_unit = player.player_unit
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		local resyncing_loadout = inventory_extension:resyncing_loadout()

		if resyncing_loadout then
			return
		end

		local backend_id = item.backend_id
		local slot_type = item_data.slot_type
		local slots = InventorySettings.slots_by_slot_index
		local slot_name = nil

		for _, slot in pairs(slots) do
			if slot_type == slot.type then
				slot_name = slot.name

				break
			end
		end

		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name
		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local career_index = hero_attributes:get(display_name, "career")
		local career_data = profile.careers[career_index]
		local career_name = career_data.name

		BackendUtils.set_loadout_item(backend_id, career_name, slot_name)
		inventory_extension:create_equipment_in_slot(slot_name, backend_id)
	end

	return {
		{
			description = "Lists all items for current career to equip them, adding to inventory if necessary.",
			category = "Items",
			setting_name = "Equip " .. slot_type .. " Items (" .. rarity .. ")",
			item_source = {},
			load_items_source_func = load_items_preset,
			func = equip_item_preset
		}
	}
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, equip_preset("melee", rarity))
end

for _, rarity in ipairs(item_rarities) do
	table.append(settings, equip_preset("ranged", rarity))
end

local platform = PLATFORM

if IS_PS4 then
	local settings_ps4 = {
		{
			description = "Debug PSN Features",
			is_boolean = true,
			setting_name = "debug_psn",
			category = "PS4"
		}
	}

	table.append(settings, settings_ps4)
end

if IS_CONSOLE then
	local settings_console = {
		{
			setting_name = "Spawn/Unspawn",
			description = "",
			category = "Breed",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				options[1] = "Switch Breed"
				options[2] = "Spawn Breed"
				options[3] = "Spawn Group"
				options[4] = "Spawn Horde"
				options[5] = "Unspawn All Breed"
				options[6] = "Unspawn Nearby Breed"
				options[7] = "Unspawn Specials"
			end,
			func = function (options, index)
				local conflict_director = Managers.state.conflict

				if conflict_director then
					local selected_value = options[index]

					if selected_value == "Switch Breed" then
						local t = Managers.time:time("main")

						conflict_director:debug_spawn_switch_breed(t)
					elseif selected_value == "Spawn Breed" then
						local t = Managers.time:time("main")

						conflict_director:debug_spawn_breed(t)
					elseif selected_value == "Spawn Group" then
						local t = Managers.time:time("main")

						conflict_director:debug_spawn_group(t)
					elseif selected_value == "Spawn Horde" then
						conflict_director:debug_spawn_horde()
					elseif selected_value == "Unspawn All Breed" then
						conflict_director:destroy_all_units()
					elseif selected_value == "Unspawn Nearby Breed" then
						conflict_director:destroy_close_units(nil, nil, 144)
					elseif selected_value == "Unspawn Specials" then
						conflict_director:destroy_specials()
					end
				end
			end
		},
		{
			setting_name = "Set Time Scale (%)",
			description = "",
			category = "Time",
			item_source = {},
			load_items_source_func = function (options)
				table.clear(options)

				options[1] = 1
				options[2] = 50
				options[3] = 100
				options[4] = 200
			end,
			func = function (options, index)
				local debug_manager = Managers.state.debug

				if debug_manager then
					local time_scale_value = options[index]
					local time_scale_index = table.find(debug_manager.time_scale_list, time_scale_value)

					assert(time_scale_index, "[DebugScreen] Selected time scale not found in Managers.state.debug.time_scale_list")
					debug_manager:set_time_scale(time_scale_index)
				end
			end
		}
	}

	table.append(settings, settings_console)
end

for _, settings_value in pairs(settings) do
	if settings_value.preset then
		for preset_key, preset_value in pairs(settings_value.preset) do
			settings_value.description = string.format("%s¤ %s = %s \n", settings_value.description, preset_key, tostring(preset_value))
		end
	end
end

local callbacks = {
	enable_locale_cycling = function (option)
		error("Broken (for now). Use the ImguiLocalization window instead.")
	end,
	visualize_sound_occlusion = function (option)
		World.visualize_sound_occlusion()
	end,
	enable_chain_constraints = function (option)
		World.enable_chain_constraints(option)
	end,
	update_using_luajit = function (option)
		if script_data.luajit_disabled then
			jit.off()
			print("lua jit is disabled")
		else
			jit.on()
			print("lua jit is enabled")
		end
	end,
	enable_navigation_visual_debug = function (option)
		if option and not VISUAL_DEBUGGING_ENABLED and Managers.state.entity then
			VISUAL_DEBUGGING_ENABLED = true
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()

			GwNavWorld.init_visual_debug_server(nav_world, 4888)
		end
	end,
	disable_outlines = function (option)
		if Managers.state and Managers.state.entity then
			Managers.state.entity:system("outline_system"):set_disabled(option)
		end
	end
}
local data = {
	settings = settings,
	callbacks = callbacks
}

return data
