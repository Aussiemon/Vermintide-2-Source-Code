local twitch_size = {
	72,
	25.8
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
			UILayer.popup + 1
		}
	},
	base_area = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			811,
			160
		},
		position = {
			0,
			110,
			1
		}
	},
	vote_icon_rect = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			70,
			70
		},
		position = {
			0,
			41,
			10
		}
	},
	vote_icon = {
		vertical_alignment = "center",
		parent = "vote_icon_rect",
		horizontal_alignment = "center",
		size = {
			60,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	vote_text_rect = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			220,
			30
		},
		position = {
			0,
			32,
			10
		}
	},
	timer_rect = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			60,
			40
		},
		position = {
			0,
			-50,
			10
		}
	},
	portrait_a = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "left",
		size = {
			120,
			90
		},
		position = {
			120,
			50,
			10
		}
	},
	portrait_b = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "left",
		size = {
			120,
			90
		},
		position = {
			240,
			50,
			10
		}
	},
	portrait_c = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "right",
		size = {
			120,
			90
		},
		position = {
			-120,
			50,
			10
		}
	},
	portrait_d = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "right",
		size = {
			120,
			90
		},
		position = {
			0,
			50,
			10
		}
	},
	vote_input_a = {
		vertical_alignment = "bottom",
		parent = "portrait_a",
		horizontal_alignment = "left",
		size = {
			60,
			40
		},
		position = {
			-30,
			-83,
			20
		}
	},
	vote_input_b = {
		vertical_alignment = "bottom",
		parent = "portrait_b",
		horizontal_alignment = "left",
		size = {
			60,
			40
		},
		position = {
			-30,
			-83,
			20
		}
	},
	vote_input_c = {
		vertical_alignment = "bottom",
		parent = "portrait_c",
		horizontal_alignment = "left",
		size = {
			60,
			40
		},
		position = {
			-30,
			-83,
			20
		}
	},
	vote_input_d = {
		vertical_alignment = "bottom",
		parent = "portrait_d",
		horizontal_alignment = "left",
		size = {
			60,
			40
		},
		position = {
			-30,
			-83,
			20
		}
	},
	mc_divider = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			200,
			32
		},
		position = {
			0,
			0,
			1
		}
	},
	mc_twitch_icon_small = {
		vertical_alignment = "center",
		parent = "mc_divider",
		horizontal_alignment = "center",
		size = {
			34,
			34
		},
		position = {
			0,
			0,
			1
		}
	},
	result_area = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			811,
			140
		},
		position = {
			0,
			200,
			0
		}
	},
	mcr_divider = {
		vertical_alignment = "center",
		parent = "result_area",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			0,
			1
		}
	},
	mcr_twitch_icon_small = {
		vertical_alignment = "center",
		parent = "mcr_divider",
		horizontal_alignment = "center",
		size = {
			34,
			34
		},
		position = {
			0,
			2,
			1
		}
	},
	result_icon_rect = {
		vertical_alignment = "top",
		parent = "result_area",
		horizontal_alignment = "center",
		size = {
			70,
			70
		},
		position = {
			0,
			48,
			10
		}
	},
	result_icon = {
		vertical_alignment = "center",
		parent = "result_icon_rect",
		horizontal_alignment = "center",
		size = {
			60,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	winner_portrait = {
		vertical_alignment = "center",
		parent = "result_area",
		horizontal_alignment = "center",
		size = {
			120,
			90
		},
		position = {
			60,
			-52,
			1
		}
	},
	result_text = {
		vertical_alignment = "center",
		parent = "result_area",
		horizontal_alignment = "center",
		size = {
			800,
			30
		},
		position = {
			0,
			32,
			1
		}
	},
	winner_name = {
		vertical_alignment = "center",
		parent = "result_area",
		horizontal_alignment = "center",
		size = {
			800,
			30
		},
		position = {
			0,
			-28,
			1
		}
	},
	sv_timer_rect = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			60,
			40
		},
		position = {
			0,
			45,
			10
		}
	},
	result_bar_fg = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			510,
			40
		},
		position = {
			0,
			-0,
			7
		}
	},
	result_bar_fg2 = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			514,
			42
		},
		position = {
			0,
			-2,
			8
		}
	},
	result_bar_mid = {
		vertical_alignment = "bottom",
		parent = "result_bar_fg",
		horizontal_alignment = "center",
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
	result_bar_glass = {
		vertical_alignment = "top",
		parent = "result_bar_fg",
		horizontal_alignment = "center",
		size = {
			438,
			5
		},
		position = {
			0,
			-5,
			-1
		}
	},
	result_bar_bg = {
		vertical_alignment = "center",
		parent = "result_bar_fg",
		horizontal_alignment = "center",
		size = {
			438,
			40
		},
		position = {
			0,
			0,
			-6
		}
	},
	sv_twitch_icon_small = {
		vertical_alignment = "center",
		parent = "result_bar_mid",
		horizontal_alignment = "center",
		size = {
			34,
			34
		},
		position = {
			0,
			18,
			10
		}
	},
	result_a_bar = {
		vertical_alignment = "bottom",
		parent = "result_bar_mid",
		horizontal_alignment = "right",
		size = {
			219,
			40
		},
		position = {
			0,
			0,
			-2
		}
	},
	result_a_bar_edge = {
		vertical_alignment = "center",
		parent = "result_a_bar",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			-40,
			0,
			-1
		}
	},
	result_bar_a_eyes = {
		vertical_alignment = "center",
		parent = "result_bar_fg",
		horizontal_alignment = "left",
		size = {
			84,
			22
		},
		position = {
			-24,
			-3,
			8
		}
	},
	result_b_bar = {
		vertical_alignment = "bottom",
		parent = "result_bar_mid",
		horizontal_alignment = "left",
		size = {
			219,
			40
		},
		position = {
			0,
			0,
			-2
		}
	},
	result_b_bar_edge = {
		vertical_alignment = "center",
		parent = "result_b_bar",
		horizontal_alignment = "right",
		size = {
			40,
			40
		},
		position = {
			40,
			0,
			-1
		}
	},
	result_bar_b_eyes = {
		vertical_alignment = "center",
		parent = "result_bar_fg",
		horizontal_alignment = "right",
		size = {
			84,
			22
		},
		position = {
			24,
			-3,
			8
		}
	},
	vote_icon_a = {
		vertical_alignment = "center",
		parent = "result_bar_fg",
		horizontal_alignment = "left",
		size = {
			60,
			60
		},
		position = {
			-90,
			0,
			-1
		}
	},
	vote_icon_rect_a = {
		vertical_alignment = "center",
		parent = "vote_icon_a",
		horizontal_alignment = "center",
		size = {
			70,
			70
		},
		position = {
			0,
			0,
			4
		}
	},
	vote_text_rect_a = {
		vertical_alignment = "bottom",
		parent = "vote_icon_a",
		horizontal_alignment = "left",
		size = {
			300,
			30
		},
		position = {
			0,
			-30,
			10
		}
	},
	vote_input_text_a = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			60,
			30
		},
		position = {
			-233,
			35,
			10
		}
	},
	vote_icon_b = {
		vertical_alignment = "center",
		parent = "result_bar_fg",
		horizontal_alignment = "right",
		size = {
			60,
			60
		},
		position = {
			90,
			0,
			-1
		}
	},
	vote_icon_rect_b = {
		vertical_alignment = "center",
		parent = "vote_icon_b",
		horizontal_alignment = "center",
		size = {
			70,
			70
		},
		position = {
			0,
			0,
			4
		}
	},
	vote_text_rect_b = {
		vertical_alignment = "bottom",
		parent = "vote_icon_b",
		horizontal_alignment = "right",
		size = {
			300,
			30
		},
		position = {
			0,
			-30,
			10
		}
	},
	vote_input_text_b = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			60,
			30
		},
		position = {
			233,
			35,
			10
		}
	},
	sv_result_area = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			811,
			140
		},
		position = {
			0,
			105,
			0
		}
	},
	sv_divider = {
		vertical_alignment = "center",
		parent = "sv_result_area",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			0,
			1
		}
	},
	svr_twitch_icon_small = {
		vertical_alignment = "center",
		parent = "sv_divider",
		horizontal_alignment = "center",
		size = {
			34,
			34
		},
		position = {
			0,
			2,
			1
		}
	},
	sv_result_icon_rect = {
		vertical_alignment = "top",
		parent = "sv_result_area",
		horizontal_alignment = "center",
		size = {
			70,
			70
		},
		position = {
			0,
			26,
			10
		}
	},
	sv_result_icon = {
		vertical_alignment = "center",
		parent = "sv_result_icon_rect",
		horizontal_alignment = "center",
		size = {
			60,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	sv_result_text = {
		vertical_alignment = "center",
		parent = "sv_result_area",
		horizontal_alignment = "center",
		size = {
			800,
			30
		},
		position = {
			0,
			-32,
			1
		}
	}
}

local function create_masked_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture, masked_portrait_texture)
	local widget = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	scale = scale or 1
	local passes = widget.element.passes
	local content = widget.content
	local style = widget.style
	local default_color = {
		255,
		255,
		255,
		255
	}
	local default_offset = {
		0,
		0,
		0
	}
	local portrait_size = {
		portrait_size[1] * scale,
		portrait_size[2] * scale
	}
	local portrait_offset = table.clone(default_offset)
	portrait_offset[1] = -(portrait_size[1] / 2) + portrait_offset[1] * scale
	portrait_offset[2] = -(portrait_size[2] / 2) + portrait_offset[2] * scale
	portrait_offset[3] = 2
	local portrait_name = "masked_portrait"
	content[portrait_name] = masked_portrait_texture
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_name,
		style_id = portrait_name,
		retained_mode = retained_mode
	}
	style[portrait_name] = {
		color = default_color,
		offset = portrait_offset,
		size = portrait_size,
		texture_size = portrait_size
	}
	local mask_name = "mask"
	content[mask_name] = "mask_rect"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = mask_name,
		style_id = mask_name,
		retained_mode = retained_mode
	}
	style[mask_name] = {
		offset = portrait_offset,
		texture_size = portrait_size,
		base_size = portrait_size
	}

	return widget
end

local timer_text_style = {
	font_size = 60,
	upper_case = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_vote_text_style = {
	font_size = 26,
	upper_case = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
	offset = {
		-2,
		0,
		2
	}
}
local vote_text_style = {
	font_size = 24,
	upper_case = true,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		-2,
		0,
		2
	}
}
local result_text_style = table.clone(vote_text_style)
result_text_style.font_size = 24
result_text_style.text_color = Colors.get_color_table_with_alpha("twitch", 255)
local winner_text_style = table.clone(vote_text_style)
winner_text_style.localize = false
winner_text_style.font_size = 24
local vote_text_left_style = table.clone(vote_text_style)
vote_text_left_style.horizontal_alignment = "left"
vote_text_left_style.font_size = 24
local vote_text_right_style = table.clone(vote_text_style)
vote_text_right_style.horizontal_alignment = "right"
vote_text_right_style.font_size = 24
local portrait_glow_style = {
	offset = {
		-54,
		-64,
		0
	},
	texture_size = {
		108,
		130
	},
	color = {
		255,
		255,
		255,
		255
	}
}

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
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
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
			-4,
			0
		}
	}

	return widget
end

return {
	scenegraph_definition = scenegraph_definition,
	settings = {
		vote_icon_padding = 10
	},
	widgets = {
		multiple_choice = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "base_area"),
			timer = UIWidgets.create_simple_text("timer_default_text", "timer_rect", nil, nil, timer_text_style),
			vote_icon_rect = UIWidgets.create_simple_texture("item_frame", "vote_icon_rect"),
			vote_icon = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "vote_icon"),
			vote_text = UIWidgets.create_simple_text("heal_all", "vote_text_rect", nil, nil, vote_text_style),
			vote_input_rect_a = UIWidgets.create_rect_with_frame("vote_input_a", scenegraph_definition.vote_input_a.size, {
				255,
				0,
				0,
				0
			}, "menu_frame_12"),
			vote_input_rect_b = UIWidgets.create_rect_with_frame("vote_input_b", scenegraph_definition.vote_input_b.size, {
				255,
				0,
				0,
				0
			}, "menu_frame_12"),
			vote_input_rect_c = UIWidgets.create_rect_with_frame("vote_input_c", scenegraph_definition.vote_input_c.size, {
				255,
				0,
				0,
				0
			}, "menu_frame_12"),
			vote_input_rect_d = UIWidgets.create_rect_with_frame("vote_input_d", scenegraph_definition.vote_input_d.size, {
				255,
				0,
				0,
				0
			}, "menu_frame_12"),
			hero_1 = create_masked_portrait_frame("portrait_a", "default", "-", 1, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_2 = create_masked_portrait_frame("portrait_b", "default", "-", 1, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_3 = create_masked_portrait_frame("portrait_c", "default", "-", 1, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_4 = create_masked_portrait_frame("portrait_d", "default", "-", 1, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_glow_1 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_a", portrait_glow_style),
			hero_glow_2 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_b", portrait_glow_style),
			hero_glow_3 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_c", portrait_glow_style),
			hero_glow_4 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_d", portrait_glow_style),
			hero_vote_1 = UIWidgets.create_simple_text("#A", "vote_input_a", nil, nil, hero_vote_text_style),
			hero_vote_2 = UIWidgets.create_simple_text("#B", "vote_input_b", nil, nil, hero_vote_text_style),
			hero_vote_3 = UIWidgets.create_simple_text("#C", "vote_input_c", nil, nil, hero_vote_text_style),
			hero_vote_4 = UIWidgets.create_simple_text("#D", "vote_input_d", nil, nil, hero_vote_text_style),
			divider = UIWidgets.create_simple_texture("divider_01_top", "mc_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture("twitch_icon_small", "mc_twitch_icon_small")
		},
		multiple_choice_result = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "result_area"),
			divider = UIWidgets.create_simple_texture("divider_01_top", "mcr_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture("twitch_icon_small", "mcr_twitch_icon_small"),
			result_icon_rect = UIWidgets.create_simple_texture("item_frame", "result_icon_rect"),
			result_icon = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "result_icon"),
			result_text = UIWidgets.create_simple_text("heal_all", "result_text", nil, nil, result_text_style),
			winner_portrait = UIWidgets.create_portrait_frame("winner_portrait", "hero_selection", "-", 1, nil, "unit_frame_portrait_default"),
			winner_text = UIWidgets.create_simple_text("draw", "winner_name", nil, nil, winner_text_style)
		},
		standard_vote = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "base_area"),
			timer = UIWidgets.create_simple_text("timer_default_text", "sv_timer_rect", nil, nil, timer_text_style),
			vote_icon_rect_a = UIWidgets.create_simple_texture("item_frame", "vote_icon_rect_a"),
			vote_icon_a = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "vote_icon_a"),
			vote_text_a = UIWidgets.create_simple_text("vote_text_a_default_text", "vote_text_rect_a", nil, nil, vote_text_left_style),
			vote_input_text_a = UIWidgets.create_simple_text("#A", "vote_input_text_a", nil, nil, hero_vote_text_style),
			vote_icon_rect_b = UIWidgets.create_simple_texture("item_frame", "vote_icon_rect_b"),
			vote_icon_b = UIWidgets.create_simple_texture("markus_mercenary_activated_ability_clear_wounds", "vote_icon_b"),
			vote_text_b = UIWidgets.create_simple_text("vote_text_b_default_text", "vote_text_rect_b", nil, nil, vote_text_right_style),
			vote_input_text_b = UIWidgets.create_simple_text("#B", "vote_input_text_b", nil, nil, hero_vote_text_style),
			result_bar_fg = UIWidgets.create_simple_texture("crafting_button_fg", "result_bar_fg"),
			result_bar_glass = UIWidgets.create_simple_texture("button_glass_01", "result_bar_glass"),
			result_bar_bg = UIWidgets.create_simple_rect("result_bar_bg", {
				255,
				0,
				0,
				0
			}),
			result_bar_fg2 = UIWidgets.create_rect_with_frame("result_bar_fg2", scenegraph_definition.result_bar_fg2.size, {
				0,
				0,
				0,
				0
			}, "menu_frame_09"),
			result_bar_divier = create_vertical_window_divider("result_bar_mid", {
				4,
				40
			}),
			result_a_bar_edge = UIWidgets.create_simple_uv_texture("experience_bar_edge_glow", {
				{
					1,
					1
				},
				{
					0,
					0
				}
			}, "result_a_bar_edge"),
			result_a_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
				{
					1,
					1
				},
				{
					0,
					0
				}
			}, "result_a_bar"),
			result_bar_a_eyes = UIWidgets.create_simple_texture("mission_objective_glow_02", "result_bar_a_eyes"),
			result_b_bar_edge = UIWidgets.create_simple_uv_texture("experience_bar_edge_glow", {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}, "result_b_bar_edge", nil, nil, Colors.get_table("yellow")),
			result_b_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}, "result_b_bar", nil, nil, Colors.get_table("yellow")),
			result_bar_b_eyes = UIWidgets.create_simple_texture("mission_objective_glow_02", "result_bar_b_eyes"),
			twitch_icon_small = UIWidgets.create_simple_texture("twitch_icon_small", "sv_twitch_icon_small")
		},
		standard_vote_result = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "sv_result_area"),
			divider = UIWidgets.create_simple_texture("divider_01_top", "sv_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture("twitch_icon_small", "svr_twitch_icon_small"),
			result_icon_rect = UIWidgets.create_simple_texture("item_frame", "sv_result_icon_rect"),
			result_icon = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "sv_result_icon"),
			result_text = UIWidgets.create_simple_text("default_result_text", "sv_result_text", nil, nil, result_text_style)
		}
	}
}
