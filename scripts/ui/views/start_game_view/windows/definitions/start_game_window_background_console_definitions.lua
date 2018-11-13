local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
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
	detailed_button = {
		vertical_alignment = "top",
		parent = "preview",
		horizontal_alignment = "right",
		size = {
			50,
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	detailed_list = {
		vertical_alignment = "top",
		parent = "detailed_button",
		horizontal_alignment = "right",
		size = {
			window_size[1],
			window_size[2] - 120 - 50
		},
		position = {
			0,
			-40,
			1
		}
	},
	loading_overlay = {
		vertical_alignment = "center",
		parent = "root_fit",
		horizontal_alignment = "center",
		size = {
			314,
			33
		},
		position = {
			0,
			0,
			1
		}
	}
}
local loading_overlay_widgets = {
	loading_overlay = UIWidgets.create_simple_rect("root_fit", {
		255,
		12,
		12,
		12
	}),
	loading_overlay_loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "loading_overlay", nil, nil, nil, 1),
	loading_overlay_loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "loading_overlay")
}
local camera_position_by_character = {
	witch_hunter = {
		z = 0.4,
		x = 1,
		y = -0.4
	},
	bright_wizard = {
		z = 0.2,
		x = 1,
		y = -0.7
	},
	dwarf_ranger = {
		z = 0,
		x = 1,
		y = -0.6
	},
	wood_elf = {
		z = 0.16,
		x = 1,
		y = -0.5
	},
	empire_soldier = {
		z = 0.2,
		x = 1,
		y = -0.6
	},
	empire_soldier_tutorial = {
		z = 0.2,
		x = 1,
		y = -0.6
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	camera_position_by_character = camera_position_by_character,
	loading_overlay_widgets = loading_overlay_widgets
}
