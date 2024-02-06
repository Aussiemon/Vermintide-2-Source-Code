-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_difficulty_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] * 2 + window_spacing * 2
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local large_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2],
}
local difficulty_option_size = {
	large_window_size[1] - 20,
	108,
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
	info_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			window_size[1] + window_spacing,
			0,
			1,
		},
	},
	difficulty_root = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			10,
			-16,
			3,
		},
	},
	difficulty_option = {
		horizontal_alignment = "left",
		parent = "difficulty_root",
		vertical_alignment = "top",
		size = difficulty_option_size,
		position = {
			0,
			0,
			0,
		},
	},
	difficulty_texture = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			150,
			150,
		},
		position = {
			0,
			-60,
			1,
		},
	},
	difficulty_title = {
		horizontal_alignment = "center",
		parent = "difficulty_texture",
		vertical_alignment = "center",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-108,
			1,
		},
	},
	difficulty_title_divider = {
		horizontal_alignment = "center",
		parent = "difficulty_title",
		vertical_alignment = "center",
		size = {
			264,
			32,
		},
		position = {
			0,
			-55,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "difficulty_title_divider",
		vertical_alignment = "center",
		size = {
			window_text_width,
			window_size[2] / 2,
		},
		position = {
			0,
			-65,
			1,
		},
	},
	background_fade = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "center",
		size = {
			window_size[1],
			200,
		},
		position = {
			0,
			15,
			0,
		},
	},
	difficulty_bottom_divider = {
		horizontal_alignment = "center",
		parent = "background_fade",
		vertical_alignment = "bottom",
		size = {
			264,
			21,
		},
		position = {
			0,
			0,
			1,
		},
	},
	warning_bg = {
		horizontal_alignment = "center",
		parent = "background_fade",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			100,
		},
		position = {
			0,
			-100,
			1,
		},
	},
	warning_texture = {
		horizontal_alignment = "center",
		parent = "warning_bg",
		vertical_alignment = "center",
		size = {
			485,
			103,
		},
		position = {
			0,
			0,
			1,
		},
	},
	requirement_bg = {
		horizontal_alignment = "center",
		parent = "warning_bg",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			100,
		},
		position = {
			0,
			-80,
			1,
		},
	},
	difficulty_chest_info = {
		horizontal_alignment = "center",
		parent = "background_fade",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			20,
		},
		position = {
			0,
			40,
			0,
		},
	},
	difficulty_xp_multiplier = {
		horizontal_alignment = "center",
		parent = "difficulty_chest_info",
		vertical_alignment = "top",
		size = {
			window_text_width,
			20,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	difficulty_lock_text = {
		horizontal_alignment = "center",
		parent = "difficulty_xp_multiplier",
		vertical_alignment = "top",
		size = {
			window_text_width,
			20,
		},
		position = {
			0,
			-90,
			0,
		},
	},
	difficulty_second_lock_text = {
		horizontal_alignment = "center",
		parent = "difficulty_xp_multiplier",
		vertical_alignment = "top",
		size = {
			window_text_width,
			20,
		},
		position = {
			0,
			-55,
			0,
		},
	},
	difficulty_is_locked_text = {
		horizontal_alignment = "center",
		parent = "difficulty_lock_text",
		vertical_alignment = "top",
		size = {
			window_text_width,
			20,
		},
		position = {
			0,
			-70,
			0,
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
	buy_button = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			477,
			91,
		},
		position = {
			0,
			18,
			40,
		},
	},
	game_options_right_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2] - 230,
		},
		position = {
			300,
			0,
			1,
		},
	},
	game_options_left_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			-300,
			0,
			1,
		},
	},
	game_options_right_chain_end = {
		horizontal_alignment = "center",
		parent = "game_options_right_chain",
		vertical_alignment = "bottom",
		size = {
			19,
			20,
		},
		position = {
			-1,
			-20,
			1,
		},
	},
	game_options_left_chain_end = {
		horizontal_alignment = "center",
		parent = "game_options_left_chain",
		vertical_alignment = "bottom",
		size = {
			19,
			20,
		},
		position = {
			-1,
			-20,
			1,
		},
	},
	dlc_difficulty_divider = {
		horizontal_alignment = "center",
		parent = "difficulty_option",
		vertical_alignment = "center",
		size = {
			264,
			32,
		},
		position = {
			0,
			-55,
			1,
		},
	},
}
local extreme_difficulty_text_style = {
	font_size = 26,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
		255,
		246,
		56,
		53,
	},
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	font_size = 18,
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
local difficulty_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = {
		255,
		199,
		199,
		199,
	},
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_chest_info_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		250,
		250,
		250,
	},
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_xp_multiplier_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("cyan", 255),
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_lock_text_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		199,
		199,
		199,
	},
	offset = {
		0,
		-30,
		2,
	},
}
local difficulty_second_lock_text_style = {
	dynamic_font_size = false,
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		199,
		199,
		199,
	},
	offset = {
		0,
		-60,
		2,
	},
}
local difficulty_is_locked_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		220,
		148,
		64,
	},
	offset = {
		0,
		0,
		2,
	},
}
local dlc_is_locked_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		193,
		90,
		36,
	},
	offset = {
		0,
		25,
		2,
	},
}

local function create_difficulty_button(scenegraph_id, size, background_icon, background_icon_unlit, background_texture, dlc_locked)
	local dynamic_font_size = true
	local icon_name = "difficulty_option_1"
	local icon_scale = 0.5
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_name)
	local icon_size = {
		math.floor(icon_settings.size[1] * icon_scale),
		math.floor(icon_settings.size[2] * icon_scale),
	}
	local background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local new_frame_name = "frame_outer_glow_01"
	local new_frame_settings = UIFrameSettings[new_frame_name]
	local new_frame_width = new_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "background_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.background_icon and (button_hotspot.is_hover or button_hotspot.is_selected)
					end,
				},
				{
					pass_type = "texture",
					style_id = "background_icon_unlit",
					texture_id = "background_icon_unlit",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.background_icon_unlit and not button_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "dlc_locked_texture",
					texture_id = "dlc_locked_texture",
					content_check_function = function (content)
						return content.dlc_locked
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "new_texture",
					texture_id = "new_texture",
					content_check_function = function (content)
						return content.new
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
				},
				{
					pass_type = "texture",
					style_id = "icon_glass",
					texture_id = "icon_glass",
				},
				{
					pass_type = "texture",
					style_id = "icon_bg_glow",
					texture_id = "icon_bg_glow",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "select_glow",
					texture_id = "select_glow",
				},
				{
					pass_type = "texture",
					style_id = "skull_select_glow",
					texture_id = "skull_select_glow",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			dlc_locked_texture = "hero_icon_locked",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			icon_bg_glow = "menu_options_button_glow_01",
			icon_frame = "menu_options_button_bg",
			icon_glass = "menu_options_button_fg",
			new_texture = "list_item_tag_new",
			select_glow = "button_state_default_2",
			skull_select_glow = "menu_options_button_glow_03",
			title_text = "n/a",
			background_icon = background_icon,
			background_icon_unlit = background_icon_unlit,
			icon = icon_name,
			frame = frame_settings.texture,
			button_hotspot = {},
			dlc_locked = dlc_locked,
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					0,
					0,
					0,
				},
				size = size,
			},
			background_fade = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width,
					1,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			background_icon = {
				horizontal_alignment = "right",
				saturated = false,
				vertical_alignment = "center",
				color = {
					150,
					100,
					100,
					100,
				},
				default_color = {
					150,
					100,
					100,
					100,
				},
				texture_size = {
					350,
					108,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			background_icon_unlit = {
				horizontal_alignment = "right",
				saturated = false,
				vertical_alignment = "center",
				color = {
					150,
					100,
					100,
					100,
				},
				default_color = {
					150,
					100,
					100,
					100,
				},
				texture_size = {
					350,
					108,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			dlc_locked_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				color = {
					204,
					255,
					255,
					255,
				},
				texture_size = {
					60,
					70,
				},
				offset = {
					-100,
					0,
					3,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					2,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					130,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			title_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					130,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					132,
					-2,
					5,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
				size = size,
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					5,
				},
				size = size,
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 9),
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 11,
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 126,
					size[2] - 56,
					6,
				},
				size = {
					126,
					51,
				},
			},
			icon_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					11,
				},
			},
			icon_glass = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					15,
				},
			},
			icon_bg_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					11,
				},
			},
			icon = {
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = icon_size,
				offset = {
					54 - icon_size[1] / 2,
					54 - icon_size[2] / 2,
					12,
				},
			},
			icon_disabled = {
				color = {
					255,
					40,
					40,
					40,
				},
				default_color = {
					255,
					40,
					40,
					40,
				},
				select_color = {
					255,
					40,
					40,
					40,
				},
				texture_size = icon_size,
				offset = {
					54 - icon_size[1] / 2,
					54 - icon_size[2] / 2,
					12,
				},
			},
			skull_select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					12,
				},
				size = {
					28,
					size[2],
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

function create_buy_button(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
			},
		},
		content = {
			draw_frame = true,
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			background = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = {
					255,
					250,
					250,
					250,
				},
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					22,
					-2,
					5,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					8,
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					4,
				},
				size = {
					size[1],
					11,
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
end

local disable_with_gamepad = true
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "info_window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "info_window"),
	info_window = UIWidgets.create_frame("info_window", window_size, window_frame, 20),
	window = UIWidgets.create_frame("window", large_window_size, window_frame, 10),
	info_bg_fade = UIWidgets.create_simple_texture("difficulty_gradient", "background_fade", nil, nil, {
		128,
		255,
		255,
		255,
	}),
	difficulty_bottom_divider = UIWidgets.create_simple_texture("divider_01_bottom", "difficulty_bottom_divider"),
	extreme_difficulty_bg = UIWidgets.create_simple_texture("extreme_difficulty_bg", "warning_texture"),
	extremely_hard_text = UIWidgets.create_simple_text(Localize("difficulty_cataclysm_warning"), "warning_bg", nil, nil, extreme_difficulty_text_style),
	difficulty_title = UIWidgets.create_simple_text("difficulty_title", "difficulty_title", nil, nil, difficulty_text_style),
	difficulty_texture = UIWidgets.create_simple_texture("difficulty_option_1", "difficulty_texture"),
	difficulty_title_divider = UIWidgets.create_simple_texture("divider_01_top", "difficulty_title_divider"),
	description_text = UIWidgets.create_simple_text(Localize("start_game_window_adventure_desc"), "description_text", nil, nil, description_text_style),
	difficulty_chest_info = UIWidgets.create_simple_text("", "difficulty_chest_info", nil, nil, difficulty_chest_info_style),
	difficulty_lock_text = UIWidgets.create_simple_text("difficulty_lock_text", "requirement_bg", nil, nil, difficulty_lock_text_style),
	difficulty_second_lock_text = UIWidgets.create_simple_text("n/a", "requirement_bg", nil, nil, difficulty_second_lock_text_style),
	difficulty_is_locked_text = UIWidgets.create_simple_text("n/a", "requirement_bg", nil, nil, difficulty_is_locked_text_style),
	dlc_lock_text = UIWidgets.create_simple_text(Localize("cataclysm_no_wom"), "buy_button", nil, nil, dlc_is_locked_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("confirm_menu_button_name"), 32, nil, nil, nil, disable_with_gamepad),
	buy_button = create_buy_button("buy_button", scenegraph_definition.buy_button.size, nil, "wom_button", Localize("menu_weave_area_no_wom_button"), 32, nil, nil, nil, disable_with_gamepad),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain_end = UIWidgets.create_simple_texture("chain_link_02", "game_options_right_chain_end"),
	game_options_left_chain_end = UIWidgets.create_simple_texture("chain_link_02", "game_options_left_chain_end"),
}

return {
	widgets = widgets,
	create_difficulty_button = create_difficulty_button,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_dlc_difficulty_divider = UIWidgets.create_simple_texture,
}
