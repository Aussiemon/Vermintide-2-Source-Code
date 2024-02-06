﻿-- chunkname: @scripts/ui/views/hero_view/windows/store/definitions/store_window_item_details_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local window_size = {
	550,
	700,
}
local inner_window_size = {
	window_size[1] - 84,
	window_size[2] - 84,
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	window = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = window_size,
		position = {
			130,
			-215,
			10,
		},
	},
	window_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			0,
		},
	},
	paper_background = {
		horizontal_alignment = "center",
		parent = "window_background",
		vertical_alignment = "center",
		size = {
			470,
			620,
		},
		position = {
			0,
			0,
			2,
		},
	},
	top_banner = {
		horizontal_alignment = "center",
		parent = "paper_background",
		vertical_alignment = "top",
		size = {
			470,
			92,
		},
		position = {
			0,
			20,
			1,
		},
	},
	top_banner_fade = {
		horizontal_alignment = "center",
		parent = "background_edge_top",
		vertical_alignment = "bottom",
		size = {
			470,
			30,
		},
		position = {
			0,
			-25,
			-1,
		},
	},
	item_icon_holder = {
		horizontal_alignment = "center",
		parent = "paper_background",
		vertical_alignment = "top",
		size = {
			369,
			136,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	item_icon = {
		horizontal_alignment = "center",
		parent = "item_icon_holder",
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
	item_icon_mask = {
		horizontal_alignment = "center",
		parent = "item_icon_holder",
		vertical_alignment = "center",
		size = {
			80,
			82,
		},
		position = {
			0,
			0,
			1,
		},
	},
	background_edge_top = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] - 42,
			42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_bottom = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - 42,
			42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			42,
			window_size[2] - 42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			42,
			window_size[2] - 42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	corner_bottom_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			151,
			151,
		},
		position = {
			-6,
			-6,
			5,
		},
	},
	corner_bottom_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			151,
			151,
		},
		position = {
			6,
			-6,
			5,
		},
	},
	corner_top_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			151,
			151,
		},
		position = {
			-6,
			6,
			5,
		},
	},
	corner_top_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			151,
			151,
		},
		position = {
			6,
			6,
			5,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "item_icon_holder",
		vertical_alignment = "top",
		size = {
			380,
			40,
		},
		position = {
			0,
			-140,
			2,
		},
	},
	title_text_edge_top = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "top",
		size = {
			380,
			4,
		},
		position = {
			0,
			4,
			1,
		},
	},
	title_text_edge_bottom = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			380,
			4,
		},
		position = {
			0,
			-4,
			1,
		},
	},
	sub_title_text = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			320,
			30,
		},
		position = {
			0,
			-35,
			2,
		},
	},
	sub_title_text_edge_left = {
		horizontal_alignment = "left",
		parent = "sub_title_text",
		vertical_alignment = "center",
		size = {
			20,
			14,
		},
		position = {
			-20,
			0,
			1,
		},
	},
	sub_title_text_edge_right = {
		horizontal_alignment = "right",
		parent = "sub_title_text",
		vertical_alignment = "center",
		size = {
			20,
			14,
		},
		position = {
			20,
			0,
			1,
		},
	},
	sub_title_divider = {
		horizontal_alignment = "center",
		parent = "sub_title_text",
		vertical_alignment = "bottom",
		size = {
			200,
			20,
		},
		position = {
			0,
			-25,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "sub_title_text",
		vertical_alignment = "top",
		size = {
			350,
			200,
		},
		position = {
			0,
			-60,
			2,
		},
	},
	career_icons = {
		horizontal_alignment = "center",
		parent = "paper_background",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			0,
			50,
			2,
		},
	},
	hero_text_divider = {
		horizontal_alignment = "center",
		parent = "career_icons",
		vertical_alignment = "top",
		size = {
			200,
			20,
		},
		position = {
			0,
			75,
			1,
		},
	},
	hero_text = {
		horizontal_alignment = "center",
		parent = "hero_text_divider",
		vertical_alignment = "top",
		size = {
			320,
			30,
		},
		position = {
			0,
			-18,
			1,
		},
	},
}
local title_text_style = {
	dynamic_font_size = false,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		-2,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		0,
		0,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = false,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		0,
		0,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}

local function create_career_icon(scenegraph_id)
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					additional_option_id = "tooltip",
					pass_type = "additional_option_tooltip",
					style_id = "tooltip",
					content_passes = {
						"additional_option_info",
					},
					content_check_function = function (content)
						return content.tooltip and content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
			},
		},
		content = {
			background = "store_preview_info_career_icon_border",
			icon = "store_preview_info_career_icon_border",
			tooltip = {},
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
		style = {
			button_hotspot = {
				size = {
					50,
					50,
				},
				offset = {
					-25,
					-25,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				offset = {
					0,
					0,
					0,
				},
				texture_size = {
					48,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				offset = {
					0,
					0,
					1,
				},
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			tooltip = {
				grow_downwards = false,
				horizontal_alignment = "center",
				max_width = 300,
				vertical_alignment = "top",
				offset = {
					0,
					0,
					0,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local widgets = {
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_03", {
		256,
		256,
	}),
	window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_background", nil, nil, nil, 1),
	paper_background = UIWidgets.create_simple_texture("store_preview_info_paper", "paper_background"),
	top_banner = UIWidgets.create_simple_texture("store_preview_info_ribbon", "top_banner"),
	top_banner_fade = UIWidgets.create_simple_uv_texture("edge_fade_small", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "top_banner_fade"),
	item_icon_holder = UIWidgets.create_simple_texture("store_preview_info_icon_frame", "item_icon_holder"),
	item_icon = UIWidgets.create_simple_texture("options_window_fade_01", "item_icon", true),
	item_icon_mask = UIWidgets.create_simple_texture("store_preview_info_icon_mask", "item_icon_mask"),
	background_edge_top = UIWidgets.create_tiled_texture("background_edge_top", "store_frame_small_side_01", {
		128,
		42,
	}),
	background_edge_bottom = UIWidgets.create_tiled_texture("background_edge_bottom", "store_frame_small_side_03", {
		128,
		42,
	}),
	background_edge_left = UIWidgets.create_tiled_texture("background_edge_left", "store_frame_small_side_04", {
		42,
		128,
	}),
	background_edge_right = UIWidgets.create_tiled_texture("background_edge_right", "store_frame_small_side_02", {
		42,
		128,
	}),
	corner_bottom_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", 0, {
		75.5,
		75.5,
	}, "corner_bottom_left"),
	corner_bottom_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", -math.pi / 2, {
		75.5,
		75.5,
	}, "corner_bottom_right"),
	corner_top_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi / 2, {
		75.5,
		75.5,
	}, "corner_top_left"),
	corner_top_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi, {
		75.5,
		75.5,
	}, "corner_top_right"),
	title_text_background = UIWidgets.create_simple_texture("store_preview_info_text_backdrop", "title_text"),
	title_text_edge_top = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "title_text_edge_top"),
	title_text_edge_bottom = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "title_text_edge_bottom"),
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("n/a", "sub_title_text", nil, nil, sub_title_text_style),
	sub_title_text_edge_right = UIWidgets.create_simple_uv_texture("store_preview_info_arrow", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "sub_title_text_edge_right"),
	sub_title_text_edge_left = UIWidgets.create_simple_texture("store_preview_info_arrow", "sub_title_text_edge_left"),
	sub_title_divider = UIWidgets.create_simple_texture("journal_content_divider_medium", "sub_title_divider"),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	hero_text_divider = UIWidgets.create_simple_texture("journal_content_divider_medium", "hero_text_divider"),
	hero_text = UIWidgets.create_simple_text("n/a", "hero_text", nil, nil, sub_title_text_style),
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

				local addition_width = 250
				local animated_width = addition_width * anim_progress
				local default_window_position = scenegraph_definition.window.position

				ui_scenegraph.window.local_position[1] = math.floor(default_window_position[1] + addition_width - animated_width)
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
}

return {
	widgets = widgets,
	create_career_icon = create_career_icon,
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
