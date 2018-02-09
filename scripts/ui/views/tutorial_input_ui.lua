local definitions = local_require("scripts/ui/views/tutorial_input_ui_definitions")
TutorialInputUI = class(TutorialInputUI)
TutorialInputUI.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._platform = PLATFORM
	self._ingame_ui_context = ingame_ui_context
	self._tutorial_tooltip_animations = {}
	self._tutorial_tooltip_input_widgets = {}
	self._active_tutorial_tooltips = {}

	self._create_ui_elements(self)
	Managers.state.event:register(self, "event_add_tutorial_input", "event_add_tutorial_input")
	Managers.state.event:register(self, "event_update_tutorial_input", "event_update_tutorial_input")
	Managers.state.event:register(self, "event_remove_tutorial_input", "event_remove_tutorial_input")

	return 
end
TutorialInputUI.destroy = function (self)
	if Managers.state.event then
		Managers.state.event:unregister("event_add_tutorial_input", self)
		Managers.state.event:unregister("event_update_tutorial_input", self)
		Managers.state.event:unregister("event_remove_tutorial_input", self)
	end

	return 
end
TutorialInputUI.event_add_tutorial_input = function (self, mission_name, unit)
	local mission_data = Missions[mission_name]

	fassert(mission_data, "[TutorialInputUI:event_add_tutorial_input] There is no mission called %q", mission_name)

	self._active_tutorial_tooltips[#self._active_tutorial_tooltips + 1] = mission_data

	if unit then
		Unit.flow_event(unit, "lua_mission_started")
	end

	return 
end
TutorialInputUI.event_update_tutorial_input = function (self, mission_name)
	return 
end
TutorialInputUI.event_remove_tutorial_input = function (self, mission_name)
	fassert(Missions[mission_name], "[TutorialInputUI:event_remove_tutorial_input] There is no mission called %q", mission_name)

	local index = nil

	for idx, mission_data in pairs(self._active_tutorial_tooltips) do
		if mission_data.name == mission_name then
			index = idx

			break
		end
	end

	if index then
		table.remove(self._active_tutorial_tooltips, index)
	end

	return 
end
TutorialInputUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	self._tutorial_tooltip_widget = UIWidget.init(definitions.widgets.tutorial_tooltip)

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		self._tutorial_tooltip_input_widgets[i] = UIWidget.init(definitions.tutorial_tooltip_input_widgets[i])
	end

	return 
end
TutorialInputUI._button_texture_data_by_input_action = function (self, input_action, alt_button_name)
	local input_manager = self._input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local platform = PLATFORM

	if platform == "win32" and gamepad_active then
		platform = "xb1"
	end

	if alt_button_name then
		local button_texture_data = ButtonTextureByName(alt_button_name, platform)

		return button_texture_data
	else
		local input_service = input_manager.get_service(input_manager, "Player")

		return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
	end

	return 
end
TutorialInputUI.update = function (self, dt, t)
	script_data.tutorial_input = self

	self._update_animations(self, dt, t)
	self._update_tooltip(self, dt, t)
	self._draw(self, dt, t)

	return 
end
TutorialInputUI._update_animations = function (self, dt, t)
	if next(self._tutorial_tooltip_animations) ~= nil then
		self._set_dirty(self)
	end

	for name, ui_animation in pairs(self._tutorial_tooltip_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._tutorial_tooltip_animations[name] = nil
		end
	end

	return 
end
TutorialInputUI._update_tooltip = function (self, dt, t)
	local active_template = self._active_tutorial_tooltips[1]

	if not active_template then
		if self._active_tooltip_name then
			self.hide(self)
		end

		return 
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local tooltip_name = active_template.name
	local active_tooltip_name = self._active_tooltip_name
	local widget_style = self._tutorial_tooltip_widget.style
	local widget_content = self._tutorial_tooltip_widget.content
	local text = active_template.text or "-no text assigned-"
	local force_update = active_template.force_update
	local texture_size_y = 0
	local texture_size_x = 0
	local gamepad_active = self._input_manager:is_device_active("gamepad")
	local inputs = (gamepad_active and active_template.tooltip_gamepad_inputs) or active_template.tooltip_inputs

	if inputs and 0 < #inputs then
		if not active_tooltip_name then
			self.fade_in(self)
		end

		local input_widgets = self._tutorial_tooltip_input_widgets

		if force_update or tooltip_name ~= active_tooltip_name or gamepad_active ~= widget_content.using_gamepad_input then
			widget_content.using_gamepad_input = gamepad_active
			widget_content.input_set = true
			self._active_tooltip_name = tooltip_name
			widget_content.description = text
			local total_width = 0
			local num_inputs = #inputs
			local num_widgets = 0

			for i = 1, num_inputs, 1 do
				local widget = input_widgets[i]
				local widget_content = widget.content
				local widget_style = widget.style
				local input = inputs[i]
				local button_texture_data, button_text = self._button_texture_data_by_input_action(self, input.action)

				if not button_texture_data and active_template.alt_action_icons then
					button_texture_data, button_text = self._button_texture_data_by_input_action(self, input.action, active_template.alt_action_icons[input.action])
				end

				local texture_size_x = 0
				local texture_size_y = 0

				if button_texture_data then
					num_widgets = num_widgets + 1

					if button_texture_data.texture then
						widget_content.button_text = ""
						widget_content.icon = {
							button_texture_data.texture
						}
						widget_style.icon.texture_sizes = {
							button_texture_data.size
						}
						texture_size_x = button_texture_data.size[1]
						texture_size_y = button_texture_data.size[2]
					else
						local textures = {}
						local sizes = {}
						local tile_sizes = {}
						local font, scaled_font_size = UIFontByResolution(widget_style.button_text)
						local text_width, text_height, min = UIRenderer.text_size(ui_renderer, button_text, font[1], scaled_font_size)

						for i = 1, #button_texture_data, 1 do
							textures[i] = button_texture_data[i].texture
							sizes[i] = button_texture_data[i].size

							if button_texture_data[i].tileable then
								tile_sizes[i] = {
									text_width,
									sizes[i][2]
								}
								texture_size_x = texture_size_x + text_width

								if texture_size_y < sizes[i][2] then
									if not sizes[i][2] then
									end
								end
							else
								texture_size_x = texture_size_x + sizes[i][1]

								if texture_size_y < sizes[i][2] and not sizes[i][2] then
								end
							end
						end

						widget_content.icon = textures
						widget_content.button_text = button_text
						widget_style.icon.texture_sizes = sizes
						widget_style.icon.tile_sizes = tile_sizes
					end

					ui_scenegraph["input_description_icon_" .. i].size[1] = texture_size_x
					ui_scenegraph["input_description_icon_" .. i].size[2] = texture_size_y
					widget_content.prefix_text = (input.prefix and input.prefix ~= "" and Localize(input.prefix)) or ""
					widget_content.suffix_text = input.suffix
					local prefix_font, prefix_scaled_font_size = UIFontByResolution(widget_style.prefix_text)
					local suffix_font, suffix_scaled_font_size = UIFontByResolution(widget_style.suffix_text)
					local prefix_text_width = UIRenderer.text_size(ui_renderer, widget_content.prefix_text, prefix_font[1], prefix_scaled_font_size)
					local suffix_text_width = UIRenderer.text_size(ui_renderer, widget_content.suffix_text, suffix_font[1], suffix_scaled_font_size)
					local widget_width = texture_size_x + prefix_text_width + suffix_text_width + 5
					ui_scenegraph["input_description_icon_" .. i].local_position[1] = prefix_text_width
					ui_scenegraph["input_description_" .. i].local_position[1] = total_width
					total_width = total_width + widget_width
					widget.content.visible = true
					widget.element.dirty = true
				end
			end

			self._tutorial_tooltip_widget.element.dirty = true

			for i = num_widgets + 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
				local widget = input_widgets[i]
				widget.content.visible = false
				widget.element.dirty = true
			end

			ui_scenegraph.tutorial_tooltip_input_field.local_position[1] = (total_width - 1920 + 5)*0.5

			return self._tutorial_tooltip_widget, tooltip_name
		end
	end

	return 
end
TutorialInputUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("Player")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self._tutorial_tooltip_widget)

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		UIRenderer.draw_widget(ui_renderer, self._tutorial_tooltip_input_widgets[i])
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
TutorialInputUI._set_dirty = function (self)
	self._tutorial_tooltip_widget.element.dirty = true
	local input_widgets = self._tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]
		widget.element.dirty = true
	end

	return 
end
TutorialInputUI.hide = function (self)
	self._active_tooltip_name = nil

	self.fade_out(self)

	return 
end
local FADE_TIME = 0.25
TutorialInputUI.fade_in = function (self)
	self._fade(self, 0, 255, FADE_TIME)

	return 
end
TutorialInputUI.fade_out = function (self)
	self._fade(self, 255, 0, FADE_TIME)

	return 
end
TutorialInputUI._fade = function (self, from_alpha, to_alpha, duration)
	local widget_style = self._tutorial_tooltip_widget.style
	local bg_style = widget_style.background
	local description_style = widget_style.description
	self._tutorial_tooltip_animations.tooltip_bg_fade = UIAnimation.init(UIAnimation.function_by_time, bg_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	self._tutorial_tooltip_animations.tooltip_description_fade = UIAnimation.init(UIAnimation.function_by_time, description_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	local input_widgets = self._tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]
		local input_widget_style = widget.style
		local prefix_text_style = input_widget_style.prefix_text
		local suffix_text_style = input_widget_style.suffix_text
		local button_text_style = input_widget_style.button_text
		local icon_style = input_widget_style.icon
		self._tutorial_tooltip_animations["tooltip_input_prefix_" .. i] = UIAnimation.init(UIAnimation.function_by_time, prefix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self._tutorial_tooltip_animations["tooltip_input_suffix_" .. i] = UIAnimation.init(UIAnimation.function_by_time, suffix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self._tutorial_tooltip_animations["tooltip_input_button_" .. i] = UIAnimation.init(UIAnimation.function_by_time, button_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self._tutorial_tooltip_animations["tooltip_input_icon_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	end

	return 
end
TutorialInputUI.has_completed_fade = function (self)
	if next(self._tutorial_tooltip_animations) ~= nil then
		return false
	end

	return true
end
TutorialInputUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self._ui_renderer

	for _, widget in ipairs(self._tutorial_tooltip_input_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	UIRenderer.set_element_visible(ui_renderer, self._tutorial_tooltip_widget.element, visible)

	return 
end

return 
