local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - window_frame_width*2
local game_option_size = {
	window_size[1] - 20,
	233
}
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
	game_option_1 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-16,
			2
		}
	},
	game_option_2 = {
		vertical_alignment = "bottom",
		parent = "game_option_1",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-249,
			0
		}
	},
	additional_option = {
		vertical_alignment = "bottom",
		parent = "game_option_2",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			200
		},
		position = {
			0,
			-216,
			0
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
			1
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
			1
		}
	},
	private_tabs = {
		vertical_alignment = "bottom",
		parent = "additional_option",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			40
		},
		position = {
			0,
			10,
			10
		}
	},
	private_tabs_frame = {
		vertical_alignment = "bottom",
		parent = "private_tabs",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			45
		},
		position = {
			0,
			0,
			10
		}
	},
	private_tabs_segments = {
		vertical_alignment = "bottom",
		parent = "private_tabs",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			0
		},
		position = {
			0,
			5,
			10
		}
	},
	private_tabs_segments_top = {
		vertical_alignment = "top",
		parent = "private_tabs",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			0
		},
		position = {
			0,
			-7,
			13
		}
	},
	private_tabs_segments_bottom = {
		vertical_alignment = "bottom",
		parent = "private_tabs",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			0
		},
		position = {
			0,
			3,
			13
		}
	}
}

local function create_settings_option(scenegraph_id, size, title_text, button_text, icon_texture, background_texture)
	icon_texture = icon_texture or "level_icon_01"
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = (icon_texture_settings and icon_texture_settings.size) or {
		150,
		150
	}
	background_texture = background_texture or "play_screen_bg"
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

						return 
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
					style_id = "icon_frame",
					pass_type = "texture",
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

						return 
					end
				},
				{
					texture_id = "icon_glow",
					style_id = "icon_glow",
					pass_type = "texture",
					content_check_function = function (content, style)
						return content.icon
					end
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					style_id = "icon",
					pass_type = "texture",
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

						return 
					end
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.icon
					end
				},
				{
					style_id = "button_text_disabled",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and not content.icon
					end
				},
				{
					style_id = "button_text_shadow",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not content.icon
					end
				},
				{
					style_id = "option_text",
					pass_type = "text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end
				},
				{
					style_id = "option_text_shadow",
					pass_type = "text",
					text_id = "option_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and content.icon
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and content.icon
					end
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
					content_check_function = function (content)
						return content.icon
					end
				}
			}
		},
		content = {
			option_text = "",
			icon_frame = "map_frame_00",
			glass = "game_options_fg",
			title_edge = "game_option_divider",
			glow = "game_options_glow_01",
			title_bg = "playername_bg_02",
			icon_glow = "map_frame_glow",
			button_hotspot = {},
			frame = frame_settings.texture,
			glow_frame = glow_frame_settings.texture,
			button_text = button_text,
			title_text = title_text or "n/a",
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
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
				texture_tiling_size = {
					400,
					150
				},
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
				}
			},
			icon = {
				vertical_alignment = "center",
				saturated = true,
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = icon_texture_size,
				offset = {
					size[1]/2 - 120,
					0,
					5
				}
			},
			icon_frame = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					180,
					180
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1]/2 - 120,
					0,
					6
				}
			},
			icon_lock = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					146,
					146
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1]/2 - 120,
					0,
					7
				}
			},
			icon_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					318,
					318
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					size[1]/2 - 120,
					0,
					4
				}
			},
			title_bg = {
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
					size[2] - 38 - frame_width,
					2
				}
			},
			title_edge = {
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
					size[2] - 38 - frame_width,
					4
				}
			},
			title_text = {
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
					-frame_width,
					10
				}
			},
			title_text_shadow = {
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
					-(frame_width + 2),
					9
				}
			},
			title_text_disabled = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10
				}
			},
			option_text = {
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
					-55,
					10
				}
			},
			option_text_shadow = {
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
					-57,
					9
				}
			},
			button_text = {
				font_size = 38,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					frame_width,
					frame_width,
					10
				},
				size = {
					size[1] - frame_width*2,
					size[2] - frame_width*2
				}
			},
			button_text_disabled = {
				font_size = 38,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					frame_width,
					frame_width,
					10
				},
				size = {
					size[1] - frame_width*2,
					size[2] - frame_width*2
				}
			},
			button_text_shadow = {
				font_size = 38,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width - 2,
					9
				},
				size = {
					size[1] - frame_width*2,
					size[2] - frame_width*2
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
					size[1] - frame_width*2,
					size[2] - frame_width*2
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
					size[1] - frame_width*2,
					size[2] - frame_width*2
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
					size[1] - frame_width*2,
					size[2] - frame_width*2
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

local function create_additional_settings_option(scenegraph_id, size, title_text, background_texture)
	background_texture = background_texture or "play_screen_bg"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
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

						return 
					end
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
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
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg"
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge"
				}
			}
		},
		content = {
			title_edge = "game_option_divider",
			title_bg = "playername_bg_02",
			button_hotspot = {
				allow_multi_hover = true
			},
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			background = {
				uvs = {
					{
						0,
						math.min(size[2]/background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/background_texture_settings.size[1], 1),
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
			background = {
				saturated = true,
				texture_tiling_size = {
					400,
					150
				},
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
			title_bg = {
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
					size[2] - 38 - frame_width,
					2
				}
			},
			title_edge = {
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
					size[2] - 38 - frame_width,
					4
				}
			},
			title_text = {
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
					-frame_width,
					10
				}
			},
			title_text_shadow = {
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
					-(frame_width + 2),
					9
				}
			},
			title_text_disabled = {
				font_size = 32,
				upper_case = true,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = {
					255,
					108,
					108,
					108
				},
				default_text_color = {
					255,
					108,
					108,
					108
				},
				offset = {
					frame_width + 5,
					-frame_width,
					10
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
					5,
					0,
					15
				},
				size = {
					size[1] - 10,
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

local private_checkbox_offset = 0
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	play_button = UIWidgets.create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34),
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, "1. " .. Localize("start_game_window_mission"), Localize("start_game_window_change_mission"), nil, "game_options_bg_01"),
	game_option_2 = create_settings_option("game_option_2", scenegraph_definition.game_option_2.size, "2. " .. Localize("start_game_window_difficulty"), Localize("start_game_window_change_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	additional_option = create_additional_settings_option("additional_option", scenegraph_definition.additional_option.size, "3. " .. Localize("start_game_window_other_options_title"), "game_options_bg_03"),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	private_frame = UIWidgets.create_frame("private_tabs_frame", scenegraph_definition.private_tabs_frame.size, window_frame, 1),
	private_tabs = UIWidgets.create_default_text_tabs("private_tabs", scenegraph_definition.private_tabs.size, 2),
	private_tabs_segments = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_vertical", {
		5,
		35
	}, "private_tabs_segments", 1),
	private_tabs_segments_top = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_top", {
		17,
		9
	}, "private_tabs_segments_top", 1),
	private_tabs_segments_bottom = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_bottom", {
		17,
		9
	}, "private_tabs_segments_bottom", 1)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress

				return 
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

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress - 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
