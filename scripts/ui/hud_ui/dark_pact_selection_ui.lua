-- chunkname: @scripts/ui/hud_ui/dark_pact_selection_ui.lua

require("scripts/ui/views/versus_menu/ui_widgets_vs")
require("scripts/ui/hud_ui/base_component")

local definitions = local_require("scripts/ui/hud_ui/dark_pact_selection_ui_definitions")
local ordered_pactsworn_slots = definitions.ordered_pactsworn_slots
local create_selection_widget = definitions.create_selection_widget
local scenegraph_definition = definitions.scenegraph_definition
local PROTRAIT_WIDTH = 121.00000000000001
local PORTRAIT_HEIGHT = 143

DarkPactSelectionUI = class(DarkPactSelectionUI, BaseComponent)
DarkPactSelectionUI._input_service_name = "dark_pact_selection"
DarkPactSelectionUI._input_methods = {
	"keyboard",
	"mouse",
	"gamepad",
}
DarkPactSelectionUIKeymaps = {
	win32 = {
		switch_dark_pact_profile = {
			"keyboard",
			"h",
			"pressed",
		},
		cursor = {
			"mouse",
			"cursor",
			"axis",
		},
		left_release = {
			"mouse",
			"left",
			"released",
		},
		left_hold = {
			"mouse",
			"left",
			"held",
		},
		left_press = {
			"mouse",
			"left",
			"pressed",
		},
		right_press = {
			"mouse",
			"right",
			"pressed",
		},
		next_observer_target = {
			"mouse",
			"left",
			"pressed",
		},
		previous_observer_target = {
			"mouse",
			"right",
			"pressed",
		},
		enable_camera_movement = {
			"keyboard",
			"left alt",
			"pressed",
		},
		camera_movement_held = {
			"keyboard",
			"left alt",
			"held",
		},
	},
	xb1 = {
		confirm = {
			"gamepad",
			"a",
			"released",
		},
		move_left = {
			"gamepad",
			"d_left",
			"pressed",
		},
		move_right = {
			"gamepad",
			"d_right",
			"pressed",
		},
		move_left_hold = {
			"gamepad",
			"d_left",
			"held",
		},
		move_right_hold = {
			"gamepad",
			"d_right",
			"held",
		},
		analog_input = {
			"gamepad",
			"left",
			"axis",
		},
		next_observer_target = {
			"gamepad",
			"right_shoulder",
			"pressed",
		},
		previous_observer_target = {
			"gamepad",
			"left_shoulder",
			"pressed",
		},
	},
}

local darkpact_role_lookup = {
	all = "A Pactsworn",
	area_damage = "Area Damage",
	disabler = "Disabler",
}

DarkPactSelectionUI.init = function (self, ingame_hud, ingame_ui_context)
	DarkPactSelectionUI.super.init(self, ingame_hud, ingame_ui_context, definitions)

	self._player = ingame_ui_context.player
	self._peer_id = ingame_ui_context.peer_id
	self._local_player_id = ingame_ui_context.local_player_id

	local network = ingame_ui_context.network_server or ingame_ui_context.network_client

	self._profile_requester = network:profile_requester()
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._game_mode = Managers.state.game_mode:game_mode()
	self._party = Managers.party:get_local_player_party()
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	self._current_anim_id = 0
	self._selected_index = 1
	self._input_captured = false
	self._pending_profile = false

	self:_hide(100)

	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:create_input_service(input_service_name, "DarkPactSelectionUIKeymaps")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "mouse")
	input_manager:map_device_to_service(input_service_name, "gamepad")
	Managers.state.event:register(self, "add_respawn_counter_event", "event_add_respawn_counter_event")
	Managers.state.event:register(self, "set_new_enemy_role", "event_set_new_enemy_role")
	Managers.state.event:register(self, "versus_received_selectable_careers_response", "event_versus_received_selectable_careers_response")
end

DarkPactSelectionUI.event_add_respawn_counter_event = function (self, player, is_local_player, spawn_timer, show_selection_ui)
	if self._player == player then
		if show_selection_ui then
			self:_show()
		else
			self:_hide()
		end
	end
end

DarkPactSelectionUI.destroy = function (self)
	Managers.state.event:unregister("add_respawn_counter_event", self)
	Managers.state.event:unregister("set_new_enemy_role", self)
	Managers.state.event:unregister("versus_received_selectable_careers_response", self)
	self:_release_input()
	DarkPactSelectionUI.super.destroy(self)
end

DarkPactSelectionUI._capture_input = function (self)
	if self._input_captured then
		return
	end

	self._input_manager:capture_input(self._input_methods, 1, self._input_service_name, "DarkPactSelectionUI")
	ShowCursorStack.push()

	self._input_captured = true
end

DarkPactSelectionUI._release_input = function (self)
	if not self._input_captured then
		return
	end

	self._input_manager:release_input(self._input_methods, 1, self._input_service_name, "DarkPactSelectionUI")
	self._input_manager:device_unblock_service("keyboard", 1, self._input_service_name)

	local input_service = self:input_service()

	if input_service then
		input_service:set_input_blocked("next_observer_target", false, "DarkPactSelectionUI")
		input_service:set_input_blocked("previous_observer_target", false, "DarkPactSelectionUI")
	end

	ShowCursorStack.pop()

	self._input_captured = false
end

DarkPactSelectionUI._update_occupied_by_role = function (self, enemy_role)
	if not self._game_mode.get_num_occupied_profile_enemy_role then
		return
	end

	local cur = self._game_mode:get_num_occupied_profile_enemy_role(self._profile_synchronizer, self._party, enemy_role)
	local max = GameModeSettings.versus.dark_pact_profile_rules[enemy_role]
	local chrome_widget = self._widgets_by_name.chrome
	local content = chrome_widget.content
	local str, col

	if cur < max then
		str, col = "vs_ui_dark_pact_selection_available", content.color_available
	else
		str, col = "vs_ui_dark_pact_selection_full", content.color_disabled
	end

	local widget_id = enemy_role .. "_text"

	content[widget_id] = string.format("%i/%i %s", cur, max, Localize(str))
	chrome_widget.style[widget_id].text_color = col
end

DarkPactSelectionUI._play_anim = function (self, anim_name, speed)
	self._ui_animator:stop_animation(self._current_anim_id)

	self._current_anim_id = self._ui_animator:start_animation(anim_name, self._widgets_by_name, self._definitions.scenegraph_definition, self, speed)
end

DarkPactSelectionUI._set_button = function (self, widget, value)
	widget.style.profile_texture.saturated = not value
	widget.content.hotspot.disabled = not value
end

DarkPactSelectionUI._can_switch_profile = function (self)
	local peer_id, local_player_id = self._peer_id, self._local_player_id
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status then
		local player = self._player
		local player_unit = player and player.player_unit
		local ghost_mode_extension = ScriptUnit.has_extension(player_unit, "ghost_mode_system")

		if ghost_mode_extension then
			local is_in_ghost_mode, has_left_once = ghost_mode_extension:is_in_ghost_mode()

			return is_in_ghost_mode and not has_left_once
		else
			return true
		end
	end

	return false
end

DarkPactSelectionUI._show = function (self, play_speed)
	if self._is_visible == true then
		return
	end

	self._show_play_speed = play_speed

	self:_request_careers()
end

DarkPactSelectionUI._hide = function (self, play_speed)
	if self._is_visible == false then
		return
	end

	self:_play_anim("on_exit", play_speed)

	self._is_visible = false

	local input_service = self:input_service()

	if input_service then
		input_service:set_input_blocked("next_observer_target", false, "DarkPactSelectionUI")
		input_service:set_input_blocked("previous_observer_target", false, "DarkPactSelectionUI")
	end
end

DarkPactSelectionUI.update = function (self, dt, t, player)
	if self._requesting_careers then
		return
	end

	self._ui_animator:update(dt)

	local profile_requester = self._profile_requester

	if self._pending_profile then
		local result = profile_requester:result()

		if result == "success" then
			self._ingame_ui:play_sound("menu_versus_pactsworn_confirmed")
			self:_hide()

			self._pending_profile = nil
		elseif result == "failure" then
			local selector_widgets = self._selector_widgets

			for i = 1, #selector_widgets do
				local widget = selector_widgets[i]

				if widget.content.profile_name == self._pending_profile then
					self:_set_button(selector_widgets[i], false)

					break
				end
			end

			self._pending_profile = nil
		end

		return
	end

	local input_service = self:input_service()

	if self._is_visible then
		if input_service:get("enable_camera_movement") then
			self._camera_movement_enabled = true

			self:_release_input()
		elseif self._camera_movement_enabled and not input_service:get("camera_movement_held") then
			self._camera_movement_enabled = false

			self:_capture_input()
		end
	end

	if not self._input_captured then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._gamepad_active ~= gamepad_active then
		if gamepad_active then
			self:_set_selected(self._selected_index, true)
		else
			self:_set_selected(self._selected_index, false)
		end

		self._gamepad_active = gamepad_active
	end

	if gamepad_active then
		self:_handle_gamepad_input(dt, t, input_service, profile_requester)
	else
		self:_handle_mouse_input(dt, t, input_service, profile_requester)
	end
end

DarkPactSelectionUI._handle_mouse_input = function (self, dt, t, input_service, profile_requester)
	local any_hotspot_hovered = false
	local peer_id, local_player_id = self._peer_id, self._local_player_id
	local selector_widgets = self._selector_widgets

	for i = 1, #selector_widgets do
		local widget = selector_widgets[i]
		local content = widget.content
		local hotspot = content.hotspot
		local profile_name = content.profile_name

		any_hotspot_hovered = any_hotspot_hovered or hotspot.is_hover

		if hotspot.on_release or input_service:get(content.input_key) then
			self._ingame_ui:play_sound("menu_versus_pactsworn_select")

			hotspot.on_release = false

			profile_requester:request_profile(peer_id, local_player_id, profile_name, profile_name, true)

			self._pending_profile = profile_name

			break
		elseif hotspot.on_hover_enter then
			self._ingame_ui:play_sound("menu_versus_pactsworn_hover")

			local display_name = CareerSettings[profile_name].display_name

			self:_set_enemy_pick_text(display_name)
			self:_set_enemy_pick_info_text(profile_name)
		end
	end

	input_service:set_input_blocked("next_observer_target", any_hotspot_hovered, "DarkPactSelectionUI")
	input_service:set_input_blocked("previous_observer_target", any_hotspot_hovered, "DarkPactSelectionUI")
end

DarkPactSelectionUI._handle_gamepad_input = function (self, dt, t, input_service, profile_requester)
	local selected_index = self._selected_index

	if input_service:get("move_right") then
		self:_set_selected(selected_index, false)

		selected_index = selected_index + 1 <= #self._selector_widgets and selected_index + 1 or 1

		self._ingame_ui:play_sound("menu_versus_pactsworn_hover")
		self:_set_selected(selected_index, true)
	elseif input_service:get("move_left") then
		self:_set_selected(selected_index, false)

		selected_index = selected_index - 1 >= 1 and selected_index - 1 or #self._selector_widgets

		self._ingame_ui:play_sound("menu_versus_pactsworn_hover")
		self:_set_selected(selected_index, true)
	end

	self._selected_index = selected_index

	if input_service:get("confirm") then
		self:_confirm_choice(selected_index, profile_requester)
	end
end

DarkPactSelectionUI._set_selected = function (self, index, value)
	local widget = self._selector_widgets[index]
	local content = widget.content

	content.selected = value

	local profile_name = content.profile_name
	local display_name = CareerSettings[profile_name].display_name

	self:_set_enemy_pick_text(display_name)
	self:_set_enemy_pick_info_text(profile_name)
end

DarkPactSelectionUI._confirm_choice = function (self, selcetd_index, profile_requester)
	local peer_id, local_player_id = self._peer_id, self._local_player_id
	local widget = self._selector_widgets[selcetd_index]
	local content = widget.content

	content.selected = false

	local profile_name = content.profile_name

	self._ingame_ui:play_sound("menu_versus_pactsworn_select")
	profile_requester:request_profile(peer_id, local_player_id, profile_name, profile_name, true)

	self._pending_profile = profile_name
end

DarkPactSelectionUI.post_update = function (self, dt, t, player)
	self:_draw(dt, self:input_service())
end

DarkPactSelectionUI._draw = function (self, dt, input_service)
	self.super._draw(self, dt, input_service)
	UIRenderer.begin_pass(self._ui_renderer, self._ui_scenegraph, input_service, dt, nil, {})

	if self._selector_widgets and self._is_visible then
		UIRenderer.draw_all_widgets(self._ui_renderer, self._selector_widgets)
	end

	UIRenderer.end_pass(self._ui_renderer)
end

DarkPactSelectionUI.event_set_new_enemy_role = function (self)
	return
end

DarkPactSelectionUI._set_enemy_role_text = function (self, enemy_role)
	local widget = self._widgets_by_name.chrome

	widget.content.category_text = string.format("CHOOSE FROM %s", Utf8.upper(darkpact_role_lookup[enemy_role]))
end

DarkPactSelectionUI._set_enemy_pick_text = function (self, current_pick)
	local widget = self._widgets_by_name.chrome

	widget.content.pick_text = Utf8.upper(Localize(current_pick))
end

DarkPactSelectionUI._set_enemy_pick_info_text = function (self, current_pick)
	local widget = self._widgets_by_name.info_text
	local info_text_key = CareerSettings[current_pick].description

	widget.content.text = Localize(info_text_key)
end

DarkPactSelectionUI._create_ui_elements = function (self)
	self.super._create_ui_elements(self)

	self._selector_widgets = {}
end

DarkPactSelectionUI._request_careers = function (self)
	self._requesting_careers = true

	local game_mode = Managers.state.game_mode:game_mode()

	game_mode:request_selectable_dark_pact_careers()
end

DarkPactSelectionUI.event_versus_received_selectable_careers_response = function (self, enemy_role, careers)
	self._requesting_careers = false

	self:_create_selection_widgets(enemy_role, careers)
	self:_play_anim("on_enter", self._show_play_speed)

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self:_set_selected(1, true)
	end

	local selected_career_name = self:_get_current_selected_career_name()

	self:_set_enemy_pick_text(selected_career_name)

	self._is_visible = true
end

DarkPactSelectionUI._create_selection_widgets = function (self, enemy_role, careers)
	local half_picks = math.floor(#careers / 2)
	local offset_x = PROTRAIT_WIDTH + 10
	local even_offset = -(half_picks * offset_x)
	local odd_offset = -(half_picks * offset_x) - PROTRAIT_WIDTH / 2
	local offset = #careers % 2 == 0 and even_offset or odd_offset

	self._ui_scenegraph.selection_pivot.position[1] = offset

	UISceneGraph.update_scenegraph(self._ui_scenegraph)

	local selector_widgets = {}

	for i = 1, #careers do
		local scenegraph_name = "selection_pivot"
		local widget_name = "selection_widget_" .. i
		local widget_def = create_selection_widget(scenegraph_name, {
			PROTRAIT_WIDTH,
			PORTRAIT_HEIGHT,
		})
		local widget = UIWidget.init(widget_def)
		local profile_name = careers[i]

		widget.content.profile_name = profile_name
		widget.content.profile_texture = CareerSettings[profile_name].picking_image
		widget.content.input_key = "keyboard_" .. i
		widget.offset[1] = (i - 1) * offset_x
		selector_widgets[#selector_widgets + 1] = widget
	end

	self:_set_enemy_role_text(enemy_role)

	self._selector_widgets = selector_widgets
end

DarkPactSelectionUI.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DarkPactSelectionUI._get_current_selected_career_name = function (self)
	if not Managers then
		return "not_assigned"
	end

	if not Managers.player then
		return "not_assigned"
	end

	if not SPProfiles then
		return "not_assigned"
	end

	local local_player = Managers.player:local_player()

	if not local_player then
		return "not_assigned"
	end

	local career_index = local_player:career_index()
	local profile_index = local_player:profile_index()

	if not profile_index or not career_index then
		return "not_assigned"
	end

	local current_profile = SPProfiles[profile_index]
	local current_career = current_profile.careers[career_index]
	local display_name = current_career.display_name

	return display_name
end
