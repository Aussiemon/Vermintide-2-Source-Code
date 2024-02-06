-- chunkname: @scripts/ui/views/level_end/level_end_view_definitions.lua

local_require("scripts/ui/ui_widgets")

local MAX_SCORE_PANEL_ROWS = 20
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
			UILayer.end_screen,
		},
	},
	dead_space_filler_mask = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	console_cursor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			10,
		},
	},
	page_background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			-55,
		},
	},
	edge_rect_left = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			200,
			1080,
		},
		position = {
			-200,
			0,
			25,
		},
	},
	edge_rect_right = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			200,
			1080,
		},
		position = {
			200,
			0,
			25,
		},
	},
	edge_rect_top = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1920,
			200,
		},
		position = {
			0,
			200,
			25,
		},
	},
	edge_rect_bottom = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			200,
		},
		position = {
			0,
			-200,
			25,
		},
	},
	bottom_panel = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			160,
		},
		position = {
			0,
			0,
			1,
		},
	},
	bottom_panel_frame = {
		horizontal_alignment = "center",
		parent = "bottom_panel",
		vertical_alignment = "top",
		size = {
			1950,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	bottom_panel_fade_left = {
		horizontal_alignment = "left",
		parent = "bottom_panel",
		vertical_alignment = "bottom",
		size = {
			600,
			160,
		},
		position = {
			0,
			0,
			3,
		},
	},
	bottom_panel_fade_right = {
		horizontal_alignment = "right",
		parent = "bottom_panel",
		vertical_alignment = "bottom",
		size = {
			600,
			160,
		},
		position = {
			0,
			0,
			3,
		},
	},
	top_panel = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1920,
			160,
		},
		position = {
			0,
			0,
			1,
		},
	},
	top_panel_frame = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			1950,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	},
	top_panel_fade_left = {
		horizontal_alignment = "left",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			600,
			160,
		},
		position = {
			0,
			0,
			3,
		},
	},
	top_panel_fade_right = {
		horizontal_alignment = "right",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			600,
			160,
		},
		position = {
			0,
			0,
			3,
		},
	},
	player_frame_1 = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			-450,
			70,
			2,
		},
	},
	player_frame_2 = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			-150,
			70,
			2,
		},
	},
	player_frame_3 = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			150,
			70,
			2,
		},
	},
	player_frame_4 = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			450,
			70,
			2,
		},
	},
	score_panel = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			700,
		},
		position = {
			0,
			-600,
			10,
		},
	},
	bottom_edge_fade = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			25,
		},
		position = {
			0,
			0,
			13,
		},
	},
	hero_root = {
		horizontal_alignment = "center",
		parent = "score_panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			20,
			1,
		},
	},
	hero_1 = {
		horizontal_alignment = "center",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			250,
			270,
		},
		position = {
			-450,
			0,
			1,
		},
	},
	hero_2 = {
		horizontal_alignment = "center",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			250,
			270,
		},
		position = {
			-150,
			0,
			1,
		},
	},
	hero_3 = {
		horizontal_alignment = "center",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			250,
			270,
		},
		position = {
			150,
			0,
			1,
		},
	},
	hero_4 = {
		horizontal_alignment = "center",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			250,
			270,
		},
		position = {
			450,
			0,
			1,
		},
	},
	reward_entry_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			300,
			300,
		},
		position = {
			0,
			0,
			1,
		},
	},
	reset_button = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			64,
			64,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_up = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			354,
			180,
		},
		position = {
			0,
			120,
			1,
		},
	},
	summary_entry_root = {
		horizontal_alignment = "center",
		parent = "top_panel",
		vertical_alignment = "top",
		size = {
			1600,
			40,
		},
		position = {
			0,
			-300,
			1,
		},
	},
	timer_bg = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			400,
			60,
		},
		position = {
			90,
			85,
			1,
		},
	},
	timer_text = {
		horizontal_alignment = "left",
		parent = "timer_bg",
		vertical_alignment = "center",
		size = {
			1600,
			60,
		},
		position = {
			50,
			0,
			1,
		},
	},
	ready_button_alone = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			0,
			80,
			15,
		},
	},
	ready_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			250,
			80,
			15,
		},
	},
	retry_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			-250,
			80,
			1,
		},
	},
	page_selector = {
		horizontal_alignment = "center",
		parent = "ready_button_alone",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			0,
			-40,
			10,
		},
	},
	bottom_glow = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			1280,
		},
		position = {
			0,
			0,
			-597,
		},
	},
	bottom_glow_short = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			375,
		},
		position = {
			0,
			0,
			-596,
		},
	},
	bottom_glow_shortest = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			200,
		},
		position = {
			0,
			0,
			-595,
		},
	},
}

local function create_checkboxes(scenegraph_id, color)
	local size = {
		30,
		30,
	}
	local spacing = 7
	local base_offset = {
		spacing,
		size[2] + spacing,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "checkbox_1",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						return GameSettingsDevelopment.allow_retry_weave and content.votes > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "checkbox_2",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						return GameSettingsDevelopment.allow_retry_weave and content.votes > 1
					end,
				},
				{
					pass_type = "texture",
					style_id = "checkbox_3",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						return GameSettingsDevelopment.allow_retry_weave and content.votes > 2
					end,
				},
				{
					pass_type = "texture",
					style_id = "checkbox_4",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						return GameSettingsDevelopment.allow_retry_weave and content.votes > 3
					end,
				},
			},
		},
		content = {
			texture_id = "matchmaking_checkbox",
			votes = 0,
		},
		style = {
			checkbox_1 = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					base_offset[1] + (size[1] + spacing) * 0,
					base_offset[2],
					0,
				},
				texture_size = size,
			},
			checkbox_2 = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					base_offset[1] + (size[1] + spacing) * 1,
					base_offset[2],
					0,
				},
				texture_size = size,
			},
			checkbox_3 = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					base_offset[1] + (size[1] + spacing) * 2,
					base_offset[2],
					0,
				},
				texture_size = size,
			},
			checkbox_4 = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					base_offset[1] + (size[1] + spacing) * 3,
					base_offset[2],
					0,
				},
				texture_size = size,
			},
		},
		offset = {
			0,
			0,
			10,
		},
		scenegraph_id = scenegraph_id,
	}
end

local timer_text_style = {
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
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
local player_title_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local leave_party_text = IS_XB1 and "leave_party_xb1" or "leave_party"
local masked = true
local disable_with_gamepad = true
local widgets_definitions = {
	timer_text = UIWidgets.create_simple_text(Localize("timer_prefix_time_left"), "timer_text", nil, nil, timer_text_style),
	timer_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "timer_bg"),
	ready_button = UIWidgets.create_default_button("ready_button", scenegraph_definition.ready_button.size, nil, nil, Localize("return_to_inn"), 32, nil, nil, nil, disable_with_gamepad),
	reset_button = UIWidgets.create_simple_two_state_button("reset_button", "scroll_bar_button_up", "scroll_bar_button_up_clicked"),
	page_background = UIWidgets.create_simple_rect("page_background", {
		150,
		0,
		0,
		0,
	}),
	retry_checkboxes = create_checkboxes("retry_button", {
		255,
		0,
		255,
		0,
	}),
	reload_checkboxes = create_checkboxes("ready_button", {
		255,
		255,
		0,
		0,
	}),
	dead_space_filler_mask = UIWidgets.create_simple_texture("mask_rect", "dead_space_filler", false, false, {
		255,
		255,
		255,
		255,
	}),
	dead_space_filler_unmask = UIWidgets.create_simple_texture("mask_rect", "dead_space_filler_mask", false, false, {
		1,
		21,
		21,
		21,
	}),
}
local bottom_glow_back_smoke_color = {
	200,
	138,
	0,
	147,
}
local bottom_glow_front_smoke_color = {
	255,
	138,
	0,
	187,
}
local bottom_glow_front_2_smoke_color = {
	200,
	128,
	0,
	217,
}
local bottom_glow_back_ember_color = {
	130,
	255,
	255,
	255,
}
local weave_widget_definitions = {
	bottom_glow_smoke_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_1", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow", nil, nil, bottom_glow_back_smoke_color),
	bottom_glow_smoke_2 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_2", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_short", nil, nil, bottom_glow_front_smoke_color),
	bottom_glow_smoke_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_2", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_shortest", nil, nil, bottom_glow_front_2_smoke_color),
	bottom_glow_embers_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_1", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow", nil, nil, bottom_glow_back_ember_color, 1),
	bottom_glow_embers_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_3", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_short", nil, nil, bottom_glow_back_ember_color, 1),
	dead_space_filler = UIWidgets.create_simple_texture("rect_masked", "dead_space_filler", false, false, {
		255,
		0,
		0,
		0,
	}),
}
local animations = {
	ready_button_entry_alone = {
		{
			end_progress = 0.3,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeCubic(progress)
				local anim_progress = math.easeCubic(1 - progress)

				ui_scenegraph.ready_button_alone.local_position[2] = scenegraph_definition.ready_button_alone.position[2] - 100 * anim_progress
				params.render_settings.alpha_multiplier = alpha_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	ready_button_entry = {
		{
			end_progress = 0.3,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeCubic(progress)
				local anim_progress = math.easeCubic(1 - progress)

				ui_scenegraph.ready_button.local_position[2] = scenegraph_definition.ready_button.position[2] - 100 * anim_progress
				params.render_settings.alpha_multiplier = alpha_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	retry_button_entry = {
		{
			end_progress = 0.3,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeCubic(progress)
				local anim_progress = math.easeCubic(1 - progress)

				ui_scenegraph.retry_button.local_position[2] = scenegraph_definition.retry_button.position[2] - 100 * anim_progress
				params.render_settings.alpha_multiplier = alpha_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "scoreboard_navigation",
			input_action = "analog_input",
			priority = 1,
		},
		{
			description_text = "return_to_inn",
			input_action = "refresh",
			priority = 3,
		},
	},
	profile_available = {
		actions = {
			{
				description_text = "input_description_show_profile",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
}

return {
	num_reward_entries = num_reward_entries,
	num_experience_entries = num_experience_entries,
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions,
	weave_widget_definitions = weave_widget_definitions,
	animations = animations,
	generic_input_actions = generic_input_actions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
}
