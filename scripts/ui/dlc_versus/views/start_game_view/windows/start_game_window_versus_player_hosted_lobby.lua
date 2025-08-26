-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_player_hosted_lobby.lua

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_player_hosted_lobby_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local ReservationHandlerTypes = require("scripts/managers/game_mode/mechanisms/reservation_handler_types")
local NUM_TEAMS = 2
local TEAMS_SIZE = 4
local TRANSPARENT_TEXTURE = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
local HAS_AVATARS = true

StartGameWindowVersusPlayerHostedLobby = class(StartGameWindowVersusPlayerHostedLobby)
StartGameWindowVersusPlayerHostedLobby.NAME = "StartGameWindowPlayerHostedLobby"

local INPUT_MODES = {
	"selection",
	"panel_focus",
	[3] = "custom_settings",
	custom_settings = 3,
	panel_focus = 2,
	selection = 1,
}
local NUM_COLUMNS = 3
local NUM_ROWS_BY_COLUMN = {
	4,
	2,
	4,
}
local PANEL_WIDGETS_BY_COLUMN = {
	[2] = {
		[1] = "mission_setting",
		[2] = "toggle_custom_settings_button",
	},
}
local COLUMN_TO_PARTY_ID_LOOKUP = {
	[1] = 1,
	[3] = 2,
}

StartGameWindowVersusPlayerHostedLobby.on_enter = function (self, params, offset)
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._matchmaking_manager = ingame_ui_context.matchmaking_manager
	self._is_server = ingame_ui_context.is_server
	self._peer_id = ingame_ui_context.peer_id
	self._is_loading = true

	local network_handler = Managers.mechanism:network_handler()

	self._match_handler = network_handler:get_match_handler()

	local options_view = ingame_ui_context.ingame_ui.views.options_view

	self._options_view = options_view
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}

	local game_mechanism = Managers.mechanism:game_mechanism()

	self._custom_settings_toggled = game_mechanism:is_hosting_versus_custom_game() and game_mechanism:custom_settings_enabled() or false
	self._game_mechanism = game_mechanism

	self:_create_ui_elements()

	self._enter_animation = self:_play_animation("on_enter")

	self._parent:set_hide_panel_title_butttons(true)
	self._parent:set_input_description("versus_player_hosted_lobby")

	self._input_focus_mode = INPUT_MODES.selection
	self._focus_panel_button_idx = 1

	Managers.state.event:register(self, "event_focus_versus_hosted_lobby_input", "focus_versus_hosted_lobby_input")
	Managers.state.event:register(self, "lobby_member_game_mode_custom_settings_handler_enabled", "_lobby_member_game_mode_custom_settings_handler_enabled")
end

StartGameWindowVersusPlayerHostedLobby._play_animation = function (self, name)
	local anim_params = {
		render_settings = self._render_settings,
	}
	local id = self._ui_animator:start_animation(name, self._widgets_by_name, scenegraph_definition, anim_params)

	return id
end

StartGameWindowVersusPlayerHostedLobby._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	UIUtils.create_widgets(widget_definitions, widgets, widgets_by_name)

	local host_widgets = {}
	local host_widget_definitions = definitions.host_widget_definitions

	UIUtils.create_widgets(host_widget_definitions, host_widgets, widgets_by_name)

	self._widgets = widgets
	self._host_widgets = host_widgets
	self._widgets_by_name = widgets_by_name

	local lobby = Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.matchmaking.lobby
	local custom_server_name = lobby and lobby:lobby_data("custom_server_name") or ""
	local valid_custom_server_name = rawget(_G, "Steam") and Steam.user_name() ~= custom_server_name and custom_server_name ~= "n/a" and custom_server_name ~= ""

	self._widgets_by_name.lobby_name.content.input.default_text = valid_custom_server_name and custom_server_name or Localize("start_game_window_custom_lobby_name_hint")

	local toggle_custom_settings_button = self._widgets_by_name.toggle_custom_settings_button

	toggle_custom_settings_button.content.button_hotspot.is_selected = self._custom_settings_toggled
	self._loading_spinner_widget = UIWidget.init(definitions.loading_spinner_definition)
	self._console_cursor = UIWidget.init(definitions.console_cursor_definition)

	self:_create_player_slots()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

StartGameWindowVersusPlayerHostedLobby.on_exit = function (self, params)
	self._ui_animator = nil

	self._parent:play_sound("Play_vs_hud_play_menu_leave_lobby")
	self:_remove_all_players()
	Managers.state.event:unregister("event_focus_versus_hosted_lobby_input", self)
	Managers.state.event:unregister("lobby_member_game_mode_custom_settings_handler_enabled", self)
end

StartGameWindowVersusPlayerHostedLobby._exit_layout = function (self)
	local is_match_host = self._match_handler:query_peer_data(self._peer_id, "is_match_owner")
	local return_layout_name = is_match_host and "versus_custom_game" or "versus_lobby_browser"
	local parent = self._parent

	parent:set_layout_by_name(return_layout_name)
	parent:set_hide_panel_title_butttons(false)
end

StartGameWindowVersusPlayerHostedLobby.on_exit = function (self, params)
	self._ui_animator = nil

	self._parent:play_sound("Play_vs_hud_play_menu_leave_lobby")
	self:_remove_all_players()

	params.return_layout_name = nil
end

StartGameWindowVersusPlayerHostedLobby.update = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not self._matchmaking_manager:is_game_matchmaking() then
		self:_exit_layout()

		return
	end

	if not self._is_loading then
		self:_update_options_view(dt, t)
		self:_update_mission_option()
		self:_update_animations(dt, t)
		self:_update_can_play()
		self:_update_play_button_texture(gamepad_active)

		if gamepad_active then
			self:_handle_gamepad_input(dt, t)
		else
			self:_handle_input(t)
		end

		self:_update_toggle_settings_button(dt, t, gamepad_active)
		self:_update_server_name()
		self:_update_avatars()
		self:_update_custom_lobby_slots()
	end

	self:_draw(dt)

	local match_owner = Managers.mechanism:network_handler():get_match_handler():get_match_owner()
	local has_slot_reservation_handler = Managers.mechanism:mechanism_try_call("get_all_reservation_handlers_by_owner", match_owner)

	self._is_loading = not has_slot_reservation_handler or not self._matchmaking_manager:is_in_versus_custom_game_lobby()
end

StartGameWindowVersusPlayerHostedLobby.post_update = function (self, t, dt)
	return
end

StartGameWindowVersusPlayerHostedLobby._update_avatars = function (self)
	for peer_id, slot_data in pairs(self._player_slots_by_peer_id) do
		if not slot_data.has_avatar then
			local avatar_result, texture_resource = Friends.get_avatar(peer_id)

			if avatar_result > 0 and texture_resource then
				local gui = self._ui_top_renderer.gui
				local material = Gui.clone_material_from_template(gui, peer_id, "template_store_diffuse")

				Material.set_resource(material, "diffuse_map", texture_resource)

				local widget = slot_data.panel_widget

				widget.content.player_avatar = material
				slot_data.has_avatar = true
			elseif avatar_result == 0 then
				slot_data.has_avatar = true
			end
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._can_play = function (self)
	local can_play, reason = true, "tutorial_no_text"
	local is_player_hosting = self._matchmaking_manager:is_player_hosting()

	if is_player_hosting then
		local match_handler = self._match_handler
		local match_owner = match_handler:get_match_owner()
		local is_match_owner = match_owner == Network.peer_id()
		local game_mechanism = Managers.mechanism:game_mechanism()
		local slot_reservation_handler = game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.pending_custom_game) or game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.session)
		local all_teams_have_members = slot_reservation_handler:all_teams_have_members()
		local network_server = Managers.state.network.network_server
		local all_players_joined = is_match_owner and network_server:are_all_peers_ingame(nil, true)

		if not all_teams_have_members and not Development.parameter("allow_versus_force_start_single_player") or not all_players_joined then
			can_play = false
			reason = "interaction_action_missing_players"
		end
	end

	return can_play, reason
end

StartGameWindowVersusPlayerHostedLobby._update_can_play = function (self)
	local can_play, reason = self:_can_play()
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.force_start_button.content.button_hotspot.disable_button = not can_play
	widgets_by_name.locked_reason.content.text = reason
end

StartGameWindowVersusPlayerHostedLobby._update_play_button_texture = function (self, gamepad_active)
	local widgets_by_name = self._widgets_by_name

	if self._gamepad_active ~= gamepad_active then
		self._gamepad_active = gamepad_active

		if gamepad_active then
			local input_service = self._parent:window_input_service()
			local input_action = "refresh"
			local button_texture_data = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)

			if button_texture_data then
				widgets_by_name.force_start_button.content.texture_icon_id = button_texture_data.texture
			end
		else
			widgets_by_name.force_start_button.content.texture_icon_id = "options_button_icon_quickplay"
		end

		widgets_by_name.force_start_button.content.is_selected = gamepad_active
	end
end

StartGameWindowVersusPlayerHostedLobby._update_animations = function (self, dt, t)
	self._ui_animator:update(dt)

	local force_start_button = self._widgets_by_name.force_start_button

	if not force_start_button.content.button_hotspot.disable_button then
		UIWidgetUtils.animate_play_button(force_start_button, dt)
	end

	UIWidgetUtils.animate_start_game_console_setting_button(self._widgets_by_name.mission_setting, dt)

	local widget = self._widgets_by_name.leave_game_button

	UIWidgetUtils.animate_default_button(widget, dt)
end

StartGameWindowVersusPlayerHostedLobby._draw = function (self, dt)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._is_loading then
		UIRenderer.draw_widget(ui_renderer, self._loading_spinner_widget)
	else
		UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
		UIRenderer.draw_all_widgets(ui_renderer, self._panel_widgets)

		local is_player_hosting = self._matchmaking_manager:is_player_hosting()

		if is_player_hosting then
			UIRenderer.draw_all_widgets(ui_renderer, self._host_widgets)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowVersusPlayerHostedLobby._handle_input = function (self, t)
	local input_service = self._parent:window_input_service()
	local matchmaking_manager = self._matchmaking_manager
	local widget = self._widgets_by_name.force_start_button
	local can_play = self:_can_play()

	if can_play and (UIUtils.is_button_pressed(widget) or input_service:get("force_start")) then
		matchmaking_manager:force_start_game()
		self._parent:play_sound("versus_hud_player_lobby_searching_for_match")
	end

	if UIUtils.is_button_hover_enter(widget) then
		self._parent:play_sound("Play_hud_hover")
	end

	widget = self._widgets_by_name.leave_game_button

	local can_leave_lobby = Managers.state.network.is_server

	widget.content.button_hotspot.disable_button = not can_leave_lobby

	if can_leave_lobby and (UIUtils.is_button_pressed(widget) or input_service:get("cancel_matchmaking")) then
		matchmaking_manager:cancel_matchmaking()
		matchmaking_manager:pause_matchmaking_for_seconds(2)
		self:_exit_layout()

		return
	end

	widget = self._widgets_by_name.mission_setting
	widget.style.bg_effect.color[1] = self._is_match_host and 255 or 0

	if self._is_match_host then
		widget.content.is_selected = UIUtils.is_button_hover(widget)

		if UIUtils.is_button_pressed(widget) then
			local parent = self._parent
			local mechanism_name = Managers.mechanism:current_mechanism_name()
			local custom_game_settings = parent:get_custom_game_settings(mechanism_name)

			parent:set_layout_by_name(custom_game_settings.layout_name)
		end
	end

	for _, panel_widget in pairs(self._panel_widgets) do
		local content = panel_widget.content

		if content.empty then
			if UIUtils.is_button_pressed(panel_widget) then
				local wanted_party_id = content.team_index
				local match_handler = self._match_handler
				local match_owner = match_handler:get_match_owner()
				local game_mechanism = Managers.mechanism:game_mechanism()
				local slot_reservation_handler = game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.pending_custom_game) or game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.session)

				slot_reservation_handler:request_party_change(wanted_party_id)
				self._parent:play_sound("versus_hud_player_lobby_switch_slot")
			end
		else
			if UIUtils.is_button_pressed(panel_widget, "profile_button_hotspot") then
				Managers.account:show_player_profile(content.peer_id)
			end

			if UIUtils.is_button_pressed(panel_widget, "kick_button_hotspot") then
				local friend_party = Managers.party:server_get_friend_party_from_peer(content.peer_id)

				self._matchmaking_manager:cancel_matchmaking_for_peer(friend_party.leader)
			end

			if UIUtils.is_button_pressed(panel_widget, "chat_button_hotspot") then
				local peer_id = content.peer_id
				local is_ignoring = Managers.chat:ignoring_peer_id(peer_id)

				if is_ignoring then
					Managers.chat:remove_ignore_peer_id(peer_id)
				else
					Managers.chat:ignore_peer_id(peer_id)
				end

				content.chat_button_hotspot.is_selected = is_ignoring
			end
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._update_toggle_settings_button = function (self, dt, t, gamepad_active)
	local custom_settings_toggle = self._widgets_by_name.toggle_custom_settings_button

	UIWidgetUtils.animate_default_checkbox_button_console(custom_settings_toggle, dt)

	custom_settings_toggle.content.button_hotspot.disable_button = not self._game_mechanism:is_hosting_versus_custom_game()

	if UIUtils.is_button_hover_enter(custom_settings_toggle) then
		self._parent:play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self._game_mechanism:is_hosting_versus_custom_game() then
		local changed_selection = self:_is_other_option_button_selected(custom_settings_toggle, self._custom_settings_toggled)

		if changed_selection ~= nil then
			self._custom_settings_toggled = changed_selection
			custom_settings_toggle.content.button_hotspot.is_selected = changed_selection

			Managers.state.event:trigger("event_focus_custom_game_settings_input", changed_selection)
			self:_enable_custom_game_settings(changed_selection)
		end
	else
		local active = self._game_mechanism:custom_settings_enabled()

		if self._custom_settings_toggled ~= active then
			custom_settings_toggle.content.button_hotspot.is_selected = active
			self._custom_settings_toggled = active
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._enable_custom_game_settings = function (self, enabled)
	local game_mechanism = Managers.mechanism:game_mechanism()
	local custom_game_settings_handler = game_mechanism:get_custom_game_settings_handler()

	custom_game_settings_handler:set_enabled(enabled, true)
	Managers.state.event:trigger("event_reset_host_settings", not enabled)
end

StartGameWindowVersusPlayerHostedLobby._create_player_slots = function (self)
	local panel_widgets = {}
	local player_slots_by_team = {}

	for team_index = 1, NUM_TEAMS do
		local player_slots = {}

		player_slots_by_team[team_index] = player_slots

		for player_index = 1, TEAMS_SIZE do
			local slot_data = {}

			player_slots[player_index] = slot_data

			local widget_definition = definitions.create_player_panel_widget(team_index, player_index)
			local widget = UIWidget.init(widget_definition)

			widget.content.empty = true
			widget.content.team_index = team_index
			widget.content.player_index = player_index
			slot_data.panel_widget = widget
			panel_widgets[#panel_widgets + 1] = widget
		end
	end

	self._num_players_by_team = {}
	self._player_slots_by_team = player_slots_by_team
	self._player_slots_by_peer_id = {}
	self._panel_widgets = panel_widgets
end

StartGameWindowVersusPlayerHostedLobby._find_first_available_slot = function (self, party_id, slot_id)
	assert(party_id)

	local slots = self._player_slots_by_team[party_id]
	local wanted_slot = slots[slot_id]

	if wanted_slot and wanted_slot.panel_widget.content.empty then
		return wanted_slot
	end

	for i = 1, TEAMS_SIZE do
		local player_slot = slots[i]
		local widget = player_slot.panel_widget

		if widget.content.empty then
			return player_slot
		end
	end

	fassert(false, "No available slots!")
end

StartGameWindowVersusPlayerHostedLobby._remove_all_players = function (self)
	for _, slot_data in pairs(self._player_slots_by_peer_id) do
		self:_remove_player(slot_data)
	end
end

StartGameWindowVersusPlayerHostedLobby._remove_player = function (self, slot_data)
	local widget = slot_data.panel_widget
	local peer_id = slot_data.peer_id

	widget.content.empty = true
	widget.content.show_profile_button = false
	widget.content.show_kick_button = false
	widget.content.show_chat_button = false
	widget.content.chat_button_hotspot.is_selected = false
	slot_data.slot_id = nil

	local material = widget.content.player_avatar

	if material then
		Material.set_texture(material, "diffuse_map", TRANSPARENT_TEXTURE)

		widget.content.player_avatar = nil
	end

	if HAS_AVATARS then
		Friends.delete_avatar(peer_id)
	end

	self._player_slots_by_peer_id[peer_id] = nil
end

StartGameWindowVersusPlayerHostedLobby._update_custom_lobby_slots = function (self)
	local has_changes = false
	local match_handler = self._match_handler
	local match_owner = match_handler:get_match_owner()
	local game_mechanism = Managers.mechanism:game_mechanism()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.pending_custom_game) or game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.session)
	local no_join_sound = false

	for peer_id, slot_data in pairs(self._player_slots_by_peer_id) do
		if match_handler:query_peer_data(peer_id, "is_synced") then
			local party_id, slot_id = slot_reservation_handler:get_peer_reserved_indices(peer_id)

			if party_id ~= slot_data.party_id or slot_id ~= slot_data.slot_id then
				self:_remove_all_players()

				no_join_sound = true
				has_changes = true

				break
			end
		else
			self._parent:play_sound("versus_hud_player_lobby_friend_leaves_lobby")
			self:_remove_player(slot_data)

			has_changes = true
		end
	end

	if not self._matchmaking_manager:is_in_versus_custom_game_lobby() then
		return
	end

	local match_host = match_handler:get_match_owner()
	local is_match_host = match_handler:query_peer_data(self._peer_id, "is_match_owner")
	local our_party_id = slot_reservation_handler:get_peer_reserved_indices(self._peer_id)
	local team_1_color, team_2_color = "local_player_team_lighter", "opponent_team_lighter"

	if our_party_id ~= 1 then
		team_1_color, team_2_color = team_2_color, team_1_color
	end

	self._is_match_host = is_match_host

	local leave_game_button = self._widgets_by_name.leave_game_button

	leave_game_button.content.title_text = is_match_host and Localize("vs_ui_cancel_hosting") or Localize("leave_game_menu_button_name")

	local peers = slot_reservation_handler:peers()

	for i = 1, #peers do
		local peer_id = peers[i]
		local slot_data = self._player_slots_by_peer_id[peer_id]

		if slot_data then
			-- Nothing
		elseif not match_handler:query_peer_data(peer_id, "is_synced") then
			-- Nothing
		else
			local party_id, slot_id = slot_reservation_handler:get_peer_reserved_indices(peer_id)

			if not party_id then
				-- Nothing
			else
				if not no_join_sound then
					self._parent:play_sound("versus_hud_player_lobby_friend_joins_lobby")
				end

				slot_data = self:_find_first_available_slot(party_id, slot_id)
				self._player_slots_by_peer_id[peer_id] = slot_data
				slot_data.peer_id = peer_id
				slot_data.party_id = party_id
				slot_data.slot_id = slot_data.panel_widget.content.player_index

				local widget = slot_data.panel_widget
				local is_peer_match_host = peer_id == match_host

				widget.content.show_host = is_peer_match_host
				widget.content.empty = false
				widget.content.peer_id = peer_id

				local player_name = match_handler:query_peer_data(peer_id, "player_name")

				if not player_name or player_name == "" then
					player_name = PlayerUtils.player_name(peer_id, nil)
				end

				widget.content.player_name = UIRenderer.crop_text(player_name, 18)
				slot_data.has_avatar = not HAS_AVATARS

				self:_apply_team_color(widget, party_id == 1 and team_1_color or team_2_color)

				if peer_id == self._peer_id then
					self:_apply_team_color(self._widgets_by_name.team_1, team_1_color)
					self:_apply_team_color(self._widgets_by_name.team_2, team_2_color)
				end

				widget.content.show_profile_button = true
				widget.content.show_chat_button = peer_id ~= self._peer_id
				widget.content.chat_button_hotspot.is_selected = Managers.chat:ignoring_peer_id(peer_id)

				local is_match_host_friend = is_match_host and match_handler:query_peer_data(peer_id, "leader_peer_id") == self._peer_id

				widget.content.show_kick_button = is_match_host and not is_peer_match_host and not is_match_host_friend

				local versus_level = match_handler:query_peer_data(peer_id, "versus_level")

				widget.content.player_level = string.format(Localize("versus_level"), versus_level)

				local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(versus_level)

				widget.content.insignia_main.uvs = insignia_main_uvs
				widget.content.insignia_addon.uvs = insignia_addon_uvs

				local friend_party_id = Managers.party:get_friend_party_id_from_peer(peer_id) or 1

				widget.style.party_color.color = Colors.get_categorical_color(friend_party_id - 1)
				has_changes = true
			end
		end
	end

	if has_changes then
		for team_index = 1, NUM_TEAMS do
			local player_count = 0

			for _, slot_data in pairs(self._player_slots_by_team[team_index]) do
				local widget = slot_data.panel_widget

				if not widget.content.empty then
					player_count = player_count + 1
				end
			end

			local team_widget = self._widgets_by_name["team_" .. team_index]

			if team_widget then
				local formatted_player_count = string.format("%s %d/%d", Localize("lb_players"), player_count, TEAMS_SIZE)

				team_widget.content.player_count = formatted_player_count
			end
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._apply_team_color = function (self, widget, team_color_name)
	local team_color = Colors.color_definitions[team_color_name]
	local styles = widget.style

	for _, style_name in pairs(widget.content.styles_with_team_color) do
		local style = styles[style_name]
		local dst_color = style.color or style.text_color

		if dst_color then
			Colors.copy_no_alpha_to(dst_color, team_color)
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._update_options_view = function (self, dt, t)
	if self._is_options_view_active then
		self._options_view:update(dt, t)
	end
end

StartGameWindowVersusPlayerHostedLobby._update_mission_option = function (self)
	local is_match_host = self._match_handler:query_peer_data(self._peer_id, "is_match_owner")
	local selected_level_id

	if is_match_host then
		selected_level_id = self._parent:get_selected_level_id()
	else
		local lobby = Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.matchmaking.lobby

		selected_level_id = lobby and lobby:lobby_data("selected_mission_id")
	end

	selected_level_id = selected_level_id or "any"

	if selected_level_id == self._selected_level_id then
		return
	end

	self._selected_level_id = selected_level_id

	local level_settings = selected_level_id and selected_level_id ~= "any" and LevelSettings[selected_level_id] or DummyAnyLevel
	local display_name = level_settings.display_name
	local icon_texture = level_settings.level_image
	local completed_difficulty_index = 0
	local mission_widget = self._widgets_by_name.mission_setting

	mission_widget.content.input_text = Localize(display_name)
	mission_widget.content.icon_texture = icon_texture
	mission_widget.content.icon_frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
end

StartGameWindowVersusPlayerHostedLobby._handle_gamepad_input = function (self, dt, t)
	if not self._player_slots_by_team then
		return
	end

	if not self._ui_animator:is_animation_completed(self._enter_animation) then
		return
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local game_mechanism = Managers.mechanism:game_mechanism()
	local match_handler = self._match_handler
	local match_owner = match_handler:get_match_owner()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.pending_custom_game) or game_mechanism:get_slot_reservation_handler(match_owner, ReservationHandlerTypes.session)
	local selected_row = self._selected_row or 1
	local selected_column = self._selected_column or 1
	local mission_selection_widget = self._widgets_by_name.mission_setting
	local mission_selection_content = mission_selection_widget.content
	local toggle_custom_settings_button = self._widgets_by_name.toggle_custom_settings_button
	local toggle_custom_settings_button_content = toggle_custom_settings_button.content

	if self._input_focus_mode == INPUT_MODES.selection then
		if selected_row > NUM_ROWS_BY_COLUMN[selected_column] then
			selected_row = 1
		end

		if input_service:get("move_up") then
			if selected_row - 1 >= 1 then
				selected_row = selected_row - 1
			else
				selected_row = NUM_ROWS_BY_COLUMN[selected_column]
			end
		elseif input_service:get("move_down") then
			if selected_row + 1 <= NUM_ROWS_BY_COLUMN[selected_column] then
				selected_row = selected_row + 1
			else
				selected_row = 1
			end
		end

		if input_service:get("move_right") then
			if selected_column + 1 <= NUM_COLUMNS then
				selected_column = selected_column + 1
			else
				selected_column = 1
			end
		elseif input_service:get("move_left") then
			if selected_column - 1 >= 1 then
				selected_column = selected_column - 1
			else
				selected_column = NUM_COLUMNS
			end
		end

		if self._selected_row ~= selected_row or self._selected_column ~= selected_column then
			self._selected_row = selected_row
			self._selected_column = selected_column
		end

		for i = 1, NUM_COLUMNS do
			local party_id = COLUMN_TO_PARTY_ID_LOOKUP[i]
			local num_rows = NUM_ROWS_BY_COLUMN[i]

			if party_id then
				local team_slots = self._player_slots_by_team[party_id]

				for j = 1, num_rows do
					local player_slot = team_slots[j]
					local widget = player_slot.panel_widget
					local content = widget.content
					local is_selected = selected_row == j and COLUMN_TO_PARTY_ID_LOOKUP[selected_column] == party_id

					content.is_selected = is_selected
				end
			else
				local num_rows = NUM_ROWS_BY_COLUMN[i]
				local widgets = PANEL_WIDGETS_BY_COLUMN[i]

				if widgets then
					for j = 1, num_rows do
						local widget_name = widgets[j]

						if widget_name then
							local widget = self._widgets_by_name[widget_name]
							local is_selected = selected_column == i and selected_row == j

							widget.content.is_selected = is_selected
							widget.content.button_hotspot.is_hover = is_selected
						end
					end
				end
			end

			local our_party_id = slot_reservation_handler:get_peer_reserved_indices(self._peer_id)

			if selected_column ~= our_party_id and COLUMN_TO_PARTY_ID_LOOKUP[selected_column] then
				parent:set_input_description("versus_player_hosted_lobby_change_team")
			elseif not COLUMN_TO_PARTY_ID_LOOKUP[selected_column] then
				parent:set_input_description("versus_player_hosted_lobby_select_mission")
			else
				parent:set_input_description("versus_player_hosted_lobby")
			end
		end

		if input_service:get("confirm") and COLUMN_TO_PARTY_ID_LOOKUP[self._selected_column] then
			selected_row = self._selected_row
			selected_column = self._selected_column

			local party_id = COLUMN_TO_PARTY_ID_LOOKUP[selected_column]
			local player_slot = self._player_slots_by_team[party_id][selected_row]
			local widget = player_slot.panel_widget
			local content = widget.content

			if content.empty then
				local wanted_party_id = content.team_index

				slot_reservation_handler:request_party_change(wanted_party_id)
				parent:play_sound("versus_hud_player_lobby_switch_slot")
			else
				self._input_focus_mode = INPUT_MODES.panel_focus

				parent:pause_input(true)
				self:_set_player_panel_focused(selected_column, selected_row, true)
				parent:set_input_description("versus_player_hosted_lobby_player_panel_focused")
			end
		elseif input_service:get("confirm") and mission_selection_content.is_selected then
			local mechanism_name = Managers.mechanism:current_mechanism_name()
			local custom_game_settings = parent:get_custom_game_settings(mechanism_name)

			parent:set_layout_by_name(custom_game_settings.layout_name)
		elseif toggle_custom_settings_button_content.is_selected and self._is_server and self._game_mechanism:is_hosting_versus_custom_game() and input_service:get("confirm") then
			local is_selected = not self._custom_settings_toggled

			toggle_custom_settings_button_content.button_hotspot.is_selected = is_selected

			self:_enable_custom_game_settings(is_selected)

			self._custom_settings_toggled = is_selected
		end

		if input_service:get("right_stick_press") and self._custom_settings_toggled then
			Managers.state.event:trigger("event_focus_custom_game_settings_input", true)

			self._input_focus_mode = INPUT_MODES.custom_settings
		end
	elseif self._input_focus_mode == INPUT_MODES.panel_focus then
		local selected_panel_button = self:_get_player_panel_widget(self._selected_column, self._selected_row)

		if selected_panel_button then
			local content = selected_panel_button.content

			if content.show_profile_button and input_service:get("toggle_menu") then
				Managers.account:show_player_profile(content.peer_id)
			end

			if content.show_kick_button and input_service:get("refresh_press") then
				local friend_party = Managers.party:server_get_friend_party_from_peer(content.peer_id)

				self._matchmaking_manager:cancel_matchmaking_for_peer(friend_party.leader)
			end

			if content.show_chat_button and input_service:get("special_1_press") then
				local peer_id = content.peer_id
				local is_ignoring = Managers.chat:ignoring_peer_id(peer_id)

				if is_ignoring then
					Managers.chat:remove_ignore_peer_id(peer_id)
				else
					Managers.chat:ignore_peer_id(peer_id)
				end

				content.chat_button_hotspot.is_selected = is_ignoring
			end
		end

		if input_service:get("back") then
			self._input_focus_mode = INPUT_MODES.selection

			parent:pause_input(false)
			self:_set_player_panel_focused(self._selected_column, self._selected_row, false)
			parent:set_input_description("versus_player_hosted_lobby")
		end
	end
end

StartGameWindowVersusPlayerHostedLobby._update_server_name = function (self)
	local widget = self._widgets_by_name.lobby_name
	local input = widget.content.input
	local lobby = Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.lobby:query_lobby("matchmaking_join_lobby") or Managers.matchmaking.lobby
	local is_match_host = self._match_handler:query_peer_data(self._peer_id, "is_match_owner")

	if not is_match_host then
		local custom_server_name = lobby and lobby:lobby_data("custom_server_name") or ""

		if custom_server_name == "n/a" then
			custom_server_name = Localize("lb_game_type_versus_custom_game")
		end

		input.text = custom_server_name
		input.default_text = ""

		return
	end

	if input.active then
		local input_service = self._parent:window_input_service()
		local escape_pressed = input_service:get("toggle_menu", true) or input_service:get("back", true)
		local enter_pressed = input_service:get("execute_chat_input", true)

		if escape_pressed or enter_pressed then
			local lobby_data = lobby:get_stored_lobby_data()

			input.text = cjson.decode(cjson.encode(input.text))

			if not string.find(input.text, "%S") then
				input.text = ""
			end

			lobby_data.custom_server_name = input.text

			lobby:set_lobby_data(lobby_data)

			input.active = false

			self._parent.parent:set_input_blocked(false)
		end
	elseif UIUtils.is_button_pressed(widget) then
		input.caret_index = 1 + UTF8Utils.string_length(input.text)
		input.active = true

		self._parent.parent:set_input_blocked(true)
	end
end

StartGameWindowVersusPlayerHostedLobby._set_player_panel_focused = function (self, column, row, focused)
	local party_id = COLUMN_TO_PARTY_ID_LOOKUP[column]

	if party_id then
		local player_slot = self._player_slots_by_team[party_id][row]
		local widget = player_slot.panel_widget
		local content = widget.content

		content.focused = focused
	end
end

StartGameWindowVersusPlayerHostedLobby._get_player_panel_widget = function (self, column, row)
	local party_id = COLUMN_TO_PARTY_ID_LOOKUP[column]

	if party_id then
		local player_slot = self._player_slots_by_team[party_id][row]
		local widget = player_slot.panel_widget

		return widget
	end

	return nil
end

StartGameWindowVersusPlayerHostedLobby.focus_versus_hosted_lobby_input = function (self)
	self._input_focus_mode = INPUT_MODES.selection

	self._parent:set_input_description("versus_player_hosted_lobby")

	local game_mechanism = Managers.mechanism:game_mechanism()
	local custom_game_settings_handler = game_mechanism:get_custom_game_settings_handler()
end

StartGameWindowVersusPlayerHostedLobby._is_other_option_button_selected = function (self, widget, current_options)
	if self._is_server and self._game_mechanism:is_hosting_versus_custom_game() and UIUtils.is_button_pressed(widget) then
		local is_selected = not current_options

		if is_selected then
			self._parent:play_sound("play_gui_lobby_button_03_private")
		else
			self._parent:play_sound("play_gui_lobby_button_03_public")
		end

		return is_selected
	end

	return nil
end

StartGameWindowVersusPlayerHostedLobby._lobby_member_game_mode_custom_settings_handler_enabled = function (self, enabled)
	if not self._is_server and not self._game_mechanism:is_hosting_versus_custom_game() then
		local custom_settings_toggle = self._widgets_by_name.toggle_custom_settings_button

		self._custom_settings_toggled = enabled
		custom_settings_toggle.content.button_hotspot.is_selected = enabled

		local gamepad_enabled = Managers.input and Managers.input:is_device_active("gamepad")

		if not gamepad_enabled then
			Managers.state.event:trigger("event_focus_custom_game_settings_input", enabled)
		end
	end
end
