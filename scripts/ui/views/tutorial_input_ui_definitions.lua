-- chunkname: @scripts/ui/views/tutorial_input_ui_definitions.lua

local RETAINED_MODE_ENABLED = false
local NUMBER_OF_TOOLTIP_INPUT_WIDGETS = 5
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.tutorial,
		},
	},
	center_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	tutorial_tooltip_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
	tutorial_tooltip = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip_root",
		vertical_alignment = "center",
		position = {
			0,
			-270,
			10,
		},
		size = {
			0,
			0,
		},
	},
	tutorial_tooltip_background = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			680,
			160,
		},
	},
	tutorial_tooltip_description = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip_background",
		vertical_alignment = "top",
		position = {
			0,
			-46,
			1,
		},
		size = {
			1200,
			0,
		},
	},
	tutorial_tooltip_sub_description = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip_background",
		vertical_alignment = "center",
		position = {
			0,
			-32,
			1,
		},
		size = {
			1200,
			0,
		},
	},
	tutorial_tooltip_input_field = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip_background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	tutorial_tooltip_unassigned = {
		horizontal_alignment = "center",
		parent = "tutorial_tooltip_background",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
}
local alpha = 0

local function create_tutorial_tooltip_input_description_definitions(amount, unassigned)
	local input_description_widgets = {}

	for i = 1, amount do
		local scenegraph_root_id = "input_description_root_" .. i
		local scenegraph_id = "input_description_" .. i
		local scenegraph_prefix_text_id = "input_description_prefix_text_" .. i
		local scenegraph_suffix_text_id = "input_description_suffix_text_" .. i
		local scenegraph_button_text_id = "input_description_button_text_" .. i
		local scenegraph_icon_id = "input_description_icon_" .. i

		scenegraph_definition[scenegraph_root_id] = {
			horizontal_alignment = "top",
			parent = "tutorial_tooltip_input_field",
			vertical_alignment = "center",
			size = {
				0,
				0,
			},
			position = {
				0,
				-20,
				1,
			},
		}
		scenegraph_definition[scenegraph_id] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			parent = scenegraph_root_id,
			size = {
				0,
				0,
			},
			position = {
				0,
				-15,
				1,
			},
		}
		scenegraph_definition[scenegraph_button_text_id] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			parent = scenegraph_icon_id,
			size = {
				0,
				40,
			},
			position = {
				0,
				0,
				2,
			},
		}
		scenegraph_definition[scenegraph_icon_id] = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			parent = scenegraph_id,
			size = {
				0,
				40,
			},
			position = {
				0,
				0,
				1,
			},
		}
		scenegraph_definition[scenegraph_prefix_text_id] = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			parent = scenegraph_icon_id,
			size = {
				0,
				40,
			},
			position = {
				0,
				0,
				1,
			},
		}
		scenegraph_definition[scenegraph_suffix_text_id] = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			parent = scenegraph_icon_id,
			size = {
				0,
				40,
			},
			position = {
				0,
				0,
				1,
			},
		}

		local widget_definition = {
			element = {
				passes = {
					{
						pass_type = "text",
						style_id = "prefix_text",
						text_id = "prefix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.prefix_text ~= ""
						end,
					},
					{
						pass_type = "text",
						style_id = "prefix_text_shadow",
						text_id = "prefix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.prefix_text ~= ""
						end,
					},
					{
						pass_type = "text",
						style_id = "suffix_text",
						text_id = "suffix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.suffix_text ~= ""
						end,
					},
					{
						pass_type = "text",
						style_id = "suffix_text_shadow",
						text_id = "suffix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.suffix_text ~= ""
						end,
					},
					{
						pass_type = "text",
						style_id = "button_text",
						text_id = "button_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.button_text ~= ""
						end,
					},
					{
						pass_type = "text",
						style_id = "button_text_shadow",
						text_id = "button_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.button_text ~= ""
						end,
					},
					{
						pass_type = "multi_texture",
						style_id = "icon",
						texture_id = "icon",
						content_check_function = function (content)
							local icon = content.icon

							return icon and #icon > 0
						end,
					},
				},
			},
			content = {
				button_text = "",
				prefix_text = "",
				suffix_text = "",
			},
			style = {
				prefix_text = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "right",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("white", alpha),
					offset = {
						0,
						0,
						2,
					},
					scenegraph_id = scenegraph_prefix_text_id,
				},
				prefix_text_shadow = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "right",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1,
					},
					scenegraph_id = scenegraph_prefix_text_id,
				},
				suffix_text = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "left",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("white", alpha),
					offset = {
						0,
						0,
						2,
					},
					scenegraph_id = scenegraph_suffix_text_id,
				},
				suffix_text_shadow = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "left",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1,
					},
					scenegraph_id = scenegraph_suffix_text_id,
				},
				button_text = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("font_title", alpha),
					offset = {
						0,
						0,
						2,
					},
					scenegraph_id = scenegraph_button_text_id,
				},
				button_text_shadow = {
					dynamic_font = true,
					font_size = 42,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					localize = false,
					pixel_perfect = true,
					vertical_alignment = "center",
					word_wrap = false,
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1,
					},
					scenegraph_id = scenegraph_button_text_id,
				},
				icon = {
					texture_sizes = {
						{
							20,
							36,
						},
					},
					offset = {
						0,
						0,
						1,
					},
					color = Colors.get_color_table_with_alpha("white", alpha),
					scenegraph_id = scenegraph_icon_id,
				},
			},
			scenegraph_id = scenegraph_id,
		}

		input_description_widgets[#input_description_widgets + 1] = UIWidget.init(widget_definition)
	end

	return input_description_widgets
end

local widget_definitions = {
	tutorial_tooltip = {
		scenegraph_id = "tutorial_tooltip",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "divider",
				},
				{
					pass_type = "texture",
					style_id = "completed_texture",
					texture_id = "completed_texture",
					content_check_function = function (content)
						return content.completed
					end,
				},
				{
					pass_type = "texture",
					style_id = "completed_texture_shadow",
					texture_id = "completed_texture",
					content_check_function = function (content)
						return content.completed
					end,
				},
				{
					pass_type = "text",
					style_id = "description",
					text_id = "description",
				},
				{
					pass_type = "text",
					style_id = "description_shadow",
					text_id = "description",
				},
				{
					pass_type = "text",
					style_id = "sub_description",
					text_id = "sub_description",
				},
				{
					pass_type = "text",
					style_id = "sub_description_shadow",
					text_id = "sub_description",
				},
				{
					pass_type = "text",
					style_id = "unassigned",
					text_id = "unassigned_id",
					content_check_function = function (content)
						return content.unassigned
					end,
				},
				{
					pass_type = "text",
					style_id = "unassigned_shadow",
					text_id = "unassigned_id",
					content_check_function = function (content)
						return content.unassigned
					end,
				},
				{
					pass_type = "texture",
					style_id = "unassigned_background",
					texture_id = "background",
					content_check_function = function (content)
						return content.unassigned
					end,
				},
			},
		},
		content = {
			background = "tab_menu_bg_02",
			completed = false,
			completed_texture = "tutorial_input_completed",
			description = "tutorial_tooltip_advanced_enemy_armor",
			divider = "divider_01_top",
			sub_description = "",
			unassigned = false,
			unassigned_id = "unassigned_keymap",
		},
		style = {
			background = {
				scenegraph_id = "tutorial_tooltip_background",
				offset = {
					0,
					0,
					0,
				},
				color = {
					alpha,
					255,
					255,
					255,
				},
			},
			divider = {
				horizontal_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				vertical_alignment = "center",
				offset = {
					0,
					0,
					2,
				},
				texture_size = {
					264,
					32,
				},
				color = {
					alpha,
					255,
					255,
					255,
				},
			},
			completed_texture = {
				horizontal_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				vertical_alignment = "center",
				offset = {
					0,
					0,
					21,
				},
				texture_size = {
					408,
					179,
				},
				color = Colors.get_color_table_with_alpha("font_title", alpha),
			},
			completed_texture_shadow = {
				horizontal_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				vertical_alignment = "center",
				offset = {
					2,
					-2,
					20,
				},
				texture_size = {
					408,
					179,
				},
				color = Colors.get_color_table_with_alpha("black", alpha),
			},
			description = {
				dynamic_font_size = true,
				font_size = 52,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_description",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", alpha),
				offset = {
					0,
					0,
					2,
				},
			},
			description_shadow = {
				dynamic_font_size = true,
				font_size = 52,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_description",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					-2,
					1,
				},
			},
			sub_description = {
				dynamic_font_size = true,
				font_size = 36,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_sub_description",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("font_default", alpha),
				offset = {
					0,
					0,
					2,
				},
			},
			sub_description_shadow = {
				dynamic_font_size = true,
				font_size = 36,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_sub_description",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					-2,
					1,
				},
			},
			unassigned = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_unassigned",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("red", alpha),
				offset = {
					0,
					15,
					1,
				},
			},
			unassigned_shadow = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				scenegraph_id = "tutorial_tooltip_unassigned",
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					13,
					0,
				},
			},
			unassigned_background = {
				horizontal_alignment = "center",
				scenegraph_id = "tutorial_tooltip_unassigned",
				vertical_alignment = "center",
				offset = {
					0,
					15,
					0,
				},
				texture_size = {
					308.25,
					45.75,
				},
				color = {
					alpha,
					255,
					255,
					255,
				},
			},
		},
	},
}
local tutorial_tooltip_input_widgets = create_tutorial_tooltip_input_description_definitions(NUMBER_OF_TOOLTIP_INPUT_WIDGETS)

return {
	scenegraph = scenegraph_definition,
	widgets = widget_definitions,
	tutorial_tooltip_input_widgets = tutorial_tooltip_input_widgets,
	NUMBER_OF_TOOLTIP_INPUT_WIDGETS = NUMBER_OF_TOOLTIP_INPUT_WIDGETS,
}
