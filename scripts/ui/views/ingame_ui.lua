require("scripts/ui/ui_layer")
require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_element")
require("scripts/ui/ui_widgets")
require("scripts/ui/ui_widgets_weaves")
require("scripts/ui/views/ingame_view")
require("scripts/ui/views/ingame_hud")
require("scripts/ui/views/popup_handler")
require("scripts/ui/views/popup_join_lobby_handler")
require("scripts/ui/views/end_screen_ui")
require("scripts/settings/ui_settings")
require("scripts/settings/ui_frame_settings")
require("scripts/ui/help_screen/help_screen_ui")
require("scripts/ui/views/credits_view")
require("scripts/ui/views/options_view")
require("scripts/ui/views/unlock_key_view")
require("scripts/ui/views/telemetry_survey_view")
require("scripts/ui/views/hero_view/hero_view")
require("scripts/ui/views/start_game_view/start_game_view")
require("scripts/ui/views/character_selection_view/character_selection_view")
require("scripts/ui/views/chat_view")
require("scripts/ui/views/start_menu_view/start_menu_view")
require("scripts/ui/views/console_friends_view")
require("scripts/ui/views/friends_ui_component")
require("scripts/ui/motd/motd_popup_ui")
require("scripts/ui/text_popup/text_popup_ui")
require("scripts/ui/weave_tutorial/weave_ui_onboarding_tutorial")
require("scripts/ui/dlc_upsell/upsell_popup_handler")
DLCUtils.map_list("ui_views", function (view)
	local file = view.file

	if file then
		dofile(file)
	end
end)

local rpcs = {}
local settings = require("scripts/ui/views/ingame_ui_settings")
local view_settings = settings.view_settings
local transitions = settings.transitions
IngameUI = class(IngameUI)

IngameUI.init = function (self, ingame_ui_context)
	printf("[IngameUI] init")

	self.unlock_manager = Managers.unlock
	self.world_manager = ingame_ui_context.world_manager
	self.camera_manager = ingame_ui_context.camera_manager
	self.is_in_inn = ingame_ui_context.is_in_inn
	local world = Managers.world:world("level_world")
	local top_world = Managers.world:world("top_ingame_view")
	local wwise_world = Managers.world:wwise_world(world)
	self.wwise_world = wwise_world
	self.world = world
	self.top_world = top_world
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local is_tutorial = game_mode_key == "tutorial"
	local is_in_inn = self.is_in_inn
	self.ui_renderer = self:create_ui_renderer(world, is_tutorial, is_in_inn)
	self.ui_top_renderer = self:create_ui_renderer(top_world, is_tutorial, is_in_inn)
	self.blocked_transitions = view_settings.blocked_transitions
	self.fps = 0
	self._fps_cooldown = 0

	UISetupFontHeights(self.ui_renderer.gui)

	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("ingame_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("ingame_menu", "keyboard")
	input_manager:map_device_to_service("ingame_menu", "mouse")
	input_manager:map_device_to_service("ingame_menu", "gamepad")

	ingame_ui_context.ui_renderer = self.ui_renderer
	ingame_ui_context.ui_top_renderer = self.ui_top_renderer
	ingame_ui_context.ingame_ui = self
	ingame_ui_context.wwise_world = wwise_world
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self._player = ingame_ui_context.player
	self.is_server = ingame_ui_context.is_server
	self.ingame_hud = IngameHud:new(self, ingame_ui_context)
	self.last_resolution_x, self.last_resolution_y = Application.resolution()

	InitVideo()
	self:setup_views(ingame_ui_context)

	self.end_screen = EndScreenUI:new(ingame_ui_context)
	self.weave_onboarding = WeaveUIOnboardingTutorial:new(ingame_ui_context)
	self.upsell_popup_handler = UpsellPopupHandler:new(ingame_ui_context)
	self.text_popup_ui = TextPopupUI:new(ingame_ui_context)
	self.motd_ui = MOTDPopupUI:new(ingame_ui_context)
	self.motd_loading = false

	if GameSettingsDevelopment.help_screen_enabled then
		self.help_screen = HelpScreenUI:new(ingame_ui_context)
	end

	local cutscene_system = Managers.state.entity:system("cutscene_system")
	self.cutscene_system = cutscene_system

	self:register_rpcs(ingame_ui_context.network_event_delegate)
	GarbageLeakDetector.register_object(self, "IngameUI")

	if not self.is_server and self.is_in_inn and self.views.map_view then
		self.views.map_view:set_map_interaction_state(false)
	end

	Managers.chat:set_profile_synchronizer(ingame_ui_context.profile_synchronizer)
	Managers.chat:set_wwise_world(wwise_world)
	Managers.chat:set_input_manager(input_manager)
	Managers.rcon:set_input_manager(input_manager)

	local network_handler = ingame_ui_context.network_server or ingame_ui_context.network_client
	self._profile_requester = network_handler:profile_requester()
	self.telemetry_time_view_enter = 0
	self.ingame_ui_context = ingame_ui_context
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "ui_event_transition_with_fade", "transition_with_fade")
		event_manager:register(self, "ui_event_transition", "handle_transition")
	end
end

IngameUI.create_ui_renderer = function (self, world, is_tutorial, is_in_inn)
	return view_settings.ui_renderer_function(world, is_tutorial, is_in_inn)
end

IngameUI.setup_views = function (self, ingame_ui_context)
	self.views = view_settings.views_function(ingame_ui_context)
	self.hotkey_mapping = view_settings.hotkey_mapping
end

IngameUI.setup_specific_view = function (self, key, class_name)
	printf("[IngameUI] setup_specific_view %s", class_name)

	local class = rawget(_G, class_name)

	if self.views[key] and self.views[key].destroy then
		self.views[key]:destroy()
		printf("[IngameUI] setup_specific_view destroy %s", class_name)
	end

	self.views[key] = class:new(self.ingame_ui_context)
end

IngameUI.is_local_player_ready_for_game = function (self)
	if self.is_in_inn then
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local player_unit = local_player and local_player.player_unit

		if player_unit then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			return status_ext:is_in_end_zone()
		end
	end
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

	network_event_delegate:register(self, unpack(rpcs))
end

IngameUI.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

IngameUI.is_in_view_state = function (self, state_name)
	if not self.current_view then
		return false
	end

	local view = self.views[self.current_view]
	local current_state = view.current_state and view:current_state()

	if not current_state then
		return false
	end

	return current_state.NAME == state_name
end

IngameUI.destroy = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("ui_event_transition_with_fade", self)
	end

	self:unregister_rpcs()
	Managers.chat:set_profile_synchronizer(nil)
	Managers.chat:set_wwise_world(nil)
	Managers.chat:set_input_manager(nil)
	Managers.rcon:set_input_manager(nil)

	local current_view = self.current_view
	local menu_active = self.menu_active

	if not menu_active and current_view then
	end

	if current_view then
		local params = {}

		self.views[current_view]:on_exit(params)

		self.current_view = nil
	end

	for k, view in pairs(self.views) do
		if view.destroy then
			view:destroy()
		end
	end

	self.end_screen:destroy()

	self.end_screen = nil

	self.ingame_hud:destroy()

	self.ingame_hud = nil

	if self.help_screen then
		self.help_screen:destroy()

		self.help_screen = nil
	end

	if self.popup_join_lobby_handler then
		self:hide_unavailable_hero_popup()
	end

	self.motd_ui:destroy()

	self.motd_ui = nil
	self.motd_backend = nil

	self.text_popup_ui:destroy()

	self.text_popup_ui = nil

	UIRenderer.destroy(self.ui_renderer, self.world)
	UIRenderer.destroy(self.ui_top_renderer, self.top_world)

	self.ui_renderer = nil
	self.ui_top_renderer = nil

	if self.popup_id then
		Managers.popup:cancel_popup(self.popup_id)
	end

	if self.weave_onboarding then
		self.weave_onboarding:destroy()

		self.weave_onboarding = nil
	end

	if self.upsell_popup_handler then
		self.upsell_popup_handler:destroy()

		self.upsell_popup_handler = nil
	end

	printf("[IngameUI] destroy")
end

IngameUI.weaves_requirements_fulfilled = function (self)
	if script_data.unlock_all_levels then
		return true
	end

	local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

	if twitch_connection then
		return false
	end

	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()

	for _, level_key in pairs(MainGameLevels) do
		local level_settings = LevelSettings[level_key]

		if level_settings.game_mode == "adventure" and statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key) < 1 then
			return false
		end
	end

	local scorpion_dlc_levels = GameActs.act_scorpion

	for _, level_key in pairs(scorpion_dlc_levels) do
		local level_settings = LevelSettings[level_key]

		if level_settings.game_mode == "adventure" and statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key) < 1 then
			return false
		end
	end

	return true
end

IngameUI.is_not_in_modded_realm = function (self)
	return not script_data["eac-untrusted"]
end

local hotkeys_blocked_during_vote = {
	"hotkey_map"
}

IngameUI.handle_menu_hotkeys = function (self, dt, input_service, hotkeys_enabled, menu_active)
	if not hotkeys_enabled then
		return
	end

	local views = self.views
	local current_view = self.current_view
	local hotkey_mapping = self.hotkey_mapping
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local has_player = local_player and local_player.player_unit ~= nil

	if not has_player then
		return
	end

	local player_ready_for_game = self:is_local_player_ready_for_game()
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()
	local voting_manager = Managers.state.voting
	local currently_voting = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

	for input, mapping_data in pairs(hotkey_mapping) do
		if current_view then
			local matching_view = current_view == mapping_data.view

			if matching_view then
				local active_view = views[current_view]
				local active_input_service = active_view:input_service()

				if not active_view:transitioning() and active_input_service:get(input) then
					local transition_params = self.transition_params
					local menu_state_name = transition_params and transition_params.menu_state_name
					local menu_sub_state_name = transition_params and transition_params.menu_sub_state_name
					local matching_state = menu_state_name == mapping_data.transition_state
					local matching_sub_state = menu_sub_state_name == mapping_data.transition_sub_state

					if matching_state and matching_sub_state then
						local hotkey_allowed = active_view.hotkey_allowed and active_view:hotkey_allowed(input, mapping_data)
						hotkey_allowed = hotkey_allowed ~= false

						if hotkey_allowed then
							local return_to_game = not menu_active

							views[current_view]:exit(return_to_game)

							break
						end
					end
				end
			end
		else
			local disable_when_matchmaking = mapping_data.disable_when_matchmaking
			local disable_when_matchmaking_ready = mapping_data.disable_when_matchmaking_ready
			local vote_blocked = table.contains(hotkeys_blocked_during_vote, input)
			local transition_not_allowed = (player_ready_for_game and disable_when_matchmaking_ready) or (is_game_matchmaking and disable_when_matchmaking) or (vote_blocked and currently_voting)
			local new_view = views[mapping_data.view]
			local can_interact_flag = mapping_data.can_interact_flag
			local can_interact_func = mapping_data.can_interact_func
			local required_dlc = mapping_data.required_dlc

			if input_service:get(input) then
				local can_interact = true

				if can_interact_flag and not new_view[can_interact_flag] then
					can_interact = false
				end

				if can_interact and can_interact_func and not self[can_interact_func](self) then
					can_interact = false
				end

				if can_interact and required_dlc and not Managers.unlock:is_dlc_unlocked(required_dlc) then
					can_interact = false
				end

				if can_interact then
					if transition_not_allowed then
						local error_message = mapping_data.error_message

						if error_message then
							self:add_local_system_message(error_message)
						end

						break
					end

					local transition = (menu_active and mapping_data.in_transition_menu) or mapping_data.in_transition
					local transition_params = {
						menu_state_name = mapping_data.transition_state,
						menu_sub_state_name = mapping_data.transition_sub_state
					}

					self:transition_with_fade(transition, transition_params)

					break
				end
			end
		end
	end
end

IngameUI.event_dlc_status_changed = function (self)
	if self.current_view == "map_view" then
		self:handle_transition("exit_menu")
	end

	self:setup_specific_view("map_view", "ConsoleMapView")
end

IngameUI.update_loading_subtitle_gui = function (self, loading_subtitle_gui, dt)
	loading_subtitle_gui:update(self.ui_top_renderer, dt)
end

IngameUI.update = function (self, dt, t, disable_ingame_ui, end_of_level_ui)
	self._disable_ingame_ui = disable_ingame_ui

	FatUI.begin_frame(self.ui_renderer.gui, self.wwise_world, dt)
	self:_update_fade_transition()

	local views = self.views
	local is_in_inn = self.is_in_inn
	local input_service = self.input_manager:get_service("ingame_menu")
	local end_screen_active = self:end_screen_active()
	local ingame_hud = self.ingame_hud
	local transition_manager = Managers.transition
	local end_screen = self.end_screen

	self:_update_system_message_cooldown(dt)
	self:_handle_resolution_changes()

	if self.is_server then
		self:update_map_enable_state()
	end

	if self._respawning then
		local done = self:_update_respawning()

		if done then
			self._respawning = nil
		end
	end

	if self.popup_id then
		local popup_result = Managers.popup:query_result(self.popup_id)

		if popup_result then
			self:handle_transition(popup_result)
		end
	end

	if self.survey_active then
		self:_survey_update(dt)
	end

	if self.quit_game_retry and self.delay_quit_game_retry <= t then
		self.quit_game_retry = nil

		self:handle_transition("end_game")
	end

	if is_in_inn then
		local is_not_in_menu = self.has_left_menu and self.hud_visible
		local has_holly_dlc = Managers.unlock:is_dlc_unlocked("holly")

		self.text_popup_ui:update(dt)

		if has_holly_dlc and is_not_in_menu and not self.text_popup_ui.is_visible and not PlayerData.viewed_dialogues.dlc_holly then
			local on_close_callback = callback(self, "_holly_dlc_intro_closed")

			self.text_popup_ui:show("area_selection_holly_name", "holly_lohner_spiel_short", on_close_callback)
		else
			self.motd_ui:update(dt)

			if not self.motd_backend and Managers.backend and Managers.backend:interfaces_ready() then
				self.motd_backend = Managers.backend:get_interface("motd")
			elseif self.motd_backend and is_not_in_menu and not self.motd_ui.is_visible and not self.motd_loading and #self.motd_backend:get_new_image_urls() > 0 then
				local url = self.motd_backend:get_new_image_urls()[1]
				local cb = callback(self, "_url_loaded", url)

				Managers.url_loader:load_resource(url, cb)

				self.motd_loading = true
			end
		end

		if self.weave_onboarding then
			self.weave_onboarding:update(dt, t)
		end

		if self.upsell_popup_handler then
			self.upsell_popup_handler:update(dt, t)
		end
	end

	if not disable_ingame_ui then
		local disable_toggle_menu = false

		if self.current_view then
			local current_view = self.current_view

			views[current_view]:update(dt, t)

			if views[current_view].disable_toggle_menu then
				disable_toggle_menu = views[current_view]:disable_toggle_menu()
			end
		end

		local gdc_build = Development.parameter("gdc")
		local ingame_player_list_ui = ingame_hud:component("IngamePlayerListUI") or ingame_hud:component("VersusTabUI")
		local player_list_active = ingame_player_list_ui and ingame_player_list_ui:is_active()
		local fade_active = Managers.transition:in_fade_active()

		if not player_list_active and not disable_toggle_menu and not self:pending_transition() and not fade_active and not end_screen_active and not self.menu_active and not self.leave_game and not self.return_to_title_screen and not gdc_build and not self:unavailable_hero_popup_active() and input_service:get("toggle_menu", true) then
			local use_gamepad_layout = PLATFORM == "ps4" or PLATFORM == "xb1" or Managers.input:is_device_active("gamepad") or UISettings.use_gamepad_menu_layout

			if use_gamepad_layout then
				local menu_state_name = "overview"

				if is_in_inn then
					local menu_sub_state_name = "equipment"
					local transition_params = {
						menu_state_name = menu_state_name,
						menu_sub_state_name = menu_sub_state_name
					}

					self:transition_with_fade("hero_view_force", transition_params)
				else
					local menu_sub_state_name = "system"
					local transition_params = {
						menu_state_name = menu_state_name,
						menu_sub_state_name = menu_sub_state_name
					}

					self:handle_transition("hero_view_force", transition_params)
				end
			else
				self:handle_transition("ingame_menu")
			end
		end

		if not self:pending_transition() then
			local local_player = Managers.player:local_player()
			local player_unit = local_player and local_player.player_unit

			if player_unit and Unit.alive(player_unit) then
				local in_score_screen = end_of_level_ui ~= nil
				local enable_hotkeys = is_in_inn and not disable_ingame_ui and not in_score_screen

				self:handle_menu_hotkeys(dt, input_service, enable_hotkeys, self.menu_active)
			end
		end

		if self.popup_join_lobby_handler then
			self.popup_join_lobby_handler:update(dt)
		end

		end_screen:update(dt)

		if self.help_screen then
			self.help_screen:update(dt)
		end
	end

	self.ingame_hud:update(dt, t)
	self:_update_rcon_ui(dt, t, input_service, end_of_level_ui)
	self:_update_chat_ui(dt, t, input_service, end_of_level_ui)
	self:_render_debug_ui(dt, t)
	self:_update_fade_transition()
	FatUI.close_frame()
end

IngameUI.disable_ingame_ui = function (self)
	return self._disable_ingame_ui
end

IngameUI._holly_dlc_intro_closed = function (self)
	PlayerData.viewed_dialogues.dlc_holly = true

	Managers.save:auto_save(SaveFileName, SaveData)
end

IngameUI.post_update = function (self, dt, t)
	self:_post_handle_transition()

	local current_view = self.current_view

	if current_view then
		local views = self.views

		if views[current_view].post_update then
			views[current_view]:post_update(dt, t)
		end
	end

	self.ingame_hud:post_update(dt, t)
	self.motd_ui:post_update(dt)
end

IngameUI._url_loaded = function (self, url, texture_resource)
	self.motd_loading = false

	if not self.hud_visible then
		return
	end

	self.motd_ui:show(texture_resource)

	if self.motd_ui.is_visible then
		self.motd_backend:mark_url_as_viewed(url)
	end
end

IngameUI.post_render = function (self)
	if self.motd_ui then
		self.motd_ui:post_render()
	end
end

IngameUI.cutscene_active = function (self)
	local cutscene_system = self.cutscene_system

	return cutscene_system.active_camera ~= nil
end

IngameUI._survey_update = function (self, dt)
	local telemetry_survey_view = self.views.telemetry_survey

	telemetry_survey_view:update(dt)

	if telemetry_survey_view:is_survey_answered() or telemetry_survey_view:is_survey_timed_out() then
		self.survey_active = false

		telemetry_survey_view:on_exit()
	end
end

IngameUI._handle_resolution_changes = function (self)
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h

	if res_x ~= self.last_resolution_x or res_y ~= self.last_resolution_y then
		InitVideo()

		self.last_resolution_y = res_y
		self.last_resolution_x = res_x
	end
end

IngameUI._update_chat_ui = function (self, dt, t, input_service, end_of_level_ui)
	local in_view, menu_input_service, no_unblock = self:_menu_blocking_information(input_service, end_of_level_ui)

	Managers.chat:update(dt, t, in_view, menu_input_service, no_unblock)
end

IngameUI._update_rcon_ui = function (self, dt, t, input_service, end_of_level_ui)
	local in_view, menu_input_service, no_unblock = self:_menu_blocking_information(input_service, end_of_level_ui)

	Managers.rcon:update(dt, t, in_view, menu_input_service, no_unblock)
end

IngameUI._menu_blocking_information = function (self, input_service, end_of_level_ui)
	local ingame_hud = self.ingame_hud
	local ingame_player_list_ui = ingame_hud:component("IngamePlayerListUI") or ingame_hud:component("VersusTabUI")
	local player_list_focused = ingame_player_list_ui and ingame_player_list_ui:is_focused()
	local gift_popup_ui = ingame_hud:component("GiftPopupUI")
	local gift_popup_active = gift_popup_ui and gift_popup_ui:active()
	local end_screen_active = self:end_screen_active()
	local mission_voting_ui = ingame_hud:component("MissionVotingUI")
	local mission_vote_active = mission_voting_ui and mission_voting_ui:is_active()
	local cutscene_system = self.cutscene_system
	local unavailable_hero_popup_active = self:unavailable_hero_popup_active()
	local in_view = self.menu_active or (end_of_level_ui and end_of_level_ui:enable_chat()) or (self.current_view ~= nil and not self.views[self.current_view].normal_chat)
	local active_cutscene = cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled

	if self.current_view then
		local active_view = self.views[self.current_view]
		local view_input_service = active_view:input_service()

		return in_view, view_input_service, false
	elseif mission_vote_active then
		local mission_vote_input_service = mission_voting_ui:active_input_service()

		return in_view, mission_vote_input_service, false
	elseif end_of_level_ui then
		local end_of_level_input_service = end_of_level_ui:active_input_service()

		return in_view, end_of_level_input_service, false
	elseif gift_popup_active then
		local gift_popup_input_service = gift_popup_ui:active_input_service()

		return in_view, gift_popup_input_service, false
	elseif unavailable_hero_popup_active then
		local join_popup_input_service = self.popup_join_lobby_handler:input_service()

		return in_view, join_popup_input_service, false
	elseif player_list_focused then
		local ingame_player_list_input_service = ingame_player_list_ui:input_service()

		return in_view, ingame_player_list_input_service, false
	elseif self.menu_active then
		return in_view, input_service, false
	elseif active_cutscene then
		local cutscene_ui = ingame_hud:component("CutsceneUI")
		local cutscene_input_service = cutscene_ui:input_service()

		return in_view, cutscene_input_service, false
	elseif end_screen_active then
		local end_screen_input_service = self.end_screen:input_service()

		return in_view, end_screen_input_service, false
	else
		return in_view, nil, false
	end
end

IngameUI._render_debug_ui = function (self, dt, t)
	if self.menu_active and GameSettingsDevelopment.show_version_info and not Development.parameter("hide_version_info") then
		self:_render_version_info()
	end

	if GameSettingsDevelopment.show_fps and not Development.parameter("hide_fps") then
		self:_render_fps(dt)
	end
end

IngameUI.show_info = function (self)
	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission")
	local tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission")
	local w, h = Application.resolution()
	local pos = Vector3(100, h - 100, 999)
	pos = self:_show_text((grimoire_mission_data and grimoire_mission_data.current_amount) or "", pos)
	pos = self:_show_text((tome_mission_data and tome_mission_data.current_amount) or "", pos)
end

IngameUI._show_text = function (self, text, pos)
	Gui.text(self.ui_renderer.gui, "text", "materials/fonts/gw_head", 20, "gw_head", pos, Color(0, 255, 0))

	return Vector3(pos[1], pos[2] - 30, pos[3])
end

IngameUI._update_system_message_cooldown = function (self, dt)
	local system_message_delay = self.system_message_delay

	if system_message_delay then
		system_message_delay = system_message_delay - dt
		self.system_message_delay = (system_message_delay > 0 and system_message_delay) or nil
	end
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
			local stats_id = local_player:stats_id()

			Managers.state.event:trigger("add_personal_interaction_warning", stats_id .. message, message)
		end

		self.last_sent_system_message = message
		self.system_message_delay = 1.5
	end
end

IngameUI.is_transition_allowed = function (self, transition)
	local error_message = nil
	local transition_allowed = true
	local player_ready_for_game = self:is_local_player_ready_for_game()

	if player_ready_for_game then
		if transition == "profile_view" then
			error_message = "matchmaking_ready_interaction_message_profile_view"
			transition_allowed = false
		elseif transition == "inventory_view_force" then
			error_message = "matchmaking_ready_interaction_message_inventory"
			transition_allowed = false
		end
	end

	if Managers.mechanism:current_mechanism_name() == "versus" and (transition == "hero_view" or transition == "hero_view_force") then
		error_message = "versus_transition_not_allowed"
		transition_allowed = false
	end

	if error_message then
		self:add_local_system_message(error_message)
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
		old_view:post_update_on_exit(transition_params)
	end

	local new_view = self.views[self.current_view]

	if new_view and new_view.post_update_on_enter then
		printf("[IngameUI] menu view post_update_on_enter %s", new_view)
		new_view:post_update_on_enter(transition_params)
	end

	if script_data.debug_enabled then
		self.last_transition_params = self.transition_params
		self.last_transition_name = self.new_transition
	end

	self.new_transition_old_view = nil
	self.new_transition = nil
end

IngameUI.handle_transition = function (self, new_transition, params)
	fassert(transitions[new_transition], "Missing transition to %s", new_transition)

	if script_data.disable_store and new_transition == "hero_view_force" and params and params.menu_state_name == "store" then
		Managers.chat:add_local_system_message(1, "Store is disabled.", true)

		return
	end

	local blocked_transitions = self.blocked_transitions

	if blocked_transitions and blocked_transitions[new_transition] then
		return
	end

	local previous_transition = self._previous_transition

	if not self:is_transition_allowed(new_transition) or (previous_transition and previous_transition == new_transition) then
		return
	end

	if self.new_transition_old_view then
		return
	end

	params = params or {}
	local old_view = self.current_view

	transitions[new_transition](self, params)

	local new_view = self.current_view

	if old_view ~= new_view then
		if self.views[old_view] and self.views[old_view].on_exit then
			printf("[IngameUI] menu view on_exit %s", old_view)
			self.views[old_view]:on_exit(params)

			self.views[old_view].exit_to_game = nil
		end

		if new_view and self.views[new_view] and self.views[new_view].on_enter then
			printf("[IngameUI] menu view on_enter %s", new_view)
			self.views[new_view]:on_enter(params)
		end

		self.new_transition = new_transition
		self.new_transition_old_view = old_view
		self.transition_params = params
		self._previous_transition = new_transition
	end
end

IngameUI.transition_with_fade = function (self, new_transition, params, fade_in_speed, fade_out_speed)
	local blocked_transitions = self.blocked_transitions

	if blocked_transitions and blocked_transitions[new_transition] then
		return
	end

	local previous_transition = self._previous_transition

	if not self:is_transition_allowed(new_transition) or (previous_transition and previous_transition == new_transition) then
		return
	end

	self._transition_fade_data = {
		new_transition = new_transition,
		transition_params = params,
		fade_out_speed = fade_out_speed
	}

	Managers.transition:fade_in(fade_in_speed or 10)
end

IngameUI._update_fade_transition = function (self)
	local transition_fade_data = self._transition_fade_data

	if not transition_fade_data then
		return
	end

	local transition_manager = Managers.transition

	if transition_manager:fade_in_completed() then
		local new_transition = transition_fade_data.new_transition
		local transition_params = transition_fade_data.transition_params

		self:handle_transition(new_transition, transition_params)

		local fade_out_speed = self._transition_fade_data.fade_out_speed
		self._transition_fade_data = nil

		Managers.transition:fade_out(fade_out_speed or 10)
	end
end

IngameUI.pending_transition = function (self)
	return self._transition_fade_data ~= nil or self.new_transition_old_view ~= nil
end

IngameUI.get_transition = function (self)
	if self.leave_game then
		if Managers.play_go:installed() then
			return "leave_game"
		else
			return "finish_tutorial"
		end
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
	elseif self.quit_game then
		return "quit_game"
	end
end

IngameUI.suspend_active_view = function (self)
	local current_view = self.current_view

	if current_view and current_view ~= "exit_menu" then
		local view = self.views[current_view]

		if view then
			self:handle_transition("exit_menu")
		end
	end
end

IngameUI.activate_end_screen_ui = function (self, screen_name, screen_config)
	self.end_screen:on_enter(screen_name, screen_config)
end

IngameUI.deactivate_end_screen_ui = function (self)
	local end_screen = self.end_screen

	if end_screen.is_active then
		end_screen:on_exit()
	end
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

	return end_screen and end_screen:fade_in_complete()
end

IngameUI.update_map_enable_state = function (self)
	if self.is_in_inn then
		local map_view = self.views.map_view

		if map_view then
			local map_interaction_enabled = map_view.map_interaction_enabled
			local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

			if map_interaction_enabled and is_game_matchmaking then
				map_view:set_map_interaction_state(false)
			elseif not map_interaction_enabled and not is_game_matchmaking then
				map_view:set_map_interaction_state(true)
			end
		end
	end
end

IngameUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

local debug_font = "arial"
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
	local text = "GAME HASH: " .. build_hash .. " | Content revision: " .. revision .. " | Engine version: " .. build:sub(1, 6) .. "..."

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
end

IngameUI._render_fps = function (self, dt)
	self._fpses = self._fpses or {}
	local ui_top_renderer = self.ui_top_renderer
	self._fpses[#self._fpses + 1] = dt
	self._fps_cooldown = self._fps_cooldown + dt

	if self._fps_cooldown > 1 then
		local fpses = self._fpses
		local num_dts = #self._fpses
		local total_dt = 0

		for idx, _dt in pairs(self._fpses) do
			total_dt = total_dt + _dt
		end

		self.fps = math.floor(1 / (total_dt / num_dts) + 0.5)

		table.clear(self._fpses)

		self._fps_cooldown = self._fps_cooldown - 1
	end

	local fps = self.fps
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
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local width, height = UIRenderer.text_size(ui_top_renderer, text, debug_font_mtrl, text_size * RESOLUTION_LOOKUP.scale)
	local x = (res_width - width - 8) * inv_scale
	local y = (height + 16) * inv_scale
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
			local pos = cm:camera_position(vp_name)
			local rot = cm:camera_rotation(vp_name)
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
end

IngameUI.show_unavailable_hero_popup = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)
	fassert(self.popup_join_lobby_handler == nil, "trying to show PopupJoinLobbyHandler when its already visible")

	local ingame_ui_context = self.ingame_ui_context
	local popup_join_lobby_handler = PopupJoinLobbyHandler:new(ingame_ui_context)

	popup_join_lobby_handler:show(current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)

	self.popup_join_lobby_handler = popup_join_lobby_handler

	return popup_join_lobby_handler
end

IngameUI.hide_unavailable_hero_popup = function (self)
	local popup_join_lobby_handler = self.popup_join_lobby_handler

	fassert(popup_join_lobby_handler ~= nil, "trying to hide PopupJoinLobbyHandler when its not visible")
	popup_join_lobby_handler:hide()
	popup_join_lobby_handler:delete()

	self.popup_join_lobby_handler = nil
end

IngameUI.unavailable_hero_popup_active = function (self)
	local popup_join_lobby_handler = self.popup_join_lobby_handler

	return popup_join_lobby_handler ~= nil
end

IngameUI.respawn = function (self)
	local peer_id = self.peer_id
	local local_player_id = self.local_player_id
	local profile_index, career_index = self.profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local profile_name, career_name = hero_and_career_name_from_index(profile_index, career_index)
	local force_respawn = true

	self._profile_requester:request_profile(peer_id, local_player_id, profile_name, career_name, force_respawn)

	self._respawning = true
end

IngameUI._update_respawning = function (self)
	local result = self._profile_requester:result()

	if result ~= nil then
		return true
	end

	return false
end

IngameUI._cancel_popup = function (self)
	if self.popup_id then
		Managers.popup:cancel_popup(self.popup_id)
	end
end

IngameUI.get_hud_component = function (self, hud_component_name)
	return self.ingame_hud:get_hud_component(hud_component_name)
end

return
