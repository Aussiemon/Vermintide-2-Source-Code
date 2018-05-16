local definitions = local_require("scripts/ui/views/tutorial_tooltip_ui_definitions")
TutorialTooltipUI = class(TutorialTooltipUI)

TutorialTooltipUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.platform = PLATFORM
	self.tutorial_tooltip_animations = {}
	self.tutorial_tooltip_input_widgets = {}

	self:create_ui_elements()
end

TutorialTooltipUI.destroy = function (self)
	return
end

TutorialTooltipUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	self.tutorial_tooltip_widget = UIWidget.init(definitions.widgets.tutorial_tooltip)

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		self.tutorial_tooltip_input_widgets[i] = UIWidget.init(definitions.tutorial_tooltip_input_widgets[i])
	end
end

TutorialTooltipUI.button_texture_data_by_input_action = function (self, input_action, alt_button_name)
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if platform == "win32" and gamepad_active then
		platform = "xb1"
	end

	if alt_button_name then
		local button_texture_data = ButtonTextureByName(alt_button_name, platform)

		return button_texture_data
	else
		local input_service = input_manager:get_service("Player")

		return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
	end
end

TutorialTooltipUI.update = function (self, tooltip_tutorial, player_unit, dt)
	if next(self.tutorial_tooltip_animations) ~= nil then
		self:set_dirty()
	end

	for name, ui_animation in pairs(self.tutorial_tooltip_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.tutorial_tooltip_animations[name] = nil
		end
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local tooltip_name = tooltip_tutorial.name
	local active_template = TutorialTemplates[tooltip_name]
	local active_tooltip_name = self.active_tooltip_name
	local widget_style = self.tutorial_tooltip_widget.style
	local widget_content = self.tutorial_tooltip_widget.content
	local text = active_template.text or "-no text assigned-"
	local tooltip_action = active_template.action
	local force_update = active_template.force_update
	local texture_size_y = 0
	local texture_size_x = 0
	local gamepad_active = self.input_manager:is_device_active("gamepad")
	local inputs = (gamepad_active and active_template.gamepad_inputs) or active_template.inputs

	if inputs and #inputs > 0 then
		if not active_tooltip_name then
			self:fade_in()
		end

		local input_widgets = self.tutorial_tooltip_input_widgets

		if force_update or tooltip_name ~= active_tooltip_name or gamepad_active ~= widget_content.using_gamepad_input then
			widget_content.using_gamepad_input = gamepad_active
			widget_content.input_set = true
			self.active_tooltip_name = tooltip_name
			widget_content.description = text
			local total_width = 0
			local num_inputs = #inputs
			local num_widgets = 0

			for i = 1, num_inputs, 1 do
				local widget = input_widgets[i]
				local widget_content = widget.content
				local widget_style = widget.style
				local input = inputs[i]
				local button_texture_data, button_text = self:button_texture_data_by_input_action(input.action)

				if not button_texture_data and active_template.alt_action_icons then
					button_texture_data, button_text = self:button_texture_data_by_input_action(input.action, active_template.alt_action_icons[input.action])
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

			self.tutorial_tooltip_widget.element.dirty = true

			for i = num_widgets + 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
				local widget = input_widgets[i]
				widget.content.visible = false
				widget.element.dirty = true
			end

			ui_scenegraph.tutorial_tooltip_input_field.local_position[1] = (1920 - total_width + 5) * 0.5

			return self.tutorial_tooltip_widget, tooltip_name
		end
	end
end

TutorialTooltipUI.draw = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.tutorial_tooltip_widget)

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		UIRenderer.draw_widget(ui_renderer, self.tutorial_tooltip_input_widgets[i])
	end

	UIRenderer.end_pass(ui_renderer)
end

TutorialTooltipUI.set_dirty = function (self)
	self.tutorial_tooltip_widget.element.dirty = true
	local input_widgets = self.tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]
		widget.element.dirty = true
	end
end

TutorialTooltipUI.hide = function (self)
	local ui_renderer = self.ui_renderer
	self.active_tooltip_name = nil

	UIRenderer.set_element_visible(ui_renderer, self.tutorial_tooltip_widget.element, false)

	local input_widgets = self.tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]

		UIRenderer.set_element_visible(ui_renderer, widget.element, false)
	end
end

local FADE_TIME = 0.1

TutorialTooltipUI.fade_in = function (self)
	self:_fade(0, 255, FADE_TIME)
end

TutorialTooltipUI.fade_out = function (self)
	self:_fade(255, 0, FADE_TIME)
end

TutorialTooltipUI._fade = function (self, from_alpha, to_alpha, duration)
	local widget_style = self.tutorial_tooltip_widget.style
	local bg_style = widget_style.background
	local description_style = widget_style.description
	self.tutorial_tooltip_animations.tooltip_bg_fade = UIAnimation.init(UIAnimation.function_by_time, bg_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	self.tutorial_tooltip_animations.tooltip_description_fade = UIAnimation.init(UIAnimation.function_by_time, description_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	local input_widgets = self.tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]
		local input_widget_style = widget.style
		local prefix_text_style = input_widget_style.prefix_text
		local suffix_text_style = input_widget_style.suffix_text
		local button_text_style = input_widget_style.button_text
		local icon_style = input_widget_style.icon
		self.tutorial_tooltip_animations["tooltip_input_prefix_" .. i] = UIAnimation.init(UIAnimation.function_by_time, prefix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self.tutorial_tooltip_animations["tooltip_input_suffix_" .. i] = UIAnimation.init(UIAnimation.function_by_time, suffix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self.tutorial_tooltip_animations["tooltip_input_button_" .. i] = UIAnimation.init(UIAnimation.function_by_time, button_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		self.tutorial_tooltip_animations["tooltip_input_icon_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	end
end

TutorialTooltipUI.has_completed_fade = function (self)
	if next(self.tutorial_tooltip_animations) ~= nil then
		return false
	end

	return true
end

TutorialTooltipUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self.tutorial_tooltip_input_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	UIRenderer.set_element_visible(ui_renderer, self.tutorial_tooltip_widget.element, visible)
end

return
