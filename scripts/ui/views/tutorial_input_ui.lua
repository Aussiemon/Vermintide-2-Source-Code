local definitions = local_require("scripts/ui/views/tutorial_input_ui_definitions")
local DO_RELOAD = true
TutorialInputUI = class(TutorialInputUI)

TutorialInputUI.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._platform = PLATFORM
	self._ingame_ui_context = ingame_ui_context
	self._tutorial_tooltip_animations = {}
	self._tutorial_tooltip_input_widgets = {}
	self._active_tutorial_tooltips = {}
	self._prefixes = {
		mouse = "mouse"
	}

	self:_create_ui_elements()
	Managers.state.event:register(self, "event_add_tutorial_input", "event_add_tutorial_input")
	Managers.state.event:register(self, "event_update_tutorial_input", "event_update_tutorial_input")
	Managers.state.event:register(self, "event_remove_tutorial_input", "event_remove_tutorial_input")
	Managers.state.event:register(self, "input_changed", "event_input_changed")
end

TutorialInputUI.destroy = function (self)
	if Managers.state.event then
		Managers.state.event:unregister("event_add_tutorial_input", self)
		Managers.state.event:unregister("event_update_tutorial_input", self)
		Managers.state.event:unregister("event_remove_tutorial_input", self)
		Managers.state.event:unregister("input_changed", self)
	end
end

TutorialInputUI.event_add_tutorial_input = function (self, mission_name, unit)
	local mission_data = Missions[mission_name]

	fassert(mission_data, "[TutorialInputUI:event_add_tutorial_input] There is no mission called %q", mission_name)

	self._active_tutorial_tooltips[#self._active_tutorial_tooltips + 1] = mission_data

	if unit then
		Unit.flow_event(unit, "lua_mission_started")
	end
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
end

TutorialInputUI.event_input_changed = function (self)
	self._input_changed = true
end

TutorialInputUI._create_ui_elements = function (self)
	self._tutorial_tooltip_animations = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	self._tutorial_tooltip_widget = UIWidget.init(definitions.widgets.tutorial_tooltip)

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		self._tutorial_tooltip_input_widgets[i] = UIWidget.init(definitions.tutorial_tooltip_input_widgets[i])
	end

	DO_RELOAD = false
	self._active_tooltip_name = nil
end

TutorialInputUI._button_texture_data_by_input_action = function (self, input_action, alt_button_name, active_template)
	local input_manager = self._input_manager
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
		local alternate_input_action = nil

		if active_template.input_service_fallback then
			alternate_input_action = input_manager:get_service(active_template.input_service_fallback)
		end

		return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active, alternate_input_action)
	end
end

TutorialInputUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_update_animations(dt, t)
	self:_update_tooltip(dt, t)
	self:_draw(dt, t)
end

TutorialInputUI._update_animations = function (self, dt, t)
	for name, ui_animation in pairs(self._tutorial_tooltip_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._tutorial_tooltip_animations[name] = nil
		end
	end
end

TutorialInputUI._update_tooltip = function (self, dt, t)
	local active_template = self._active_tutorial_tooltips[1]

	if not active_template then
		if self._active_tooltip_name then
			self:hide()
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
	local sub_text = (active_template.sub_text and Localize(active_template.sub_text)) or ""
	local force_update = active_template.force_update
	local texture_size_y = 0
	local texture_size_x = 0
	local gamepad_active = self._input_manager:is_device_active("gamepad")
	local inputs = ((gamepad_active or PLATFORM == "ps4") and active_template.tooltip_gamepad_inputs) or active_template.tooltip_inputs

	if not active_tooltip_name then
		self:fade_in()
	end

	local input_widgets = self._tutorial_tooltip_input_widgets

	if force_update or tooltip_name ~= active_tooltip_name or gamepad_active ~= widget_content.using_gamepad_input or self._input_changed then
		widget_content.using_gamepad_input = gamepad_active
		widget_content.input_set = true
		widget_content.unassigned = false
		self._input_changed = false
		self._active_tooltip_name = tooltip_name

		if self._active_tooltip_name ~= tooltip_name then
			if inputs then
				self._tooltip_inputs = table.clone(inputs)
			else
				self._tooltip_inputs = nil
			end
		end

		local num_inputs = (inputs and #inputs) or 0
		widget_content.show_bg = num_inputs > 0
		widget_content.description = text
		widget_content.sub_description = sub_text
		local parent_widget_content = widget_content
		local total_width = 0
		local num_widgets = 0

		for i = 1, num_inputs, 1 do
			local widget = input_widgets[i]
			local widget_content = widget.content
			local widget_style = widget.style
			local input = inputs[i]
			local input_action = input.action
			local button_texture_data, button_text, keymap_binding, unassigned = self:_button_texture_data_by_input_action(input_action, nil, active_template)

			if not button_texture_data and active_template.alt_action_icons then
				button_texture_data, button_text = self:_button_texture_data_by_input_action(input_action, active_template.alt_action_icons[input_action], active_template)
			end

			parent_widget_content.unassigned = parent_widget_content.unassigned or unassigned
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
					if keymap_binding and button_text ~= "" then
						local device_name = keymap_binding[1]
						local prefix = device_name and self._prefixes[device_name]

						if prefix then
							button_text = prefix .. " " .. button_text
						end
					end

					if button_text == "" then
						button_text = Localize("unassigned_keymap")
					else
						button_text = "[" .. button_text .. "]"
					end

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
								texture_size_y = sizes[i][2] or texture_size_y
							end
						else
							texture_size_x = texture_size_x + sizes[i][1]

							if texture_size_y < sizes[i][2] then
								texture_size_y = sizes[i][2] or texture_size_y
							end
						end
					end

					widget_content.button_text = button_text
					widget_style.icon.texture_sizes = sizes
					widget_style.icon.tile_sizes = tile_sizes
					widget_content.icon = nil
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
			end
		end

		for i = num_widgets + 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
			local widget = input_widgets[i]
			widget.content.visible = false
		end

		ui_scenegraph.tutorial_tooltip_input_field.local_position[1] = -(total_width + 5) * 0.5

		return self._tutorial_tooltip_widget, tooltip_name
	end
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
end

TutorialInputUI.hide = function (self)
	self._active_tooltip_name = nil

	self:fade_out()
end

local FADE_TIME = 0.25

TutorialInputUI.fade_in = function (self)
	self:_fade(0, 255, FADE_TIME, false)
end

TutorialInputUI.fade_out = function (self)
	self:_fade(255, 0, FADE_TIME, true)
end

TutorialInputUI._fade = function (self, from_alpha, to_alpha, duration, completed)
	local widget_style = self._tutorial_tooltip_widget.style
	local bg_style = widget_style.background
	local divider_style = widget_style.divider
	local description_style = widget_style.description
	local description_shadow_style = widget_style.description_shadow
	local sub_description_style = widget_style.sub_description
	local sub_description_shadow_style = widget_style.sub_description_shadow
	local completed_texture_style = widget_style.completed_texture
	local completed_texture_shadow_style = widget_style.completed_texture_shadow
	local unassigned_style = widget_style.unassigned
	local unassigned_shadow_style = widget_style.unassigned_shadow
	local unassigned_background_style = widget_style.unassigned_background
	local tutorial_tooltip_animations = self._tutorial_tooltip_animations
	local wait_time = (completed and 0.5) or 0
	self._tutorial_tooltip_widget.content.completed = completed

	if completed then
		local complete_in_duration = 0.3
		tutorial_tooltip_animations.completed_size_x = UIAnimation.init(UIAnimation.function_by_time, completed_texture_style.texture_size, 1, 1224, 408, complete_in_duration, math.easeInCubic)
		tutorial_tooltip_animations.completed_size_y = UIAnimation.init(UIAnimation.function_by_time, completed_texture_style.texture_size, 2, 537, 179, complete_in_duration, math.easeInCubic)
		tutorial_tooltip_animations.completed_fade_in = UIAnimation.init(UIAnimation.function_by_time, completed_texture_style.color, 1, 0, 255, duration, math.easeInCubic)
		tutorial_tooltip_animations.completed_shadow_fade_in = UIAnimation.init(UIAnimation.function_by_time, completed_texture_shadow_style.color, 1, 0, 255, duration, math.easeInCubic)
	end

	tutorial_tooltip_animations.completed_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, completed_texture_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.completed_shadow_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, completed_texture_shadow_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.unassigned_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, unassigned_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.unassigned_shadow_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, unassigned_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.unassigned_background_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, unassigned_background_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_bg_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, bg_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_divider_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, divider_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_description_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, description_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_description_shadow_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, description_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_sub_description_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, sub_description_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	tutorial_tooltip_animations.tooltip_sub_description_shadow_fade = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, sub_description_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	local input_widgets = self._tutorial_tooltip_input_widgets

	for i = 1, definitions.NUMBER_OF_TOOLTIP_INPUT_WIDGETS, 1 do
		local widget = input_widgets[i]
		local input_widget_style = widget.style
		local prefix_text_style = input_widget_style.prefix_text
		local prefix_text_shadow_style = input_widget_style.prefix_text_shadow
		local suffix_text_style = input_widget_style.suffix_text
		local suffix_text_shadow_style = input_widget_style.suffix_text_shadow
		local button_text_style = input_widget_style.button_text
		local button_text_shadow_style = input_widget_style.button_text_shadow
		local icon_style = input_widget_style.icon
		tutorial_tooltip_animations["tooltip_input_prefix_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, prefix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_prefix_shadow_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, prefix_text_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_suffix_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, suffix_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_suffix_shadow_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, suffix_text_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_button_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, button_text_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_button_shadow_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, button_text_shadow_style.text_color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
		tutorial_tooltip_animations["tooltip_input_icon_" .. i] = UIAnimation.init(UIAnimation.wait, wait_time, UIAnimation.function_by_time, icon_style.color, 1, from_alpha, to_alpha, duration, math.easeInCubic)
	end
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
end

return
