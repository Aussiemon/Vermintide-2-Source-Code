﻿-- chunkname: @scripts/ui/hud_ui/twitch_vote_ui_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.popup + 1,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.popup + 1,
		},
	},
	base_area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			800,
			128,
		},
		position = {
			0,
			210,
			1,
		},
	},
	vote_icon_rect = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "top",
		size = {
			56,
			56,
		},
		position = {
			0,
			41,
			10,
		},
	},
	vote_icon = {
		horizontal_alignment = "center",
		parent = "vote_icon_rect",
		vertical_alignment = "center",
		size = {
			56,
			56,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	vote_text_rect = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			260,
			42,
		},
		position = {
			0,
			30,
			10,
		},
	},
	timer_rect = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			48,
			32,
		},
		position = {
			0,
			-50,
			10,
		},
	},
	portrait_a = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			96,
			72,
		},
		position = {
			-240,
			52,
			10,
		},
	},
	portrait_b = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			96,
			72,
		},
		position = {
			-144,
			52,
			10,
		},
	},
	portrait_c = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			96,
			72,
		},
		position = {
			240,
			52,
			10,
		},
	},
	portrait_d = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			96,
			72,
		},
		position = {
			336,
			52,
			10,
		},
	},
	vote_input_a = {
		horizontal_alignment = "left",
		parent = "portrait_a",
		vertical_alignment = "bottom",
		size = {
			48,
			32,
		},
		position = {
			-24,
			-67,
			20,
		},
	},
	vote_input_b = {
		horizontal_alignment = "left",
		parent = "portrait_b",
		vertical_alignment = "bottom",
		size = {
			48,
			32,
		},
		position = {
			-24,
			-67,
			20,
		},
	},
	vote_input_c = {
		horizontal_alignment = "left",
		parent = "portrait_c",
		vertical_alignment = "bottom",
		size = {
			48,
			32,
		},
		position = {
			-24,
			-67,
			20,
		},
	},
	vote_input_d = {
		horizontal_alignment = "left",
		parent = "portrait_d",
		vertical_alignment = "bottom",
		size = {
			48,
			32,
		},
		position = {
			-24,
			-67,
			20,
		},
	},
	mc_divider = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			160,
			25,
		},
		position = {
			0,
			0,
			1,
		},
	},
	mc_twitch_icon_small = {
		horizontal_alignment = "center",
		parent = "mc_divider",
		vertical_alignment = "center",
		size = {
			27,
			27,
		},
		position = {
			0,
			0,
			1,
		},
	},
	result_area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			650,
			100,
		},
		position = {
			0,
			285,
			0,
		},
	},
	mcr_divider = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "center",
		size = {
			211,
			25,
		},
		position = {
			0,
			0,
			1,
		},
	},
	mcr_twitch_icon_small = {
		horizontal_alignment = "center",
		parent = "mcr_divider",
		vertical_alignment = "center",
		size = {
			27,
			27,
		},
		position = {
			0,
			2,
			1,
		},
	},
	result_icon_rect = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "top",
		size = {
			56,
			56,
		},
		position = {
			0,
			48,
			10,
		},
	},
	result_icon = {
		horizontal_alignment = "center",
		parent = "result_icon_rect",
		vertical_alignment = "center",
		size = {
			48,
			48,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	winner_portrait = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "center",
		size = {
			96,
			72,
		},
		position = {
			48,
			-52,
			1,
		},
	},
	result_text = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "center",
		size = {
			800,
			36,
		},
		position = {
			0,
			28,
			1,
		},
	},
	result_description_text = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "center",
		size = {
			800,
			36,
		},
		position = {
			0,
			-64,
			1,
		},
	},
	winner_name = {
		horizontal_alignment = "center",
		parent = "result_area",
		vertical_alignment = "center",
		size = {
			640,
			24,
		},
		position = {
			0,
			-28,
			1,
		},
	},
	sv_timer_rect = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			48,
			32,
		},
		position = {
			0,
			37,
			10,
		},
	},
	result_bar_fg = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			459,
			36,
		},
		position = {
			0,
			-0,
			7,
		},
	},
	result_bar_fg2 = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			463,
			38,
		},
		position = {
			0,
			-2,
			8,
		},
	},
	result_bar_mid = {
		horizontal_alignment = "center",
		parent = "result_bar_fg",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			-1,
			0,
			0,
		},
	},
	result_bar_glass = {
		horizontal_alignment = "center",
		parent = "result_bar_fg",
		vertical_alignment = "top",
		size = {
			394,
			4,
		},
		position = {
			0,
			-6,
			-1,
		},
	},
	result_bar_bg = {
		horizontal_alignment = "center",
		parent = "result_bar_fg",
		vertical_alignment = "center",
		size = {
			394,
			36,
		},
		position = {
			0,
			-0,
			-6,
		},
	},
	sv_twitch_icon_small = {
		horizontal_alignment = "center",
		parent = "result_bar_mid",
		vertical_alignment = "center",
		size = {
			29,
			29,
		},
		position = {
			1,
			16,
			10,
		},
	},
	result_a_bar = {
		horizontal_alignment = "right",
		parent = "result_bar_mid",
		vertical_alignment = "bottom",
		size = {
			197,
			36,
		},
		position = {
			0,
			0,
			-2,
		},
	},
	result_a_bar_edge = {
		horizontal_alignment = "left",
		parent = "result_a_bar",
		vertical_alignment = "center",
		size = {
			36,
			36,
		},
		position = {
			-36,
			0,
			-1,
		},
	},
	result_bar_a_eyes = {
		horizontal_alignment = "left",
		parent = "result_bar_fg",
		vertical_alignment = "center",
		size = {
			75,
			20,
		},
		position = {
			-22,
			-3,
			8,
		},
	},
	result_b_bar = {
		horizontal_alignment = "left",
		parent = "result_bar_mid",
		vertical_alignment = "bottom",
		size = {
			197,
			36,
		},
		position = {
			0,
			-0,
			-2,
		},
	},
	result_b_bar_edge = {
		horizontal_alignment = "right",
		parent = "result_b_bar",
		vertical_alignment = "center",
		size = {
			36,
			36,
		},
		position = {
			36,
			-0,
			-1,
		},
	},
	result_bar_b_eyes = {
		horizontal_alignment = "right",
		parent = "result_bar_fg",
		vertical_alignment = "center",
		size = {
			75,
			20,
		},
		position = {
			22,
			-3,
			8,
		},
	},
	vote_icon_a = {
		horizontal_alignment = "left",
		parent = "result_bar_fg",
		vertical_alignment = "center",
		size = {
			48,
			48,
		},
		position = {
			-60,
			0,
			-1,
		},
	},
	vote_icon_rect_a = {
		horizontal_alignment = "center",
		parent = "vote_icon_a",
		vertical_alignment = "center",
		size = {
			56,
			56,
		},
		position = {
			0,
			0,
			4,
		},
	},
	vote_text_rect_a = {
		horizontal_alignment = "left",
		parent = "vote_icon_a",
		vertical_alignment = "bottom",
		size = {
			240,
			24,
		},
		position = {
			0,
			-30,
			10,
		},
	},
	vote_input_text_a = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			60,
			30,
		},
		position = {
			-207,
			32,
			10,
		},
	},
	vote_icon_b = {
		horizontal_alignment = "right",
		parent = "result_bar_fg",
		vertical_alignment = "center",
		size = {
			48,
			48,
		},
		position = {
			60,
			0,
			-1,
		},
	},
	vote_icon_rect_b = {
		horizontal_alignment = "center",
		parent = "vote_icon_b",
		vertical_alignment = "center",
		size = {
			56,
			56,
		},
		position = {
			0,
			0,
			4,
		},
	},
	vote_text_rect_b = {
		horizontal_alignment = "right",
		parent = "vote_icon_b",
		vertical_alignment = "bottom",
		size = {
			240,
			24,
		},
		position = {
			0,
			-30,
			10,
		},
	},
	vote_input_text_b = {
		horizontal_alignment = "center",
		parent = "base_area",
		vertical_alignment = "center",
		size = {
			60,
			30,
		},
		position = {
			207,
			32,
			10,
		},
	},
	sv_result_area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			650,
			135,
		},
		position = {
			0,
			180,
			0,
		},
	},
	sv_divider = {
		horizontal_alignment = "center",
		parent = "sv_result_area",
		vertical_alignment = "center",
		size = {
			211,
			26,
		},
		position = {
			0,
			0,
			1,
		},
	},
	svr_twitch_icon_small = {
		horizontal_alignment = "center",
		parent = "sv_divider",
		vertical_alignment = "center",
		size = {
			27,
			27,
		},
		position = {
			0,
			2,
			1,
		},
	},
	sv_result_icon_rect = {
		horizontal_alignment = "center",
		parent = "sv_result_area",
		vertical_alignment = "top",
		size = {
			56,
			56,
		},
		position = {
			0,
			26,
			10,
		},
	},
	sv_result_icon = {
		horizontal_alignment = "center",
		parent = "sv_result_icon_rect",
		vertical_alignment = "center",
		size = {
			48,
			48,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	sv_result_text = {
		horizontal_alignment = "center",
		parent = "sv_result_area",
		vertical_alignment = "center",
		size = {
			640,
			24,
		},
		position = {
			0,
			-32,
			1,
		},
	},
}

local function create_masked_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture, masked_portrait_texture)
	scale = scale or 1

	local widget = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local passes = widget.element.passes
	local content = widget.content
	local style = widget.style
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local portrait_size = {
		86,
		108,
	}

	portrait_size[1] = portrait_size[1] * scale
	portrait_size[2] = portrait_size[2] * scale

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
		retained_mode = retained_mode,
	}
	style[portrait_name] = {
		color = default_color,
		offset = portrait_offset,
		size = portrait_size,
		texture_size = portrait_size,
	}

	local mask_name = "mask"

	content[mask_name] = "mask_rect"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = mask_name,
		style_id = mask_name,
		retained_mode = retained_mode,
	}
	style[mask_name] = {
		offset = portrait_offset,
		texture_size = portrait_size,
		base_size = portrait_size,
	}

	return widget
end

local timer_text_style = {
	font_size = 60,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_vote_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
	offset = {
		-2,
		0,
		2,
	},
}
local vote_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		-2,
		0,
		2,
	},
}
local result_text_style = table.clone(vote_text_style)

result_text_style.font_size = 24
result_text_style.text_color = Colors.get_color_table_with_alpha("twitch", 255)

local result_text_description_style = table.clone(vote_text_style)

result_text_description_style.font_size = 20
result_text_description_style.text_color = Colors.get_color_table_with_alpha("white", 255)

local winner_text_style = table.clone(vote_text_style)

winner_text_style.localize = false
winner_text_style.font_size = 24

local vote_text_left_style = table.clone(vote_text_style)

vote_text_left_style.horizontal_alignment = "left"
vote_text_left_style.font_size = 24

local vote_text_right_style = table.clone(vote_text_style)

vote_text_right_style.horizontal_alignment = "right"
vote_text_right_style.font_size = 24

local portrait_scale = 0.8
local portrait_glow_style = {
	offset = {
		-54 * portrait_scale,
		-64 * portrait_scale,
		0,
	},
	texture_size = {
		108 * portrait_scale,
		130 * portrait_scale,
	},
	color = {
		255,
		255,
		255,
		255,
	},
}

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					6,
					6,
				},
				size = {
					4,
					size[2] - 7,
				},
				texture_tiling_size = {
					4,
					size[2] - 7,
				},
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					size[2] - 7,
					10,
				},
				size = {
					14,
					7,
				},
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					3,
					10,
				},
				size = {
					14,
					7,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			-4,
			0,
		},
	}

	return widget
end

local VOTE_TEXTS = {
	standard_vote = {
		"#A",
		"#B",
	},
	multiple_choice = {
		"#A",
		"#B",
		"#C",
		"#D",
		"#E",
	},
}
local streaming_icon = "twitch_icon_small"

return {
	vote_texts = VOTE_TEXTS,
	scenegraph_definition = scenegraph_definition,
	settings = {
		vote_icon_padding = 10,
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
				0,
			}, "menu_frame_12"),
			vote_input_rect_b = UIWidgets.create_rect_with_frame("vote_input_b", scenegraph_definition.vote_input_b.size, {
				255,
				0,
				0,
				0,
			}, "menu_frame_12"),
			vote_input_rect_c = UIWidgets.create_rect_with_frame("vote_input_c", scenegraph_definition.vote_input_c.size, {
				255,
				0,
				0,
				0,
			}, "menu_frame_12"),
			vote_input_rect_d = UIWidgets.create_rect_with_frame("vote_input_d", scenegraph_definition.vote_input_d.size, {
				255,
				0,
				0,
				0,
			}, "menu_frame_12"),
			hero_1 = create_masked_portrait_frame("portrait_a", "default", "-", portrait_scale, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_2 = create_masked_portrait_frame("portrait_b", "default", "-", portrait_scale, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_3 = create_masked_portrait_frame("portrait_c", "default", "-", portrait_scale, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_4 = create_masked_portrait_frame("portrait_d", "default", "-", portrait_scale, nil, "unit_frame_portrait_default", "unit_frame_portrait_default"),
			hero_glow_1 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_a", portrait_glow_style),
			hero_glow_2 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_b", portrait_glow_style),
			hero_glow_3 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_c", portrait_glow_style),
			hero_glow_4 = UIWidgets.create_texture_with_style("portrait_glow", "portrait_d", portrait_glow_style),
			hero_vote_1 = UIWidgets.create_simple_text(VOTE_TEXTS.multiple_choice[1], "vote_input_a", nil, nil, hero_vote_text_style),
			hero_vote_2 = UIWidgets.create_simple_text(VOTE_TEXTS.multiple_choice[2], "vote_input_b", nil, nil, hero_vote_text_style),
			hero_vote_3 = UIWidgets.create_simple_text(VOTE_TEXTS.multiple_choice[3], "vote_input_c", nil, nil, hero_vote_text_style),
			hero_vote_4 = UIWidgets.create_simple_text(VOTE_TEXTS.multiple_choice[4], "vote_input_d", nil, nil, hero_vote_text_style),
			divider = UIWidgets.create_simple_texture("divider_01_top", "mc_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture(streaming_icon, "mc_twitch_icon_small"),
		},
		multiple_choice_result = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "result_area"),
			divider = UIWidgets.create_simple_texture("divider_01_top", "mcr_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture(streaming_icon, "mcr_twitch_icon_small"),
			result_icon_rect = UIWidgets.create_simple_texture("item_frame", "result_icon_rect"),
			result_icon = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "result_icon"),
			result_text = UIWidgets.create_simple_text("heal_all", "result_text", nil, nil, result_text_style),
			winner_portrait = UIWidgets.create_portrait_frame("winner_portrait", "hero_selection", "-", portrait_scale, nil, "unit_frame_portrait_default"),
			winner_text = UIWidgets.create_simple_text("draw", "winner_name", nil, nil, winner_text_style),
		},
		standard_vote = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "base_area"),
			timer = UIWidgets.create_simple_text("timer_default_text", "sv_timer_rect", nil, nil, timer_text_style),
			vote_icon_rect_a = UIWidgets.create_simple_texture("item_frame", "vote_icon_rect_a"),
			vote_icon_a = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "vote_icon_a"),
			vote_text_a = UIWidgets.create_simple_text("vote_text_a_default_text", "vote_text_rect_a", nil, nil, vote_text_left_style),
			vote_input_text_a = UIWidgets.create_simple_text(VOTE_TEXTS.standard_vote[1], "vote_input_text_a", nil, nil, hero_vote_text_style),
			vote_icon_rect_b = UIWidgets.create_simple_texture("item_frame", "vote_icon_rect_b"),
			vote_icon_b = UIWidgets.create_simple_texture("markus_mercenary_activated_ability_clear_wounds", "vote_icon_b"),
			vote_text_b = UIWidgets.create_simple_text("vote_text_b_default_text", "vote_text_rect_b", nil, nil, vote_text_right_style),
			vote_input_text_b = UIWidgets.create_simple_text(VOTE_TEXTS.standard_vote[2], "vote_input_text_b", nil, nil, hero_vote_text_style),
			result_bar_fg = UIWidgets.create_simple_texture("crafting_button_fg", "result_bar_fg"),
			result_bar_glass = UIWidgets.create_simple_texture("button_glass_01", "result_bar_glass"),
			result_bar_bg = UIWidgets.create_simple_rect("result_bar_bg", {
				255,
				0,
				0,
				0,
			}),
			result_bar_fg2 = UIWidgets.create_rect_with_frame("result_bar_fg2", scenegraph_definition.result_bar_fg2.size, {
				0,
				0,
				0,
				0,
			}, "menu_frame_09"),
			result_bar_divier = create_vertical_window_divider("result_bar_mid", {
				4,
				40,
			}),
			result_a_bar_edge = UIWidgets.create_simple_uv_texture("experience_bar_edge_glow", {
				{
					1,
					1,
				},
				{
					0,
					0,
				},
			}, "result_a_bar_edge"),
			result_a_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
				{
					1,
					1,
				},
				{
					0,
					0,
				},
			}, "result_a_bar"),
			result_bar_a_eyes = UIWidgets.create_simple_texture("mission_objective_glow_02", "result_bar_a_eyes"),
			result_b_bar_edge = UIWidgets.create_simple_uv_texture("experience_bar_edge_glow", {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			}, "result_b_bar_edge", nil, nil, Colors.get_table("yellow")),
			result_b_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			}, "result_b_bar", nil, nil, Colors.get_table("yellow")),
			result_bar_b_eyes = UIWidgets.create_simple_texture("mission_objective_glow_02", "result_bar_b_eyes"),
			twitch_icon_small = UIWidgets.create_simple_texture(streaming_icon, "sv_twitch_icon_small"),
		},
		standard_vote_result = {
			background = UIWidgets.create_simple_texture("tab_menu_bg_02", "sv_result_area"),
			divider = UIWidgets.create_simple_texture("divider_01_top", "sv_divider"),
			twitch_icon_small = UIWidgets.create_simple_texture(streaming_icon, "svr_twitch_icon_small"),
			result_icon_rect = UIWidgets.create_simple_texture("item_frame", "sv_result_icon_rect"),
			result_icon = UIWidgets.create_simple_texture("markus_mercenary_crit_chance", "sv_result_icon"),
			result_text = UIWidgets.create_simple_text("default_result_text", "sv_result_text", nil, nil, result_text_style),
			result_description_text = UIWidgets.create_simple_text("", "result_description_text", nil, nil, result_text_description_style),
		},
	},
}
