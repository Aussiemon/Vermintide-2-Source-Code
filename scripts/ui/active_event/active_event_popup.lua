-- chunkname: @scripts/ui/active_event/active_event_popup.lua

require("scripts/ui/dlc_upsell/common_popup")

ActiveEventPopup = class(ActiveEventPopup, CommonPopup)

ActiveEventPopup.create_ui_elements = function (self)
	ActiveEventPopup.super.create_ui_elements(self)

	local popup_settings = self._common_settings

	self._widgets_by_name.window_background.content.texture_id = popup_settings.background_texture
	self._widgets_by_name.window_background.offset[1] = 100

	local body_text = popup_settings.body_text and Localize(popup_settings.body_text) or ""

	if body_text ~= "" and popup_settings.event_name then
		body_text = string.format(body_text, popup_settings.event_name)
	end

	if popup_settings.logo_data then
		local data = popup_settings.logo_data

		self._widgets_by_name.logo.content.texture_id = data.logo_texture and data.logo_texture or "hero_view_home_logo"
		self._widgets_by_name.logo.style.texture_id.texture_size = data.size and data.size or {
			468,
			236.39999999999998,
		}
		self._widgets_by_name.logo.offset = data.offset and data.offset or {
			-234,
			-118.19999999999999,
			1,
		}
	end

	self._widgets_by_name.body_text.content.text = body_text
	self._widgets_by_name.close_button.content.title_text = Localize(popup_settings.button_text)

	if popup_settings.top_detail_texture then
		self._widgets_by_name.window_top_detail.content.texture_id = popup_settings.top_detail_texture.texture
		self._widgets_by_name.window_top_detail.style.texture_id.size = popup_settings.top_detail_texture.size
		self._widgets_by_name.window_top_detail.style.texture_id.offset = popup_settings.top_detail_texture.offset
	end

	if popup_settings.action_buttons then
		self._action_button_widgets = {}

		local buttons = popup_settings.action_buttons

		for i = 1, #buttons do
			local button_data = buttons[i]
			local button_text = button_data.button_text
			local button_size = {
				360,
				60,
			}
			local widget_def = self._definitions.create_simple_action_button("action_buttons_anchor", button_size, button_text, "button_frame_02_gold")
			local widget = UIWidget.init(widget_def)

			widget.offset[1] = -(button_size[1] * 0.5)
			widget.offset[2] = 80 * (#buttons - i)
			widget.content.on_pressed = callback(button_data.on_pressed)
			self._action_button_widgets[#self._action_button_widgets + 1] = widget
		end
	end

	self._selected_button_idx = #self._action_button_widgets
	self._buttons_amount = #self._action_button_widgets

	local widget = self._action_button_widgets[#self._action_button_widgets]

	widget.content.button_hotspot.is_selected = true
end

ActiveEventPopup.update = function (self, dt)
	if self:should_show() and not self._has_widget_been_closed then
		self:show()
	end

	ActiveEventPopup.super.update(self, dt)
end

ActiveEventPopup.draw = function (self, dt)
	ActiveEventPopup.super.draw(self, dt)

	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:_get_input_service()
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._action_button_widgets then
		UIRenderer.draw_all_widgets(ui_top_renderer, self._action_button_widgets)
	end

	UIRenderer.end_pass(ui_top_renderer)
	self:_update_scrolling_background(dt)
end

ActiveEventPopup._handle_input = function (self, dt)
	local input_service = self:_get_input_service()
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self:_handle_gamepad_selection(dt, input_service)
	else
		self:_handle_mouse_selection(dt, input_service)
	end

	for i, widget in ipairs(self._action_button_widgets) do
		widget.content.button_hotspot.is_selected = gamepad_active and i == self._selected_button_idx
	end

	if gamepad_active and input_service:get("confirm_press", true) then
		self:play_sound("Play_gui_event_ui_select")

		local widget = self._action_button_widgets[self._selected_button_idx]
		local content = widget.content

		if content.on_pressed then
			local params = {
				on_exit_func = content.on_pressed,
			}

			self:_on_close(params)
		end
	end

	if not self._has_widget_been_closed and (UIUtils.is_button_pressed(widgets_by_name.close_button) or input_service:get("back", true) or input_service:get("toggle_menu", true)) then
		self:_on_close()

		return
	end
end

ActiveEventPopup._handle_gamepad_selection = function (self, dt, input_service)
	if self._action_button_widgets then
		local button_widgets = self._action_button_widgets
		local selected_idx = self._selected_button_idx

		if input_service:get("move_up") then
			selected_idx = selected_idx + 1 <= self._buttons_amount and selected_idx + 1 or 1

			self:play_sound("play_gui_start_menu_button_hover")
		elseif input_service:get("move_down") then
			selected_idx = selected_idx - 1 >= 1 and selected_idx - 1 or self._buttons_amount

			self:play_sound("play_gui_start_menu_button_hover")
		end

		if selected_idx ~= self._selected_button_idx then
			self._selected_button_idx = selected_idx
		end
	end
end

ActiveEventPopup._handle_mouse_selection = function (self, dt, input_service)
	if self._action_button_widgets then
		local button_widgets = self._action_button_widgets

		for i = 1, #button_widgets do
			local widget = button_widgets[i]

			if UIUtils.is_button_hover_enter(widget) then
				self:play_sound("play_gui_start_menu_button_hover")
			end

			if UIUtils.is_button_pressed(widget) then
				self:play_sound("Play_gui_event_ui_select")

				local content = widget.content

				if content.on_pressed then
					local params = {
						on_exit_func = content.on_pressed,
					}

					self:_on_close(params)

					return
				end
			end
		end
	end
end

ActiveEventPopup._on_close = function (self, params)
	self._has_widget_been_closed = true

	self:release_input()
	self:hide(params)
end

ActiveEventPopup.show = function (self)
	ActiveEventPopup.super.show(self)
	self:_start_transition_animation("on_enter")
	self:play_sound("Play_gui_event_ui_open")

	local world = Managers.world:world("level_world")

	World.set_data(world, "fullscreen_blur", 0.5)
end

ActiveEventPopup.hide = function (self, params)
	self._exit_anim_id = self:_start_transition_animation("on_exit", params)

	local world = Managers.world:world("level_world")

	World.set_data(world, "fullscreen_blur", nil)
end

ActiveEventPopup._start_transition_animation = function (self, animation_name, optional_params)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}

	if optional_params then
		for param_name, parameter in pairs(optional_params) do
			params[param_name] = parameter
		end
	end

	return self._ui_animator:start_animation(animation_name, nil, self._definitions.scenegraph_definition, params)
end

ActiveEventPopup._update_animations = function (self, dt)
	ActiveEventPopup.super._update_animations(self, dt)

	if self._exit_anim_id and self._ui_animator:is_animation_completed(self._exit_anim_id) then
		self._is_visible = false
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.close_button, dt)
end

ActiveEventPopup.should_show = function (self)
	return self._ui_context.is_in_inn and Managers.popup:has_popup() == false and self._ui_context.ingame_ui.current_view == nil and self._ui_context.ingame_ui.has_left_menu and not self._is_visible
end

ActiveEventPopup._update_scrolling_background = function (self, dt)
	local widget = self._widgets_by_name.window_background
	local offset_x = 100 + 150 * math.sin(Managers.time:time("ui") * 0.1)

	widget.offset[1] = offset_x
end
