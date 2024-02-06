-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_list_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local play_button_size = {
	window_size[1] - 20,
	72,
}
local game_option_size = {
	window_size[1] - 20,
	window_size[2] - (50 + play_button_size[2]),
}
local deed_frame_name = "menu_frame_08"
local deed_frame_settings = UIFrameSettings[deed_frame_name]
local deed_frame_width = deed_frame_settings.texture_sizes.corner[1]
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
	play_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = play_button_size,
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
	game_option_1 = {
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
	item_presentation = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 10,
			0,
		},
		position = {
			0,
			-deed_frame_width,
			1,
		},
	},
}

local function create_overlay_button(scenegraph_id, size)
	local background_texture = "game_options_bg_04"
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

						return not button_hotspot.disable_button and not content.has_item
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
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.has_item
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.has_item
					end,
				},
				{
					pass_type = "text",
					style_id = "warning_text",
					text_id = "warning_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.has_item
					end,
				},
				{
					pass_type = "text",
					style_id = "warning_text_shadow",
					text_id = "warning_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.has_item
					end,
				},
			},
		},
		content = {
			glass = "game_options_fg_04",
			glow = "game_options_glow_01",
			button_hotspot = {},
			frame = frame_settings.texture,
			glow_frame = glow_frame_settings.texture,
			option_text = Localize("start_game_window_select_deed"),
			warning_text = Localize("start_game_window_no_deeds_available"),
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
				size = {
					size[1],
					233,
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
			option_text = {
				font_size = 42,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width * 2,
					0,
					10,
				},
				size = {
					size[1] - frame_width * 4,
					size[2],
				},
			},
			option_text_shadow = {
				font_size = 42,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width * 2 + 2,
					-2,
					9,
				},
				size = {
					size[1] - frame_width * 4,
					size[2],
				},
			},
			warning_text = {
				font_size = 42,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					frame_width * 2,
					0,
					10,
				},
				size = {
					size[1] - frame_width * 4,
					size[2],
				},
			},
			warning_text_shadow = {
				font_size = 42,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width * 2 + 2,
					-2,
					9,
				},
				size = {
					size[1] - frame_width * 4,
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

local widgets = {
	item_presentation = UIWidgets.create_simple_item_presentation("item_presentation"),
	overlay_button = create_overlay_button("game_option_1", scenegraph_definition.game_option_1.size),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19,
	}),
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	play_button = UIWidgets.create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
