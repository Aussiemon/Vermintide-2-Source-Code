local RETAINED_MODE_ENABLED = false
local NUMBER_OF_TOOLTIP_INPUT_WIDGETS = 5
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.tutorial
		}
	},
	center_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	tutorial_tooltip_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	},
	tutorial_tooltip = {
		vertical_alignment = "center",
		parent = "tutorial_tooltip_root",
		horizontal_alignment = "center",
		position = {
			0,
			-270,
			10
		},
		size = {
			0,
			0
		}
	},
	tutorial_tooltip_background = {
		vertical_alignment = "center",
		parent = "tutorial_tooltip",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			680,
			160
		}
	},
	tutorial_tooltip_description = {
		vertical_alignment = "top",
		parent = "tutorial_tooltip_background",
		horizontal_alignment = "center",
		position = {
			0,
			-46,
			1
		},
		size = {
			1200,
			0
		}
	},
	tutorial_tooltip_sub_description = {
		vertical_alignment = "center",
		parent = "tutorial_tooltip_background",
		horizontal_alignment = "center",
		position = {
			0,
			-32,
			1
		},
		size = {
			1200,
			0
		}
	},
	tutorial_tooltip_input_field = {
		vertical_alignment = "center",
		parent = "tutorial_tooltip_background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	tutorial_tooltip_unassigned = {
		vertical_alignment = "top",
		parent = "tutorial_tooltip_background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	}
}
local alpha = 0

local function create_tutorial_tooltip_input_description_definitions(amount, unassigned)
	local input_description_widgets = {}

	for i = 1, amount, 1 do
		local scenegraph_root_id = "input_description_root_" .. i
		local scenegraph_id = "input_description_" .. i
		local scenegraph_prefix_text_id = "input_description_prefix_text_" .. i
		local scenegraph_suffix_text_id = "input_description_suffix_text_" .. i
		local scenegraph_button_text_id = "input_description_button_text_" .. i
		local scenegraph_icon_id = "input_description_icon_" .. i
		scenegraph_definition[scenegraph_root_id] = {
			vertical_alignment = "center",
			parent = "tutorial_tooltip_input_field",
			horizontal_alignment = "top",
			size = {
				0,
				0
			},
			position = {
				0,
				-20,
				1
			}
		}
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = scenegraph_root_id,
			size = {
				0,
				0
			},
			position = {
				0,
				-15,
				1
			}
		}
		scenegraph_definition[scenegraph_button_text_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = scenegraph_icon_id,
			size = {
				0,
				40
			},
			position = {
				0,
				0,
				2
			}
		}
		scenegraph_definition[scenegraph_icon_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			size = {
				0,
				40
			},
			position = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_prefix_text_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_icon_id,
			size = {
				0,
				40
			},
			position = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_suffix_text_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			parent = scenegraph_icon_id,
			size = {
				0,
				40
			},
			position = {
				0,
				0,
				1
			}
		}
		local widget_definition = {
			element = {
				passes = {
					{
						style_id = "prefix_text",
						pass_type = "text",
						text_id = "prefix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.prefix_text ~= ""
						end
					},
					{
						style_id = "prefix_text_shadow",
						pass_type = "text",
						text_id = "prefix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.prefix_text ~= ""
						end
					},
					{
						style_id = "suffix_text",
						pass_type = "text",
						text_id = "suffix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.suffix_text ~= ""
						end
					},
					{
						style_id = "suffix_text_shadow",
						pass_type = "text",
						text_id = "suffix_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.suffix_text ~= ""
						end
					},
					{
						style_id = "button_text",
						pass_type = "text",
						text_id = "button_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.button_text ~= ""
						end
					},
					{
						style_id = "button_text_shadow",
						pass_type = "text",
						text_id = "button_text",
						retained_mode = RETAINED_MODE_ENABLED,
						content_check_function = function (content)
							return content.button_text ~= ""
						end
					},
					{
						pass_type = "multi_texture",
						style_id = "icon",
						texture_id = "icon",
						content_check_function = function (content)
							local icon = content.icon

							return icon and #icon > 0
						end
					}
				}
			},
			content = {
				prefix_text = "",
				suffix_text = "",
				button_text = ""
			},
			style = {
				prefix_text = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "right",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", alpha),
					offset = {
						0,
						0,
						2
					},
					scenegraph_id = scenegraph_prefix_text_id
				},
				prefix_text_shadow = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "right",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1
					},
					scenegraph_id = scenegraph_prefix_text_id
				},
				suffix_text = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", alpha),
					offset = {
						0,
						0,
						2
					},
					scenegraph_id = scenegraph_suffix_text_id
				},
				suffix_text_shadow = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1
					},
					scenegraph_id = scenegraph_suffix_text_id
				},
				button_text = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "center",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("font_title", alpha),
					offset = {
						0,
						0,
						2
					},
					scenegraph_id = scenegraph_button_text_id
				},
				button_text_shadow = {
					word_wrap = false,
					localize = false,
					font_size = 42,
					pixel_perfect = true,
					horizontal_alignment = "center",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("black", alpha),
					offset = {
						2,
						-2,
						1
					},
					scenegraph_id = scenegraph_button_text_id
				},
				icon = {
					texture_sizes = {
						{
							20,
							36
						}
					},
					offset = {
						0,
						0,
						1
					},
					color = Colors.get_color_table_with_alpha("white", alpha),
					scenegraph_id = scenegraph_icon_id
				}
			},
			scenegraph_id = scenegraph_id
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
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "divider",
					style_id = "divider",
					pass_type = "texture"
				},
				{
					texture_id = "completed_texture",
					style_id = "completed_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.completed
					end
				},
				{
					texture_id = "completed_texture",
					style_id = "completed_texture_shadow",
					pass_type = "texture",
					content_check_function = function (content)
						return content.completed
					end
				},
				{
					style_id = "description",
					pass_type = "text",
					text_id = "description"
				},
				{
					style_id = "description_shadow",
					pass_type = "text",
					text_id = "description"
				},
				{
					style_id = "sub_description",
					pass_type = "text",
					text_id = "sub_description"
				},
				{
					style_id = "sub_description_shadow",
					pass_type = "text",
					text_id = "sub_description"
				},
				{
					style_id = "unassigned",
					pass_type = "text",
					text_id = "unassigned_id",
					content_check_function = function (content)
						return content.unassigned
					end
				},
				{
					style_id = "unassigned_shadow",
					pass_type = "text",
					text_id = "unassigned_id",
					content_check_function = function (content)
						return content.unassigned
					end
				},
				{
					texture_id = "background",
					style_id = "unassigned_background",
					pass_type = "texture",
					content_check_function = function (content)
						return content.unassigned
					end
				}
			}
		},
		content = {
			completed_texture = "tutorial_input_completed",
			description = "tutorial_tooltip_advanced_enemy_armor",
			background = "tab_menu_bg_02",
			unassigned_id = "unassigned_keymap",
			completed = false,
			sub_description = "",
			unassigned = false,
			divider = "divider_01_top"
		},
		style = {
			background = {
				scenegraph_id = "tutorial_tooltip_background",
				offset = {
					0,
					0,
					0
				},
				color = {
					alpha,
					255,
					255,
					255
				}
			},
			divider = {
				vertical_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				texture_size = {
					264,
					32
				},
				color = {
					alpha,
					255,
					255,
					255
				}
			},
			completed_texture = {
				vertical_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					21
				},
				texture_size = {
					408,
					179
				},
				color = Colors.get_color_table_with_alpha("font_title", alpha)
			},
			completed_texture_shadow = {
				vertical_alignment = "center",
				scenegraph_id = "tutorial_tooltip_background",
				horizontal_alignment = "center",
				offset = {
					2,
					-2,
					20
				},
				texture_size = {
					408,
					179
				},
				color = Colors.get_color_table_with_alpha("black", alpha)
			},
			description = {
				scenegraph_id = "tutorial_tooltip_description",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 52,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", alpha),
				offset = {
					0,
					0,
					2
				}
			},
			description_shadow = {
				scenegraph_id = "tutorial_tooltip_description",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 52,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					-2,
					1
				}
			},
			sub_description = {
				scenegraph_id = "tutorial_tooltip_sub_description",
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 36,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", alpha),
				offset = {
					0,
					0,
					2
				}
			},
			sub_description_shadow = {
				scenegraph_id = "tutorial_tooltip_sub_description",
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 36,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					-2,
					1
				}
			},
			unassigned = {
				scenegraph_id = "tutorial_tooltip_unassigned",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 20,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("red", alpha),
				offset = {
					0,
					15,
					1
				}
			},
			unassigned_shadow = {
				scenegraph_id = "tutorial_tooltip_unassigned",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 20,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					2,
					13,
					0
				}
			},
			unassigned_background = {
				vertical_alignment = "center",
				scenegraph_id = "tutorial_tooltip_unassigned",
				horizontal_alignment = "center",
				offset = {
					0,
					15,
					0
				},
				texture_size = {
					308.25,
					45.75
				},
				color = {
					alpha,
					255,
					255,
					255
				}
			}
		}
	}
}
local tutorial_tooltip_input_widgets = create_tutorial_tooltip_input_description_definitions(NUMBER_OF_TOOLTIP_INPUT_WIDGETS)

return {
	scenegraph = scenegraph_definition,
	widgets = widget_definitions,
	tutorial_tooltip_input_widgets = tutorial_tooltip_input_widgets,
	NUMBER_OF_TOOLTIP_INPUT_WIDGETS = NUMBER_OF_TOOLTIP_INPUT_WIDGETS
}
