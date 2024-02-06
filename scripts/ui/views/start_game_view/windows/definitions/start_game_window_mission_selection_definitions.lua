-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_mission_selection_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local large_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2],
}
local info_window_size = {
	window_size[1],
	window_size[2],
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
}
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
			UILayer.default,
		},
	},
	root_fit = {
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
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
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
	window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = large_window_size,
		position = {
			window_size[1] / 2 + window_spacing / 2,
			0,
			1,
		},
	},
	window_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			770,
		},
		position = {
			0,
			0,
			0,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			info_window_size[1] + window_spacing,
			0,
			1,
		},
	},
	act_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			large_window_size[1] - 256,
			256,
		},
		position = {
			0,
			0,
			1,
		},
	},
	end_act_root_node = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			261,
			768,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			106,
			-24,
			10,
		},
	},
	end_level_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			106,
			-24,
			10,
		},
	},
	dlc_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			large_window_size[1],
			200,
		},
		position = {
			0,
			-25,
			1,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			0,
		},
		position = {
			0,
			768,
			14,
		},
	},
	mission_selection_title = {
		horizontal_alignment = "center",
		parent = "title_divider",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			52,
		},
		position = {
			0,
			0,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			window_size[2] / 2,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_texture_frame = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			180,
			180,
		},
		position = {
			0,
			-103,
			2,
		},
	},
	level_texture = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "center",
		size = {
			168,
			168,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	level_texture_lock = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "center",
		size = {
			146,
			146,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_title_divider = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "bottom",
		size = {
			264,
			32,
		},
		position = {
			0,
			-90,
			1,
		},
	},
	level_title = {
		horizontal_alignment = "center",
		parent = "level_title_divider",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			20,
			1,
		},
	},
	helper_text = {
		horizontal_alignment = "center",
		parent = "level_title_divider",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	select_button = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			460,
			72,
		},
		position = {
			0,
			18,
			20,
		},
	},
}
local description_text_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "center",
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
local level_text_style = {
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
local mission_selection_title_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local helper_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
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

local function create_level_widget(scenegraph_id, optional_offset)
	local size = {
		180,
		180,
	}
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "icon",
			content_check_function = function (content)
				return not content.parent.locked
			end,
		},
		{
			level_id = "level_data",
			pass_type = "level_tooltip",
			style_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_glow",
			texture_id = "icon_glow",
			content_check_function = function (content)
				return content.button_hotspot.is_hover or content.button_hotspot.is_selected
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_locked",
			texture_id = "icon",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock_fade",
			texture_id = "lock_fade",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "glass",
			texture_id = "glass",
		},
		{
			pass_type = "rotated_texture",
			style_id = "path",
			texture_id = "path",
			content_check_function = function (content)
				return content.draw_path
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "path_glow",
			texture_id = "path_glow",
			content_check_function = function (content)
				return content.draw_path and content.draw_path_fill and not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "boss_icon",
			texture_id = "boss_icon",
			content_check_function = function (content)
				return content.boss_level
			end,
		},
	}
	local content = {
		boss_icon = "boss_icon",
		boss_level = true,
		draw_path = false,
		draw_path_fill = false,
		frame = "map_frame_00",
		glass = "act_presentation_fg_glass",
		icon = "level_icon_01",
		icon_glow = "map_frame_glow",
		lock = "map_frame_lock",
		lock_fade = "map_frame_fade",
		locked = true,
		path = "mission_select_screen_trail",
		path_glow = "mission_select_screen_trail_fill",
		button_hotspot = {},
	}
	local style = {
		path = {
			angle = 0,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			pivot = {
				0,
				6.5,
			},
			texture_size = {
				216,
				13,
			},
			offset = {
				size[1] / 2,
				0,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		path_glow = {
			angle = 0,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			pivot = {
				0,
				21.5,
			},
			texture_size = {
				216,
				43,
			},
			offset = {
				size[1] / 2,
				0,
				2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		glass = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				216,
				216,
			},
			offset = {
				0,
				0,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				6,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				9,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_fade = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				5,
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
			texture_size = {
				168,
				168,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		icon_locked = {
			horizontal_alignment = "center",
			saturated = true,
			vertical_alignment = "center",
			texture_size = {
				168,
				168,
			},
			color = {
				255,
				100,
				100,
				100,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		icon_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				318,
				318,
			},
			offset = {
				0,
				0,
				0,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		boss_icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				68,
				68,
			},
			offset = {
				0,
				90,
				8,
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
	widget.offset = optional_offset or {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
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

local disable_with_gamepad = true
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "info_window", nil, nil, nil, nil),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "info_window"),
	info_window = UIWidgets.create_frame("info_window", window_size, window_frame, 10),
	window = UIWidgets.create_frame("window", large_window_size, window_frame, 10),
	level_title = UIWidgets.create_simple_text("level_title", "level_title", nil, nil, level_text_style),
	selected_level = create_level_widget("level_texture_frame"),
	window_background = UIWidgets.create_simple_texture("mission_select_screen_bg", "window_background"),
	level_title_divider = UIWidgets.create_simple_texture("divider_01_top", "level_title_divider"),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	helper_text = UIWidgets.create_simple_text(Localize("tutorial_map"), "helper_text", nil, nil, helper_text_style),
	mission_selection_title = UIWidgets.create_simple_text(Localize("start_game_window_mission_selection_header"), "mission_selection_title", nil, nil, mission_selection_title_text_style),
	title_divider = create_window_divider("title_divider", scenegraph_definition.title_divider.size),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("menu_select"), 32, nil, nil, nil, disable_with_gamepad),
}

for i = 1, 20 do
	local scenegraph_id = "level_root_" .. i

	scenegraph_definition[scenegraph_id] = {
		horizontal_alignment = "center",
		parent = "level_root_node",
		vertical_alignment = "center",
		size = {
			180,
			180,
		},
		position = {
			0,
			0,
			1,
		},
	}
end

return {
	widgets = widgets,
	large_window_size = large_window_size,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_level_widget = create_level_widget,
}
