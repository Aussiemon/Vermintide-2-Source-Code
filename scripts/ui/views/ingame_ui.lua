require("scripts/ui/ui_layer")
require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")
require("scripts/ui/views/widget_definitions")
require("scripts/ui/views/ingame_view")
require("scripts/ui/views/ingame_hud")
require("scripts/ui/views/popup_handler")
require("scripts/ui/views/popup_join_lobby_handler")
require("scripts/ui/views/end_screen_ui")
require("scripts/ui/views/cutscene_ui")
require("scripts/ui/views/matchmaking_ui")
require("scripts/settings/ui_settings")
require("scripts/settings/ui_frame_settings")
require("scripts/ui/hud_ui/level_countdown_ui")
require("scripts/ui/help_screen/help_screen_ui")
require("scripts/ui/views/keep_decoration_view")
require("scripts/ui/views/credits_view")
require("scripts/ui/views/options_view")
require("scripts/ui/views/unlock_key_view")
require("scripts/ui/views/telemetry_survey_view")
require("scripts/ui/views/friends_view")
require("scripts/ui/views/ingame_voting_ui")
require("scripts/ui/views/hero_view/hero_view")
require("scripts/ui/views/start_game_view/start_game_view")
require("scripts/ui/views/character_selection_view/character_selection_view")
require("scripts/ui/views/chat_view")
require("scripts/ui/mission_vote_ui/mission_voting_ui")
require("scripts/ui/views/start_menu_view/start_menu_view")
require("scripts/ui/views/friends_ui_component")

local rpcs = {}
local settings = require("scripts/ui/views/ingame_ui_settings")
local view_settings = settings.view_settings
local transitions = settings.transitions
IngameUI = class(IngameUI)
local ALWAYS_LOAD_ALL_VIEWS = script_data.always_load_all_views or Development.parameter("always_load_all_views")
IngameUI.init = function (self, ingame_ui_context)
	printf("[IngameUI] init")

	self.unlock_manager = Managers.unlock
	self.world_manager = ingame_ui_context.world_manager
	self.camera_manager = ingame_ui_context.camera_manager
	self.is_in_inn = ingame_ui_context.is_in_inn
	local world = Managers.world:world("level_world")
	local top_world = Managers.world:world("top_ingame_view")
	self.wwise_world = Managers.world:wwise_world(world)
	self.world = world
	self.top_world = top_world
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local is_tutorial = game_mode_key == "tutorial"
	self.ui_renderer = self.create_ui_renderer(self, world, is_tutorial)
	self.ui_top_renderer = self.create_ui_renderer(self, top_world, is_tutorial)
	self.blocked_transitions = view_settings.blocked_transitions
	self.fps = 0
	self._fps_cooldown = 0

	UISetupFontHeights(self.ui_renderer.gui)

	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager.create_input_service(input_manager, "ingame_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "ingame_menu", "keyboard")
	input_manager.map_device_to_service(input_manager, "ingame_menu", "mouse")
	input_manager.map_device_to_service(input_manager, "ingame_menu", "gamepad")

	ingame_ui_context.ui_renderer = self.ui_renderer
	ingame_ui_context.ui_top_renderer = self.ui_top_renderer
	ingame_ui_context.ingame_ui = self
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.ingame_hud = IngameHud:new(ingame_ui_context)
	self.countdown_ui = LevelCountdownUI:new(ingame_ui_context)
	self.is_server = ingame_ui_context.is_server
	self.last_resolution_x, self.last_resolution_y = Application.resolution()

	InitVideo()
	self.setup_views(self, ingame_ui_context)

	if self.views.map_view then
		self.views.map_view:set_friends_view(self.views.friends_view)
	end

	self.end_screen = EndScreenUI:new(ingame_ui_context)
	self.voting_manager = ingame_ui_context.voting_manager
	self.ingame_voting_ui = IngameVotingUI:new(ingame_ui_context)
	self.mission_voting_ui = MissionVotingUI:new(ingame_ui_context)

	if GameSettingsDevelopment.help_screen_enabled then
		self.help_screen = HelpScreenUI:new(ingame_ui_context)
	end

	local cutscene_system = Managers.state.entity:system("cutscene_system")
	self.cutscene_ui = CutsceneUI:new(ingame_ui_context, cutscene_system)
	self.cutscene_system = cutscene_system

	self.register_rpcs(self, ingame_ui_context.network_event_delegate)
	GarbageLeakDetector.register_object(self, "IngameUI")

	self.matchmaking_ui = MatchmakingUI:new(ingame_ui_context)

	if not self.is_server and self.is_in_inn and self.views.map_view then
		self.views.map_view:set_map_interaction_state(false)
	end

	Managers.chat:set_profile_synchronizer(ingame_ui_context.profile_synchronizer)
	Managers.chat:set_wwise_world(self.world_manager:wwise_world(self.world))
	Managers.chat:set_input_manager(input_manager)
	Managers.rcon:set_input_manager(input_manager)

	self.telemetry_time_view_enter = 0
	self.ingame_ui_context = ingame_ui_context

	Managers.matchmaking:set_ingame_ui(self)
	rawset(_G, "ingame_ui", self)

	return 
end
IngameUI.create_ui_renderer = function (self, world, is_tutorial)
	return view_settings.ui_renderer_function(world, is_tutorial)
end
IngameUI.setup_views = function (self, ingame_ui_context)
	self.views = view_settings.views_function(ingame_ui_context)
	self.hotkey_mapping = view_settings.hotkey_mapping

	return 
end
IngameUI.setup_specific_view = function (self, key, class_name)
	printf("[IngameUI] setup_specific_view %s", class_name)

	local class = rawget(_G, class_name)

	if self.views[key] and self.views[key].destroy then
		self.views[key]:destroy()
		printf("[IngameUI] setup_specific_view destroy %s", class_name)
	end

	self.views[key] = class.new(class, self.ingame_ui_context)

	return 
end
IngameUI.is_local_player_ready_for_game = function (self)
	if self.is_in_inn then
		local player_manager = Managers.player
		local local_player = player_manager.local_player(player_manager)
		local player_unit = local_player and local_player.player_unit

		if player_unit then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			return status_ext.is_in_end_zone(status_ext)
		end
	end

	return 
end
IngameUI.can_view_lobby_browser = function (self)
	local is_server = self.is_server
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	return is_server and not is_game_matchmaking
end
script_data.lorebook_enabled = script_data.lorebook_enabled or Development.parameter("lorebook_enabled")
IngameUI.is_lorebook_enabled = function (self)
	if not script_data.lorebook_enabled then
		return false
	end

	return true
end
IngameUI.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(rpcs))

	return 
end
IngameUI.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	return 
end
IngameUI.destroy = function (self)
	self.unregister_rpcs(self)
	Managers.chat:set_profile_synchronizer(nil)
	Managers.chat:set_wwise_world(nil)
	Managers.chat:set_input_manager(nil)
	Managers.rcon:set_input_manager(nil)

	local current_view = self.current_view
	local menu_active = self.menu_active

	if not menu_active and current_view then
	end

	if current_view then
		self.views[current_view]:on_exit()

		self.current_view = nil
	end

	for k, view in pairs(self.views) do
		if view.destroy then
			view.destroy(view)
		end
	end

	self.matchmaking_ui:destroy()

	self.matchmaking_ui = nil

	self.end_screen:destroy()

	self.end_screen = nil

	self.ingame_hud:destroy()

	self.ingame_hud = nil

	self.cutscene_ui:destroy()

	self.cutscene_ui = nil
	self.cutscene_system = nil

	self.countdown_ui:destroy()

	self.countdown_ui = nil

	if self.help_screen then
		self.help_screen:destroy()

		self.help_screen = nil
	end

	if self.popup_join_lobby_handler then
		self.hide_unavailable_hero_popup(self)
	end

	self.ingame_voting_ui:destroy()

	self.ingame_voting_ui = nil

	self.mission_voting_ui:destroy()

	self.mission_voting_ui = nil

	UIRenderer.destroy(self.ui_renderer, self.world)
	UIRenderer.destroy(self.ui_top_renderer, self.top_world)

	self.ui_renderer = nil
	self.ui_top_renderer = nil

	if self.popup_id then
		Managers.popup:cancel_popup(self.popup_id)
	end

	printf("[IngameUI] destroy")
	rawset(_G, "ingame_ui", nil)

	return 
end
IngameUI.handle_menu_hotkeys = function (self, dt, input_service, hotkeys_enabled, menu_active)
	if not hotkeys_enabled then
		return 
	end

	local views = self.views
	local current_view = self.current_view
	local hotkey_mapping = self.hotkey_mapping
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	local has_player = local_player and local_player.player_unit ~= nil

	if not has_player then
		return 
	end

	local player_ready_for_game = self.is_local_player_ready_for_game(self)
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	for input, mapping_data in pairs(hotkey_mapping) do
		if not current_view or current_view == mapping_data.view then
			if current_view then
				local active_view = views[current_view]
				local active_input_service = active_view.input_service(active_view)

				if not active_view.transitioning(active_view) and active_input_service.get(active_input_service, input) then
					local hotkey_allowed = active_view.hotkey_allowed and active_view.hotkey_allowed(active_view, input, mapping_data)
					hotkey_allowed = hotkey_allowed ~= false

					if hotkey_allowed then
						local return_to_game = not menu_active

						views[current_view]:exit(return_to_game)

						break
					end
				end
			else
				local disable_when_matchmaking = mapping_data.disable_when_matchmaking
				local disable_when_matchmaking_ready = mapping_data.disable_when_matchmaking_ready
				local transition_not_allowed = (player_ready_for_game and disable_when_matchmaking_ready) or (is_game_matchmaking and disable_when_matchmaking)
				local new_view = views[mapping_data.view]
				local can_interact_flag = mapping_data.can_interact_flag
				local can_interact_func = mapping_data.can_interact_func

				if input_service.get(input_service, input) then
					local can_interact = true

					if can_interact_flag and not new_view[can_interact_flag] then
						can_interact = false
					end

					if can_interact and can_interact_func and not self[can_interact_func](self) then
						can_interact = false
					end

					if can_interact then
						if transition_not_allowed then
							local error_message = mapping_data.error_message

							if error_message then
								self.add_local_system_message(self, error_message)
							end

							break
						end

						if menu_active then
							self.transition_with_fade(self, mapping_data.in_transition_menu, mapping_data.transition_state, mapping_data.transition_sub_state)

							break
						end

						self.transition_with_fade(self, mapping_data.in_transition, mapping_data.transition_state, mapping_data.transition_sub_state)

						break
					end
				end
			end
		end
	end

	return 
end
IngameUI.event_dlc_status_changed = function (self)
	if self.current_view == "map_view" then
		self.handle_transition(self, "exit_menu")
	end

	self.setup_specific_view(self, "map_view", "ConsoleMapView")

	return 
end
IngameUI.update = function (self, dt, t, disable_ingame_ui, end_of_level_ui)
	Profiler.start("IngameUI")
	self._update_fade_transition(self)

	local views = self.views
	local is_in_inn = self.is_in_inn
	local input_service = self.input_manager:get_service("ingame_menu")
	local end_screen_active = self.end_screen_active(self)
	local ingame_hud = self.ingame_hud
	local transition_manager = Managers.transition
	local countdown_ui = self.countdown_ui
	local end_screen = self.end_screen

	self._update_system_message_cooldown(self, dt)
	self._handle_resolution_changes(self)

	if self.is_server then
		self.update_map_enable_state(self)
	end

	local respawning = self._respawning

	if respawning then
		self.update_respawning(self)
	end

	Profiler.start("popup_handler")

	if self.popup_id then
		local popup_result = Managers.popup:query_result(self.popup_id)

		if popup_result then
			self.handle_transition(self, popup_result)
		end
	end

	Profiler.stop("popup_handler")

	if self.survey_active then
		self._survey_update(self, dt)
	end

	local in_score_screen = end_of_level_ui ~= nil

	if DebugScreen.active then
		disable_ingame_ui = true
	end

	self._update_hud_visibility(self, disable_ingame_ui, in_score_screen)

	if is_in_inn then
		Profiler.start("Mission Voting")
		self.mission_voting_ui:update(self.menu_active, dt, t)
		Profiler.stop("Mission Voting")
	end

	if not disable_ingame_ui then
		if self.current_view then
			local current_view = self.current_view

			Profiler.start(current_view)
			views[current_view]:update(dt, t)
			Profiler.stop(current_view)
		end

		local gdc_build = Development.parameter("gdc")
		local ingame_player_list_ui = self.ingame_hud.ingame_player_list_ui
		local player_list_active = ingame_player_list_ui.is_active(ingame_player_list_ui)

		if not player_list_active and not self.pending_transition(self) and not end_screen_active and not self.menu_active and not self.leave_game and not self.return_to_title_screen and not gdc_build and not self.unavailable_hero_popup_active(self) and input_service.get(input_service, "toggle_menu", true) then
			self.handle_transition(self, "ingame_menu")
		end

		if not self.pending_transition(self) then
			Profiler.start("hotkeys")

			local local_player = Managers.player:local_player()
			local player_unit = local_player and local_player.player_unit

			if player_unit and Unit.alive(player_unit) then
				local enable_hotkeys = is_in_inn and not disable_ingame_ui and not in_score_screen

				self.handle_menu_hotkeys(self, dt, input_service, enable_hotkeys, self.menu_active)
			end

			Profiler.stop("hotkeys")
		end

		Profiler.start("Countdown UI")
		countdown_ui.update(countdown_ui, dt)
		Profiler.stop("Countdown UI")
		Profiler.start("matchmaking")

		local show_detailed_matchmaking_info = not self.menu_active and not player_list_active and self.current_view == nil

		self.matchmaking_ui:update(dt, t, show_detailed_matchmaking_info)
		Profiler.stop("matchmaking")

		if self.popup_join_lobby_handler then
			Profiler.start("popup_handler")
			self.popup_join_lobby_handler:update(dt)
			Profiler.stop("popup_handler")
		end

		Profiler.start("endscreen")
		end_screen.update(end_screen, dt)
		Profiler.stop("endscreen")

		if self.help_screen then
			Profiler.start("help_screen")
			self.help_screen:update(dt)
			Profiler.stop("help_screen")
		end

		if not end_of_level_ui and not end_screen_active then
			Profiler.start("cutscene_ui")
			self.cutscene_ui:update(dt)
			Profiler.stop("cutscene_ui")
			self._update_ingame_hud(self, self.hud_visible, dt, t)
		end
	end

	self._update_rcon_ui(self, dt, t, input_service)
	self._update_chat_ui(self, dt, t, input_service, end_of_level_ui)
	self._render_debug_ui(self, dt, t)
	self._update_fade_transition(self)
	Profiler.stop("IngameUI")

	return 
end
IngameUI.post_update = function (self, dt, t)
	self._post_handle_transition(self)

	local current_view = self.current_view

	if current_view then
		local views = self.views

		if views[current_view].post_update then
			views[current_view]:post_update(dt, t)
		end
	end

	local cutscene_system = self.cutscene_system
	local active_cutscene = (cutscene_system.active_camera or self.unavailable_hero_popup_active(self)) and not cutscene_system.ingame_hud_enabled

	self.ingame_hud:post_update(dt, t, self.hud_visible, active_cutscene)

	return 
end
IngameUI._update_hud_visibility = function (self, disable_ingame_ui, in_score_screen)
	local current_view = self.current_view
	local cutscene_system = self.cutscene_system
	local mission_vote_in_progress = self.mission_voting_ui:is_active()
	local is_enter_game = self.countdown_ui:is_enter_game()
	local end_screen_active = self.end_screen_active(self)
	local menu_active = self.menu_active
	local draw_hud = nil

	if not disable_ingame_ui and not menu_active and not current_view and not is_enter_game and not mission_vote_in_progress and not in_score_screen and not end_screen_active and not self.unavailable_hero_popup_active(self) then
		draw_hud = true
	else
		draw_hud = false
	end

	local hud_visible = self.hud_visible

	if draw_hud ~= hud_visible then
		self.hud_visible = draw_hud

		self.ingame_hud:set_visible(draw_hud)
	end

	return 
end
IngameUI._survey_update = function (self, dt)
	local telemetry_survey_view = self.views.telemetry_survey

	telemetry_survey_view.update(telemetry_survey_view, dt)

	if telemetry_survey_view.is_survey_answered(telemetry_survey_view) or telemetry_survey_view.is_survey_timed_out(telemetry_survey_view) then
		self.survey_active = false

		telemetry_survey_view.on_exit(telemetry_survey_view)
	end

	return 
end
IngameUI._handle_resolution_changes = function (self)
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h

	if res_x ~= self.last_resolution_x or res_y ~= self.last_resolution_y then
		InitVideo()

		self.last_resolution_y = res_y
		self.last_resolution_x = res_x
	end

	return 
end
IngameUI._update_ingame_hud = function (self, visible, dt, t)
	local cutscene_system = self.cutscene_system
	local active_cutscene = (cutscene_system.active_camera or self.unavailable_hero_popup_active(self)) and not cutscene_system.ingame_hud_enabled

	if visible then
		self.ingame_hud:update(dt, t, active_cutscene, self.ingame_ui_context)
	end

	if not active_cutscene then
		Profiler.start("Ingame Voting")
		self.ingame_voting_ui:update(self.menu_active, dt, t)
		Profiler.stop("Ingame Voting")
	end

	return 
end
IngameUI._update_chat_ui = function (self, dt, t, input_service, end_of_level_ui)
	local ingame_player_list_ui = self.ingame_hud.ingame_player_list_ui
	local player_list_focused = ingame_player_list_ui.is_focused(ingame_player_list_ui)
	local ingame_hud = self.ingame_hud
	local gift_popup_ui = ingame_hud.gift_popup_ui
	local gift_popup_active = gift_popup_ui.active(gift_popup_ui)
	local end_screen_active = self.end_screen_active(self)
	local mission_vote_active = self.mission_voting_ui:is_active()
	local cutscene_system = self.cutscene_system
	local unavailable_hero_popup_active = self.unavailable_hero_popup_active(self)
	local in_view = self.menu_active or (end_of_level_ui and end_of_level_ui.enable_chat(end_of_level_ui)) or self.current_view ~= nil
	local active_cutscene = (cutscene_system.active_camera or unavailable_hero_popup_active) and not cutscene_system.ingame_hud_enabled

	if self.current_view then
		local active_view = self.views[self.current_view]
		local view_input_service = active_view.input_service(active_view)

		Managers.chat:update(dt, t, in_view, view_input_service)
	elseif mission_vote_active then
		local mission_vote_input_service = self.mission_voting_ui:active_input_service()

		Managers.chat:update(dt, t, in_view, mission_vote_input_service)
	elseif end_of_level_ui then
		local end_of_level_input_service = end_of_level_ui.active_input_service(end_of_level_ui)

		Managers.chat:update(dt, t, in_view, end_of_level_input_service)
	elseif gift_popup_active then
		local gift_popup_input_service = gift_popup_ui.active_input_service(gift_popup_ui)

		Managers.chat:update(dt, t, in_view, gift_popup_input_service)
	elseif unavailable_hero_popup_active then
		local join_popup_input_service = self.popup_join_lobby_handler:input_service()

		Managers.chat:update(dt, t, in_view, join_popup_input_service)
	elseif player_list_focused then
		local ingame_player_list_input_service = ingame_player_list_ui.input_service(ingame_player_list_ui)

		Managers.chat:update(dt, t, in_view, ingame_player_list_input_service)
	elseif self.menu_active then
		Managers.chat:update(dt, t, in_view, input_service)
	elseif active_cutscene then
		local cutscene_input_service = self.cutscene_ui:input_service()

		Managers.chat:update(dt, t, in_view, cutscene_input_service)
	elseif end_screen_active then
		local end_screen_input_service = self.end_screen:input_service()

		Managers.chat:update(dt, t, in_view, end_screen_input_service)
	else
		local no_unblock = self.countdown_ui:is_enter_game()

		Managers.chat:update(dt, t, in_view, nil, no_unblock)
	end

	return 
end
IngameUI._update_rcon_ui = function (self, dt, t, input_service)
	Managers.rcon:update(dt, t)

	return 
end
IngameUI._render_debug_ui = function (self, dt, t)
	Profiler.start("debug_stuff")

	if self.menu_active and GameSettingsDevelopment.show_version_info and not Development.parameter("hide_version_info") then
		self._render_version_info(self)
	end

	if GameSettingsDevelopment.show_fps and not Development.parameter("hide_fps") then
		self._render_fps(self, dt)
	end

	Profiler.stop("debug_stuff")

	return 
end
IngameUI.show_info = function (self)
	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system.get_level_end_mission_data(mission_system, "grimoire_hidden_mission")
	local tome_mission_data = mission_system.get_level_end_mission_data(mission_system, "tome_bonus_mission")
	local w, h = Application.resolution()
	local pos = Vector3(100, h - 100, 999)
	pos = self._show_text(self, (grimoire_mission_data and grimoire_mission_data.current_amount) or "", pos)
	pos = self._show_text(self, (tome_mission_data and tome_mission_data.current_amount) or "", pos)

	return 
end
IngameUI._show_text = function (self, text, pos)
	Gui.text(self.ui_renderer.gui, text, "materials/fonts/gw_head_32", 20, "gw_head_20", pos, Color(0, 255, 0))

	return Vector3(pos[1], pos[2] - 30, pos[3])
end
IngameUI._update_system_message_cooldown = function (self, dt)
	local system_message_delay = self.system_message_delay

	if system_message_delay then
		system_message_delay = system_message_delay - dt
		self.system_message_delay = (0 < system_message_delay and system_message_delay) or nil
	end

	return 
end
IngameUI.add_local_system_message = function (self, message)
	if not self.system_message_delay or self.last_sent_system_message ~= message then
		local channel_id = 1
		local pop_chat = true
		local localized_message = Localize(message)

		if PLATFORM == "win32" then
			Managers.chat:add_local_system_message(channel_id, localized_message, pop_chat)
		else
			local local_player = Managers.player:local_player()
			local stats_id = local_player.stats_id(local_player)

			Managers.state.event:trigger("add_personal_interaction_warning", stats_id .. message, message)
		end

		self.last_sent_system_message = message
		self.system_message_delay = 1.5
	end

	return 
end
IngameUI.is_transition_allowed = function (self, transition)
	local error_message = nil
	local transition_allowed = true
	local player_ready_for_game = self.is_local_player_ready_for_game(self)

	if player_ready_for_game then
		if transition == "profile_view" then
			error_message = "matchmaking_ready_interaction_message_profile_view"
			transition_allowed = false
		elseif transition == "inventory_view_force" then
			error_message = "matchmaking_ready_interaction_message_inventory"
			transition_allowed = false
		end
	end

	if error_message then
		self.add_local_system_message(self, error_message)
	end

	return transition_allowed
end
IngameUI._post_handle_transition = function (self)
	local new_transition = self.new_transition

	if not new_transition then
		return 
	end

	local transition_params = self.transition_params
	local old_view = self.views[self.new_transition_old_view]

	if old_view and old_view.post_update_on_exit then
		printf("[IngameUI] menu view post_update_on_exit %s", old_view)
		old_view.post_update_on_exit(old_view, unpack(transition_params))
	end

	local new_view = self.views[self.current_view]

	if new_view and new_view.post_update_on_enter then
		printf("[IngameUI] menu view post_update_on_enter %s", new_view)
		new_view.post_update_on_enter(new_view, unpack(transition_params))
	end

	self.transition_params = nil
	self.new_transition_old_view = nil
	self.new_transition = nil

	return 
end
IngameUI.handle_transition = function (self, new_transition, ...)
	assert(transitions[new_transition])

	local blocked_transitions = self.blocked_transitions

	if blocked_transitions and blocked_transitions[new_transition] then
		return 
	end

	local previous_transition = self._previous_transition

	if not self.is_transition_allowed(self, new_transition) or (previous_transition and previous_transition == new_transition) then
		return 
	end

	local transition_params = {
		...
	}

	if self.new_transition_old_view then
		return 
	end

	local old_view = self.current_view

	transitions[new_transition](self, unpack(transition_params))

	local new_view = self.current_view

	if old_view ~= new_view then
		if self.views[old_view] and self.views[old_view].on_exit then
			printf("[IngameUI] menu view on_exit %s", old_view)
			self.views[old_view]:on_exit(unpack(transition_params))

			self.views[old_view].exit_to_game = nil
		end

		if new_view and self.views[new_view] and self.views[new_view].on_enter then
			printf("[IngameUI] menu view on_enter %s", new_view)
			self.views[new_view]:on_enter(unpack(transition_params))
		end

		self.new_transition = new_transition
		self.new_transition_old_view = old_view
		self.transition_params = transition_params
		self._previous_transition = new_transition
	end

	return 
end
IngameUI.transition_with_fade = function (self, new_transition, ...)
	local blocked_transitions = self.blocked_transitions

	if blocked_transitions and blocked_transitions[new_transition] then
		return 
	end

	local previous_transition = self._previous_transition

	if not self.is_transition_allowed(self, new_transition) or (previous_transition and previous_transition == new_transition) then
		return 
	end

	self._transition_fade_data = {
		new_transition = new_transition,
		transition_params = {
			...
		}
	}

	Managers.transition:fade_in(10)

	return 
end
IngameUI._update_fade_transition = function (self)
	local transition_fade_data = self._transition_fade_data

	if not transition_fade_data then
		return 
	end

	local transition_manager = Managers.transition

	if transition_manager.fade_in_completed(transition_manager) then
		local new_transition = transition_fade_data.new_transition
		local transition_params = transition_fade_data.transition_params

		self.handle_transition(self, new_transition, unpack(transition_params))

		self._transition_fade_data = nil

		Managers.transition:fade_out(10)
	end

	return 
end
IngameUI.pending_transition = function (self)
	return self._transition_fade_data ~= nil or self.new_transition_old_view ~= nil
end
IngameUI.get_transition = function (self)
	if self.leave_game then
		return "leave_game"
	elseif self.return_to_pc_menu then
		return "return_to_pc_menu"
	elseif self.return_to_title_screen then
		return "return_to_title_screen"
	elseif self.return_to_demo_title_screen then
		return "return_to_demo_title_screen"
	elseif self.restart_demo then
		return "restart_demo"
	elseif self.join_lobby then
		return "join_lobby", self.join_lobby
	elseif self.restart_game then
		return "restart_game"
	end

	return 
end
IngameUI.suspend_active_view = function (self)
	local current_view = self.current_view

	if current_view and current_view ~= "exit_menu" then
		local view = self.views[current_view]

		if view then
			self.handle_transition(self, "exit_menu")
		end
	end

	return 
end
IngameUI.activate_end_screen_ui = function (self, game_won, checkpoint_available, level_key, previous_completed_difficulty_index)
	self.end_screen:on_enter(game_won, checkpoint_available, level_key, previous_completed_difficulty_index)

	return 
end
IngameUI.deactivate_end_screen_ui = function (self)
	local end_screen = self.end_screen

	if end_screen.is_active then
		end_screen.on_exit(end_screen)
	end

	return 
end
IngameUI.end_screen_active = function (self)
	local end_screen = self.end_screen

	return end_screen and end_screen.is_active
end
IngameUI.end_screen_completed = function (self)
	local end_screen = self.end_screen

	return end_screen and end_screen.is_complete
end
IngameUI.end_screen_fade_in_complete = function (self)
	local end_screen = self.end_screen

	return end_screen and end_screen.fade_in_complete(end_screen)
end
IngameUI.update_map_enable_state = function (self)
	if self.is_in_inn then
		local map_view = self.views.map_view

		if map_view then
			local map_interaction_enabled = map_view.map_interaction_enabled
			local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

			if map_interaction_enabled and is_game_matchmaking then
				map_view.set_map_interaction_state(map_view, false)
			elseif not map_interaction_enabled and not is_game_matchmaking then
				map_view.set_map_interaction_state(map_view, true)
			end
		end
	end

	return 
end
IngameUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)

	return 
end
local debug_font = "gw_arial_16"
local debug_font_mtrl = "materials/fonts/" .. debug_font
local position = {}
local white_color = Colors.color_definitions.white
local black_color = Colors.color_definitions.black
local red_color = Colors.color_definitions.red
IngameUI._render_version_info = function (self)
	local ui_top_renderer = self.ui_top_renderer
	local res_width = 1920
	local res_height = 1080
	local text_size = 18
	local build = script_data.build_identifier or "???"
	local revision = script_data.settings.content_revision or "???"
	local build_hash = tostring(Application.make_hash(build, revision)):sub(1, 4):upper()

	if build == "???" and revision == "???" then
		build_hash = "???"
	end

	local is_local_backend = Managers.backend:is_local()
	local text = "GAME HASH: " .. build_hash .. " | Content revision: " .. revision .. " | Engine version: " .. build.sub(build, 1, 6) .. "..."

	if is_local_backend then
		text = "LOCAL BACKEND | " .. text
	end

	if rawget(_G, "Steam") then
		local appid = Steam.app_id()
		text = text .. " Appid: " .. appid
	end

	local width, height = UIRenderer.text_size(ui_top_renderer, text, debug_font_mtrl, text_size)
	local x = res_width - width - 8
	local y = height
	position[1] = x
	position[2] = y
	position[3] = 899

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), white_color)

	position[1] = x + 2
	position[2] = y - 2
	position[3] = 898

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), black_color)

	return 
end
IngameUI._render_fps = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local fps = self.fps
	self._fps_cooldown = self._fps_cooldown + dt

	if 1 < self._fps_cooldown then
		if dt < 1e-07 then
			fps = 0
		else
			fps = 1 / dt
		end

		self.fps = fps
		self._fps_cooldown = 0
	end

	local text = string.format("%i FPS", fps)
	local color = nil
	local red_cap = 30
	local platform = PLATFORM

	if platform == "ps4" or platform == "xb1" then
		red_cap = 28
	end

	if fps < red_cap then
		color = red_color
	else
		color = white_color
	end

	local res_width = RESOLUTION_LOOKUP.res_w
	local res_height = RESOLUTION_LOOKUP.res_h
	local text_size = 24
	local width, height = UIRenderer.text_size(ui_top_renderer, text, debug_font_mtrl, text_size)
	local x = res_width - width - 8
	local y = height + 16
	position[1] = x
	position[2] = y
	position[3] = 899

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), color)

	position[1] = x + 2
	position[2] = y - 2
	position[3] = 898

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), black_color)

	local cm = Managers.state.camera

	if cm then
		local player = Managers.player:local_player(1)
		local vp_name = player and player.viewport_name

		if vp_name then
			local pos = cm.camera_position(cm, vp_name)
			local rot = cm.camera_rotation(cm, vp_name)
			local text_size = 18
			local str = string.format("Position(%.2f, %.2f, %.2f) Rotation(%.4f, %.4f, %.4f, %.4f)", pos.x, pos.y, pos.z, Quaternion.to_elements(rot))

			UIRenderer.draw_text(ui_top_renderer, str, debug_font_mtrl, text_size, debug_font, Vector3(11, 11, 1), color)
			UIRenderer.draw_text(ui_top_renderer, str, debug_font_mtrl, text_size, debug_font, Vector3(10, 10, 0), black_color)
		end
	end

	local w, h = Application.resolution()
	local res_str = string.format("Resolution W:%i H:%i", w, h)

	UIRenderer.draw_text(ui_top_renderer, res_str, debug_font_mtrl, 18, debug_font, Vector3(11, 31, 1), color)
	UIRenderer.draw_text(ui_top_renderer, res_str, debug_font_mtrl, 18, debug_font, Vector3(10, 30, 0), black_color)

	if LobbyInternal.SESSION_NAME then
		UIRenderer.draw_text(ui_top_renderer, "My server name:", debug_font_mtrl, 20, debug_font, Vector3(20, 40, 999))
		UIRenderer.draw_text(ui_top_renderer, "My server name:", debug_font_mtrl, 20, debug_font, Vector3(22, 38, 998), black_color)
		UIRenderer.draw_text(ui_top_renderer, LobbyInternal.SESSION_NAME, debug_font_mtrl, 20, debug_font, Vector3(20, 20, 999))
		UIRenderer.draw_text(ui_top_renderer, LobbyInternal.SESSION_NAME, debug_font_mtrl, 20, debug_font, Vector3(22, 18, 998), black_color)
	end

	return 
end
IngameUI.show_unavailable_hero_popup = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)
	fassert(self.popup_join_lobby_handler == nil, "trying to show PopupJoinLobbyHandler when its already visible")

	local ingame_ui_context = self.ingame_ui_context
	local popup_join_lobby_handler = PopupJoinLobbyHandler:new(ingame_ui_context)

	popup_join_lobby_handler.show(popup_join_lobby_handler, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)

	self.popup_join_lobby_handler = popup_join_lobby_handler

	return popup_join_lobby_handler
end
IngameUI.hide_unavailable_hero_popup = function (self)
	local popup_join_lobby_handler = self.popup_join_lobby_handler

	fassert(popup_join_lobby_handler ~= nil, "trying to hide PopupJoinLobbyHandler when its not visible")
	popup_join_lobby_handler.hide(popup_join_lobby_handler)
	popup_join_lobby_handler.destroy(popup_join_lobby_handler)

	self.popup_join_lobby_handler = nil

	return 
end
IngameUI.unavailable_hero_popup_active = function (self)
	local popup_join_lobby_handler = self.popup_join_lobby_handler

	return popup_join_lobby_handler and popup_join_lobby_handler.visible
end
IngameUI.respawn = function (self)
	local player = Managers.player:player_from_peer_id(self.peer_id)
	local player_unit = player.player_unit

	if player_unit then
		local position = Unit.world_position(player_unit, 0)
		local rotation = Unit.world_rotation(player_unit, 0)

		player.set_spawn_position_rotation(player, position, rotation)

		self._despawning_player_unit = player.player_unit

		Managers.state.spawn:delayed_despawn(player)

		self._respawning = true
	end

	return 
end
IngameUI.update_respawning = function (self)
	if self._despawning_player_unit then
		if not Unit.alive(self._despawning_player_unit) then
			local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)

			self.profile_synchronizer:request_select_profile(profile_index, self.local_player_id)

			self._despawning_player_unit = nil

			if self.is_server then
				Managers.state.network.network_server:peer_despawned_player(self.peer_id)
			end
		end

		return 
	end

	local result, result_local_player_id = self.profile_synchronizer:profile_request_result()

	assert(not result or self.local_player_id == result_local_player_id, "Local player id mismatch between ui and request.")

	if result then
		self._respawning = nil

		self.profile_synchronizer:clear_profile_request_result()

		if self.is_server then
			Managers.state.network.network_server:peer_respawn_player(self.peer_id)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_client_respawn_player")
		end
	end

	return 
end

return 
