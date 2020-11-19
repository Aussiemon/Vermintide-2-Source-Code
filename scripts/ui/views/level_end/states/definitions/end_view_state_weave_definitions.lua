local window_frame_width = 22
local platform_offset = (PLATFORM ~= "win32" and 50) or 0
local score_container_w = 1600
local score_container_margin_w = 50
local score_content_w = score_container_w - score_container_margin_w
local content_size = {
	1920,
	230 + platform_offset
}
local score_box_size = {
	250,
	160
}
local score_box_margin_W = 30
local glow_color_1 = {
	100,
	138,
	0,
	147
}
local glow_color_2 = {
	150,
	138,
	0,
	187
}
local glow_color_3 = {
	100,
	128,
	0,
	217
}
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
			UILayer.end_screen
		}
	},
	content_bg = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = content_size,
		position = {
			0,
			0,
			UILayer.end_screen + 30
		}
	},
	content_top_fade = {
		vertical_alignment = "top",
		parent = "content_bg",
		size = {
			1920,
			200
		},
		position = {
			0,
			200,
			-4
		}
	},
	content_top_glow_1 = {
		vertical_alignment = "top",
		parent = "content_bg",
		size = {
			1920,
			350
		},
		position = {
			0,
			350,
			-3
		}
	},
	content_top_glow_2 = {
		vertical_alignment = "top",
		parent = "content_bg",
		size = {
			1920,
			300
		},
		position = {
			0,
			300,
			-2
		}
	},
	content_top_glow_3 = {
		vertical_alignment = "top",
		parent = "content_bg",
		size = {
			1920,
			250
		},
		position = {
			0,
			250,
			-1
		}
	},
	content = {
		vertical_alignment = "center",
		parent = "content_bg",
		horizontal_alignment = "center",
		size = content_size,
		position = {
			0,
			0,
			1
		}
	},
	content_corner_top_left = {
		vertical_alignment = "top",
		parent = "content_bg",
		horizontal_alignment = "left",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			2
		}
	},
	content_corner_top_right = {
		vertical_alignment = "top",
		parent = "content_bg",
		horizontal_alignment = "right",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			2
		}
	},
	content_corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "content_bg",
		horizontal_alignment = "left",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			2
		}
	},
	content_corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "content_bg",
		horizontal_alignment = "right",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			2
		}
	},
	ready_timer_bar = {
		vertical_alignment = "bottom",
		parent = "content",
		horizontal_alignment = "left",
		size = {
			1300,
			15
		},
		position = {
			150,
			35 + platform_offset,
			15
		}
	},
	ready_button = {
		vertical_alignment = "bottom",
		parent = "content",
		horizontal_alignment = "right",
		size = {
			300,
			40
		},
		position = {
			-150,
			20 + platform_offset,
			15
		}
	},
	ready_button_panel = {
		vertical_alignment = "bottom",
		parent = "ready_button",
		horizontal_alignment = "center",
		size = {
			260,
			103
		},
		position = {
			0,
			20,
			-1
		}
	},
	total_time_container = {
		vertical_alignment = "bottom",
		parent = "ready_timer_bar",
		horizontal_alignment = "left",
		size = score_box_size,
		position = {
			0,
			30,
			1
		}
	},
	time_score_container = {
		vertical_alignment = "top",
		parent = "total_time_container",
		horizontal_alignment = "left",
		size = score_box_size,
		position = {
			score_box_size[1] + score_box_margin_W,
			0,
			1
		}
	},
	damage_bonus_container = {
		vertical_alignment = "top",
		parent = "time_score_container",
		horizontal_alignment = "left",
		size = score_box_size,
		position = {
			score_box_size[1] + score_box_margin_W,
			0,
			1
		}
	},
	total_score_container = {
		vertical_alignment = "top",
		parent = "damage_bonus_container",
		horizontal_alignment = "left",
		size = {
			460,
			score_box_size[2]
		},
		position = {
			score_box_size[1] + score_box_margin_W,
			0,
			1
		}
	},
	score_weave_num = {
		vertical_alignment = "top",
		parent = "content",
		horizontal_alignment = "center",
		size = {
			500,
			50
		},
		position = {
			0,
			73,
			3
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "content",
		horizontal_alignment = "center",
		size = {
			0,
			73
		},
		position = {
			0,
			93,
			-1
		}
	},
	title_bg_left = {
		vertical_alignment = "top",
		parent = "title_bg",
		horizontal_alignment = "left",
		size = {
			634,
			73
		},
		position = {
			-634,
			0,
			0
		}
	},
	title_bg_right = {
		vertical_alignment = "top",
		parent = "title_bg",
		horizontal_alignment = "right",
		size = {
			634,
			73
		},
		position = {
			634,
			0,
			0
		}
	},
	score_glow_1 = {
		vertical_alignment = "center",
		parent = "total_time_container",
		horizontal_alignment = "center",
		size = {
			300,
			120
		},
		position = {
			0,
			0,
			1
		}
	},
	score_glow_2 = {
		vertical_alignment = "center",
		parent = "time_score_container",
		horizontal_alignment = "center",
		size = {
			300,
			120
		},
		position = {
			0,
			0,
			1
		}
	},
	score_glow_3 = {
		vertical_alignment = "center",
		parent = "damage_bonus_container",
		horizontal_alignment = "center",
		size = {
			300,
			120
		},
		position = {
			0,
			0,
			1
		}
	},
	score_glow_4 = {
		vertical_alignment = "center",
		parent = "total_score_container",
		horizontal_alignment = "center",
		size = {
			400,
			140
		},
		position = {
			0,
			0,
			1
		}
	},
	score_divider_1 = {
		vertical_alignment = "center",
		parent = "total_time_container",
		horizontal_alignment = "center",
		size = {
			200,
			20
		},
		position = {
			0,
			0,
			2
		}
	},
	score_divider_2 = {
		vertical_alignment = "center",
		parent = "time_score_container",
		horizontal_alignment = "center",
		size = {
			200,
			20
		},
		position = {
			0,
			0,
			2
		}
	},
	score_divider_3 = {
		vertical_alignment = "center",
		parent = "damage_bonus_container",
		horizontal_alignment = "center",
		size = {
			200,
			20
		},
		position = {
			0,
			0,
			2
		}
	},
	score_divider_4 = {
		vertical_alignment = "center",
		parent = "total_score_container",
		horizontal_alignment = "left",
		size = {
			230,
			59
		},
		position = {
			0,
			-12,
			2
		}
	},
	score_divider_5 = {
		vertical_alignment = "center",
		parent = "total_score_container",
		horizontal_alignment = "right",
		size = {
			230,
			59
		},
		position = {
			0,
			-12,
			2
		}
	},
	highscore_sigil = {
		vertical_alignment = "center",
		parent = "score_divider_4",
		horizontal_alignment = "left",
		size = {
			53,
			53
		},
		position = {
			60,
			15,
			2
		}
	},
	highscore_ribbon = {
		vertical_alignment = "top",
		parent = "highscore_sigil",
		horizontal_alignment = "center",
		size = {
			34,
			50
		},
		position = {
			0,
			-30,
			-1
		}
	},
	highscore_text = {
		vertical_alignment = "center",
		parent = "total_score_container",
		horizontal_alignment = "center",
		size = {
			460,
			50
		},
		position = {
			0,
			-70,
			1
		}
	},
	player_frame = {
		vertical_alignment = "top",
		parent = "content_bg",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			190 + platform_offset * 0.5,
			10
		}
	},
	profile_selector = {
		vertical_alignment = "bottom",
		parent = "player_frame",
		horizontal_alignment = "center",
		size = {
			78,
			28
		},
		position = {
			0,
			-120,
			10
		}
	}
}
local title_text_style = {
	font_size = 36,
	upper_case = false,
	localize = false,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local score_box_title_text_style = {
	font_size = 28,
	upper_case = false,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		30,
		2
	}
}
local score_box_value_text_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		-30,
		2
	}
}
local total_score_box_title_text_style = {
	font_size = 28,
	upper_case = false,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		30,
		2
	}
}
local total_score_box_value_text_style = {
	font_size = 42,
	upper_case = false,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		-30,
		2
	}
}
local highscore_text_style = {
	font_size = 32,
	upper_case = false,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = {
		255,
		253,
		204,
		10
	},
	offset = {
		0,
		0,
		2
	}
}
local player_name_text_style = {
	use_shadow = false,
	font_size = 22,
	localize = false,
	vertical_alignment = "bottom",
	word_wrap = false,
	horizontal_alignment = "center",
	font_type = "hell_shark",
	offset = {
		-2,
		-94,
		11
	}
}

local function create_ready_button(scenegraph_id, size, text, font_size, button_detail, disable_with_gamepad)
	local def = UIWidgets.create_default_button(scenegraph_id, size, nil, nil, text, 24, font_size, button_detail, nil, disable_with_gamepad)
	def.content.hover_glow = "button_state_hover_green"
	def.content.effect = "play_button_passive_glow"
	def.content.glow = "button_state_normal_green"

	return def
end

function create_leaderboard_button(scenegraph_id, size, frame_name, background_texture, background_icon)
	background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	background_icon = background_icon or "loot_chest_icon"
	local background_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_icon)
	local background_icon_size = (background_icon_settings and background_icon_settings.size) or {
		50,
		50
	}
	local icon_margin = 0
	local icon_scaler = math.min((size[1] - icon_margin) / background_icon_size[1], (size[2] - icon_margin) / background_icon_size[2])
	icon_scaler = math.min(icon_scaler, 1)
	background_icon_size = {
		background_icon_size[1] * icon_scaler,
		background_icon_size[2] * icon_scaler
	}

	return {
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "background_icon",
					pass_type = "texture_uv",
					content_id = "background_icon"
				}
			}
		},
		content = {
			background_fade = "button_bg_fade",
			hover_glow = "button_state_default",
			button_hotspot = {},
			frame = frame_settings.texture,
			background_icon = {
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				texture_id = background_icon
			},
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_icon = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 2 - background_icon_size[1] / 2,
					size[2] / 2 - background_icon_size[2] / 2,
					1
				},
				size = background_icon_size
			},
			hover_glow = {
				color = {
					0,
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
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					8
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					2
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
end

local function create_timer_bar(scenegraph_id, size, optional_detail_texture, optional_detail_offset)
	local frame_settings = UIFrameSettings.button_frame_02

	return {
		content = {
			background = "xp_bar_bg",
			bar_edge = "end_glow_greyscale",
			draw_frame = true,
			bar_fill = {
				texture_id = "timer_fg_greyscale",
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
			frame = frame_settings.texture
		},
		element = {
			passes = {
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					style_id = "bar_edge",
					pass_type = "texture",
					texture_id = "bar_edge",
					content_change_function = function (content, style)
						local parent_style = style.parent
						local bar_fill_style = parent_style.bar_fill
						local start_offset = bar_fill_style.offset[1]
						style.offset[1] = math.floor((bar_fill_style.size[1] + start_offset) - style.default_size[1] / 2)
					end,
					content_check_function = function (content)
						return content.active
					end
				},
				{
					style_id = "bar_fill",
					pass_type = "texture_uv",
					content_id = "bar_fill",
					content_check_function = function (content)
						return content.parent.active
					end
				}
			}
		},
		style = {
			background = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					0
				}
			},
			bar_fill = {
				color = {
					255,
					100,
					150,
					150
				},
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1]
				},
				default_size = {
					size[1] - frame_settings.texture_sizes.horizontal[2],
					size[2] - frame_settings.texture_sizes.vertical[1]
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1] / 2,
					2
				}
			},
			bar_edge = {
				color = {
					255,
					100,
					255,
					255
				},
				size = {
					40,
					60
				},
				default_size = {
					40,
					60
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2] - 20,
					frame_settings.texture_sizes.vertical[1] - 25,
					5
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
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

local function update_timer_bar_progress(widget, progress, t)
	local content = widget.content
	local style = widget.style
	local bar_fill_style = style.bar_fill
	local bar_size = bar_fill_style.size
	local bar_default_size = bar_fill_style.default_size
	bar_size[1] = math.floor(bar_default_size[1] * progress)
	local pulse_rate = 0.5
	local min_alpha = 150
	local max_alpha = 255
	local pulse_progress = math.ease_pulse((t * pulse_rate) % 1)
	style.bar_edge.color[1] = min_alpha + (max_alpha - min_alpha) * pulse_progress
end

function create_simple_gamepad_disabled_texture(scenegraph_id, masked, retained, color, layer, gamepad_disabled)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				},
				{
					style_id = "glow",
					pass_type = "texture",
					texture_id = "glow_id",
					retained_mode = retained,
					content_change_function = function (content, style)
						style.color[1] = 40 + 20 * math.sin(Managers.time:time("ui") * 5)
					end
				}
			}
		},
		content = {
			glow_id = "winds_icon_background_glow",
			texture_id = "keep_decorations_divider_02",
			gamepad_disabled = gamepad_disabled
		},
		style = {
			texture_id = {
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					400,
					50
				},
				color = {
					40,
					255,
					255,
					0
				},
				offset = {
					0,
					30,
					0
				},
				masked = masked
			}
		},
		offset = {
			0,
			0,
			layer or 0
		},
		scenegraph_id = scenegraph_id
	}
end

local score_glow_color = {
	90,
	90,
	70,
	55
}
local score_divider_color = {
	255,
	30,
	30,
	30
}
local disable_with_gamepad = true
local widgets = {
	content_bg = UIWidgets.create_tiled_texture("content_bg", "menu_frame_bg_06", {
		256,
		256
	}, nil, nil, {
		255,
		150,
		150,
		150
	}),
	content_border = UIWidgets.create_frame("content_bg", {
		30,
		30
	}, "menu_frame_11", 4, nil, {
		-window_frame_width,
		-window_frame_width
	}),
	content_border_fade = UIWidgets.create_simple_texture("edge_fade_small", "content_top_fade", nil, nil, {
		220,
		0,
		0,
		0
	}),
	content_top_glow_1 = UIWidgets.create_simple_uv_texture("end_screen_weave_smoke_1", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "content_top_glow_1", nil, nil, glow_color_1),
	content_top_glow_2 = UIWidgets.create_simple_uv_texture("end_screen_weave_smoke_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "content_top_glow_2", nil, nil, glow_color_2),
	content_top_glow_3 = UIWidgets.create_simple_uv_texture("end_screen_weave_embers_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "content_top_glow_3", nil, nil, glow_color_3),
	content_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "content_bg", nil, nil, {
		150,
		0,
		0,
		0
	}, 1),
	content_corner_top_left = UIWidgets.create_simple_texture("athanor_decoration_corner", "content_corner_top_left"),
	content_corner_top_right = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "content_corner_top_right"),
	content_corner_bottom_left = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "content_corner_bottom_left"),
	content_corner_bottom_right = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "content_corner_bottom_right"),
	score_weave_num = UIWidgets.create_simple_text("", "score_weave_num", nil, nil, title_text_style),
	title_bg_left = UIWidgets.create_simple_texture("athanor_power_bg", "title_bg_left"),
	title_bg_right = UIWidgets.create_simple_uv_texture("athanor_power_bg", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "title_bg_right"),
	score_divider_1 = UIWidgets.create_simple_texture("journal_content_divider_medium", "score_divider_1", nil, nil, score_divider_color),
	score_divider_2 = UIWidgets.create_simple_texture("journal_content_divider_medium", "score_divider_2", nil, nil, score_divider_color),
	score_divider_3 = UIWidgets.create_simple_texture("journal_content_divider_medium", "score_divider_3", nil, nil, score_divider_color),
	score_divider_4 = UIWidgets.create_simple_texture("frame_detail_03", "score_divider_4"),
	score_divider_5 = UIWidgets.create_simple_uv_texture("frame_detail_03", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "score_divider_5"),
	score_glow_1 = UIWidgets.create_simple_texture("winds_icon_background_glow", "score_glow_1", nil, nil, score_glow_color),
	score_glow_2 = UIWidgets.create_simple_texture("winds_icon_background_glow", "score_glow_2", nil, nil, score_glow_color),
	score_glow_3 = UIWidgets.create_simple_texture("winds_icon_background_glow", "score_glow_3", nil, nil, score_glow_color),
	score_glow_4 = UIWidgets.create_simple_texture("winds_icon_background_glow", "score_glow_4", nil, nil, score_glow_color),
	total_time_text = UIWidgets.create_simple_text("weave_endscreen_total_time", "total_time_container", nil, nil, score_box_title_text_style),
	total_time_value = UIWidgets.create_simple_text("", "total_time_container", nil, nil, score_box_value_text_style),
	time_score_text = UIWidgets.create_simple_text("weave_endscreen_time_score", "time_score_container", nil, nil, score_box_title_text_style),
	time_score_value = UIWidgets.create_simple_text("", "time_score_container", nil, nil, score_box_value_text_style),
	damage_bonus_text = UIWidgets.create_simple_text("weave_endscreen_damage_score", "damage_bonus_container", nil, nil, score_box_title_text_style),
	damage_bonus_value = UIWidgets.create_simple_text("", "damage_bonus_container", nil, nil, score_box_value_text_style),
	total_score_text = UIWidgets.create_simple_text("weave_endscreen_total_score", "total_score_container", nil, nil, total_score_box_title_text_style),
	total_score_value = UIWidgets.create_simple_text("", "total_score_container", nil, nil, total_score_box_value_text_style),
	ready_button_panel = UIWidgets.create_simple_texture("esc_menu_top", "ready_button_panel"),
	ready_button = create_ready_button("ready_button", scenegraph_definition.ready_button.size, Localize("continue"), 24, "button_detail_03", disable_with_gamepad),
	ready_timer = create_timer_bar("ready_timer_bar", scenegraph_definition.ready_timer_bar.size),
	profile_selector = create_simple_gamepad_disabled_texture("profile_selector", nil, nil, nil, nil, gamepad_disabled),
	highscore_sigil = UIWidgets.create_simple_texture("weave_highscore_sigil", "highscore_sigil"),
	highscore_ribbon = UIWidgets.create_simple_texture("weave_highscore_ribbon", "highscore_ribbon"),
	highscore_text = UIWidgets.create_simple_text("weave_endscreen_new_record", "highscore_text", nil, nil, highscore_text_style)
}
local hero_widgets = {
	player_frame = UIWidgets.create_portrait_frame("player_frame", "default", nil, 1, nil, "unit_frame_portrait_default"),
	player_name = UIWidgets.create_simple_text("", "player_frame", nil, nil, player_name_text_style)
}
local animation_definitions = {
	transition_enter = {
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
				local content_panel = scenegraph_definition.content_bg
				local content_panel_size_y = content_panel.size[2]
				local content_panel_offset = content_panel_size_y * (1 - anim_progress)
				local content_panel_default_position = content_panel.position[2]
				ui_scenegraph.content_bg.position[2] = content_panel_default_position - content_panel_offset
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	transition_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
				local content_panel = scenegraph_definition.content_bg
				local content_panel_size_y = content_panel.size[2]
				local content_panel_offset = content_panel_size_y * anim_progress
				local content_panel_default_position = content_panel.position[2]
				ui_scenegraph.content_bg.position[2] = content_panel_default_position - content_panel_offset
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	score_entry = {
		{
			name = "count_up",
			start_progress = 0.5,
			end_progress = 1.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local content = widget.content
				content.text = UIUtils.comma_value(params.start_value)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local content = widget.content
				local value = math.floor(math.lerp(params.start_value, params.end_value, progress))
				content.text = UIUtils.comma_value(value)

				if params.wwise_world then
					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_entry_count")
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "bump",
			start_progress = 1.5,
			end_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local content = widget.content
				content.entered = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local content = widget.content
				local style = widget.style
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local start_font_size = params.start_font_size
				local peak_font_size = params.peak_font_size
				local anim_progress = math.ease_pulse(progress)
				local new_font_size = math.lerp(start_font_size, peak_font_size, anim_progress)
				text_style.font_size = new_font_size
				text_shadow_style.font_size = new_font_size

				if params.wwise_world and content.entered == false then
					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_entry_total_sum")

					content.entered = true
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	highscore_presentation = {
		{
			name = "sigil_alpha",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local highscore_sigil = widgets.highscore_sigil
				local highscore_ribbon = widgets.highscore_ribbon
				local alpha = 0
				highscore_sigil.style.texture_id.color[1] = alpha
				highscore_ribbon.style.texture_id.color[1] = alpha
				widgets.highscore_sigil.content.visible = true
				widgets.highscore_ribbon.content.visible = true
				widgets.highscore_text.content.visible = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_in_exp(progress)
				local highscore_sigil = widgets.highscore_sigil
				local highscore_ribbon = widgets.highscore_ribbon
				local alpha = 255 * anim_progress
				highscore_sigil.style.texture_id.color[1] = alpha
				highscore_ribbon.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "sigil_entry",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_out_exp(1 - progress)
				local highscore_sigil = widgets.highscore_sigil
				local sigil_scenegraph_id = highscore_sigil.scenegraph_id
				local sigil_definition = scenegraph_definition[sigil_scenegraph_id]
				local sigil_scenegraph = ui_scenegraph[sigil_scenegraph_id]
				local sigil_default_position = sigil_definition.position
				local sigil_position = sigil_scenegraph.local_position
				local sigil_default_size = sigil_definition.size
				local sigil_size = sigil_scenegraph.size
				sigil_size[1] = sigil_default_size[1] + sigil_default_size[1] * anim_progress
				sigil_size[2] = sigil_default_size[2] + sigil_default_size[2] * anim_progress
				sigil_position[1] = sigil_default_position[1] - sigil_default_position[1] / 2 * anim_progress
				sigil_position[2] = sigil_default_position[2] + sigil_default_position[2] / 2 * anim_progress
				local highscore_ribbon = widgets.highscore_ribbon
				local ribbon_scenegraph_id = highscore_ribbon.scenegraph_id
				local ribbon_definition = scenegraph_definition[ribbon_scenegraph_id]
				local ribbon_scenegraph = ui_scenegraph[ribbon_scenegraph_id]
				local ribbon_default_position = ribbon_definition.position
				local ribbon_position = ribbon_scenegraph.local_position
				local ribbon_default_size = ribbon_definition.size
				local ribbon_size = ribbon_scenegraph.size
				ribbon_size[1] = ribbon_default_size[1] + ribbon_default_size[1] * anim_progress
				ribbon_size[2] = ribbon_default_size[2] + ribbon_default_size[2] * anim_progress
				ribbon_position[1] = ribbon_default_position[1] + ribbon_default_position[1] * anim_progress
				ribbon_position[2] = ribbon_default_position[2] + ribbon_default_position[2] * anim_progress

				if progress == 1 and params.wwise_world then
					WwiseWorld.trigger_event(params.wwise_world, "menu_wind_level_choose_wind")
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text_entry",
			start_progress = 0.7,
			end_progress = 1.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.highscore_text
				local content = widget.content
				local style = widget.style
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local offset = widget.offset
				text_style.text_color[1] = 0
				text_shadow_style.text_color[1] = 0
				offset[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.highscore_text
				local content = widget.content
				local style = widget.style
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(progress)
				text_style.text_color[1] = 255 * anim_progress
				text_shadow_style.text_color[1] = 255 * anim_progress
				offset[1] = 10 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "background_glow_entry",
			start_progress = 0.7,
			end_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.score_glow_4
				local content = widget.content
				local style = widget.style
				local texture_style = style.texture_id
				local color = texture_style.color
				color[1] = 90
				color[2] = 90
				color[3] = 70
				color[4] = 55
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.score_glow_4
				local content = widget.content
				local style = widget.style
				local texture_style = style.texture_id
				local color = texture_style.color
				local anim_progress = math.easeOutCubic(progress)
				local from = {
					90,
					90,
					70,
					55
				}
				local target = {
					60,
					223,
					204,
					50
				}

				Colors.lerp_color_tables(from, target, anim_progress, color)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
local generic_input_actions = {
	default = {
		{
			input_action = "d_horizontal",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 3,
			description_text = "continue_menu_button_name"
		}
	},
	show_profile = {
		actions = {
			{
				input_action = "special_1",
				priority = 2,
				description_text = "input_description_show_profile"
			}
		}
	}
}

return {
	widgets = widgets,
	hero_widgets = hero_widgets,
	score_widgets = score_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	update_bar_progress = update_timer_bar_progress,
	generic_input_actions = generic_input_actions
}
