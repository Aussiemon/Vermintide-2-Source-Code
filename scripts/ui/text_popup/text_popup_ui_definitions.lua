local frame_settings_name = "menu_frame_11"
local frame_settings = UIFrameSettings[frame_settings_name]
local frame_thickness = frame_settings.texture_sizes.horizontal[2]
local content_top_padding = 18
local SIZE_X = 1920
local SIZE_Y = 1080
local window_size = {
	871,
	790
}
local window_inside_size = {
	window_size[2] - frame_thickness * 2,
	window_size[2] - frame_thickness * 2 - content_top_padding * 2
}
local scrollbar_size = {
	16,
	window_size[2] - 42
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.main_menu
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			window_size[1],
			window_size[2]
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	window_mask = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_inside_size[2] - content_top_padding
		},
		position = {
			0,
			0,
			0
		}
	},
	window_mask_top = {
		vertical_alignment = "top",
		parent = "window_mask",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			30
		},
		position = {
			0,
			20,
			1
		}
	},
	window_mask_bottom = {
		vertical_alignment = "bottom",
		parent = "window_mask",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			30
		},
		position = {
			0,
			-20,
			1
		}
	},
	text_entry = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = window_inside_size,
		position = {
			0,
			-(frame_thickness + content_top_padding),
			53
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			658,
			60
		},
		position = {
			0,
			34,
			46
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	},
	scrollbar = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = scrollbar_size,
		position = {
			-26,
			0,
			30
		}
	},
	ok_button = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			-16,
			42
		},
		size = {
			380,
			42
		}
	}
}
local text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 22,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = false,
	font_type = "hell_shark_masked",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		10
	}
}
local header_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		4,
		10
	}
}
local widget_definitions = {
	background = UIWidgets.create_background("background", scenegraph_definition.background.size, "menu_frame_bg_02"),
	screen = UIWidgets.create_simple_rect("screen", {
		100,
		0,
		0,
		0
	}),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, frame_settings_name, 20),
	window_mask = UIWidgets.create_simple_texture("mask_rect", "window_mask"),
	window_mask_bottom = UIWidgets.create_simple_rotated_texture("mask_rect_edge_fade", math.pi, {
		window_size[1] / 2,
		15
	}, "window_mask_bottom"),
	window_mask_top = UIWidgets.create_simple_texture("mask_rect_edge_fade", "window_mask_top"),
	overlay_text = UIWidgets.create_simple_text("", "text_entry", nil, nil, text_style),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, header_style),
	ok_button = UIWidgets.create_default_button("ok_button", scenegraph_definition.ok_button.size, nil, nil, Localize("button_ok"), 24, nil, "button_detail_04", 34, true),
	scrollbar = UIWidgets.create_chain_scrollbar("scrollbar", scenegraph_definition.scrollbar.size),
	scroll_content = {
		scenegraph_id = "window",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1

						if PLATFORM == "xb1" and GameSettingsDevelopment.allow_keyboard_mouse and not Managers.input:is_device_active("gamepad") then
							axis_input = math.sign(scroll_axis.x) * -1
						end

						local hotspot = ui_content.hotspot

						if axis_input ~= 0 and hotspot.is_hover then
							ui_content.axis_input = axis_input
							ui_content.scroll_add = axis_input * ui_content.scroll_amount
						else
							axis_input = ui_content.axis_input
						end

						local scroll_add = ui_content.scroll_add

						if scroll_add then
							local step = scroll_add * dt * 5
							scroll_add = scroll_add - step

							if math.abs(scroll_add) > 0 then
								ui_content.scroll_add = scroll_add
							else
								ui_content.scroll_add = nil
							end

							local current_scroll_value = ui_content.scroll_value
							ui_content.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
						end
					end
				}
			}
		},
		content = {
			scroll_amount = 0.1,
			scroll_value = 1,
			hotspot = {
				allow_multi_hover = true
			}
		},
		style = {}
	}
}
local generic_input_actions = {
	default = {
		{
			input_action = "left_stick",
			priority = 1,
			description_text = "input_description_scroll_details",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_close"
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	scroll_text_style = text_style,
	generic_input_actions = generic_input_actions
}
