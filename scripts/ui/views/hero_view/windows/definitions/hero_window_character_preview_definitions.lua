local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width*2 + 60)
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
	preview = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_size[2] - 120
		},
		position = {
			0,
			0,
			8
		}
	},
	title_text_glow = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			544,
			16
		},
		position = {
			0,
			15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title_text_glow",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			50
		},
		position = {
			0,
			15,
			1
		}
	}
}
local title_text_style = {
	vertical_alignment = "bottom",
	upper_case = true,
	localize = false,
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local adventure_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	font_size = 36,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local reward_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	vertical_alignment = "top",
	font_size = 18,
	localize = false,
	horizontal_alignment = "center",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local viewport_widget = {
	scenegraph_id = "preview",
	element = UIElements.Viewport,
	style = {
		viewport = {
			layer = 990,
			viewport_name = "character_preview_viewport",
			clear_screen_on_create = true,
			level_name = "levels/ui_inventory_preview/world",
			enable_sub_gui = false,
			world_name = "character_preview",
			world_flags = {
				Application.DISABLE_SOUND,
				Application.DISABLE_ESRAM
			},
			camera_position = {
				0,
				0,
				0
			},
			camera_lookat = {
				0,
				0,
				0
			}
		}
	},
	content = {
		button_hotspot = {
			allow_multi_hover = true
		}
	}
}
local camera_position_by_character = {
	witch_hunter = {
		z = 0.4,
		x = 0,
		y = -0.4
	},
	bright_wizard = {
		z = 0.2,
		x = 0,
		y = -0.7
	},
	dwarf_ranger = {
		z = 0,
		x = 0,
		y = -0.6
	},
	wood_elf = {
		z = 0.16,
		x = 0,
		y = -0.5
	},
	empire_soldier = {
		z = 0.2,
		x = 0,
		y = -0.6
	},
	empire_soldier_tutorial = {
		z = 0.2,
		x = 0,
		y = -0.6
	}
}
local widgets = {
	window = UIWidgets.create_frame("window", window_size, window_frame, 10)
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
	viewport_widget = viewport_widget,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	camera_position_by_character = camera_position_by_character
}
