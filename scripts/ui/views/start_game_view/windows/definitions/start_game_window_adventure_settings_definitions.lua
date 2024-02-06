-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_adventure_settings_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - window_frame_width * 2
local game_option_size = {
	window_size[1] - 20,
	233,
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
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	game_option_difficulty = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			0,
			-16,
			4,
		},
	},
	game_option_reward = {
		horizontal_alignment = "center",
		parent = "game_option_difficulty",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			449,
		},
		position = {
			0,
			-465,
			0,
		},
	},
	multiplayer_title_bg = {
		horizontal_alignment = "left",
		parent = "game_option_difficulty",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			40,
		},
		position = {
			0,
			-60,
			1,
		},
	},
	multiplayer_title = {
		horizontal_alignment = "left",
		parent = "multiplayer_title_bg",
		vertical_alignment = "center",
		size = {
			window_text_width,
			40,
		},
		position = {
			0,
			0,
			1,
		},
	},
	private_option = {
		horizontal_alignment = "left",
		parent = "multiplayer_title_bg",
		vertical_alignment = "bottom",
		size = {
			250,
			40,
		},
		position = {
			20,
			-60,
			1,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			72,
		},
		position = {
			0,
			18,
			20,
		},
	},
	game_options_right_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			195,
			0,
			3,
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
			-195,
			0,
			3,
		},
	},
}

local function create_settings_option(scenegraph_id, size, title_text, button_text, icon_texture, background_texture)
	icon_texture = icon_texture or "level_icon_01"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		200,
		200,
	}
	local icon_size = {
		icon_texture_size[1],
		icon_texture_size[2],
	}

	background_texture = background_texture or "game_options_bg_02"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local glow_frame_name = "frame_outer_glow_01"
	local glow_frame_settings = UIFrameSettings[glow_frame_name]
	local glow_frame_width = glow_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
					content_change_function = function (content, style)
						local parent = content.parent

						if parent.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "glow_frame",
					texture_id = "glow_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.option_text == ""
					end,
				},
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "button_hover_rect",
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
					content_check_function = function (content, style)
						return content.icon
					end,
					content_change_function = function (content, style)
						if content.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow",
					content_check_function = function (content, style)
						return content.icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content, style)
						return content.icon
					end,
					content_change_function = function (content, style)
						if content.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_disabled",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and content.icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
					content_check_function = function (content)
						return content.icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
					content_check_function = function (content)
						return content.icon
					end,
				},
			},
		},
		content = {
			glass = "game_options_fg",
			glow = "game_options_glow_01",
			icon_frame = "map_frame_00",
			icon_glow = "map_frame_glow",
			option_text = "",
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			button_hotspot = {},
			frame = frame_settings.texture,
			glow_frame = glow_frame_settings.texture,
			button_text = button_text,
			title_text = title_text or "n/a",
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
			glow_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					-2,
				},
				size = size,
				texture_size = glow_frame_settings.texture_size,
				texture_sizes = glow_frame_settings.texture_sizes,
				frame_margins = {
					-(glow_frame_width - 1),
					-(glow_frame_width - 1),
				},
			},
			background = {
				saturated = true,
				texture_tiling_size = {
					400,
					150,
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
					0,
				},
			},
			glass = {
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
				size = size,
			},
			glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			icon = {
				horizontal_alignment = "center",
				saturated = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = icon_size,
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			icon_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					180,
					180,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					6,
				},
			},
			icon_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					318,
					318,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					4,
				},
			},
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			title_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10,
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9,
				},
			},
			button_text = {
				dynamic_font = true,
				font_size = 38,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					frame_width,
					frame_width,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			button_text_disabled = {
				dynamic_font = true,
				font_size = 38,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					frame_width,
					frame_width,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			button_text_shadow = {
				dynamic_font = true,
				font_size = 38,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width - 2,
					9,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			button_hover_rect = {
				color = {
					30,
					0,
					0,
					0,
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
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					frame_width,
					frame_width,
					15,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					frame_width,
					frame_width,
					15,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
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

local function create_reward_presentation(scenegraph_id, size)
	local background_texture = "game_options_bg_05"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
					content_change_function = function (content, style)
						local parent = content.parent

						if parent.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end,
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text_disabled",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
					style_id = "title_text_shadow",
					text_id = "title_text",
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
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			button_hotspot = {
				allow_multi_hover = true,
			},
			frame = frame_settings.texture,
			option_text = Localize("start_game_window_adventure_reward_desc"),
			title_text = Localize("start_game_window_adventure_reward_title"),
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
			background = {
				saturated = true,
				texture_tiling_size = {
					400,
					150,
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
					0,
				},
			},
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					7,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					6,
				},
			},
			title_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = {
					255,
					108,
					108,
					108,
				},
				default_text_color = {
					255,
					108,
					108,
					108,
				},
				offset = {
					frame_width + 5,
					-frame_width,
					7,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width,
					frame_width + 10,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			option_text_disabled = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					frame_width,
					frame_width + 10,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width + 8,
					9,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					frame_width,
					frame_width,
					8,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
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
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	play_button = UIWidgets.create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34),
	game_option_difficulty = create_settings_option("game_option_difficulty", scenegraph_definition.game_option_difficulty.size, Localize("start_game_window_difficulty"), Localize("start_game_window_change_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	game_option_reward = create_reward_presentation("game_option_reward", scenegraph_definition.game_option_reward.size),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19,
	}),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
