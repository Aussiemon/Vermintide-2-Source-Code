-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/game_state/loading_sub_states/win32/state_loading_running")
require("scripts/game_state/loading_sub_states/win32/state_loading_restart_network")
require("scripts/game_state/loading_sub_states/win32/state_loading_migrate_host")
require("scripts/settings/level_settings")

StateLoading = class(StateLoading)
StateLoading.NAME = "StateLoading"
local CHAT_INPUT_DEFAULT_COMMAND = "say"
local MAX_CHAT_INPUT_CHARS = 150
local DO_RELOAD = true
StateLoading.round_start_auto_join = 10
StateLoading.round_start_join_allowed = 20
StateLoading.join_lobby_timeout = 120
StateLoading.join_lobby_refresh_interval = 5
LOBBY_PORT_INCREMENT = LOBBY_PORT_INCREMENT or 0

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end

	return 
end

StateLoading.on_enter = function (self, param_block)
	print("[Gamestate] Enter state StateLoading")

	if DEDICATED_SERVER then
		local leader_peer_id = Managers.party:leader()

		if leader_peer_id ~= nil then
			print(string.format("Start loading leader %s's characters and gear in the backend", leader_peer_id))
			Managers.backend:update_items(leader_peer_id)
		end
	end

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("suspended")
	end

	if PLATFORM == "xb1" then
		Application.set_kinect_enabled(true)
	end

	if PLATFORM == "win32" then
		Application.set_time_step_policy("throttle", 60)
	end

	self._registered_rpcs = false
	self._loading_view_setup_is_done = false

	self._setup_garbage_collection(self)
	self._setup_world(self)
	self._setup_input(self)
	self._parse_loading_context(self)
	self._create_loading_view(self)
	self._setup_end_of_level_ui(self)
	self._setup_first_time_ui(self)
	self._setup_init_network_view(self)
	Managers.popup:set_input_manager(self._input_manager)
	Managers.chat:set_input_manager(self._input_manager)
	self._setup_level_transition(self)
	self._setup_state_machine(self)
	self._unmute_all_world_sounds(self)

	local level_transition_handler = self._level_transition_handler
	local next_level_key = level_transition_handler.get_next_level_key(level_transition_handler)

	if next_level_key == "prologue" then
		Managers.backend:start_tutorial()
	end

	if self._lobby_client ~= nil and not self._lobby_client:is_dedicated_server() then
		Managers.party:set_leader(self._lobby_client:lobby_host())
	end

	Managers.transition:hide_icon_background()
	Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
	Managers.light_fx:set_lightfx_color_scheme("loading")

	self._menu_setup_done = false

	if PLATFORM == "xb1" and self._lobby_host then
		Managers.account:set_round_id()
		Managers.account:update_popup_status()
	end

	if PLATFORM == "ps4" then
		Managers.account:set_realtime_multiplay_state("loading", true)
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
			self.parent.loading_context.skip_signin = true
			self._teardown_network = true
		end
	end

	return 
end
StateLoading._setup_input = function (self)
	self._input_manager = InputManager:new()
	Managers.input = self._input_manager

	self._input_manager:initialize_device("keyboard", 1)
	self._input_manager:initialize_device("mouse", 1)
	self._input_manager:initialize_device("gamepad", 1)
	self._input_manager:create_input_service("Player", "PlayerControllerKeymaps", "PlayerControllerFilters")
	self._input_manager:map_device_to_service("Player", "keyboard")
	self._input_manager:map_device_to_service("Player", "mouse")
	self._input_manager:map_device_to_service("Player", "gamepad")

	return 
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
		self._level_end_view_context = loading_context.level_end_view_context
	end

	return 
end
StateLoading._setup_garbage_collection = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateLoadingRunning")

	return 
end
StateLoading._setup_world = function (self)
	self._world_name = "loading_world"
	self._viewport_name = "loading_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, nil, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)
	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1)

	return 
end
StateLoading._setup_init_network_view = function (self)

	-- decompilation error in this vicinity
	require("scripts/game_state/state_ingame")

	self._wanted_state = StateIngame

	return 
end
StateLoading._setup_end_of_level_ui = function (self)
	if self._level_end_view_context then
		self._level_end_view_context.lobby = self._lobby_host or self._lobby_client
		self._level_end_view_wrappers = {
			LevelEndViewWrapper:new(self._level_end_view_context)
		}

		self._level_end_view_wrappers[1]:start()

		self._level_end_view_context = nil
		self.parent.loading_context.level_end_view_context = nil
	end

	return 
end
StateLoading._setup_first_time_ui = function (self)
	local loading_context = self.parent.loading_context

	if (loading_context.first_time or loading_context.gamma_correct or loading_context.play_trailer) and not GameSettingsDevelopment.disable_intro_trailer then
		local auto_skip = nil
		local params = {}
		local platform = PLATFORM

		if platform == "win32" then
			local level_name = (Boot.loading_context and Boot.loading_context.level_key) or LevelSettings.default_start_level

			if Development.parameter("attract_mode") and not BenchmarkSettings.auto_host_level then
			end

			if not check_bool_string(Development.parameter("auto_host_level")) then
			end

			auto_skip = level_name ~= LevelSettings.default_start_level
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")
			local save_data = SaveData
			params.gamma = not save_data.gamma_corrected
			params.trailer = Application.user_setting("play_intro_cinematic")
		elseif platform == "ps4" or platform == "xb1" then
			local level_name = (Boot.loading_context and Boot.loading_context.level_key) or LevelSettings.default_start_level

			if not check_bool_string(Development.parameter("auto_host_level")) then
			end

			auto_skip = level_name ~= LevelSettings.default_start_level
			auto_skip = loading_context.join_lobby_data or Development.parameter("auto_join") or auto_skip or Development.parameter("skip_splash")
			params.gamma = loading_context.gamma_correct
			params.trailer = loading_context.play_trailer

			if params.gamma or params.trailer then
				auto_skip = false
			end
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

	return 
end
StateLoading._unmute_all_world_sounds = function (self)
	Managers.music:trigger_event("unmute_all_world_sounds")

	return 
end
StateLoading._get_game_difficulty = function (self)
	local game_difficulty = self.parent.loading_context.difficulty

	if self._lobby_host then
		local stored_lobby_data = self._lobby_host:get_stored_lobby_data()

		if stored_lobby_data and stored_lobby_data.difficulty then
			game_difficulty = stored_lobby_data.difficulty
		end
	elseif self._lobby_client then
		local stored_lobby_data = self._lobby_client:get_stored_lobby_data()

		if stored_lobby_data and stored_lobby_data.difficulty then
			game_difficulty = stored_lobby_data.difficulty
		end
	end

	return game_difficulty or "normal"
end
StateLoading._create_loading_view = function (self, level_key, act_progression_index)
	if DEDICATED_SERVER then
		return 
	end

	local game_difficulty = self._get_game_difficulty(self)
	local ui_context = {
		world = self._world,
		input_manager = self._input_manager,
		level_key = level_key,
		game_difficulty = game_difficulty,
		world_manager = Managers.world,
		chat_manager = Managers.chat,
		profile_synchronizer = self._profile_synchronizer,
		act_progression_index = act_progression_index
	}
	self._loading_view = LoadingView:new(ui_context)

	return 
end
StateLoading._trigger_loading_view = function (self, level_key, act_progression_index)
	level_key = level_key or self._level_transition_handler:default_level_key()

	if not self._loading_music_triggered then
		if not Development.parameter("gdc") then
			self._wwise_event = self._trigger_sound_events(self, level_key)

			self._loading_view:trigger_subtitles(self._wwise_event, Managers.time:time("main"))
		end

		local event_name = "Play_loading_screen_music"

		if act_progression_index and 1 <= act_progression_index and act_progression_index < 4 then
			event_name = event_name .. "_act" .. act_progression_index
		elseif act_progression_index and 4 <= act_progression_index then
			event_name = event_name .. "_finished"
		end

		Managers.music:trigger_event(event_name)
	end

	self._activate_loading_view = true
	self._loading_music_triggered = true

	Managers.transition:hide_icon_background()
	Managers.transition:force_fade_in()

	return 
end
StateLoading.setup_loading_view = function (self, level_key)
	self._level_key = level_key or self._level_transition_handler:default_level_key()
	self._loading_view_setup_is_done = true

	if not DEDICATED_SERVER then
		local package_manager = Managers.package

		if self._ui_package_name and (package_manager.has_loaded(package_manager, self._ui_package_name, "global_loading_screens") or package_manager.is_loading(package_manager, self._ui_package_name)) then
			package_manager.unload(package_manager, self._ui_package_name, "global_loading_screens")
		end

		local level_key = self._level_key
		local package_name = LevelSettings[level_key].loading_ui_package_name
		self._ui_package_name = "resource_packages/loading_screens/" .. package_name
		local act_progression_index = nil

		if not package_manager.has_loaded(package_manager, self._ui_package_name) and not package_manager.has_loaded(package_manager, self._ui_package_name, "global_loading_screens") then
			package_manager.load(package_manager, self._ui_package_name, "global_loading_screens", callback(self, "cb_loading_screen_loaded", self._level_key, act_progression_index), true, true)
		else
			self.cb_loading_screen_loaded(self, self._level_key, act_progression_index, true)
		end
	end

	return 
end
StateLoading.loading_view_setup_done = function (self)
	return self._loading_view_setup_is_done
end
StateLoading.setup_menu_assets = function (self)
	local reference_name = "menu_assets"
	local package_name_ingame = "resource_packages/menu_assets"
	local package_manager = Managers.package
	local ingame_package_loaded = package_manager.has_loaded(package_manager, package_name_ingame, reference_name) or package_manager.is_loading(package_manager, package_name_ingame, reference_name)
	local load_package_path = nil
	local package_manager = Managers.package

	if not ingame_package_loaded then
		load_package_path = package_name_ingame
	end

	if load_package_path then
		package_manager.load(package_manager, load_package_path, reference_name, nil, true, true)

		self._ui_loading_package_reference_name = reference_name
		self._ui_loading_package_path = load_package_path
	end

	self._menu_setup_done = true

	return 
end
StateLoading.menu_assets_setup_done = function (self)
	return self._menu_setup_done
end
StateLoading.cb_loading_screen_loaded = function (self, level_key, act_progression_index, skip_fade)
	if self._first_time_view or self._level_end_view_wrappers then
		local game_difficulty = self._get_game_difficulty(self)

		self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty)
	elseif skip_fade then
		self.cb_loading_screen_change_fade(self, level_key, act_progression_index, skip_fade)
	else
		Managers.transition:fade_in(3, callback(self, "cb_loading_screen_change_fade", level_key, act_progression_index))
	end

	return 
end
StateLoading.cb_loading_screen_change_fade = function (self, level_key, act_progression_index, skip_fade)
	local game_difficulty = self._get_game_difficulty(self)

	self._loading_view:texture_resource_loaded(level_key, act_progression_index, game_difficulty)
	self._trigger_loading_view(self, level_key, act_progression_index)

	if not skip_fade then
		Managers.transition:fade_out(3)
	end

	return 
end
StateLoading._trigger_sound_events = function (self, level_key)
	local level_settings = LevelSettings[level_key]
	local wwise_events = level_settings.loading_screen_wwise_events

	if wwise_events ~= nil then
		local wwise_event = wwise_events[math.random(1, #wwise_events)]
		local wwise_playing_id, wwise_source_id = Managers.music:trigger_event(wwise_event)
		self.wwise_playing_id = wwise_playing_id

		return wwise_event
	end

	return 
end
StateLoading._setup_state_machine = function (self)
	local params = {
		world = self._world,
		viewport = self._viewport,
		loading_view = self._loading_view,
		level_transition_handler = self._level_transition_handler
	}

	if self.parent.loading_context.restart_network then
		self._machine = StateMachine:new(self, StateLoadingRestartNetwork, params, true)
	elseif self.parent.loading_context.host_migration_info then
		self._machine = StateMachine:new(self, StateLoadingMigrateHost, params, true)
	else
		self._machine = StateMachine:new(self, StateLoadingRunning, params, true)
	end

	return 
end
StateLoading._handle_do_reload = function (self)
	if DO_RELOAD and self._wwise_event then
		Managers.music:trigger_event(self._wwise_event)

		DO_RELOAD = false
	end

	return 
end
StateLoading.update = function (self, dt, t)
	if script_data.subtitle_debug then
		self._handle_do_reload(self)
	end

	Network.update_receive(dt, self._network_event_delegate.event_table)
	self._update_network(self, dt)

	if PLATFORM == "ps4" and not self._popup_id and not self._handled_psn_client_error and self._level_transition_handler:all_packages_loaded() and Managers.backend:profiles_loaded() and self.global_packages_loaded(self) then
		local psn_client_error = Managers.account:psn_client_error()

		if psn_client_error then
			printf("[StateLoading] PSN CLIENT ERROR %s", psn_client_error)
			self.create_popup(self, "failure_psn_client_error", "popup_error_topic", "restart_as_server", "menu_accept")

			self._handled_psn_client_error = true
			self._wanted_state = StateTitleScreen
		end
	end

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	Managers.backend:update(dt)
	Managers.input:update(dt)
	self._level_transition_handler:update(dt)
	Managers.music:update(dt)

	if Managers.voice_chat then
		Managers.voice_chat:update(dt, t)
	end

	if self._level_end_view_wrappers then
		local level_end_view_wrapper = self._level_end_view_wrappers[1]

		level_end_view_wrapper.update(level_end_view_wrapper, dt, t)

		if level_end_view_wrapper.done(level_end_view_wrapper) then
			self._tear_down_level_end_view_wrappers(self)
		end
	elseif self._first_time_view then
		self._first_time_view:update(dt)
	elseif self._loading_view then
		if self._activate_loading_view then
			self._loading_view:activate()
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

			self._activate_loading_view = nil
		end

		self._loading_view:update(dt)
	end

	self._update_loading_screen(self, dt, t)
	self._machine:update(dt, t)
	self._update_lobbies(self, dt, t)

	if Managers.matchmaking then
		Managers.matchmaking:update(dt, t)
	end

	if Managers.game_server then
		Managers.game_server:update(dt, t)
	end

	local menu_active = false
	local menu_input_service = nil

	if self._level_end_view_wrappers then
		local level_end_view = self._level_end_view_wrappers[1]:level_end_view()

		if level_end_view.enable_chat(level_end_view) then
			menu_active = true
			menu_input_service = self._level_end_view_wrappers[1]:level_end_view():active_input_service()
		end
	end

	Managers.chat:update(dt, t, menu_active, menu_input_service)
	Network.update_transmit(dt)

	return self._try_next_state(self)
end
StateLoading._update_network = function (self, dt)
	if self._network_server then
		self._network_server:update(dt)
	elseif self._network_client then
		self._network_client:update(dt)

		if self._network_client:is_in_post_game() and not self._in_post_game_popup_id and not self._in_post_game_popup_shown then
			self._in_post_game_popup_id = Managers.popup:queue_popup(Localize("popup_is_in_post_game"), Localize("matchmaking_status_waiting_for_host"), "return_to_inn", Localize("return_to_inn"))
			self._in_post_game_popup_shown = true

			Managers.popup:activate_timer(self._in_post_game_popup_id, 200, "timeout", "center", false, function (timer)
				return string.format(Localize("timer_max_time") .. ": %.2d:%.2d", (timer/60)%60, timer%60)
			end, 28)
		elseif not self._network_client:is_in_post_game() and self._in_post_game_popup_id then
			Managers.popup:cancel_popup(self._in_post_game_popup_id)

			self._in_post_game_popup_id = nil
		end

		local bad_state = self._network_client.state == "denied_enter_game" or self._network_client.state == "lost_connection_to_host"

		if bad_state and not self._popup_id and not self._permission_to_go_to_next_state then
			self._wanted_state = StateTitleScreen

			self.create_popup(self, self._network_client.fail_reason or "fail reason is nil", "popup_error_topic", "restart_as_server", "menu_accept")

			if PLATFORM == "ps4" then
				self._network_client:destroy()

				self._network_client = nil

				self._destroy_lobby_client(self)

				if self._in_post_game_popup_id then
					Managers.popup:cancel_popup(self._in_post_game_popup_id)

					self._in_post_game_popup_id = nil
				end
			end
		end
	end

	return 
end
StateLoading._update_lobbies = function (self, dt, t)
	if not self.global_packages_loaded(self) then
		return 
	end

	if self._network_transmit then
		self._network_transmit:transmit_local_rpcs()
	end

	if self._lobby_host then
		local lobby_host = self._lobby_host
		local old_state = lobby_host.state

		lobby_host.update(lobby_host, dt)

		if old_state ~= lobby_host.state and lobby_host.state == LobbyState.JOINED then
			local lobby_host = self._lobby_host
			local own_peer_id = Network.peer_id()
			local host_peer_id = lobby_host.lobby_host(lobby_host)

			self.setup_chat_manager(self, lobby_host, host_peer_id, own_peer_id, true)
			self.setup_deed_manager(self, lobby_host, host_peer_id, own_peer_id)

			if not self._network_server then
				self.host_joined(self)
			end
		elseif self._lobby_host.state == LobbyState.FAILED and not self._popup_id then
			local text_id = nil

			if PLATFORM == "win32" then
				if rawget(_G, "Steam") then
					if Steam.connected() then
						text_id = "failure_start_steam_lobby_create"
					else
						text_id = "failure_start_no_steam"
					end
				else
					text_id = "failure_start_no_lan"
				end
			elseif PLATFORM == "xb1" then
				if not Network.xboxlive_client_exists() then
					text_id = "failure_start_xbox_live_client"
				else
					text_id = "failure_start_xbox_lobby_create"
				end
			elseif PLATFORM == "ps4" then
				text_id = "failure_start_psn_lobby_create"
			else
				text_id = "failure_start"
			end

			self._destroy_lobby_host(self)

			if self._network_server then
				self._network_server:disconnect_all_peers("unknown_error")
				self._network_server:destroy()

				self._network_server = nil
			end

			self.create_popup(self, text_id, "popup_error_topic", "restart_as_server", "menu_accept")
		end
	elseif self._lobby_finder then
		self._update_lobby_join(self, dt, t)
	elseif self._server_lobby then
		self._update_server_lobby_join(self, dt, t)
	elseif self._lobby_client then
		self._lobby_client:update(dt)

		local new_lobby_state = self._lobby_client.state

		if self._handle_new_lobby_connection and self._lobby_client:is_joined() then
			local host = self._lobby_client:lobby_host()
			local lobby_data = self._lobby_client:get_stored_lobby_data()
			local lobby_id = lobby_data.id
			local lobby_network_hash = lobby_data.network_hash

			if lobby_id then
				lobby_network_hash = lobby_network_hash or LobbyInternal.get_lobby_data_from_id_by_key(lobby_id, "network_hash")
			end

			lobby_network_hash = lobby_network_hash or self._lobby_client:lobby_data("network_hash")
			local ready_to_compare_hashes = host ~= "0" and lobby_network_hash and self._popup_id == nil

			if ready_to_compare_hashes then
				local client_network_hash = self._lobby_client.network_hash

				if client_network_hash == lobby_network_hash then
					self.setup_network_client(self, self._joined_matchmaking_lobby)

					local own_peer_id = Network.peer_id()

					self.setup_chat_manager(self, self._lobby_client, host, own_peer_id, false)
					self.setup_deed_manager(self, self._lobby_client, host, own_peer_id)
				else
					self._destroy_lobby_client(self)
					self.create_popup(self, "failure_start_join_server_incorrect_hash", "popup_error_topic", "restart_as_server", "menu_accept", client_network_hash, lobby_network_hash)
				end
			end
		elseif self._lobby_client:failed() and not self._popup_id then
			self._destroy_lobby_client(self)
			self.create_popup(self, "failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
			Managers.transition:fade_out(GameSettings.transition_fade_out_speed)
		end
	end

	if PLATFORM == "xb1" and self._waiting_for_cleanup and Managers.account:all_lobbies_freed() then
		self.setup_join_lobby(self, true)

		self._waiting_for_cleanup = nil
	end

	return 
end
StateLoading._destroy_lobby_client = function (self)
	self._lobby_client:destroy()

	self._lobby_client = nil
	self.parent.loading_context.lobby_client = nil

	Managers.account:set_current_lobby(nil)

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper.left_lobby(level_end_view_wrapper)
		end
	end

	self._wanted_state = StateTitleScreen

	return 
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

	return 
end
StateLoading._update_lobby_join = function (self, dt, t)
	local unique_server_name = Development.parameter("unique_server_name")
	local found = false
	local lobby_finder = self._lobby_finder

	lobby_finder.update(lobby_finder, dt)

	local lobbies = lobby_finder.lobbies(lobby_finder)

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
			self._load_level(self, lobby.level_key)

			self._lobby_client = LobbyClient:new(self._network_options, lobby)
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

	if not found and self._lobby_finder_timeout < t and not self._popup_id then
		self._lobby_finder = nil
		local name = self._host_to_join_name or Development.parameter("unique_server_name")

		self.create_popup(self, "failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end

	if self._lobby_finder and not found and self._lobby_finder_refresh_timer < t then
		self._lobby_finder:refresh()

		self._lobby_finder_refresh_timer = t + StateLoading.join_lobby_refresh_interval
	end

	return 
end
StateLoading._update_server_lobby_join = function (self, dt, t)
	local lobby = self._server_lobby

	lobby.update(lobby, dt)

	local state = lobby.state(lobby)

	if lobby.is_joined(lobby) and lobby.lobby_data(lobby, "level_key") then
		local level_key = lobby.lobby_data(lobby, "level_key")

		self._load_level(self, level_key)

		self._lobby_client = lobby
		self._server_lobby = nil
		self._handle_new_lobby_connection = true

		Managers.account:set_current_lobby(self._lobby_client.lobby)

		if self._lobby_joined_callback then
			self._lobby_joined_callback()

			self._lobby_joined_callback = nil
		end

		return 
	elseif lobby.failed(lobby) then
		self._server_lobby:destroy()

		self._server_lobby = nil

		self.create_popup(self, "failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")
		Managers.transition:fade_out(GameSettings.transition_fade_out_speed)

		self._wanted_state = StateTitleScreen

		return 
	end

	if self._lobby_finder_timeout < t and not self._popup_id then
		local name = self._server_lobby:id()

		self._server_lobby:destroy()

		self._server_lobby = nil

		self.create_popup(self, "failure_start_join_server_timeout", "failure_find_host", "restart_as_server", "menu_accept", name)

		self._wanted_state = StateTitleScreen
	end

	return 
end
StateLoading._update_loading_screen = function (self, dt, t)
	local permission_to_go_to_next_state = nil

	if self._network_server then
		local lobby_host = self._lobby_host

		if lobby_host and lobby_host.is_joined(lobby_host) then
			permission_to_go_to_next_state = true
		end
	elseif self._network_client and self._network_client.state == "waiting_enter_game" then
		permission_to_go_to_next_state = true
	end

	if self._network_server and not DEDICATED_SERVER then
		local peer_id = Network.peer_id()
		local local_player_id = 1
		local profile_synchronizer = self._network_server.profile_synchronizer
		local profile_index = (profile_synchronizer and profile_synchronizer.profile_by_peer(profile_synchronizer, peer_id, local_player_id)) or nil

		if not profile_index then
			permission_to_go_to_next_state = false
		end
	end

	local waiting_for_vo = false

	if script_data.subtitle_debug and not DEDICATED_SERVER then
		local skip = Mouse.button(Mouse.button_index("left")) == 1 and Mouse.button(Mouse.button_index("right")) == 1
		waiting_for_vo = not skip

		if permission_to_go_to_next_state and waiting_for_vo then
			Debug.text("[SubtitleDebug] Waiting for both mouse buttons to progress...")
		end
	end

	local level_name = self._level_transition_handler:get_current_level_keys()

	if permission_to_go_to_next_state and not self._permission_to_go_to_next_state and not waiting_for_vo and level_name then
		local level_index = NetworkLookup.level_keys[level_name]

		if self._network_server then
			self._network_server:rpc_level_loaded(Network.peer_id(), level_index)
		end

		self._permission_to_go_to_next_state = permission_to_go_to_next_state
	end

	return 
end
StateLoading._try_next_state = function (self)
	if self._popup_id then
		self._handle_popup(self)
	end

	if self._join_popup_id then
		self._handle_join_popup(self)
	end

	if self._in_post_game_popup_id and not Managers.account:leaving_game() then
		self._handle_in_post_game_popup(self)
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
		if not self._ui_package_name or (self._ui_package_name and Managers.package:has_loaded(self._ui_package_name)) then
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
	elseif not self._transitioning then
		local ui_done = true

		if self._first_time_view then
			ui_done = self._first_time_view:is_done()

			if ui_done and not self._popup_id and not self._packages_loaded(self) and self._level_key then
				self._trigger_loading_view(self)
				Managers.transition:show_loading_icon()
				self._first_time_view:destroy()

				self._first_time_view = nil

				Managers.chat:enable_gui(true)
			end
		elseif self._loading_view then
			ui_done = self._loading_view:is_done()
		end

		if self._level_end_view_wrappers then
			ui_done = self._level_end_view_done(self)
		end

		if Managers.backend:is_disconnected() and not self._popup_id then
			self._backend_broken(self)
		end

		if Managers.backend:is_waiting_for_user_input() then
			return 
		end

		local packages_loaded = self._packages_loaded(self)
		local can_go_to_next_state = self._wanted_state and ui_done and not self._popup_id

		if can_go_to_next_state then
			local ready_to_go_to_next_state = self._permission_to_go_to_next_state and packages_loaded
			local backend_is_disconnected = Managers.backend:is_disconnected()

			if ready_to_go_to_next_state or backend_is_disconnected then
				local allowed_to_continue = nil

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

	if (Managers.popup:has_popup() or Managers.account:user_detached()) and not Managers.account:leaving_game() then
		return 
	end

	Managers.popup:cancel_all_popups()

	return self._new_state
end
StateLoading._level_end_view_done = function (self)
	local level_end_view_wrapper = self._level_end_view_wrappers[1]

	return level_end_view_wrapper.done(level_end_view_wrapper)
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
		print(string.format("[StateLoading:_handle_popup] No such result handled (%s)", result))
	end

	return 
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
		print(string.format("[StateLoading:_handle_join_popup] No such result handled (%s)", result))
	end

	return 
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

	return 
end
StateLoading._backend_broken = function (self)
	print("[StateLoading] Backend_broken, returning to StateTitleScreen")

	self._wanted_state = StateTitleScreen
	self._teardown_network = true
	self._permission_to_go_to_next_state = true

	if self._first_time_view then
		self._first_time_view:force_done()
	end

	if PLATFORM == "xb1" then
		Managers.account:initiate_leave_game()
	end

	return 
end
StateLoading._set_packages_loaded = function (self)
	self._packages_loaded = true

	return 
end
StateLoading.on_exit = function (self, application_shutdown)
	if PLATFORM == "win32" then
		local max_fps = Application.user_setting("max_fps")

		if max_fps == nil or max_fps == 0 then
			Application.set_time_step_policy("no_throttle")
		else
			Application.set_time_step_policy("throttle", max_fps)
		end
	end

	if self._registered_rpcs then
		self._unregister_rpcs(self)
	end

	local skip_signin = self.parent.loading_context.skip_signin

	if application_shutdown then
		self._destroy_network(self)
	elseif self._teardown_network then
		self._destroy_network(self)
	else
		local loading_context = {
			level_transition_handler = self._level_transition_handler,
			network_transmit = self._network_transmit,
			checkpoint_data = self._checkpoint_data,
			quickplay_bonus = self._quickplay_bonus,
			level_end_view_wrappers = self._level_end_view_wrappers
		}

		if self._lobby_host then
			loading_context.lobby_host = self._lobby_host
			local level_key = self._level_transition_handler:get_current_level_keys()
			local stored_lobby_host_data = self._lobby_host:get_stored_lobby_data() or {}
			local country_code = nil

			if DEDICATED_SERVER then
				country_code = SteamGameServer.server_country_code()
			elseif rawget(_G, "Steam") then
				country_code = Steam.user_country_code()
			end

			stored_lobby_host_data.level_key = level_key
			stored_lobby_host_data.unique_server_name = stored_lobby_host_data.unique_server_name or LobbyAux.get_unique_server_name()
			stored_lobby_host_data.host = stored_lobby_host_data.host or Network.peer_id()
			stored_lobby_host_data.num_players = stored_lobby_host_data.num_players or 1
			stored_lobby_host_data.country_code = country_code

			self._lobby_host:set_lobby_data(stored_lobby_host_data)

			loading_context.network_server = self._network_server

			self._network_server:unregister_rpcs()
			self._network_server.voip:set_input_manager(nil)
		else
			loading_context.lobby_client = self._lobby_client
			loading_context.network_client = self._network_client

			self._network_client:unregister_rpcs()
			self._network_client.voip:set_input_manager(nil)
		end

		loading_context.show_profile_on_startup = self.parent.loading_context.show_profile_on_startup
		loading_context.difficulty = self.parent.loading_context.difficulty
		self.parent.loading_context = loading_context
	end

	self._profile_synchronizer = nil

	if self._network_event_delegate then
		self._network_event_delegate:destroy()

		self._network_event_delegate = nil
	end

	Managers.state:destroy()

	if self._first_time_view then
		self._first_time_view:destroy()

		self._first_time_view = nil
	end

	if self._loading_view then
		self._loading_view:destroy()

		self._loading_view = nil
	end

	self._machine:destroy(application_shutdown)

	if self.parent.loading_context then
		self.parent.loading_context.host_to_migrate_to = nil
		self.parent.loading_context.restart_network = nil
		self.parent.loading_context.players = nil
		self.parent.loading_context.local_player_index = nil
		self.parent.loading_context.skip_signin = skip_signin

		if self._restart_network then
			self.parent.loading_context.restart_network = true
		end
	end

	local package_manager = Managers.package

	if self._ui_package_name and (package_manager.has_loaded(package_manager, self._ui_package_name, "global_loading_screens") or package_manager.is_loading(package_manager, self._ui_package_name)) then
		package_manager.unload(package_manager, self._ui_package_name, "global_loading_screens")
	end

	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)
	Managers.music:trigger_event("Stop_loading_screen_music")
	fassert(application_shutdown or self._popup_id == nil, "StateLoading added a popup right before exiting")
	Managers.popup:remove_input_manager(application_shutdown)
	Managers.chat:set_input_manager(nil)
	Managers.chat:enable_gui(true)

	if not Managers.play_go:installed() then
		Managers.play_go:set_install_speed("slow")
	end

	if PLATFORM == "ps4" then
		Managers.account:set_realtime_multiplay_state("loading", false)
	end

	return 
end
StateLoading._load_global_packages = function (self)
	if not GlobalResources.loaded then
		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager.has_loaded(package_manager, name) then
				package_manager.load(package_manager, name, "global", nil, true)
			end
		end

		GlobalResources.loaded = true
	end

	return 
end
StateLoading.global_packages_loaded = function (self)
	if not GlobalResources.loaded then
		self._load_global_packages(self)
	end

	local package_manager = Managers.package

	for i, name in ipairs(GlobalResources) do
		if not package_manager.has_loaded(package_manager, name) then
			return false
		end
	end

	return true
end
StateLoading._packages_loaded = function (self)
	if self._level_transition_handler:all_packages_loaded() and Managers.backend:profiles_loaded() then
		if not DEDICATED_SERVER and self._network_server and not self._has_sent_level_loaded then
			self._has_sent_level_loaded = true
			local level_name = self._level_transition_handler:get_current_level_keys()
			local level_index = NetworkLookup.level_keys[level_name]

			self._network_server:rpc_level_loaded(Network.peer_id(), level_index)
		end

		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager.has_loaded(package_manager, name) then
				return false
			end
		end

		if self._ui_loading_package_path and self._ui_loading_package_reference_name and not package_manager.has_loaded(package_manager, self._ui_loading_package_path, self._ui_loading_package_reference_name) then
			return false
		end

		return true
	end

	return 
end
StateLoading._destroy_network = function (self)
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

	if self._lobby_host and not self._lobby_host:is_dedicated_server() then
		self._lobby_host:destroy()

		self._lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	if self._network_server then
		self._network_server:destroy()

		self._network_server = nil
	elseif self._network_client then
		self._network_client:destroy()

		self._network_client = nil
	end

	if self._lobby_host and self._lobby_host:is_dedicated_server() then
		self._lobby_host:destroy()

		self._lobby_host = nil

		Managers.account:set_current_lobby(nil)
	end

	if rawget(_G, "LobbyInternal") then
		LobbyInternal.shutdown_client()
	end

	Managers.chat:unregister_channel(1)

	self.parent.loading_context = {}

	self._level_transition_handler:release_level_resources(self.get_current_level_keys(self))

	self._level_transition_handler = nil

	if self._network_transmit then
		self._network_transmit:destroy()

		self._network_transmit = nil
	end

	return 
end
StateLoading._load_level = function (self, level_key)
	self._load_global_packages(self)

	local level_key = level_key or self._level_transition_handler:get_next_level_key()

	assert(level_key, "No level key was set")

	local loaded_level_key = self._level_transition_handler:get_current_level_keys()

	if level_key ~= loaded_level_key then
		printf("[StateLoading] Need to unload %s and start load %s", tostring(loaded_level_key), level_key)
		self._level_transition_handler:release_level_resources(loaded_level_key)
		self._level_transition_handler:load_level(level_key)
	end

	return 
end
StateLoading._tear_down_level_end_view_wrappers = function (self)
	local level_end_view_wrappers = self._level_end_view_wrappers

	for i = 1, #level_end_view_wrappers, 1 do
		level_end_view_wrappers[i]:destroy()
	end

	self._level_end_view_wrappers = nil

	return 
end
StateLoading.set_matchmaking = function (self, matchmaking)
	self._joined_matchmaking_lobby = matchmaking

	return 
end
StateLoading.setup_network_options = function (self)
	if not self._network_options then
		local development_port = script_data.server_port or script_data.settings.server_port or GameSettingsDevelopment.network_port
		development_port = development_port + LOBBY_PORT_INCREMENT
		local lobby_port = (LEVEL_EDITOR_TEST and GameSettingsDevelopment.editor_lobby_port) or development_port
		local network_options = {
			map = "game",
			project_hash = "bulldozer",
			max_members = 4,
			config_file_name = "global",
			lobby_port = lobby_port,
			server_port = script_data.server_port or script_data.settings.server_port,
			query_port = script_data.query_port or script_data.settings.query_port,
			steam_port = script_data.steam_port or script_data.settings.steam_port,
			ip_address = script_data.ip_address or script_data.settings.ip_address
		}
		self._network_options = network_options
	end

	return 
end
StateLoading.network_options = function (self)
	return self._network_options
end
StateLoading._setup_level_transition = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.level_transition_handler then
		self._level_transition_handler = loading_context.level_transition_handler
	else
		self._level_transition_handler = LevelTransitionHandler:new()

		self._level_transition_handler:set_next_level(self._level_transition_handler:default_level_key())
		Managers.account:set_level_transition_handler(self._level_transition_handler)
	end

	return 
end
StateLoading.has_registered_rpcs = function (self)
	return self._registered_rpcs
end
StateLoading.register_rpcs = function (self)
	self._network_event_delegate = NetworkEventDelegate:new()

	self._level_transition_handler:register_rpcs(self._network_event_delegate)

	if Managers.matchmaking then
		Managers.matchmaking:register_rpcs(self._network_event_delegate)
		Managers.matchmaking:setup_post_init_data({})
	end

	if Managers.game_server then
		Managers.game_server:register_rpcs(self._network_event_delegate)
	end

	Managers.chat:register_network_event_delegate(self._network_event_delegate)
	Managers.deed:register_rpcs(self._network_event_delegate)

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper.register_rpcs(level_end_view_wrapper, self._network_event_delegate)
		end
	end

	self._registered_rpcs = true

	print("registering RPCs")

	return 
end
StateLoading._unregister_rpcs = function (self)
	self._level_transition_handler:unregister_rpcs()

	if Managers.matchmaking then
		Managers.matchmaking:unregister_rpcs()
	end

	if Managers.game_server then
		Managers.game_server:unregister_rpcs()
	end

	Managers.chat:unregister_network_event_delegate(self._network_event_delegate)
	Managers.deed:unregister_rpcs()

	if self._level_end_view_wrappers then
		for i, level_end_view_wrapper in ipairs(self._level_end_view_wrappers) do
			level_end_view_wrapper.unregister_rpcs(level_end_view_wrapper)
		end
	end

	self._registered_rpcs = false

	return 
end
StateLoading.waiting_for_cleanup = function (self)
	return self._waiting_for_cleanup
end
StateLoading.setup_join_lobby = function (self)
	if PLATFORM == "xb1" and not Managers.account:all_lobbies_freed() then
		self._waiting_for_cleanup = true

		return 
	end

	if not self._lobby_client then
		local loading_context = self.parent.loading_context

		if loading_context.join_lobby_data then
			self._lobby_client = LobbyClient:new(self._network_options, self.parent.loading_context.join_lobby_data)
		elseif loading_context.join_server_data then
			self._lobby_client = GameServerLobbyClient:new(self._network_options, self.parent.loading_context.join_server_data)
		else
			ferror("no join lobby data")
		end

		self.parent.loading_context.join_lobby_data = nil
		self._handle_new_lobby_connection = true

		Managers.account:set_current_lobby(self._lobby_client.lobby)
	end

	return 
end
StateLoading.setup_lobby_finder = function (self, lobby_joined_callback, lobby_to_join, host_to_join, lobby_is_server)
	if Managers.package:is_loading("resource_packages/inventory", "global") then
		Managers.package:load("resource_packages/inventory", "global")
	end

	if lobby_is_server then
		local network_options = {
			config_file_name = "global",
			project_hash = "bulldozer"
		}
		local game_server_data = {
			server_info = {
				ip_port = lobby_to_join
			}
		}
		self._server_lobby = GameServerLobbyClient:new(network_options, game_server_data)
	else
		self._lobby_finder = LobbyFinder:new(self._network_options, nil, true)
		self._lobby_to_join = lobby_to_join
		self._host_to_join = host_to_join and host_to_join.peer_id
		self._host_to_join_name = host_to_join and host_to_join.name

		self._lobby_finder:refresh()
		printf("[StateLoading] StateLoading will try to find a lobby with id=%s or host=%s or unique_server_name=%s", tostring(lobby_to_join), tostring(host_to_join), tostring(script_data.unique_server_name))
	end

	local main_time = Managers.time:time("main")
	self._lobby_joined_callback = lobby_joined_callback
	self._lobby_finder_timeout = main_time + StateLoading.join_lobby_timeout
	self._lobby_finder_refresh_timer = main_time + StateLoading.join_lobby_refresh_interval

	if host_to_join then
		self.create_join_popup(self, self._host_to_join_name)
	end

	return 
end
StateLoading.setup_lobby_host = function (self, wait_for_joined_callback)
	local loading_context = self.parent.loading_context

	assert(not loading_context.profile_synchronizer)
	assert(not loading_context.network_server)

	self._lobby_host = LobbyHost:new(self._network_options)
	local level_key = self.get_next_level_key(self)

	if not self.loading_view_setup_done(self) then
		self.setup_loading_view(self, level_key)
	end

	if not self.menu_assets_setup_done(self) then
		self.setup_menu_assets(self)
	end

	self._load_level(self, level_key)

	if not wait_for_joined_callback then
		local initial_level = self._level_transition_handler:get_current_level_keys()
		local wanted_profile_index = self.parent.loading_context.wanted_profile_index
		self._network_server = NetworkServer:new(Managers.player, self._lobby_host, initial_level, wanted_profile_index, self._level_transition_handler)
		self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.connection_handler)

		self._network_transmit:set_network_event_delegate(self._network_event_delegate)
		self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
		self._network_server:server_join()

		self._profile_synchronizer = self._network_server.profile_synchronizer

		self._network_server.voip:set_input_manager(self._input_manager)

		loading_context.network_transmit = self._network_transmit
	end

	Managers.account:set_current_lobby(self._lobby_host.lobby)

	self._waiting_for_joined_callback = wait_for_joined_callback

	return 
end
StateLoading.host_joined = function (self)
	local loading_context = self.parent.loading_context
	local initial_level = self._level_transition_handler:get_current_level_keys()
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index
	self._network_server = NetworkServer:new(Managers.player, self._lobby_host, initial_level, wanted_profile_index, self._level_transition_handler)
	self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
	self._network_server:server_join()

	self._profile_synchronizer = self._network_server.profile_synchronizer

	self._network_server.voip:set_input_manager(self._input_manager)

	loading_context.network_transmit = self._network_transmit

	if self._waiting_for_joined_callback then
		self._waiting_for_joined_callback()

		self._waiting_for_joined_callback = nil
	end

	return 
end
StateLoading.setup_chat_manager = function (self, lobby, host_peer_id, my_peer_id, is_server)
	local network_context = {
		is_server = is_server,
		host_peer_id = host_peer_id,
		my_peer_id = my_peer_id
	}

	Managers.chat:setup_network_context(network_context)

	local function member_func()
		return lobby:members():get_members()
	end

	Managers.chat:register_channel(1, member_func)

	return 
end
StateLoading.setup_deed_manager = function (self, lobby, host_peer_id, my_peer_id, is_server)
	Managers.deed:network_context_created(lobby, host_peer_id, my_peer_id, is_server)

	return 
end
StateLoading.setup_network_transmit = function (self, network_handler)
	self._network_transmit = self.parent.loading_context.network_transmit or NetworkTransmit:new(true, network_handler.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	network_handler.register_rpcs(network_handler, self._network_event_delegate, self._network_transmit)

	self.parent.loading_context.network_transmit = self._network_transmit

	return 
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

	return 
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

	return 
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

	return 
end
StateLoading.setup_network_client = function (self, clear_peer_state, lobby_client)
	self._lobby_client = lobby_client or self._lobby_client

	if self._lobby_client.lobby == nil then
		self._wanted_state = StateTitleScreen
		self._lobby_client = nil
		self.parent.loading_context.lobby_client = nil

		self.create_popup(self, "failure_start_join_server", "popup_error_topic", "restart_as_server", "menu_accept")

		return false
	end

	Application.warning("Setting up network client")

	local host = self._lobby_client:lobby_host()
	local level_key = self._level_transition_handler:get_current_level_keys()
	local level_index = (level_key and NetworkLookup.level_keys[level_key]) or nil
	local wanted_profile_index = self.parent.loading_context.wanted_profile_index
	self._network_client = NetworkClient:new(self._level_transition_handler, host, level_index, wanted_profile_index, clear_peer_state, self._lobby_client)
	self._network_transmit = NetworkTransmit:new(false, self._network_client.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_client:register_rpcs(self._network_event_delegate, self._network_transmit)

	self._profile_synchronizer = self._network_client.profile_synchronizer
	self._handle_new_lobby_connection = nil

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
	return self._level_transition_handler:get_current_level_keys()
end
StateLoading.get_next_level_key = function (self)
	return self._level_transition_handler:get_next_level_key()
end
StateLoading.set_lobby_host_data = function (self, level_key)
	if self._lobby_host then
		local lobby_host = self._lobby_host
		local stored_lobby_host_data = lobby_host.get_stored_lobby_data(lobby_host) or {}
		stored_lobby_host_data.level_key = level_key
		stored_lobby_host_data.matchmaking = stored_lobby_host_data.matchmaking or "true"

		if level_key == "inn_level" then
			stored_lobby_host_data.matchmaking = "false"
		end

		local game_mode = LevelSettings[level_key].game_mode
		stored_lobby_host_data.game_mode = game_mode

		if PLATFORM == "ps4" then
			local region = Managers.account:region()
			local primary, secondary = MatchmakingRegionsHelper.get_matchmaking_regions(region)
			stored_lobby_host_data.primary_region = primary
			stored_lobby_host_data.secondary_region = secondary
		end

		lobby_host.set_lobby_data(lobby_host, stored_lobby_host_data)
	end

	return 
end
StateLoading.start_matchmaking = function (self)
	assert(self._lobby_host)

	local lobby_host = self._lobby_host
	local stored_lobby_host_data = lobby_host.get_stored_lobby_data(lobby_host) or {}
	stored_lobby_host_data.matchmaking = "true"

	lobby_host.set_lobby_data(lobby_host, stored_lobby_host_data)

	return 
end
StateLoading.get_lobby = function (self)
	local lobby = self._lobby_host or self._lobby_client

	return lobby
end

return 
