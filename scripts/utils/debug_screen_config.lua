require("scripts/utils/debug_hero_templates")

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
		setting_name = "teleport player",
		description = "Teleports the player to a portal hub element",
		category = "Allround useful stuff!",
		item_source = {},
		load_items_source_func = function (options)
			table.clear(options)

			local portals = ConflictUtils.get_teleporter_portals()

			for key, boxed_pos in pairs(portals) do
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
	},
	{
		description = "Will change the network pong timeout from 15 seconds to 10000 seconds.",
		is_boolean = true,
		setting_name = "network_timeout_really_long",
		category = "Allround useful stuff!"
	},
	{
		description = "Disables the auto-start of tutorial if it's not completed.",
		is_boolean = true,
		setting_name = "disable_tutorial_at_start",
		category = "Allround useful stuff!"
	},
	{
		description = "Will disable afk kick",
		is_boolean = true,
		setting_name = "debug_disable_afk_kick",
		category = "Allround useful stuff!"
	},
	{
		description = "Will enable gift popup debug (use F3 to spawn)",
		is_boolean = true,
		setting_name = "debug_gift_popup",
		category = "Allround useful stuff!"
	},
	{
		description = "Use LAN instead of Steam",
		is_boolean = true,
		setting_name = "use_lan_backend",
		category = "Allround useful stuff!"
	},
	{
		description = "When resetting saves, give all items",
		is_boolean = true,
		setting_name = "give_all_lan_backend_items",
		category = "Allround useful stuff!"
	},
	{
		description = "hide version info hud",
		is_boolean = true,
		setting_name = "hide_version_info",
		category = "Allround useful stuff!"
	},
	{
		description = "hide fps counter hud",
		is_boolean = true,
		setting_name = "hide_fps",
		category = "Allround useful stuff!"
	},
	{
		description = "Will change all true booleans to false, and if there are no true ones, then all will be set to nil (cleared). Press right arrow to do it!",
		category = "Allround useful stuff!",
		setting_name = "reset_settings",
		func = function ()
			DebugScreen.reset_settings()
		end
	},
	{
		description = "Requires restart. Gives you all items of a certain rarity",
		setting_name = "all_items_of_rarity",
		category = "Allround useful stuff!",
		item_source = {
			common = true,
			plentiful = true,
			rare = true,
			exotic = true
		}
	},
	{
		description = "Converts all IRC messages to a random vote",
		is_boolean = true,
		setting_name = "twitch_randomize_votes",
		category = "Twitch"
	},
	{
		description = "Allow multiple votes from the same user",
		is_boolean = true,
		setting_name = "twitch_allow_multiple_votes",
		category = "Twitch"
	},
	{
		description = "Disables the effect of the Twitch vote",
		is_boolean = true,
		setting_name = "twitch_disable_result",
		category = "Twitch"
	},
	{
		description = "Activates twitch game mode and randomized twich votes without connected to stream",
		setting_name = "twitch_debug_voting",
		category = "Twitch",
		is_boolean = true,
		func = function ()
			Managers.twitch:debug_activate_twitch_game_mode()
		end
	},
	{
		description = "",
		setting_name = "Default development settings",
		category = "Presets",
		preset = {
			skippable_cutscenes = true,
			disable_long_timesteps = true,
			use_lan_backend = true,
			network_timeout_really_long = true,
			skip_splash = true
		}
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
			ai_outside_navmesh_intervention_disabled = true,
			ai_bots_disabled = true,
			ai_specials_spawning_disabled = true,
			ai_pacing_disabled = true,
			ai_speed_run_intervention_disabled = true
		}
	},
	{
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
			ai_outside_navmesh_intervention_disabled = false,
			ai_bots_disabled = false,
			ai_specials_spawning_disabled = false,
			ai_pacing_disabled = false,
			ai_speed_run_intervention_disabled = false
		}
	},
	{
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
			ai_outside_navmesh_intervention_disabled = true,
			debug_ai_pacing = true,
			debug_player_intensity = true,
			ai_bots_disabled = true,
			ai_specials_spawning_disabled = true,
			ai_pacing_disabled = false,
			ai_rush_intervention_disabled = true,
			ai_speed_run_intervention_disabled = true
		}
	},
	{
		description = "",
		setting_name = "QA - General stuff",
		category = "Presets",
		preset = {
			debug_player_position = true,
			paste_revision_to_clipboard = true
		}
	},
	{
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
	},
	{
		description = "",
		setting_name = "QA - Player debug",
		category = "Presets",
		preset = {
			debug_interactions = true,
			debug_player_animations = true,
			debug_state_machines = true
		}
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
		description = "ctrl+F to cycle between graphs, ctrl+G to use special function in graph. (respawn level atm)",
		setting_name = "Show Graphs",
		category = "Presets",
		preset = {
			debug_player_intensity = true,
			debug_ai_pacing = true,
			ai_pacing_disabled = false
		}
	},
	{
		description = "This is used to turn off screen effects affecting the main character in case the camera is changed into a 3rd person view.",
		setting_name = "Replay Settings",
		category = "Presets",
		preset = {
			screen_space_player_camera_reactions = false,
			fade_on_camera_ai_collision = false
		}
	},
	{
		description = "This is used to restore settings after working with replays.",
		setting_name = "Non-Replay Settings",
		category = "Presets",
		preset = {
			screen_space_player_camera_reactions = true,
			fade_on_camera_ai_collision = true
		}
	},
	{
		description = "Make the player unkillable.",
		is_boolean = true,
		setting_name = "player_invincible",
		category = "Player mechanics recommended"
	},
	{
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

				local debug_text = (invisibility and "Local player is now invisible") or "Local player is now visible"

				Debug.sticky_text(debug_text)
			end
		end
	},
	{
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
	},
	{
		description = "Increases jump height and allows you to jump multiple times whilst in the air.",
		is_boolean = true,
		setting_name = "use_super_jumps",
		category = "Player mechanics recommended"
	},
	{
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
	},
	{
		description = "Show the units currently equipped in left/right hand.",
		is_boolean = true,
		setting_name = "show_equipped_weapon_units",
		category = "Player mechanics"
	},
	{
		description = "For enabling melee weapon debugging.",
		is_boolean = true,
		setting_name = "debug_weapons",
		category = "Player mechanics"
	},
	{
		description = "Damage debugging.",
		is_boolean = true,
		setting_name = "damage_debug",
		category = "Player mechanics"
	},
	{
		description = "Logs a ton of stuff, and adds a debug arrow to the knee... err.. screen.",
		is_boolean = true,
		setting_name = "camera_debug",
		category = "Player mechanics"
	},
	{
		description = "Shows area of active AreaDamageExtensions",
		is_boolean = true,
		setting_name = "debug_area_damage",
		category = "Player mechanics"
	},
	{
		description = "Enable state logging for all state machines",
		is_boolean = true,
		setting_name = "debug_state_machines",
		category = "Player mechanics"
	},
	{
		description = "Enable interactor/interactable debugging.",
		is_boolean = true,
		setting_name = "debug_interactions",
		category = "Player mechanics"
	},
	{
		description = "Disables the nice movement by silly people who need to promote themselves.",
		is_boolean = true,
		setting_name = "disable_nice_movement",
		category = "Player mechanics"
	},
	{
		description = "Disables the aim lead/rig motion",
		is_boolean = true,
		setting_name = "disable_aim_lead_rig_motion",
		category = "Player mechanics"
	},
	{
		description = "Shows debug spheres for the first rig motion",
		is_boolean = true,
		setting_name = "debug_rig_motion",
		category = "Player mechanics"
	},
	{
		description = "When enabled you will no longer get fatigued.",
		is_boolean = true,
		setting_name = "disable_fatigue_system",
		category = "Player mechanics"
	},
	{
		description = "Can always reload.",
		is_boolean = true,
		setting_name = "infinite_ammo",
		category = "Player mechanics"
	},
	{
		description = "Activated ability cooldowns set to 5 seconds",
		is_boolean = true,
		setting_name = "short_ability_cooldowns",
		category = "Player mechanics"
	},
	{
		description = "Unlock all talent points - Requires Restart",
		is_boolean = true,
		setting_name = "debug_unlock_talents",
		category = "Player mechanics"
	},
	{
		description = "Enable hero stats in inventory",
		is_boolean = true,
		setting_name = "hero_statistics",
		category = "Player mechanics"
	},
	{
		description = "Enable Animation Logging In The Console For The First Person Local Player.",
		is_boolean = true,
		setting_name = "debug_player_animations",
		category = "Player mechanics"
	},
	{
		description = "Enable \"legendary\" traits for all weapons, and adds some debug prints/draws",
		is_boolean = true,
		setting_name = "debug_legendary_traits",
		category = "Player mechanics"
	},
	{
		description = "Show damage numbers above enemies heads. - Requires restart of level",
		is_boolean = true,
		setting_name = "debug_show_damage_numbers",
		category = "Player mechanics"
	},
	{
		description = "Enable Animation Logging In The Console For The Local Player.",
		is_boolean = true,
		setting_name = "debug_first_person_player_animations",
		category = "Player mechanics"
	},
	{
		description = "Visualize ledges",
		is_boolean = true,
		setting_name = "visualize_ledges",
		category = "Player mechanics"
	},
	{
		description = "Enable Buff Debug Information",
		is_boolean = true,
		setting_name = "buff_debug",
		category = "Player mechanics"
	},
	{
		description = "Disable Buff system optimization",
		is_boolean = true,
		setting_name = "buff_no_opt",
		category = "Player mechanics"
	},
	{
		description = "Enable OverCharge Debug Information",
		is_boolean = true,
		setting_name = "overcharge_debug",
		category = "Player mechanics"
	},
	{
		description = "Enable OverCharge Debug Information",
		is_boolean = true,
		setting_name = "disable_overcharge",
		category = "Player mechanics"
	},
	{
		description = "Makes it so you cant fall and hang from ledges.",
		is_boolean = true,
		setting_name = "ledge_hanging_turned_off",
		category = "Player mechanics"
	},
	{
		description = "Visualizes hang ledges positioning and rotation",
		is_boolean = true,
		setting_name = "debug_hang_ledges",
		category = "Player mechanics"
	},
	{
		description = "Makes it so you dont die when you hang from ledge and fall.",
		is_boolean = true,
		setting_name = "ledge_hanging_fall_and_die_turned_off",
		category = "Player mechanics"
	},
	{
		description = "Tutorial stuffs",
		is_boolean = true,
		setting_name = "tutorial_disabled",
		category = "Player mechanics"
	},
	{
		description = "Tutorial stuffs",
		is_boolean = true,
		setting_name = "tutorial_debug",
		category = "Player mechanics"
	},
	{
		description = "Debug statistics stuff",
		is_boolean = true,
		setting_name = "statistics_debug",
		category = "Player mechanics"
	},
	{
		description = "Debug achievements/trophies",
		is_boolean = true,
		setting_name = "achievement_debug",
		category = "Player mechanics"
	},
	{
		description = "Use debug platform for achievements",
		is_boolean = true,
		setting_name = "achievement_debug_platform",
		category = "Player mechanics"
	},
	{
		description = "RESETS all achievements/trophies",
		category = "Player mechanics",
		setting_name = "achievement_reset",
		func = function ()
			Managers.state.achievement:reset()
		end
	},
	{
		description = "Debug info for missions",
		is_boolean = true,
		setting_name = "debug_mission_system",
		category = "Player mechanics"
	},
	{
		description = "Show the player's position on the screen",
		is_boolean = true,
		setting_name = "debug_player_position",
		category = "Player mechanics"
	},
	{
		description = "Never causes critical strikes",
		is_boolean = true,
		setting_name = "no_critical_strikes",
		category = "Player mechanics"
	},
	{
		description = "Always causes critical strikes",
		is_boolean = true,
		setting_name = "always_critical_strikes",
		category = "Player mechanics"
	},
	{
		description = "Causes a critical strike every second attack",
		is_boolean = true,
		setting_name = "alternating_critical_strikes",
		category = "Player mechanics"
	},
	{
		description = "Draws debug lines to show your blocking arcs",
		is_boolean = true,
		setting_name = "debug_draw_block_arcs",
		category = "Player mechanics"
	},
	{
		description = "Draws debug lines to show your pushing arcs",
		is_boolean = true,
		setting_name = "debug_draw_push_arcs",
		category = "Player mechanics"
	},
	{
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
			1000
		},
		custom_item_source_order = function (item_source, options)
			for _, v in ipairs(item_source) do
				local option = v
				options[#options + 1] = option
			end
		end
	},
	{
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
			800,
			825,
			850,
			875,
			900,
			925,
			950,
			975,
			1000
		},
		custom_item_source_order = function (item_source, options)
			for _, v in ipairs(item_source) do
				local option = v
				options[#options + 1] = option
			end
		end
	},
	{
		description = "Show player health",
		is_boolean = true,
		setting_name = "show_player_health",
		category = "Player mechanics"
	},
	{
		description = "Enables players and bots to respawn quickly at respawn points",
		is_boolean = true,
		setting_name = "fast_respawns",
		category = "Player mechanics"
	},
	{
		description = "Disables triggering weapon animations for third person. Useful for testing new weapons. öddfg (to spite Seb)",
		is_boolean = true,
		setting_name = "disable_third_person_weapon_animation_events",
		category = "Player mechanics"
	},
	{
		description = "Will show debug lines for projectiles when true",
		is_boolean = true,
		setting_name = "debug_projectiles",
		category = "Weapons"
	},
	{
		description = "Will show debug lines for projectiles when true",
		is_boolean = true,
		setting_name = "debug_light_weight_projectiles",
		category = "Weapons"
	},
	{
		description = "Add/remove test attachments",
		is_boolean = true,
		setting_name = "attachment_debug",
		category = "Attachments"
	},
	{
		description = "Turns on chieftain spawn debug",
		is_boolean = true,
		setting_name = "ai_champion_spawn_debug",
		category = "AI recommended"
	},
	{
		description = "Disables AI spawning due to pacing.",
		is_boolean = true,
		setting_name = "ai_pacing_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables AI rush intervention (specials & hordes)",
		is_boolean = true,
		setting_name = "ai_rush_intervention_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables AI speed run intervention(specials and small hordes)",
		is_boolean = true,
		setting_name = "ai_speed_run_intervention_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables AI outside navmesh intervention (specials)",
		is_boolean = true,
		setting_name = "ai_outside_navmesh_intervention_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables AI roam spawning.",
		is_boolean = true,
		setting_name = "ai_roaming_spawning_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables AI roaming patrols spawning. (there will only be normal packs)",
		is_boolean = true,
		setting_name = "ai_roaming_patrols_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables boss/rare event spawning.",
		is_boolean = true,
		setting_name = "ai_boss_spawning_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables specials spawning",
		is_boolean = true,
		setting_name = "ai_specials_spawning_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables critter spawning",
		is_boolean = true,
		setting_name = "ai_critter_spawning_disabled",
		category = "AI recommended"
	},
	{
		description = "Disables gutter runners from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_gutter_runner",
		category = "AI recommended"
	},
	{
		description = "Disables globadiers from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_globadier",
		category = "AI recommended"
	},
	{
		description = "Disables pack masters from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_pack_master",
		category = "AI recommended"
	},
	{
		description = "Disables ratling gunners from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_ratling_gunner",
		category = "AI recommended"
	},
	{
		description = "Disables warpfire throwers from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_warpfire_thrower",
		category = "AI recommended"
	},
	{
		description = "Disables vortex sorcerers from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_vortex_sorcerer",
		category = "AI recommended"
	},
	{
		description = "Disables plague sorcerers from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_plague_sorcerer",
		category = "AI recommended"
	},
	{
		description = "Disables tentacle sorcerers from spawning (requires restart!!!)",
		is_boolean = true,
		setting_name = "disable_tentacle_sorcerer",
		category = "AI recommended"
	},
	{
		description = "Disables hordes spawning",
		is_boolean = true,
		setting_name = "ai_horde_spawning_disabled",
		category = "AI recommended"
	},
	{
		description = "When pressing 'h for a debug horde, set what kind of horde will spawn, instead of a random variant",
		setting_name = "ai_set_horde_type_debug",
		category = "AI recommended",
		item_source = {
			vector_blob = "vector_blob",
			vector = "vector",
			ambush = "ambush",
			random = "random"
		}
	},
	{
		description = "Disables mini patrols from spawning",
		is_boolean = true,
		setting_name = "ai_mini_patrol_disabled",
		category = "AI recommended"
	},
	{
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

				Managers.state.conflict:mini_patrol(t, nil, composition, group_template)
			end
		end
	},
	{
		description = "Enables horde logging in console",
		is_boolean = true,
		setting_name = "ai_horde_logging",
		category = "AI recommended"
	},
	{
		description = "Presents current amount of alive breeds on screen.",
		is_boolean = true,
		setting_name = "show_alive_ai",
		category = "AI recommended"
	},
	{
		description = "Writes out max-health / current health above ai units",
		is_boolean = true,
		setting_name = "show_ai_health",
		category = "AI recommended"
	},
	{
		description = "Writes out from what BreedPack the unit was picked. What zone he spawned in. If he was replaced.",
		is_boolean = true,
		setting_name = "show_ai_spawn_info",
		category = "AI recommended"
	},
	{
		description = "Draws a spinning line abouve each pickup in game",
		is_boolean = true,
		setting_name = "show_spawned_pickups",
		category = "AI recommended"
	},
	{
		description = "Collects the data needed for drawing pickup spawners and spawn sections. Restart required.",
		is_boolean = true,
		setting_name = "debug_pickup_spawners",
		category = "Pickup Spawners"
	},
	{
		description = "The debug_pickup_spawners option must be set to true when using this feature",
		category = "Pickup Spawners",
		setting_name = "Toggle Pickup Spawners Draw Mode",
		func = function ()
			Managers.state.entity:system("pickup_system"):debug_draw_spread_pickups()
		end
	},
	{
		description = "Draws lines up in the sky where each ai is",
		is_boolean = true,
		setting_name = "show_where_ai_is",
		category = "AI recommended"
	},
	{
		description = "turns on animation debug on your current ai debug target.",
		is_boolean = true,
		setting_name = "anim_debug_ai_debug_target",
		category = "AI recommended"
	},
	{
		description = "Choose between different conflict director settings.",
		setting_name = "override_conflict_settings",
		category = "Conflict & Pacing",
		item_source = ConflictDirectors
	},
	{
		description = "Displays current conflict settings on screen.",
		is_boolean = true,
		setting_name = "show_current_conflict_settings",
		category = "Conflict & Pacing"
	},
	{
		description = "Displays current threat value from aggroed enemies, and what systems will delay their spawning.",
		is_boolean = true,
		setting_name = "debug_current_threat_value",
		category = "Conflict & Pacing"
	},
	{
		description = "Dump lots of debug in the console when constructing the zones & packs. Will draw 1m spheres around units that gets replaced via BreedPacks zone_checks. Each hi/low segment will have the same colored spheres. Units that are not replaced, but counted will have small spheres.",
		is_boolean = true,
		setting_name = "debug_zone_baker",
		category = "Conflict & Pacing"
	},
	{
		description = "Draws zones on screen, and lots of debug on ground",
		is_boolean = true,
		setting_name = "debug_zone_baker_on_screen",
		category = "Conflict & Pacing"
	},
	{
		description = "Show all hidden spawners with vertical lines.",
		is_boolean = true,
		setting_name = "show_hidden_spawners",
		category = "Conflict & Pacing"
	},
	{
		description = "Shows clustering, loneliness, crumbs...",
		is_boolean = true,
		setting_name = "debug_player_positioning",
		category = "Conflict & Pacing"
	},
	{
		description = "Shows rushing player...",
		is_boolean = true,
		setting_name = "debug_rush_intervention",
		category = "Conflict & Pacing"
	},
	{
		description = "Handles speedrunners by spawning specials or small hordes ahead of players, activate this to see its states",
		is_boolean = true,
		setting_name = "debug_speed_running_intervention",
		category = "Conflict & Pacing"
	},
	{
		description = "Shows player that is outside navmesh...",
		is_boolean = true,
		setting_name = "debug_outside_navmesh_intervention",
		category = "Conflict & Pacing"
	},
	{
		description = "Show data for pacing of the game",
		is_boolean = true,
		setting_name = "debug_ai_pacing",
		category = "Conflict & Pacing"
	},
	{
		description = "Shows player intensity",
		is_boolean = true,
		setting_name = "debug_player_intensity",
		category = "Conflict & Pacing"
	},
	{
		description = "Show exclamation point icon above heads of alerted skaven",
		is_boolean = true,
		setting_name = "enable_alert_icon",
		category = "AI"
	},
	{
		description = "Make AI not perceive anyone",
		is_boolean = true,
		setting_name = "disable_ai_perception",
		category = "AI"
	},
	{
		description = "Shows perception for some units",
		is_boolean = true,
		setting_name = "debug_ai_perception",
		category = "AI"
	},
	{
		description = "Shows attack patterns for enemies. Gray -> has no slot. Lime -> has slot. Red -> is attacking. Orange -> is in attack cooldown. Blue -> is staggered or blocked.",
		is_boolean = true,
		setting_name = "debug_ai_attack_pattern",
		category = "AI"
	},
	{
		description = "Automagically destroys AI that are at a far enough distance from all the players.",
		is_boolean = true,
		setting_name = "ai_far_off_despawn_disabled",
		category = "AI"
	},
	{
		description = "Shows the workings of the ai recycler and area sets",
		is_boolean = true,
		setting_name = "debug_ai_recycler",
		category = "AI"
	},
	{
		description = "Shows frozen breed units",
		is_boolean = true,
		setting_name = "debug_breed_freeze",
		category = "AI"
	},
	{
		description = "Disables AI freeze optimization",
		is_boolean = true,
		setting_name = "disable_breed_freeze_opt",
		category = "AI"
	},
	{
		description = "Enemy recycler will spawn rats wile in free-flight",
		is_boolean = true,
		setting_name = "recycler_in_freeflight",
		category = "AI"
	},
	{
		description = "Shows the active respawns as yellow spheres with distance from start. removed respawns due to crossroads are bluish spheres",
		is_boolean = true,
		setting_name = "debug_player_respawns",
		category = "AI"
	},
	{
		description = "Horde debugging, shows how it picks spawn points",
		is_boolean = true,
		setting_name = "debug_hordes",
		category = "AI"
	},
	{
		description = "Mini patrol debugging",
		is_boolean = true,
		setting_name = "debug_mini_patrols",
		category = "AI"
	},
	{
		description = "Draws patrols routes",
		category = "AI",
		setting_name = "draw_patrol_routes",
		func = function ()
			Managers.state.conflict.level_analysis:draw_patrol_routes()
		end
	},
	{
		description = "Draws patrol start positions",
		category = "AI",
		setting_name = "draw_patrol_start_positions",
		func = function ()
			Managers.state.conflict.level_analysis:draw_patrol_start_positions()
		end
	},
	{
		description = "Spawns a boss patrol at the closest spawner, use draw_patrol_start_positions to see spawners",
		category = "AI",
		setting_name = "spawn_patrol_at_closest_spawner",
		func = function ()
			Managers.state.conflict:debug_spawn_spline_patrol_closest_spawner()
		end
	},
	{
		description = "AI behviour trees text over unit.",
		is_boolean = true,
		setting_name = "debug_behaviour_trees",
		category = "AI"
	},
	{
		description = "Show debug data for terror events.",
		is_boolean = true,
		setting_name = "debug_terror",
		category = "AI"
	},
	{
		description = "Draws a sphere and text at each respawner unit in the level. Must set 'debug_ai_recycler=true'",
		category = "AI",
		setting_name = "debug_spawn_ogre_from_closest_boss_spawner",
		func = function ()
			if script_data.debug_ai_recycler then
				local only_draw = false

				Managers.state.conflict.level_analysis:debug_spawn_boss_from_closest_spawner_to_player(only_draw)
			end
		end
	},
	{
		description = "Injects all patrols into the main path'",
		category = "AI",
		setting_name = "debug_spawn_all_boss_patrols",
		func = function ()
			print("All boss patrols injected into the main path now")
			Managers.state.conflict.level_analysis:spawn_all_boss_spline_patrols()
		end
	},
	{
		description = "Injects all bosses into the main path'",
		category = "AI",
		setting_name = "debug_spawn_all_bosses",
		func = function ()
			print("All boss enemies are now injected into the main path!")
			Managers.state.conflict.level_analysis:inject_all_bosses_into_main_path()
		end
	},
	{
		description = "Debug spawn ogre from closest boss spawner. NOTE: debug_ai_recycler must be true at level load.",
		category = "AI",
		setting_name = "debug_draw_respaners",
		func = function ()
			Managers.state.spawn.respawn_handler:debug_draw_respaners()
		end
	},
	{
		description = "Debug spawns one special through the specials spawning system.",
		category = "AI",
		setting_name = "debug_spawn_special",
		func = function ()
			Managers.state.conflict.specials_pacing:debug_spawn()
		end
	},
	{
		description = "Enable navigation group debugging.",
		is_boolean = true,
		setting_name = "debug_navigation_group_manager",
		category = "AI"
	},
	{
		description = "Draws lines between all navigation-groups. Remove lines by pressing 'X'. ",
		category = "AI",
		setting_name = "draw_navigation_group_connections",
		func = function ()
			Managers.state.conflict.navigation_group_manager:draw_group_connections()
		end
	},
	{
		description = "Enables debugging for spawning packs using perlin noise.",
		is_boolean = true,
		setting_name = "debug_perlin_noise_spawning",
		category = "AI"
	},
	{
		description = "Visual debugging for movement.",
		setting_name = "debug_ai_movement",
		category = "AI",
		item_source = {
			graphics_only = "graphics_only",
			text_and_graphics = "text_and_graphics"
		}
	},
	{
		description = "Shows which of nav tag volume layer 20-29 that are enabled.",
		is_boolean = true,
		setting_name = "debug_nav_tag_volume_layers",
		category = "AI"
	},
	{
		description = "Visual debugging for skeleton for debug_unit.",
		is_boolean = true,
		setting_name = "debug_skeleton",
		category = "AI"
	},
	{
		description = "Fades out debug_unit.",
		is_boolean = true,
		setting_name = "fade_debug_unit",
		category = "AI"
	},
	{
		description = "Visual debugging for big boy turning.",
		is_boolean = true,
		setting_name = "debug_big_boy_turning",
		category = "AI"
	},
	{
		description = "Visual debugging when enemy AI pathfinding fails.",
		is_boolean = true,
		setting_name = "ai_debug_failed_pathing",
		category = "AI"
	},
	{
		description = "Will hide then node-history list on the left side of the screen, when in the behavior debugger screen. (CTRL+B)",
		is_boolean = true,
		setting_name = "hide_behavior_tree_node_history",
		category = "AI"
	},
	{
		description = "Displays engine debug for EngineOptimizedExtensions",
		is_boolean = true,
		setting_name = "show_engine_locomotion_debug",
		category = "AI"
	},
	{
		description = "Policy to use for the enemy package loader (see EnemyPackageLoaderSettings). [NEED TO RESTART GAME]",
		setting_name = "enemy_package_loader_policy",
		category = "AI",
		item_source = {
			console = "console"
		}
	},
	{
		description = "Shows which dynamic packages that have been loaded or unloaded.",
		is_boolean = true,
		setting_name = "debug_enemy_package_loader",
		category = "AI"
	},
	{
		description = "Visual debugging for ai attacks",
		is_boolean = true,
		setting_name = "debug_ai_attack",
		category = "AI"
	},
	{
		description = "Visual debugging for ai targeting.",
		is_boolean = true,
		setting_name = "debug_ai_targets",
		category = "AI"
	},
	{
		description = "Only enables AI debugger during freeflight",
		is_boolean = true,
		setting_name = "ai_debugger_freeflight_only",
		category = "AI"
	},
	{
		description = "Shows the aoe targeting alternatives and which target position chosen",
		is_boolean = true,
		setting_name = "ai_debug_aoe_targeting",
		category = "AI"
	},
	{
		description = "Shows the raycasts when testing trajectories",
		is_boolean = true,
		setting_name = "ai_debug_trajectory_raycast",
		category = "AI"
	},
	{
		description = "Visualize AI slots",
		is_boolean = true,
		setting_name = "ai_debug_slots",
		category = "AI"
	},
	{
		description = "Will log when stuff happens",
		is_boolean = true,
		setting_name = "ai_debug_inventory",
		category = "AI"
	},
	{
		description = "Will visualize ai sound detection and reactions",
		is_boolean = true,
		setting_name = "ai_debug_sound_detection",
		category = "AI"
	},
	{
		description = "Visual debugging and logging for groups/patrols",
		is_boolean = true,
		setting_name = "ai_debug_smartobject",
		category = "AI"
	},
	{
		description = "Pack master will attack regardless of if the player is already under attack or not.",
		is_boolean = true,
		setting_name = "ai_packmaster_ignore_dogpile",
		category = "AI"
	},
	{
		description = "If not true, when quick-spawning enemies the ai debugger will auto select them.",
		is_boolean = true,
		setting_name = "ai_disable_auto_ai_debugger_target",
		category = "AI"
	},
	{
		description = "show globadiers areas for decision making",
		is_boolean = true,
		setting_name = "ai_globadier_behavior",
		category = "AI"
	},
	{
		description = "show gutter runner debug",
		is_boolean = true,
		setting_name = "ai_gutter_runner_behavior",
		category = "AI"
	},
	{
		description = "show loot rat debug",
		is_boolean = true,
		setting_name = "ai_loot_rat_behavior",
		category = "AI"
	},
	{
		description = "show nav mesh",
		is_boolean = true,
		setting_name = "nav_mesh_debug",
		category = "AI"
	},
	{
		description = "Shows cover points as green spheres. Bad cover points as red capsules, only draws at level startup.",
		is_boolean = true,
		setting_name = "show_hidden_cover_points",
		category = "AI"
	},
	{
		description = "Shows all coverpoints within 35m from the player",
		is_boolean = true,
		setting_name = "debug_near_cover_points",
		category = "AI"
	},
	{
		description = "AI group/patrols",
		is_boolean = true,
		setting_name = "ai_group_debug",
		category = "AI"
	},
	{
		description = "Debug patrols",
		is_boolean = true,
		setting_name = "debug_patrols",
		category = "AI"
	},
	{
		description = "Debug which groups are being considered for despawning by recycler",
		is_boolean = true,
		setting_name = "debug_group_recycling",
		category = "AI"
	},
	{
		description = "Debug chaos troll",
		is_boolean = true,
		setting_name = "debug_chaos_troll",
		category = "AI"
	},
	{
		description = "Debug Skaven Stormfiend",
		is_boolean = true,
		setting_name = "debug_stormfiend",
		category = "AI"
	},
	{
		description = "Debug the Chaos Vortex",
		is_boolean = true,
		setting_name = "debug_vortex",
		category = "AI"
	},
	{
		description = "Debug liquid system used for AoE effects.",
		is_boolean = true,
		setting_name = "debug_liquid_system",
		category = "AI"
	},
	{
		description = "Debug damage wave used for AoE attacks.",
		is_boolean = true,
		setting_name = "debug_damage_wave",
		category = "AI"
	},
	{
		description = "Debug damage blobs used for AoE attacks.",
		is_boolean = true,
		setting_name = "debug_damage_blobs",
		category = "AI"
	},
	{
		description = "AI interest points",
		is_boolean = true,
		setting_name = "ai_interest_point_debug",
		category = "AI"
	},
	{
		description = "AI interest points gets randomly disabled without this",
		is_boolean = true,
		setting_name = "ai_dont_randomize_interest_points",
		category = "AI"
	},
	{
		description = "ratling gunner debug",
		is_boolean = true,
		setting_name = "ai_ratling_gunner_debug",
		category = "AI"
	},
	{
		description = "disable to debug crashes more clearly or to profile.",
		is_boolean = true,
		setting_name = "navigation_thread_disabled",
		category = "AI"
	},
	{
		description = "Disable rats spreading out more.",
		is_boolean = true,
		setting_name = "disable_crowd_dispersion",
		category = "AI"
	},
	{
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
	},
	{
		description = "Enables visual debugging.",
		category = "AI",
		setting_name = "navigation_visual_debug_enabled",
		callback = "enable_navigation_visual_debug",
		is_boolean = true
	},
	{
		description = "Show stagger immunity info on enemies.",
		is_boolean = true,
		setting_name = "debug_stagger",
		category = "AI"
	},
	{
		setting_name = "load_level",
		description = "Loads the selected level.",
		category = "Gamemode/level",
		item_source = {},
		load_items_source_func = function (options)
			table.clear(options)

			for key, settings in pairs(LevelSettings) do
				if type(settings) == "table" then
					options[#options + 1] = key
				end
			end

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
		end,
		func = function (options, index)
			local level_name = options[index]

			debug.load_level(level_name)
		end
	},
	{
		description = "Find it annoying that the game ends every time you die? Well enable this setting then!",
		is_boolean = true,
		setting_name = "disable_gamemode_end",
		category = "Gamemode/level"
	},
	{
		description = "Unlock all levels in the map",
		is_boolean = true,
		setting_name = "unlock_all_levels",
		category = "Gamemode/level"
	},
	{
		description = "Various level debug stuff",
		is_boolean = true,
		setting_name = "debug_level",
		category = "Gamemode/level"
	},
	{
		description = "Save debug info for server seeded randoms, can be printed on server/client with debug_print_random_values() in console",
		is_boolean = true,
		setting_name = "debug_server_seeded_random",
		category = "Gamemode/level"
	},
	{
		description = "Enables room debuging using f1-f4",
		is_boolean = true,
		setting_name = "debug_rooms",
		category = "Gamemode/level"
	},
	{
		description = "Allows you to skip ingame cutscenes",
		is_boolean = true,
		setting_name = "skippable_cutscenes",
		category = "Gamemode/level"
	},
	{
		description = "Change which difficulty you play at. Restart required.",
		setting_name = "current_difficulty_setting",
		category = "Gamemode/level",
		item_source = DifficultySettings
	},
	{
		description = "Enables debug options for mutators",
		is_boolean = true,
		setting_name = "debug_mutators",
		category = "Gamemode/level"
	},
	{
		description = "Debug for darkness in drachenfells castle dungeon level.",
		is_boolean = true,
		setting_name = "debug_darkness",
		category = "Gamemode/level"
	},
	{
		description = "Debug print Hit Effects Templates",
		is_boolean = true,
		setting_name = "debug_hit_effects_templates",
		category = "Visual/audio"
	},
	{
		description = "Prints total ammount of particles currently simulated in the game world",
		is_boolean = true,
		setting_name = "debug_particle_simulation",
		category = "Visual/audio"
	},
	{
		description = "Disabled blood splatter on screen from other players' kills",
		is_boolean = true,
		setting_name = "disable_remote_blood_splatter",
		category = "Visual/audio"
	},
	{
		description = "Disabled blood splatter on screen from behind camera",
		is_boolean = true,
		setting_name = "disable_behind_blood_splatter",
		category = "Visual/audio"
	},
	{
		description = "Disable combat music",
		is_boolean = true,
		setting_name = "debug_disable_combat_music",
		category = "Visual/audio"
	},
	{
		description = "Show material effect visual debug info.",
		is_boolean = true,
		setting_name = "debug_material_effects",
		category = "Visual/audio"
	},
	{
		description = "Sound debugging",
		is_boolean = true,
		setting_name = "sound_debug",
		category = "Visual/audio"
	},
	{
		description = "Shows Wwise Timestamp.",
		is_boolean = true,
		setting_name = "debug_wwise_timestamp",
		category = "Visual/audio"
	},
	{
		description = "Visual debug for the sound sector system",
		is_boolean = true,
		setting_name = "sound_sector_system_debug",
		category = "Visual/audio"
	},
	{
		description = "debug info for sound environments",
		is_boolean = true,
		setting_name = "debug_sound_environments",
		category = "Visual/audio"
	},
	{
		description = "music stuff",
		is_boolean = true,
		setting_name = "debug_music",
		category = "Visual/audio"
	},
	{
		description = "debug lua_elevation parameter sent to wwise",
		is_boolean = true,
		setting_name = "debug_wwise_elevation",
		category = "Visual/audio"
	},
	{
		description = "debug current environment blend",
		is_boolean = true,
		setting_name = "debug_environment_blend",
		category = "Visual/audio"
	},
	{
		description = "debug nav mesh pasted particle effects",
		is_boolean = true,
		setting_name = "debug_nav_mesh_vfx",
		category = "Visual/audio"
	},
	{
		description = "debug sorting for proximity dependent sfx and vfx",
		is_boolean = true,
		setting_name = "debug_proximity_fx",
		category = "Visual/audio"
	},
	{
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
	},
	{
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
	},
	{
		description = "Bind to a numpad key and do it.",
		category = "Visual/audio",
		setting_name = "take_screenshot",
		func = function ()
			FrameCapture.screen_shot("console_send", 2)
		end
	},
	{
		description = "Disables all debug draws",
		is_boolean = true,
		setting_name = "disable_debug_draw",
		category = "Visual/audio"
	},
	{
		description = "Draw pretty lines for sound occlusion.",
		setting_name = "visualize_sound_occlusion",
		callback = "visualize_sound_occlusion",
		category = "Visual/audio",
		item_source = {
			["toggle sound occlusion"] = true
		}
	},
	{
		description = "Print out debugging for VoIP",
		is_boolean = true,
		setting_name = "debug_voip",
		category = "Visual/audio"
	},
	{
		description = "Disable VoIP",
		is_boolean = true,
		setting_name = "disable_voip",
		category = "Visual/audio"
	},
	{
		setting_name = "simulate_color_blindness",
		category = "Visual/audio",
		description = (BUILD == "dev" and "Enables or disables different color blindness simulations.") or "This is only available in dev builds for performance reasons. Switch exe to dev to see the effects of the changes.",
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
	},
	{
		description = "This is used to turn off the fading of AI characters that collide with the camera. This is useful when recording cutscenes.",
		is_boolean = true,
		setting_name = "fade_on_camera_ai_collision",
		category = "Replay"
	},
	{
		description = "This is used to turn off the screenspace effects that is aimed at a first person view. This is useful when recording cutscenes.",
		is_boolean = true,
		setting_name = "screen_space_player_camera_reactions",
		category = "Replay"
	},
	{
		no_nil = true,
		description = "Enables chain constraints",
		setting_name = "enable_chain_constraints",
		callback = "enable_chain_constraints",
		category = "Constraints",
		is_boolean = true
	},
	{
		description = "Network debugging",
		is_boolean = true,
		setting_name = "network_debug",
		category = "Network"
	},
	{
		description = "Fakes mismatching network hash",
		is_boolean = true,
		setting_name = "fake_network_hash",
		category = "Network"
	},
	{
		description = "Keeps track of the number of times an rpc send request has been triggered from a certain code row and prints the top 5 most occurring ones. Note: Disregards exclusive local rpc send calls.",
		is_boolean = true,
		setting_name = "rpc_send_count_debug",
		category = "Network"
	},
	{
		description = "Set network logging to Network.MESSAGES on startup",
		is_boolean = true,
		setting_name = "network_log_messages",
		category = "Network"
	},
	{
		description = "Set network logging to Network.SPEW on startup",
		is_boolean = true,
		setting_name = "network_log_spew",
		category = "Network"
	},
	{
		description = "matchmaking debug logging",
		is_boolean = true,
		setting_name = "matchmaking_debug",
		category = "Network"
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
		description = "Shows the current clock time",
		is_boolean = true,
		setting_name = "network_clock_debug",
		category = "Network"
	},
	{
		description = "Debug Print Profile Package Loading",
		is_boolean = true,
		setting_name = "profile_package_loading_debug",
		category = "Network"
	},
	{
		description = "Debugs connections for the network",
		is_boolean = true,
		setting_name = "network_debug_connections",
		category = "Network"
	},
	{
		description = "Debugs lobbies and matchmaking",
		is_boolean = true,
		setting_name = "debug_lobbies",
		category = "Network"
	},
	{
		description = "Shows lobby data key/values",
		is_boolean = true,
		setting_name = "debug_lobby_data",
		category = "Network"
	},
	{
		description = "Debug draw peer state machine states.",
		is_boolean = true,
		setting_name = "network_draw_peer_states",
		category = "Network"
	},
	{
		description = "Debug draw the profile synchronizer state.",
		is_boolean = true,
		setting_name = "network_draw_profile_synchronizer",
		category = "Network"
	},
	{
		description = "Debug All Contexts",
		is_boolean = true,
		setting_name = "dialogue_debug_all_contexts",
		category = "Dialogue"
	},
	{
		description = "Debug Last Query",
		is_boolean = true,
		setting_name = "dialogue_debug_last_query",
		category = "Dialogue"
	},
	{
		description = "Debug Print Successful Queries",
		is_boolean = true,
		setting_name = "dialogue_debug_last_played_query",
		category = "Dialogue"
	},
	{
		description = "Debug Print Queries",
		is_boolean = true,
		setting_name = "dialogue_debug_queries",
		category = "Dialogue"
	},
	{
		description = "Debug show Proximities",
		is_boolean = true,
		setting_name = "dialogue_debug_proximity_system",
		category = "Dialogue"
	},
	{
		description = "Visualize lookat system",
		is_boolean = true,
		setting_name = "dialogue_debug_lookat",
		category = "Dialogue"
	},
	{
		description = "Debug subtitles",
		is_boolean = true,
		setting_name = "subtitle_debug",
		category = "Dialogue"
	},
	{
		setting_name = "debug_dialogue_files",
		description = "Used to debug dialog files, facial expressions and missing vo/subtitles. To skip use: DebugVo_jump_to('line_number/line_id')",
		category = "Dialogue",
		item_source = {},
		load_items_source_func = function (options)
			table.clear(options)

			local dialogue_files = DialogueSettings.auto_load_files

			if dialogue_files ~= nil then
				for key, file in pairs(dialogue_files) do
					options[#options + 1] = string.match(file, "^.+/(.+)$")
				end
			end

			local level_key = Managers.state.game_mode:level_key()
			local level_dialogue_files = DialogueSettings.level_specific_load_files[level_key]

			if level_dialogue_files ~= nil then
				for key, file in pairs(level_dialogue_files) do
					options[#options + 1] = string.match(file, "^.+/(.+)$")
				end
			end
		end,
		func = function (options, index)
			DebugVoByFile(options[index], false)
		end
	},
	{
		description = "Missing vo sound event triggers an error sound",
		is_boolean = true,
		setting_name = "dialogue_debug_missing_vo_trigger_error_sound",
		category = "Dialogue"
	},
	{
		description = "Debug print input device statuses",
		is_boolean = true,
		setting_name = "input_debug_device_state",
		category = "Input"
	},
	{
		description = "Debug input filters output",
		is_boolean = true,
		setting_name = "input_debug_filters",
		category = "Input"
	},
	{
		description = "Will load the ui debug package on startup if true",
		is_boolean = true,
		setting_name = "load_ui_debug_package",
		category = "UI"
	},
	{
		description = "Debug UI Hover elements",
		is_boolean = true,
		setting_name = "ui_debug_hover",
		category = "UI"
	},
	{
		description = "Enable/Disable the Lorebook (need to restart level to spawn page pickups)",
		is_boolean = true,
		setting_name = "lorebook_enabled",
		category = "UI"
	},
	{
		description = "Debug UI Scenegraph Areas and Sizes",
		is_boolean = true,
		setting_name = "ui_debug_scenegraph",
		category = "UI"
	},
	{
		description = "Debug UI Pixeldistance (by keybinding",
		is_boolean = true,
		setting_name = "ui_debug_pixeldistance",
		category = "UI"
	},
	{
		description = "Debug ui textures.",
		is_boolean = true,
		setting_name = "ui_debug_draw_texture",
		category = "UI"
	},
	{
		description = "Disable UI Rendering.",
		is_boolean = true,
		setting_name = "disable_ui",
		category = "UI"
	},
	{
		description = "Disable Outlines.",
		category = "UI",
		setting_name = "disable_outlines",
		callback = "disable_outlines",
		is_boolean = true
	},
	{
		description = "Disables the screens at the end of the level, getting you directly back to the inn.",
		is_boolean = true,
		setting_name = "disable_end_screens",
		category = "UI"
	},
	{
		description = "Disable Tutorial UI Rendering.",
		is_boolean = true,
		setting_name = "disable_tutorial_ui",
		category = "UI"
	},
	{
		description = "Disable Info Slate UI Rendering.",
		is_boolean = true,
		setting_name = "disable_info_slate_ui",
		category = "UI"
	},
	{
		description = "Disable Game Timer UI Rendering.",
		is_boolean = true,
		setting_name = "disable_ingame_timer",
		category = "UI"
	},
	{
		description = "Disables the loading icon.",
		is_boolean = true,
		setting_name = "disable_loading_icon",
		category = "UI"
	},
	{
		description = "Disables the Water Mark if present.",
		is_boolean = true,
		setting_name = "disable_water_mark",
		category = "UI"
	},
	{
		description = "Looks through all the localizations and selects the longest text for each item.",
		is_boolean = true,
		setting_name = "show_longest_localizations",
		category = "UI"
	},
	{
		description = "Cycles through available localizations",
		category = "UI",
		setting_name = "enable_localization_cycling",
		callback = "enable_locale_cycling",
		is_boolean = true
	},
	{
		description = "Turns off positive reinforcement UI",
		is_boolean = true,
		setting_name = "disable_reinforcement_ui",
		category = "UI"
	},
	{
		description = "Switches reinforcement UI local sound",
		setting_name = "reinforcement_ui_local_sound",
		category = "UI",
		item_source = {
			hud_achievement_unlock_01 = true,
			hud_achievement_unlock_03 = true,
			hud_info = true,
			hud_achievement_unlock_02 = true
		}
	},
	{
		description = "Toggles reinforcement UI remote sound",
		is_boolean = true,
		setting_name = "enable_reinforcement_ui_remote_sound",
		category = "UI"
	},
	{
		description = "The whole menu is unlocked, there is no end to the possibilities!",
		is_boolean = true,
		setting_name = "pause_menu_full_access",
		category = "UI"
	},
	{
		description = "Enables option to give yourself lootboxes for free!",
		is_boolean = true,
		setting_name = "debug_loot_opening",
		category = "UI"
	},
	{
		description = "If inventory is open it will cycle select items automatically",
		is_boolean = true,
		setting_name = "debug_cycle_select_inventory_item",
		category = "UI"
	},
	{
		description = "Enables or disables detailed tooltips on weapns, accessable by pressing SHIFT or CTRL",
		is_boolean = true,
		setting_name = "enable_detailed_tooltips",
		category = "UI"
	},
	{
		description = "Disables position lookup validation. Can turn this on for extra performance.",
		is_boolean = true,
		setting_name = "disable_debug_position_lookup",
		category = "Misc"
	},
	{
		description = "Will paste the content and engine revision to the user's clipboard.",
		is_boolean = true,
		setting_name = "paste_revision_to_clipboard",
		category = "Misc"
	},
	{
		description = "Enable logging of telemetry debugging information.",
		is_boolean = true,
		setting_name = "debug_telemetry",
		category = "Misc"
	},
	{
		description = "Enable logging of leaderboard debugging information.",
		is_boolean = true,
		setting_name = "debug_leaderboard",
		category = "Misc"
	},
	{
		description = "Enable logging of the forge",
		is_boolean = true,
		setting_name = "forge_debug",
		category = "Misc"
	},
	{
		description = "Enables logging for the package manager",
		is_boolean = true,
		setting_name = "package_debug",
		category = "Misc"
	},
	{
		description = "Disable luajit ",
		category = "Misc",
		setting_name = "luajit_disabled",
		callback = "update_using_luajit",
		is_boolean = true
	},
	{
		description = "Restart the game to view dice chances",
		is_boolean = true,
		setting_name = "dice_chance_simulation",
		category = "Misc"
	},
	{
		description = "Shows a rect in topcenter of the current color of lightfx. Restart required",
		is_boolean = true,
		setting_name = "debug_lightfx",
		category = "Misc"
	},
	{
		description = "Throttles FPS to a value. Default means no throttle. Note that this doesn't automatically gets set at startup.",
		setting_name = "force_limit_fps",
		category = "Misc",
		item_source = {
			default = true,
			throttle_fps_5 = true,
			throttle_fps_15 = true,
			throttle_fps_1 = true,
			throttle_fps_10 = true,
			throttle_fps_60 = true,
			throttle_fps_30 = true
		},
		func = function (options, index)
			local option = options[index]
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
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
			elseif option == "throttle_fps_30" then
				fps = 30
			elseif option == "throttle_fps_60" then
				fps = 60
			end

			Application.set_time_step_policy("throttle", fps)
		end
	},
	{
		description = "Don't show dark background behind debug texts.",
		is_boolean = true,
		setting_name = "hide_debug_text_background",
		category = "Misc"
	},
	{
		description = "Will log transitions fade in/fade out",
		is_boolean = true,
		setting_name = "debug_transition_manager",
		category = "Misc"
	},
	{
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
	},
	{
		description = "Enable logging of mismatched profiling scopes.",
		is_boolean = true,
		setting_name = "debug_profiling_scopes",
		category = "Performance"
	},
	{
		description = "Enable visual 'profiling' of function calls.",
		is_boolean = true,
		setting_name = "profile_function_calls",
		category = "Performance"
	},
	{
		description = "Enable visual 'profiling' of pool tables.",
		is_boolean = true,
		setting_name = "profile_pool_tables",
		category = "Performance"
	},
	{
		description = "Enable asserts on mismatched profiling scopes.",
		is_boolean = true,
		setting_name = "validate_profiling_scopes",
		category = "Performance"
	},
	{
		description = "Disable lodding of animation bones.",
		is_boolean = true,
		setting_name = "bone_lod_disable",
		category = "Performance"
	},
	{
		description = "Enable floating text over AI head which states the animation that animation merge is currently enabled for.",
		is_boolean = true,
		setting_name = "animation_merge_debug",
		category = "Performance"
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
		description = "You have to restart the game for the settings to take effect",
		category = "Render Settings",
		setting_name = "Set high texture quality",
		func = function ()
			DebugScreen.set_texture_quality(0)
		end
	},
	{
		description = "You have to restart the game for the settings to take effect",
		category = "Render Settings",
		setting_name = "Set low texture quality",
		func = function ()
			DebugScreen.set_texture_quality(3)
		end
	},
	{
		description = "Show bot debug visualizers",
		is_boolean = true,
		setting_name = "ai_bots_debug",
		category = "Bots"
	},
	{
		description = "Enable debug printing related to bot weapons.",
		is_boolean = true,
		setting_name = "ai_bots_weapon_debug",
		category = "Bots"
	},
	{
		description = "Enable debug information related to bot orders - press t to order bot to pickup item using raycast.",
		is_boolean = true,
		setting_name = "ai_bots_order_debug",
		category = "Bots"
	},
	{
		description = "Shows which inputs that the bot is doing at the moment.",
		is_boolean = true,
		setting_name = "ai_bots_input_debug",
		category = "Bots"
	},
	{
		description = "Visualizes the AoE threat that the bots are trying to avoid.",
		is_boolean = true,
		setting_name = "ai_bots_aoe_threat_debug",
		category = "Bots"
	},
	{
		description = "Visualizes nearby breakable smart objects for the selected bot.",
		is_boolean = true,
		setting_name = "ai_bots_proximity_breakables_debug",
		category = "Bots"
	},
	{
		description = "Bots will not follow player.",
		is_boolean = true,
		setting_name = "bots_dont_follow",
		category = "Bots"
	},
	{
		description = "Disables automatic spawning of bots",
		is_boolean = true,
		setting_name = "ai_bots_disabled",
		category = "Bots"
	},
	{
		description = "Disables bot usage of career abilities.",
		is_boolean = true,
		setting_name = "ai_bots_career_abilities_disabled",
		category = "Bots"
	},
	{
		description = "Will set the total number of players + bots in game",
		setting_name = "cap_num_bots",
		category = "Bots",
		item_source = {
			0,
			1,
			2,
			3
		}
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
		description = "Performance Manager Debug",
		is_boolean = true,
		setting_name = "performance_debug",
		category = "Perfhud"
	},
	{
		description = "Requires restart. Disables the backend and emulates it with a local save.",
		is_boolean = true,
		setting_name = "use_local_backend",
		category = "Backend"
	},
	{
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
	},
	{
		description = "Unlock all careers",
		is_boolean = true,
		setting_name = "unlock_all_careers",
		category = "Progression"
	},
	{
		description = "Win",
		close_when_selected = true,
		setting_name = "Complete current level",
		category = "Progression",
		func = function ()
			Managers.state.game_mode:complete_level()
		end
	},
	{
		description = "Restart",
		close_when_selected = true,
		setting_name = "Retry current level",
		category = "Progression",
		func = function ()
			Managers.state.game_mode:retry_level()
		end
	},
	{
		description = "Lose",
		close_when_selected = true,
		setting_name = "Fail current level",
		category = "Progression",
		func = function ()
			Managers.state.game_mode:fail_level()
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Complete act \"prologue\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("prologue", true)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Uncomplete act \"prologue\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("prologue", false)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Complete act \"act_1\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_1", true)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Uncomplete act \"act_1\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_1", false)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Complete act \"act_2\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_2", true)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Uncomplete act \"act_2\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_2", false)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Complete act \"act_3\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_3", true)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Uncomplete act \"act_3\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_3", false)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Complete act \"act_4\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_4", true)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Uncomplete act \"act_4\"",
		func = function ()
			LevelUnlockUtils.debug_completed_act_levels("act_4", false)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Set completed game difficulty Normal",
		func = function ()
			LevelUnlockUtils.debug_set_completed_game_difficulty(2)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Set completed game difficulty Hard",
		func = function ()
			LevelUnlockUtils.debug_set_completed_game_difficulty(3)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Set completed game difficulty Nightmare",
		func = function ()
			LevelUnlockUtils.debug_set_completed_game_difficulty(4)
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Set completed game difficulty Cataclysm",
		func = function ()
			LevelUnlockUtils.debug_set_completed_game_difficulty(5)
		end
	},
	{
		description = "Adds 1000 Experience to your account.",
		category = "Progression",
		setting_name = "1000 Experience",
		func = function ()
			local player_manager = Managers.player
			local player = player_manager:local_player(1)
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local experience = hero_attributes:get(profile.display_name, "experience")
			local end_experience = math.min(experience + 1000, ExperienceSettings.max_experience)

			hero_attributes:set(profile.display_name, "experience", end_experience)
		end
	},
	{
		description = "Sets experience to 0.",
		category = "Progression",
		setting_name = "Reset Level",
		func = function ()
			local player_manager = Managers.player
			local player = player_manager:local_player(1)
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local hero_attributes = Managers.backend:get_interface("hero_attributes")

			hero_attributes:set(profile.display_name, "experience", 0)
		end
	},
	{
		description = "Will add experience to above prestige requirements",
		category = "Progression",
		setting_name = "Level up above prestige level requirements",
		func = function ()
			local player_manager = Managers.player
			local player = player_manager:local_player(1)
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local hero_attributes = Managers.backend:get_interface("hero_attributes")

			hero_attributes:set(profile.display_name, "experience", 1000000)
			debug.load_level("inn_level")
		end
	},
	{
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
			debug.load_level("inn_level")
		end
	},
	{
		description = "You have to reload the inn for the setting to take effect",
		category = "Progression",
		setting_name = "Wipe all progression(used for prestige)",
		func = function ()
			LevelUnlockUtils.set_all_acts_incompleted()
		end
	},
	{
		description = "",
		setting_name = "Number of Crafted Items",
		category = "Progression",
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
	},
	{
		description = "",
		setting_name = "Number of Salvaged Items",
		category = "Progression",
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
	},
	{
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
	},
	{
		description = "Override the returned value to flow node \"Leader Achievement Completed\"",
		is_boolean = true,
		setting_name = "achievement_completed_flow_override",
		category = "Progression"
	},
	{
		description = "Override the returned value to flow node \"Leader Has DLC\" when checking for the Collectors Edition (Pre Order) DLC",
		is_boolean = true,
		setting_name = "has_dlc_pre_order_flow_override",
		category = "Progression"
	},
	{
		description = "Disables the hero power requirements for difficulties",
		is_boolean = true,
		setting_name = "disable_hero_power_requirement",
		category = "Progression"
	},
	{
		description = "Completely resets all stats for local player. Requires that the player is spawned inside a level. REQUIRES RESTART AFTERWARDS!",
		category = "Progression",
		setting_name = "reset_statistics_database",
		func = function ()
			print("Starting statistics reset!")
			Managers.backend:get_interface("statistics"):reset()
		end
	},
	{
		{},
		description = "Will display all active buffs on the player (max 30 at once)",
		category = "HUD",
		setting_name = "debug_player_buffs",
		is_boolean = true,
		func = function ()
			debug.load_level("inn_level")
		end
	},
	{
		description = "Prints the number of server controlled buffs.",
		is_boolean = true,
		setting_name = "debug_server_controlled_buffs",
		category = "Player mechanics"
	},
	{
		description = "Shows current career sound state",
		is_boolean = true,
		setting_name = "debug_career_sound_state",
		category = "Player mechanics"
	},
	{
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
				loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", 0, 0, 0, 0, display_name, 0, 0, loot_profile_name, nil, nil)
			elseif item == "tier_2" then
				loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", 2, 0, 0, 0, display_name, 0, 0, loot_profile_name, nil, nil)
			elseif item == "tier_3" then
				loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", 2, 1, 0, 0, display_name, 0, 0, loot_profile_name, nil, nil)
			elseif item == "tier_4" then
				loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", 2, 2, 1, 0, display_name, 0, 0, loot_profile_name, nil, nil)
			elseif item == "tier_5" then
				loot_interface:generate_end_of_level_loot(true, true, "hardest", "bell", 2, 3, 4, 0, display_name, 0, 0, loot_profile_name, nil, nil)
			end
		end
	},
	{
		description = "Adds all melee items for this hero.",
		setting_name = "Add All Melee Items",
		category = "Items",
		func = function ()
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local item_master_list = ItemMasterList
			local item_interface = Managers.backend:get_interface("items")
			local player_manager = Managers.player
			local player = player_manager:local_player(1)
			local profile_index = player:profile_index()
			local profile_settings = SPProfiles[profile_index]
			local profile_name = profile_settings.display_name
			local career_index = hero_attributes:get(profile_name, "career")
			local careers = profile_settings.careers
			local career_settings = careers[career_index]
			local name = career_settings.name

			for key, item in pairs(item_master_list) do
				if item.slot_type == "melee" and table.contains(item.can_wield, name) and not item_interface:has_item(key) then
					item_interface:award_item(key)
				end
			end
		end
	},
	{
		description = "Adds all ranged items for this hero.",
		setting_name = "Add All Ranged Items",
		category = "Items",
		func = function ()
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local item_master_list = ItemMasterList
			local item_interface = Managers.backend:get_interface("items")
			local player_manager = Managers.player
			local player = player_manager:local_player(1)
			local profile_index = player:profile_index()
			local profile_settings = SPProfiles[profile_index]
			local profile_name = profile_settings.display_name
			local career_index = hero_attributes:get(profile_name, "career")
			local careers = profile_settings.careers
			local career_settings = careers[career_index]
			local name = career_settings.name

			for key, item in pairs(item_master_list) do
				if item.slot_type == "ranged" and table.contains(item.can_wield, name) and not item_interface:has_item(key) then
					item_interface:award_item(key)
				end
			end
		end
	},
	{
		description = "Lists all items with functionality to add them to inventory.",
		setting_name = "Add Melee Items",
		category = "Items",
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
				item_interface:award_item(item)
			end
		end
	},
	{
		description = "Lists all items with functionality to add them to inventory.",
		setting_name = "Add Ranged Items",
		category = "Items",
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
				item_interface:award_item(item)
			end
		end
	},
	{
		description = "Lists all items with functionality to add them to inventory.",
		setting_name = "Add Ring Items",
		category = "Items",
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
				item_interface:award_item(item)
			end
		end
	},
	{
		no_nil = true,
		description = "Lists all items with functionality to add them to inventory.",
		setting_name = "Add Necklace Items",
		category = "Items",
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
				item_interface:award_item(item)
			end
		end
	},
	{
		description = "Lists all items with functionality to add them to inventory.",
		setting_name = "Add Trinket Items",
		category = "Items",
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
				item_interface:award_item(item)
			end
		end
	},
	{
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

			if item then
				item_interface:award_item(item)
			end
		end
	},
	{
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

			if item then
				item_interface:award_item(item)
			end
		end
	},
	{
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

			if item then
				item_interface:award_item(item)
			end
		end
	},
	{
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

			if item then
				item_interface:award_item(item)
			end
		end
	},
	{
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

			if item then
				item_interface:award_item(item)
			end
		end
	},
	{
		description = "Adds one weapon per skin with that skin applied. This only works on local backend!",
		setting_name = "Add All Weapon Skins",
		category = "Items",
		func = function ()
			local item_master_list = ItemMasterList
			local item_interface = Managers.backend:get_interface("items")
			local added_skins = {}

			for key, item in pairs(item_master_list) do
				if (item.slot_type == "melee" or item.slot_type == "ranged") and item.skin_combination_table then
					table.clear(added_skins)

					local skin_combinations_by_rarity = WeaponSkins.skin_combinations[item.skin_combination_table]

					for rarity, skins in pairs(skin_combinations_by_rarity) do
						for _, skin_name in ipairs(skins) do
							if not added_skins[skin_name] then
								added_skins[skin_name] = true
								local backend_id = item_interface:award_item(key)
								local weapon = item_interface:get_item_from_id(backend_id)
								weapon.skin = skin_name
								weapon.rarity = rarity
							end
						end
					end
				end
			end

			Managers.backend:commit()
		end
	},
	{
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

			for i = 1, #activated_mutators, 1 do
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
	},
	{
		description = "Show all paintings etc. You have to reload the inn for the setting to take effect.",
		is_boolean = true,
		setting_name = "debug_keep_decorations",
		category = "Keep Decorations"
	},
	{
		description = "Unlocks a Challenge by setting by incrementing the appropriate statistics.",
		setting_name = "Unlock Challenges",
		category = "Progress",
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

				if template ~= nil and template.debug_unlock then
					local stats_db = Managers.state.game_mode.statistics_db
					local stats_id = Managers.player:local_player():stats_id()

					if stats_db and stats_id then
						template.debug_unlock(stats_db, stats_id)
						print("Unlocked challenge ", options[index])

						return
					end
				end
			end

			print("Could not unlock challenge ", options[index])
		end
	},
	{
		description = "Clears a Challenge by setting the appropriate statistics to 0.",
		setting_name = "Clear Challenges",
		category = "Progress",
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

				if template ~= nil and template.debug_reset then
					local stats_db = Managers.state.game_mode.statistics_db
					local stats_id = Managers.player:local_player():stats_id()

					if stats_db and stats_id then
						template.debug_reset(stats_db, stats_id)
						print("Reset challenge ", options[index])

						return
					end
				end
			end

			print("Could not reset challenge ", options[index])
		end
	}
}
local platform = PLATFORM

if platform == "ps4" then
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

if platform == "ps4" or platform == "xb1" then
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
						conflict_director:destroy_close_units(nil, 144)
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

for settings_key, settings_value in pairs(settings) do
	if settings_value.preset then
		for preset_key, preset_value in pairs(settings_value.preset) do
			settings_value.description = string.format("%s¤ %s = %s \n", settings_value.description, preset_key, tostring(preset_value))
		end
	end
end

local callbacks = {
	enable_locale_cycling = function (option)
		enable_locale_cycling(option)
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
