-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_custom_game_settings.lua

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_custom_game_settings_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition

StartGameWindowVersusCustomGameSettings = class(StartGameWindowVersusCustomGameSettings)
StartGameWindowVersusCustomGameSettings.NAME = "StartGameWindowVersusCustomGameSettings"

local setting_widget_type_func = {
	default = UIWidgets.create_settings_stepper_widget,
	stepper = UIWidgets.create_settings_stepper_widget,
	slider = UIWidgets.create_settings_slider_widget,
}
local setting_widget_height = {
	default = 36,
	slider = 36,
	stepper = 36,
}

StartGameWindowVersusCustomGameSettings.on_enter = function (self, params, offset)
	print("Entered Substate StartGameWindowVersusCustomGameSettings")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._matchmaking_manager = ingame_ui_context.matchmaking_manager
	self._peer_id = ingame_ui_context.peer_id
	self._is_server = ingame_ui_context.is_server

	local game_mechanism = Managers.mechanism:game_mechanism()
	local custom_game_settings_handler = game_mechanism and game_mechanism:get_custom_game_settings_handler()

	self._settings_templates = custom_game_settings_handler and custom_game_settings_handler:get_settings_template()
	self._custom_game_settings_handler = custom_game_settings_handler
	self._game_mechanism = game_mechanism
	self._selected_setting_index = nil
	self._input_focused = false
	self._is_loading = true
	self._custom_settings_toggled = game_mechanism and game_mechanism:custom_settings_enabled() or false

	self:_create_ui_elements()
	Managers.state.event:register(self, "event_focus_custom_game_settings_input", "focus_custom_game_settings_input")
	Managers.state.event:register(self, "event_reset_host_settings", "_reset_host_settings")
end

StartGameWindowVersusCustomGameSettings._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	UIUtils.create_widgets(widget_definitions, widgets, widgets_by_name)

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	self._ui_animations = {}
end

StartGameWindowVersusCustomGameSettings._populate_settings = function (self)
	local is_server = self._is_server and self._game_mechanism:is_hosting_versus_custom_game()
	local settings = self._custom_game_settings_handler:get_settings()
	local settings_template = self._settings_templates
	local settings_ui_data = DLCSettings.carousel.custom_game_ui_settings
	local settings_widgets, settings_widgets_by_name = {}, {}
	local settings_total_size = 0

	for id, value in ipairs(settings) do
		local data = settings_template[id]
		local setting_name = data.setting_name
		local values = data.values
		local ui_data = settings_ui_data[setting_name]
		local widget_type = ui_data and ui_data.widget_type or "default"
		local settings_spacing = setting_widget_height[widget_type]
		local start_idx = data.values_reverse_lookup[value]
		local default_value = data.default
		local default_idx = data.values_reverse_lookup[default_value]
		local callback = callback(self, "on_setting_changed_cb")
		local create_func = setting_widget_type_func[widget_type]
		local widget_def = create_func("settings_anchor", data, ui_data, value, start_idx, id, callback)
		local widget = UIWidget.init(widget_def)

		settings_total_size = settings_total_size + settings_spacing
		widget.offset = {
			20,
			-settings_total_size,
			1,
		}
		widget.content.is_server = is_server
		widget.content.default_value = default_value
		widget.content.default_idx = default_idx
		widget.content.widget_type = widget_type
		settings_widgets[#settings_widgets + 1] = widget
		settings_widgets_by_name[setting_name] = widget
	end

	self._settings_widgets = settings_widgets
	self._settings_widgets_by_name = settings_widgets_by_name

	local num_settings = #settings

	self:_setup_scrollbar(settings_total_size)

	self._num_settings = num_settings
	self._settings = settings
end

StartGameWindowVersusCustomGameSettings.on_exit = function (self, params)
	print("Exited Substate StartGameWindowVersusCustomGameSettings")

	self._ui_animator = nil

	Managers.state.event:unregister("event_focus_custom_game_settings_input", self)
	Managers.state.event:unregister("event_reset_host_settings", self)
end

StartGameWindowVersusCustomGameSettings.update = function (self, dt, t)
	self._ui_animator:update(dt)
	self:_update_animations(dt)
	self:_draw(dt, t)

	local match_owner = Managers.mechanism:network_handler():get_match_handler():get_match_owner()
	local has_slot_reservation_handler = Managers.mechanism:mechanism_try_call("get_all_reservation_handlers_by_owner", match_owner)

	self._is_loading = not has_slot_reservation_handler or not Managers.matchmaking:is_in_versus_custom_game_lobby()
end

StartGameWindowVersusCustomGameSettings._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator
	local ui_animations = self._ui_animations

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	if self._ui_animations.move_up or self._ui_animations.move_down then
		self._scrollbar_ui:force_update_progress(2)
	end
end

StartGameWindowVersusCustomGameSettings.post_update = function (self, dt, t)
	if not self._settings_initialized then
		self._settings_initialized = true

		self:_populate_settings()
	end

	if self._settings_initialized and not self._game_mechanism:is_hosting_versus_custom_game() then
		self:_client_sync_settings()
	end

	if self._settings_is_dirty then
		self:_update_lobby_data(dt, t)
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active and self._input_focused then
		self:_handle_gamepad_input(dt, t)
	else
		self:_handle_input(dt, t)
	end

	self:_update_focus_overlay(dt, t, gamepad_active)
end

StartGameWindowVersusCustomGameSettings._update_lobby_data = function (self, dt, t)
	if self._custom_settings_toggled then
		local changed_packed_settings = self._custom_game_settings_handler:get_packed_custom_settings()

		Managers.matchmaking:set_versus_custom_lobby_data(changed_packed_settings)
	else
		Managers.matchmaking:set_versus_custom_lobby_data("n/a")
	end

	self._settings_is_dirty = false
end

StartGameWindowVersusCustomGameSettings._draw = function (self, dt, t)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if not self._is_loading then
		UIRenderer.draw_all_widgets(ui_renderer, self._widgets)

		if self._settings_widgets then
			UIRenderer.draw_all_widgets(ui_renderer, self._settings_widgets)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	if not self._is_loading and self._scrollbar_ui then
		self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
	end
end

StartGameWindowVersusCustomGameSettings.on_setting_changed_cb = function (self, setting_id, new_setting_idx)
	if self._is_server and self._game_mechanism:is_hosting_versus_custom_game() then
		local settings_templates = self._settings_templates
		local setting_data = settings_templates[setting_id]
		local new_value = setting_data.values[new_setting_idx]
		local setting_name = setting_data.setting_name

		self._custom_game_settings_handler:server_set_setting(setting_name, new_value)

		self._settings_is_dirty = true
	end
end

StartGameWindowVersusCustomGameSettings._client_sync_settings = function (self)
	local settings = self._custom_game_settings_handler:get_settings()
	local settings_templates = self._settings_templates

	for id = 1, #settings do
		local setting_data = settings_templates[id]
		local widget = self._settings_widgets_by_name[setting_data.setting_name]
		local current_setting_idx = widget.content.setting_idx
		local new_value = settings[id]
		local new_setting_idx = setting_data.values_reverse_lookup[new_value]
		local content = widget.content

		if current_setting_idx ~= new_setting_idx then
			content.setting_idx = new_setting_idx

			if content.widget_type == "slider" then
				content.current_slider_value = math.clamp(new_setting_idx / content.num_settings, 0, 1)
			end
		end
	end
end

StartGameWindowVersusCustomGameSettings._setup_scrollbar = function (self, settings_total_size)
	local excess_area = settings_total_size - definitions.scenegraph_definition.container.size[2]

	if excess_area > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "settings_anchor"
		local scroll_area_anchor_scenegraph_id = "container"
		local enable_auto_scroll = false
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	end
end

StartGameWindowVersusCustomGameSettings.focus_custom_game_settings_input = function (self, focus_setting)
	self._input_focused = focus_setting

	self._parent:pause_input(focus_setting)
	self._parent:set_input_description("versus_player_hosted_lobby_custom_settings")

	self._custom_settings_toggled = focus_setting
	self._settings_is_dirty = true
end

StartGameWindowVersusCustomGameSettings._reset_host_settings = function (self, should_reset)
	if should_reset then
		local settings = self._custom_game_settings_handler:get_settings()
		local settings_templates = self._settings_templates

		for id = 1, #settings do
			local setting_data = settings_templates[id]
			local widget = self._settings_widgets_by_name[setting_data.setting_name]
			local new_value = setting_data.default
			local new_setting_idx = setting_data.values_reverse_lookup[new_value]
			local content = widget.content

			content.setting_idx = new_setting_idx

			if content.widget_type == "slider" then
				content.current_slider_value = math.clamp(new_setting_idx / content.num_settings, 0, 1)
			end
		end
	end
end

local function get_target_srollbar_height(settings_widgets, selected_index)
	local total_height = 0
	local target_height = 0

	for i = 1, selected_index do
		local widget = settings_widgets[i]
		local widget_type = widget.content.widget_type

		total_height = total_height + setting_widget_height[widget_type]

		if total_height > 350 then
			target_height = target_height + setting_widget_height[widget_type]
		end
	end

	return target_height
end

StartGameWindowVersusCustomGameSettings._handle_gamepad_input = function (self, dt, t)
	if not self._settings_widgets then
		return
	end

	local input_service = self._parent:window_input_service()
	local selected_idx = self._selected_setting_index or 1
	local settings_widgets = self._settings_widgets

	if input_service:get("move_up") then
		if selected_idx - 1 >= 1 then
			selected_idx = selected_idx - 1
		else
			selected_idx = #settings_widgets
		end

		local selected_setting_widget = settings_widgets[1]

		if self._ui_scenegraph.settings_anchor.local_position[2] > 0 then
			local target_height = get_target_srollbar_height(settings_widgets, selected_idx)

			self._ui_animations.move_down = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.settings_anchor.local_position, 2, self._ui_scenegraph.settings_anchor.local_position[2], target_height, 0.5, math.easeOutCubic)
		end
	elseif input_service:get("move_down") then
		if selected_idx + 1 <= #settings_widgets then
			selected_idx = selected_idx + 1
		else
			selected_idx = 1
		end

		local selected_setting_widget = settings_widgets[selected_idx]

		if math.abs(selected_setting_widget.offset[2]) > 380 then
			local target_height = get_target_srollbar_height(settings_widgets, selected_idx)

			self._ui_animations.move_up = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.settings_anchor.local_position, 2, self._ui_scenegraph.settings_anchor.local_position[2], target_height, 0.5, math.easeOutCubic)
		end
	end

	if selected_idx ~= self._selected_setting_index then
		self._selected_setting_index = selected_idx

		for i = 1, #settings_widgets do
			local widget = settings_widgets[i]
			local content = widget.content

			content.is_selected = selected_idx == i
		end
	end

	if self._is_server and self._game_mechanism:is_hosting_versus_custom_game() then
		local selected_setting_widget = settings_widgets[selected_idx]
		local content = selected_setting_widget.content
		local input_cooldown_multiplier = content.input_cooldown_multiplier
		local on_cooldown_last_frame = false
		local input_made = false

		if content.input_cooldown then
			on_cooldown_last_frame = true

			local current_input_cooldown = content.input_cooldown
			local new_cooldown = math.max(current_input_cooldown - dt, 0)
			local input_cooldown = new_cooldown > 0 and new_cooldown or nil

			content.input_cooldown = input_cooldown
		end

		if selected_setting_widget and not content.input_cooldown then
			if input_service:get("move_left") or content.widget_type == "slider" and input_service:get("move_left_hold") then
				local new_idx = content.setting_idx - 1

				if new_idx < 1 then
					new_idx = content.widget_type == "slider" and 1 or content.num_settings
				end

				content.setting_idx = new_idx

				if content.widget_type == "slider" then
					local step = 1 / content.num_settings
					local slider_value = content.current_slider_value - step

					content.current_slider_value = math.clamp(slider_value, 0, 1)
				end

				content.on_setting_changed_cb(content.id, new_idx)

				input_made = true
			elseif input_service:get("move_right") or content.widget_type == "slider" and input_service:get("move_right_hold") then
				local new_idx = content.setting_idx + 1

				if new_idx > content.num_settings then
					new_idx = content.widget_type == "slider" and content.num_settings or 1
				end

				content.setting_idx = new_idx

				if content.widget_type == "slider" then
					local step = 1 / content.num_settings
					local slider_value = content.current_slider_value + step

					content.current_slider_value = math.clamp(slider_value, 0, 1)
				end

				content.on_setting_changed_cb(content.id, new_idx)

				input_made = true
			elseif input_service:get("special_1") then
				local new_idx = content.default_idx

				content.setting_idx = new_idx
				content.current_slider_value = math.clamp(new_idx / content.num_settings, 0, 1)

				content.on_setting_changed_cb(content.id, new_idx)

				input_made = true
			end
		end

		if selected_setting_widget and input_made then
			if on_cooldown_last_frame then
				input_cooldown_multiplier = math.max(input_cooldown_multiplier - 0.1, 0.1)
				content.input_cooldown = 0.2 * math.ease_in_exp(input_cooldown_multiplier)
				content.input_cooldown_multiplier = input_cooldown_multiplier
			else
				input_cooldown_multiplier = 1
				content.input_cooldown = 0.2 * math.ease_in_exp(input_cooldown_multiplier)
				content.input_cooldown_multiplier = input_cooldown_multiplier
			end
		end
	end

	if input_service:get("back") then
		Managers.state.event:trigger("event_focus_versus_hosted_lobby_input")
		self._parent:pause_input(false)

		self._input_focused = false
		self._custom_settings_toggled = false
	end
end

StartGameWindowVersusCustomGameSettings._handle_input = function (self, dt, t)
	if not self._settings_widgets then
		return
	end

	local settings_widgets = self._settings_widgets

	for i = 1, #settings_widgets do
		local widget = settings_widgets[i]
		local content = widget.content
		local widget_type = content.widget_type
		local is_list_hovered = self:_is_list_hovered()

		content.can_hover = is_list_hovered

		if widget_type == "stepper" or widget_type == "default" then
			if is_list_hovered then
				if UIUtils.is_button_pressed(widget, "left_arrow_hotspot") then
					local new_idx = content.setting_idx - 1

					if new_idx < 1 then
						new_idx = content.num_settings
					end

					content.setting_idx = new_idx

					content.on_setting_changed_cb(content.id, new_idx)
				elseif UIUtils.is_button_pressed(widget, "right_arrow_hotspot") then
					local new_idx = content.setting_idx + 1

					if new_idx > content.num_settings then
						new_idx = 1
					end

					content.setting_idx = new_idx

					content.on_setting_changed_cb(content.id, new_idx)
				elseif UIUtils.is_button_pressed(widget, "reset_setting_button_hotspot") then
					local new_idx = content.default_idx

					content.setting_idx = new_idx

					content.on_setting_changed_cb(content.id, new_idx)
				end
			end
		elseif widget_type == "slider" and is_list_hovered and UIUtils.is_button_pressed(widget, "reset_setting_button_hotspot") then
			local new_idx = content.default_idx

			content.setting_idx = new_idx
			content.current_slider_value = new_idx / content.num_settings

			content.on_setting_changed_cb(content.id, new_idx)
		end
	end

	local input_service = self._parent:window_input_service()

	if self._custom_settings_toggled and input_service:get("toggle_menu", true) then
		self._parent:close_menu()
	end
end

StartGameWindowVersusCustomGameSettings._is_list_hovered = function (self)
	local list_mask_widget = self._widgets_by_name.mask

	return list_mask_widget.content.hotspot.is_hover
end

StartGameWindowVersusCustomGameSettings._update_focus_overlay = function (self, dt, t, gamepad_active)
	if not self._settings_widgets then
		return
	end

	local settings_widgets = self._settings_widgets

	for i = 1, #settings_widgets do
		local widget = settings_widgets[i]
		local content = widget.content
		local focused = self._custom_settings_toggled or self._input_focused

		content.focused = focused

		local fade_progress = content.fade_progress or 0
		local fade_speed = 25

		if focused then
			fade_progress = math.min(fade_progress + dt * fade_speed, 1)
		else
			fade_progress = math.max(fade_progress - dt * fade_speed, 0)
		end

		content.fade_progress = fade_progress
	end
end
