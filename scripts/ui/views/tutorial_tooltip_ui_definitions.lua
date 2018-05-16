local RETAINED_MODE_ENABLED = true
local NUMBER_OF_TOOLTIP_INPUT_WIDGETS = 4
local scenegraph_definition = {
	root = {
		is_root = true,
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
		parent = "root",
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
	screen_fit = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.tutorial
		},
		size = {
			1920,
			1080
		}
	},
	tutorial_tooltip_root = {
		vertical_alignment = "center",
		parent = "root",
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
			-330,
			10
		},
		size = {
			0,
			0
		}
	},
	tutorial_tooltip_description = {
		vertical_alignment = "bottom",
		parent = "tutorial_tooltip",
		horizontal_alignment = "center",
		position = {
			0,
			25,
			1
		},
		size = {
			400,
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
			482,
			80
		}
	},
	tutorial_tooltip_input_field = {
		vertical_alignment = "top",
		parent = "tutorial_tooltip",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			1920,
			0
		}
	}
}

local function create_tutorial_tooltip_input_description_definitions(amount)
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
				0,
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
						style_id = "suffix_text",
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
				button_text = "",
				icon = {
					"pc_button_icon_left"
				}
			},
			style = {
				prefix_text = {
					word_wrap = false,
					localize = false,
					font_size = 24,
					pixel_perfect = true,
					horizontal_alignment = "right",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
						1
					},
					scenegraph_id = scenegraph_prefix_text_id
				},
				suffix_text = {
					word_wrap = false,
					localize = false,
					font_size = 24,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
						1
					},
					scenegraph_id = scenegraph_suffix_text_id
				},
				button_text = {
					word_wrap = false,
					localize = false,
					font_size = 24,
					pixel_perfect = true,
					horizontal_alignment = "center",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
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
					color = {
						255,
						255,
						255,
						255
					},
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
					pass_type = "rotated_texture",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "description",
					pass_type = "text",
					text_id = "description",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			background = "hud_difficulty_unlocked_bg",
			description = "tutorial_tooltip_advanced_enemy_armor"
		},
		style = {
			background = {
				scenegraph_id = "tutorial_tooltip_background",
				offset = {
					0,
					0,
					1
				},
				pivot = {
					241,
					40
				},
				angle = math.pi,
				color = {
					255,
					255,
					255,
					255
				}
			},
			description = {
				scenegraph_id = "tutorial_tooltip_description",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 24,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
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
