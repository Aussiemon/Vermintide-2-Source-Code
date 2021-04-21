local scenegraph_definition = {
	screen = {
		vertical_alignment = "center",
		scale = "fit",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.controller_description
		}
	},
	input_description_field = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			1800,
			70
		}
	},
	background = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center"
	},
	fullscreen_background = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			79
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	}
}

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

local function sort_input_actions(a, b)
	return a.priority < b.priority
end

local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name("tab_menu_bg_02")

local function create_background_widget(num_elements)
	return {
		scenegraph_id = "background",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id"
				}
			}
		},
		content = {
			background_id = "tab_menu_bg_02"
		},
		style = {
			background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					texture_settings.size[1] * num_elements,
					texture_settings.size[2] * 1.2
				}
			}
		}
	}
end

local function create_fullscreen_background_widget()
	return UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "fullscreen_background", nil, nil, {
		200,
		10,
		10,
		10
	})
end

local function create_input_description_widgets(amount)
	local input_description_widgets = {}

	for i = 1, amount, 1 do
		local scenegraph_root_id = "input_description_root_" .. i
		local scenegraph_id = "input_description_" .. i
		local scenegraph_icon_id = "input_description_icon_" .. i
		local scenegraph_text_id = "input_description_text_" .. i
		scenegraph_definition[scenegraph_root_id] = {
			vertical_alignment = "center",
			parent = "input_description_field",
			horizontal_alignment = "left",
			size = {
				1,
				1
			},
			position = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_root_id,
			size = {
				200,
				40
			},
			position = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_icon_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			size = {
				40,
				40
			},
			position = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_text_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_icon_id,
			size = {
				500,
				40
			},
			position = {
				40,
				1,
				1
			}
		}
		local widget_definition = {
			element = {
				passes = {
					{
						style_id = "text",
						pass_type = "text",
						text_id = "text"
					},
					{
						style_id = "text_shadow",
						pass_type = "text",
						text_id = "text"
					},
					{
						pass_type = "texture",
						style_id = "icon",
						texture_id = "icon"
					}
				}
			},
			content = {
				text = "",
				icon = "xbone_button_icon_a"
			},
			style = {
				text = {
					font_size = 24,
					word_wrap = true,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
						2
					},
					scenegraph_id = scenegraph_text_id
				},
				text_shadow = {
					font_size = 24,
					word_wrap = true,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("black", 255),
					offset = {
						2,
						-2,
						1
					},
					scenegraph_id = scenegraph_text_id
				},
				icon = {
					scenegraph_id = scenegraph_icon_id
				}
			},
			scenegraph_id = scenegraph_id
		}
		input_description_widgets[#input_description_widgets + 1] = UIWidget.init(widget_definition)
	end

	return input_description_widgets
end

MenuInputDescriptionUI = class(MenuInputDescriptionUI)

MenuInputDescriptionUI.init = function (self, ingame_ui_context, ui_renderer, input_service, number_of_elements, layer, generic_actions, use_fullscreen_layout)
	self:clear_input_descriptions()

	self.input_service = input_service
	self.ui_renderer = ui_renderer
	self.generic_actions = generic_actions
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._use_fullscreen_layout = use_fullscreen_layout
	scenegraph_definition.screen.position[3] = (layer and layer + 10) or UILayer.controller_description

	self:create_ui_elements(ui_renderer, number_of_elements, use_fullscreen_layout)
end

MenuInputDescriptionUI.create_ui_elements = function (self, ui_renderer, number_of_elements, use_fullscreen_layout)
	self.console_input_description_widgets = create_input_description_widgets(number_of_elements or 5)

	if use_fullscreen_layout then
		self.background_widget = nil
	else
		self.background_widget = UIWidget.init(create_background_widget(number_of_elements or 3))
	end

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(ui_renderer)
end

MenuInputDescriptionUI.draw = function (self, ui_renderer, dt)
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_service
	local ui_renderer = self.ui_renderer

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local number_of_descriptions_in_use = self.number_of_descriptions_in_use
	local console_description_widgets = self.console_input_description_widgets

	if number_of_descriptions_in_use then
		for i = 1, number_of_descriptions_in_use, 1 do
			UIRenderer.draw_widget(ui_renderer, console_description_widgets[i])
		end

		if self.background_widget then
			UIRenderer.draw_widget(ui_renderer, self.background_widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

MenuInputDescriptionUI.destroy = function (self)
	return
end

MenuInputDescriptionUI.change_generic_actions = function (self, new_generic_actions)
	self.generic_actions = new_generic_actions

	self:set_input_description(self.current_console_selection_data)
end

MenuInputDescriptionUI.setup_console_widget_selections = function (self)
	local steppers = self.steppers
	local console_widget_selections = {
		{
			name = "difficulty",
			gamepad_support = true,
			widget = steppers.difficulty.widget,
			actions = {
				{
					hotspot_id = "left_button_hotspot",
					input_action = "move_left",
					description_text = "input_description_previous"
				},
				{
					hotspot_id = "right_button_hotspot",
					input_action = "move_right",
					description_text = "input_description_next"
				}
			}
		},
		{
			name = "privacy",
			gamepad_support = true,
			widget = steppers.privacy.widget,
			actions = {
				{
					hotspot_id = "left_button_hotspot",
					input_action = "move_left",
					description_text = "input_description_previous"
				},
				{
					hotspot_id = "right_button_hotspot",
					input_action = "move_right",
					description_text = "input_description_next"
				}
			}
		},
		{
			name = "level",
			gamepad_support = true,
			widget = steppers.level.widget,
			actions = {
				{
					hotspot_id = "left_button_hotspot",
					input_action = "move_left",
					description_text = "input_description_previous"
				},
				{
					hotspot_id = "right_button_hotspot",
					input_action = "move_right",
					description_text = "input_description_next"
				}
			}
		},
		{
			name = "play_button",
			gamepad_support = false,
			widget = self.play_button_console_widget,
			actions = {
				{
					hotspot_id = "button_hotspot",
					input_action = "confirm",
					description_text = "input_description_confirm"
				}
			}
		},
		{
			name = "quickmatch_button",
			gamepad_support = false,
			widget = self.quickmatch_button_console_widget,
			actions = {
				{
					hotspot_id = "button_hotspot",
					input_action = "confirm",
					description_text = "input_description_confirm"
				}
			}
		}
	}

	return console_widget_selections
end

MenuInputDescriptionUI.set_input_description = function (self, console_selection_data)
	self:clear_input_descriptions()

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local console_input_description_widgets = self.console_input_description_widgets
	local number_of_descriptions = #console_input_description_widgets
	local spacing = 50
	local widgets_width_list = {}
	local total_width = 0
	local widget_use_index = 0
	self.current_console_selection_data = console_selection_data
	local actions_to_add = (console_selection_data and console_selection_data.actions and table.clone(console_selection_data.actions)) or {}
	local ignore_generic_actions = console_selection_data and console_selection_data.ignore_generic_actions
	local actions = {}

	if not ignore_generic_actions then
		local generic_actions = self.generic_actions

		if generic_actions then
			for _, action_data in ipairs(generic_actions) do
				if not action_data.content_check_function or action_data.content_check_function() then
					actions[#actions + 1] = action_data
				end
			end
		end
	end

	for _, action_data in pairs(actions_to_add) do
		if not action_data.content_check_function or action_data.content_check_function() then
			actions[#actions + 1] = action_data
		end
	end

	table.sort(actions, sort_input_actions)

	for _, action_data in pairs(actions) do
		local input_action = action_data.input_action
		local description_text = action_data.description_text
		local ignore_keybinding = action_data.ignore_keybinding

		if description_text then
			widget_use_index = widget_use_index + 1
			description_text = Localize(description_text)
			local action_texture_data = self:get_gamepad_input_texture_data(input_action, ignore_keybinding)
			local description_widget = console_input_description_widgets[widget_use_index]
			local widget_content = description_widget.content
			local widget_style = description_widget.style
			local scenegraph_id = "input_description_" .. widget_use_index
			local scenegraph_icon_id = "input_description_icon_" .. widget_use_index
			local scenegraph_text_id = "input_description_text_" .. widget_use_index
			local action_texture_size = action_texture_data.size
			ui_scenegraph[scenegraph_icon_id].size = action_texture_size
			ui_scenegraph[scenegraph_text_id].local_position[1] = action_texture_size[1]
			widget_content.icon = action_texture_data.texture
			description_text = " " .. description_text
			widget_content.text = description_text
			local text_style = widget_style.text
			local font, scaled_font_size = UIFontByResolution(text_style)
			local text_width, text_height, min = UIRenderer.text_size(ui_renderer, description_text, font[1], scaled_font_size)
			local widget_length = action_texture_size[1] + text_width

			if self._use_fullscreen_layout then
				ui_scenegraph[scenegraph_id].local_position[1] = 0
			else
				ui_scenegraph[scenegraph_id].local_position[1] = -widget_length / 2
			end

			total_width = total_width + widget_length + spacing
			widgets_width_list[widget_use_index] = widget_length
		end
	end

	self.number_of_descriptions_in_use = (widget_use_index ~= 0 and widget_use_index) or nil

	self:_align_inputs(total_width, spacing, widgets_width_list)
end

MenuInputDescriptionUI.clear_input_descriptions = function (self)
	self.number_of_descriptions_in_use = nil
end

MenuInputDescriptionUI.get_gamepad_input_texture_data = function (self, input_action, ignore_keybinding)
	local platform = PLATFORM

	if IS_WINDOWS then
		platform = "xb1"
	end

	if ignore_keybinding then
		return ButtonTextureByName(input_action, platform)
	else
		local input_service = self.input_service

		return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
	end
end

MenuInputDescriptionUI._align_inputs = function (self, total_width, spacing, widgets_width_list)
	local ui_scenegraph = self.ui_scenegraph
	total_width = total_width - spacing
	local parent_width = ui_scenegraph.input_description_field.size[1]
	local widget_use_index = self.number_of_descriptions_in_use

	if widget_use_index then
		if self._use_fullscreen_layout then
			local widget_start_position = 50

			for i = 1, widget_use_index, 1 do
				local widget_width = widgets_width_list[i]
				local scenegraph_root_id = "input_description_root_" .. i
				ui_scenegraph[scenegraph_root_id].local_position[1] = widget_start_position
				widget_start_position = widget_start_position + widget_width + spacing
			end
		else
			local widget_start_position = parent_width / 2 - total_width / 2

			for i = 1, widget_use_index, 1 do
				local widget_width = widgets_width_list[i]
				local new_x = widget_start_position + widget_width / 2
				local scenegraph_root_id = "input_description_root_" .. i
				ui_scenegraph[scenegraph_root_id].local_position[1] = new_x
				widget_start_position = new_x + widget_width / 2 + spacing
			end
		end
	end
end

return
