-- chunkname: @scripts/ui/views/character_selection_view/states/definitions/character_selection_state_character_definitions.lua

local video_window_width = 426
local video_window_height = 240
local career_info_size = {
	450,
	170,
}
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
			UILayer.default,
		},
	},
	right_side_root = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	left_side_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	hero_info_panel = {
		horizontal_alignment = "left",
		parent = "left_side_root",
		vertical_alignment = "top",
		size = {
			441,
			118,
		},
		position = {
			112,
			-62,
			1,
		},
	},
	hero_info_level_bg = {
		horizontal_alignment = "left",
		parent = "hero_info_panel",
		vertical_alignment = "center",
		size = {
			124,
			138,
		},
		position = {
			-62,
			0,
			2,
		},
	},
	hero_info_divider = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "top",
		size = {
			14,
			790,
		},
		position = {
			0,
			-126,
			-1,
		},
	},
	hero_info_divider_edge = {
		horizontal_alignment = "center",
		parent = "hero_info_divider",
		vertical_alignment = "bottom",
		size = {
			28,
			22,
		},
		position = {
			0,
			-22,
			1,
		},
	},
	info_career_name = {
		horizontal_alignment = "center",
		parent = "hero_info_panel",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			76,
			-16,
			1,
		},
	},
	info_hero_name = {
		horizontal_alignment = "center",
		parent = "info_career_name",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	info_hero_level = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			450,
			25,
		},
		position = {
			0,
			0,
			1,
		},
	},
	locked_info_text = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "top",
		size = {
			641,
			50,
		},
		position = {
			0,
			60,
			1,
		},
	},
	hero_root = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			110,
			130,
		},
		position = {
			80,
			-200,
			100,
		},
	},
	hero_icon_root = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			48,
			144,
		},
		position = {
			-59,
			0,
			100,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "right_side_root",
		vertical_alignment = "top",
		size = {
			career_info_size[1] + 20,
			885,
		},
		position = {
			-50,
			-75,
			1,
		},
	},
	info_window_video = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			video_window_width,
			video_window_height,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	info_video_edge_left = {
		horizontal_alignment = "right",
		parent = "info_window_video",
		vertical_alignment = "top",
		size = {
			230,
			59,
		},
		position = {
			-213,
			12,
			13,
		},
	},
	info_video_edge_right = {
		horizontal_alignment = "left",
		parent = "info_window_video",
		vertical_alignment = "top",
		size = {
			230,
			59,
		},
		position = {
			213,
			12,
			13,
		},
	},
	scrollbar_anchor = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] + 20,
			625,
		},
		position = {
			0,
			-260,
			1,
		},
	},
	scrollbar_window = {
		parent = "scrollbar_anchor",
	},
	passive_window = {
		horizontal_alignment = "center",
		parent = "scrollbar_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			0,
			1,
		},
	},
	passive_icon = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	passive_icon_frame = {
		horizontal_alignment = "center",
		parent = "passive_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	passive_title_text = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.65,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	passive_title_divider = {
		horizontal_alignment = "left",
		parent = "passive_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	passive_type_title = {
		horizontal_alignment = "right",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	passive_description_text = {
		horizontal_alignment = "left",
		parent = "passive_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	active_window = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			-career_info_size[2],
			1,
		},
	},
	active_icon = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	active_icon_frame = {
		horizontal_alignment = "center",
		parent = "active_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	active_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	active_title_divider = {
		horizontal_alignment = "left",
		parent = "active_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	active_type_title = {
		horizontal_alignment = "right",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	active_description_text = {
		horizontal_alignment = "left",
		parent = "active_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	perk_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "bottom",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-50,
			1,
		},
	},
	perk_title_divider = {
		horizontal_alignment = "left",
		parent = "perk_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	career_perk_1 = {
		horizontal_alignment = "left",
		parent = "perk_title_divider",
		vertical_alignment = "bottom",
		size = {
			420,
			1,
		},
		position = {
			10,
			-30,
			1,
		},
	},
	career_perk_2 = {
		horizontal_alignment = "left",
		parent = "career_perk_1",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	career_perk_3 = {
		horizontal_alignment = "left",
		parent = "career_perk_2",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	select_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			0,
			25,
			3,
		},
	},
	bot_priority_button = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			135,
			25,
			103,
		},
	},
	back_button = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			200,
			70,
		},
		position = {
			135,
			25,
			103,
		},
	},
}
local description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 18,
	font_type = "hell_shark_masked",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local type_title_text_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark_masked",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("gray", 200),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header_masked",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_career_style = {
	dynamic_font_size = true,
	font_size = 40,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_name_style = {
	font_size = 30,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_level_style = {
	font_size = 52,
	font_type = "hell_shark",
	horizontal_alignment = "center",
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
local bot_header_text_style = {
	font_size = 65,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		100,
		20,
	},
}
local empty_hero_widget_size = {
	110,
	130,
}
local empty_hero_widget = {
	scenegraph_id = "hero_root",
	offset = {
		0,
		0,
		0,
	},
	element = {
		passes = {
			{
				pass_type = "hover",
			},
			{
				pass_type = "texture",
				style_id = "bg",
				texture_id = "bg",
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_change_function = function (content, style)
					local target = content.is_hover and 255 or 184

					style.color[1] = math.ceil(style.color[1] + 0.1 * (target - style.color[1]))
				end,
			},
		},
	},
	content = {
		bg = "character_slot_empty",
		icon = "icon_hourglass",
	},
	style = {
		bg = {
			texture_size = empty_hero_widget_size,
			offset = {
				0,
				0,
				0,
			},
		},
		icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = UIAtlasHelper.get_atlas_settings_by_texture_name("icon_hourglass").size,
			color = {
				184,
				255,
				255,
				255,
			},
		},
	},
}

local function create_info_text(text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_change_function = function (content, style)
						style.text_color = content.locked and style.locked_text_color or style.default_text_color
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.use_shadow
					end,
				},
			},
		},
		content = {
			disable_with_gamepad = true,
			use_shadow = true,
			text = text,
			original_text = text,
		},
		style = {
			text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("light_blue", 255),
				locked_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				skip_button_rendering = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					2,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local disable_with_gamepad = true
local widgets = {
	background = UIWidgets.create_simple_rect("screen", {
		0,
		0,
		0,
		0,
	}, 100),
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_panel", nil, nil, UISettings.console_menu_rect_color),
	info_window_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
	mask = UIWidgets.create_simple_texture("mask_rect", "scrollbar_anchor"),
	info_window_video = UIWidgets.create_frame("info_window_video", scenegraph_definition.info_window_video.size, "menu_frame_06"),
	info_video_edge_left = UIWidgets.create_simple_texture("frame_detail_03", "info_video_edge_left"),
	info_video_edge_right = UIWidgets.create_simple_uv_texture("frame_detail_03", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "info_video_edge_right"),
	perk_title_text = UIWidgets.create_simple_text(Localize("hero_view_perk_title"), "perk_title_text", nil, nil, sub_title_text_style),
	perk_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "perk_title_divider", true),
	career_perk_1 = UIWidgets.create_career_perk_text("career_perk_1"),
	career_perk_2 = UIWidgets.create_career_perk_text("career_perk_2"),
	career_perk_3 = UIWidgets.create_career_perk_text("career_perk_3"),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider", true),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon", true),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame", true),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider", true),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon", true),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame", true),
}
local info_widgets = {
	locked_info_text = create_info_text(Localize("career_locked_info"), "locked_info_text"),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0,
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	hero_info_divider = UIWidgets.create_simple_texture("divider_vertical_hero_middle", "hero_info_divider"),
	hero_info_divider_edge = UIWidgets.create_simple_texture("divider_vertical_hero_end", "hero_info_divider_edge"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	bot_priority_button = UIWidgets.create_default_button("bot_priority_button", scenegraph_definition.bot_priority_button.size, nil, nil, Localize("input_description_prio_bot"), nil, nil, nil, nil, disable_with_gamepad),
}
local bot_selection_widgets = {
	bot_header_text = UIWidgets.create_simple_text(string.upper(Localize("input_description_prio_bot")), "locked_info_text", nil, nil, bot_header_text_style),
	bot_info_text = create_info_text(Localize("assign_career_tooltip"), "locked_info_text"),
	back_button = UIWidgets.create_default_button("back_button", scenegraph_definition.back_button.size, nil, nil, Localize("back_menu_button_name"), nil, nil, nil, nil, disable_with_gamepad),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_prio_bot",
			input_action = "refresh",
			priority = 1,
		},
	},
	default_back = {
		{
			description_text = "input_description_prio_bot",
			input_action = "refresh",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	available = {
		actions = {
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
	purchase = {
		actions = {
			{
				description_text = "buy_now",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
	prioritize_bots = {
		{
			description_text = "input_description_change_bot_prio",
			input_action = "refresh",
			priority = 1,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
	bot_selection_available = {
		actions = {
			{
				description_text = "input_description_assign_bot",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.main_alpha_multiplier = 0
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_window_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.main_alpha_multiplier = anim_progress
				params.render_settings.info_alpha_multiplier = anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 1,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.main_alpha_multiplier = 1
				params.render_settings.info_alpha_multiplier = 1
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.main_alpha_multiplier = 1 - anim_progress
				params.render_settings.info_alpha_multiplier = 1 - anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_enter_bot_selection = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.bot_selection_alpha_multiplier = anim_progress
				params.render_settings.info_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit_bot_selection = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.info_alpha_multiplier = anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	info_widgets = info_widgets,
	bot_selection_widgets = bot_selection_widgets,
	hero_widget = UIWidgets.create_hero_widget("hero_root", scenegraph_definition.hero_root.size),
	empty_hero_widget = empty_hero_widget,
	hero_icon_widget = UIWidgets.create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size),
	character_selection_widgets = widgets,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
