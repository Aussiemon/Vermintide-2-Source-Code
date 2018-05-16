local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local game_option_size = {
	window_size[1] - 20,
	700
}
local deed_frame_name = "menu_frame_08"
local deed_frame_settings = UIFrameSettings[deed_frame_name]
local deed_frame_width = deed_frame_settings.texture_sizes.corner[1]
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	play_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			72
		},
		position = {
			0,
			18,
			20
		}
	},
	game_options_right_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			195,
			0,
			3
		}
	},
	game_options_left_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			-195,
			0,
			3
		}
	},
	game_option_1 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-16,
			4
		}
	},
	item_presentation = {
		vertical_alignment = "top",
		parent = "game_option_1",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 10,
			0
		},
		position = {
			0,
			-deed_frame_width,
			1
		}
	}
}

local function create_settings_option(scenegraph_id, size)
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
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background",
					content_change_function = function (content, style)
						local parent = content.parent

						if parent.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					texture_id = "glow_frame",
					style_id = "glow_frame",
					pass_type = "texture_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.option_text == ""
					end
				},
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "glass",
					style_id = "glass",
					pass_type = "texture"
				},
				{
					style_id = "button_clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					pass_type = "rect",
					style_id = "button_hover_rect"
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					style_id = "deed_title",
					pass_type = "text",
					text_id = "deed_title"
				},
				{
					style_id = "deed_title_shadow",
					pass_type = "text",
					text_id = "deed_title"
				},
				{
					style_id = "reward_title",
					pass_type = "text",
					text_id = "reward_title"
				},
				{
					style_id = "reward_title_shadow",
					pass_type = "text",
					text_id = "reward_title"
				},
				{
					texture_id = "reward_title_divider",
					style_id = "reward_title_divider",
					pass_type = "texture"
				},
				{
					style_id = "option_text_1",
					pass_type = "text",
					text_id = "option_text_1"
				},
				{
					style_id = "option_text_shadow_1",
					pass_type = "text",
					text_id = "option_text_1"
				},
				{
					style_id = "title_text_1",
					pass_type = "text",
					text_id = "title_text_1"
				},
				{
					style_id = "title_text_shadow_1",
					pass_type = "text",
					text_id = "title_text_1"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_1",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_1",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_1",
					texture_id = "title_edge"
				},
				{
					style_id = "option_text_2",
					pass_type = "text",
					text_id = "option_text_2"
				},
				{
					style_id = "option_text_shadow_2",
					pass_type = "text",
					text_id = "option_text_2"
				},
				{
					style_id = "title_text_2",
					pass_type = "text",
					text_id = "title_text_2"
				},
				{
					style_id = "title_text_shadow_2",
					pass_type = "text",
					text_id = "title_text_2"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_2",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_2",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_2",
					texture_id = "title_edge"
				},
				{
					style_id = "title_text_3",
					pass_type = "text",
					text_id = "title_text_3"
				},
				{
					style_id = "title_text_shadow_3",
					pass_type = "text",
					text_id = "title_text_3"
				},
				{
					pass_type = "texture",
					style_id = "title_bg_3",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_bottom_3",
					texture_id = "title_edge"
				},
				{
					pass_type = "texture",
					style_id = "title_edge_top_3",
					texture_id = "title_edge"
				}
			}
		},
		content = {
			reward_title_divider = "divider_01_top",
			title_bg = "playername_bg_02",
			glow = "game_options_glow_01",
			glass = "game_options_fg_04",
			title_edge = "game_option_divider",
			button_hotspot = {},
			frame = frame_settings.texture,
			glow_frame = glow_frame_settings.texture,
			option_text_1 = Localize("start_game_window_mission"),
			option_text_2 = Localize("start_game_window_difficulty"),
			deed_title = Localize("start_game_window_mission"),
			reward_title = Localize("deed_reward_title"),
			title_text_1 = Localize("start_game_window_mission"),
			title_text_2 = Localize("start_game_window_difficulty"),
			title_text_3 = Localize("start_game_window_mutator_title"),
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			deed_title = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					10,
					size[2] - 60 - frame_width,
					10
				},
				size = {
					size[1] - 20,
					50
				}
			},
			deed_title_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					size[2] - 60 - (frame_width + 2),
					9
				},
				size = {
					size[1] - 20,
					50
				}
			},
			reward_title = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					10,
					frame_width,
					10
				},
				size = {
					size[1] - 20,
					180
				}
			},
			reward_title_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = false,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					frame_width - 2,
					9
				},
				size = {
					size[1] - 20,
					180
				}
			},
			reward_title_divider = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 2 - 132,
					130,
					8
				},
				size = {
					264,
					32
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			glow_frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					-2
				},
				size = size,
				texture_size = glow_frame_settings.texture_size,
				texture_sizes = glow_frame_settings.texture_sizes,
				frame_margins = {
					-(glow_frame_width - 1),
					-(glow_frame_width - 1)
				}
			},
			background = {
				saturated = true,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			glass = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					8
				},
				size = size
			},
			glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				size = {
					size[1],
					233
				}
			},
			button_hover_rect = {
				color = {
					30,
					0,
					0,
					0
				},
				offset = {
					frame_width,
					frame_width,
					1
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					frame_width,
					frame_width,
					15
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					frame_width,
					frame_width,
					15
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			title_bg_1 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 80,
					2
				}
			},
			title_edge_top_1 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 80,
					4
				}
			},
			title_edge_bottom_1 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 80,
					4
				}
			},
			title_text_1 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 80),
					10
				}
			},
			title_text_shadow_1 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 80 + 2),
					9
				}
			},
			option_text_1 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-135,
					10
				}
			},
			option_text_shadow_1 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-137,
					9
				}
			},
			title_bg_2 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 180,
					2
				}
			},
			title_edge_top_2 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 180,
					4
				}
			},
			title_edge_bottom_2 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 180,
					4
				}
			},
			title_text_2 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 180),
					10
				}
			},
			title_text_shadow_2 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 180 + 2),
					9
				}
			},
			option_text_2 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-235,
					10
				}
			},
			option_text_shadow_2 = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-237,
					9
				}
			},
			title_bg_3 = {
				size = {
					size[1],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 280,
					2
				}
			},
			title_edge_top_3 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_width - 280,
					4
				}
			},
			title_edge_bottom_3 = {
				size = {
					size[1],
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 38 - frame_width - 280,
					4
				}
			},
			title_text_3 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-(frame_width + 280),
					10
				}
			},
			title_text_shadow_3 = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 280 + 2),
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

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
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background",
					content_change_function = function (content, style)
						local parent = content.parent

						if parent.button_hotspot.disable_button then
							style.saturated = true
						else
							style.saturated = false
						end
					end
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					texture_id = "glow_frame",
					style_id = "glow_frame",
					pass_type = "texture_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.has_item
					end
				},
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "glass",
					style_id = "glass",
					pass_type = "texture"
				},
				{
					style_id = "button_clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					pass_type = "rect",
					style_id = "button_hover_rect"
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					style_id = "option_text",
					pass_type = "text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.has_item
					end
				},
				{
					style_id = "option_text_shadow",
					pass_type = "text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.has_item
					end
				},
				{
					style_id = "warning_text",
					pass_type = "text",
					text_id = "warning_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.has_item
					end
				},
				{
					style_id = "warning_text_shadow",
					pass_type = "text",
					text_id = "warning_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.has_item
					end
				}
			}
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
						1 - math.min(size[2] / background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			glow_frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					-2
				},
				size = size,
				texture_size = glow_frame_settings.texture_size,
				texture_sizes = glow_frame_settings.texture_sizes,
				frame_margins = {
					-(glow_frame_width - 1),
					-(glow_frame_width - 1)
				}
			},
			background = {
				saturated = true,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			glass = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					8
				},
				size = size
			},
			glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				size = {
					size[1],
					233
				}
			},
			button_hover_rect = {
				color = {
					30,
					0,
					0,
					0
				},
				offset = {
					frame_width,
					frame_width,
					1
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					frame_width,
					frame_width,
					15
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					frame_width,
					frame_width,
					15
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			option_text = {
				font_size = 42,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width * 2,
					0,
					10
				},
				size = {
					size[1] - frame_width * 4,
					size[2]
				}
			},
			option_text_shadow = {
				font_size = 42,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width * 2 + 2,
					-2,
					9
				},
				size = {
					size[1] - frame_width * 4,
					size[2]
				}
			},
			warning_text = {
				font_size = 42,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					frame_width * 2,
					0,
					10
				},
				size = {
					size[1] - frame_width * 4,
					size[2]
				}
			},
			warning_text_shadow = {
				font_size = 42,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width * 2 + 2,
					-2,
					9
				},
				size = {
					size[1] - frame_width * 4,
					size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local widgets = {
	item_presentation = UIWidgets.create_simple_item_presentation("item_presentation"),
	overlay_button = create_overlay_button("game_option_1", scenegraph_definition.game_option_1.size),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	play_button = UIWidgets.create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
