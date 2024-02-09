-- chunkname: @scripts/ui/views/ingame_ui_settings.lua

local transitions = {
	leave_group = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local warning_message_data = Managers.mechanism:mechanism_setting("progress_loss_warning_message_data")
			local text = warning_message_data ~= nil and warning_message_data.is_allowed() and Localize("leave_game_popup_text") .. "\n\n" .. Localize(warning_message_data.message) or Localize("leave_game_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_leave_game_topic"), "leave_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end
	end,
	leave_group_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			local warning_message_data = Managers.mechanism:mechanism_setting("progress_loss_warning_message_data")
			local text = warning_message_data ~= nil and warning_message_data.is_allowed() and Localize("leave_game_popup_text") .. "\n\n" .. Localize(warning_message_data.message) or Localize("leave_game_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_leave_game_topic"), "leave_game_hero_view", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
		end
	end,
	quit_game = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server
		local warning_message_data = Managers.mechanism:mechanism_setting("progress_loss_warning_message_data")

		if network_server and network_server:num_active_peers() > 1 and network_server:are_all_peers_ingame() then
			local text = warning_message_data ~= nil and warning_message_data.is_allowed() and Localize("exit_game_popup_text") .. "\n\n" .. Localize("exit_game_popup_text_is_hosting_players") .. "\n\n\n" .. Localize(warning_message_data.message) or Localize("exit_game_popup_text") .. "\n\n" .. Localize("exit_game_popup_text_is_hosting_players")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))

			return
		end

		local text = warning_message_data ~= nil and warning_message_data.is_allowed() and Localize("exit_game_popup_text") .. "\n\n" .. Localize(warning_message_data.message) or Localize("quit_game_popup_text")

		self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
	end,
	quit_game_hero_view = function (self)
		self:_cancel_popup()

		local warning_message_data = Managers.mechanism:mechanism_setting("progress_loss_warning_message_data")
		local text = warning_message_data ~= nil and warning_message_data.is_allowed() and Localize("exit_game_popup_text") .. "\n\n" .. Localize(warning_message_data.message) or Localize("quit_game_popup_text")

		self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
	end,
	return_to_title_screen = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server then
			if not network_server:are_all_peers_ingame() then
				local text = Localize("player_join_block_exit_game")

				self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))

				return
			elseif network_server:num_active_peers() > 1 then
				local text = Localize("exit_game_popup_text") .. "\n\n" .. Localize("exit_game_popup_text_is_hosting_players")

				self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))

				return
			end
		end

		local text = Localize("exit_to_title_popup_text")

		self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_title_screen", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
	end,
	return_to_title_screen_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			local text = Localize("exit_to_title_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_title_screen_hero_view", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
		end
	end,
	return_to_demo_title_screen = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("exit_to_title_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_demo_title_screen", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end
	end,
	return_to_demo_title_screen_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			local text = Localize("exit_to_title_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_demo_title_screen", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
		end
	end,
	restart_demo = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_restart_demo")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			local text = Localize("restart_demo_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_restart_demo_topic"), "do_restart_demo", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
		end
	end,
	restart_demo_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_restart_demo")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			local text = Localize("restart_demo_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_restart_demo_topic"), "do_restart_demo", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
		end
	end,
	demo_invert_controls = function (self)
		local views = self.views
		local hero_view = views.hero_view
		local state = hero_view:current_state()
		local active_windows = state._active_windows
		local ingame_menu_window = active_windows[4]
		local layout_logic = ingame_menu_window.layout_logic
		local active_button_data = layout_logic.active_button_data
		local invert_button_data, button_name

		for _, button_data in pairs(active_button_data) do
			if button_data.transition == "demo_invert_controls" then
				invert_button_data = button_data
				button_name = button_data.display_name

				break
			end
		end

		local input_service = Managers.input:get_service("Player")

		if IS_WINDOWS then
			local platform_key = "win32"
			local input_filters = input_service:get_active_filters(platform_key)
			local look_filter = input_filters.look
			local function_data = look_filter.function_data

			function_data.filter_type = function_data.filter_type == "scale_vector3" and "scale_vector3_invert_y" or "scale_vector3"
		end

		local platform_key = IS_PS4 and "ps4" or "xb1"
		local input_filters = input_service:get_active_filters(platform_key)
		local look_filter = input_filters.look_controller
		local function_data = look_filter.function_data

		function_data.filter_type = function_data.filter_type == "scale_vector3_xy_accelerated_x" and "scale_vector3_xy_accelerated_x_inverted" or "scale_vector3_xy_accelerated_x"

		local look_filter = input_filters.look_controller_ranged
		local function_data = look_filter.function_data

		function_data.filter_type = function_data.filter_type == "scale_vector3_xy_accelerated_x" and "scale_vector3_xy_accelerated_x_inverted" or "scale_vector3_xy_accelerated_x"

		local look_filter = input_filters.look_controller_melee
		local function_data = look_filter.function_data

		function_data.filter_type = function_data.filter_type == "scale_vector3_xy_accelerated_x" and "scale_vector3_xy_accelerated_x_inverted" or "scale_vector3_xy_accelerated_x"

		local look_filter = input_filters.look_controller_zoom
		local function_data = look_filter.function_data

		function_data.filter_type = function_data.filter_type == "scale_vector3_xy_accelerated_x" and "scale_vector3_xy_accelerated_x_inverted" or "scale_vector3_xy_accelerated_x"
		invert_button_data.display_name = button_name == "menu_invert_controls" and "menu_non_invert_controls" or "menu_invert_controls"
	end,
	end_game = function (self)
		Application.force_silent_exit_policy()
		self.input_manager:block_device_except_service(nil, "keyboard", 1)
		self.input_manager:block_device_except_service(nil, "mouse", 1)
		self.input_manager:block_device_except_service(nil, "gamepad", 1)

		local telemetry_survey_view = self.views.telemetry_survey
		local level_key = Managers.state.game_mode:level_key()
		local level_setting = LevelSettings[level_key]
		local use_survey = TelemetrySettings.send and TelemetrySettings.use_session_survey
		local is_answered = telemetry_survey_view:is_survey_answered()
		local is_timed_out = telemetry_survey_view:is_survey_timed_out()
		local backend_manager = Managers.backend

		local function commit_complete_callback()
			if use_survey and (is_answered or is_timed_out) or not use_survey or level_setting.hub_level then
				self.quit_game = true
				self.current_view = nil
			else
				self.current_view = "telemetry_survey"

				telemetry_survey_view:set_transition("end_game")
			end
		end

		local id = backend_manager:on_shutdown(commit_complete_callback)

		if not id then
			local t = Managers.time:time("ui")

			self.quit_game_retry = true
			self.delay_quit_game_retry = t + 1
		end
	end,
	do_return_to_title_screen = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		elseif Managers.matchmaking:is_joining_friend() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			self.input_manager:block_device_except_service(nil, "keyboard", 1)
			self.input_manager:block_device_except_service(nil, "mouse", 1)
			self.input_manager:block_device_except_service(nil, "gamepad", 1)

			self.return_to_title_screen = true
		end
	end,
	do_return_to_title_screen_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		elseif Managers.matchmaking:is_joining_friend() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			self.input_manager:block_device_except_service(nil, "keyboard", 1)
			self.input_manager:block_device_except_service(nil, "mouse", 1)
			self.input_manager:block_device_except_service(nil, "gamepad", 1)

			self.return_to_title_screen = true
		end
	end,
	do_return_to_demo_title_screen = function (self)
		self.return_to_demo_title_screen = true
	end,
	do_restart_demo = function (self)
		self.restart_demo = true
	end,
	do_return_to_pc_menu = function (self)
		local network_server = Managers.state.network.network_server

		if network_server and network_server:are_all_peers_ingame() then
			self.return_to_pc_menu = true
		elseif not network_server then
			self.return_to_pc_menu = true
		end
	end,
	leave_game = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		elseif Managers.matchmaking:is_joining_friend() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))
		else
			self.input_manager:block_device_except_service(nil, "keyboard", 1)
			self.input_manager:block_device_except_service(nil, "mouse", 1)
			self.input_manager:block_device_except_service(nil, "gamepad", 1)

			self.leave_game = true
		end
	end,
	leave_game_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		elseif Managers.matchmaking:is_joining_friend() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			self.input_manager:block_device_except_service(nil, "keyboard", 1)
			self.input_manager:block_device_except_service(nil, "mouse", 1)
			self.input_manager:block_device_except_service(nil, "gamepad", 1)

			self.leave_game = true
		end
	end,
	return_to_pc_menu = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server then
			if not network_server:are_all_peers_ingame() then
				local text = Localize("player_join_block_exit_game")

				self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup", Localize("menu_ok"))

				return
			elseif network_server:num_active_peers() > 1 then
				local text = Localize("exit_to_title_popup_text") .. "\n\n" .. Localize("exit_game_popup_text_is_hosting_players")

				self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_game_topic"), "do_return_to_pc_menu", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))

				return
			end
		end

		local text = Localize("exit_to_title_popup_text")

		self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_pc_menu", Localize("popup_choice_yes"), "cancel_popup", Localize("popup_choice_no"))
	end,
	return_to_pc_menu_hero_view = function (self)
		self:_cancel_popup()

		local network_server = Managers.state.network.network_server

		if network_server and not network_server:are_all_peers_ingame() then
			local text = Localize("player_join_block_exit_game")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_error_topic"), "cancel_popup_hero_view", Localize("menu_ok"))
		else
			local text = Localize("exit_to_title_popup_text")

			self.popup_id = Managers.popup:queue_popup(text, Localize("popup_exit_to_title_topic"), "do_return_to_pc_menu", Localize("popup_choice_yes"), "cancel_popup_hero_view", Localize("popup_choice_no"))
		end
	end,
	ingame_menu = function (self)
		self.menu_active = true
		self.current_view = "ingame_menu"
	end,
	chat_view = function (self)
		self.current_view = "chat_view"
	end,
	chat_view_force = function (self)
		ShowCursorStack.push()

		self.current_view = "chat_view"
		self.views[self.current_view].exit_to_game = true
	end,
	hero_view_force = function (self)
		self.current_view = "hero_view"
		self.views[self.current_view].exit_to_game = true
	end,
	hero_view = function (self)
		self.current_view = "hero_view"
	end,
	spoils_of_war = function (self)
		self.current_view = "hero_view"
	end,
	start_game_view_force = function (self)
		self.current_view = "start_game_view"
		self.views[self.current_view].exit_to_game = true
	end,
	start_game_view = function (self)
		self.current_view = "start_game_view"
	end,
	start_menu_view_force = function (self)
		self.current_view = "start_menu_view"
		self.views[self.current_view].exit_to_game = true
	end,
	start_menu_view = function (self)
		self.current_view = "start_menu_view"
	end,
	initial_start_menu_view_force = function (self)
		self.current_view = "start_menu_view"
		self.initial_profile_view = true
		self.views[self.current_view].exit_to_game = true
	end,
	exit_initial_start_menu_view = function (self)
		self.menu_active = false
		self.current_view = nil
		self.initial_profile_view = nil
		self.has_left_menu = true
	end,
	character_selection_force = function (self)
		self.current_view = "character_selection"
		self.views[self.current_view].exit_to_game = true
	end,
	character_selection = function (self)
		self.current_view = "character_selection"
	end,
	initial_character_selection_force = function (self, params)
		self.current_view = "character_selection"
		self.initial_profile_view = true
		self.views[self.current_view].exit_to_game = true

		if params.back_to_vs_preview then
			self.views[self.current_view].back_to_vs_preview = params.back_to_vs_preview
		end
	end,
	exit_initial_character_selection = function (self)
		self.menu_active = false
		self.current_view = nil
		self.initial_profile_view = nil
	end,
	join_lobby = function (self, lobby_client)
		self.input_manager:block_device_except_service(nil, "keyboard", 1)
		self.input_manager:block_device_except_service(nil, "mouse", 1)
		self.input_manager:block_device_except_service(nil, "gamepad", 1)

		self.join_lobby = lobby_client
		self.menu_active = false
		self.current_view = nil
	end,
	exit_menu = function (self)
		local ingame_hud = self.ingame_hud
		local countdown_ui = ingame_hud:component("LevelCountdownUI")
		local is_enter_game = countdown_ui and countdown_ui:is_enter_game()

		if not is_enter_game and not Managers.chat:chat_is_focused() and not self:get_active_popup("profile_picker") then
			self.input_manager:device_unblock_all_services("keyboard", 1)
			self.input_manager:device_unblock_all_services("mouse", 1)
			self.input_manager:device_unblock_all_services("gamepad", 1)
		end

		self.menu_active = false
		self.current_view = nil
	end,
	cancel_popup = function (self)
		self.popup_id = nil

		self.input_manager:block_device_except_service("ingame_menu", "keyboard", 1)
		self.input_manager:block_device_except_service("ingame_menu", "mouse", 1)
		self.input_manager:block_device_except_service("ingame_menu", "gamepad", 1)
	end,
	cancel_popup_hero_view = function (self)
		self.popup_id = nil

		self.input_manager:block_device_except_service("hero_view", "keyboard", 1)
		self.input_manager:block_device_except_service("hero_view", "mouse", 1)
		self.input_manager:block_device_except_service("hero_view", "gamepad", 1)
	end,
	credits_menu = function (self)
		self.current_view = "credits_view"
	end,
	options_menu = function (self)
		self.current_view = "options_view"
	end,
	console_friends_menu = function (self)
		self.current_view = "console_friends_view"
	end,
	restart_game = function (self)
		self.input_manager:device_unblock_all_services("keyboard", 1)
		self.input_manager:device_unblock_all_services("mouse", 1)
		self.input_manager:device_unblock_all_services("gamepad", 1)

		self.restart_game = true
	end,
	close_active = function (self)
		if self.popup_id then
			Managers.popup:cancel_popup(self.popup_id)

			self.popup_id = nil
		end

		self.menu_active = nil
		self.current_view = nil
	end,
}
local view_settings = {
	ui_renderer_function = function (world, is_tutorial, is_in_inn, mechanism_key)
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
			"materials/fonts/gw_fonts",
		}

		if is_in_inn then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_achievement_atlas_textures"
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_inn_single_textures"
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_lock_test"

			for _, settings in pairs(AreaSettings) do
				local video_settings = settings.video_settings

				materials[#materials + 1] = "material"
				materials[#materials + 1] = video_settings.resource
			end

			for _, dlc in pairs(DLCSettings) do
				local ui_materials_in_inn = dlc.ui_materials_in_inn
				local ui_materials_in_inn_condition = dlc.ui_materials_in_inn_condition

				if ui_materials_in_inn and (not ui_materials_in_inn_condition or ui_materials_in_inn_condition(is_tutorial, is_in_inn, mechanism_key)) then
					for _, path in ipairs(ui_materials_in_inn) do
						materials[#materials + 1] = "material"
						materials[#materials + 1] = path
					end
				end
			end
		end

		for _, dlc in pairs(DLCSettings) do
			local ui_materials = dlc.ui_materials
			local ui_materials_condition = dlc.ui_materials_condition

			if ui_materials and (not ui_materials_condition or ui_materials_condition(is_tutorial, is_in_inn, mechanism_key)) then
				for _, path in ipairs(ui_materials) do
					materials[#materials + 1] = "material"
					materials[#materials + 1] = path
				end
			end
		end

		if is_tutorial then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_tutorial_textures"
		end

		for _, settings in pairs(CareerSettings) do
			local video = settings.video

			if video then
				materials[#materials + 1] = "material"
				materials[#materials + 1] = video.resource
			end
		end

		if IS_WINDOWS then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "video/ui_option"
		end

		if IS_WINDOWS then
			return UIRenderer.create(world, unpack(materials))
		else
			return UIRenderer.create(world, unpack(materials))
		end
	end,
	ui_top_renderer_function = function (top_world, is_tutorial, is_in_inn)
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
			"materials/fonts/gw_fonts",
		}

		if is_in_inn then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_achievement_atlas_textures"
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_inn_single_textures"

			for _, settings in pairs(AreaSettings) do
				local video_settings = settings.video_settings

				materials[#materials + 1] = "material"
				materials[#materials + 1] = video_settings.resource
			end

			for _, dlc in pairs(DLCSettings) do
				local ui_materials_in_inn = dlc.ui_materials_in_inn

				if ui_materials_in_inn then
					for _, path in ipairs(ui_materials_in_inn) do
						materials[#materials + 1] = "material"
						materials[#materials + 1] = path
					end
				end
			end
		end

		for _, dlc in pairs(DLCSettings) do
			local ui_materials = dlc.ui_materials

			if ui_materials then
				for _, path in ipairs(ui_materials) do
					materials[#materials + 1] = "material"
					materials[#materials + 1] = path
				end
			end
		end

		if is_tutorial then
			materials[#materials + 1] = "material"
			materials[#materials + 1] = "materials/ui/ui_1080p_tutorial_textures"
		end

		for _, settings in pairs(CareerSettings) do
			local video = settings.video

			materials[#materials + 1] = "material"
			materials[#materials + 1] = video.resource
		end

		if IS_WINDOWS then
			return UIRenderer.create(world, unpack(materials))
		else
			return UIRenderer.create(world, unpack(materials))
		end
	end,
	views_function = function (ingame_ui_context)
		local views = {
			credits_view = CreditsView:new(ingame_ui_context),
			telemetry_survey = TelemetrySurveyView:new(ingame_ui_context),
			options_view = OptionsView:new(ingame_ui_context),
			hero_view = HeroView:new(ingame_ui_context),
			character_selection = CharacterSelectionView:new(ingame_ui_context),
			start_menu_view = StartMenuView:new(ingame_ui_context),
			start_game_view = StartGameView:new(ingame_ui_context),
			ingame_menu = IngameView:new(ingame_ui_context),
			chat_view = IS_WINDOWS and ChatView:new(ingame_ui_context) or nil,
			console_friends_view = ConsoleFriendsView:new(ingame_ui_context),
		}

		for _, dlc in pairs(DLCSettings) do
			if dlc.ui_views then
				local game_mechanism_name = Managers.mechanism:current_mechanism_name()

				for _, view in ipairs(dlc.ui_views) do
					local view_name = view.name
					local view_class_name = view.class_name

					if view_name and view_class_name then
						fassert(views[view_name] == nil, "view name (%s) already exists", view_name)

						local filter = view.mechanism_filter

						if (not filter or filter[game_mechanism_name] == true) and (not view.only_in_inn or ingame_ui_context.is_in_inn) and (not view.only_in_game or not ingame_ui_context.is_in_inn) then
							views[view_name] = _G[view_class_name]:new(ingame_ui_context)
						end
					end
				end
			end
		end

		return views
	end,
	hotkey_mapping = {
		hotkey_hero = {
			disable_when_matchmaking = false,
			disable_when_matchmaking_in_versus = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_profile_view",
			in_transition = "character_selection_force",
			in_transition_menu = "character_selection_view",
			transition_state = "character",
			view = "character_selection",
		},
		hotkey_map = {
			disable_when_matchmaking = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_map",
			in_transition = "start_game_view_force",
			in_transition_menu = "start_game_view",
			transition_state = "play",
			view = "start_game_view",
		},
		hotkey_inventory = {
			disable_when_matchmaking_in_versus = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_inventory",
			in_transition = "hero_view_force",
			in_transition_menu = "hero_view",
			transition_state = "overview",
			view = "hero_view",
		},
		hotkey_loot = {
			can_interact_func = "not_in_modded",
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_loot",
			in_transition = "hero_view_force",
			in_transition_menu = "hero_view",
			transition_state = "loot",
			view = "hero_view",
		},
		hotkey_achievements = {
			cat_disabled = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_achievements",
			in_transition = "hero_view_force",
			in_transition_menu = "hero_view",
			transition_state = "achievements",
			view = "hero_view",
		},
		hotkey_weave_forge = {
			can_interact_func = "weaves_requirements_fulfilled",
			disable_when_matchmaking = false,
			disable_when_matchmaking_in_versus = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_weave_forge",
			in_transition = "hero_view_force",
			in_transition_menu = "hero_view",
			required_dlc = "scorpion",
			transition_state = "weave_forge",
			view = "hero_view",
		},
		hotkey_weave_play = {
			can_interact_func = "weaves_requirements_fulfilled",
			disable_when_matchmaking_in_versus = true,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_weave_play",
			in_transition = "start_game_view_force",
			in_transition_menu = "start_game_view",
			required_dlc = "scorpion",
			transition_state = "play",
			transition_sub_state = "weave_quickplay",
			view = "start_game_view",
		},
		hotkey_weave_leaderboard = {
			can_interact_func = "weaves_requirements_fulfilled",
			disable_when_matchmaking = false,
			disable_when_matchmaking_ready = true,
			error_message = "matchmaking_ready_interaction_message_weave_leaderboard",
			in_transition = "start_game_view_force",
			in_transition_menu = "start_game_view",
			required_dlc = "scorpion",
			transition_state = "leaderboard",
			view = "start_game_view",
		},
	},
	blocked_transitions = {},
}

DLCUtils.map_list("ui_views", function (view)
	if view.transitions then
		for name, func in pairs(view.transitions) do
			fassert(not transitions[name], "Transition %q already exists", name)

			transitions[name] = func
		end
	end
end)
DLCUtils.merge("hotkey_mapping", view_settings.hotkey_mapping)
DLCUtils.merge("ui_transitions", transitions)

return {
	transitions = transitions,
	view_settings = view_settings,
}
