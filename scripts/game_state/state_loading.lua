-- chunkname: @scripts/game_state/state_loading.lua

require("scripts/game_state/server_join_state_machine")
require("scripts/game_state/loading_sub_states/win32/state_loading_running")
require("scripts/game_state/loading_sub_states/win32/state_loading_restart_network")
require("scripts/game_state/loading_sub_states/win32/state_loading_migrate_host")
require("scripts/helpers/level_helper")
require("scripts/settings/level_settings")
require("scripts/utils/async_level_spawner")
require("scripts/game_state/loading_sub_states/win32/state_loading_versus_migration")

StateLoading = class(StateLoading)
StateLoading.NAME = "StateLoading"

local DO_RELOAD = false
local AFK_TIMER = 30

StateLoading.round_start_auto_join = 10
StateLoading.round_start_join_allowed = 20
StateLoading.join_lobby_timeout = 120
StateLoading.join_lobby_refresh_interval = 5
StateLoading.LoadoutResyncStates = {
	CHECK_RESYNC = "check_resync",
	DONE = "done",
	IDLE = "idle",
	NEEDS_RESYNC = "needs_resync",
	RESYNCING = "resyncing",
	WAIT_FOR_LEVEL_LOAD = "wait_for_level_load",
}

local LOADING_SCREEN_MUSIC_BY_GAME_MECHANISM = {
	adventure = "Play_loading_screen_music",
	demo = "Play_loading_screen_music",
	deus = "Play_loading_screen_music_morris",
	inn = "Play_loading_screen_music",
	inn_vs = "Play_loading_screen_music_versus_small",
	quad = "Play_loading_screen_music",
	survival = "Play_loading_screen_music",
	tutorial = "Play_loading_screen_music",
	versus = "Play_loading_screen_music_versus",
	weave = "Play_loading_screen_music",
}

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end
end

StateLoading.on_enter = function (self, param_block)
	print("[Gamestate] Enter state StateLoading")

	local loading_context = self.parent.loading_context
	local time_spent_in_level = loading_context.time_spent_in_level
	local end_reason = loading_context.end_reason

	Managers.load_time:start_timer(time_spent_in_level, end_reason)

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("suspended")
	end

	if IS_XB1 then
		Application.set_kinect_enabled(true)
	end

	if not IS_WINDOWS then
		Managers.chat:set_chat_enabled(Application.user_setting("chat_enabled"))
	end

	if not DEDICATED_SERVER then
		GlobalShaderFlags.reset()
	end

	Framerate.set_low_power()
	Wwise.set_state("inside_waystone", "false")

	self._registered_rpcs = false
	self._loading_view_setup_is_done = false

	self:set_loadout_resync_state(StateLoading.LoadoutResyncStates.IDLE)
	self:_setup_state_managers()
	self:_setup_garbage_collection()
	self:_setup_world()
	self:_setup_input()
	self:_parse_loading_context()
	self:_create_loading_view()
	self:_setup_end_of_level_ui()
	self:_setup_first_time_ui()
	self:_setup_init_network_view()
	Managers.popup:set_input_manager(self._input_manager)

	if not DEDICATED_SERVER then
		Managers.chat:set_input_manager(self._input_manager)
	end

	self:_setup_state_machine()
	self:_unmute_all_world_sounds()

	if self._switch_to_tutorial_backend then
		Managers.backend:start_tutorial()
		Managers.mechanism:choose_next_state(self._wanted_tutorial_state)
		Managers.mechanism:progress_state()

		self.parent.loading_context.switch_to_tutorial_backend = nil
		self.parent.loading_context.wanted_tutorial_state = nil
	elseif LAUNCH_MODE == "attract_benchmark" then
		Managers.backend:start_benchmark()
	end

	if self._lobby_client ~= nil and not self._lobby_client:is_dedicated_server() then
		Managers.party:set_leader(self._lobby_client:lobby_host())
	end

	Managers.transition:hide_icon_background()
	Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
	Managers.light_fx:set_lightfx_color_scheme("loading")

	self._menu_setup_done = false

	if IS_XB1 and self._lobby_host then
		Managers.account:set_round_id()
	end

	if self._network_client then
		self._network_client.voip:set_input_manager(self._input_manager)
	end

	if self._network_server then
		self._network_server.voip:set_input_manager(self._input_manager)
	end

	if self.parent.loading_context.finished_tutorial then
		self.parent.loading_context.finished_tutorial = nil
		self.parent.loading_context.show_profile_on_startup = true

		if not Managers.play_go:installed() then
			self._wanted_state = StateTitleScreen
			self._teardown_network = true
		end
	end

	self._has_invitation_error = false

	if DEDICATED_SERVER then
		local level_key = Managers.level_transition_handler:get_current_level_key()

		if not self:loading_view_setup_done() then
			self:setup_loading_view(level_key)
		end
	end

	self._ingame_world_object = nil
	self._ingame_level_object = nil

	local forced = true

	Managers.music:unduck_sounds(forced)
end

StateLoading._setup_state_managers = function (self)
	Managers.state.event = EventManager:new(Managers.persistent_event)
end

StateLoading.set_loadout_resync_state = function (self, state)
	fassert(table.contains(StateLoading.LoadoutResyncStates, state), "[StateLoading] State %s not found in LoadoutResyncStates", tostring(state))

	self._loadout_resync_state = state
end

StateLoading.loadout_resync_state = function (self)
	return self._loadout_resync_state
end

StateLoading._setup_input = function (self)
	local input_manager = InputManager:new()

	Managers.input = input_manager
	self._input_manager = input_manager

	input_manager:initialize_device("keyboard", 1)
	input_manager:initialize_device("mouse", 1)
	input_manager:initialize_device("gamepad", 1)
	input_manager:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
	input_manager:map_device_to_service("Player", "keyboard")
	input_manager:map_device_to_service("Player", "mouse")
	input_manager:map_device_to_service("Player", "gamepad")
	input_manager:create_input_service("ingame_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("ingame_menu", "keyboard")
	input_manager:map_device_to_service("ingame_menu", "mouse")
	input_manager:map_device_to_service("ingame_menu", "gamepad")
	input_manager:create_input_service("deus_run_stats_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("deus_run_stats_view", "keyboard")
	input_manager:map_device_to_service("deus_run_stats_view", "mouse")
	input_manager:map_device_to_service("deus_run_stats_view", "gamepad")
end

StateLoading._parse_loading_context = function (self)
	local loading_context = self.parent.loading_context

	if loading_context then
		self._network_server = loading_context.network_server
		self._network_client = loading_context.network_client
		self._lobby_host = loading_context.lobby_host
		self._lobby_client = loading_context.lobby_client
		self._checkpoint_data = loading_context.checkpoint_data
		self._quickplay_bonus = loading_context.quickplay_bonus
		self._local_quickplay_bonus = loading_context.local_quickplay_bonus
		self._level_end_view_context = loading_context.level_end_view_context
		self._switch_to_tutorial_backend = loading_context.switch_to_tutorial_backend
		self._wanted_tutorial_state = loading_context.wanted_tutorial_state
		self._saved_scoreboard_stats = loading_context.saved_scoreboard_stats
	end
end

StateLoading._setup_garbage_collection = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateLoadingRunning")
end

StateLoading._setup_world = function (self)
	self._world_name = "loading_world"
	self._viewport_name = "loading_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, nil, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)
	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1)
end

StateLoading._setup_init_network_view = function (self)
	if Development.parameter("goto_endoflevel") and false then
		require("scripts/game_state/state_loading")

		local async = false

		Managers.package:load("resource_packages/levels/dicegame", "state_loading", nil, async)

		self.parent.loading_context.play_end_of_level_game = true
		self._wanted_state = StateLoading
	else
		require("scripts/game_state/state_ingame")

		self._wanted_state = StateIngame
	end
end

StateLoading._setup_end_of_level_ui = function (self)
	if self._level_end_view_context then
		self._level_end_view_context.lobby = self._lobby_host or self._lobby_client
		self._level_end_view_wrappers = {}
		self._level_end_view_wrappers[1] = LevelEndViewWrapper:new(self._level_end_view_context)

		self._level_end_view_wrappers[1]:start()

		self._level_end_view_context = nil
		self.parent.loading_context.level_end_view_context = nil
	end
end

StateLoading._setup_first_time_ui = function (self)
	local loading_context = self.parent.loading_context

	if (loading_context.first_time or loading_context.gamma_correct or loading_context.play_trailer) and not GameSettingsDevelopment.disable_intro_trailer and not script_data.skip_intro_trailer then
		local mechanism = Managers.mechanism:game_mechanism()
		local inn_level_name = mechanism:get_hub_level_key()
		local level_name = Boot.loading_context and Boot.loading_context.level_key or inn_level_name
		local auto_skip
		local params = {}
		local next_level_key = Managers.level_transition_handler:get_current_level_key()

		params.is_prologue = self._switch_to_tutorial_backend == true

		local platform = PLATFORM

		if IS_WINDOWS or IS_LINUX then
			level_name = Development.parameter("attract_mode") and BenchmarkSettings.auto_host_level or level_name
			level_name = check_bool_string(Development.parameter("auto_host_level")) or Development.parameter("vs_auto_search") and "carousel_hub" or level_name

			local level_settings = LevelSettings[level_name]

			auto_skip = not level_settings.hub_level and not params.is_prologue
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")

			if not auto_skip and Development.parameter("weave_name") then
				auto_skip = true
			end

			local save_data = SaveData

			params.gamma = not save_data.gamma_corrected
			params.trailer = loading_context.play_trailer or Application.user_setting("play_intro_cinematic")
		elseif IS_CONSOLE then
			level_name = check_bool_string(Development.parameter("auto_host_level")) or level_name

			local level_settings = LevelSettings[level_name]

			auto_skip = not level_settings.hub_level
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")

			if not auto_skip and Development.parameter("weave_name") then
				auto_skip = true
			end

			params.gamma = loading_context.gamma_correct
			params.trailer = loading_context.play_trailer or Application.user_setting("play_intro_cinematic")

			if params.gamma or params.trailer then
				auto_skip = false
			end

			params.is_prologue = level_name == "prologue"
		end

		print("[StateLoading] Auto Skip: ", auto_skip)

		loading_context.gamma_correct = nil
		loading_context.play_trailer = nil
		self._first_time_view = TitleLoadingUI:new(self._world, params, auto_skip)

		Managers.transition:hide_loading_icon()
		Managers.chat:enable_gui(false)
		self._loading_view:deactivate()
	end

	loading_context.first_time = nil
end

StateLoading._unmute_all_world_sounds = function (self)
	Managers.music:trigger_event("unmute_all_world_sounds")
end

StateLoading._get_game_difficulty = function (self)
	local level_transition_handler = Managers.level_transition_handler

	return level_transition_handler:get_current_difficulty()
end

StateLoading._create_loading_view = function (self, level_key, act_progression_index)
	if DEDICATED_SERVER then
		return
	end

	local game_difficulty = self:_get_game_difficulty()
	local ui_context = {
		world = self._world,
		input_manager = self._input_manager,
		level_key = level_key,
		game_difficulty = game_difficulty,
		world_manager = Managers.world,
		chat_manager = Managers.chat,
		profile_synchronizer = self._profile_synchronizer,
		act_progression_index = act_progression_index,
		return_to_pc_menu = self.parent.loading_context.return_to_pc_menu,
	}

	self._loading_view = LoadingView:new(ui_context)
	self.parent.loading_context.return_to_pc_menu = nil
end

StateLoading._trigger_loading_view = function (self, level_key, act_progression_index)
	level_key = level_key or Managers.mechanism:default_level_key()

	if not self._loading_music_triggered then
		local game_mechanism = Managers.mechanism:game_mechanism()

		if game_mechanism:should_play_level_introduction() and not Development.parameter("gdc") then
			local level_settings = LevelSettings[level_key]
			local weave_name = self._lobby_client and self._lobby_client:lobby_data("weave_name") or Managers.weave:get_next_weave() or Development.parameter("weave_name")
			local weave_template = WeaveSettings.templates[weave_name]

			if weave_template then
				self._weave_wwise_events = self:_trigger_weave_sound_events(weave_template, level_key, level_settings.is_arena)
			else
				self._wwise_event = self:_trigger_sound_events(level_key)

				self._loading_view:trigger_subtitles(self._wwise_event, Managers.time:time("main"))
			end
		end

		local level_settings = LevelSettings[level_key]
		local mechanism = level_settings.mechanism
		local event_name = LOADING_SCREEN_MUSIC_BY_GAME_MECHANISM[mechanism]

		if game_mechanism.override_loading_screen_music then
			local music_override = game_mechanism:override_loading_screen_music()

			event_name = music_override or event_name
		end

		local active_weave = Managers.weave:get_active_weave()

		if active_weave then
			event_name = "reset_between_winds"
		end

		if act_progression_index and act_progression_index >= 1 and act_progression_index < 4 then
			event_name = event_name .. "_act" .. act_progression_index
		elseif act_progression_index and act_progression_index >= 4 then
			event_name = event_name .. "_finished"
		end

		if event_name then
			Managers.music:trigger_event(event_name)
		end
	end

	self._activate_loading_view = true
	self._loading_music_triggered = true

	Managers.transition:hide_icon_background()
	Managers.transition:force_fade_in()
end

StateLoading.setup_loading_view = function (self, level_key)
	self._level_key = level_key or Managers.mechanism:default_level_key()

	if not DEDICATED_SERVER then
		local package_manager = Managers.package

		if self._ui_package_name and (package_manager:has_loaded(self._ui_package_name, "global_loading_screens") or package_manager:is_loading(self._ui_package_name)) then
			package_manager:unload(self._ui_package_name, "global_loading_screens")
		end

		local level_key = self._level_key
		local level_settings = LevelSettings[level_key]
		local weave_name = Managers.weave:get_next_weave() or Development.parameter("weave_name")

		if level_settings.game_mode == "weave" then
			local weave_name = self._lobby_client and self._lobby_client:lobby_data("selected_mission_id") or weave_name

			if not weave_name or weave_name == "false" or not WeaveSettings.templates[weave_name] then
				if IS_XB1 and not self._lobby_client:is_updating_lobby_data() then
					self._lobby_client:force_update_lobby_data()
				end

				return
			end

			local weave_template = WeaveSettings.templates[weave_name]
			local objectives = weave_template.objectives
			local objective = objectives[1]
			local level_id = objective.level_id
			local level_key = LevelSettings[level_id].level_key
			local wind_name = weave_template.wind

			if level_settings.is_arena then
				local level_key = self._level_key
				local package_name = LevelSettings[level_key].loading_ui_package_name

				self._ui_package_name = "resource_packages/loading_screens/" .. package_name
				self._loading_material_path = nil
				self._loading_material_name = nil
			else
				self._ui_package_name = "resource_packages/loading_screens/" .. "weaves/" .. level_key .. "/" .. level_key .. "_" .. wind_name
				self._loading_material_path = "weaves/" .. level_key .. "/" .. level_key .. "_" .. wind_name
				self._loading_material_name = level_key .. "_" .. wind_name
			end

			self._weave_data = {
				weave_display_name = weave_template.display_name,
				location_display_name = level_settings.display_name,
				wind_name = weave_template.wind,
				is_arena = level_settings.is_arena,
				objective_name = objective.display_name,
			}
		else
			local package_name = LevelSettings[level_key].loading_ui_package_name

			self._ui_package_name = "resource_packages/loading_screens/" .. package_name
			self._loading_material_path = nil
			self._loading_material_name = nil
			self._weave_data = nil
		end

		local act_progression_index

		if not package_manager:has_loaded(self._ui_package_name) and not package_manager:has_loaded(self._ui_package_name, "global_loading_screens") then
			package_manager:load(self._ui_package_name, "global_loading_screens", callback(self, "cb_loading_screen_loaded", self._level_key, act_progression_index), true, true)
		else
			self:cb_loading_screen_loaded(self._level_key, act_progression_index, true)
		end
	end

	self._loading_view_setup_is_done = true
end

StateLoading.loading_view_setup_done = function (self)
	return self._loading_view_setup_is_done
end

StateLoading.setup_menu_assets = function (self)
	local reference_name = "menu_assets"
	local package_name_ingame = "resource_packages/menu_assets"
	local package_manager = Managers.package
	local ingame_package_loaded = package_manager:has_loaded(package_name_ingame, reference_name) or package_manager:is_loading(package_name_ingame, reference_name)
	local load_package_path

	if not ingame_package_loaded then
		load_package_path = package_name_ingame
	end

	if load_package_path then
		package_manager:load(load_package_path, reference_name, nil, true, true)

		self._ui_loading_package_reference_name = reference_name
		self._ui_loading_package_path = load_package_path
	end

	self._menu_setup_done = true
end

StateLoading.menu_assets_setup_done = function (self)
	return self._menu_setup_done
end

StateLoading.cb_loading_screen_loaded = function (self, level_key, act_progression_index, skip_fade)
	if self._first_time_view or self._level_end_view_wrappers then
		local game_difficulty = self:_get_game_difficulty()

		self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty, self._loading_material_path, self._loading_material_name, self._weave_data)
	elseif skip_fade then
		self:cb_loading_screen_change_fade(level_key, act_progression_index, skip_fade)
	else
		Managers.transition:fade_in(3, callback(self, "cb_loading_screen_change_fade", level_key, act_progression_index))
	end
end

StateLoading.cb_loading_screen_change_fade = function (self, level_key, act_progression_index, skip_fade)
	local game_difficulty = self:_get_game_difficulty()

	self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty, self._loading_material_path, self._loading_material_name, self._weave_data)
	self:_trigger_loading_view(level_key, act_progression_index)

	if not skip_fade then
		Managers.transition:fade_out(3)
	end
end

StateLoading._trigger_sound_events = function (self, level_key)
	local level_settings = LevelSettings[level_key]
	local loading_screen_wwise_events = level_settings.loading_screen_wwise_events
	local career_specific_events

	if loading_screen_wwise_events then
		local network_server = self._network_server
		local network_client = self._network_client
		local profile_synchronizer = network_server and network_server.profile_synchronizer or network_client and network_client.profile_synchronizer

		if profile_synchronizer then
			local peers_with_full_profiles = profile_synchronizer:get_peers_with_full_profiles()

			for i = 1, #peers_with_full_profiles do
				local peer_data = peers_with_full_profiles[i]
				local profile_index = peer_data.profile_index
				local career_index = peer_data.career_index
				local profile = SPProfiles[profile_index]
				local career = profile and profile.careers[career_index]
				local career_name = career and career.name

				if loading_screen_wwise_events[career_name] then
					career_specific_events = career_specific_events or {}

					table.append(career_specific_events, loading_screen_wwise_events[career_name])
				end
			end
		end
	end

	local wwise_events = career_specific_events or loading_screen_wwise_events

	if wwise_events ~= nil and #wwise_events > 0 then
		local level_seed = Managers.level_transition_handler:get_current_level_seed()
		local _, random_id = Math.next_random(level_seed, 1, #wwise_events)
		local wwise_event = wwise_events[random_id]

		if not script_data.disable_level_intro_dialogue then
			local wwise_playing_id, wwise_source_id = Managers.music:trigger_event(wwise_event)

			self.wwise_playing_id = wwise_playing_id
		end

		return wwise_event
	end
end

StateLoading._trigger_weave_sound_events = function (self, weave_template, level_key, is_arena)
	local wwise_events
	local level_settings = LevelSettings[level_key]
	local wind_name = weave_template.wind
	local wind_settings = WindSettings[wind_name]
	local wind_wwise_events = wind_settings.loading_screen_wwise_events

	if is_arena then
		local primary_arena_wwise_event = wind_wwise_events.primary_arena_wwise_events[Math.random(#wind_wwise_events.primary_arena_wwise_events)]
		local secondary_arena_wwise_event = wind_wwise_events.secondary_arena_wwise_events[Math.random(#wind_wwise_events.secondary_arena_wwise_events)]

		wwise_events = {
			primary_arena_wwise_event,
			secondary_arena_wwise_event,
		}
	else
		local lore_wwise_event = wind_wwise_events.lore[Math.random(#wind_wwise_events.lore)]
		local mechanics_wwise_event = wind_wwise_events.mechanics[Math.random(#wind_wwise_events.mechanics)]
		local objective_wwise_event

		if not level_settings.is_arena then
			local first_objective = 1
			local weave_objective_data = weave_template.objectives[first_objective]
			local objective_name = weave_objective_data.display_name
			local wwise_objective_events = wind_wwise_events.objectives[objective_name]

			objective_wwise_event = wwise_objective_events[Math.random(#wwise_objective_events)]
		end

		wwise_events = {
			lore_wwise_event,
			mechanics_wwise_event,
			objective_wwise_event,
		}
	end

	Managers.music:stop_event_queue("weave_loading_vo")

	local delay = 0.5

	if not script_data.disable_level_intro_dialogue then
		local wwise_playing_id, wwise_source_id = Managers.music:trigger_event_queue("weave_loading_vo", wwise_events, delay)

		self.wwise_playing_id = wwise_playing_id
	end

	return wwise_events
end

StateLoading._setup_state_machine = function (self)
	local params = {
		world = self._world,
		viewport = self._viewport,
		loading_view = self._loading_view,
		starting_tutorial = self._switch_to_tutorial_backend,
	}

	if self.parent.loading_context.restart_network then
		self._machine = GameStateMachine:new(self, StateLoadingRestartNetwork, params, true)
	elseif self.parent.loading_context.host_migration_info then
		self._machine = GameStateMachine:new(self, StateLoadingMigrateHost, params, true)
	elseif self.parent.loading_context.versus_migration then
		self._machine = GameStateMachine:new(self, StateLoadingVersusMigration, params, true)
	else
		self._machine = GameStateMachine:new(self, StateLoadingRunning, params, true)
	end
end

StateLoading._handle_do_reload = function (self)
	if self.wwise_playing_id then
		Managers.music:stop_event_id(self.wwise_playing_id)

		self.wwise_playing_id = nil
	end

	if DO_RELOAD and self._wwise_event then
		self.wwise_playing_id = Managers.music:trigger_event(self._wwise_event)
		DO_RELOAD = false
	elseif DO_RELOAD and self._weave_wwise_events then
		Managers.music:stop_event_queue("weave_loading_vo")

		local delay = 0.5

		self.wwise_playing_id = Managers.music:trigger_event_queue("weave_loading_vo", self._weave_wwise_events, delay)
		DO_RELOAD = false
	end
end

StateLoading.set_invitation_error = function (self)
	self._has_invitation_error = true
end

StateLoading._matchmaking_packages_loaded = function (self)
	local matchmaking_manager = Managers.matchmaking

	return not matchmaking_manager or matchmaking_manager:all_packages_loaded()
end

StateLoading.update = function (self, dt, t)
	if script_data.subtitle_debug then
		self:_handle_do_reload()
	end

	Network.update_receive(dt, self._network_event_delegate.event_table)
	self:_update_network(dt, t)

	local level_transition_handler = Managers.level_transition_handler

	if IS_PS4 and not self._popup_id and not self._handled_psn_client_error and self:_update_loading_global_packages() and level_transition_handler:all_packages_loaded() and level_transition_handler.enemy_package_loader:loading_completed() and level_transition_handler.transient_package_loader:loading_completed() and self:_matchmaking_packages_loaded() and Managers.backend:profiles_loaded() then
		local psn_client_error = Managers.account:psn_client_error()

		if psn_client_error then
			printf("[StateLoading] PSN CLIENT ERROR %s", psn_client_error)
			self:create_popup("failure_psn_client_error", "popup_error_topic", "restart_as_server", "menu_accept")

			self._handled_psn_client_error = true
			self._wanted_state = StateTitleScreen
		end
	end

	if IS_CONSOLE and self._has_invitation_error and not self._popup_id then
		self:create_popup("invite_broken", "invite_error", "restart_as_server", "menu_accept")

		self._wanted_state = StateTitleScreen
		self._has_invitation_error = false
	end

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	Managers.backend:update(dt, t)
	Managers.input:update(dt)
	level_transition_handler:update(dt)

	if self._should_start_breed_loading and level_transition_handler:all_packages_loaded() and level_transition_handler.enemy_package_loader:matching_session(self._network_server or self._network_client) and (not self._lobby_host or self._lobby_host:network_initialized()) then
		local weave_name = Managers.weave:get_next_weave() or Development.parameter("weave_name")
		local weave_objective_index = Managers.weave:get_next_objective() or 1
		local weave_data = WeaveSettings.templates[weave_name]
		local level_key = level_transition_handler:get_current_level_key()
		local is_hub_level = LevelSettings[level_key].hub_level

		if weave_data and not is_hub_level then
			ConflictUtils.patch_terror_events_with_weaves(level_key, weave_data, weave_objective_index)
		end

		if self._network_server then
			local level_seed = level_transition_handler:get_current_level_seed()
			local locked_director_functions = level_transition_handler:get_current_locked_director_functions()
			local conflict_director = level_transition_handler:get_current_conflict_director()
			local difficulty = level_transition_handler:get_current_difficulty()
			local difficulty_tweak = level_transition_handler:get_current_difficulty_tweak()
			local use_random_directors = Managers.mechanism:uses_random_directors()

			level_transition_handler.enemy_package_loader:setup_startup_enemies(level_key, level_seed, locked_director_functions, use_random_directors, conflict_director, difficulty, difficulty_tweak)
		end

		self._should_start_breed_loading = nil
	end

	Managers.music:update(dt, t)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end

	if self._level_end_view_wrappers then
		local level_end_view_wrapper = self._level_end_view_wrappers[1]

		level_end_view_wrapper:update(dt, t)

		if level_end_view_wrapper:done() then
			if level_end_view_wrapper:do_retry() then
				self._wanted_state = StateLoading
				self._do_reload = true
			end

			self:_tear_down_level_end_view_wrappers()
			Managers.weave:clear_weave_data()
		end
	elseif self._first_time_view then
		self._first_time_view:update(dt, t)
	elseif self._loading_view and not self._do_reload then
		if self._activate_loading_view then
			self._loading_view:activate()
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

			self._activate_loading_view = nil
		end

		self._loading_view:update(dt)
	end

	self:_update_loading_screen(dt, t)
	self._machine:update(dt, t)
	self:_update_lobbies(dt, t)

	if Managers.matchmaking then
		Managers.matchmaking:update(dt, t)
	end

	if Managers.game_server then
		Managers.game_server:update(dt, t)
	end

	if Managers.eac ~= nil then
		Managers.eac:update(dt, t)
	end

	local menu_active, menu_input_service = false

	if self._level_end_view_wrappers then
		local level_end_view = self._level_end_view_wrappers[1]:level_end_view()

		if level_end_view:enable_chat() then
			menu_active = true
			menu_input_service = level_end_view:active_input_service()
		end
	end

	Managers.chat:update(dt, t, menu_active, menu_input_service)
	Network.update_transmit(dt)

	return self:_try_next_state(dt)
end

StateLoading._update_network = function (self, dt, t)
	if self._network_server then
		self._network_server:update(dt, t)

		local disconnected = self._network_server:disconnected()

		if disconnected and not self._popup_id then
			local text_id = self:_get_lost_connection_text_id()

			self:create_popup(text_id, "popup_error_topic", "restart_as_server", "menu_accept")
			self:_destroy_network_handler(false)
			self:_destroy_lobby_host()
		end
	elseif self._network_client then
		self._network_client:update(dt, t)

		if self._network_client:is_in_post_game() and not self._in_post_game_popup_id and not self._in_post_game_popup_shown then
			self._in_post_game_popup_id = Managers.popup:queue_popup(Localize("popup_is_in_post_game"), Localize("matchmaking_status_waiting_for_host"), "return_to_inn", Localize("return_to_inn"))
			self._in_post_game_popup_shown = true

			Managers.popup:activate_timer(self._in_post_game_popup_id, 200, "timeout", "center", false, function (timer)
				return string.format(Localize("timer_max_time") .. ": %.2d:%.2d", timer / 60 % 60, timer % 60)
			end, 28)
		elseif not self._network_client:is_in_post_game() and self._in_post_game_popup_id then
			Managers.popup:cancel_popup(self._in_post_game_popup_id)

			self._in_post_game_popup_id = nil
		end

		local bad_state, state = self._network_client:has_bad_state()

		if bad_state and not self._popup_id then
			print("bad_state:", state)

			self._wanted_state = StateTitleScreen

			if self._in_post_game_popup_id then
				Managers.popup:cancel_popup(self._in_post_game_popup_id)

				self._in_post_game_popup_id = nil
			end

			local fail_reason = self._network_client.fail_reason or "broken_connection"

			self:_destroy_network_handler(false)

			if self._lobby_client then
				self:create_popup(fail_reason, "popup_error_topic", "restart_as_server", "menu_accept")
				self:_destroy_lobby_client()
			end
		end
	end
end

StateLoading._get_lost_connection_text_id = function (self)
	local text_id

	text_id = (IS_WINDOWS or IS_LINUX) and (rawget(_G, "Steam") and "failure_start_no_steam" or "broken_connection") or IS_XB1 and (not Network.xboxlive_client_exists() and "failure_start_xbox_live_client" or "failure_start_xbox_lobby_create") or IS_PS4 and "failure_psn_client_error" or "failure_start"

	return text_id
end

StateLoading._update_lobbies = function (self, dt, t)
	if not self:_update_loading_global_packages() then
		return
	end

	if self._network_transmit then
		self._network_transmit:transmit_local_rpcs()
	end

	if self._password_request ~= nil then
		self._password_request:update(dt)

		local action, user_data, password = self._password_request:result()

		if action ~= nil then
			if action == "join" then
				self._server_lobby = GameServerLobbyClient:new(user_data.network_options, user_data.game_server_data, password)
			else
				self._teardown_network = true
				self._permission_to_go_to_next_state = true
				self._wanted_state = StateTitleScreen
			end

			self._password_request:destroy()

			self._password_request = nil
		end
	end

	if self._lobby_host then
		local lobby_host = self._lobby_host

		lobby_host:update(dt)

		if lobby_host:is_joined() and not lobby_host:network_initialized() and self._lobby_host:lobby_host() ~= "0" then
			if not self._network_server then
				self:host_joined()
			end

			local own_peer_id = Network.peer_id()
			local host_peer_id = lobby_host:lobby_host()
			local is_server = true
			local network_server = self._network_server

			self:setup_chat_manager(lobby_host, host_peer_id, own_peer_id, is_server)
			self:setup_deed_manager(lobby_host, host_peer_id, own_peer_id, is_server, network_server)
			self:setup_enemy_package_loader(lobby_host, host_peer_id, own_peer_id, network_server)
			self:setup_global_managers(lobby_host, host_peer_id, own_peer_id, is_server, network_server)
			lobby_host:set_network_initialized(true)
		elseif self._lobby_host.state == LobbyState.FAILED and not self._popup_id then
			local text_id

			text_id = (IS_WINDOWS or IS_LINUX) and (rawget(_G, "Steam") and (Steam.connected() and "failure_start_steam_lobby_create" or "failure_start_no_steam") or "failure_start_no_lan") or IS_XB1 and (not Network.xboxlive_client_exists() and "failure_start_xbox_live_client" or "failure_start_xbox_lobby_create") or IS_PS4 and "failure_start_psn_lobby_create" or "failure_start"

			if self._network_server then
				self._network_server:disconnect_all_peers("unknown_error")
				self:_destroy_network_handler(false)
			end

			self:_destroy_lobby_host()
			self:create_popup(text_id, "popup_error_topic", "restart_as_server", "menu_accept")
		end
	elseif self._lobby_finder then
		self:_update_lobby_join(dt, t)
	elseif self._server_lobby then
		self:_update_server_lobby_join(dt, t)
	elseif self._lobby_client then
		self._lobby_client:update(dt)

		local new_lobby_state = self._lobby_client.state

		if not self._lobby_verified and self._lobby_client:is_joined() then
			self:_verify_joined_lobby(dt, t)
		elseif self._lobby_client:failed() and not self._popup_id then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
		end
	end

	if IS_XB1 and self._waiting_for_cleanup and Managers.account:all_sessions_cleaned_up() and t > self._cleanup_wait_time then
		self._cleanup_done_func()

		self._waiting_for_cleanup = nil
		self._cleanup_done_func = nil
	end
end

StateLoading._verify_joined_lobby = function (self, dt, t)
	if IS_XB1 and not self:_update_xbox_lobby_data(dt, t) then
		return
	end

	local host = self._lobby_client:lobby_host()
	local lobby_data = self._lobby_client:get_stored_lobby_data()
	local lobby_id = lobby_data.id
	local lobby_network_hash = lobby_data.network_hash
	local lobby_matchmaking_type_id = lobby_data.matchmaking_type
	local lobby_difficulty = lobby_data.difficulty
	local lobby_mechanism = lobby_data.mechanism
	local lobby_quick_game = lobby_data.quick_game
	local lobby_private = MatchmakingManager.is_lobby_private(lobby_data)

	if lobby_id then
		lobby_network_hash = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "network_hash") or lobby_network_hash
		lobby_matchmaking_type_id = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "matchmaking_type") or lobby_matchmaking_type_id
		lobby_difficulty = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "difficulty") or lobby_difficulty
		lobby_mechanism = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "mechanism") or lobby_mechanism
		lobby_quick_game = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "quick_game") or lobby_quick_game
		lobby_private = LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "is_private") == "true" or lobby_private
	end

	lobby_network_hash = lobby_network_hash or self._lobby_client:lobby_data("network_hash")
	lobby_matchmaking_type_id = lobby_matchmaking_type_id or self._lobby_client:lobby_data("matchmaking_type")
	lobby_difficulty = lobby_difficulty or self._lobby_client:lobby_data("difficulty")
	lobby_mechanism = lobby_mechanism or self._lobby_client:lobby_data("mechanism")
	lobby_quick_game = lobby_quick_game or self._lobby_client:lobby_data("quick_game")
	lobby_private = lobby_private or self._lobby_client:lobby_data("is_private") == "true"

	local lobby_matchmaking_type = IS_PS4 and lobby_matchmaking_type_id or lobby_matchmaking_type_id and NetworkLookup.game_modes[tonumber(lobby_matchmaking_type_id)]
	local ready_to_compare_data = host ~= "0" and lobby_network_hash and lobby_matchmaking_type and lobby_difficulty and self._popup_id == nil

	if ready_to_compare_data then
		local client_network_hash = self._lobby_client.network_hash
		local has_required_dlcs = true
		local required_dlcs = {}
		local mechanism_settings = MechanismSettings[lobby_mechanism] or {}

		if mechanism_settings.required_dlc then
			required_dlcs[mechanism_settings.required_dlc] = true
		end

		local difficulty_settings = DifficultySettings[lobby_difficulty]

		if difficulty_settings and difficulty_settings.dlc_requirement then
			required_dlcs[difficulty_settings.dlc_requirement] = true
		end

		for dlc_name, _ in pairs(required_dlcs) do
			if not Managers.unlock:is_dlc_unlocked(dlc_name) then
				has_required_dlcs = false

				break
			end
		end

		local has_unlocked_game_mode = true

		if not script_data.unlock_all_levels and mechanism_settings.extra_requirements_function and not mechanism_settings.extra_requirements_function() then
			has_unlocked_game_mode = false
		end

		local has_unlocked_difficulty = true
		local difficulty_error_message = ""

		if not Development.parameter("unlock_all_difficulties") and not lobby_private and not mechanism_settings.disable_difficulty_check then
			local best_aquired_power_level = BulldozerPlayer.best_aquired_power_level()

			if best_aquired_power_level < difficulty_settings.required_power_level then
				has_unlocked_difficulty = false

				local required_power_level_localized = Localize("required_power_level")

				difficulty_error_message = string.format("* %s: %s", required_power_level_localized, tostring(UIUtils.presentable_hero_power_level(difficulty_settings.required_power_level)))
			end

			if difficulty_settings.extra_requirement_name then
				local joining_existing_game = true
				local extra_requirement_data = ExtraDifficultyRequirements[difficulty_settings.extra_requirement_name]

				if not extra_requirement_data.requirement_function(joining_existing_game) and (lobby_quick_game ~= "true" or lobby_mechanism ~= "weave") then
					has_unlocked_difficulty = false
					difficulty_error_message = difficulty_error_message .. string.format("\n* %s", Localize(extra_requirement_data.description_text))
				end
			end
		end

		if not has_required_dlcs then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_required_dlc_missing", "popup_error_topic", "restart_as_server", "menu_accept")
		elseif not has_unlocked_game_mode then
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_game_mode_requirements_failed", "popup_error_topic", "restart_as_server", "menu_accept")
		elseif not has_unlocked_difficulty then
			self:_destroy_lobby_client()

			local failure_start_join_server_difficulty_requirement_failed = "failure_start_join_server_difficulty_requirements_failed"

			self:create_popup(failure_start_join_server_difficulty_requirement_failed, "popup_error_topic", "restart_as_server", "menu_accept", difficulty_error_message)
		elseif client_network_hash == lobby_network_hash or Development.parameter("force_ignore_network_hash") then
			if self._handle_new_lobby_connection then
				self:setup_network_client(self._joined_matchmaking_lobby)

				local own_peer_id = Network.peer_id()
				local is_server = false
				local network_handler = self._network_client

				self:setup_chat_manager(self._lobby_client, host, own_peer_id, is_server)
				self:setup_deed_manager(self._lobby_client, host, own_peer_id, is_server, network_handler)
				self:setup_enemy_package_loader(self._lobby_client, host, own_peer_id, network_handler)
				self:setup_global_managers(self._lobby_client, host, own_peer_id, is_server, network_handler)
			end
		else
			self:_destroy_lobby_client()
			self:create_popup("failure_start_join_server_incorrect_hash", "popup_error_topic", "restart_as_server", "menu_accept", client_network_hash, lobby_network_hash)
		end

		self._lobby_verified = true
	elseif IS_XB1 then
		self._xbox_lobby_data_state = "SET_COOLDOWN"
	end
end

local XBOX_LOBBY_DATA_WAIT_TIME = 4

StateLoading._update_xbox_lobby_data = function (self, dt, t)
	local state = self._xbox_lobby_data_state

	if state == "SET_COOLDOWN" then
		self._xbox_lobby_cooldown = t + XBOX_LOBBY_DATA_WAIT_TIME
		state = "WAIT_FOR_COOLDOWN"
	elseif state == "WAIT_FOR_COOLDOWN" then
		if t > self._xbox_lobby_cooldown then
			state = "UPDATE_LOBBY_DATA"
		end
	elseif state == "UPDATE_LOBBY_DATA" then
		self._lobby_client:force_update_lobby_data()

		state = "WAIT_FOR_LOBBY_UPDATE"
	elseif state == "WAIT_FOR_LOBBY_UPDATE" and not self._lobby_client:is_updating_lobby_data() then
		state = "DONE"
	end

	self._xbox_lobby_data_state = state or "DONE"

	return state == "DONE"
end

StateLoading.lobby_verified = function (self)
	return self._lobby_verified
end

StateLoading._destroy_lobby_client = function (self)
	self._lobby_client:destroy()

	self._lobby_client = nil
	self.parent.loading_context.lobby_client = nil

	Managers.account:set_current_lobby(nil)

	if self._voip then
		self._voip:destroy()

		self._voip = nil
	end

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:left_lobby()
		end
	end

	self._wanted_state = StateTitleScreen
end

StateLoading._destroy_lobby_host = function (self)
	self._lobby_host:destroy()

	self._lobby_host = nil
	self.parent.loading_context.lobby_host = nil

	Managers.account:set_current_lobby(nil)

	if Managers.matchmaking then
		if self._registered_rpcs then
			Managers.matchmaking:unregister_rpcs()
		end

		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	self._wanted_state = StateTitleScreen
end

StateLoading._update_lobby_join = function (self, dt, t)
	local unique_server_name = Development.parameter("unique_server_name")
	local found = false
	local lobby_finder = self._lobby_finder

	lobby_finder:update(dt)

	local lobbies = lobby_finder:lobbies()

	for i, lobby in ipairs(lobbies) do
		local auto_join_this_lobby = false

		if not self._lobby_to_join and not self._host_to_join and unique_server_name and lobby.unique_server_name == unique_server_name then
			auto_join_this_lobby = true
		elseif self._lobby_to_join and self._lobby_to_join == lobby.id then
			auto_join_this_lobby = true
		elseif self._host_to_join and self._host_to_join == lobby.host then
			auto_join_this_lobby = true
		end

		if lobby.valid and auto_join_this_lobby then
			print("=======================Autojoining this lobby")

			local network_options = LobbySetup.network_options()

			self._lobby_client = LobbyClient:new(network_options, lobby)

			self._lobby_finder:destroy()

			self._lobby_finder = nil
			self._handle_new_lobby_connection = true
			found = true

			Managers.account:set_current_lobby(self._lobby_client.lobby)

			if self._lobby_joined_callback then
				self._lobby_joined_callback()

				self._lobby_joined_callback = nil
			end

			break
		end
	end

	if not found and t > self._lobby_finder_timeout and not self._popup_id then
		self._lobby_finder:destroy()

		self._lobby_finder = nil

		local name = self._host_to_join_name or Development.parameter("unique_server_name")

		self:create_popup("failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end

	if self._lobby_finder and not found and t > self._lobby_finder_refresh_timer then
		printf("=======================Refresh lobby_finder search")
		self._lobby_finder:refresh()

		self._lobby_finder_refresh_timer = t + StateLoading.join_lobby_refresh_interval
	end
end

StateLoading._update_server_lobby_join = function (self, dt, t)
	local lobby = self._server_lobby

	lobby:update(dt)

	local state = lobby:state()

	if lobby:is_joined() then
		self._lobby_client = lobby
		self._server_lobby = nil
		self._handle_new_lobby_connection = true

		Managers.account:set_current_lobby(self._lobby_client.lobby)

		if self._lobby_joined_callback then
			self._lobby_joined_callback()

			self._lobby_joined_callback = nil
		end

		return
	elseif lobby:failed() then
		self._server_lobby:destroy()

		self._server_lobby = nil

		self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
		Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

		self._wanted_state = StateTitleScreen

		return
	end

	if t > self._lobby_finder_timeout and not self._popup_id then
		local name = self._server_lobby:id()

		self._server_lobby:destroy()

		self._server_lobby = nil

		self:create_popup("failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end
end

StateLoading._update_loading_screen = function (self, dt, t)
	local permission_to_go_to_next_state

	if self._network_server then
		local lobby_host = self._lobby_host

		if lobby_host and lobby_host:is_joined() and self._network_server:waiting_to_enter_game() then
			permission_to_go_to_next_state = true
		end
	elseif self._network_client and self._network_client.state == NetworkClientStates.waiting_enter_game then
		permission_to_go_to_next_state = true
	end

	local waiting_for_vo = false

	if script_data.subtitle_debug and not DEDICATED_SERVER then
		local skip = Mouse.button(Mouse.button_index("left")) == 1 and Mouse.button(Mouse.button_index("right")) == 1

		waiting_for_vo = not skip

		if permission_to_go_to_next_state and waiting_for_vo then
			Debug.text("[SubtitleDebug] Waiting for both mouse buttons to progress...")
		end
	end

	local level_name = Managers.level_transition_handler:get_current_level_keys()

	if permission_to_go_to_next_state and not self._permission_to_go_to_next_state and not waiting_for_vo and level_name then
		local level_index = NetworkLookup.level_keys[level_name]

		if self._network_server then
			self._network_server.network_transmit:send_rpc("rpc_level_loaded", Network.peer_id(), level_index)
		end

		Managers.mechanism:load_packages()

		self._permission_to_go_to_next_state = permission_to_go_to_next_state
	end
end

StateLoading._try_next_state = function (self, dt)
	if self._popup_id then
		self:_handle_popup()
	end

	if self._join_popup_id then
		self:_handle_join_popup()
	end

	if self._in_post_game_popup_id and not Managers.account:leaving_game() then
		self:_handle_in_post_game_popup()
	elseif self._in_post_game_popup_id then
		Managers.popup:cancel_popup(self._in_post_game_popup_id)
	end

	if script_data.honduras_demo and Managers.time:get_demo_transition() then
		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	end

	if Managers.account:leaving_game() then
		if not self._ui_package_name or self._ui_package_name and Managers.package:has_loaded(self._ui_package_name) then
			if self._first_time_view then
				self._first_time_view:destroy()

				self._first_time_view = nil
			end

			Managers.transition:show_loading_icon()

			Managers.transition._callback = nil

			Managers.transition:force_fade_in()

			self._teardown_network = true
			self._new_state = StateTitleScreen
		end
	elseif self.offline_invite then
		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	elseif not self._transitioning then
		local ui_done = true

		if self._first_time_view then
			ui_done = self._first_time_view:is_done()

			if ui_done and not self._popup_id and not self:_packages_loaded() and self._level_key then
				self:_trigger_loading_view(self._level_key)
				Managers.transition:show_loading_icon()
				self._first_time_view:destroy()

				self._first_time_view = nil

				Managers.chat:enable_gui(true)
			end
		elseif self._loading_view then
			ui_done = self._loading_view:is_done()
		end

		if self._level_end_view_wrappers then
			ui_done = self:_level_end_view_done()
		end

		local backend_manager = Managers.backend

		if backend_manager:is_disconnected() and not self._popup_id then
			self:_backend_broken()
		end

		if backend_manager:is_waiting_for_user_input() then
			return
		end

		local packages_loaded = self:_packages_loaded()

		if packages_loaded and not self._async_level_spawner then
			local level_transition_handler = Managers.level_transition_handler
			local world_name = LevelHelper.INGAME_WORLD_NAME
			local level_key = level_transition_handler:get_current_level_keys()
			local level_name = LevelSettings[level_key].level_name

			printf("Starting async level spawning of %s", level_name)

			local game_mode_key = level_transition_handler:get_current_game_mode()
			local _, spawned_object_sets = GameModeHelper.get_object_sets(level_name, game_mode_key)
			local frame_time_budget = 0.02

			self._async_level_spawner = AsyncLevelSpawner:new(world_name, level_name, spawned_object_sets, frame_time_budget)
		end

		if self._async_level_spawner and not self._level_spawned then
			local level_spawned, world, level = self._async_level_spawner:update()

			if level_spawned then
				print("Async level spawning done")

				self._level_spawned = true
				self._ingame_world_object = world
				self._ingame_level_object = level

				Level.set_data(level, "intro_wwise_id", self.wwise_playing_id or WwiseUtils.EVENT_ID_NONE)
				print("Spawn additional sub_levels:")

				local level_transition_handler = Managers.level_transition_handler
				local level_key = level_transition_handler:get_current_level_keys()
				local hero_specific_sublevels = LevelSettings[level_key].hero_specific_sublevels

				if hero_specific_sublevels then
					local selected_hero_name_on_load = level_transition_handler.selected_hero_name_on_load
					local selected_hero_sublevels = hero_specific_sublevels[selected_hero_name_on_load]

					if selected_hero_sublevels and #selected_hero_sublevels > 0 then
						local game_mode_key = level_transition_handler:get_current_game_mode()
						local sub_levels = {}

						for sublevel_idx = 1, #selected_hero_sublevels do
							local sublevel_name = selected_hero_sublevels[sublevel_idx]
							local _, spawned_object_sets = GameModeHelper.get_object_sets(sublevel_name, game_mode_key)
							local sub_level = ScriptWorld.spawn_level(world, sublevel_name, spawned_object_sets)

							Level.set_data(sub_level, "parent_level", level)

							sub_levels[sublevel_name] = sub_level

							print(sublevel_name)
						end

						Level.set_data(level, "sub_levels", sub_levels)
					end
				end
			end
		end

		local can_go_to_next_state = self._wanted_state and ui_done and not self._popup_id

		if can_go_to_next_state then
			local ready_to_go_to_next_state = self._permission_to_go_to_next_state and packages_loaded and self._level_spawned
			local backend_is_disconnected = backend_manager:is_disconnected()

			if ready_to_go_to_next_state or backend_is_disconnected or self._teardown_network then
				local allowed_to_continue

				if script_data.honduras_demo then
					allowed_to_continue = false

					if not self._loading_view:showing_press_to_continue() and not self._press_to_continue_shown then
						self._loading_view:show_press_to_continue(true)

						self._press_to_continue_shown = true

						Managers.transition:hide_loading_icon()
					else
						local device = Managers.input:get_most_recent_device()
						local any_pressed = device.any_pressed()

						self._demo_continue_pressed = self._demo_continue_pressed or any_pressed
						allowed_to_continue = self._demo_continue_pressed

						if allowed_to_continue and self._loading_view:showing_press_to_continue() then
							self._loading_view:show_press_to_continue(false)
							Managers.transition:show_loading_icon()
						end
					end
				elseif GameSettingsDevelopment.use_global_chat then
					allowed_to_continue = Irc.is_connected()
				else
					allowed_to_continue = true
				end

				if allowed_to_continue then
					local level_end_view_wrappers = self._level_end_view_wrappers

					if not level_end_view_wrappers and Managers.transition:fade_state() == "out" then
						Managers.transition:fade_in(GameSettings.transition_fade_out_speed)
						printf("[StateLoading] started fadeing in, want to go to state:%s", self._wanted_state.NAME)
					elseif level_end_view_wrappers or Managers.transition:fade_in_completed() then
						self._new_state = self._wanted_state

						printf("[StateLoading] fade_in_completed, new state:%s", self._new_state.NAME)

						if self._join_popup_id then
							Managers.popup:cancel_popup(self._join_popup_id)

							self._join_popup_id = nil
						end
					end
				end
			end
		end
	end

	if IS_CONSOLE then
		self:_handle_afk_timer(dt)
	end

	if (Managers.popup:has_popup() or Managers.account:user_detached() or Managers.account:has_popup()) and not Managers.account:leaving_game() then
		return
	end

	Managers.popup:cancel_all_popups()

	return self._new_state
end

StateLoading._handle_afk_timer = function (self, dt)
	if Managers.account:leaving_game() then
		return
	end

	if Managers.account:has_popup() or self._popup_id then
		local time = Managers.time:time("main")

		self._afk_timer = self._afk_timer or time + AFK_TIMER

		if time > self._afk_timer and (not self._ui_package_name or self._ui_package_name and Managers.package:has_loaded(self._ui_package_name)) then
			if self._first_time_view then
				self._first_time_view:destroy()

				self._first_time_view = nil
			end

			Managers.transition:show_loading_icon()

			Managers.transition._callback = nil

			Managers.transition:force_fade_in()

			self._teardown_network = true
			self._new_state = StateTitleScreen
			self._previous_session_error = "afk_kick"

			Managers.account:initiate_leave_game()
		end
	elseif self._afk_timer then
		self._afk_timer = nil
	end
end

StateLoading._level_end_view_done = function (self)
	local level_end_view_wrapper = self._level_end_view_wrappers[1]

	return level_end_view_wrapper and level_end_view_wrapper:done()
end

StateLoading._handle_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "continue" then
		self._popup_id = nil
	elseif result == "restart_as_server" then
		self._teardown_network = true
		self._popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end
	elseif result == "quit" then
		Boot.quit_game = true
		self._teardown_network = true
		self._popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end
	elseif result then
		printf("[StateLoading:_handle_popup] No such result handled (%s)", result)
	end
end

StateLoading._handle_join_popup = function (self)
	local result = Managers.popup:query_result(self._join_popup_id)

	if result == "cancel" or result == "timeout" then
		Managers.popup:cancel_popup(self._join_popup_id)

		self._teardown_network = true
		self._join_popup_id = nil
		self._permission_to_go_to_next_state = true

		if self._first_time_view then
			self._first_time_view:force_done()
		end

		self._new_state = StateTitleScreen
	elseif result then
		printf("[StateLoading:_handle_join_popup] No such result handled (%s)", result)
	end
end

StateLoading._handle_in_post_game_popup = function (self)
	local result = Managers.popup:query_result(self._in_post_game_popup_id)

	if result then
		if result == "return_to_inn" then
			self._teardown_network = true
			self._restart_network = true
			self._permission_to_go_to_next_state = true

			if self._first_time_view then
				self._first_time_view:force_done()
			end

			self._wanted_state = StateLoading
		end

		self._in_post_game_popup_id = nil
	end
end

StateLoading._backend_broken = function (self)
	print("[StateLoading] Backend_broken, returning to StateTitleScreen")

	self._wanted_state = StateTitleScreen
	self._teardown_network = true
	self._permission_to_go_to_next_state = true

	if self._first_time_view then
		self._first_time_view:force_done()
	end

	if IS_XB1 then
		Managers.account:initiate_leave_game()
	end
end

StateLoading.on_exit = function (self, application_shutdown)
	Framerate.set_playing()

	if self._registered_rpcs then
		self:_unregister_rpcs()
	end

	if self._password_request ~= nil then
		self._password_request:destroy()

		self._password_request = nil
	end

	self._should_start_breed_loading = nil

	local skip_signin = self.parent.loading_context.skip_signin
	local release_level_resources = false

	if application_shutdown or self._teardown_network then
		self:_destroy_network(application_shutdown)

		release_level_resources = true
	else
		local loading_context = {
			network_transmit = self._network_transmit,
			checkpoint_data = self._checkpoint_data,
			quickplay_bonus = self._quickplay_bonus,
			local_quickplay_bonus = self._local_quickplay_bonus,
			level_end_view_wrappers = self._level_end_view_wrappers,
			saved_scoreboard_stats = self._saved_scoreboard_stats,
			host_migration_info = self.parent.loading_context.host_migration_info,
		}

		loading_context.ingame_world_object, self._ingame_world_object = self._ingame_world_object, loading_context.ingame_world_object
		loading_context.ingame_level_object, self._ingame_level_object = self._ingame_level_object, loading_context.ingame_level_object

		local level_transition_handler = Managers.level_transition_handler

		if self._lobby_host then
			loading_context.lobby_host = self._lobby_host

			local level_key = level_transition_handler:get_current_level_keys()
			local stored_lobby_host_data = self._lobby_host:get_stored_lobby_data() or {}

			stored_lobby_host_data.mission_id = level_key
			stored_lobby_host_data.unique_server_name = stored_lobby_host_data.unique_server_name or LobbyAux.get_unique_server_name()
			stored_lobby_host_data.host = stored_lobby_host_data.host or Network.peer_id()
			stored_lobby_host_data.num_players = stored_lobby_host_data.num_players or 1
			stored_lobby_host_data.country_code = Managers.account:region()

			local host_type

			if DEDICATED_SERVER then
				host_type = NetworkLookup.host_types.community_dedicated_server
			else
				host_type = NetworkLookup.host_types.player_hosted
			end

			stored_lobby_host_data.host_type = host_type

			self._lobby_host:set_lobby_data(stored_lobby_host_data)

			if self._lobby_host:is_dedicated_server() then
				self._lobby_host:set_level_name(Localize(LevelSettings[level_key].display_name))
			end

			loading_context.network_server = self._network_server

			self._network_server:unregister_rpcs()
			self._network_server.voip:set_input_manager(nil)
		else
			loading_context.lobby_client = self._lobby_client
			loading_context.network_client = self._network_client

			self._network_client:unregister_rpcs()
			self._network_client.voip:set_input_manager(nil)
		end

		if self._do_reload then
			local weave_manager = Managers.weave
			local current_objective_index = 1
			local current_weave = weave_manager:get_active_weave()
			local current_weave_template = WeaveSettings.templates[current_weave]
			local current_objective = current_weave_template.objectives[current_objective_index]
			local level_key = current_objective.level_id
			local environment_variation_id = 0
			local level_seed = Managers.mechanism:generate_level_seed()
			local current_difficulty = level_transition_handler:get_current_difficulty()
			local current_difficulty_tweak = level_transition_handler:get_current_difficulty_tweak()

			level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, nil, nil, nil, current_difficulty, current_difficulty_tweak)
			level_transition_handler:promote_next_level_data()
		end

		loading_context.show_profile_on_startup = self.parent.loading_context.show_profile_on_startup
		self.parent.loading_context = loading_context
	end

	if self._async_level_spawner then
		self._async_level_spawner:destroy()

		self._async_level_spawner = nil
	end

	if self._ingame_level_object then
		ScriptWorld.trigger_level_shutdown(self._ingame_level_object)
		ScriptWorld.destroy_level_from_reference(self._ingame_world_object, self._ingame_level_object)

		self._ingame_level_object = nil
	end

	if self._ingame_world_object then
		Managers.world:destroy_world(self._ingame_world_object)

		self._ingame_world_object = nil
	end

	self._profile_synchronizer = nil

	if self._network_event_delegate then
		self._network_event_delegate:destroy()

		self._network_event_delegate = nil
	end

	if self._first_time_view then
		self._first_time_view:destroy()

		self._first_time_view = nil
	end

	if self._loading_view then
		if self.parent.loading_context then
			self.parent.loading_context.subtitle_gui = self._loading_view:subtitle_gui()
		end

		self._loading_view:destroy()

		self._loading_view = nil
	end

	self:_tear_down_level_end_view_wrappers()
	self._machine:destroy(application_shutdown)
	Managers.state:destroy()

	if self.parent.loading_context then
		self.parent.loading_context.host_to_migrate_to = nil
		self.parent.loading_context.restart_network = nil
		self.parent.loading_context.players = nil
		self.parent.loading_context.local_player_index = nil
		self.parent.loading_context.skip_signin = skip_signin
		self.parent.loading_context.previous_session_error = self._previous_session_error

		if self._restart_network then
			self.parent.loading_context.restart_network = true
		end
	end

	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)

	local package_manager = Managers.package

	if self._ui_package_name and (package_manager:has_loaded(self._ui_package_name, "global_loading_screens") or package_manager:is_loading(self._ui_package_name)) then
		package_manager:unload(self._ui_package_name, "global_loading_screens")
	end

	Managers.music:trigger_event("Stop_loading_screen_music")

	if IS_WINDOWS then
		fassert(application_shutdown or self._popup_id == nil, "StateLoading added a popup right before exiting")
	else
		Managers.popup:cancel_all_popups()
	end

	Managers.popup:remove_input_manager(application_shutdown)
	Managers.chat:set_input_manager(nil)
	Managers.chat:enable_gui(true)

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("slow")
	end

	if release_level_resources then
		Managers.level_transition_handler:release_level_resources()
	end
end

StateLoading._update_loading_global_packages = function (self)
	local is_loaded = GlobalResources.update_loading()

	return is_loaded
end

StateLoading._packages_loaded = function (self)
	local level_transition_handler = Managers.level_transition_handler

	if level_transition_handler:all_packages_loaded() and Managers.backend:profiles_loaded() then
		local network_server = self._network_server

		if not DEDICATED_SERVER and network_server and not self._has_sent_level_loaded then
			self._has_sent_level_loaded = true

			local level_name = level_transition_handler:get_current_level_keys()
			local level_index = NetworkLookup.level_keys[level_name]

			network_server.network_transmit:send_rpc("rpc_level_loaded", Network.peer_id(), level_index)
		end

		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				return false
			end
		end

		if self._should_start_breed_loading then
			return false
		end

		if not level_transition_handler.enemy_package_loader:loading_completed() then
			return false
		end

		if not level_transition_handler.transient_package_loader:loading_completed() then
			return false
		end

		if not self:_matchmaking_packages_loaded() then
			return false
		end

		local resync_state = self:_update_loadout_resync()

		if resync_state ~= StateLoading.LoadoutResyncStates.DONE then
			return false
		end

		if self._ui_loading_package_path and self._ui_loading_package_reference_name and not package_manager:has_loaded(self._ui_loading_package_path, self._ui_loading_package_reference_name) then
			return false
		end

		if not Managers.mechanism:is_packages_loaded() then
			return false
		end

		return true
	end

	return false
end

StateLoading.load_current_level = function (self)
	print("[StateLoading] load_current_level")

	local done_again_during_loading = self._already_loaded_once

	Managers.mechanism:handle_level_load(done_again_during_loading)

	self._already_loaded_once = true

	if self._network_client then
		self._network_client:set_state(NetworkClientStates.loading)
	end

	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:load_current_level()

	self._should_start_breed_loading = true

	if self._async_level_spawner then
		self._async_level_spawner:destroy()

		self._async_level_spawner = nil
	end

	if self._ingame_level_object then
		ScriptWorld.destroy_level_from_reference(self._ingame_world_object, self._ingame_level_object)

		self._ingame_level_object = nil
	end

	if self._ingame_world_object then
		Managers.world:destroy_world(self._ingame_world_object)

		self._ingame_world_object = nil
	end

	self._level_spawned = false
	self._permission_to_go_to_next_state = false
	self._has_sent_level_loaded = false

	self:set_loadout_resync_state(StateLoading.LoadoutResyncStates.CHECK_RESYNC)
end

StateLoading._update_loadout_resync = function (self)
	local state = self:loadout_resync_state()
	local states = StateLoading.LoadoutResyncStates

	if state == states.IDLE then
		return state
	end

	if state == states.WAIT_FOR_LEVEL_LOAD then
		-- Nothing
	end

	if state == states.CHECK_RESYNC and self:has_joined() and Managers.mechanism:can_resync_loadout() and Managers.backend:is_mirror_ready() and not Managers.backend:is_pending_request() then
		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_key()
		local game_mode = level_transition_handler:get_current_game_mode()

		Managers.backend:get_interface("items"):set_game_mode_specific_items(game_mode)

		local loadout_changed, old_loadout, new_loadout = Managers.backend:set_loadout_interface_override(game_mode)
		local talents_changed = Managers.backend:set_talents_interface_override(game_mode)

		loadout_changed = loadout_changed or talents_changed

		Managers.backend:get_interface("talents"):make_dirty()
		print("[StateLoading] loadout_changed:", loadout_changed, "old_loadout:", old_loadout, "new_loadout:", new_loadout, "level_key:", level_key, "game_mode:", game_mode)
		Managers.mechanism:update_loadout()

		if loadout_changed then
			state = states.NEEDS_RESYNC

			print("[StateLoading] loadout_resync_state CHECK_RESYNC -> NEEDS_RESYNC")
		else
			state = states.DONE

			print("[StateLoading] loadout_resync_state CHECK_RESYNC -> DONE")
		end
	end

	if state == states.NEEDS_RESYNC then
		local network_server = self._network_server
		local network_client = self._network_client
		local profile_synchronizer = network_server and network_server.profile_synchronizer or network_client and network_client.profile_synchronizer

		if profile_synchronizer then
			local peer_id = Network.peer_id()
			local local_player_id = 1
			local is_bot = false
			local force_resync = true

			profile_synchronizer:resync_loadout(peer_id, local_player_id, is_bot, force_resync)

			state = states.RESYNCING

			print("[StateLoading] loadout_resync_state NEEDS_RESYNC -> RESYNCING")
		end
	end

	if state == states.RESYNCING then
		local network_server = self._network_server
		local network_client = self._network_client
		local profile_synchronizer = network_server and network_server.profile_synchronizer or network_client and network_client.profile_synchronizer

		if profile_synchronizer then
			local all_loaded = profile_synchronizer:all_synced()

			if all_loaded then
				state = states.DONE

				print("[StateLoading] loadout_resync_state RESYNCING -> DONE")
			end
		end
	end

	if state ~= self:loadout_resync_state() then
		self:set_loadout_resync_state(state)
	end

	return state
end

StateLoading._destroy_network_handler = function (self, application_shutdown)
	if self._network_server or self._network_client then
		local level_transition_handler = Managers.level_transition_handler
		local enemy_package_loader = level_transition_handler.enemy_package_loader

		enemy_package_loader:network_context_destroyed()
		enemy_package_loader:unload_enemy_packages(application_shutdown, "StateLoading:_destroy_network")

		local transient_package_loader = level_transition_handler.transient_package_loader

		transient_package_loader:network_context_destroyed()
		transient_package_loader:unload_all_packages()
		Managers.party:network_context_destroyed()
		Managers.mechanism:network_context_destroyed()
	end

	if self._network_server then
		self._network_server:destroy()

		self._network_server = nil
	elseif self._network_client then
		self._network_client:destroy()

		self._network_client = nil
	end
end

StateLoading._destroy_network = function (self, application_shutdown)
	PartyManager.reset()

	if Managers.matchmaking then
		Managers.matchmaking:destroy()

		Managers.matchmaking = nil
	end

	if self._lobby_finder then
		self._lobby_finder:destroy()

		self._lobby_finder = nil
	end

	if self._server_lobby then
		self._server_lobby:destroy()

		self._server_lobby = nil
	end

	if self._lobby_client then
		self._lobby_client:destroy()

		self._lobby_client = nil

		Managers.account:set_current_lobby(nil)
	end

	self:_destroy_network_handler(true)

	if self._lobby_host then
		self._lobby_host:destroy()

		self._lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	if rawget(_G, "LobbyInternal") then
		if Managers.party:has_party_lobby() then
			local lobby = Managers.party:steal_lobby()

			if type(lobby) ~= "table" then
				LobbyInternal.leave_lobby(lobby)
			end
		end

		LobbyInternal.shutdown_client()
	end

	Managers.chat:unregister_channel(1)
	Managers.mechanism:mechanism_try_call("unregister_chats")

	self.parent.loading_context = {}

	if self.offline_invite then
		self.offline_invite = nil
		self.parent.loading_context.offline_invite = true
	end

	if self._network_transmit then
		self._network_transmit:destroy()

		self._network_transmit = nil
	end

	if self._switch_to_tutorial_backend then
		Managers.backend:stop_tutorial()
	end
end

StateLoading._tear_down_level_end_view_wrappers = function (self)
	local level_end_view_wrappers = self._level_end_view_wrappers

	if level_end_view_wrappers then
		for i = 1, #level_end_view_wrappers do
			level_end_view_wrappers[i]:destroy()
		end
	end

	self._level_end_view_wrappers = nil
end

StateLoading.set_matchmaking = function (self, matchmaking)
	self._joined_matchmaking_lobby = matchmaking
end

StateLoading.has_registered_rpcs = function (self)
	return self._registered_rpcs
end

StateLoading.register_rpcs = function (self)
	local network_event_delegate = NetworkEventDelegate:new()

	self._network_event_delegate = network_event_delegate

	Managers.level_transition_handler:register_rpcs(network_event_delegate)
	Managers.mechanism:register_rpcs(network_event_delegate)
	Managers.party:register_rpcs(network_event_delegate)

	if Managers.matchmaking then
		Managers.matchmaking:register_rpcs(network_event_delegate)
		Managers.matchmaking:setup_post_init_data({})
	end

	Managers.chat:register_network_event_delegate(network_event_delegate)
	Managers.eac:register_network_event_delegate(network_event_delegate)

	if Managers.mod then
		Managers.mod:register_network_event_delegate(network_event_delegate)
	end

	Managers.deed:register_rpcs(network_event_delegate)

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:register_rpcs(network_event_delegate)
		end
	end

	self._registered_rpcs = true

	print("registering RPCs")
end

StateLoading._unregister_rpcs = function (self)
	Managers.level_transition_handler:unregister_rpcs()
	Managers.mechanism:unregister_rpcs()
	Managers.party:unregister_rpcs()

	if Managers.matchmaking then
		Managers.matchmaking:unregister_rpcs()
	end

	Managers.chat:unregister_network_event_delegate()
	Managers.eac:unregister_network_event_delegate()

	if Managers.mod then
		Managers.mod:unregister_network_event_delegate()
	end

	Managers.deed:unregister_rpcs()

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper:unregister_rpcs()
		end
	end

	self._registered_rpcs = false
end

StateLoading.waiting_for_cleanup = function (self)
	return self._waiting_for_cleanup
end

StateLoading.setup_join_lobby = function (self, optional_wait_time, setup_voip)
	if IS_XB1 and (not Managers.account:all_sessions_cleaned_up() or optional_wait_time) then
		self._waiting_for_cleanup = true
		self._cleanup_done_func = callback(self, "setup_join_lobby")

		local time = Managers.time:time("main")

		self._cleanup_wait_time = time + (optional_wait_time or 0)

		return
	end

	if not self._lobby_client then
		local network_options = LobbySetup.network_options()
		local loading_context = self.parent.loading_context

		if loading_context.join_lobby_data then
			self._lobby_client = LobbyClient:new(network_options, self.parent.loading_context.join_lobby_data)
		elseif loading_context.join_server_data then
			local user_data = {
				network_options = network_options,
				game_server_data = self.parent.loading_context.join_server_data,
			}

			self._password_request = ServerJoinStateMachine:new(network_options, self.parent.loading_context.join_server_data.server_info.ip_port, user_data)
		else
			ferror("no join lobby data")
		end

		self.parent.loading_context.join_lobby_data = nil
		self._handle_new_lobby_connection = true

		if self._lobby_client ~= nil then
			Managers.account:set_current_lobby(self._lobby_client.lobby)
		end

		local main_time = Managers.time:time("main")

		self._lobby_finder_timeout = main_time + StateLoading.join_lobby_timeout
	end

	if setup_voip then
		local is_server = false

		self._voip = Voip:new(is_server, self._lobby_client)
	end
end

StateLoading.setup_lobby_finder = function (self, lobby_joined_callback, lobby_to_join, host_to_join, lobby_is_server)
	if Managers.package:is_loading("resource_packages/inventory", "global") then
		Managers.package:load("resource_packages/inventory", "global")
	end

	if Managers.package:is_loading("resource_packages/careers", "global") then
		Managers.package:load("resource_packages/careers", "global")
	end

	local network_options = LobbySetup.network_options()

	if lobby_is_server then
		local game_server_data = {
			server_info = {
				ip_port = lobby_to_join,
			},
		}
		local user_data = {
			network_options = network_options,
			game_server_data = game_server_data,
		}

		self._password_request = ServerJoinStateMachine:new(network_options, game_server_data.server_info.ip_port, user_data)
	else
		self._lobby_finder = LobbyFinder:new(network_options, nil, true)
		self._lobby_to_join = lobby_to_join
		self._host_to_join = host_to_join and host_to_join.peer_id
		self._host_to_join_name = host_to_join and host_to_join.name

		self._lobby_finder:refresh()
		printf("[StateLoading] StateLoading will try to find a lobby with id=%s or host=%s or unique_server_name=%s", tostring(lobby_to_join), tostring(self._host_to_join), tostring(script_data.unique_server_name))
	end

	local main_time = Managers.time:time("main")

	self._lobby_joined_callback = lobby_joined_callback
	self._lobby_finder_timeout = main_time + StateLoading.join_lobby_timeout
	self._lobby_finder_refresh_timer = main_time + StateLoading.join_lobby_refresh_interval

	local loading_context = self.parent.loading_context
	local versus_migration = loading_context and loading_context.versus_migration

	if host_to_join and not versus_migration then
		self:create_join_popup(self._host_to_join_name)
	end

	return self._lobby_finder
end

StateLoading.setup_lobby_host = function (self, wait_for_joined_callback, platform_lobby, xbox_lobby_session_name, xbox_session_template_name)
	if IS_XB1 and not Managers.account:all_sessions_cleaned_up() then
		self._waiting_for_cleanup = true
		self._cleanup_done_func = callback(self, "setup_lobby_host", wait_for_joined_callback, platform_lobby, xbox_lobby_session_name, xbox_session_template_name)
		self._cleanup_wait_time = 0

		return
	end

	local loading_context = self.parent.loading_context

	assert(not loading_context.profile_synchronizer)
	assert(not loading_context.network_server)

	local network_options = LobbySetup.network_options()
	local network_options_info = table.tostring(network_options)
	local platform_lobby_info = type(platform_lobby) == "table" and table.tostring(platform_lobby) or tostring(platform_lobby)

	printf("StateLoading:setup_lobby_host - creating lobby_host with network_options: %s platform_lobby: %s", network_options_info, platform_lobby_info)

	self._lobby_host = LobbyHost:new(network_options, platform_lobby, xbox_lobby_session_name, xbox_session_template_name)

	local level_transition_handler = Managers.level_transition_handler

	if not level_transition_handler:has_next_level() then
		local level_key = Managers.mechanism:default_level_key()
		local level_settings = rawget(LevelSettings, level_key)
		local conflict_settings = level_settings and level_settings.conflict_settings

		level_transition_handler:set_next_level(level_key, nil, nil, nil, nil, conflict_settings)
	end

	level_transition_handler:promote_next_level_data()

	local level_key = level_transition_handler:get_current_level_key()

	if not self:loading_view_setup_done() then
		self:setup_loading_view(level_key)
	end

	if not self:menu_assets_setup_done() then
		self:setup_menu_assets()
	end

	self:_update_loading_global_packages()

	if not wait_for_joined_callback then
		self:_create_network_server()
	end

	Managers.account:set_current_lobby(self._lobby_host.lobby)

	self._waiting_for_joined_callback = wait_for_joined_callback
end

StateLoading.host_joined = function (self)
	self:_create_network_server()

	if self._waiting_for_joined_callback then
		self._waiting_for_joined_callback()

		self._waiting_for_joined_callback = nil
	end
end

StateLoading._create_network_server = function (self)
	local loading_context = self.parent.loading_context
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index

	self._network_server = NetworkServer:new(Managers.player, self._lobby_host, wanted_profile_index)
	self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.server_peer_id)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
	self._network_server:server_join()

	self._profile_synchronizer = self._network_server.profile_synchronizer

	self._network_server.voip:set_input_manager(self._input_manager)

	loading_context.network_transmit = self._network_transmit
end

StateLoading.setup_chat_manager = function (self, lobby, host_peer_id, my_peer_id, is_server)
	local network_context = {
		is_server = is_server,
		host_peer_id = host_peer_id,
		my_peer_id = my_peer_id,
	}

	Managers.chat:setup_network_context(network_context)
	Managers.mechanism:mechanism_try_call("register_chats")

	local function member_func()
		if DEDICATED_SERVER and Managers.level_transition_handler:in_hub_level() then
			local mechanism = Managers.mechanism:game_mechanism()
			local reservation_handler = mechanism:get_slot_reservation_handler()

			return reservation_handler:reservers()
		end

		return lobby:members():get_members()
	end

	Managers.chat:register_channel(1, member_func)
end

StateLoading.setup_deed_manager = function (self, lobby, host_peer_id, my_peer_id, is_server, network_handler)
	Managers.deed:network_context_created(lobby, host_peer_id, my_peer_id, is_server, network_handler)
end

StateLoading.setup_enemy_package_loader = function (self, lobby, host_peer_id, my_peer_id, network_handler)
	Managers.level_transition_handler.enemy_package_loader:network_context_created(lobby, host_peer_id, my_peer_id, network_handler)
	Managers.level_transition_handler.transient_package_loader:network_context_created(lobby, host_peer_id, my_peer_id)
end

StateLoading.setup_global_managers = function (self, lobby, host_peer_id, my_peer_id, is_server, network_handler)
	Managers.mechanism:network_context_created(lobby, host_peer_id, my_peer_id, is_server, network_handler)
	Managers.party:network_context_created(lobby, host_peer_id, my_peer_id)

	if Managers.mod then
		Managers.mod:network_context_created(host_peer_id, my_peer_id, is_server)
	end
end

StateLoading.setup_network_transmit = function (self, network_handler)
	local server_peer_id = self._network_server and self._network_server.server_peer_id or self._network_client and self._network_client.server_peer_id

	self._network_transmit = self.parent.loading_context.network_transmit or NetworkTransmit:new(true, server_peer_id)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	network_handler:register_rpcs(self._network_event_delegate, self._network_transmit)

	self.parent.loading_context.network_transmit = self._network_transmit
end

StateLoading.create_popup = function (self, error, header, action, right_button, ...)
	if Managers.account:leaving_game() then
		return
	end

	print("StateLoading:create_popup", Script.callstack())

	if self._join_popup_id then
		Managers.popup:cancel_popup(self._join_popup_id)

		self._join_popup_id = nil
	end

	assert(error, "[StateLoading] No error was passed to popup handler")

	local header = header or "popup_error_topic"
	local action = action or "restart_as_server"
	local right_button = right_button or "menu_ok"
	local localized_error = Localize(error)

	localized_error = string.format(localized_error, ...)

	assert(self._popup_id == nil, "Tried to show popup even though we already had one.")

	self._popup_id = Managers.popup:queue_popup(localized_error, Localize(header), action, Localize(right_button))
end

StateLoading.create_join_popup = function (self, host_name)
	if Managers.account:leaving_game() then
		return
	end

	local header = Localize("popup_migrating_to_host_header")
	local message = Localize("popup_migrating_to_host_message") .. "\n" .. host_name
	local time = StateLoading.join_lobby_timeout

	assert(self._join_popup_id == nil, "Tried to show popup even though we already had one.")

	self._join_popup_id = Managers.popup:queue_popup(message, header, "cancel", Localize("popup_choice_cancel"))

	local default_result = "timeout"
	local timer_alignment = "center"
	local blink = false

	Managers.popup:activate_timer(self._join_popup_id, time, default_result, timer_alignment, blink)
end

StateLoading.clear_network_loading_context = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.network_client then
		loading_context.network_client:destroy()

		loading_context.network_client = nil
	end

	if loading_context.network_server then
		loading_context.network_server:destroy()

		loading_context.network_server = nil
	end

	if self._lobby_host then
		self._lobby_host:destroy()

		self._lobby_host = nil
		self.parent.loading_context.lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	loading_context.setup_voip = nil
end

StateLoading.setup_network_client = function (self, clear_peer_state, lobby_client)
	self._lobby_client = lobby_client or self._lobby_client

	if self._lobby_client.lobby == nil then
		self._wanted_state = StateTitleScreen
		self._lobby_client = nil
		self.parent.loading_context.lobby_client = nil

		self:create_popup("failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")

		return false
	end

	Application.warning("Setting up network client")

	local host = self._lobby_client:lobby_host()
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index
	local wanted_party_index = self.parent.loading_context.wanted_party_index

	self._network_client = NetworkClient:new(host, wanted_profile_index, wanted_party_index, clear_peer_state, self._lobby_client, self._voip)
	self._network_transmit = NetworkTransmit:new(false, self._network_client.server_peer_id)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_client:register_rpcs(self._network_event_delegate, self._network_transmit)

	self._profile_synchronizer = self._network_client.profile_synchronizer
	self._handle_new_lobby_connection = nil
	self._voip = nil

	self._network_client.voip:set_input_manager(self._input_manager)

	local loading_context = self.parent.loading_context

	loading_context.network_client = self._network_client
	loading_context.network_transmit = self._network_transmit
	loading_context.lobby_client = self._lobby_client

	local lobby = self._lobby_client.lobby

	Managers.account:set_current_lobby(lobby)

	return true
end

StateLoading.get_current_level_keys = function (self)
	return Managers.level_transition_handler:get_current_level_keys()
end

StateLoading.set_lobby_host_data = function (self, level_key)
	if self._lobby_host then
		local lobby_host = self._lobby_host
		local stored_lobby_host_data = lobby_host:get_stored_lobby_data() or {}
		local matchmaking_type

		if IS_PS4 then
			matchmaking_type = stored_lobby_host_data.matchmaking_type or "n/a"
		else
			matchmaking_type = stored_lobby_host_data.matchmaking_type and NetworkLookup.matchmaking_types[tonumber(stored_lobby_host_data.matchmaking_type)] or "n/a"
		end

		if matchmaking_type ~= "weave" then
			stored_lobby_host_data.mission_id = level_key
		end

		stored_lobby_host_data.matchmaking = stored_lobby_host_data.matchmaking or "true"

		local level_setting = LevelSettings[level_key]

		if level_setting.hub_level then
			stored_lobby_host_data.matchmaking = "false"
			stored_lobby_host_data.matchmaking_type = IS_PS4 and "n/a" or NetworkLookup.matchmaking_types["n/a"]
			stored_lobby_host_data.selected_mission_id = level_key
		end

		if level_key == "prologue" then
			stored_lobby_host_data.matchmaking = "false"
			stored_lobby_host_data.matchmaking_type = IS_PS4 and "tutorial" or NetworkLookup.matchmaking_types.tutorial
		end

		local current_mechanism = Managers.level_transition_handler:get_current_mechanism()
		local current_game_mode = Managers.level_transition_handler:get_current_game_mode()

		stored_lobby_host_data.mechanism = current_game_mode == "weave" and current_game_mode or current_mechanism

		if IS_PS4 then
			local region = Managers.account:region()
			local primary, secondary = MatchmakingRegionsHelper.get_matchmaking_regions(region)

			stored_lobby_host_data.primary_region = primary
			stored_lobby_host_data.secondary_region = secondary
		end

		local weave_name = Development.parameter("weave_name")

		if weave_name then
			stored_lobby_host_data.mission_id = weave_name
			stored_lobby_host_data.matchmaking_type = IS_PS4 and "custom" or NetworkLookup.matchmaking_types.custom
		elseif matchmaking_type == "event" then
			stored_lobby_host_data.matchmaking_type = IS_PS4 and "event" or NetworkLookup.matchmaking_types.event
		elseif Development.parameter("auto_host_level") then
			stored_lobby_host_data.matchmaking_type = IS_PS4 and "custom" or NetworkLookup.matchmaking_types.custom
		elseif Managers.level_transition_handler:get_current_mechanism() == "versus" then
			stored_lobby_host_data.matchmaking_type = DEDICATED_SERVER and NetworkLookup.matchmaking_types.versus or NetworkLookup.matchmaking_types.custom
		end

		if IS_WINDOWS or IS_LINUX then
			local host_type

			if DEDICATED_SERVER then
				host_type = NetworkLookup.host_types.community_dedicated_server
			else
				host_type = NetworkLookup.host_types.player_hosted
			end

			stored_lobby_host_data.host_type = host_type

			local eac_authorized = Managers.eac:is_trusted()

			stored_lobby_host_data.eac_authorized = eac_authorized and "true" or "false"
		end

		lobby_host:set_lobby_data(stored_lobby_host_data)
	end
end

StateLoading.start_matchmaking = function (self)
	assert(self._lobby_host)

	local lobby_host = self._lobby_host
	local stored_lobby_host_data = lobby_host:get_stored_lobby_data() or {}

	stored_lobby_host_data.matchmaking = "true"

	lobby_host:set_lobby_data(stored_lobby_host_data)
end

StateLoading.get_lobby = function (self)
	local lobby = self._lobby_host or self._lobby_client

	return lobby
end

StateLoading.has_joined = function (self)
	local lobby = self._lobby_host or self._lobby_client

	return lobby and lobby:is_joined()
end
