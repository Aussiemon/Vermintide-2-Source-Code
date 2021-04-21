require("scripts/ui/views/deus_menu/ui_widgets_deus")

local full_size = {
	1920,
	1080
}
local blessing_widget_size = {
	410,
	240
}
local blessing_widget_spacing = {
	10,
	10
}
local scenegraph = {
	root = {
		is_root = true,
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			UILayer.end_screen_banner
		}
	},
	screen_reminder = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen_center = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = full_size,
		position = {
			0,
			0,
			1
		}
	},
	banner_top = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			full_size[1],
			200
		},
		position = {
			0,
			0,
			1
		}
	},
	player_portrait = {
		vertical_alignment = "center",
		parent = "banner_top",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			100,
			0,
			20
		}
	},
	player_career_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			400,
			0
		},
		position = {
			80,
			-11,
			21
		}
	},
	player_name_divider = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			80,
			-5,
			21
		}
	},
	player_hero_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		size = {
			500,
			0
		},
		position = {
			80,
			-7,
			21
		}
	},
	curse_information = {
		vertical_alignment = "center",
		parent = "banner_top",
		horizontal_alignment = "left",
		size = {
			400,
			180
		},
		position = {
			550,
			0,
			20
		}
	},
	game_level = {
		vertical_alignment = "top",
		parent = "banner_top",
		horizontal_alignment = "right",
		size = {
			500,
			30
		},
		position = {
			-25,
			-20,
			25
		}
	},
	game_difficulty = {
		vertical_alignment = "top",
		parent = "game_level",
		horizontal_alignment = "right",
		size = {
			500,
			30
		},
		position = {
			0,
			-30,
			25
		}
	},
	center_title = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			500,
			60
		},
		position = {
			0,
			-210,
			1
		}
	},
	options_background_mask = {
		scale = "fit_height",
		horizontal_alignment = "right",
		size = {
			1400,
			0
		},
		position = {
			0,
			0,
			6
		}
	},
	options_background = {
		scale = "fit_height",
		horizontal_alignment = "right",
		size = {
			900,
			0
		},
		position = {
			0,
			0,
			6
		}
	},
	options_background_edge = {
		scale = "fit_height",
		horizontal_alignment = "right",
		size = {
			200,
			0
		},
		position = {
			-685,
			0,
			3
		}
	},
	power_up_root = {
		vertical_alignment = "center",
		parent = "options_background_edge",
		horizontal_alignment = "left",
		size = {
			50,
			50
		},
		position = {
			170,
			0,
			10
		}
	},
	blessing_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			50,
			50
		},
		position = {
			100,
			-380,
			10
		}
	},
	blessing_1 = {
		vertical_alignment = "center",
		parent = "blessing_root",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			0,
			0,
			10
		}
	},
	blessing_2 = {
		vertical_alignment = "center",
		parent = "blessing_1",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10
		}
	},
	blessing_3 = {
		vertical_alignment = "center",
		parent = "blessing_2",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10
		}
	},
	blessing_4 = {
		vertical_alignment = "center",
		parent = "blessing_root",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			blessing_widget_size[1] + blessing_widget_spacing[1],
			0,
			10
		}
	},
	blessing_5 = {
		vertical_alignment = "center",
		parent = "blessing_4",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10
		}
	},
	blessing_6 = {
		vertical_alignment = "center",
		parent = "blessing_5",
		horizontal_alignment = "left",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10
		}
	},
	no_power_ups_text = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			400,
			30
		},
		position = {
			300,
			0,
			10
		}
	},
	no_blessings_text = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			400,
			30
		},
		position = {
			-300,
			0,
			10
		}
	},
	deus_run_stats_input_description = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			564,
			30
		},
		position = {
			0,
			190,
			-1
		}
	},
	power_up_description_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			484,
			194
		},
		position = {
			500,
			-500,
			10
		}
	},
	reminder_text = {
		vertical_alignment = "bottom",
		parent = "screen_reminder",
		horizontal_alignment = "center",
		size = {
			900,
			30
		},
		position = {
			0,
			190,
			300
		}
	}
}
local player_career_name_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 36,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0
	}
}
local player_hero_name_style = {
	use_shadow = true,
	vertical_alignment = "top",
	localize = false,
	horizontal_alignment = "left",
	font_size = 24,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}
local level_title_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_text_style = {
	use_shadow = true,
	vertical_alignment = "top",
	horizontal_alignment = "right",
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2
	}
}
local center_title_style = {
	use_shadow = true,
	upper_case = true,
	vertical_alignment = "center",
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		-3,
		1
	}
}
local no_active_items_text = {
	word_wrap = false,
	use_shadow = true,
	font_size = 24,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = color or Colors.get_color_table_with_alpha("white", 255),
	rect_color = rect_color or Colors.get_color_table_with_alpha("black", 150),
	line_colors = {},
	offset = {
		0,
		0,
		50
	}
}

local function create_edge_divider(scenegraph_id, size, layer)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				size = {
					[2] = size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					layer
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-6,
					layer + 1
				},
				texture_size = {
					9,
					17
				}
			},
			edge_holder_right = {
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-6,
					layer + 1
				},
				texture_size = {
					9,
					17
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

local banner_color = {
	200,
	10,
	10,
	10
}

function create_input_text(text, scenegraph_id, disable_with_gamepad)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content, style)
						return not ShowCursorStack.cursor_active()
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content, style)
						return not ShowCursorStack.cursor_active()
					end
				}
			}
		},
		content = {
			text = text,
			disable_with_gamepad = disable_with_gamepad
		},
		style = {
			text = {
				font_size = 24,
				upper_case = true,
				localize = true,
				use_shadow = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					0,
					0,
					2
				}
			},
			text_shadow = {
				font_size = 24,
				upper_case = true,
				localize = true,
				use_shadow = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_table("black"),
				offset = {
					2,
					-2,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_power_up(scenegraph_id)
	return {
		element = {
			passes = {
				{
					texture_id = "shrine_bg",
					style_id = "shrine_bg",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					texture_id = "shrine_bg",
					style_id = "shrine_bg_left",
					pass_type = "texture",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "shrine_bg_frame_left",
					pass_type = "texture_uv",
					content_id = "shrine_bg_frame_left",
					content_check_function = function (content)
						return not content.parent.extend_left
					end
				},
				{
					style_id = "shrine_bg_frame_right",
					pass_type = "texture_uv",
					content_id = "shrine_bg_frame_right",
					content_check_function = function (content)
						return content.parent.extend_left
					end
				},
				{
					texture_id = "icon",
					style_id = "round_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon
					end
				},
				{
					texture_id = "round_icon_bg",
					style_id = "round_icon_bg",
					pass_type = "texture",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon and false
					end
				},
				{
					texture_id = "icon",
					style_id = "rectangular_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.icon and content.is_rectangular_icon
					end
				},
				{
					style_id = "rectangular_bg",
					pass_type = "rect",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon
					end
				},
				{
					texture_id = "rectangular_icon_bg",
					style_id = "rectangular_icon_bg",
					pass_type = "texture",
					content_check_function = function (content)
						return true
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "rarity_text",
					pass_type = "text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "rarity_text_shadow",
					pass_type = "text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text",
					content_check_function = function (content)
						return not content.extend_left
					end
				},
				{
					style_id = "title_text_left",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "title_text_shadow_left",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "rarity_text_left",
					pass_type = "text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "rarity_text_shadow_left",
					pass_type = "text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "description_text_left",
					pass_type = "text",
					text_id = "description_text",
					content_check_function = function (content)
						return content.extend_left
					end
				},
				{
					style_id = "description_text_shadow_left",
					pass_type = "text",
					text_id = "description_text",
					content_check_function = function (content)
						return content.extend_left
					end
				}
			}
		},
		content = {
			title_text = "header",
			extend_left = false,
			round_icon_bg = "button_round_bg",
			rectangular_icon_bg = "button_frame_01",
			rarity_text = "rarity",
			visible = false,
			shrine_bg = "shrine_blessing_bg_hover",
			is_rectangular_icon = false,
			description_text = "description_text",
			shrine_bg_frame_left = {
				texture_id = "shrine_blessing_frame",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			shrine_bg_frame_right = {
				texture_id = "shrine_blessing_frame",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			}
		},
		style = {
			shrine_bg = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					50,
					0,
					0
				},
				texture_size = {
					484,
					194
				}
			},
			shrine_bg_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-384,
					0,
					0
				},
				texture_size = {
					484,
					194
				}
			},
			shrine_bg_frame_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					scenegraph.power_up_description_root.size[1],
					scenegraph.power_up_description_root.size[2]
				},
				offset = {
					0,
					0,
					1
				}
			},
			shrine_bg_frame_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					scenegraph.power_up_description_root.size[1],
					scenegraph.power_up_description_root.size[2]
				},
				offset = {
					-384,
					0,
					1
				}
			},
			round_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					28,
					0,
					10
				},
				texture_size = {
					40,
					40
				}
			},
			rectangular_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					17,
					0,
					10
				},
				texture_size = {
					63,
					63
				}
			},
			rectangular_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					15,
					0,
					9
				},
				texture_size = {
					63,
					63
				}
			},
			round_icon_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					10,
					0,
					9
				},
				texture_size = {
					74,
					74
				}
			},
			rectangular_icon_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					10,
					0,
					9
				},
				texture_size = {
					75,
					75
				}
			},
			title_text = {
				font_type = "hell_shark_header",
				upper_case = true,
				localize = false,
				word_wrap = false,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				area_size = {
					280,
					scenegraph.power_up_description_root.size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					100,
					-30,
					3
				}
			},
			rarity_text = {
				vertical_alignment = "top",
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-60,
					-30,
					3
				}
			},
			description_text = {
				word_wrap = true,
				font_type = "hell_shark",
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					320,
					120
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					100,
					-60,
					3
				}
			},
			title_text_shadow = {
				font_type = "hell_shark_header",
				upper_case = true,
				localize = false,
				word_wrap = false,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				area_size = {
					280,
					scenegraph.power_up_description_root.size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					102,
					-32,
					2
				}
			},
			rarity_text_shadow = {
				vertical_alignment = "top",
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-58,
					-32,
					2
				}
			},
			description_text_shadow = {
				word_wrap = true,
				font_type = "hell_shark",
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					320,
					120
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					102,
					-62,
					2
				}
			},
			title_text_left = {
				font_type = "hell_shark_header",
				upper_case = true,
				localize = false,
				word_wrap = false,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				area_size = {
					280,
					scenegraph.power_up_description_root.size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-320,
					-30,
					3
				}
			},
			rarity_text_left = {
				vertical_alignment = "top",
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-480,
					-30,
					3
				}
			},
			description_text_left = {
				word_wrap = true,
				font_type = "hell_shark",
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					320,
					120
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-320,
					-60,
					3
				}
			},
			title_text_shadow_left = {
				font_type = "hell_shark_header",
				upper_case = true,
				localize = false,
				word_wrap = false,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				area_size = {
					280,
					scenegraph.power_up_description_root.size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-318,
					-32,
					2
				}
			},
			rarity_text_shadow_left = {
				vertical_alignment = "top",
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-478,
					-32,
					2
				}
			},
			description_text_shadow_left = {
				word_wrap = true,
				font_type = "hell_shark",
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					320,
					120
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-318,
					-62,
					2
				}
			}
		},
		offset = {
			-15,
			-65,
			50
		},
		scenegraph_id = scenegraph_id
	}
end

local animations_definitions = {
	reminder = {
		{
			name = "fade_in_reminder_text",
			start_progress = 4,
			end_progress = 4.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				widget.style.text.text_color[1] = progress * 255
				widget.style.text_shadow.text_color[1] = progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "fade_out_reminder_text",
			start_progress = 6,
			end_progress = 6.5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				widget.style.text.text_color[1] = (1 - progress) * 255
				widget.style.text_shadow.text_color[1] = (1 - progress) * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		}
	}
}

function create_reminder_text(text, scenegraph_id, color)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "power_up_text",
					content_check_function = function (content)
						return content.info_type == "deus_power_up"
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "power_up_text",
					content_check_function = function (content)
						return content.info_type == "deus_power_up"
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "item_text",
					content_check_function = function (content)
						return content.info_type == "deus_item_tooltip"
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "item_text",
					content_check_function = function (content)
						return content.info_type == "deus_item_tooltip"
					end
				}
			}
		},
		content = {
			item_text = "reliquary_z_reminder",
			info_type = "deus_item_tooltip",
			power_up_text = "reliquary_i_reminder"
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_size = 32,
				localize = true,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					0,
					0,
					0
				}
			},
			text_shadow = {
				vertical_alignment = "center",
				font_size = 32,
				localize = true,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					-1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local disable_with_gamepad = true
local widgets = {
	banner_top = UIWidgets.create_simple_rect("banner_top", banner_color, 20),
	banner_top_edge = create_edge_divider("banner_top", {
		scenegraph.banner_top.size[1],
		5
	}, 20),
	player_career_name = UIWidgets.create_simple_text("n/a", "player_career_name", 22, nil, player_career_name_style),
	player_name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "player_name_divider"),
	player_hero_name = UIWidgets.create_simple_text("n/a", "player_hero_name", 22, nil, player_hero_name_style),
	curse_information = UIWidgets.create_info_box("curse_information", nil, {
		60,
		60
	}, "button_frame_01_gold"),
	game_level = UIWidgets.create_simple_text("n/a", "game_level", 22, nil, level_title_style),
	game_difficulty = UIWidgets.create_simple_text("n/a", "game_difficulty", 22, nil, difficulty_text_style),
	center_title = UIWidgets.create_simple_text(Localize("deus_blessing_and_power_ups"), "center_title", 32, nil, center_title_style),
	center_title_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "center_title"),
	options_background_edge = UIWidgets.create_simple_texture("shrine_sidebar_background", "options_background_edge"),
	options_background = UIWidgets.create_tiled_texture("options_background", "menu_frame_bg_01", {
		960,
		1400
	}, nil, true, {
		255,
		120,
		120,
		120
	}),
	options_background_mask = UIWidgets.create_simple_uv_texture("shrine_sidebar_write_mask", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "options_background_mask"),
	no_power_ups_text = UIWidgets.create_simple_text("", "no_power_ups_text", nil, nil, no_active_items_text),
	no_blessings_text = UIWidgets.create_simple_text("", "no_blessings_text", nil, nil, no_active_items_text),
	screen_overlay = UIWidgets.create_simple_rect("screen", {
		101,
		0,
		0,
		0
	}, -999),
	input_description_text = create_input_text("player_list_show_mouse_description", "deus_run_stats_input_description", disable_with_gamepad),
	power_up_description = create_power_up("power_up_description_root")
}
local reminder_widgets = {
	reminder_text = create_reminder_text("n/a", "reminder_text")
}
local power_up_widget_size = {
	300,
	64
}
local power_up_widget_spacing = {
	20,
	10
}
local max_power_up_amount = 18
local max_height = 600
local sine_strength = 35
local offset = {
	25,
	-75
}
local total_height = 0
local column = 0

for i = 1, max_power_up_amount, 1 do
	if max_height < total_height then
		total_height = 0
		column = column + 1
	end

	local positive_offset_y = math.abs(offset[2])
	local relative_height = (positive_offset_y + total_height) / (max_height + positive_offset_y)
	local radians = math.degrees_to_radians(180 * relative_height)
	local sine_position_x = math.sin(radians) * sine_strength
	local position = {
		offset[1] + sine_position_x + column * (power_up_widget_size[1] + power_up_widget_spacing[1]),
		(offset[2] + max_height / 2) - total_height,
		10
	}
	total_height = total_height + power_up_widget_size[2] + power_up_widget_spacing[2]
	local scenegraph_id = "power_up_" .. i
	scenegraph[scenegraph_id] = {
		vertical_alignment = "center",
		parent = "power_up_root",
		horizontal_alignment = "left",
		size = power_up_widget_size,
		position = position
	}
end

local blessing_widget_data = {
	title_frame_name = "menu_frame_12",
	max_blessing_amount = 6,
	icon_frame_name = "button_frame_01_gold",
	info_frame_name = "menu_frame_12",
	spacing = 0,
	icon_size = {
		50,
		50
	},
	bottom_panel_size = {
		400,
		150
	}
}
local round_power_up_widget_data = {
	background_icon = "button_frame_01",
	width = power_up_widget_size[1],
	icon_size = {
		35,
		35
	},
	icon_offset = {
		15.5,
		14,
		1
	},
	background_icon_size = {
		65,
		65
	},
	background_icon_offset = {
		0,
		0,
		-1
	}
}
local rectangular_power_up_widget_data = {
	background_icon = "button_frame_01",
	width = power_up_widget_size[1],
	icon_size = {
		58,
		58
	},
	icon_offset = {
		5,
		5,
		0
	},
	background_icon_size = {
		65,
		65
	},
	background_icon_offset = {
		0,
		0,
		1
	}
}

return {
	scenegraph = scenegraph,
	widgets = widgets,
	reminder_widgets = reminder_widgets,
	blessing_widget_data = blessing_widget_data,
	max_power_up_amount = max_power_up_amount,
	round_power_up_widget_data = round_power_up_widget_data,
	rectangular_power_up_widget_data = rectangular_power_up_widget_data,
	animations_definitions = animations_definitions
}
