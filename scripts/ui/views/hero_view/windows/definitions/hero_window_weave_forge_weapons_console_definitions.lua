local window_default_settings = UISettings.game_start_windows
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2]
}
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_default_settings = UISettings.game_start_windows
local wheel_scale = 1
local stats_list_size = {
	400,
	720
}
local weapon_list_size = {
	480,
	800
}
local weapon_entry_size = {
	390,
	80
}
window_frame_width = 0
window_size = {
	1920,
	1080
}
local scrollbar_size = {
	16,
	window_size[2] - (window_frame_width * 2 + 220)
}
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
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen_center = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	top_corner_left = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			110,
			137
		},
		position = {
			window_frame_width,
			-window_frame_width,
			8
		}
	},
	top_corner_right = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			110,
			137
		},
		position = {
			-window_frame_width,
			-window_frame_width,
			8
		}
	},
	viewport = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - window_frame_width * 2,
			window_size[2] - window_frame_width * 2
		},
		position = {
			0,
			window_frame_width,
			3
		}
	},
	viewport_panel = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			450,
			100
		},
		position = {
			0,
			50,
			3
		}
	},
	viewport_panel_divider = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			68,
			19
		},
		position = {
			0,
			0,
			1
		}
	},
	viewport_panel_divider_left = {
		vertical_alignment = "center",
		parent = "viewport_panel_divider",
		horizontal_alignment = "left",
		size = {
			55,
			19
		},
		position = {
			-166,
			0,
			0
		}
	},
	viewport_panel_divider_right = {
		vertical_alignment = "center",
		parent = "viewport_panel_divider",
		horizontal_alignment = "right",
		size = {
			55,
			19
		},
		position = {
			166,
			0,
			0
		}
	},
	panel_level_title = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			110,
			20
		},
		position = {
			-90,
			0,
			2
		}
	},
	panel_level_value = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			110,
			20
		},
		position = {
			-90,
			-30,
			2
		}
	},
	panel_power_title = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			110,
			20
		},
		position = {
			90,
			0,
			2
		}
	},
	panel_power_value = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			110,
			20
		},
		position = {
			90,
			-30,
			2
		}
	},
	viewport_title = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			450,
			50
		},
		position = {
			0,
			70,
			3
		}
	},
	viewport_sub_title = {
		vertical_alignment = "top",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			450,
			50
		},
		position = {
			0,
			40,
			3
		}
	},
	background_wheel = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(1029 * wheel_scale),
			math.floor(1029 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	wheel_ring_1 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(640 * wheel_scale),
			math.floor(640 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	wheel_ring_2 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(796 * wheel_scale),
			math.floor(797 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	wheel_ring_3 = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			math.floor(1029 * wheel_scale),
			math.floor(1029 * wheel_scale)
		},
		position = {
			0,
			0,
			1
		}
	},
	top_glow = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] + 140,
			600
		},
		position = {
			0,
			-window_frame_width,
			1
		}
	},
	top_glow_short = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] + 140,
			450
		},
		position = {
			0,
			-window_frame_width,
			1
		}
	},
	bottom_glow = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - window_frame_width * 2,
			600
		},
		position = {
			0,
			window_frame_width,
			1
		}
	},
	bottom_glow_short = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - window_frame_width * 2,
			200
		},
		position = {
			0,
			window_frame_width,
			1
		}
	},
	bottom_glow_shortest = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - window_frame_width * 2,
			100
		},
		position = {
			0,
			window_frame_width,
			1
		}
	},
	weapon_list_background = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			stats_list_size[1] + 80,
			window_size[2] - window_frame_width * 2
		},
		position = {
			window_frame_width,
			window_frame_width,
			3
		}
	},
	weapon_list_window = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = weapon_list_size,
		position = {
			60,
			180,
			3
		}
	},
	weapon_list_scrollbar = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = scrollbar_size,
		position = {
			window_frame_width + 20,
			0,
			10
		}
	},
	weapon_scroll_root = {
		vertical_alignment = "top",
		parent = "weapon_list_window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	weapon_list_entry = {
		vertical_alignment = "top",
		parent = "weapon_scroll_root",
		horizontal_alignment = "left",
		size = weapon_entry_size,
		position = {
			25,
			0,
			0
		}
	},
	stats_list_background = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			stats_list_size[1] + 80,
			window_size[2] - window_frame_width * 2
		},
		position = {
			-window_frame_width,
			window_frame_width,
			3
		}
	},
	stats_list_window = {
		vertical_alignment = "top",
		parent = "stats_list_background",
		horizontal_alignment = "center",
		size = stats_list_size,
		position = {
			-10,
			0,
			1
		}
	},
	stats_list_scrollbar = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = scrollbar_size,
		position = {
			-(window_frame_width + 20),
			0,
			10
		}
	},
	stats_scroll_root = {
		vertical_alignment = "top",
		parent = "stats_list_window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	stat_option = {
		vertical_alignment = "top",
		parent = "stats_scroll_root",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			15,
			-30,
			1
		}
	},
	equip_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			330,
			60
		},
		position = {
			115,
			100,
			1
		}
	},
	customize_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			330,
			60
		},
		position = {
			-115,
			100,
			1
		}
	},
	unlock_button = {
		vertical_alignment = "bottom",
		parent = "viewport_panel",
		horizontal_alignment = "center",
		size = {
			452,
			112
		},
		position = {
			0,
			0,
			2
		}
	},
	upgrade_bg = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			900,
			400
		},
		position = {
			0,
			10,
			11
		}
	},
	upgrade_text = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			600,
			50
		},
		position = {
			0,
			0,
			12
		}
	},
	upgrade_effect = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			1000,
			400
		},
		position = {
			0,
			0,
			11
		}
	}
}
local upgrade_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = false,
	font_size = 52,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = {
		180,
		0,
		0,
		0
	},
	offset = {
		0,
		0,
		2
	}
}
local panel_value_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 18,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local panel_value_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 38,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local viewport_title_text_style = {
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
		0,
		2
	}
}
local viewport_sub_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 22,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_weapon_entry_widget(scenegraph_id, size)
	local masked = true
	local frame_settings = UIFrameSettings.button_frame_02
	local frame_spacing = frame_settings.texture_sizes.horizontal[2]
	local shadow_frame_settings = UIFrameSettings.shadow_frame_02
	local shadow_frame_spacing = shadow_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_04
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local new_frame_settings = UIFrameSettings.frame_outer_glow_01
	local new_frame_spacing = new_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			style_id = "background",
			pass_type = "hotspot",
			content_id = "button_hotspot"
		},
		{
			style_id = "title",
			pass_type = "text",
			text_id = "title"
		},
		{
			style_id = "title_shadow",
			pass_type = "text",
			text_id = "title"
		},
		{
			style_id = "level_title",
			pass_type = "text",
			text_id = "level_title"
		},
		{
			style_id = "level_title_shadow",
			pass_type = "text",
			text_id = "level_title"
		},
		{
			style_id = "power_text",
			pass_type = "text",
			text_id = "power_text",
			content_check_function = function (content)
				return not content.locked
			end
		},
		{
			style_id = "power_text_shadow",
			pass_type = "text",
			text_id = "power_text",
			content_check_function = function (content)
				return not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "rect_masked"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
		},
		{
			pass_type = "texture",
			style_id = "icon_background",
			texture_id = "icon_background"
		},
		{
			pass_type = "texture",
			style_id = "lock_texture",
			texture_id = "lock_texture",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "equipped_frame_texture",
			texture_id = "equipped_frame_texture",
			content_check_function = function (content)
				return content.equipped
			end
		},
		{
			style_id = "new_frame",
			texture_id = "new_frame",
			pass_type = "texture_frame",
			content_check_function = function (content)
				local backend_id = content.backend_id

				return backend_id and ItemHelper.is_new_backend_id(backend_id)
			end,
			content_change_function = function (content, style)
				local progress = 0.5 + math.sin(Application.time_since_launch() * 5) * 0.5
				style.color[1] = 55 + progress * 200
				local button_hotspot = content.button_hotspot
				local backend_id = content.backend_id

				if button_hotspot.on_hover_enter and backend_id and ItemHelper.is_new_backend_id(backend_id) then
					ItemHelper.unmark_backend_id_as_new(backend_id)
				end
			end
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "shadow_frame",
			texture_id = "shadow_frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "item_frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame"
		}
	}
	local content = {
		equipped = false,
		locked = true,
		equipped_in_another_slot = false,
		icon_background = "icon_bg_magic",
		title = "",
		power_title = "",
		icon = "icon_huntsman_hat_0009",
		lock_texture = "hero_icon_locked",
		level_title = "",
		equipped_frame_texture = "item_icon_selection_wide",
		rect_masked = "rect_masked",
		power_text = "",
		new = false,
		button_hotspot = {},
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		shadow_frame = shadow_frame_settings.texture,
		new_frame = new_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		size = size
	}
	local style = {
		title = {
			localize = false,
			font_size = 28,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			hover_text_color = Colors.get_color_table_with_alpha("white", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				90,
				16,
				2
			},
			size = {
				size[1] - 100,
				size[2]
			}
		},
		title_shadow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			localize = false,
			font_size = 28,
			font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				92,
				14,
				1
			},
			size = {
				size[1] - 100,
				size[2]
			}
		},
		level_title = {
			localize = false,
			font_size = 20,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = {
				255,
				120,
				120,
				120
			},
			hover_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = {
				255,
				120,
				120,
				120
			},
			offset = {
				90,
				-16,
				2
			},
			size = {
				(size[1] - 100) / 2,
				size[2]
			}
		},
		level_title_shadow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			localize = false,
			font_size = 20,
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				92,
				-18,
				1
			},
			size = {
				(size[1] - 100) / 2,
				size[2]
			}
		},
		power_title = {
			localize = false,
			font_size = 20,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = {
				255,
				120,
				120,
				120
			},
			hover_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = {
				255,
				120,
				120,
				120
			},
			offset = {
				(size[1] - 100) / 2,
				-16,
				2
			},
			size = {
				(size[1] - 100) / 2,
				size[2]
			}
		},
		power_title_shadow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			localize = false,
			font_size = 20,
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				(size[1] - 100) / 2 + 2,
				-18,
				1
			},
			size = {
				(size[1] - 100) / 2,
				size[2]
			}
		},
		power_text = {
			localize = false,
			font_size = 32,
			horizontal_alignment = "right",
			vertical_alignment = "center",
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			hover_text_color = Colors.get_color_table_with_alpha("white", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-15,
				-2,
				2
			},
			size = size
		},
		power_text_shadow = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			localize = false,
			font_size = 32,
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				-13,
				-4,
				1
			},
			size = size
		},
		background = {
			masked = masked,
			size = {
				size[1],
				size[2]
			},
			color = {
				100,
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
		equipped_frame_texture = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				5
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				80,
				80
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
				2
			}
		},
		icon_background = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				80,
				80
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
				1
			}
		},
		lock_texture = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			masked = masked,
			texture_size = {
				45.6,
				52.199999999999996
			},
			color = {
				180,
				255,
				255,
				255
			},
			offset = {
				-8,
				0,
				4
			}
		},
		item_frame = {
			masked = masked,
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
				3
			},
			size = {
				80,
				80
			}
		},
		hover_frame = {
			masked = masked,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				7
			},
			size = {
				size[1],
				size[2]
			},
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing
			}
		},
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing
			},
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				12
			}
		},
		new_frame = {
			masked = masked,
			texture_size = new_frame_settings.texture_size,
			texture_sizes = new_frame_settings.texture_sizes,
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
			},
			size = {
				size[1],
				size[2]
			},
			frame_margins = {
				-new_frame_spacing,
				-new_frame_spacing
			}
		},
		shadow_frame = {
			masked = masked,
			texture_size = shadow_frame_settings.texture_size,
			texture_sizes = shadow_frame_settings.texture_sizes,
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				1
			},
			size = {
				size[1],
				size[2]
			},
			frame_margins = {
				-shadow_frame_spacing,
				-shadow_frame_spacing
			}
		},
		frame = {
			masked = masked,
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
			},
			size = {
				size[1],
				size[2]
			}
		}
	}
	local widget = {}
	local element = {
		passes = passes
	}
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20
	local element = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "hotspot"
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture"
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge"
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge"
			}
		}
	}
	local content = {
		mask_texture = "mask_rect",
		mask_edge = "mask_rect_edge_fade",
		hotspot = {
			allow_multi_hover = true
		}
	}
	local style = {
		mask = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				size[2]
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
		mask_top = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				fade_height,
				0
			}
		},
		mask_bottom = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				-fade_height,
				0
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2
			}
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

local function create_divider_option(size, scenegraph_id, masked, text)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			texture_id = "divider_01_top",
			text = text,
			size = size
		},
		style = {
			texture_id = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				masked = masked,
				size = {
					300,
					50
				},
				texture_size = {
					264,
					32
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-34,
					2
				}
			},
			text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					-14,
					3
				}
			},
			text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-16,
					2
				}
			}
		},
		offset = {
			35,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_property_option(size, scenegraph_id, masked, text, icon)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = text,
			texture_id = icon,
			size = size
		},
		style = {
			texture_id = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					50,
					50
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					2
				}
			},
			text = {
				font_size = 18,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				color_override = {},
				color_override_table = {
					start_index = 0,
					end_index = 0,
					color = Colors.get_color_table_with_alpha("corn_flower_blue", 255)
				},
				offset = {
					50,
					-23,
					3
				}
			},
			text_shadow = {
				font_size = 18,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					51,
					-24,
					2
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

local function create_trait_option(size, scenegraph_id, masked, title_text, description_text, icon)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			title_text = title_text,
			description_text = description_text,
			texture_id = icon,
			size = size
		},
		style = {
			texture_id = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-5,
					3
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-6,
					2
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-54,
					3
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-55,
					2
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

local function create_item_block_option(size, scenegraph_id, masked, angle)
	local angle_fraction = angle / (math.pi * 2)

	return {
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "arch_texture_1",
					texture_id = "arch_texture"
				},
				{
					pass_type = "rotated_texture",
					style_id = "arch_texture_2",
					texture_id = "arch_texture"
				},
				{
					pass_type = "texture",
					style_id = "slot_texture",
					texture_id = "slot_texture"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			slot_texture = "icon_block",
			title_text = Localize("menu_weave_forge_weapon_block_title"),
			description_text = Localize("menu_weave_forge_weapon_block_description"),
			arch_texture = (masked and "icon_block_arch_masked") or "icon_block_arch",
			size = size
		},
		style = {
			arch_texture_1 = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				angle = -angle / 2,
				pivot = {
					32,
					32
				},
				texture_size = {
					64,
					64
				},
				color = {
					255 * angle_fraction,
					255,
					255,
					255
				},
				offset = {
					-5,
					0,
					1
				}
			},
			arch_texture_2 = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				angle = angle / 2,
				pivot = {
					32,
					32
				},
				texture_size = {
					64,
					64
				},
				color = {
					255 * angle_fraction,
					255,
					255,
					255
				},
				offset = {
					-5,
					0,
					1
				}
			},
			slot_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					64,
					64
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-5,
					0,
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-5,
					3
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-6,
					2
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-54,
					3
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-55,
					2
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

local function create_item_stamina_option(size, scenegraph_id, masked, amount)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "shield_texture",
					texture_id = "shield_texture"
				},
				{
					style_id = "amount_text",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow_2",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow_3",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			shield_texture = "icon_stamina",
			amount_text = amount or "",
			title_text = Localize("menu_weave_forge_weapon_stamina_title"),
			description_text = Localize("menu_weave_forge_weapon_stamina_description"),
			size = size
		},
		style = {
			shield_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					56,
					60
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-2,
					0,
					2
				}
			},
			amount_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					50,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-20,
					-size[2] / 2,
					3
				}
			},
			amount_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					50,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-18,
					-(size[2] / 2),
					2
				}
			},
			amount_text_shadow_2 = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					50,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-20,
					-(size[2] / 2) + 2,
					2
				}
			},
			amount_text_shadow_3 = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					50,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-20,
					-(size[2] / 2 + 2),
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-5,
					3
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-6,
					2
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-54,
					3
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-55,
					2
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

local function create_item_keywords_option(size, scenegraph_id, masked, text)
	return {
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
				}
			}
		},
		content = {
			text = text or "",
			size = size
		},
		style = {
			text = {
				font_size = 18,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = {
					370,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("forest_green", 255),
				offset = {
					0,
					-size[2] / 2,
					3
				}
			},
			text_shadow = {
				font_size = 18,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = {
					370,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					1,
					-(size[2] / 2 + 1),
					2
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

local function create_item_overheat_option(size, scenegraph_id, masked)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "flame_texture",
					texture_id = "flame_texture"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			flame_texture = "icon_fire",
			title_text = Localize("menu_weave_forge_weapon_ammo_burn_title"),
			description_text = Localize("menu_weave_forge_weapon_ammo_burn_description"),
			size = size
		},
		style = {
			flame_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					46,
					61
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-5,
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-5,
					3
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-6,
					2
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-54,
					3
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-55,
					2
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

local function create_item_ammunition_option(size, scenegraph_id, masked, amount_text)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "ammunition_texture",
					texture_id = "ammunition_texture"
				},
				{
					style_id = "amount_text",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow_2",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "amount_text_shadow_3",
					pass_type = "text",
					text_id = "amount_text"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			ammunition_texture = "icon_ammo",
			amount_text = amount_text or "-",
			title_text = Localize("menu_weave_forge_weapon_ammo_regular_title"),
			description_text = Localize("menu_weave_forge_weapon_ammo_regular_description"),
			size = size
		},
		style = {
			ammunition_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = masked,
				texture_size = {
					68,
					36
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-12,
					-25,
					2
				}
			},
			amount_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					60,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-8,
					-size[2] / 2,
					3
				}
			},
			amount_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					60,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-6,
					-(size[2] / 2),
					2
				}
			},
			amount_text_shadow_2 = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					60,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-8,
					-(size[2] / 2) + 2,
					2
				}
			},
			amount_text_shadow_3 = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font_size = true,
				size = {
					60,
					size[2]
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-8,
					-(size[2] / 2 + 2),
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-5,
					3
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-6,
					2
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-54,
					3
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = false,
				size = {
					300,
					50
				},
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					61,
					-55,
					2
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

local masked = true
local top_hdr_widgets = {
	top_hdr_background_write_mask = UIWidgets.create_simple_texture("ui_write_mask", "window"),
	upgrade_bg = UIWidgets.create_simple_texture("weave_menu_athanor_upgrade_bg", "upgrade_bg")
}
local bottom_hdr_widgets = {
	upgrade_effect = UIWidgets.create_simple_texture("athanor_item_unlock", "upgrade_effect")
}
local bottom_widgets = {}
local top_widgets = {
	upgrade_text = UIWidgets.create_simple_text(Localize("menu_weave_weapon_forged_unlocked"), "upgrade_text", nil, nil, upgrade_title_style),
	viewport_panel_divider = UIWidgets.create_simple_texture("athanor_item_divider_middle", "viewport_panel_divider"),
	viewport_panel_divider_left = UIWidgets.create_simple_uv_texture("athanor_item_divider_edge", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "viewport_panel_divider_left"),
	viewport_panel_divider_right = UIWidgets.create_simple_texture("athanor_item_divider_edge", "viewport_panel_divider_right"),
	viewport_level_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_magic_level_title"), "panel_level_title", nil, nil, panel_value_title_style),
	viewport_level_value = UIWidgets.create_simple_text("0", "panel_level_value", nil, nil, panel_value_text_style),
	viewport_power_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_loadout_power_title"), "panel_power_title", nil, nil, panel_value_title_style),
	viewport_power_value = UIWidgets.create_simple_text("0", "panel_power_value", nil, nil, panel_value_text_style),
	viewport_title = UIWidgets.create_simple_text("", "viewport_title", nil, nil, viewport_title_text_style),
	viewport_sub_title = UIWidgets.create_simple_text("", "viewport_sub_title", nil, nil, viewport_sub_title_text_style),
	weapon_list_background = UIWidgets.create_rect_with_outer_frame("weapon_list_background", scenegraph_definition.weapon_list_background.size, "shadow_frame_02", nil, {
		100,
		0,
		0,
		0
	}, {
		255,
		0,
		0,
		0
	}),
	weapon_list_scrollbar = UIWidgets.create_chain_scrollbar("weapon_list_scrollbar", "weapon_list_window", scenegraph_definition.weapon_list_scrollbar.size),
	weapon_list_mask = create_list_mask("weapon_list_window", scenegraph_definition.weapon_list_window.size, 10),
	stats_list_background = UIWidgets.create_rect_with_outer_frame("stats_list_background", scenegraph_definition.stats_list_background.size, "shadow_frame_02", nil, {
		100,
		0,
		0,
		0
	}, {
		255,
		0,
		0,
		0
	}),
	stats_list_scrollbar = UIWidgets.create_chain_scrollbar("stats_list_scrollbar", "stats_list_window", scenegraph_definition.stats_list_scrollbar.size),
	stats_list_mask = create_list_mask("stats_list_window", scenegraph_definition.stats_list_window.size, 10),
	equip_button = UIWidgets.create_default_button("equip_button", scenegraph_definition.equip_button.size, nil, nil, Localize("input_description_equip"), 26, nil, "button_detail_02"),
	customize_button = UIWidgets.create_default_button("customize_button", scenegraph_definition.customize_button.size, nil, nil, Localize("menu_weave_forge_customize_loadout_button"), 26, nil, "button_detail_02"),
	unlock_button = UIWidgets.create_athanor_upgrade_button("unlock_button", scenegraph_definition.unlock_button.size, "athanor_icon_unlock", Localize("menu_weave_forge_unlock_weapon_button"), 24)
}
local animation_definitions = {
	upgrade = {
		{
			name = "fade_in_text_panel",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text
				upgrade_bg.alpha_multiplier = 0
				upgrade_text.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text
				upgrade_bg.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out_text_panel",
			start_progress = 1,
			end_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text
				upgrade_bg.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "font_offset",
			start_progress = 0,
			end_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_text = widgets.upgrade_text
				upgrade_text.offset[2] = -40 + 50 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "font_panel_size_increase",
			start_progress = 0,
			end_progress = 4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size
				upgrade_bg_size[1] = upgrade_bg_default_size[1]
				upgrade_bg_size[2] = upgrade_bg_default_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size
				upgrade_bg_size[1] = upgrade_bg_default_size[1] + 200 * (1 - anim_progress)
				upgrade_bg_size[2] = upgrade_bg_default_size[2] + 200 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.25,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.upgrade_effect
				widget.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.upgrade_effect
				widget.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 0.75,
			end_progress = 1.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local widget = widgets.upgrade_effect
				widget.alpha_multiplier = math.max(1 - anim_progress, 0.01)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "size_in",
			start_progress = 0,
			end_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.upgrade_effect
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_size = definition.size
				local size = scenegraph.size
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.upgrade_effect
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local scenegraph = ui_scenegraph[scenegraph_id]
				local default_size = definition.size
				local size = scenegraph.size
				size[2] = default_size[2] + default_size[2] * 10 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "intensity_out",
			start_progress = 1,
			end_progress = 1.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local upgrade_effect = widgets.upgrade_effect
				local texture_upgrade_effect = upgrade_effect.content.texture_id
				local gui_material_upgrade_effect = Gui.material(gui, texture_upgrade_effect)
				local start_value = 0.4

				Material.set_scalar(gui_material_upgrade_effect, "intensity", start_value)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(1 - progress)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local upgrade_effect = widgets.upgrade_effect
				local texture_upgrade_effect = upgrade_effect.content.texture_id
				local gui_material_upgrade_effect = Gui.material(gui, texture_upgrade_effect)
				local min = 0
				local max = 0.4
				local value = min + math.clamp(anim_progress, 0, 1) * max

				Material.set_scalar(gui_material_upgrade_effect, "intensity", value)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	top_hdr_widgets = top_hdr_widgets,
	bottom_hdr_widgets = bottom_hdr_widgets,
	create_trait_option = create_trait_option,
	create_divider_option = create_divider_option,
	create_property_option = create_property_option,
	create_item_block_option = create_item_block_option,
	create_item_stamina_option = create_item_stamina_option,
	create_item_ammunition_option = create_item_ammunition_option,
	create_item_overheat_option = create_item_overheat_option,
	create_item_keywords_option = create_item_keywords_option,
	create_weapon_entry_widget = create_weapon_entry_widget,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
