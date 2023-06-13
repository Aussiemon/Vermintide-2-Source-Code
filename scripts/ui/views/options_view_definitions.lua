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
	safe_rect = {
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
			0,
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
	keybind_info = {
		vertical_alignment = "top",
		parent = "background_bottom_panel",
		horizontal_alignment = "left",
		position = {
			30,
			-7,
			1
		},
		size = {
			1000,
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
	settings_button_9 = {
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

local function calculate_indent(indent_level)
	if indent_level then
		return 25 * indent_level
	else
		return 0
	end
end

local function create_safe_rect_widget(scenegraph_id)
	local extra_offset = {
		0,
		0
	}
	local border_size = {
		5,
		5
	}
	local widget = {
		scenegraph_id = "safe_rect",
		element = {
			passes = {
				{
					style_id = "bottom_left_triangle",
					pass_type = "triangle",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = border_size[1] + 1920 * safe_rect * 0.5
						style.offset[2] = border_size[2] + 1080 * safe_rect * 0.5
					end
				},
				{
					style_id = "bottom_right_triangle",
					pass_type = "triangle",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = -border_size[1] - 1920 * safe_rect * 0.5
						style.offset[2] = border_size[2] + 1080 * safe_rect * 0.5
					end
				},
				{
					style_id = "top_right_triangle",
					pass_type = "triangle",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = -border_size[1] - 1920 * safe_rect * 0.5
						style.offset[2] = -border_size[2] - 1080 * safe_rect * 0.5
					end
				},
				{
					style_id = "top_left_triangle",
					pass_type = "triangle",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = border_size[1] + 1920 * safe_rect * 0.5
						style.offset[2] = -border_size[2] - 1080 * safe_rect * 0.5
					end
				},
				{
					style_id = "left_line",
					pass_type = "rect",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = 1920 * safe_rect * 0.5
						style.offset[2] = border_size[1] + 1080 * safe_rect * 0.5
						style.texture_size[2] = 1080 - 1080 * safe_rect - border_size[2] * 2 - extra_offset[2]
					end
				},
				{
					style_id = "right_line",
					pass_type = "rect",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = -1920 * safe_rect * 0.5
						style.offset[2] = border_size[1] + 1080 * safe_rect * 0.5
						style.texture_size[2] = 1080 - 1080 * safe_rect - border_size[2] * 2 - extra_offset[2]
					end
				},
				{
					style_id = "top_line",
					pass_type = "rect",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = 1920 * safe_rect * 0.5
						style.offset[2] = -1080 * safe_rect * 0.5
						style.texture_size[1] = 1920 - 1920 * safe_rect - extra_offset[1]
					end
				},
				{
					style_id = "bottom_line",
					pass_type = "rect",
					content_change_function = function (content, style)
						local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
						style.offset[1] = 1920 * safe_rect * 0.5
						style.offset[2] = 1080 * safe_rect * 0.5
						style.texture_size[1] = 1920 - 1920 * safe_rect - extra_offset[1]
					end
				}
			}
		},
		content = {},
		style = {
			left_line = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					5,
					1080
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			right_line = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					5,
					1080
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			top_line = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					1920,
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			bottom_line = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					1920,
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			bottom_left_triangle = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				triangle_alignment = "bottom_left",
				texture_size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					500,
					500,
					0
				}
			},
			bottom_right_triangle = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				triangle_alignment = "bottom_right",
				texture_size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					500,
					500,
					0
				}
			},
			top_left_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				texture_size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					500,
					500,
					0
				}
			},
			top_right_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				triangle_alignment = "top_right",
				texture_size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					500,
					500,
					0
				}
			}
		},
		offset = {
			0,
			0,
			999
		}
	}

	return widget
end

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
						local gamepad_active = Managers.input:is_device_active("gamepad")
						local scroll_step = ui_content.scroll_step or 0.1
						local current_scroll_value = ui_content.internal_scroll_value

						if not gamepad_active and IS_XB1 then
							current_scroll_value = current_scroll_value + scroll_step * -scroll_axis.x * 0.01
						else
							current_scroll_value = current_scroll_value + scroll_step * -scroll_axis.y
						end

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
local widget_definitions = {
	keybind_info = UIWidgets.create_simple_text("Hello world", "keybind_info", nil, nil, {
		vertical_alignment = "center",
		font_type = "hell_shark",
		font_size = 24,
		horizontal_alignment = "left",
		text_color = Colors.get_color_table_with_alpha("font_default", 255)
	})
}
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
					base_offset[2] + CHECKBOX_WIDGET_SIZE[2] / 2 - 1,
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

	if IS_WINDOWS then
		definition = UIWidgets.create_gamepad_layout_win32(texture, texture_size, texture2, texture_size2, base_offset, scenegraph_id)
	elseif IS_XB1 then
		definition = UIWidgets.create_gamepad_layout_xb1(texture, texture_size, base_offset, scenegraph_id)
	elseif IS_PS4 then
		definition = UIWidgets.create_gamepad_layout_ps4(texture, texture_size, base_offset, scenegraph_id)
	end

	return UIWidget.init(definition)
end

local SLIDER_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_slider_widget(text, tooltip_text, scenegraph_id, base_offset, slider_image, slider_image_text)
	base_offset[2] = base_offset[2] - SLIDER_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "slider_box",
					texture_id = "rect_masked",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "disabled_slider_box",
					texture_id = "rect_masked",
					content_check_function = function (content)
						return content.disabled
					end
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
						return content.tooltip_text and content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
					end
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
						elseif IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not gamepad_active then
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
							ui_content:callback(ui_style.parent)
						end
					end,
					release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						ui_content:callback(ui_style.parent)
					end
				},
				{
					style_id = "slider_box_hotspot",
					pass_type = "hotspot",
					content_id = "hotspot",
					content_check_function = function (content)
						return not content.parent.disabled
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
						slider_icon_style.offset[1] = base_offset_x + size_x - slider_icon_style.size[1] / 2
						slider_icon_hover_style.offset[1] = slider_icon_style.offset[1] + slider_icon_size[1] / 2 - slider_icon_hover_style.size[1] / 2

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
					text_id = "value_text",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					style_id = "disabled_value_text",
					pass_type = "text",
					text_id = "value_text",
					content_check_function = function (content)
						return content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "slider",
					texture_id = "slider",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "slider_hover",
					texture_id = "slider_hover",
					content_check_function = function (content)
						if content.disabled then
							return false
						end

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
					style_id = "slider_image_text",
					pass_type = "text",
					text_id = "slider_image_text",
					content_check_function = function (content)
						return content.slider_image_text ~= ""
					end
				},
				{
					style_id = "left_arrow",
					pass_type = "hotspot",
					content_id = "left_hotspot",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					style_id = "right_arrow",
					pass_type = "hotspot",
					content_id = "right_hotspot",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow",
					pass_type = "texture",
					content_id = "arrow",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow",
					pass_type = "texture_uv",
					content_id = "arrow",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_hover",
					pass_type = "texture_uv",
					content_id = "arrow_hover",
					content_check_function = function (content)
						return not content.parent.disabled
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
					end
				}
			}
		},
		content = {
			slider = "slider_thumb",
			internal_value = 0.5,
			rect_masked = "rect_masked",
			slider_hover = "slider_thumb_hover",
			value = 0.5,
			highlight_texture = "playerlist_hover",
			scenegraph_id = scenegraph_id,
			text = text,
			slider_image = slider_image and slider_image.slider_image or "",
			slider_image_text = slider_image_text and slider_image_text.text or "",
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
				base_offset[2] - (slider_image and slider_image.size[2] or 0),
				base_offset[3]
			},
			size = {
				SLIDER_WIDGET_SIZE[1],
				SLIDER_WIDGET_SIZE[2] + (slider_image and slider_image.size[2] or 0)
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 30,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 4,
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
			disabled_slider_box = {
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 30,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 4,
					base_offset[3] + 10
				},
				size = {
					INPUT_FIELD_WIDTH - 112,
					10
				},
				color = {
					255,
					20,
					20,
					20
				}
			},
			slider_box_hotspot = {
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 19,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 13.5,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 12.5,
					base_offset[3] + 15
				},
				size = {
					34,
					25
				}
			},
			input_field_background = {
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 50 - 2,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - (SLIDER_WIDGET_SIZE[2] - 10) / 2,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 50,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - (SLIDER_WIDGET_SIZE[2] - 10) / 2,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 25,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - (SLIDER_WIDGET_SIZE[2] - 10) / 2 - 2,
					base_offset[3] + 2
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			disabled_value_text = {
				font_size = 16,
				upper_case = true,
				localize = false,
				horizontal_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 25,
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - (SLIDER_WIDGET_SIZE[2] - 10) / 2 - 2,
					base_offset[3] + 2
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 50),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					base_offset[2] + SLIDER_WIDGET_SIZE[2] / 2 - 1,
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
				color = slider_image and slider_image.color or nil,
				size = slider_image and slider_image.size or {
					0,
					0
				},
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - (slider_image and slider_image.size[1] or 0),
					base_offset[2] - (slider_image and slider_image.size[2] or 0),
					base_offset[3] + 15
				}
			},
			slider_image_text = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				offset = {
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - (slider_image and slider_image.size[1] or 0) + 5,
					base_offset[2] - (slider_image and slider_image.size[2] / 2 or 0),
					base_offset[3] + 16
				},
				text_color = slider_image_text and slider_image_text.color or Colors.get_color_table_with_alpha("font_default", 255),
				upper_case = slider_image_text and slider_image_text.upper_case or false,
				font_type = slider_image_text and slider_image_text.font or "hell_shark_masked",
				font_size = slider_image_text and slider_image_text.font_size or 16,
				localize = slider_image_text and slider_image_text.localize or false
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 6,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 19 - 52,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - 30 - 52 - 5,
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
					base_offset[1] + SLIDER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH / 2,
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
	base_offset[2] = base_offset[2] - SLIDER_WIDGET_SIZE[2] - (slider_image and slider_image.size[2] or 0)

	return UIWidget.init(definition)
end

local DROP_DOWN_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_drop_down_widget(text, options, selected_option, tooltip_text, disabled_tooltip_text, scenegraph_id, base_offset, indent_level, ignore_upper_case)
	local options_texts = {}
	local options_values = {}
	local options_n = #options

	for i = 1, options_n do
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
	local max_draw_count = math.min(options_n, 10)
	local selected_bg_y = item_size[2] * max_draw_count
	local using_scrollbar = max_draw_count < options_n

	if using_scrollbar then
		item_size[1] = item_size[1] - 25
	end

	for i = 1, options_n do
		local content = {
			selected = false,
			highlight_texture = "playerlist_hover",
			hotspot = {},
			text = options_texts[i]
		}
		local style = {
			text = {
				horizontal_alignment = "center",
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark",
				offset = {
					0,
					0,
					25
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 75),
				upper_case = not ignore_upper_case,
				size = item_size
			},
			highlight_texture = {
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

	local pi = math.pi
	local definition = {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_change_function = function (content, style)
						if content.disabled then
							style.text_color = style.disabled_color
						else
							style.text_color = style.default_color
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
						if ui_content.disabled then
							return false
						end

						return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "option_tooltip",
					text_id = "disabled_tooltip_text",
					content_check_function = function (ui_content)
						if not ui_content.disabled then
							return false
						end

						return ui_content.disabled_tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
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

								if hotspot.disabled then
									text_style.text_color = text_style.disabled_color
								elseif hotspot.is_selected then
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
								local hotspot = content.hotspot

								if hotspot.disabled then
									return false
								end

								return hotspot.is_hover or Managers.input:is_device_active("gamepad") and hotspot.is_selected
							end
						}
					}
				},
				{
					style_id = "selected_bg",
					pass_type = "rect",
					content_check_function = function (content, style)
						return content.active
					end
				},
				{
					style_id = "selected_bg_shade",
					pass_type = "rect",
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
			using_scrollbar = using_scrollbar,
			hotspot = {},
			highlight_hotspot = {},
			list_content = item_contents,
			text = text,
			selected_option = options_texts[selected_option],
			current_selection = selected_option,
			options_texts = options_texts,
			options_values = options_values,
			tooltip_text = tooltip_text,
			disabled_tooltip_text = disabled_tooltip_text or tooltip_text,
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
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 28,
					base_offset[2] - item_size[2],
					base_offset[3] + 5
				},
				num_draws = max_draw_count,
				total_draws = options_n,
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
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
					base_offset[2],
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH,
					DROP_DOWN_WIDGET_SIZE[2]
				}
			},
			text = {
				font_size = 16,
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2 + calculate_indent(indent_level),
					base_offset[2] + 5,
					base_offset[3] + 10
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 50)
			},
			arrow = {
				masked = true,
				offset = {
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - 31,
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
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - 31,
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
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - 31,
					base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2 - 14 - 12,
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
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + 2,
					base_offset[3] + 3
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 50),
				upper_case = not ignore_upper_case
			},
			selected_bg = {
				masked = true,
				offset = {
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - (INPUT_FIELD_WIDTH - 28),
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
			selected_bg_shade = {
				masked = true,
				offset = {
					base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - (INPUT_FIELD_WIDTH - 28) - 2,
					base_offset[2] - (selected_bg_y + 2),
					base_offset[3] + 19
				},
				size = {
					INPUT_FIELD_WIDTH - 56 + 4,
					selected_bg_y + 2
				},
				color = {
					255,
					80,
					80,
					80
				}
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					base_offset[2] + DROP_DOWN_WIDGET_SIZE[2] / 2 - 1,
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

	if using_scrollbar then
		local thumbnail_fraction = (options_n - max_draw_count) / options_n
		local thumbnail_height = selected_bg_y * thumbnail_fraction
		local total_scroll_distance = selected_bg_y - thumbnail_height
		local step_size = total_scroll_distance / (options_n - max_draw_count) - 1
		local hotspot_pass = {
			style_id = "thumbnail",
			pass_type = "hotspot",
			content_id = "thumbnail_hotspot",
			content_check_function = function (content)
				return content.parent.active
			end
		}
		local held_pass = {
			style_id = "thumbnail",
			pass_type = "held",
			content_id = "thumbnail_hotspot",
			content_check_function = function (content)
				return content.parent.active
			end,
			held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local gamepad_active = Managers.input:is_device_active("gamepad")

				if gamepad_active then
					return
				end

				local thumbnail_fraction = ui_content.thumbnail_fraction
				local thumbnail_length = ui_content.thumbnail_length
				local scroll_length = ui_content.scroll_length
				local parent_style = ui_style.parent
				local parent_offest = parent_style.offset
				local default_offset_y = ui_style.default_offset_y
				local offset = ui_style.offset
				local axis = 2
				local base_cursor = input_service:get("cursor")
				local cursor = UIInverseScaleVectorToResolution(base_cursor)
				local cursor_y = cursor[axis]

				if not ui_content.cursor_y then
					ui_content.cursor_y = cursor_y
					ui_content.parent.dragging = true
				end

				local diff_y = cursor_y - ui_content.cursor_y
				ui_content.cursor_y = cursor_y
				local start_position = 0
				local end_position = scroll_length
				local current_position = default_offset_y - offset[axis] - diff_y
				current_position = math.clamp(current_position, start_position, end_position)
				local percentage = current_position / end_position
				local list_style = ui_style.parent.list_style
				local num_draws = list_style.num_draws
				local total_draws = list_style.total_draws
				local draw_amount_diff = total_draws - num_draws
				local step_percent = 1 / draw_amount_diff
				local steps_scrolled = math.floor(percentage / step_percent)
				list_style.start_index = steps_scrolled + 1
				ui_content.scroll_progress = percentage
			end,
			release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.cursor_y = nil
				ui_content.parent.dragging = nil
			end
		}
		local pass = {
			style_id = "thumbnail",
			texture_id = "rect_masked",
			pass_type = "texture",
			content_check_function = function (content, style)
				return content.active
			end,
			content_change_function = function (content, style)
				local default_offset_y = style.default_offset_y
				local offset = style.offset
				local step_size = style.step_size
				local size = style.size
				local axis = 2
				local hotspot = content.thumbnail_hotspot
				local scroll_progress = hotspot.scroll_progress
				local scroll_length = hotspot.scroll_length
				local thumb_length = hotspot.thumbnail_length
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = scroll_length * scroll_progress
				offset[axis] = default_offset_y - current_position
			end
		}
		local style = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			step_size = step_size,
			default_offset_y = base_offset[2] - thumbnail_height,
			offset = {
				base_offset[1] + DROP_DOWN_WIDGET_SIZE[1] - 50,
				base_offset[2] - thumbnail_height,
				base_offset[3] + 25
			},
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				20,
				thumbnail_height
			},
			texture_size = {
				5,
				thumbnail_height
			}
		}
		definition.element.passes[#definition.element.passes + 1] = pass
		definition.element.passes[#definition.element.passes + 1] = held_pass
		definition.element.passes[#definition.element.passes + 1] = hotspot_pass
		definition.content.thumbnail_hotspot = {
			scroll_progress = 0,
			thumbnail_fraction = thumbnail_fraction,
			thumbnail_length = thumbnail_height,
			scroll_length = total_scroll_distance,
			scenegraph_id = scenegraph_id
		}
		definition.style.thumbnail = style
	end

	return UIWidget.init(definition)
end

local STEPPER_WIDGET_SIZE = {
	list_size_x - 100,
	30
}

local function create_stepper_widget(text, options, selected_option, tooltip_text, disabled_tooltip_text, scenegraph_id, base_offset, indent_level)
	local options_texts = {}
	local options_values = {}
	local num_options = #options

	for i = 1, num_options do
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
					content_id = "highlight_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
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
						return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
					end,
					content_change_function = function (ui_content)
						if ui_content.disabled then
							ui_content.tooltip_text = ui_content.tooltip_text_disabled
						else
							ui_content.tooltip_text = ui_content.tooltip_text_enabled
						end
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

						if ui_content.disabled then
							ui_style.selection_text.text_color = ui_style.selection_text.disabled_color
						elseif left_hotspot.is_hover or right_hotspot.is_hover then
							ui_style.selection_text.text_color = ui_style.selection_text.highlight_color
						else
							ui_style.selection_text.text_color = ui_style.selection_text.default_color
						end
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_change_function = function (content, style)
						if content.disabled then
							style.text_color = style.disabled_color
						else
							style.text_color = style.default_color
						end
					end
				},
				{
					style_id = "left_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "left_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					style_id = "right_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "right_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow",
					pass_type = "texture",
					content_id = "arrow",
					content_check_function = function (content)
						return not content.parent.disabled
					end
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow",
					pass_type = "texture_uv",
					content_id = "arrow",
					content_check_function = function (content)
						return not content.parent.disabled
					end
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
			left_arrow_hover = "settings_arrow_clicked",
			right_arrow = "settings_arrow_normal",
			selection_text = "",
			highlight_texture = "playerlist_hover",
			rect_masked = "rect_masked",
			disabled = false,
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
			tooltip_text_enabled = tooltip_text,
			tooltip_text_disabled = disabled_tooltip_text or tooltip_text,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH + 6,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - 19,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - 30 - 5,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 13.5,
					base_offset[3]
				},
				size = {
					INPUT_FIELD_WIDTH / 2,
					27
				}
			},
			text = {
				font_size = 16,
				upper_case = true,
				localize = true,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + 2 + calculate_indent(indent_level),
					base_offset[2] + 2,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 50)
			},
			selection_text = {
				upper_case = true,
				font_size = 16,
				horizontal_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH / 2,
					base_offset[2] + 2,
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				highlight_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				disabled_color = Colors.get_color_table_with_alpha("font_default", 50)
			},
			debug_middle_line = {
				offset = {
					base_offset[1],
					base_offset[2] + STEPPER_WIDGET_SIZE[2] / 2 - 1,
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
					base_offset[1] + STEPPER_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
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
					base_offset[2] + TITLE_WIDGET_SIZE[2] / 2 - 1,
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
				size = table.clone(TEXT_LINK_WIDGET_SIZE)
			},
			text_hover = {
				upper_case = true,
				localize = true,
				dynamic_font_size = true,
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
					base_offset[2] + TEXT_LINK_WIDGET_SIZE[2] / 2 - 1,
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

	for i = 1, num_options do
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

				for i = 1, num_options do
					local option_background_id = "option_" .. i
					local option_text_id = "option_text_" .. i
					local is_selected = i == current_selection
					ui_content[option_background_id].is_selected = is_selected
					ui_style[option_text_id].text_color = is_selected and ui_style[option_text_id].highlight_color or ui_style[option_text_id].default_color
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
			return ui_content.tooltip_text and ui_content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
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
			base_offset[2] + OPTION_WIDGET_SIZE[2] / 2 - 1,
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

	for i = 1, num_options do
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

local function create_keybind_widget(selected_key_1, selected_key_2, keybind_description, actions, actions_info, scenegraph_id, base_offset)
	base_offset[2] = base_offset[2] - KEYBIND_WIDGET_SIZE[2]
	local definition = {
		element = {
			passes = {
				{
					style_id = "hotspot_1",
					pass_type = "hotspot",
					content_id = "hotspot_1",
					content_check_function = function (content)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "hotspot_2",
					pass_type = "hotspot",
					content_id = "hotspot_2",
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
					style_id = "selected_key_1",
					pass_type = "text",
					text_id = "selected_key_1",
					content_check_function = function (content)
						return not content.active_1
					end,
					content_change_function = function (ui_content, selected_key_style)
						if ui_content.active_1 or ui_content.hotspot_1.is_hover then
							selected_key_style.text_color = selected_key_style.hover_color
						elseif ui_content.is_unassigned_1 then
							selected_key_style.text_color = selected_key_style.unassigned_color
						else
							selected_key_style.text_color = selected_key_style.default_color
						end

						if ui_content.active_1 then
							ui_content.active_t = ui_content.active_t + ui_renderer.dt * 2.5
							local i = math.sirp(0, 1, ui_content.active_t)
							selected_key_style.parent.selected_rect_1.color[1] = i * 255
						else
							selected_key_style.parent.selected_rect_1.color[1] = 255
						end
					end
				},
				{
					style_id = "selected_key_2",
					pass_type = "text",
					text_id = "selected_key_2",
					content_check_function = function (content)
						return not content.active_2
					end,
					content_change_function = function (ui_content, selected_key_style)
						if ui_content.active_2 or ui_content.hotspot_2.is_hover then
							selected_key_style.text_color = selected_key_style.hover_color
						elseif ui_content.is_unassigned_2 then
							selected_key_style.text_color = selected_key_style.unassigned_color
						else
							selected_key_style.text_color = selected_key_style.default_color
						end

						if ui_content.active_2 then
							ui_content.active_t = ui_content.active_t + ui_renderer.dt * 2.5
							local i = math.sirp(0, 1, ui_content.active_t)
							selected_key_style.parent.selected_rect_2.color[1] = i * 255
						else
							selected_key_style.parent.selected_rect_2.color[1] = 255
						end
					end
				},
				{
					style_id = "selected_rect_1",
					pass_type = "rect",
					content_check_function = function (content)
						return content.active_1
					end
				},
				{
					style_id = "selected_rect_2",
					pass_type = "rect",
					content_check_function = function (content)
						return content.active_2
					end
				},
				{
					pass_type = "texture",
					style_id = "input_field_1_background_bevel",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_1_background",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_2_background_bevel",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "input_field_2_background",
					texture_id = "rect_masked"
				}
			}
		},
		content = {
			active_t = 0,
			rect_masked = "rect_masked",
			highlight_texture = "playerlist_hover",
			hotspot_1 = {},
			hotspot_2 = {},
			highlight_hotspot = {
				allow_multi_hover = true
			},
			text = keybind_description or actions[1],
			actions = actions,
			actions_info = actions_info,
			selected_key_1 = selected_key_1,
			selected_key_2 = selected_key_2,
			hotspot_content_ids = {
				"hotspot_1",
				"hotspot_2"
			}
		},
		style = {
			offset = table.clone(base_offset),
			hotspot_1 = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - 2 * (20 + INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 2
				},
				area_size = {
					INPUT_FIELD_WIDTH - 2,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
			},
			hotspot_2 = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - (INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 2
				},
				area_size = {
					INPUT_FIELD_WIDTH - 2,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
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
			selected_key_1 = {
				upper_case = true,
				horizontal_alignment = "center",
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - 2 * (20 + INPUT_FIELD_WIDTH),
					base_offset[2] + 2,
					base_offset[3] + 5
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				unassigned_color = Colors.get_color_table_with_alpha("dim_gray", 255),
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
			},
			selected_key_2 = {
				upper_case = true,
				horizontal_alignment = "center",
				font_size = 16,
				dynamic_font = true,
				font_type = "hell_shark_masked",
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
					base_offset[2] + 2,
					base_offset[3] + 5
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				hover_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				unassigned_color = Colors.get_color_table_with_alpha("dim_gray", 255),
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10
				}
			},
			selected_rect_1 = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - 2 * (20 + INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 2
				},
				size = {
					INPUT_FIELD_WIDTH - 2,
					KEYBIND_WIDGET_SIZE[2] - 10
				},
				color = Colors.get_color_table_with_alpha("font_default", 100)
			},
			selected_rect_2 = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - (INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
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
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - 1,
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
			input_field_1_background_bevel = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - 2 * (20 + INPUT_FIELD_WIDTH),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 1
				},
				color = INPUT_FIELD_COLOR,
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10 + 2
				}
			},
			input_field_1_background = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - 2 * (20 + INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
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
			input_field_2_background_bevel = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - INPUT_FIELD_WIDTH,
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
					base_offset[3] + 1
				},
				color = INPUT_FIELD_COLOR,
				size = {
					INPUT_FIELD_WIDTH,
					KEYBIND_WIDGET_SIZE[2] - 10 + 2
				}
			},
			input_field_2_background = {
				offset = {
					base_offset[1] + KEYBIND_WIDGET_SIZE[1] - (INPUT_FIELD_WIDTH - 2),
					base_offset[2] + KEYBIND_WIDGET_SIZE[2] / 2 - (KEYBIND_WIDGET_SIZE[2] - 10) / 2,
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

local SORTED_LIST_WIDGET_WIDTH = list_size_x - 100
local SORTED_LIST_TITLE_TEXT_OFFSET = 28

local function create_sorted_list_widget(text, tooltip_text, item_contents, item_styles, item_size, item_content_change_function, scenegraph_id, base_offset)
	local num_items = #item_contents
	local PADDING = 10
	local SORTED_LIST_WIDGET_SIZE = {
		SORTED_LIST_WIDGET_WIDTH,
		num_items * item_size[2] + PADDING
	}
	local SORTED_LIST_BACKGROUND_HEIGHT = SORTED_LIST_WIDGET_SIZE[2] - PADDING
	local SORTED_LIST_ARROW_BACKGROUND_SIZE = {
		35,
		(SORTED_LIST_WIDGET_SIZE[2] - PADDING) / 2 - 2
	}
	base_offset[2] = base_offset[2] - SORTED_LIST_WIDGET_SIZE[2]
	local enabled_color = Colors.get_color_table_with_alpha("font_default", 255)
	local disabled_color = Colors.get_color_table_with_alpha("font_default", 100)
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
					style_id = "background",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "background_fg",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "arrow_buttons_edge_horizontal",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					pass_type = "texture",
					style_id = "arrow_buttons_edge_vertical",
					texture_id = "rect_masked",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
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
						return content.is_highlighted and Managers.input:is_device_active("gamepad") and not content.active
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "option_tooltip",
					text_id = "tooltip_text",
					content_check_function = function (content)
						return content.tooltip_text and content.highlight_hotspot.is_hover and not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "down_arrow_background",
					pass_type = "hotspot",
					content_id = "down_hotspot",
					content_check_function = function (content)
						return content.active
					end
				},
				{
					style_id = "up_arrow_background",
					pass_type = "hotspot",
					content_id = "up_hotspot",
					content_check_function = function (content)
						return content.active
					end
				},
				{
					pass_type = "texture",
					style_id = "down_arrow_background",
					texture_id = "rect_masked",
					content_check_function = function (content)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						local down_hotspot = content.down_hotspot

						return down_hotspot.active and down_hotspot.is_hover
					end
				},
				{
					texture_id = "texture_id",
					style_id = "down_arrow",
					pass_type = "texture",
					content_id = "arrow",
					content_check_function = function (content, style)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						local parent_content = content.parent
						local parent_style = style.parent
						local down_hotspot = parent_content.down_hotspot
						style.color = down_hotspot.active and parent_style.enabled_color or parent_style.disabled_color

						return true
					end
				},
				{
					pass_type = "texture",
					style_id = "up_arrow_background",
					texture_id = "rect_masked",
					content_check_function = function (content)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						local up_hotspot = content.up_hotspot

						return up_hotspot.active and up_hotspot.is_hover
					end
				},
				{
					texture_id = "texture_id",
					style_id = "up_arrow",
					pass_type = "texture_uv",
					content_id = "arrow",
					content_check_function = function (content, style)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						local parent_content = content.parent
						local parent_style = style.parent
						local up_hotspot = parent_content.up_hotspot
						style.color = up_hotspot.active and parent_style.enabled_color or parent_style.disabled_color

						return true
					end
				},
				{
					texture_id = "texture_id",
					style_id = "down_arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover",
					content_check_function = function (content)
						local parent_content = content.parent
						local down_hotspot = parent_content.down_hotspot

						return down_hotspot.active and down_hotspot.is_hover
					end
				},
				{
					texture_id = "texture_id",
					style_id = "up_arrow_hover",
					pass_type = "texture_uv",
					content_id = "arrow_hover",
					content_check_function = function (content)
						local parent_content = content.parent
						local up_hotspot = parent_content.up_hotspot

						return up_hotspot.active and up_hotspot.is_hover
					end
				},
				{
					style_id = "list_style",
					pass_type = "list_pass",
					content_id = "list_content",
					passes = {
						{
							pass_type = "hotspot",
							content_id = "hotspot"
						},
						{
							style_id = "texture",
							texture_id = "texture",
							pass_type = "texture",
							content_check_function = function (content)
								return not content.hotspot.is_hover and not content.hotspot.is_selected
							end,
							content_change_function = item_content_change_function
						},
						{
							style_id = "highlight_texture",
							texture_id = "highlight_texture",
							pass_type = "texture",
							content_check_function = function (content, style, index)
								return content.hotspot.is_hover or content.hotspot.is_selected
							end,
							content_change_function = item_content_change_function
						},
						{
							style_id = "background_highlight_texture",
							texture_id = "background_highlight_texture",
							pass_type = "texture",
							content_check_function = function (content, style, index)
								return content.hotspot.is_hover and not content.hotspot.is_selected
							end,
							content_change_function = item_content_change_function
						},
						{
							style_id = "background_selected_texture",
							texture_id = "background_highlight_texture",
							pass_type = "texture",
							content_check_function = function (content, style, index)
								return content.hotspot.is_selected
							end,
							content_change_function = item_content_change_function
						},
						{
							style_id = "index_text",
							pass_type = "text",
							text_id = "index_text",
							content_change_function = item_content_change_function
						},
						{
							style_id = "text",
							pass_type = "text",
							text_id = "text",
							content_change_function = item_content_change_function
						}
					}
				}
			}
		},
		content = {
			highlight_texture = "playerlist_hover",
			rect_masked = "rect_masked",
			text = text,
			tooltip_text = tooltip_text,
			up_hotspot = {
				active = false
			},
			down_hotspot = {
				active = false
			},
			highlight_hotspot = {
				allow_multi_hover = true
			},
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
				"up_hotspot",
				"down_hotspot"
			},
			list_content = item_contents
		},
		style = {
			offset = table.clone(base_offset),
			size = table.clone(SORTED_LIST_WIDGET_SIZE),
			color = {
				50,
				255,
				255,
				255
			},
			enabled_color = enabled_color,
			disabled_color = disabled_color,
			background = {
				offset = {
					base_offset[1] + 7 * SORTED_LIST_WIDGET_SIZE[1] / 10,
					base_offset[2] + PADDING / 2,
					base_offset[3]
				},
				color = INPUT_FIELD_COLOR,
				size = {
					3 * SORTED_LIST_WIDGET_SIZE[1] / 10,
					SORTED_LIST_BACKGROUND_HEIGHT
				}
			},
			background_fg = {
				offset = {
					base_offset[1] + 7 * SORTED_LIST_WIDGET_SIZE[1] / 10 + 2,
					base_offset[2] + PADDING / 2,
					base_offset[3] + 1
				},
				color = {
					255,
					10,
					10,
					10
				},
				size = {
					3 * SORTED_LIST_WIDGET_SIZE[1] / 10 - 2,
					SORTED_LIST_BACKGROUND_HEIGHT - 2
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
					base_offset[2] + SORTED_LIST_WIDGET_SIZE[2] - (SORTED_LIST_TITLE_TEXT_OFFSET + 4),
					base_offset[3]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
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
					base_offset[2] + SORTED_LIST_WIDGET_SIZE[2] - SORTED_LIST_TITLE_TEXT_OFFSET - 50,
					base_offset[3] + 20
				}
			},
			up_arrow = {
				masked = true,
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - (SORTED_LIST_ARROW_BACKGROUND_SIZE[1] + 31) / 2,
					base_offset[2] + 1.5 * SORTED_LIST_ARROW_BACKGROUND_SIZE[2] - 7.5 + PADDING / 2,
					base_offset[3] + 2
				},
				size = {
					31,
					15
				},
				color = enabled_color
			},
			up_arrow_hover = {
				masked = true,
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - (SORTED_LIST_ARROW_BACKGROUND_SIZE[1] + 31) / 2,
					base_offset[2] + 1.5 * SORTED_LIST_ARROW_BACKGROUND_SIZE[2] - 27 + PADDING / 2,
					base_offset[3] + 1
				},
				size = {
					31,
					28
				},
				color = enabled_color
			},
			up_arrow_background = {
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - SORTED_LIST_ARROW_BACKGROUND_SIZE[1],
					base_offset[2] + SORTED_LIST_ARROW_BACKGROUND_SIZE[2] + 2 + PADDING / 2,
					base_offset[3] + 1
				},
				color = {
					200,
					20,
					20,
					20
				},
				size = SORTED_LIST_ARROW_BACKGROUND_SIZE
			},
			arrow_buttons_edge_horizontal = {
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - SORTED_LIST_ARROW_BACKGROUND_SIZE[1] - 2,
					base_offset[2] + SORTED_LIST_ARROW_BACKGROUND_SIZE[2] + PADDING / 2,
					base_offset[3] + 1
				},
				color = INPUT_FIELD_COLOR,
				size = {
					SORTED_LIST_ARROW_BACKGROUND_SIZE[1],
					2
				}
			},
			arrow_buttons_edge_vertical = {
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - SORTED_LIST_ARROW_BACKGROUND_SIZE[1] - 2,
					base_offset[2] + PADDING / 2,
					base_offset[3] + 1
				},
				color = INPUT_FIELD_COLOR,
				size = {
					2,
					SORTED_LIST_BACKGROUND_HEIGHT
				}
			},
			down_arrow = {
				masked = true,
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - (SORTED_LIST_ARROW_BACKGROUND_SIZE[1] + 31) / 2,
					base_offset[2] + (SORTED_LIST_ARROW_BACKGROUND_SIZE[2] - 15) / 2 + PADDING / 2,
					base_offset[3] + 2
				},
				size = {
					31,
					15
				},
				color = enabled_color
			},
			down_arrow_hover = {
				masked = true,
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - (SORTED_LIST_ARROW_BACKGROUND_SIZE[1] + 31) / 2,
					base_offset[2] + SORTED_LIST_ARROW_BACKGROUND_SIZE[2] / 2 + PADDING / 2 - 1,
					base_offset[3] + 1
				},
				size = {
					31,
					28
				},
				color = enabled_color
			},
			down_arrow_background = {
				offset = {
					base_offset[1] + SORTED_LIST_WIDGET_SIZE[1] - SORTED_LIST_ARROW_BACKGROUND_SIZE[1],
					base_offset[2] + PADDING / 2,
					base_offset[3] + 1
				},
				color = {
					200,
					20,
					20,
					20
				},
				size = SORTED_LIST_ARROW_BACKGROUND_SIZE
			},
			bottom_edge = {
				offset = {
					base_offset[1],
					base_offset[2] - BOTTOM_EDGE_THICKNESS,
					base_offset[3] + 1
				},
				color = BOTTOM_EDGE_COLOR,
				size = {
					SORTED_LIST_WIDGET_SIZE[1],
					BOTTOM_EDGE_THICKNESS
				}
			},
			list_style = {
				active = true,
				start_index = 1,
				offset = {
					base_offset[1] + 7 * SORTED_LIST_WIDGET_SIZE[1] / 10 + 5,
					base_offset[2] + SORTED_LIST_WIDGET_SIZE[2] - item_size[2] - PADDING / 2,
					base_offset[3] + 5
				},
				num_draws = num_items,
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
					SORTED_LIST_WIDGET_SIZE[1],
					SORTED_LIST_WIDGET_SIZE[2]
				}
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
			local start_index = list_style.start_index
			local num_draws = list_style.num_draws
			local total_draws = list_style.total_draws
			local using_scrollbar = content.using_scrollbar
			local thumbnail_hotspot = content.thumbnail_hotspot

			if content.active then
				local selection_input_done = false

				if input_service:get("move_up_hold_continuous") then
					local selected_index = nil

					for i = 1, total_draws do
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

							if using_scrollbar and start_index >= selected_index - 1 then
								list_style.start_index = math.max(start_index - 1, 1)
							end
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					selection_input_done = true
				elseif input_service:get("move_down_hold_continuous") then
					local selected_index = nil

					for i = 1, total_draws do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							selected_index = i

							break
						end
					end

					if selected_index then
						if selected_index < total_draws then
							list_content[selected_index].hotspot.is_selected = false
							list_content[selected_index + 1].hotspot.is_selected = true

							if using_scrollbar and num_draws <= selected_index + 1 then
								list_style.start_index = math.min(start_index + 1, total_draws - num_draws + 1)
							end
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					selection_input_done = true
				end

				if selection_input_done then
					if using_scrollbar then
						local start_index = list_style.start_index
						local draw_amount_diff = total_draws - num_draws
						local scroll_percent = (start_index - 1) / draw_amount_diff
						thumbnail_hotspot.scroll_progress = scroll_percent
					end

					return true
				end
			end

			if input_service:get("confirm") then
				if not content.active then
					content.active = true
					list_style.active = true

					if not Managers.input:is_device_active("mouse") then
						local current_selection = content.current_selection

						if current_selection then
							local list_content_entry = list_content[current_selection]
							list_content_entry.hotspot.is_selected = true

							if using_scrollbar then
								local draw_amount_diff = total_draws - num_draws
								list_style.start_index = math.min(current_selection, draw_amount_diff)
								local start_index = list_style.start_index
								local scroll_percent = (start_index - 1) / draw_amount_diff
								thumbnail_hotspot.scroll_progress = scroll_percent
							end
						end
					end
				else
					content.active = false
					list_style.active = false
					local num_draws = list_style.num_draws
					local selected_index = nil

					for i = 1, total_draws do
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

				for i = 1, num_draws do
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
		input_description = {
			name = "drop_down",
			gamepad_support = true,
			actions = {
				{
					input_action = "confirm",
					priority = 3,
					description_text = "input_description_open"
				}
			}
		},
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
				},
				{
					input_action = "d_vertical",
					priority = 1,
					description_text = "input_description_change",
					ignore_keybinding = true
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
	sorted_list = {
		input_description = {
			name = "sorted_list",
			gamepad_support = true,
			actions = {
				{
					input_action = "confirm",
					priority = 2,
					description_text = "input_description_select"
				}
			}
		},
		active_input_description = {
			name = "sorted_list",
			gamepad_support = true,
			actions = {
				{
					input_action = "d_vertical",
					priority = 2,
					description_text = "input_description_select",
					ignore_keybinding = true
				},
				{
					input_action = "confirm",
					priority = 3,
					description_text = "input_description_move_to_top"
				}
			}
		},
		input_function = function (widget, input_service)
			local content = widget.content
			local list_content = content.list_content
			local style = widget.style
			local gamepad_active = Managers.input:is_device_active("gamepad")

			if not gamepad_active and content.active then
				content.controller_input_pressed = true
				content.active = false
				hotspot.is_selected = true
				local num_profiles = #list_content

				for i = 1, num_profiles do
					local entry_hotspot = list_content[i].hotspot
					entry_hotspot.is_selected = false
				end

				return true, content.active
			end

			if not content.active and input_service:get("confirm") then
				content.active = true
				content.controller_input_pressed = true
				local hotspot = list_content[1].hotspot
				hotspot.is_selected = true

				Managers.music:trigger_event("Play_hud_select")

				return true
			elseif content.active then
				if input_service:get("move_up") then
					local num_profiles = #list_content
					local selected_index = nil

					for i = 1, num_profiles do
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

							Managers.music:trigger_event("Play_hud_select")
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					return true
				elseif input_service:get("move_down") then
					local num_profiles = #list_content
					local selected_index = nil

					for i = 1, num_profiles do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							selected_index = i

							break
						end
					end

					if selected_index then
						if selected_index < num_profiles then
							list_content[selected_index].hotspot.is_selected = false
							list_content[selected_index + 1].hotspot.is_selected = true

							Managers.music:trigger_event("Play_hud_select")
						end
					else
						list_content[1].hotspot.is_selected = true
					end

					return true
				elseif input_service:get("back", true) then
					content.controller_input_pressed = true
					content.active = false
					local num_profiles = #list_content

					for i = 1, num_profiles do
						local entry_hotspot = list_content[i].hotspot
						entry_hotspot.is_selected = false
					end

					Managers.music:trigger_event("Play_hud_select")

					return true, content.active
				elseif input_service:get("confirm", true) then
					local selected_index = nil
					local num_profiles = #list_content

					for i = 1, num_profiles do
						local entry_hotspot = list_content[i].hotspot

						if entry_hotspot.is_selected then
							selected_index = i

							break
						end
					end

					if selected_index then
						local temp_content = list_content[selected_index]

						table.remove(list_content, selected_index)
						table.insert(list_content, 1, temp_content)
						content:callback(style)
						Managers.music:trigger_event("Play_hud_select")

						for idx, content in ipairs(list_content) do
							content.index_text = idx .. "."
						end
					end
				end

				return true, content.active
			end

			return false, content.active
		end
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
		end,
		input_description = {
			name = "stepper",
			gamepad_support = true,
			actions = {
				{
					input_action = "d_horizontal",
					priority = 2,
					description_text = "input_description_change",
					ignore_keybinding = true
				}
			}
		}
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
				input_cooldown = new_cooldown > 0 and new_cooldown or nil
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
		end,
		input_description = {
			name = "slider",
			gamepad_support = true,
			actions = {
				{
					input_action = "d_horizontal",
					priority = 2,
					description_text = "input_description_change",
					ignore_keybinding = true
				}
			}
		}
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
		input_function = function (widget, input_service)
			local content = widget.content
			content.controller_input_pressed = nil

			if input_service:get("confirm") then
				content.controller_input_pressed = true

				return true
			end
		end,
		input_description = {
			name = "title",
			gamepad_support = true,
			actions = {
				{
					input_action = "confirm",
					priority = 3,
					description_text = "input_description_open"
				}
			}
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
	create_title_widget = create_title_widget,
	create_checkbox_widget = create_checkbox_widget,
	create_slider_widget = create_slider_widget,
	create_drop_down_widget = create_drop_down_widget,
	create_stepper_widget = create_stepper_widget,
	create_option_widget = create_option_widget,
	create_text_link_widget = create_text_link_widget,
	create_keybind_widget = create_keybind_widget,
	create_sorted_list_widget = create_sorted_list_widget,
	create_simple_texture_widget = create_simple_texture_widget,
	create_gamepad_layout_widget = create_gamepad_layout_widget,
	create_safe_rect_widget = create_safe_rect_widget
}
