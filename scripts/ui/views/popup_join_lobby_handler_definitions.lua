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
			UILayer.matchmaking
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			900,
			940
		},
		position = {
			0,
			10,
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			606,
			530
		},
		position = {
			0,
			60,
			3
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
			22
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
	window_sub_title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			500,
			50
		},
		position = {
			0,
			-75,
			3
		}
	},
	hero_info_panel = {
		vertical_alignment = "bottom",
		parent = "inner_window",
		horizontal_alignment = "left",
		size = {
			441,
			118
		},
		position = {
			205,
			-130,
			1
		}
	},
	hero_info_level_bg = {
		vertical_alignment = "center",
		parent = "hero_info_panel",
		horizontal_alignment = "left",
		size = {
			124,
			138
		},
		position = {
			-62,
			0,
			2
		}
	},
	info_career_name = {
		vertical_alignment = "top",
		parent = "hero_info_panel",
		horizontal_alignment = "left",
		size = {
			480,
			25
		},
		position = {
			76,
			-40,
			1
		}
	},
	info_hero_name = {
		vertical_alignment = "top",
		parent = "info_career_name",
		horizontal_alignment = "left",
		size = {
			480,
			25
		},
		position = {
			0,
			-16,
			1
		}
	},
	info_hero_level = {
		vertical_alignment = "center",
		parent = "hero_info_level_bg",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_root = {
		vertical_alignment = "top",
		parent = "inner_window",
		horizontal_alignment = "left",
		size = {
			110,
			130
		},
		position = {
			0,
			-100,
			1
		}
	},
	hero_icon_root = {
		vertical_alignment = "top",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			48,
			144
		},
		position = {
			0,
			100,
			1
		}
	},
	hero_icon_edge_left = {
		vertical_alignment = "center",
		parent = "hero_icon_root",
		horizontal_alignment = "center",
		size = {
			28,
			22
		},
		position = {
			-82,
			-10,
			1
		}
	},
	hero_icon_edge_right = {
		vertical_alignment = "center",
		parent = "hero_icon_root",
		horizontal_alignment = "center",
		size = {
			28,
			22
		},
		position = {
			578,
			-10,
			1
		}
	},
	timer_title_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			500,
			20
		},
		position = {
			-30,
			-20,
			1
		}
	},
	timer_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			500,
			20
		},
		position = {
			-30,
			-50,
			1
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			-170,
			40,
			3
		}
	},
	cancel_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			170,
			40,
			3
		}
	},
	center_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			0,
			40,
			3
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local window_sub_title_text_style = {
	font_size = 24,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local hero_career_style = {
	font_size = 40,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_style = {
	word_wrap = true,
	font_size = 30,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_style = {
	word_wrap = true,
	font_size = 52,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local timer_text_style = {
	font_size = 46,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local timer_title_text_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		1
	}
}

local function create_gamepad_button(input_action, text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				}
			}
		},
		content = {
			input_action = input_action,
			text = text or ""
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					34,
					34
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_hero_icon_widget(scenegraph_id, size)
	local icon_size = {
		80,
		80
	}

	return {
		element = {
			passes = {
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.selected
					end
				},
				{
					texture_id = "icon_selected",
					style_id = "icon_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.selected
					end
				},
				{
					texture_id = "holder",
					style_id = "holder",
					pass_type = "rotated_texture"
				}
			}
		},
		content = {
			icon = "hero_icon_large_bright_wizard",
			holder = "divider_vertical_hero_decoration",
			icon_selected = "hero_icon_large_bright_wizard"
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					200,
					80,
					80,
					80
				},
				offset = {
					0,
					40,
					1
				}
			},
			icon_selected = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					40,
					1
				}
			},
			holder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi / 2,
				pivot = {
					size[1] / 2,
					size[2] / 2
				},
				texture_size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_hero_widget(scenegraph_id, size)
	local frame_style = "menu_frame_12"
	local frame_settings = UIFrameSettings[frame_style]
	local hover_frame_style = "frame_outer_glow_01"
	local hover_frame_settings = UIFrameSettings[hover_frame_style]
	local hover_frame_width = hover_frame_settings.texture_sizes.horizontal[2]

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "portrait",
					style_id = "portrait",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "rect"
				},
				{
					texture_id = "lock_texture",
					style_id = "lock_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked
					end
				},
				{
					texture_id = "taken_texture",
					style_id = "taken_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.taken and not content.locked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "overlay",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_hover and not button_hotspot.is_selected and not content.locked
					end
				},
				{
					style_id = "overlay_locked",
					pass_type = "rect",
					content_check_function = function (content)
						return content.locked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				}
			}
		},
		content = {
			portrait = "icons_placeholder",
			locked = false,
			lock_texture = "hero_icon_locked",
			taken = false,
			taken_texture = "hero_icon_unavailable",
			button_hotspot = {},
			frame = frame_settings.texture,
			hover_frame = hover_frame_settings.texture
		},
		style = {
			rect = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			portrait = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			lock_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76,
					87
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
					5
				}
			},
			taken_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					112,
					112
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
					6
				}
			},
			overlay = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					80,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				}
			},
			overlay_locked = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			hover_frame = {
				size = {
					size[1] + hover_frame_width * 2,
					size[2] + hover_frame_width * 2
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-hover_frame_width,
					-hover_frame_width,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local hero_widget_definition = create_hero_widget("hero_root", scenegraph_definition.hero_root.size)
local hero_icon_widget_definition = create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size)
local disable_with_gamepad = true
local widget_definitions = {
	window = UIWidgets.create_background_with_frame("window", scenegraph_definition.window.size, "menu_frame_bg_02", "menu_frame_11"),
	window_shadow = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 1),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("join_popup_title"), "title_text", nil, nil, title_text_style),
	window_sub_title = UIWidgets.create_simple_text(Localize("join_popup_sub_title"), "window_sub_title", nil, nil, window_sub_title_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	cancel_button = UIWidgets.create_default_button("cancel_button", scenegraph_definition.cancel_button.size, nil, nil, Localize("input_description_cancel"), nil, nil, nil, nil, disable_with_gamepad),
	gamepad_select_button = create_gamepad_button("confirm", Localize("input_description_confirm"), "select_button"),
	gamepad_cancel_button = create_gamepad_button("back", Localize("input_description_cancel"), "cancel_button"),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	timer_text = UIWidgets.create_simple_text("00:00", "timer_text", nil, nil, timer_text_style),
	timer_title_text = UIWidgets.create_simple_text(Localize("join_popup_timer_title"), "timer_title_text", nil, nil, timer_title_text_style),
	hero_icon_edge_left = UIWidgets.create_simple_rotated_texture("divider_vertical_hero_end", math.pi / 2, {
		14,
		11
	}, "hero_icon_edge_left"),
	hero_icon_edge_right = UIWidgets.create_simple_rotated_texture("divider_vertical_hero_end", -math.pi / 2, {
		14,
		11
	}, "hero_icon_edge_right")
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	hero_widget_definition = hero_widget_definition,
	hero_icon_widget_definition = hero_icon_widget_definition
}
