-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	craft_bg_root = console_menu_scenegraphs.craft_bg_root,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	craft_bar = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			376,
			370,
		},
		position = {
			0,
			0,
			7,
		},
	},
	craft_bar_spark = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			80,
			20,
		},
		position = {
			-1,
			155,
			8,
		},
	},
	item_tooltip = {
		horizontal_alignment = "right",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			-60,
			-150,
			20,
		},
	},
	item_tooltip_result = {
		horizontal_alignment = "right",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			-60,
			-100,
			20,
		},
	},
	craft_bg = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			394,
			394,
		},
		position = {
			0,
			0,
			1,
		},
	},
	crafting_mask = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			394,
			394,
		},
		position = {
			0,
			0,
			1,
		},
	},
	craft_lock_shadow = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			394,
			394,
		},
		position = {
			0,
			0,
			15,
		},
	},
	craft_lock_top_left = {
		horizontal_alignment = "right",
		parent = "craft_bg",
		vertical_alignment = "top",
		size = {
			208,
			312,
		},
		position = {
			-197,
			0,
			16,
		},
	},
	craft_lock_top_right = {
		horizontal_alignment = "left",
		parent = "craft_bg",
		vertical_alignment = "top",
		size = {
			208,
			312,
		},
		position = {
			197,
			0,
			16,
		},
	},
	craft_lock_top_effect = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "top",
		size = {
			39,
			189,
		},
		position = {
			0,
			-100,
			17,
		},
	},
	craft_lock_bottom_left = {
		horizontal_alignment = "right",
		parent = "craft_bg",
		vertical_alignment = "bottom",
		size = {
			180,
			208,
		},
		position = {
			-197,
			-22,
			16,
		},
	},
	craft_lock_bottom_right = {
		horizontal_alignment = "left",
		parent = "craft_bg",
		vertical_alignment = "bottom",
		size = {
			180,
			208,
		},
		position = {
			197,
			-22,
			16,
		},
	},
	craft_effect_bottom_left = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			39,
			189,
		},
		position = {
			-130,
			-80,
			18,
		},
	},
	craft_effect_bottom_right = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			39,
			189,
		},
		position = {
			130,
			-80,
			18,
		},
	},
	craft_lock_eye_left = {
		horizontal_alignment = "right",
		parent = "craft_lock_top_left",
		vertical_alignment = "bottom",
		size = {
			224,
			217,
		},
		position = {
			56,
			-20,
			1,
		},
	},
	craft_lock_eye_right = {
		horizontal_alignment = "left",
		parent = "craft_lock_top_right",
		vertical_alignment = "bottom",
		size = {
			224,
			217,
		},
		position = {
			-56,
			-20,
			1,
		},
	},
	crafting_glow = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			800,
			800,
		},
		position = {
			0,
			0,
			10,
		},
	},
	craft_bg_detail = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "center",
		size = {
			522,
			522,
		},
		position = {
			0,
			0,
			20,
		},
	},
	craft_icon_connection = {
		horizontal_alignment = "center",
		parent = "craft_bg",
		vertical_alignment = "bottom",
		size = {
			135,
			102,
		},
		position = {
			0,
			-68,
			31,
		},
	},
	description_bg = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "top",
		size = {
			600,
			200,
		},
		position = {
			0,
			142,
			30,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "description_bg",
		vertical_alignment = "top",
		size = {
			window_size[1] - 40,
			50,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	title_text_divider = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			264,
			32,
		},
		position = {
			0,
			-28,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "title_text_divider",
		vertical_alignment = "top",
		size = {
			500,
			50,
		},
		position = {
			0,
			-36,
			2,
		},
	},
	item_grid_fg = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			window_size[1],
			440,
		},
		position = {
			0,
			0,
			20,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
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
local page_number_left_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(window_size[1] * 0.1 + 5),
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		window_size[1] * 0.1 + 4,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}
local tooltip_passes = table.clone(UISettings.console_tooltip_pass_definitions)

tooltip_passes[#tooltip_passes + 1] = "craft_item_background"
tooltip_passes[#tooltip_passes + 1] = "craft_item_new_frame"
tooltip_passes[#tooltip_passes + 1] = "craft_item_reward_title"

local masked = true
local widgets = {
	craft_bar_bg = UIWidgets.create_simple_texture("console_crafting_bar_bg", "craft_bar", nil, nil, nil, -2),
	craft_bar = UIWidgets.create_simple_gradient_mask_texture("gamepad_crafting_bar_mask", "craft_bar"),
	craft_lock_shadow = UIWidgets.create_simple_texture("console_crafting_disc_big_bg", "craft_lock_shadow", nil, nil, {
		0,
		0,
		0,
		0,
	}),
	craft_lock_top_left = UIWidgets.create_simple_rotated_texture("console_crafting_animation_slice_upper", 0, {
		208,
		312,
	}, "craft_lock_top_left", masked),
	craft_lock_top_right = UIWidgets.create_simple_uv_rotated_texture("console_crafting_animation_slice_upper", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, 0, {
		0,
		312,
	}, "craft_lock_top_right", masked),
	craft_lock_top_effect = UIWidgets.create_simple_texture("console_crafting_animation_dust", "craft_lock_top_effect", masked),
	craft_lock_bottom_left = UIWidgets.create_simple_uv_texture("console_crafting_animation_slice_lower", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "craft_lock_bottom_left", masked),
	craft_lock_bottom_right = UIWidgets.create_simple_texture("console_crafting_animation_slice_lower", "craft_lock_bottom_right", masked),
	craft_effect_bottom_left = UIWidgets.create_simple_rotated_texture("console_crafting_animation_dust", math.pi / 3, {
		19.5,
		94.5,
	}, "craft_effect_bottom_left", masked),
	craft_effect_bottom_right = UIWidgets.create_simple_uv_rotated_texture("console_crafting_animation_dust", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, math.pi * 2 - math.pi / 3, {
		19.5,
		94.5,
	}, "craft_effect_bottom_right", masked),
	craft_lock_eye_left = UIWidgets.create_simple_texture("console_crafting_animation_eye", "craft_lock_eye_left", masked),
	craft_lock_eye_right = UIWidgets.create_simple_uv_texture("console_crafting_animation_eye", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "craft_lock_eye_right", masked),
	crafting_mask = UIWidgets.create_simple_texture("mask_circular", "crafting_mask"),
	craft_bg = UIWidgets.create_simple_rotated_texture("console_crafting_disc_big_bg", 0, {
		197,
		197,
	}, "craft_bg"),
	craft_bg_detail = UIWidgets.create_simple_rotated_texture("console_crafting_disc_big_decorations", 0, {
		261,
		261,
	}, "craft_bg_detail"),
	crafting_glow = UIWidgets.create_simple_texture("console_crafting_disc_small_outer_glow", "crafting_glow"),
	craft_icon_connection = UIWidgets.create_simple_texture("console_crafting_disc_connector", "craft_icon_connection"),
	description_bg = UIWidgets.create_rect_with_outer_frame("description_bg", scenegraph_definition.description_bg.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	title_text_divider = UIWidgets.create_simple_texture("divider_01_top", "title_text_divider"),
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip_result", tooltip_passes),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 2,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	filter_selected = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 2,
		},
		{
			description_text = "lb_reset_filters",
			input_action = "special_1",
			priority = 3,
		},
		{
			description_text = "input_description_filter",
			input_action = "confirm",
			priority = 4,
		},
		{
			description_text = "lb_search",
			input_action = "refresh",
			priority = 5,
			content_check_function = function ()
				return not IS_WINDOWS
			end,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	filter_active = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "lb_reset_filters",
			input_action = "special_1",
			priority = 3,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
}
local input_actions = {
	salvage = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_salvage",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	salvage_auto = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_salvage_auto_fill",
				input_action = "right_stick_press",
				priority = 3,
			},
			{
				description_text = "hero_view_crafting_salvage",
				input_action = "refresh",
				priority = 4,
			},
		},
	},
	craft_random_item = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_craft",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	reroll_weapon_properties = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_properties",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	reroll_weapon_traits = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_trait",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	upgrade_item_rarity_common = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_upgrade",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	apply_weapon_skin = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_apply_skin",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	convert_blue_dust = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_convert",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	disabled = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
		},
	},
	disabled_auto = {
		actions = {
			{
				description_text = "input_description_reset",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "hero_view_crafting_salvage_auto_fill",
				input_action = "right_stick_press",
				priority = 3,
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
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	reset_crafting = {
		{
			end_progress = 0,
			name = "reset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local craft_lock_top_left = widgets.craft_lock_top_left
				local craft_lock_top_right = widgets.craft_lock_top_right
				local max_angle = math.pi / 2

				craft_lock_top_left.style.texture_id.angle = max_angle
				craft_lock_top_right.style.texture_id.angle = -max_angle

				local craft_lock_bottom_left = widgets.craft_lock_bottom_left
				local craft_lock_bottom_right = widgets.craft_lock_bottom_right

				craft_lock_bottom_left.offset[2] = -208
				craft_lock_bottom_right.offset[2] = -208

				local craft_lock_eye_left = widgets.craft_lock_eye_left
				local craft_lock_eye_right = widgets.craft_lock_eye_right
				local style_eye_left = craft_lock_eye_left.style.texture_id
				local style_eye_right = craft_lock_eye_right.style.texture_id
				local eye_width = 224
				local eye_height = 217

				style_eye_left.color[1] = 0
				style_eye_left.horizontal_alignment = "center"
				style_eye_left.vertical_alignment = "center"
				style_eye_left.texture_size = style_eye_left.texture_size or {
					eye_width,
					eye_height,
				}
				style_eye_right.color[1] = 0
				style_eye_right.horizontal_alignment = "center"
				style_eye_right.vertical_alignment = "center"
				style_eye_right.texture_size = style_eye_right.texture_size or {
					eye_width,
					eye_height,
				}

				local effect_width = 39
				local effect_height = 189
				local craft_lock_top_effect = widgets.craft_lock_top_effect
				local style_lock_top_effect = craft_lock_top_effect.style.texture_id

				style_lock_top_effect.color[1] = 0
				style_lock_top_effect.horizontal_alignment = "center"
				style_lock_top_effect.vertical_alignment = "center"
				style_lock_top_effect.texture_size = style_lock_top_effect.texture_size or {
					effect_width,
					effect_height,
				}

				local craft_effect_bottom_left = widgets.craft_effect_bottom_left
				local style_effect_bottom_left = craft_effect_bottom_left.style.texture_id

				style_effect_bottom_left.color[1] = 0
				style_effect_bottom_left.horizontal_alignment = "center"
				style_effect_bottom_left.vertical_alignment = "center"
				style_effect_bottom_left.texture_size = style_effect_bottom_left.texture_size or {
					effect_width,
					effect_height,
				}

				local craft_effect_bottom_right = widgets.craft_effect_bottom_right
				local style_effect_bottom_right = craft_effect_bottom_right.style.texture_id

				style_effect_bottom_right.color[1] = 0
				style_effect_bottom_right.horizontal_alignment = "center"
				style_effect_bottom_right.vertical_alignment = "center"
				style_effect_bottom_right.texture_size = style_effect_bottom_right.texture_size or {
					effect_width,
					effect_height,
				}
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	craft_enter = {
		{
			end_progress = 0,
			name = "reset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local craft_lock_top_left = widgets.craft_lock_top_left
				local craft_lock_top_right = widgets.craft_lock_top_right
				local max_angle = math.pi / 2

				craft_lock_top_left.style.texture_id.angle = max_angle
				craft_lock_top_right.style.texture_id.angle = -max_angle

				local craft_lock_bottom_left = widgets.craft_lock_bottom_left
				local craft_lock_bottom_right = widgets.craft_lock_bottom_right

				craft_lock_bottom_left.offset[2] = -208
				craft_lock_bottom_right.offset[2] = -208

				local craft_lock_eye_left = widgets.craft_lock_eye_left
				local craft_lock_eye_right = widgets.craft_lock_eye_right
				local style_eye_left = craft_lock_eye_left.style.texture_id
				local style_eye_right = craft_lock_eye_right.style.texture_id
				local eye_width = 224
				local eye_height = 217

				style_eye_left.color[1] = 0
				style_eye_left.horizontal_alignment = "center"
				style_eye_left.vertical_alignment = "center"
				style_eye_left.texture_size = style_eye_left.texture_size or {
					eye_width,
					eye_height,
				}
				style_eye_right.color[1] = 0
				style_eye_right.horizontal_alignment = "center"
				style_eye_right.vertical_alignment = "center"
				style_eye_right.texture_size = style_eye_right.texture_size or {
					eye_width,
					eye_height,
				}

				local effect_width = 39
				local effect_height = 189
				local craft_lock_top_effect = widgets.craft_lock_top_effect
				local style_lock_top_effect = craft_lock_top_effect.style.texture_id

				style_lock_top_effect.color[1] = 0
				style_lock_top_effect.horizontal_alignment = "center"
				style_lock_top_effect.vertical_alignment = "top"
				style_lock_top_effect.texture_size = style_lock_top_effect.texture_size or {
					effect_width,
					effect_height,
				}

				local craft_effect_bottom_left = widgets.craft_effect_bottom_left
				local style_effect_bottom_left = craft_effect_bottom_left.style.texture_id

				style_effect_bottom_left.color[1] = 0
				style_effect_bottom_left.horizontal_alignment = "center"
				style_effect_bottom_left.vertical_alignment = "center"
				style_effect_bottom_left.texture_size = style_effect_bottom_left.texture_size or {
					effect_width,
					effect_height,
				}

				local craft_effect_bottom_right = widgets.craft_effect_bottom_right
				local style_effect_bottom_right = craft_effect_bottom_right.style.texture_id

				style_effect_bottom_right.color[1] = 0
				style_effect_bottom_right.horizontal_alignment = "center"
				style_effect_bottom_right.vertical_alignment = "center"
				style_effect_bottom_right.texture_size = style_effect_bottom_right.texture_size or {
					effect_width,
					effect_height,
				}
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "shadow",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_shadow = widgets.craft_lock_shadow
				local style = craft_lock_shadow.style.texture_id

				style.color[1] = 200 * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "top",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_top_left = widgets.craft_lock_top_left
				local craft_lock_top_right = widgets.craft_lock_top_right
				local max_angle = math.pi / 2
				local ease_progress = math.easeInCubic(progress)
				local anim_progress = math.catmullrom(ease_progress, -7.4, 0, 1, 0.7)

				craft_lock_top_left.style.texture_id.angle = max_angle - max_angle * anim_progress
				craft_lock_top_right.style.texture_id.angle = -max_angle + max_angle * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "top_effect",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_top_effect = widgets.craft_lock_top_effect
				local style = craft_lock_top_effect.style.texture_id
				local offset = craft_lock_top_effect.offset

				style.color[1] = 150 - 150 * math.easeInCubic(progress)
				offset[2] = -50 * math.easeOutCubic(progress)

				local effect_width = 78
				local effect_height = 378

				style.texture_size[1] = effect_width * progress
				style.texture_size[2] = effect_height * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "bottom",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_bottom_left = widgets.craft_lock_bottom_left
				local craft_lock_bottom_right = widgets.craft_lock_bottom_right
				local anim_progress = math.catmullrom(progress, -7.4, 0, 1, 0.7)
				local distance = 208

				craft_lock_bottom_left.offset[2] = -distance + anim_progress * distance
				craft_lock_bottom_right.offset[2] = -distance + anim_progress * distance
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.1,
			name = "bottom_effect_left",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_effect_bottom_left = widgets.craft_effect_bottom_left
				local style = craft_effect_bottom_left.style.texture_id
				local offset = craft_effect_bottom_left.offset
				local anim_progress = math.easeOutCubic(progress)

				style.color[1] = 80 - 80 * math.easeInCubic(progress)

				local effect_width = 27.299999999999997
				local effect_height = 132.29999999999998
				local pivot = style.pivot
				local texture_size = style.texture_size

				texture_size[1] = effect_width + effect_width * anim_progress
				texture_size[2] = effect_height * anim_progress
				pivot[1] = texture_size[1] / 2
				pivot[2] = texture_size[2] / 2

				local offset_value = (effect_width - texture_size[1]) * 0.5

				offset[1] = offset_value
				offset[2] = offset_value * 0.5
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.1,
			name = "bottom_effect_right",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_effect_bottom_right = widgets.craft_effect_bottom_right
				local style = craft_effect_bottom_right.style.texture_id
				local offset = craft_effect_bottom_right.offset
				local anim_progress = math.easeOutCubic(progress)

				style.color[1] = 80 - 80 * math.easeInCubic(progress)

				local effect_width = 27.299999999999997
				local effect_height = 132.29999999999998
				local pivot = style.pivot
				local texture_size = style.texture_size

				texture_size[1] = effect_width + effect_width * anim_progress
				texture_size[2] = effect_height * anim_progress
				pivot[1] = texture_size[1] / 2
				pivot[2] = texture_size[2] / 2

				local offset_value = (effect_width - texture_size[1]) * 0.5

				offset[1] = -offset_value
				offset[2] = offset_value * 0.5
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "eyes",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_eye_left = widgets.craft_lock_eye_left
				local craft_lock_eye_right = widgets.craft_lock_eye_right
				local style_eye_left = craft_lock_eye_left.style.texture_id
				local style_eye_right = craft_lock_eye_right.style.texture_id
				local alpha = 255 * progress

				style_eye_left.color[1] = alpha
				style_eye_right.color[1] = alpha

				local eye_width = 224
				local eye_height = 217

				style_eye_left.texture_size[1] = eye_width * progress
				style_eye_left.texture_size[2] = eye_height * progress
				style_eye_right.texture_size[1] = eye_width * progress
				style_eye_right.texture_size[2] = eye_height * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	craft_exit = {
		{
			end_progress = 0.15,
			name = "eyes",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_eye_left = widgets.craft_lock_eye_left
				local craft_lock_eye_right = widgets.craft_lock_eye_right
				local style_eye_left = craft_lock_eye_left.style.texture_id
				local style_eye_right = craft_lock_eye_right.style.texture_id

				progress = 1 - progress

				local alpha = 255 * progress

				style_eye_left.color[1] = alpha
				style_eye_right.color[1] = alpha

				local eye_width = 224
				local eye_height = 217

				style_eye_left.texture_size[1] = eye_width * progress
				style_eye_left.texture_size[2] = eye_height * progress
				style_eye_right.texture_size[1] = eye_width * progress
				style_eye_right.texture_size[2] = eye_height * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "shadow",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local craft_lock_shadow = widgets.craft_lock_shadow
				local style = craft_lock_shadow.style.texture_id

				style.color[1] = 200 - 200 * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "top",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				progress = 1 - progress

				local craft_lock_top_left = widgets.craft_lock_top_left
				local craft_lock_top_right = widgets.craft_lock_top_right
				local max_angle = math.pi / 2

				craft_lock_top_left.style.texture_id.angle = max_angle - max_angle * progress
				craft_lock_top_right.style.texture_id.angle = -max_angle + max_angle * progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "bottom",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				progress = 1 - progress

				local craft_lock_bottom_left = widgets.craft_lock_bottom_left
				local craft_lock_bottom_right = widgets.craft_lock_bottom_right
				local distance = 208

				craft_lock_bottom_left.offset[2] = -distance + progress * distance
				craft_lock_bottom_right.offset[2] = -distance + progress * distance
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	input_actions = input_actions,
}
