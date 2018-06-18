local INPUT_FIELD_WIDTH = 400
local INPUT_FIELD_COLOR = {
	200,
	0,
	0,
	0
}
local CHECKBOX_SIZE = {
	14,
	14
}
local SLIDER_SIZE = {
	INPUT_FIELD_WIDTH,
	10
}
local SLIDER_BORDER_THICKNESS = 2
local DROP_DOWN_SIZE = {
	INPUT_FIELD_WIDTH,
	30
}
local WINDOW_WIDTH = 1400
local WINDOW_HEIGHT = 900
local BOTTOM_EDGE_THICKNESS = 2
local BOTTOM_EDGE_COLOR = Colors.get_color_table_with_alpha("font_default", 50)
local scenegraph_definition = {
	root = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.options_menu + 10
		},
		size = {
			1920,
			1080
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			-10
		},
		size = {
			1920,
			1080
		}
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	logo = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			45,
			-45,
			0
		},
		size = {
			280,
			200
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			WINDOW_HEIGHT
		},
		position = {
			0,
			40,
			2
		}
	},
	background_frame = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			WINDOW_HEIGHT
		},
		position = {
			0,
			0,
			1
		}
	},
	background_top_panel = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	background_top_panel_edge = {
		vertical_alignment = "bottom",
		parent = "background_top_panel",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			0
		},
		position = {
			0,
			-5,
			1
		}
	},
	background_bottom_panel = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	background_bottom_panel_edge = {
		vertical_alignment = "top",
		parent = "background_bottom_panel",
		horizontal_alignment = "center",
		size = {
			WINDOW_WIDTH,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	frame_divider = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		position = {
			420,
			-90,
			2
		},
		size = {
			36,
			746
		}
	},
	button_pivot = {
		vertical_alignment = "bottom",
		parent = "background_top_panel",
		horizontal_alignment = "left",
		position = {
			65,
			9,
			2
		},
		size = {
			0,
			0
		}
	},
	menu_symbol = {
		vertical_alignment = "bottom",
		parent = "background_top_panel",
		horizontal_alignment = "left",
		position = {
			10,
			4,
			2
		},
		size = {
			40,
			40
		}
	},
	right_frame = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			2
		},
		size = {
			1420,
			902
		}
	},
	gamepad_tooltip_text = {
		vertical_alignment = "top",
		parent = "right_frame",
		horizontal_alignment = "left",
		position = {
			20,
			-60,
			3
		},
		size = {
			820,
			762
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			-10,
			2
		},
		size = {
			480,
			28
		}
	},
	list_mask = {
		vertical_alignment = "center",
		parent = "background_frame",
		horizontal_alignment = "left",
		position = {
			18,
			0,
			2
		},
		size = {
			WINDOW_WIDTH,
			WINDOW_HEIGHT - 140
		}
	},
	list_edge_fade_bottom = {
		vertical_alignment = "bottom",
		parent = "list_mask",
		horizontal_alignment = "center",
		position = {
			0,
			-15,
			2
		},
		size = {
			WINDOW_WIDTH,
			15
		}
	},
	list_edge_fade_top = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "center",
		position = {
			0,
			15,
			2
		},
		size = {
			WINDOW_WIDTH,
			15
		}
	},
	scrollbar_root = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "right",
		position = {
			-15,
			0,
			10
		},
		size = {
			8,
			WINDOW_HEIGHT - 120
		}
	},
	exit_button = {
		vertical_alignment = "bottom",
		parent = "background_top_panel",
		horizontal_alignment = "right",
		position = {
			-8,
			8,
			1
		},
		size = {
			32,
			32
		}
	},
	apply_button = {
		vertical_alignment = "top",
		parent = "background_bottom_panel",
		horizontal_alignment = "right",
		position = {
			-30,
			-7,
			1
		},
		size = {
			150,
			30
		}
	},
	reset_to_default = {
		vertical_alignment = "bottom",
		parent = "apply_button",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			0
		},
		size = {
			150,
			30
		}
	},
	settings_button_1 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_2 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_3 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_4 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_5 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_6 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_7 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	settings_button_8 = {
		vertical_alignment = "bottom",
		parent = "button_pivot",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			30
		}
	},
	calibrate_ui_dummy = {
		position = {
			0,
			0,
			1
		},
		size = {
			1,
			1
		}
	}
}

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_12_divider_right",
			edge_holder_left = "menu_frame_12_divider_left",
			bottom_edge = "menu_frame_12_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_12_divider_vertical",
			edge_holder_top = "menu_frame_12_divider_top",
			edge_holder_bottom = "menu_frame_12_divider_bottom"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local gamepad_tooltip_style = {
	word_wrap = true,
	font_size = 28,
	localize = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	line_colors = {
		Colors.get_color_table_with_alpha("font_title", 255)
	},
	offset = {
		32,
		-11,
		10
	}
}
local gamepad_frame_widget_definitions = {
	gamepad_tooltip_text = UIWidgets.create_simple_text("", "gamepad_tooltip_text", nil, nil, gamepad_tooltip_style)
}
local background_widget_definitions = {
	menu_symbol = UIWidgets.create_simple_texture("cogwheel_small", "menu_symbol", nil, nil, Colors.get_color_table_with_alpha("font_title", 255)),
	background_frame = UIWidgets.create_frame("background_frame", scenegraph_definition.background_frame.size, "menu_frame_12"),
	background = UIWidgets.create_simple_rect("background", {
		255,
		15,
		15,
		15
	}),
	background_bottom_panel = UIWidgets.create_simple_rect("background_bottom_panel", {
		255,
		10,
		10,
		10
	}),
	background_bottom_panel_edge = create_window_divider("background_bottom_panel_edge", scenegraph_definition.background_bottom_panel_edge.size),
	background_top_panel = UIWidgets.create_simple_rect("background_top_panel", {
		255,
		10,
		10,
		10
	}),
	background_top_panel_edge = create_window_divider("background_top_panel_edge", scenegraph_definition.background_top_panel_edge.size),
	right_frame = {
		scenegraph_id = "right_frame",
		element = {
			passes = {
				{
					style_id = "edge_fade_top_id",
					pass_type = "texture_uv",
					content_id = "edge_fade_top_id"
				},
				{
					style_id = "edge_fade_bottom_id",
					pass_type = "texture_uv",
					content_id = "edge_fade_bottom_id"
				},
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis)
						local scroll_step = ui_content.scroll_step or 0.1
						local current_scroll_value = ui_content.internal_scroll_value
						current_scroll_value = current_scroll_value + scroll_step * -scroll_axis.y
						ui_content.internal_scroll_value = math.clamp(current_scroll_value, 0, 1)
					end
				}
			}
		},
		content = {
			internal_scroll_value = 0,
			texture_id = "settings_window_02",
			edge_fade_top_id = {
				texture_id = "mask_rect_edge_fade",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			edge_fade_bottom_id = {
				texture_id = "mask_rect_edge_fade",
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			}
		},
		style = {
			edge_fade_bottom_id = {
				scenegraph_id = "list_edge_fade_bottom",
				color = {
					255,
					255,
					255,
					255
				}
			},
			edge_fade_top_id = {
				scenegraph_id = "list_edge_fade_top",
				color = {
					255,
					255,
					255,
					255
				}
			}
		}
	},
	list_mask = {
		scenegraph_id = "list_mask",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "mask_rect"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	},
	dead_space_filler = {
		scenegraph_id = "dead_space_filler",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
}
local widget_definitions = {}
local button_element_template = {
	passes = {
		{
			pass_type = "hotspot",
			content_id = "hotspot"
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.hotspot.is_hover and content.hotspot.is_clicked > 0
			end
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return content.hotspot.is_hover and content.hotspot.is_clicked > 0
			end
		},
		{
			pass_type = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				return content.hotspot.is_clicked == 0 or content.hotspot.is_selected
			end
		},
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				if content.hotspot.is_hover then
					style.text_color = style.hover_color
				else
					style.text_color = style.default_color
				end

				return true
			end
		}
	}
}

local function create_exit_button(scenegraph_id, texture)
	local size = scenegraph_definition[scenegraph_id].size
	local element = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				style_id = "button_texture",
				texture_id = "button_texture",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "button_texture_hover",
				texture_id = "button_texture",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			}
		}
	}
	local content = {
		button_texture = texture,
		button_hotspot = {}
	}
	local style = {
		size = {
			size[1],
			size[2]
		},
		color = {
			255,
			255,
			255,
			255
		},
		button_texture_hover = {
			size = {
				size[1],
				size[2]
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		button_texture = {
			size = {
				size[1],
				size[2]
			},
			color = Colors.get_color_table_with_alpha("font_button_normal", 255)
		}
	}
	local widget = {
		element = element,
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

local button_definitions = {
	exit_button = create_exit_button("exit_button", "friends_icon_close"),
	apply_button = UIWidgets.create_text_button("apply_button", "menu_settings_apply", 22, nil, "center"),
	reset_to_default = UIWidgets.create_text_button("reset_to_default", "menu_settings_reset_to_default", 22, nil, "center")
}
local list_size_x = scenegraph_definition.list_mask.size[1]
local scrollbar_size = scenegraph_definition.scrollbar_root.size
local scrollbar_definition = UIWidgets.create_scrollbar("scrollbar_root", scrollbar_size)
local DEBUG_WIDGETS = false
local CHECKBOX_WIDGET_SIZE = {
	list_size_x,
	30
}

local function create_checkbox_widget(text, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - CHECKBOX_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					style_id = "checkbox",
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted
					end
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
						if ui_content.hotspot.on_release then
							ui_content.flag = not ui_content.flag
						end

						local flag = ui_content.flag

						if flag then
							ui_content.checkbox = "checkbox_checked"
						else
							ui_content.checkbox = "checkbox_unchecked"
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "checkbox",
					texture_id = "checkbox"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			rect_masked = "rect_masked",
			flag = false,
			checkbox = "checkbox_unchecked",
			highlight_texture = "playerlist_hover",
			hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = text,
			hotspot_content_ids = {
				"hotspot"
			}
		},
		style = {
			highlight_texture = {
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					CHECKBOX_WIDGET_SIZE[1],
					CHECKBOX_WIDGET_SIZE[2]
				}
			},
			checkbox = {
				masked = true,
				offset = {
					base_offset[1] + 642,
					base_offset[2] + 17,
					base_offset[3]
				},
				size = {
					16,
					16
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_size = 28,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			offset = {
				base_offset[1],
				base_offset[2],
				base_offset[3]
			},
			size = table.clone(CHECKBOX_WIDGET_SIZE),
			color = {
				50,
				255,
				255,
				255
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + CHECKBOX_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					CHECKBOX_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					CHECKBOX_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local function create_simple_texture_widget(texture, texture_size, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - texture_size[2]
	local definition = {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				}
			}
		},
		content = {
			rect_masked = "rect_masked",
			texture_id = texture
		},
		style = {
			size = {
				texture_size[1],
				texture_size[2]
			},
			offset = {
				base_offset[1],
				base_offset[2],
				base_offset[3]
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 15
				},
				size = {
					texture_size[1],
					texture_size[2]
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					texture_size[1],
					BOTTOM_EDGE_THICKNESS
				}
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local function create_gamepad_layout_widget(texture, texture_size, texture2, texture_size2, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - texture_size[2]
	local platform = PLATFORM
	local definition = nil

	if platform == "win32" then
		definition = UIWidgets.create_gamepad_layout_win32(texture, texture_size, texture2, texture_size2, base_offset, scenegraph_id)
	elseif platform == "xb1" then
		definition = UIWidgets.create_gamepad_layout_xb1(texture, texture_size, base_offset, scenegraph_id)
	elseif platform == "ps4" then
		definition = UIWidgets.create_gamepad_layout_ps4(texture, texture_size, base_offset, scenegraph_id)
	end

	return UIWidget.init(definition)
end

local SLIDER_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_slider_widget(text, tooltip_text, scenegraph_id, base_offset, slider_image)
	base_offset[2] = base_offset[2] - SLIDER_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "slider_box",
					texture_id = "rect_masked"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_background",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_background_2",
					texture_id = "rect_masked"
				},
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted
					end
				},
				{
					pass_type = "option_tooltip",
					text_id = "tooltip_text",
					content_check_function = function (content)
						return content.tooltip_text and content.highlight_hotspot.is_hover and not Managers.input:is_showing_tooltip()
					end
				},
				{
					style_id = "slider_box_hotspot",
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					content_check_hover = "hotspot",
					pass_type = "held",
					style_id = "slider_box",
					held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						local cursor = nil
						local gamepad_active = Managers.input:is_device_active("gamepad")

						if gamepad_active then
							cursor = input_service:get("cursor")
						else
							cursor = UIInverseScaleVectorToResolution(input_service:get("cursor"))
						end

						local scenegraph_id = ui_content.scenegraph_id
						local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
						local size_x = ui_style.size[1]
						local cursor_x = cursor[1]
						local pos_start = world_position[1] + ui_style.offset[1]
						local old_value = ui_content.internal_value
						local cursor_x_norm = cursor_x - pos_start
						local value = math.clamp(cursor_x_norm / size_x, 0, 1)
						ui_content.internal_value = value

						if old_value ~= value and not ui_content.callback_on_release then
							ui_content:callback()
						end
					end,
					release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						ui_content:callback()
					end
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content)
						local internal_value = ui_content.internal_value
						local min = ui_content.min
						local max = ui_content.max
						local real_value = math.round_with_precision(min + (max - min) * internal_value, ui_content.num_decimals or 0)
						ui_content.value = real_value
						ui_content.value_text = real_value
						local slider_box_style = ui_style.slider_box
						local slider_box_size = slider_box_style.size
						local base_offset_x = slider_box_style.offset[1]
						local size_x = slider_box_size[1] * internal_value
						local slider_icon_style = ui_style.slider
						local slider_icon_hover_style = ui_style.slider_hover
						local slider_icon_offset = slider_icon_style.offset
						local slider_icon_size = slider_icon_style.size
						local slider_icon_x = math.max(0, math.min(size_x - slider_icon_size[1], slider_box_size[1] - slider_icon_size[1]))
						slider_icon_style.offset[1] = (base_offset_x + size_x) - slider_icon_style.size[1] / 2
						slider_icon_hover_style.offset[1] = (slider_icon_style.offset[1] + slider_icon_size[1] / 2) - slider_icon_hover_style.size[1] / 2

						if ui_content.hotspot.is_hover or ui_content.altering_value then
							ui_style.value_text.text_color = ui_style.value_text.hover_color
						else
							ui_style.value_text.text_color = ui_style.value_text.default_color
						end
					end
				},
				{
					style_id = "value_text",
					pass_type = "text",
					text_id = "value_text"
				},
				{
					pass_type = "texture",
					style_id = "slider",
					texture_id = "slider"
				},
				{
					pass_type = "texture",
					style_id = "slider_hover",
					texture_id = "slider_hover",
					content_check_function = function (content)
						return content.hotspot.is_hover
					end
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "slider_box",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "texture",
					style_id = "slider_image",
					texture_id = "slider_image",
					content_check_function = function (content)
						return content.slider_image ~= ""
					end
				},
				{
					style_id = "left_arrow",
					pass_type = "hotspot",
					content_id = "left_hotspot"
				},
				{
					style_id = "right_arrow",
					pass_type = "hotspot",
					content_id = "right_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow",
					pass_type = "texture",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow",
					pass_type = "texture_uv",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_hover",
					pass_type = "texture_uv",
					content_id = "arrow_hover"
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
						local left_hotspot = ui_content.left_hotspot
						local right_hotspot = ui_content.right_hotspot

						if left_hotspot.on_hover_enter then
							local on_hover_enter_callback = ui_content.on_hover_enter_callback

							if on_hover_enter_callback then
								on_hover_enter_callback("left_arrow_hover")
							end
						end

						if left_hotspot.on_hover_exit then
							local on_hover_exit_callback = ui_content.on_hover_exit_callback

							if on_hover_exit_callback then
								on_hover_exit_callback("left_arrow_hover")
							end
						end

						if left_hotspot.on_release then
							local on_pressed_callback = ui_content.on_pressed_callback

							if on_pressed_callback then
								on_pressed_callback("left_arrow")
								on_pressed_callback("left_arrow_hover")
							end
						end

						if right_hotspot.on_hover_enter then
							local on_hover_enter_callback = ui_content.on_hover_enter_callback

							if on_hover_enter_callback then
								on_hover_enter_callback("right_arrow_hover")
							end
						end

						if right_hotspot.on_hover_exit then
							local on_hover_exit_callback = ui_content.on_hover_exit_callback

							if on_hover_exit_callback then
								on_hover_exit_callback("right_arrow_hover")
							end
						end

						if right_hotspot.on_release then
							local on_pressed_callback = ui_content.on_pressed_callback

							if on_pressed_callback then
								on_pressed_callback("right_arrow")
								on_pressed_callback("right_arrow_hover")
							end
						end
					end
				}
			}
		},
		content = {
			internal_value = 0.5,
			rect_masked = "rect_masked",
			slider_hover = "slider_thumb_hover",
			value = 0.5,
			highlight_texture = "playerlist_hover",
			slider = "slider_thumb",
			scenegraph_id = scenegraph_id,
			text = text,
			slider_image = (slider_image and slider_image.slider_image) or "",
			tooltip_text = tooltip_text,
			hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			hotspot_content_ids = {
				"hotspot"
			},
			left_hotspot = {},
			right_hotspot = {},
			arrow = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			arrow_hover = {
				texture_id = "settings_arrow_clicked",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		},
		style = {
			offset = {
				base_offset[1],
				base_offset[2] - ((slider_image and slider_image.size[2]) or 0),
				base_offset[3]
			},
			size = {
				SLIDER_WIDGET_SIZE[1],
				SLIDER_WIDGET_SIZE[2] + ((slider_image and slider_image.size[2]) or 0)
			},
			color = {
				50,
				255,
				255,
				255
			},
			highlight_texture = {
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					SLIDER_WIDGET_SIZE[1],
					SLIDER_WIDGET_SIZE[2]
				}
			},
			tooltip_text = {
				font_size = 24,
				width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255)
				},
				offset = {
					0,
					0,
					0
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_size = 16,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1],
					base_offset[2] + 5,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			slider_box = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH + 30,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - 4,
					base_offset[3] + 10
				},
				size = {
					INPUT_FIELD_WIDTH - 112,
					10
				},
				color = {
					255,
					5,
					5,
					5
				}
			},
			slider_box_hotspot = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH + 19,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - 13.5,
					base_offset[3] + 10
				},
				size = {
					INPUT_FIELD_WIDTH - 90,
					27
				}
			},
			slider = {
				masked = true,
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - 13.5,
					base_offset[3] + 15
				},
				size = {
					14,
					27
				}
			},
			slider_hover = {
				masked = true,
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - 12.5,
					base_offset[3] + 15
				},
				size = {
					34,
					25
				}
			},
			input_field_background = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - 50 - 2,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - (SLIDER_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3]
				},
				color = INPUT_FIELD_COLOR,
				size = {
					52,
					SLIDER_WIDGET_SIZE[2] - 10 + 2
				}
			},
			input_field_background_2 = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - 50,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - (SLIDER_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 1
				},
				color = {
					255,
					10,
					10,
					10
				},
				size = {
					50,
					SLIDER_WIDGET_SIZE[2] - 10
				}
			},
			value_text = {
				font_size = 16,
				upper_case = true,
				localize = false,
				horizontal_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - 25,
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - (SLIDER_WIDGET_SIZE[2] - 10) / 2 - 2,
					base_offset[3] + 2
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					SLIDER_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			slider_image = {
				masked = true,
				size = (slider_image and slider_image.size) or {
					0,
					0
				},
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - ((slider_image and slider_image.size[1]) or 0),
					base_offset[2] - ((slider_image and slider_image.size[2]) or 0),
					base_offset[3] + 15
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					SLIDER_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			left_arrow = {
				masked = true,
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3] + 1
				},
				size = {
					19,
					27
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			left_arrow_hover = {
				masked = true,
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH + 6,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 17.5,
					base_offset[3]
				},
				size = {
					30,
					35
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			left_arrow_hotspot = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH / 2,
					27
				}
			},
			right_arrow = {
				masked = true,
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - 19 - 52,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					19,
					27
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				pivot = {
					9.5,
					13.5
				}
			},
			right_arrow_hover = {
				masked = true,
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - 30 - 52 - 5,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 17.5,
					base_offset[3]
				},
				size = {
					30,
					35
				},
				color = {
					0,
					255,
					255,
					255
				},
				pivot = {
					9.5,
					13.5
				}
			},
			right_arrow_hotspot = {
				offset = {
					(base_offset[1] + SLIDER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH / 2,
					27
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
	base_offset[2] = base_offset[2] - SLIDER_WIDGET_SIZE[2] - ((slider_image and slider_image.size[2]) or 0)

	return UIWidget.init(definition)
end

local DROP_DOWN_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_drop_down_widget(text, options, selected_option, tooltip_text, scenegraph_id, base_offset)
	local options_texts = {}
	local options_values = {}
	local options_n = #options

	for i = 1, options_n, 1 do
		options_texts[i] = options[i].text
		options_values[i] = options[i].value
	end

	base_offset[2] = base_offset[2] - DROP_DOWN_WIDGET_SIZE[2]
	local item_size = {
		INPUT_FIELD_WIDTH - 56,
		24
	}
	local item_styles = {}
	local item_contents = {}

	for i = 1, options_n, 1 do
		local content = {
			selected = false,
			highlight_texture = "playerlist_hover",
			hotspot = {},
			text = options_texts[i]
		}
		local style = {
			text = {
				upper_case = true,
				horizontal_alignment = "center",
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					0,
					0,
					25
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = item_size
			},
			highlight_texture = {
				masked = true,
				offset = {
					0,
					0,
					24
				},
				color = Colors.get_table("white"),
				size = item_size
			},
			size = item_size,
			color = {
				50,
				255,
				255,
				255
			}
		}
		item_styles[i] = style
		item_contents[i] = content
	end

	local selected_bg_y = item_size[2] * options_n
	local pi = math.pi
	local definition = {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted
					end
				},
				{
					pass_type = "option_tooltip",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_showing_tooltip()
					end
				},
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "arrow",
					pass_type = "texture_uv",
					content_id = "arrow",
					content_check_function = function (content, style)
						local parent_content = content.parent

						if parent_content.disabled then
							return false
						end

						return parent_content.active
					end
				},
				{
					texture_id = "texture_id",
					style_id = "arrow",
					pass_type = "texture",
					content_id = "arrow",
					content_check_function = function (content, style)
						local parent_content = content.parent

						if parent_content.disabled then
							return false
						end

						return not parent_content.active
					end
				},
				{
					texture_id = "texture_id",
					style_id = "arrow_hover_flipped",
					pass_type = "texture_uv",
					content_id = "arrow_hover",
					content_check_function = function (content, style)
						local parent_content = content.parent
						local hotspot = parent_content.hotspot

						if hotspot.is_hover then
							if parent_content.disabled then
								return false
							end

							return parent_content.active
						end
					end
				},
				{
					texture_id = "texture_id",
					style_id = "arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover",
					content_check_function = function (content, style)
						local parent_content = content.parent
						local hotspot = parent_content.hotspot

						if hotspot.is_hover then
							if parent_content.disabled then
								return false
							end

							return not parent_content.active
						end
					end
				},
				{
					style_id = "selected_option",
					pass_type = "text",
					text_id = "selected_option",
					content_check_function = function (content, style)
						if content.disabled then
							style.text_color = style.disabled_color
						elseif content.hotspot.is_hover or content.active then
							style.text_color = style.hover_color
						else
							style.text_color = style.default_color
						end

						local current_option = content.options_texts[content.current_selection]

						if content.selected_option ~= current_option then
							content.selected_option = current_option
						end

						if content.selected_option == nil then
							content.selected_option = ""
						end

						return true
					end
				},
				{
					style_id = "list_style",
					pass_type = "list_pass",
					content_id = "list_content",
					content_check_function = function (content, style)
						return style.active
					end,
					passes = {
						{
							pass_type = "hotspot",
							content_id = "hotspot"
						},
						{
							pass_type = "local_offset",
							offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
								local hotspot = ui_content.hotspot
								local text_style = ui_style.text

								if hotspot.on_hover_enter then
									hotspot.is_selected = true
								elseif hotspot.on_hover_exit then
									hotspot.is_selected = false
								end

								if hotspot.is_selected then
									text_style.text_color = text_style.hover_color
								else
									text_style.text_color = text_style.default_color
								end
							end
						},
						{
							style_id = "text",
							pass_type = "text",
							text_id = "text"
						},
						{
							pass_type = "texture",
							style_id = "highlight_texture",
							texture_id = "highlight_texture",
							content_check_function = function (content)
								return content.hotspot.is_hover
							end
						}
					}
				},
				{
					pass_type = "texture",
					style_id = "selected_bg",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return content.active
					end
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			selected_bg = "drop_down_menu_selected_bg",
			highlight_texture = "playerlist_hover",
			rect_masked = "rect_masked",
			disabled = false,
			active = false,
			hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			list_content = item_contents,
			text = text,
			selected_option = options_texts[selected_option],
			current_selection = selected_option,
			options_texts = options_texts,
			options_values = options_values,
			tooltip_text = tooltip_text,
			arrow = {
				texture_id = "drop_down_menu_arrow",
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			},
			arrow_hover = {
				texture_id = "drop_down_menu_arrow_clicked",
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			},
			hotspot_content_ids = {
				"hotspot"
			}
		},
		style = {
			offset = {
				base_offset[1],
				base_offset[2],
				base_offset[3]
			},
			list_style = {
				active = false,
				start_index = 1,
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH + 28,
					base_offset[2] - item_size[2],
					base_offset[3] + 5
				},
				num_draws = options_n,
				list_member_offset = {
					0,
					-item_size[2],
					0
				},
				item_styles = item_styles
			},
			highlight_texture = {
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					DROP_DOWN_WIDGET_SIZE[1],
					DROP_DOWN_WIDGET_SIZE[2]
				}
			},
			tooltip_text = {
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				cursor_side = "left",
				max_width = 600,
				cursor_offset = {
					-10,
					-27
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255)
				},
				offset = {
					0,
					0,
					base_offset[3] + 20
				}
			},
			hotspot = {
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2],
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH,
					DROP_DOWN_WIDGET_SIZE[2]
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_size = 16,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3] + 10
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			arrow = {
				masked = true,
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - 31,
					base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2 - 7.5,
					base_offset[3] + 1
				},
				size = {
					31,
					15
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			arrow_hover = {
				masked = true,
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - 31,
					base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2 - 14 + 13,
					base_offset[3]
				},
				size = {
					31,
					28
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			arrow_hover_flipped = {
				masked = true,
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - 31,
					(base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2 - 14) - 12,
					base_offset[3]
				},
				size = {
					31,
					28
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			selected_option = {
				horizontal_alignment = "center",
				upper_case = true,
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + 2,
					base_offset[3] + 3
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 50)
			},
			selected_bg = {
				masked = true,
				offset = {
					(base_offset[1] + DROP_DOWN_WIDGET_SIZE[1]) - (INPUT_FIELD_WIDTH - 28),
					base_offset[2] - selected_bg_y,
					base_offset[3] + 20
				},
				size = {
					INPUT_FIELD_WIDTH - 56,
					selected_bg_y
				},
				color = {
					255,
					10,
					10,
					10
				}
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					DROP_DOWN_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					DROP_DOWN_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			size = table.clone(DROP_DOWN_WIDGET_SIZE),
			color = {
				50,
				255,
				255,
				255
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local STEPPER_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_stepper_widget(text, options, selected_option, tooltip_text, scenegraph_id, base_offset)
	local options_texts = {}
	local options_values = {}
	local num_options = #options

	for i = 1, num_options, 1 do
		options_texts[i] = options[i].text
		options_values[i] = options[i].value
	end

	base_offset[2] = base_offset[2] - STEPPER_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
						local selection_text = ui_content.options_texts[ui_content.current_selection]

						if selection_text ~= ui_content.selection_text then
							ui_content.selection_text = selection_text
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted
					end
				},
				{
					pass_type = "option_tooltip",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_showing_tooltip()
					end
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
						local left_hotspot = ui_content.left_hotspot
						local right_hotspot = ui_content.right_hotspot

						if left_hotspot.on_hover_enter then
							local on_hover_enter_callback = ui_content.on_hover_enter_callback

							if on_hover_enter_callback then
								on_hover_enter_callback("left_arrow_hover")
							end
						end

						if left_hotspot.on_hover_exit then
							local on_hover_exit_callback = ui_content.on_hover_exit_callback

							if on_hover_exit_callback then
								on_hover_exit_callback("left_arrow_hover")
							end
						end

						if left_hotspot.on_release then
							local on_pressed_callback = ui_content.on_pressed_callback

							if on_pressed_callback then
								on_pressed_callback("left_arrow")
								on_pressed_callback("left_arrow_hover")
							end
						end

						if right_hotspot.on_hover_enter then
							local on_hover_enter_callback = ui_content.on_hover_enter_callback

							if on_hover_enter_callback then
								on_hover_enter_callback("right_arrow_hover")
							end
						end

						if right_hotspot.on_hover_exit then
							local on_hover_exit_callback = ui_content.on_hover_exit_callback

							if on_hover_exit_callback then
								on_hover_exit_callback("right_arrow_hover")
							end
						end

						if right_hotspot.on_release then
							local on_pressed_callback = ui_content.on_pressed_callback

							if on_pressed_callback then
								on_pressed_callback("right_arrow")
								on_pressed_callback("right_arrow_hover")
							end
						end

						if left_hotspot.is_hover or right_hotspot.is_hover then
							ui_style.selection_text.text_color = ui_style.selection_text.highlight_color
						else
							ui_style.selection_text.text_color = ui_style.selection_text.default_color
						end
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "left_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "left_hotspot"
				},
				{
					style_id = "right_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "right_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow",
					pass_type = "texture",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow",
					pass_type = "texture_uv",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_hover",
					pass_type = "texture_uv",
					content_id = "arrow_hover"
				},
				{
					style_id = "selection_text",
					pass_type = "text",
					text_id = "selection_text",
					content_check_function = function (content)
						local selection_text = content.selection_text

						return selection_text and selection_text ~= ""
					end
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			left_arrow = "settings_arrow_normal",
			right_arrow_hover = "settings_arrow_clicked",
			right_arrow = "settings_arrow_normal",
			selection_text = "",
			highlight_texture = "playerlist_hover",
			rect_masked = "rect_masked",
			left_arrow_hover = "settings_arrow_clicked",
			left_hotspot = {},
			right_hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = text,
			arrow = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			arrow_hover = {
				texture_id = "settings_arrow_clicked",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			tooltip_text = tooltip_text,
			current_selection = selected_option,
			options_texts = options_texts,
			options_values = options_values,
			num_options = num_options,
			hotspot_content_ids = {
				"left_hotspot",
				"right_hotspot"
			}
		},
		style = {
			offset = table.clone(base_offset),
			size = table.clone(STEPPER_WIDGET_SIZE),
			highlight_texture = {
				upper_case = true,
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					STEPPER_WIDGET_SIZE[1],
					STEPPER_WIDGET_SIZE[2]
				}
			},
			tooltip_text = {
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				cursor_side = "left",
				max_width = 600,
				cursor_offset = {
					-10,
					-27
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255)
				},
				offset = {
					0,
					0,
					base_offset[3] + 20
				}
			},
			left_arrow = {
				masked = true,
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3] + 1
				},
				size = {
					19,
					27
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			left_arrow_hover = {
				masked = true,
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH + 6,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 17.5,
					base_offset[3]
				},
				size = {
					30,
					35
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			left_arrow_hotspot = {
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH / 2,
					27
				}
			},
			right_arrow = {
				masked = true,
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - 19,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3] + 1
				},
				size = {
					19,
					27
				},
				color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			right_arrow_hover = {
				masked = true,
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - 30 - 5,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 17.5,
					base_offset[3]
				},
				size = {
					30,
					35
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			right_arrow_hotspot = {
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH / 2,
					27
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_size = 16,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 2,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			selection_text = {
				font_size = 16,
				upper_case = true,
				horizontal_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + 2,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				highlight_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					STEPPER_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					STEPPER_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			input_field_background = {
				offset = {
					(base_offset[1] + STEPPER_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2],
					base_offset[3]
				},
				color = INPUT_FIELD_COLOR,
				size = {
					INPUT_FIELD_WIDTH,
					STEPPER_WIDGET_SIZE[2]
				}
			},
			color = {
				50,
				255,
				255,
				255
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local TITLE_WIDGET_SIZE = {
	list_size_x - 100,
	50
}

local function create_title_widget(text, optional_font_size, optional_text_color, optional_horizontal_alignment, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - TITLE_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			rect_masked = "rect_masked",
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = text
		},
		style = {
			offset = table.clone(base_offset),
			size = table.clone(TITLE_WIDGET_SIZE),
			text = {
				upper_case = true,
				localize = true,
				dynamic_font_size = true,
				font_type = "hell_shark_header_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3]
				},
				text_color = optional_text_color or Colors.get_color_table_with_alpha("font_title", 255),
				font_size = optional_font_size or 18,
				horizontal_alignment = optional_horizontal_alignment or "left",
				size = table.clone(TITLE_WIDGET_SIZE)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + TITLE_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					TITLE_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					TITLE_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			color = {
				50,
				255,
				255,
				255
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local TEXT_LINK_WIDGET_SIZE = {
	list_size_x - 100,
	50
}

local function create_text_link_widget(text, url, optional_font_size, optional_text_color, optional_horizontal_alignment, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - TEXT_LINK_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.hotspot.is_hover
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			rect_masked = "rect_masked",
			highlight_texture = "playerlist_hover",
			hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = text,
			url = url
		},
		style = {
			offset = table.clone(base_offset),
			size = table.clone(TEXT_LINK_WIDGET_SIZE),
			highlight_texture = {
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					TEXT_LINK_WIDGET_SIZE[1],
					TEXT_LINK_WIDGET_SIZE[2]
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_type = "hell_shark_header_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3]
				},
				text_color = optional_text_color or Colors.get_color_table_with_alpha("font_title", 255),
				font_size = optional_font_size or 18,
				horizontal_alignment = optional_horizontal_alignment or "left",
				size = table.clone(TEXT_LINK_WIDGET_SIZE)
			},
			text_hover = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_type = "hell_shark_header_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3]
				},
				text_color = optional_text_color or Colors.get_color_table_with_alpha("font_default", 255),
				font_size = optional_font_size or 18,
				horizontal_alignment = optional_horizontal_alignment or "left",
				size = table.clone(TEXT_LINK_WIDGET_SIZE)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + TEXT_LINK_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					TEXT_LINK_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					TEXT_LINK_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			color = {
				50,
				255,
				255,
				255
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

local OPTION_WIDGET_SIZE = {
	list_size_x - 100,
	50
}

local function create_option_widget(ui_renderer, text, options, selected_option, tooltip_text, scenegraph_id, base_offset)
	local options_texts = {}
	local options_values = {}
	local num_options = #options

	for i = 1, num_options, 1 do
		options_texts[i] = options[i].text
		options_values[i] = options[i].value
	end

	base_offset[2] = base_offset[2] - OPTION_WIDGET_SIZE[2]
	local passes = {}
	local element = {
		passes = passes
	}
	local content = {}
	local style = {}
	local definition = {
		element = element,
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}
	passes[#passes + 1] = {
		pass_type = "local_offset",
		offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
			local current_selection = ui_content.current_selection

			if current_selection ~= ui_content.local_selection then
				ui_content.local_selection = current_selection
				local num_options = ui_content.num_options

				for i = 1, num_options, 1 do
					local option_background_id = "option_" .. i
					local option_text_id = "option_text_" .. i
					local is_selected = i == current_selection
					ui_content[option_background_id].is_selected = is_selected
					ui_style[option_text_id].text_color = (is_selected and ui_style[option_text_id].highlight_color) or ui_style[option_text_id].default_color
				end
			end
		end
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "highlight_texture",
		texture_id = "highlight_texture",
		content_check_function = function (content)
			return content.is_highlighted
		end
	}
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = "highlight_hotspot"
	}
	passes[#passes + 1] = {
		pass_type = "option_tooltip",
		text_id = "tooltip_text",
		content_check_function = function (ui_content)
			return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_showing_tooltip()
		end
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "bottom_edge",
		texture_id = "rect_masked"
	}
	passes[#passes + 1] = {
		style_id = "text",
		pass_type = "text",
		text_id = "text"
	}
	passes[#passes + 1] = {
		pass_type = "rect",
		content_check_function = function (content)
			return DEBUG_WIDGETS
		end
	}
	passes[#passes + 1] = {
		pass_type = "border",
		content_check_function = function (content, style)
			if DEBUG_WIDGETS then
				style.thickness = 1
			end

			return DEBUG_WIDGETS
		end
	}
	passes[#passes + 1] = {
		style_id = "debug_middle_line",
		pass_type = "rect",
		content_check_function = function (content)
			return DEBUG_WIDGETS
		end
	}
	content.text = text
	content.tooltip_text = tooltip_text
	content.current_selection = selected_option
	content.options_texts = options_texts
	content.options_values = options_values
	content.num_options = num_options
	content.highlight_hotspot = {
		allow_multi_hover = true
	}
	content.highlight_texture = "playerlist_hover"
	content.rect_masked = "rect_masked"
	local hotspot_content_ids = {}
	content.hotspot_content_ids = hotspot_content_ids
	style.offset = table.clone(base_offset)
	style.size = table.clone(OPTION_WIDGET_SIZE)
	style.highlight_texture = {
		upper_case = true,
		masked = true,
		offset = {
			base_offset[1],
			base_offset[2],
			base_offset[3]
		},
		color = Colors.get_table("white"),
		size = {
			OPTION_WIDGET_SIZE[1],
			OPTION_WIDGET_SIZE[2]
		}
	}
	style.tooltip_text = {
		font_type = "hell_shark",
		localize = true,
		font_size = 24,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		cursor_side = "left",
		max_width = 600,
		cursor_offset = {
			-10,
			-27
		},
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		line_colors = {
			Colors.get_color_table_with_alpha("font_title", 255)
		},
		offset = {
			0,
			0,
			base_offset[3] + 20
		}
	}
	style.text = {
		upper_case = true,
		localize = true,
		dynamic_font = true,
		font_size = 22,
		font_type = "hell_shark_masked",
		offset = {
			base_offset[1] + 2,
			base_offset[2] + 5,
			base_offset[3]
		},
		text_color = Colors.get_color_table_with_alpha("font_default", 255)
	}
	style.debug_middle_line = {
		offset = {
			base_offset[1],
			(base_offset[2] + OPTION_WIDGET_SIZE[2] / 2) - 1,
			base_offset[3] + 10
		},
		size = {
			OPTION_WIDGET_SIZE[1],
			2
		},
		color = {
			200,
			0,
			255,
			0
		}
	}
	style.color = {
		50,
		255,
		255,
		255
	}
	style.bottom_edge = {
		offset = {
			base_offset[1],
			base_offset[2],
			base_offset[3] + 1
		},
		color = BOTTOM_EDGE_COLOR,
		size = {
			OPTION_WIDGET_SIZE[1],
			BOTTOM_EDGE_THICKNESS
		}
	}
	local options_spacing = 20
	local options_text_margin = 20
	local options_text_min_size = 120
	local option_start_offset = base_offset[1] + OPTION_WIDGET_SIZE[1]
	local options_total_length = -options_spacing

	for i = 1, num_options, 1 do
		local option_text = options[i].text
		local option_text_id = "option_text_" .. i
		passes[#passes + 1] = {
			pass_type = "text",
			style_id = option_text_id,
			text_id = option_text_id,
			content_change_function = function (content, style)
				local hotspot_content = content["option_" .. i]

				if not hotspot_content.is_selected then
					if hotspot_content.is_hover then
						style.text_color = Colors.get_color_table_with_alpha("font_default", 255)
					else
						style.text_color = Colors.get_color_table_with_alpha("font_title", 255)
					end
				end
			end
		}
		style[option_text_id] = {
			upper_case = true,
			horizontal_alignment = "center",
			font_size = 22,
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark_masked",
			size = {
				500,
				OPTION_WIDGET_SIZE[2]
			},
			offset = {
				option_start_offset - options_total_length,
				base_offset[2],
				base_offset[3] + 1
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			highlight_color = Colors.get_color_table_with_alpha("black", 255),
			default_color = Colors.get_color_table_with_alpha("font_title", 255)
		}
		content[option_text_id] = option_text

		if style[option_text_id].upper_case then
			option_text = TextToUpper(option_text)
		end

		local font, scaled_font_size = UIFontByResolution(style[option_text_id])
		local text_width, text_height, min = UIRenderer.text_size(ui_renderer, option_text, font[1], scaled_font_size)
		local option_text_length = math.max(text_width + options_text_margin, options_text_min_size)
		options_total_length = options_total_length + option_text_length + options_spacing
		style[option_text_id].size[1] = option_text_length
		style[option_text_id].offset[1] = option_start_offset - options_total_length
		local option_background_id = "option_" .. i
		passes[#passes + 1] = {
			pass_type = "hotspot",
			style_id = option_background_id,
			content_id = option_background_id
		}
		content[option_background_id] = {}
		passes[#passes + 1] = {
			texture_id = "rect_texture",
			pass_type = "texture",
			style_id = option_background_id,
			content_check_function = function (content)
				return content[option_background_id].is_selected
			end,
			content_change_function = function (content, style)
				local hotspot_content = content["option_" .. i]

				if hotspot_content.is_selected then
					if hotspot_content.is_hover then
						style.color = Colors.get_color_table_with_alpha("font_default", 255)
					else
						style.color = Colors.get_color_table_with_alpha("font_title", 255)
					end
				end
			end
		}
		content.rect_texture = "rect_masked"
		style[option_background_id] = {
			size = {
				option_text_length,
				OPTION_WIDGET_SIZE[2] - 10
			},
			offset = {
				option_start_offset - options_total_length,
				base_offset[2] + 5,
				base_offset[3]
			},
			color = Colors.get_color_table_with_alpha("font_title", 255)
		}
		hotspot_content_ids[#hotspot_content_ids + 1] = option_background_id
	end

	return UIWidget.init(definition)
end

local KEYBIND_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_keybind_widget(selected_key, keybind_description, actions, actions_info, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - KEYBIND_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot",
					content_check_function = function (content)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "hotspot",
					content_id = "highlight_hotspot",
					content_check_function = function (content)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "highlight_texture",
					texture_id = "highlight_texture",
					content_check_function = function (content)
						return content.is_highlighted and not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content, ui_renderer)
						local selected_key_style = ui_style.selected_key

						if ui_content.active or ui_content.highlight_hotspot.is_hover then
							selected_key_style.text_color = selected_key_style.hover_color
						else
							selected_key_style.text_color = selected_key_style.default_color
						end

						if ui_content.active then
							ui_content.active_t = ui_content.active_t + ui_renderer.dt * 2.5
							local i = math.sirp(0, 1, ui_content.active_t)
							ui_style.selected_rect.color[1] = i * 255
						else
							ui_style.selected_rect.color[1] = 255
						end
					end
				},
				{
					style_id = "selected_key",
					pass_type = "text",
					text_id = "selected_key",
					content_check_function = function (content)
						return not content.active
					end
				},
				{
					style_id = "selected_rect",
					pass_type = "rect",
					content_check_function = function (content)
						return content.active
					end
				},
				{
					pass_type = "texture",
					style_id = "input_field_background",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_background_2",
					texture_id = "rect_masked"
				},
				{
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				},
				{
					pass_type = "border",
					content_check_function = function (content, style)
						if DEBUG_WIDGETS then
							style.thickness = 1
						end

						return DEBUG_WIDGETS
					end
				},
				{
					style_id = "debug_middle_line",
					pass_type = "rect",
					content_check_function = function (content)
						return DEBUG_WIDGETS
					end
				}
			}
		},
		content = {
			rect_masked = "rect_masked",
			highlight_texture = "playerlist_hover",
			active_t = 0,
			hotspot = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = keybind_description or actions[1],
			actions = actions,
			actions_info = actions_info,
			selected_key = selected_key,
			hotspot_content_ids = {
				"hotspot"
			}
		},
		style = {
			offset = table.clone(base_offset),
			highlight_texture = {
				masked = true,
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3]
				},
				color = Colors.get_table("white"),
				size = {
					KEYBIND_WIDGET_SIZE[1],
					KEYBIND_WIDGET_SIZE[2]
				}
			},
			text = {
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_size = 16,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2,
					base_offset[2] + 5,
					base_offset[3] + 1
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			selected_key = {
				font_size = 16,
				upper_case = true,
				horizontal_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					(base_offset[1] + KEYBIND_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					base_offset[2] + 2,
					base_offset[3] + 5
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
			},
			selected_rect = {
				offset = {
					(base_offset[1] + KEYBIND_WIDGET_SIZE[1]) - (INPUT_FIELD_WIDTH - 2),
					(base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2) - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 2
				},
				size = {
					INPUT_FIELD_WIDTH - 2,
					KEYBIND_WIDGET_SIZE[2] - 10
				},
				color = Colors.get_color_table_with_alpha("font_default", 100)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					(base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2) - 1,
					base_offset[3] + 10
				},
				size = {
					KEYBIND_WIDGET_SIZE[1],
					2
				},
				color = {
					200,
					0,
					255,
					0
				}
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2],
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					KEYBIND_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			input_field_background = {
				offset = {
					(base_offset[1] + KEYBIND_WIDGET_SIZE[1]) - INPUT_FIELD_WIDTH,
					(base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2) - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 1
				},
				color = INPUT_FIELD_COLOR,
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10 + 2
				}
			},
			input_field_background_2 = {
				offset = {
					(base_offset[1] + KEYBIND_WIDGET_SIZE[1]) - (INPUT_FIELD_WIDTH - 2),
					(base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2) - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 2
				},
				color = {
					255,
					10,
					10,
					10
				},
				size = {
					INPUT_FIELD_WIDTH - 2,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
			},
			size = table.clone(KEYBIND_WIDGET_SIZE),
			color = {
				50,
				255,
				255,
				255
			}
		},
		scenegraph_id = scenegraph_id
	}

	return UIWidget.init(definition)
end

SettingsWidgetTypeTemplate = {
	drop_down = {
		input_function = function (widget, input_service)
			local content = widget.content
			local style = widget.style
			local list_content = content.list_content
			local list_style = style.list_style

			if content.active then
				if input_service:get("move_up") then
					local num_draws = list_style.num_draws
					local selected_index = nil

					for i = 1, num_draws, 1 do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							selected_index = i

							break
						end
					end

					if selected_index then
						if selected_index > 1 then
							list_content[selected_index].hotspot.is_selected = false
							list_content[selected_index - 1].hotspot.is_selected = true
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					return true
				elseif input_service:get("move_down") then
					local num_draws = list_style.num_draws
					local selected_index = nil

					for i = 1, num_draws, 1 do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							selected_index = i

							break
						end
					end

					if selected_index then
						if selected_index < num_draws then
							list_content[selected_index].hotspot.is_selected = false
							list_content[selected_index + 1].hotspot.is_selected = true
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					return true
				end
			end

			if input_service:get("confirm") then
				if not content.active then
					content.active = true
					list_style.active = true
				else
					content.active = false
					list_style.active = false
					local num_draws = list_style.num_draws
					local selected_index = nil

					for i = 1, num_draws, 1 do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							entry_hotspot.is_selected = false
							selected_index = i

							break
						end
					end

					if selected_index then
						content.current_selection = selected_index

						content:callback()
					end
				end

				return true, content.active
			end

			if content.active and input_service:get("back") then
				content.active = false
				list_style.active = false
				local num_draws = list_style.num_draws

				for i = 1, num_draws, 1 do
					local entry_hotspot = list_content[i].hotspot

					if entry_hotspot.is_selected then
						entry_hotspot.is_selected = false

						break
					end
				end

				return true, content.active
			end

			return content.active
		end,
		active_input_description = {
			ignore_generic_actions = true,
			name = "drop_down",
			gamepad_support = true,
			actions = {
				{
					input_action = "back",
					priority = 3,
					description_text = "input_description_back"
				},
				{
					input_action = "confirm",
					priority = 2,
					description_text = "input_description_confirm"
				}
			}
		}
	},
	checkbox = {
		input_function = function (widget, input_service)
			local content = widget.content

			if input_service:get("confirm") then
				content.hotspot.on_release = true

				return true
			end
		end,
		input_description = {
			name = "checkbox",
			gamepad_support = true,
			actions = {
				{
					input_action = "confirm",
					priority = 3,
					description_text = "input_description_toggle"
				}
			}
		}
	},
	option = {
		input_function = function (widget, input_service)
			local content = widget.content
			local num_options = content.num_options
			local current_selection = content.current_selection

			if input_service:get("move_left") then
				if current_selection > 1 then
					local new_selection_index = current_selection - 1
					content["option_" .. new_selection_index].on_release = true
				end

				return true
			elseif input_service:get("move_right") then
				if current_selection < num_options then
					local new_selection_index = current_selection + 1
					content["option_" .. new_selection_index].on_release = true
				end

				return true
			end
		end
	},
	keybind = {
		input_function = function (widget, input_service)
			local content = widget.content
			local style = widget.style

			if content.active and input_service:get("back", true) then
				content.controller_input_pressed = true

				return true
			end

			if content.active and (input_service:get("move_up") or input_service:get("move_down") or input_service:get("move_up_hold") or input_service:get("move_down_hold")) then
				return true
			end
		end,
		input_description = {
			name = "keybind",
			gamepad_support = true,
			actions = {}
		}
	},
	stepper = {
		input_function = function (widget, input_service)
			local content = widget.content

			if input_service:get("move_left") then
				content.controller_on_release_left = true

				return true
			elseif input_service:get("move_right") then
				content.controller_on_release_right = true

				return true
			end
		end
	},
	slider = {
		input_function = function (widget, input_service, dt)
			local content = widget.content
			local input_cooldown = content.input_cooldown
			local input_cooldown_multiplier = content.input_cooldown_multiplier
			local on_cooldown_last_frame = false

			if input_cooldown then
				on_cooldown_last_frame = true
				local new_cooldown = math.max(input_cooldown - dt, 0)
				input_cooldown = (new_cooldown > 0 and new_cooldown) or nil
				content.input_cooldown = input_cooldown
			end

			local internal_value = content.internal_value
			local num_decimals = content.num_decimals
			local min = content.min
			local max = content.max
			local diff = max - min
			local total_step = diff * 10^num_decimals
			local step = 1 / total_step
			local input_been_made = false

			if input_service:get("move_left_hold") then
				if not input_cooldown then
					content.internal_value = math.clamp(internal_value - step, 0, 1)
					input_been_made = true
				end
			elseif input_service:get("move_right_hold") and not input_cooldown then
				content.internal_value = math.clamp(internal_value + step, 0, 1)
				input_been_made = true
			end

			if input_been_made then
				content.changed = true

				if on_cooldown_last_frame then
					input_cooldown_multiplier = math.max(input_cooldown_multiplier - 0.1, 0.1)
					content.input_cooldown = 0.2 * math.ease_in_exp(input_cooldown_multiplier)
					content.input_cooldown_multiplier = input_cooldown_multiplier
				else
					input_cooldown_multiplier = 1
					content.input_cooldown = 0.2 * math.ease_in_exp(input_cooldown_multiplier)
					content.input_cooldown_multiplier = input_cooldown_multiplier
				end

				return true
			end
		end
	},
	image = {
		input_function = function ()
			return
		end,
		input_description = {
			name = "image",
			gamepad_support = true,
			actions = {}
		}
	},
	title = {
		input_function = function ()
			return
		end,
		input_description = {
			name = "title",
			gamepad_support = true,
			actions = {}
		}
	},
	text_link = {
		input_function = function ()
			return
		end,
		input_description = {
			name = "title",
			gamepad_support = true,
			actions = {}
		}
	},
	gamepad_layout = {
		input_function = function ()
			return
		end,
		input_description = {
			name = "gamepad_layout",
			gamepad_support = true,
			actions = {}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	background_widget_definitions = background_widget_definitions,
	gamepad_frame_widget_definitions = gamepad_frame_widget_definitions,
	widget_definitions = widget_definitions,
	button_definitions = button_definitions,
	scrollbar_definition = scrollbar_definition,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	create_title_widget = create_title_widget,
	create_checkbox_widget = create_checkbox_widget,
	create_slider_widget = create_slider_widget,
	create_drop_down_widget = create_drop_down_widget,
	create_stepper_widget = create_stepper_widget,
	create_option_widget = create_option_widget,
	create_text_link_widget = create_text_link_widget,
	create_keybind_widget = create_keybind_widget,
	create_simple_texture_widget = create_simple_texture_widget,
	create_gamepad_layout_widget = create_gamepad_layout_widget
}
