local transitions = {
	leave_group = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_exit_game")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("leave_game_popup_text")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_leave_game_topic"), "leave_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end

		return 
	end,
	quit_game = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local text = Localize("exit_game_popup_text")
		self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))

		return 
	end,
	return_to_title_screen = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_exit_game")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("exit_game_popup_text_xb1")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic_xb1"), "do_return_to_title_screen", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end

		return 
	end,
	return_to_demo_title_screen = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_exit_game")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("exit_game_popup_text_xb1")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic_xb1"), "do_return_to_demo_title_screen", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end

		return 
	end,
	restart_demo = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_restart_demo")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("restart_demo_popup_text")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_restart_demo_topic"), "do_restart_demo", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end

		return 
	end,
	demo_invert_controls = function (self)
		local views = self.views
		local ingame_menu = views.ingame_menu
		local active_button_data = ingame_menu.active_button_data
		local button_widget = nil

		for _, button_data in pairs(active_button_data) do
			if button_data.transition == "demo_invert_controls" then
				button_widget = button_data.widget

				break
			end
		end

		local button_name = nil
		local button_widget_content = {}

		if button_widget then
			button_widget_content = button_widget.content
			button_name = button_widget_content.title_text
		end

		local input_service = Managers.input:get_service("Player")

		if PLATFORM == "win32" then
			local platform_key = "win32"
			local input_filters = input_service.get_active_filters(input_service, platform_key)
			local look_filter = input_filters.look
			local function_data = look_filter.function_data
			function_data.filter_type = (button_name == "menu_invert_controls" and "scale_vector3") or "scale_vector3_invert_y"
		end

		platform_key = (PLATFORM == "ps4" and "ps4") or "xb1"
		local input_filters = input_service.get_active_filters(input_service, platform_key)
		local look_filter = input_filters.look_controller
		local function_data = look_filter.function_data
		function_data.filter_type = (button_name == "menu_invert_controls" and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_ranged
		local function_data = look_filter.function_data
		function_data.filter_type = (button_name == "menu_invert_controls" and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_melee
		local function_data = look_filter.function_data
		function_data.filter_type = (button_name == "menu_invert_controls" and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_zoom
		local function_data = look_filter.function_data
		function_data.filter_type = (button_name == "menu_invert_controls" and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		button_widget_content.title_text = (button_name == "menu_invert_controls" and "menu_non_invert_controls") or "menu_invert_controls"

		return 
	end,
	end_game = function (self)
		self.input_manager:block_device_except_service(nil, "keyboard", 1)
		self.input_manager:block_device_except_service(nil, "mouse", 1)
		self.input_manager:block_device_except_service(nil, "gamepad", 1)

		local telemetry_survey_view = self.views.telemetry_survey
		local level_key = Managers.state.game_mode:level_key()
		local use_survey = TelemetrySettings.send and TelemetrySettings.use_session_survey
		local is_answered = telemetry_survey_view.is_survey_answered(telemetry_survey_view)
		local is_timed_out = telemetry_survey_view.is_survey_timed_out(telemetry_survey_view)

		Managers.backend:commit(true)

		if (use_survey and (is_answered or is_timed_out)) or not use_survey or level_key == "inn_level" then
			Boot.quit_game = true
			self.current_view = nil
		else
			self.current_view = "telemetry_survey"

			telemetry_survey_view.set_transition(telemetry_survey_view, "end_game")
		end

		return 
	end,
	do_return_to_title_screen = function (self)
		self.return_to_title_screen = true

		return 
	end,
	do_return_to_demo_title_screen = function (self)
		self.return_to_demo_title_screen = true

		return 
	end,
	do_restart_demo = function (self)
		self.restart_demo = true

		return 
	end,
	do_return_to_pc_menu = function (self)
		self.return_to_pc_menu = true

		return 
	end,
	leave_game = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_exit_game")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			self.input_manager:block_device_except_service(nil, "keyboard", 1)
			self.input_manager:block_device_except_service(nil, "mouse", 1)
			self.input_manager:block_device_except_service(nil, "gamepad", 1)

			self.leave_game = true
		end

		return 
	end,
	return_to_pc_menu = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)
		end

		local network_server = Managers.state.network.network_server

		if network_server and not network_server.are_all_peers_ingame(network_server) then
			local text = Localize("player_join_block_exit_game")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("exit_game_popup_text_xb1")
			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic_xb1"), "do_return_to_pc_menu", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end

		return 
	end,
	ingame_menu = function (self)
		self.menu_active = true
		self.current_view = "ingame_menu"

		return 
	end,
	friends_view = function (self)
		self.current_view = "friends_view"

		return 
	end,
	friends_view_force = function (self)
		self.current_view = "friends_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	chat_view = function (self)
		self.current_view = "chat_view"

		return 
	end,
	chat_view_force = function (self)
		ShowCursorStack.push()

		self.current_view = "chat_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	keep_decoration_view_force = function (self)
		self.current_view = "keep_decoration_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	keep_decoration_view = function (self)
		self.current_view = "keep_decoration_view"

		return 
	end,
	hero_view_force = function (self)
		self.current_view = "hero_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	hero_view = function (self)
		self.current_view = "hero_view"

		return 
	end,
	start_game_view_force = function (self)
		self.current_view = "start_game_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	start_game_view = function (self)
		self.current_view = "start_game_view"

		return 
	end,
	start_menu_view_force = function (self)
		self.current_view = "start_menu_view"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	start_menu_view = function (self)
		self.current_view = "start_menu_view"

		return 
	end,
	initial_start_menu_view_force = function (self)
		self.current_view = "start_menu_view"
		self.initial_profile_view = true
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	exit_initial_start_menu_view = function (self)
		self.menu_active = false
		self.current_view = nil
		self.initial_profile_view = nil

		return 
	end,
	character_selection_force = function (self)
		self.current_view = "character_selection"
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	character_selection = function (self)
		self.current_view = "character_selection"

		return 
	end,
	initial_character_selection_force = function (self)
		self.current_view = "character_selection"
		self.initial_profile_view = true
		self.views[self.current_view].exit_to_game = true

		return 
	end,
	exit_initial_character_selection = function (self)
		self.menu_active = false
		self.current_view = nil
		self.initial_profile_view = nil

		return 
	end,
	join_lobby = function (self, lobby_client)
		self.input_manager:block_device_except_service(nil, "keyboard", 1)
		self.input_manager:block_device_except_service(nil, "mouse", 1)
		self.input_manager:block_device_except_service(nil, "gamepad", 1)

		self.join_lobby = lobby_client
		self.menu_active = false
		self.current_view = nil

		return 
	end,
	exit_menu = function (self)
		if not self.countdown_ui:is_enter_game() and not Managers.chat:chat_is_focused() and not Managers.matchmaking:is_join_popup_visible() then
			self.input_manager:device_unblock_all_services("keyboard", 1)
			self.input_manager:device_unblock_all_services("mouse", 1)
			self.input_manager:device_unblock_all_services("gamepad", 1)
		end

		self.menu_active = false
		self.current_view = nil

		return 
	end,
	cancel_popup = function (self)
		self.popup_id = nil

		self.input_manager:block_device_except_service("ingame_menu", "keyboard", 1)
		self.input_manager:block_device_except_service("ingame_menu", "mouse", 1)
		self.input_manager:block_device_except_service("ingame_menu", "gamepad", 1)

		return 
	end,
	credits_menu = function (self)
		self.current_view = "credits_view"

		return 
	end,
	options_menu = function (self)
		self.current_view = "options_view"

		return 
	end,
	restart_game = function (self)
		self.input_manager:device_unblock_all_services("keyboard", 1)
		self.input_manager:device_unblock_all_services("mouse", 1)
		self.input_manager:device_unblock_all_services("gamepad", 1)

		self.restart_game = true

		return 
	end,
	close_active = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)

			self.popup_id = nil
		end

		self.menu_active = nil
		self.current_view = nil

		return 
	end
}
view_settings = {
	ui_renderer_function = function (world, is_tutorial)
		local materials = {
			"material",
			"materials/ui/ui_1080p_hud_atlas_textures",
			"material",
			"materials/ui/ui_1080p_hud_single_textures",
			"material",
			"materials/ui/ui_1080p_menu_atlas_textures",
			"material",
			"materials/ui/ui_1080p_menu_single_textures",
			"material",
			"materials/ui/ui_1080p_common",
			"material",
			"materials/ui/ui_1080p_chat",
			"material",
			"materials/fonts/gw_fonts"
		}

		if is_tutorial then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_tutorial_textures"
		end

		for _, settings in pairs(CareerSettings) do
			local video = settings.video
			materials[#materials + 1] = "material"
			materials[#materials + 1] = video.resource
		end

		if PLATFORM == "win32" then
			return UIRenderer.create(world, unpack(materials))
		else
			return UIRenderer.create(world, unpack(materials))
		end

		return 
	end,
	ui_top_renderer_function = function (top_world, is_tutorial)
		local materials = {
			"material",
			"materials/ui/ui_1080p_hud_atlas_textures",
			"material",
			"materials/ui/ui_1080p_hud_single_textures",
			"material",
			"materials/ui/ui_1080p_menu_atlas_textures",
			"material",
			"materials/ui/ui_1080p_menu_single_textures",
			"material",
			"materials/ui/ui_1080p_common",
			"material",
			"materials/ui/ui_1080p_chat",
			"material",
			"materials/fonts/gw_fonts"
		}

		if is_tutorial then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_tutorial_textures"
		end

		for _, settings in pairs(CareerSettings) do
			local video = settings.video
			materials[#materials + 1] = "material"
			materials[#materials + 1] = video.resource
		end

		if PLATFORM == "win32" then
			return UIRenderer.create(world, unpack(materials))
		else
			return UIRenderer.create(world, unpack(materials))
		end

		return 
	end,
	views_function = function (ingame_ui_context)
		return {
			credits_view = CreditsView:new(ingame_ui_context),
			telemetry_survey = TelemetrySurveyView:new(ingame_ui_context),
			options_view = OptionsView:new(ingame_ui_context),
			friends_view = FriendsView:new(ingame_ui_context),
			hero_view = HeroView:new(ingame_ui_context),
			keep_decoration_view = KeepDecorationView:new(ingame_ui_context),
			character_selection = CharacterSelectionView:new(ingame_ui_context),
			start_menu_view = StartMenuView:new(ingame_ui_context),
			start_game_view = StartGameView:new(ingame_ui_context),
			ingame_menu = IngameView:new(ingame_ui_context),
			chat_view = (PLATFORM == "win32" and ChatView:new(ingame_ui_context)) or nil
		}
	end,
	hotkey_mapping = {
		hotkey_hero = {
			disable_when_matchmaking = true,
			in_transition = "character_selection_force",
			error_message = "matchmaking_ready_interaction_message_profile_view",
			view = "character_selection",
			transition_state = "character",
			disable_when_matchmaking_ready = true,
			in_transition_menu = "character_selection_view"
		},
		hotkey_map = {
			disable_when_matchmaking = true,
			in_transition = "start_game_view_force",
			error_message = "matchmaking_ready_interaction_message_map",
			view = "start_game_view",
			transition_state = "play",
			disable_when_matchmaking_ready = true,
			in_transition_menu = "start_game_view"
		},
		hotkey_inventory = {
			in_transition = "hero_view_force",
			error_message = "matchmaking_ready_interaction_message_inventory",
			view = "hero_view",
			transition_state = "overview",
			disable_when_matchmaking_ready = true,
			in_transition_menu = "hero_view"
		}
	},
	blocked_transitions = {}
}

return {
	transitions = transitions,
	view_settings = view_settings
}
