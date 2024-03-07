-- chunkname: @scripts/ui/views/matchmaking_ui_definitions.lua

local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.matchmaking - 10,
		},
	},
	window_root = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "right",
		parent = "window_root",
		vertical_alignment = "top",
		size = {
			506,
			136,
		},
		position = {
			0,
			0,
			5,
		},
	},
	loading_icon = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			141,
			141,
		},
		position = {
			15,
			15,
			1,
		},
	},
	loading_status_frame = {
		horizontal_alignment = "center",
		parent = "loading_icon",
		vertical_alignment = "center",
		size = {
			141,
			141,
		},
		position = {
			0,
			0,
			1,
		},
	},
	status_text = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			360,
			35,
		},
		position = {
			43,
			-28,
			1,
		},
	},
	window_party = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			400,
			50,
		},
		position = {
			0,
			-80,
			1,
		},
	},
	detailed_info_box = {
		horizontal_alignment = "right",
		parent = "window_root",
		vertical_alignment = "top",
		size = {
			400,
			150,
		},
		position = {
			0,
			-60,
			0,
		},
	},
	level_key_info_box = {
		horizontal_alignment = "left",
		parent = "detailed_info_box",
		vertical_alignment = "top",
		size = {
			270,
			150,
		},
		position = {
			0,
			0,
			0,
		},
	},
	party_slot_root = {
		horizontal_alignment = "center",
		parent = "detailed_info_box",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	party_slot_1 = {
		horizontal_alignment = "center",
		parent = "party_slot_root",
		vertical_alignment = "center",
		size = {
			60,
			70,
		},
		position = {
			-135,
			-52,
			1,
		},
	},
	party_slot_2 = {
		horizontal_alignment = "center",
		parent = "party_slot_root",
		vertical_alignment = "center",
		size = {
			60,
			70,
		},
		position = {
			-45,
			-52,
			1,
		},
	},
	party_slot_3 = {
		horizontal_alignment = "center",
		parent = "party_slot_root",
		vertical_alignment = "center",
		size = {
			60,
			70,
		},
		position = {
			45,
			-52,
			1,
		},
	},
	party_slot_4 = {
		horizontal_alignment = "center",
		parent = "party_slot_root",
		vertical_alignment = "center",
		size = {
			60,
			70,
		},
		position = {
			135,
			-52,
			1,
		},
	},
	slot_reservations = {
		horizontal_alignment = "center",
		parent = "detailed_info_box",
		vertical_alignment = "center",
		size = {
			556,
			160,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	timer_bg = {
		horizontal_alignment = "center",
		parent = "detailed_info_box",
		vertical_alignment = "top",
		size = {
			400,
			16,
		},
		position = {
			0,
			-140,
			3,
		},
	},
	timer_fg = {
		horizontal_alignment = "left",
		parent = "timer_bg",
		vertical_alignment = "center",
		size = {
			392,
			16,
		},
		position = {
			4,
			0,
			3,
		},
	},
	timer_glow = {
		horizontal_alignment = "right",
		parent = "timer_fg",
		vertical_alignment = "center",
		size = {
			45,
			80,
		},
		position = {
			22,
			0,
			3,
		},
	},
	cancel_text_field = {
		horizontal_alignment = "center",
		parent = "detailed_info_box",
		vertical_alignment = "bottom",
		size = {
			400,
			50,
		},
		position = {
			0,
			-50,
			3,
		},
	},
	cancel_input_backround = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			411,
			61,
		},
		position = {
			0,
			0,
			1,
		},
	},
	cancel_text_input = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			200,
			0,
			2,
		},
	},
	cancel_text_prefix = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			200,
			0,
			2,
		},
	},
	cancel_text_suffix = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			200,
			0,
			2,
		},
	},
	cancel_icon = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			36,
			26,
		},
		position = {
			0,
			0,
			2,
		},
	},
	versus_cancel_text_input = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			100,
			0,
			2,
		},
	},
	versus_cancel_text_prefix = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			100,
			0,
			2,
		},
	},
	versus_cancel_text_suffix = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			100,
			0,
			2,
		},
	},
	versus_cancel_icon = {
		horizontal_alignment = "center",
		parent = "cancel_text_field",
		vertical_alignment = "center",
		size = {
			36,
			26,
		},
		position = {
			-100,
			0,
			2,
		},
	},
}
local window_corner_radius = 5
local window_background_color = {
	255,
	10,
	10,
	10,
}
local default_text_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local title_text_style = table.clone(default_text_style)

title_text_style.vertical_alignment = "top"
title_text_style.horizontal_alignment = "left"
title_text_style.dynamic_font_size = true
title_text_style.offset[2] = -10
title_text_style.offset[1] = 15
title_text_style.text_color = Colors.get_color_table_with_alpha("font_title", 255)

local difficulty_text_style = table.clone(default_text_style)

difficulty_text_style.vertical_alignment = "top"
difficulty_text_style.horizontal_alignment = "left"
difficulty_text_style.font_size = 16
difficulty_text_style.offset[1] = 15
difficulty_text_style.offset[2] = -35

local deus_difficulty_text_style = table.clone(difficulty_text_style)

deus_difficulty_text_style.default_color = {
	255,
	200,
	200,
	200,
}

local matchmaking_status_text_style = table.clone(default_text_style)

matchmaking_status_text_style.vertical_alignment = "center"
matchmaking_status_text_style.horizontal_alignment = "center"
matchmaking_status_text_style.font_size = 26
matchmaking_status_text_style.dynamic_font_size = true
matchmaking_status_text_style.word_wrap = false
matchmaking_status_text_style.offset[2] = 2

local deus_matchmaking_status_text_style = table.clone(matchmaking_status_text_style)

deus_matchmaking_status_text_style.text_color = Colors.get_table("font_title")

local cancel_input_text_style = table.clone(default_text_style)

cancel_input_text_style.vertical_alignment = "center"
cancel_input_text_style.horizontal_alignment = "left"
cancel_input_text_style.use_shadow = true
cancel_input_text_style.font_size = 28
cancel_input_text_style.dynamic_font_size = true
cancel_input_text_style.offset[2] = 2
cancel_input_text_style.text_color = Colors.get_color_table_with_alpha("font_title", 255)

local cancel_text_style = table.clone(cancel_input_text_style)

cancel_text_style.text_color = Colors.get_color_table_with_alpha("white", 255)

local versus_difficulty_text_style = table.clone(difficulty_text_style)

versus_difficulty_text_style.default_color = {
	255,
	200,
	200,
	200,
}

local versus_matchmaking_status_text_style = table.clone(matchmaking_status_text_style)

versus_matchmaking_status_text_style.text_color = Colors.get_table("font_title")

local function create_slot_reservation_widget(scenegraph_id, size)
	local speed = 0.6
	local size_modifier = 0.7
	local num_players = 4
	local lamp_texture_colors = {}

	for i = 1, num_players do
		lamp_texture_colors[i] = {
			255,
			255,
			255,
			255,
		}
	end

	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "orb",
			pass_type = "texture_uv",
			style_id = "orb",
			content_change_function = function (content, style, animations, dt)
				local parent_content = content.parent
				local size = parent_content.size
				local progress = parent_content.progress
				local default_size = style.default_size
				local texture_size = style.texture_size
				local offset = style.offset
				local speed = parent_content.speed
				local max_progress = (size[1] + default_size[1]) / size[1]
				local distance = size[1]

				parent_content.progress = (progress + dt * speed) % max_progress

				local size_fraction = default_size[1] / size[1]
				local size_in_progress = math.min(progress / size_fraction, 1)
				local size_out_progress = math.min((max_progress - progress) / size_fraction, 1)
				local acutal_max_progress = max_progress - size_fraction
				local test = math.min((max_progress - progress) / size_fraction, 1)
				local uvs = content.uvs

				uvs[1][1] = 1 - size_in_progress
				uvs[2][1] = size_out_progress
				texture_size[1] = math.floor(default_size[1] * math.min(size_in_progress, size_out_progress))
				offset[1] = math.floor(-texture_size[1] + distance * progress - (1 - size_out_progress) * default_size[1])
			end,
		},
		{
			pass_type = "rect",
			style_id = "timeline",
			content_change_function = function (content, style, animations, dt)
				local size = content.size
				local progress = content.progress
				local offset = style.offset
				local color = style.color
				local speed = content.speed
				local distance = size[1]

				offset[1] = -40 + distance * progress
			end,
		},
		{
			pass_type = "texture",
			style_id = "trail",
			texture_id = "trail",
			content_change_function = function (content, style, animations, dt)
				local size = content.size
				local progress = content.progress
				local texture_size = style.texture_size
				local offset = style.offset
				local style_parent = style.parent
				local style_orb = style_parent.orb
				local orb_default_size = style_orb.default_size
				local distance = size[1]

				offset[1] = -(orb_default_size[1] + 20) + distance * progress
			end,
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "globe_bg",
			texture_id = "globe_bg",
		},
		{
			pass_type = "texture",
			style_id = "globe",
			texture_id = "globe",
			content_change_function = function (content, style, animations, dt)
				local progress = content.progress
				local ease_value = math.min(progress, 1)

				if ease_value < 0.5 then
					ease_value = math.easeInCubic(2 * ease_value)
				else
					ease_value = math.easeOutCubic(2 - 2 * ease_value)
				end

				local default_color = style.default_color
				local color = style.color
				local speed = 5
				local pulse_value = 0.5 + math.sin(Managers.time:time("ui") * speed) * 0.5
				local anim_value = math.max(ease_value, pulse_value)
				local multiplier = 0.2

				color[2] = math.min(default_color[2] + default_color[2] * multiplier * pulse_value, 255)
				color[3] = math.min(default_color[3] + default_color[3] * multiplier * pulse_value, 255)
				color[4] = math.min(default_color[4] + default_color[4] * multiplier * pulse_value, 255)
			end,
		},
		{
			pass_type = "tiled_texture",
			style_id = "pattern",
			texture_id = "pattern",
		},
		{
			pass_type = "tiled_texture",
			style_id = "spark_pattern",
			texture_id = "spark_pattern_1",
		},
		{
			pass_type = "tiled_texture",
			style_id = "spark_pattern",
			texture_id = "spark_pattern_2",
		},
	}
	local content = {
		background = "versus_loading_trail_bg_front_quickplay",
		globe = "versus_loading_trail_center_effect",
		globe_bg = "versus_loading_trail_bg_back",
		pattern = "versus_loading_trail_lines_bg_masked",
		progress = 0,
		spark_pattern_1 = "versus_loading_trail_stars_bg_masked_1",
		spark_pattern_2 = "versus_loading_trail_stars_bg_masked_2",
		spark_texture_1 = "versus_loading_trail_stars_write_mask_1",
		spark_texture_2 = "versus_loading_trail_stars_write_mask_2",
		timeline = "timer_detail",
		trail = "versus_loading_trail_lines_write_mask",
		size = size,
		orb = {
			texture_id = "versus_loading_trail_dot",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
		speed = speed,
	}
	local style = {
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				556 * size_modifier,
				108 * size_modifier,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				15,
				2,
			},
		},
		globe_bg = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				68 * size_modifier,
				68 * size_modifier,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				15,
				0,
			},
		},
		globe = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				68 * size_modifier,
				68 * size_modifier,
			},
			color = {
				255,
				230,
				80,
				26,
			},
			default_color = {
				255,
				200,
				50,
				16,
			},
			offset = {
				0,
				15,
				1,
			},
		},
		orb = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = {
				482 * size_modifier,
				62 * size_modifier,
			},
			default_size = {
				482 * size_modifier,
				62 * size_modifier,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				9,
				3,
			},
		},
		trail = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = {
				416 * size_modifier,
				size[2] * size_modifier,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				9,
				4,
			},
		},
		timeline = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = {
				2 * size_modifier,
				size[2] * size_modifier,
			},
			color = {
				0,
				255,
				0,
				0,
			},
			offset = {
				0,
				9,
				5,
			},
		},
		pattern = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				556 * size_modifier,
				160 * size_modifier,
			},
			offset = {
				0,
				9,
				4,
			},
			texture_tiling_size = {
				size[1] * size_modifier,
				size[2] * size_modifier,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		spark_pattern = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				556 * size_modifier,
				160 * size_modifier,
			},
			offset = {
				0,
				9,
				4,
			},
			texture_tiling_size = {
				size[1] * size_modifier,
				size[2] * size_modifier,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_status_widget(texture, offset)
	return {
		scenegraph_id = "window",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.is_connecting or content.is_connected
					end,
					content_change_function = function (content, style, animations, dt)
						local color = style.color

						if content.is_connecting then
							local color_progress = ((content.color_progress or 1) + dt) % 1

							content.color_progress = color_progress

							local anim_progress = math.ease_pulse(color_progress)

							color[1] = 255 * anim_progress
						elseif content.is_connected then
							color[1] = 255
						end
					end,
				},
			},
		},
		content = {
			is_connected = false,
			is_connecting = false,
			texture_id = texture,
		},
		style = {
			texture_id = {
				horizontal_alignment = "right",
				vertical_alignment = "botom",
				texture_size = {
					30,
					30,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1] or 0,
					offset[2] or 0,
					offset[3] or 0,
				},
			},
		},
	}
end

local widget_definitions = {
	window = UIWidgets.create_simple_texture("matchmaking_window", "window"),
	loading_icon = UIWidgets.create_simple_texture("matchmaking_icon", "loading_icon"),
	loading_status_frame = UIWidgets.create_simple_rotated_texture("matchmaking_icon_effect", 0, {
		71,
		71,
	}, "loading_status_frame"),
	window_hotspot = UIWidgets.create_simple_hotspot("window"),
	status_text = UIWidgets.create_simple_text("n/a", "status_text", nil, nil, matchmaking_status_text_style),
	player_status_1 = create_status_widget("matchmaking_light_02", {
		-89,
		43,
		1,
	}),
	player_status_2 = create_status_widget("matchmaking_light_02", {
		-71,
		22,
		1,
	}),
	player_status_3 = create_status_widget("matchmaking_light_02", {
		-45,
		12,
		1,
	}),
	player_status_4 = create_status_widget("matchmaking_light_02", {
		-18,
		15,
		1,
	}),
}
local widget_detail_definitions = {
	detailed_info_box_frame = UIWidgets.create_frame("detailed_info_box", scenegraph_definition.detailed_info_box.size, "menu_frame_09", 1),
	detailed_info_box = UIWidgets.create_background("detailed_info_box", scenegraph_definition.detailed_info_box.size, "matchmaking_window_01"),
	title_text = UIWidgets.create_simple_text("n/a", "level_key_info_box", nil, nil, title_text_style),
	difficulty_text = UIWidgets.create_simple_text("n/a", "detailed_info_box", nil, nil, difficulty_text_style),
	party_slot_1 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_1.size, "party_slot_1"),
	party_slot_2 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_2.size, "party_slot_2"),
	party_slot_3 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_3.size, "party_slot_3"),
	party_slot_4 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_4.size, "party_slot_4"),
	timer_bg = UIWidgets.create_simple_texture("timer_bg", "timer_bg"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "timer_fg"),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow"),
}
local deus_widget_definitions = {
	window = UIWidgets.create_simple_texture("matchmaking_top", "window", false, false, nil, {
		-10,
		15,
		0,
	}, "native"),
	loading_icon = UIWidgets.create_simple_texture("matchmaking_icon_morris", "loading_icon", false, false, nil, {
		0,
		3,
		0,
	}),
	loading_status_frame = UIWidgets.create_simple_rotated_texture("matchmaking_icon_effect_morris", 0, {
		71,
		71,
	}, "loading_status_frame", false, false, nil, nil, {
		0,
		3,
		0,
	}),
	window_hotspot = UIWidgets.create_simple_hotspot("window"),
	status_text = UIWidgets.create_simple_text("n/a", "status_text", nil, nil, deus_matchmaking_status_text_style),
	player_status_1 = create_status_widget("matchmaking_light_02", {
		-87,
		46,
	}),
	player_status_2 = create_status_widget("matchmaking_light_02", {
		-70,
		25,
	}),
	player_status_3 = create_status_widget("matchmaking_light_02", {
		-44,
		15,
	}),
	player_status_4 = create_status_widget("matchmaking_light_02", {
		-17,
		19,
	}),
}
local deus_widget_detail_definitions = {
	detailed_info_box = UIWidgets.create_simple_texture("matchmaking_animated_panel", "detailed_info_box", false, false, nil, {
		-5,
		-7,
		0,
	}, "native"),
	title_text = UIWidgets.create_simple_text("n/a", "level_key_info_box", nil, nil, title_text_style),
	difficulty_text = UIWidgets.create_simple_text("n/a", "detailed_info_box", nil, nil, deus_difficulty_text_style),
	party_slot_1 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_1.size, "party_slot_1"),
	party_slot_2 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_2.size, "party_slot_2"),
	party_slot_3 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_3.size, "party_slot_3"),
	party_slot_4 = UIWidgets.create_matchmaking_portrait(scenegraph_definition.party_slot_4.size, "party_slot_4"),
	timer_bg = UIWidgets.create_simple_texture("matchmaking_progressbar_border", "timer_bg", false, false, nil, {
		5,
		-15,
		0,
	}, "native"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "timer_fg", false, false, nil, {
		19,
		-1,
		2,
	}),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow", false, false, nil, {
		19,
		-1,
		2,
	}),
}

deus_widget_detail_definitions.detailed_info_box.content.no_background_changes = true

local versus_widget_definitions = {
	window = UIWidgets.create_simple_texture("matchmaking_top_vs", "window", false, false, nil, {
		-10,
		15,
		2,
	}, "native"),
	loading_status_frame = UIWidgets.create_simple_rotated_texture("matchmaking_icon_effect_morris", 0, {
		71,
		71,
	}, "loading_status_frame", false, false, nil, nil, {
		0,
		3,
		0,
	}),
	window_hotspot = UIWidgets.create_simple_hotspot("window"),
	status_text = UIWidgets.create_simple_text("n/a", "status_text", nil, nil, versus_matchmaking_status_text_style),
}
local versus_widget_detail_definitions = {
	detailed_info_box = UIWidgets.create_simple_texture("matchmaking_animated_panel", "detailed_info_box", false, false, nil, {
		-5,
		-7,
		0,
	}, "native"),
	title_text = UIWidgets.create_simple_text("n/a", "level_key_info_box", nil, nil, title_text_style),
	difficulty_text = UIWidgets.create_simple_text("n/a", "detailed_info_box", nil, nil, versus_difficulty_text_style),
	timer_bg = UIWidgets.create_simple_texture("matchmaking_progressbar_border", "timer_bg", false, false, nil, {
		5,
		-15,
		0,
	}, "native"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "timer_fg", false, false, nil, {
		19,
		-1,
		2,
	}),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow", false, false, nil, {
		19,
		-1,
		2,
	}),
	slot_reservations = create_slot_reservation_widget("slot_reservations", scenegraph_definition.slot_reservations.size),
}

versus_widget_detail_definitions.detailed_info_box.content.no_background_changes = true

local versus_input_widgets = {
	versus_cancel_text_input = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "versus_cancel_text_input", nil, nil, cancel_input_text_style),
	versus_cancel_text_suffix = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "versus_cancel_text_suffix", nil, nil, cancel_text_style),
	versus_cancel_text_prefix = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "versus_cancel_text_prefix", nil, nil, cancel_text_style),
	versus_cancel_icon = UIWidgets.create_simple_texture("xbone_button_icon_a", "versus_cancel_icon"),
	cancel_input_backround = UIWidgets.create_simple_texture("tab_menu_bg_02", "cancel_input_backround"),
}
local cancel_input_widgets = {
	cancel_text_input = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "cancel_text_input", nil, nil, cancel_input_text_style),
	cancel_text_suffix = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "cancel_text_suffix", nil, nil, cancel_text_style),
	cancel_text_prefix = UIWidgets.create_simple_text(Localize("matchmaking_suffix_cancel"), "cancel_text_prefix", nil, nil, cancel_text_style),
	cancel_icon = UIWidgets.create_simple_texture("xbone_button_icon_a", "cancel_icon"),
	cancel_input_backround = UIWidgets.create_simple_texture("tab_menu_bg_02", "cancel_input_backround"),
}
local debug_widget_definitions = {
	debug_box = {
		scenegraph_id = "debug_box",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background_rect",
				},
				{
					pass_type = "text",
					style_id = "debug_text",
					text_id = "debug_text",
				},
			},
		},
		content = {
			debug_text = "",
		},
		style = {
			debug_text = {
				dynamic_font = true,
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "debug_box_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
			},
			background_rect = {
				color = {
					180,
					0,
					0,
					0,
				},
			},
		},
	},
	debug_lobbies = {
		scenegraph_id = "debug_lobbies_box",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background_rect",
				},
				{
					pass_type = "rect",
					style_id = "debug_divider_0",
				},
				{
					pass_type = "rect",
					style_id = "debug_divider_1",
				},
				{
					pass_type = "text",
					style_id = "debug_text",
					text_id = "debug_text",
				},
				{
					pass_type = "text",
					style_id = "debug_match_text",
					text_id = "debug_match_text",
				},
				{
					pass_type = "text",
					style_id = "debug_broken_text",
					text_id = "debug_broken_text",
				},
				{
					pass_type = "text",
					style_id = "debug_valid_text",
					text_id = "debug_valid_text",
				},
				{
					pass_type = "text",
					style_id = "debug_server_text",
					text_id = "debug_server_text",
				},
				{
					pass_type = "text",
					style_id = "debug_level_key_text",
					text_id = "debug_level_key_text",
				},
				{
					pass_type = "text",
					style_id = "debug_selected_level_key_text",
					text_id = "debug_selected_level_key_text",
				},
				{
					pass_type = "text",
					style_id = "debug_matchmaking_text",
					text_id = "debug_matchmaking_text",
				},
				{
					pass_type = "text",
					style_id = "debug_difficulty_text",
					text_id = "debug_difficulty_text",
				},
				{
					pass_type = "text",
					style_id = "debug_num_players_text",
					text_id = "debug_num_players_text",
				},
				{
					pass_type = "text",
					style_id = "debug_wh_text",
					text_id = "debug_wh_text",
				},
				{
					pass_type = "text",
					style_id = "debug_we_text",
					text_id = "debug_we_text",
				},
				{
					pass_type = "text",
					style_id = "debug_dr_text",
					text_id = "debug_dr_text",
				},
				{
					pass_type = "text",
					style_id = "debug_bw_text",
					text_id = "debug_bw_text",
				},
				{
					pass_type = "text",
					style_id = "debug_es_text",
					text_id = "debug_es_text",
				},
				{
					pass_type = "text",
					style_id = "debug_rp_text",
					text_id = "debug_rp_text",
				},
				{
					pass_type = "text",
					style_id = "debug_host_text",
					text_id = "debug_host_text",
				},
				{
					pass_type = "text",
					style_id = "debug_lobby_id_text",
					text_id = "debug_lobby_id_text",
				},
				{
					pass_type = "text",
					style_id = "debug_hash_text",
					text_id = "debug_hash_text",
				},
			},
		},
		content = {
			debug_broken_text = "",
			debug_bw_text = "",
			debug_difficulty_text = "",
			debug_dr_text = "",
			debug_es_text = "",
			debug_hash_text = "",
			debug_host_text = "",
			debug_level_key_text = "",
			debug_lobby_id_text = "",
			debug_match_text = "",
			debug_matchmaking_text = "",
			debug_num_players_text = "",
			debug_rp_text = "",
			debug_selected_level_key_text = "",
			debug_server_text = "",
			debug_text = "Lobbies",
			debug_valid_text = "",
			debug_we_text = "",
			debug_wh_text = "",
		},
		style = {
			debug_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_lobbies_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_server_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_server_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_match_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_match_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_broken_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_broken_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_valid_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_valid_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_level_key_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_level_key_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_selected_level_key_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_selected_level_key_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_matchmaking_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_matchmaking_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_difficulty_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_difficulty_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_num_players_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_num_players_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_wh_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_wh_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_we_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_we_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_dr_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_dr_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_bw_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_bw_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_es_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_es_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_rp_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_rp_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_host_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_host_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_lobby_id_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_lobby_id_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			debug_hash_text = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "debug_hash_text",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_table("white", 255),
			},
			background_rect = {
				color = {
					180,
					0,
					0,
					0,
				},
			},
			debug_divider_0 = {
				scenegraph_id = "debug_divider_0",
				color = {
					150,
					255,
					255,
					255,
				},
			},
			debug_divider_1 = {
				scenegraph_id = "debug_divider_1",
				color = {
					150,
					255,
					255,
					255,
				},
			},
		},
	},
}

return {
	widget_definitions = widget_definitions,
	widget_detail_definitions = widget_detail_definitions,
	deus_widget_definitions = deus_widget_definitions,
	deus_widget_detail_definitions = deus_widget_detail_definitions,
	versus_widget_definitions = versus_widget_definitions,
	versus_widget_detail_definitions = versus_widget_detail_definitions,
	cancel_input_widgets = cancel_input_widgets,
	versus_input_widgets = versus_input_widgets,
	debug_widget_definitions = debug_widget_definitions,
	scenegraph_definition = scenegraph_definition,
}
