-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/helpers/debug_helper")
require("scripts/settings/backend_settings")

GameSettingsDevelopment = GameSettingsDevelopment or {}
local argv = {
	Application.argv()
}
GameSettingsDevelopment.trunk_path = GameSettingsDevelopment.trunk_path or false
GameSettingsDevelopment.quicklaunch_params = GameSettingsDevelopment.quicklaunch_params or {}
GameSettingsDevelopment.quicklaunch_params.level_key = (LEVEL_EDITOR_TEST and "editor_level") or "castle_01"
GameSettingsDevelopment.start_state = (LEVEL_EDITOR_TEST and "game") or (DEDICATED_SERVER and "dedicated_server") or "menu"
GameSettingsDevelopment.skip_start_screen = true
GameSettingsDevelopment.disable_shadow_lights_system = true
GameSettingsDevelopment.use_baked_enemy_meshes = false
GameSettingsDevelopment.help_screen_enabled = false
GameSettingsDevelopment.use_career_voice_pitch = false
GameSettingsDevelopment.lobby_browser_enabled = true
GameSettingsDevelopment.disabled_interactions = {}
GameSettingsDevelopment.use_global_chat = (table.find(argv, "-use-global-chat") and true) or false
local network_timeout = (Development.parameter("network_timeout_really_long") and 10000) or 60
GameSettingsDevelopment.network_timeout = Development.parameter("network_timeout") or network_timeout
GameSettingsDevelopment.network_silence_warning_delay = 3
GameSettingsDevelopment.show_version_info = true
GameSettingsDevelopment.default_environment = "environment/blank"
GameSettingsDevelopment.debug_outlines = false
GameSettingsDevelopment.lowest_resolution = 600
GameSettingsDevelopment.allow_ranged_attacks_to_damage_props = false
GameSettingsDevelopment.release_levels_only = true
GameSettingsDevelopment.use_engine_optimized_ai_locomotion = true
GameSettingsDevelopment.allow_retry_weave = false
local script_data = script_data
script_data.debug_behaviour_trees = (script_data.debug_behaviour_trees ~= nil and script_data.debug_behaviour_trees) or false
GameSettingsDevelopment.use_backend = not Development.parameter("use_local_backend")
local test_backend = Development.parameter("test_backend")

if test_backend ~= nil then
	print("Using test backend:", test_backend)

	GameSettingsDevelopment.backend_settings = BackendSettings[test_backend]
else
	GameSettingsDevelopment.backend_settings = BackendSettings.dev_steam_playfab
end

GameSettingsDevelopment.twitch_enabled = true
GameSettingsDevelopment.allow_chat_input = true
GameSettingsDevelopment.disable_intro_trailer = false
GameSettingsDevelopment.use_new_pickup_spawning = true
GameSettingsDevelopment.fade_environments = true
script_data.debug_enabled = true

if Development.parameter("gdc") then
	GameSettingsDevelopment.use_backend = false

	if not Development.parameter("force_debug_enabled") or Development.parameter("force_debug_disabled") then
		script_data.debug_enabled = false
	end
end

if Development.parameter("attract_mode") then
	if LAUNCH_MODE == "attract" then
		GameSettingsDevelopment.show_fps = false
	else
		GameSettingsDevelopment.show_fps = true
	end
end

script_data.disable_tutorial_at_start = script_data.disable_tutorial_at_start or Development.parameter("disable_tutorial_at_start")

if script_data.honduras_demo then
	GameSettingsDevelopment.use_backend = false
	GameSettingsDevelopment.use_local_backend = true
	GameSettingsDevelopment.skip_start_screen = false
	GameSettingsDevelopment.use_alien_fx = true

	if not Development.parameter("force_debug_enabled") or Development.parameter("force_debug_disabled") then
		script_data.debug_enabled = false
	end
end

if Development.parameter("force_debug_disabled") then
	script_data.debug_enabled = false
end

local settings = script_data.settings

print(settings.steam)
print(rawget(_G, "Steam"))

if settings.steam or Development.parameter("force_steam") then
	if rawget(_G, "Steam") or DEDICATED_SERVER then
		local app_id = nil

		if DEDICATED_SERVER then
			app_id = SteamGameServer.app_id()
		else
			app_id = Steam.app_id()
		end

		if not DEDICATED_SERVER and not Steam.owns_app(app_id) then
			Application.quit_with_message("Vermintide 2. You need to own game to play it.")
		end

		GameSettingsDevelopment.network_mode = "steam"
		GameSettingsDevelopment.disable_free_flight = true
		GameSettingsDevelopment.show_version_info = true
		GameSettingsDevelopment.show_fps = Development.parameter("show_fps") or false

		if app_id == 795750 and test_backend == nil then
			GameSettingsDevelopment.backend_settings = BackendSettings.stage_steam_playfab
		elseif app_id == 552500 then
			GameSettingsDevelopment.backend_settings = BackendSettings.prod_steam_playfab
		elseif app_id == 1085780 then
			GameSettingsDevelopment.backend_settings = BackendSettings.beta_steam_playfab
		end
	else
		Application.quit_with_message("Vermintide 2. You need to have the Steam Client running to play the game.")
	end
elseif BUILD == "dev" or BUILD == "debug" then
	GameSettingsDevelopment.network_mode = (LEVEL_EDITOR_TEST and "lan") or (Development.parameter("force_steam") and "steam") or "lan"
	GameSettingsDevelopment.show_fps = Development.parameter("show_fps") == nil or Development.parameter("show_fps")
	script_data.unlock_all_levels = Development.parameter("unlock-all-levels") or script_data.unlock_all_levels
elseif not script_data.honduras_demo and not Development.parameter("attract_mode") and not DEDICATED_SERVER then
	print("Running release game without content revision, quitting.")
	Application.quit("FAIL")
end

if Development.parameter("give-all-lan-backend-items") then
	script_data.give_all_lan_backend_items = true
end

GameSettingsDevelopment.disable_crafting = Development.parameter("disable-crafting")

if BUILD == "dev" or BUILD == "debug" then
	GameSettingsDevelopment.disable_free_flight = Development.parameter("disable-free-flight")
else
	GameSettingsDevelopment.disable_free_flight = Development.parameter("disable-free-flight") == nil or Development.parameter("disable-free-flight")
end

if Development.parameter("quests_enabled") ~= nil then
	GameSettingsDevelopment.backend_settings.quests_enabled = Development.parameter("quests_enabled")
end

GameSettingsDevelopment.network_port = 27015
GameSettingsDevelopment.editor_lobby_port = 10004
GameSettingsDevelopment.network_revision_check_enabled = false
GameSettingsDevelopment.use_high_quality_fur = Application.user_setting("use_high_quality_fur")

if GameSettingsDevelopment.use_high_quality_fur == nil then
	GameSettingsDevelopment.use_high_quality_fur = true
end

GameSettingsDevelopment.use_physic_debris = Application.user_setting("use_physic_debris")

if GameSettingsDevelopment.use_physic_debris == nil then
	GameSettingsDevelopment.use_physic_debris = true
end

GameSettingsDevelopment.bone_lod_husks = GameSettingsDevelopment.bone_lod_husks or {}
GameSettingsDevelopment.bone_lod_husks.lod_out_range_sq = 64
GameSettingsDevelopment.bone_lod_husks.lod_in_range_sq = 49
GameSettingsDevelopment.bone_lod_husks.lod_multiplier = Application.user_setting("animation_lod_distance_multiplier")

if GameSettingsDevelopment.bone_lod_husks.lod_multiplier == nil then
	GameSettingsDevelopment.bone_lod_husks.lod_multiplier = 1
end

if BUILD == "release" then
	GameSettingsDevelopment.remove_debug_stuff = false
else
	GameSettingsDevelopment.remove_debug_stuff = false
end

script_data.extrapolation_debug = true
GameSettingsDevelopment.simple_first_person = true
GameSettingsDevelopment.debug_unit_colors = {
	{
		255,
		0,
		0
	},
	{
		0,
		255,
		0
	},
	{
		0,
		255,
		255
	},
	{
		255,
		255,
		0
	},
	{
		255,
		0,
		255
	},
	{
		100,
		0,
		0
	},
	{
		0,
		100,
		255
	},
	{
		100,
		0,
		255
	},
	{
		50,
		150,
		255
	},
	{
		25,
		75,
		100
	},
	{
		0,
		255,
		110
	},
	{
		10,
		85,
		10
	},
	{
		75,
		75,
		255
	},
	{
		65,
		85,
		100
	}
}
GameSettingsDevelopment.ignored_rpc_logs = {
	"rpc_network_clock_sync_request",
	"rpc_network_time_sync_response",
	"rpc_network_current_server_time_response",
	"rpc_network_current_server_time_request",
	"rpc_add_damage",
	"rpc_heal",
	"rpc_ai_drop_single_item",
	"rpc_ai_inventory_wield",
	"rpc_ai_show_single_item",
	"rpc_ai_weapon_shoot_start",
	"rpc_ai_weapon_shoot_end",
	"rpc_interest_point_chatter_update",
	"rpc_set_animation_rotation_scale",
	"rpc_set_animation_translation_scale",
	"rpc_set_script_driven",
	"rpc_set_affected_by_gravity",
	"rpc_set_animation_driven",
	"rpc_constrain_ai",
	"rpc_sync_anim_state_1",
	"rpc_sync_anim_state_2",
	"rpc_sync_anim_state_3",
	"rpc_sync_anim_state_4",
	"rpc_sync_anim_state_5",
	"rpc_sync_anim_state_6",
	"rpc_sync_anim_state_7",
	"rpc_sync_anim_state_8",
	"rpc_sync_anim_state_9",
	"rpc_sync_anim_state_10",
	"rpc_sync_anim_state_11",
	"rpc_sync_anim_state_12",
	"rpc_create_bot_nav_transition",
	"rpc_pacing_changed",
	"rpc_play_dialogue_event",
	"rpc_trigger_dialogue_event",
	"rpc_interrupt_dialogue_event",
	"rpc_anim_event",
	"rpc_anim_event_variable_float",
	"rpc_update_anim_variable_done",
	"rpc_attack_hit",
	"rpc_enemy_has_target",
	"rpc_enemy_is_alerted",
	"rpc_set_blocking",
	"rpc_status_change_bool",
	"rpc_skinned_surface_mtr_fx",
	"rpc_surface_mtr_fx",
	"rpc_surface_mtr_fx_lvl_unit",
	"rpc_play_melee_hit_effects",
	"rpc_weapon_blood",
	"rpc_link_unit",
	"rpc_play_first_person_sound",
	"rpc_server_audio_event",
	"rpc_server_audio_event_at_pos",
	"rpc_server_audio_unit_event",
	"rpc_server_audio_unit_param_string_event",
	"rpc_server_audio_unit_param_int_event",
	"rpc_server_audio_unit_param_float_event",
	"rpc_client_audio_set_global_parameter_with_lerp",
	"rpc_sync_door_state",
	"rpc_add_external_velocity",
	"rpc_tutorial_message",
	"rpc_player_blocked_attack",
	"rpc_set_wounded",
	"rpc_alert_enemy",
	"rpc_start_mission_with_unit",
	"rpc_update_mission",
	"rpc_end_mission",
	"rpc_objective_entered_socket_zone",
	"rpc_create_explosion",
	"rpc_area_damage",
	"rpc_player_projectile_impact_dynamic",
	"rpc_client_spawn_light_weight_projectile",
	"rpc_client_despawn_light_weight_projectile",
	"rpc_player_projectile_impact_level",
	"rpc_projectile_stopped",
	"rpc_generic_impact_projectile_impact",
	"rpc_show_inventory",
	"rpc_server_set_inventory_packages",
	"rpc_server_assign_peer_to_profile",
	"rpc_server_unassign_peer_to_profile",
	"rpc_add_equipment",
	"rpc_create_attachment",
	"rpc_client_select_inventory",
	"rpc_wield_equipment",
	"rpc_destroy_slot",
	"rpc_set_current_location",
	"rpc_sync_damage_taken",
	"rpc_flow_state_story_played",
	"rpc_flow_state_story_stopped",
	"rpc_flow_state_number_changed",
	"rpc_add_buff",
	"rpc_server_audio_unit_event",
	"rpc_remove_server_controlled_buff",
	"rpc_ping",
	"rpc_pong"
}

if not script_data.debug_interactions then
	GameSettingsDevelopment.ignored_rpc_logs[#GameSettingsDevelopment.ignored_rpc_logs + 1] = "rpc_interaction_approved"
	GameSettingsDevelopment.ignored_rpc_logs[#GameSettingsDevelopment.ignored_rpc_logs + 1] = "rpc_interaction_abort"
	GameSettingsDevelopment.ignored_rpc_logs[#GameSettingsDevelopment.ignored_rpc_logs + 1] = "rpc_interaction_completed"
end

if not script_data.debug_voip then
	GameSettingsDevelopment.ignored_rpc_logs[#GameSettingsDevelopment.ignored_rpc_logs + 1] = "rpc_voip_room_request"
	GameSettingsDevelopment.ignored_rpc_logs[#GameSettingsDevelopment.ignored_rpc_logs + 1] = "rpc_voip_room_to_join"
end

local rpcs_logged = false

GameSettingsDevelopment.set_ignored_rpc_logs = function ()
	local ignored_rpc_logs = GameSettingsDevelopment.ignored_rpc_logs

	for i = 1, #ignored_rpc_logs, 1 do
		local rpc_name = ignored_rpc_logs[i]

		Network.ignore_rpc_log(rpc_name)

		if script_data.network_log_messages and not rpcs_logged then
			printf("[Network] Setting log ignore for RPC %s", rpc_name)
		end
	end

	rpcs_logged = true
end

DefaultDisplayModes = {
	{
		640,
		480,
		0
	},
	{
		800,
		600,
		0
	},
	{
		1024,
		768,
		0
	},
	{
		1280,
		720,
		0
	},
	{
		1280,
		1024,
		0
	},
	{
		1344,
		756,
		0
	},
	{
		1366,
		768,
		0
	},
	{
		1440,
		900,
		0
	},
	{
		1600,
		900,
		0
	},
	{
		1600,
		1024,
		0
	},
	{
		1600,
		1200,
		0
	},
	{
		1680,
		1050,
		0
	},
	{
		1920,
		1080,
		0
	}
}

return
