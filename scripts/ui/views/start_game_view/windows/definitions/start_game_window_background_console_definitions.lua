-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_background_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
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
	preview = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2] - 120,
		},
		position = {
			0,
			0,
			8,
		},
	},
	detailed_button = {
		horizontal_alignment = "right",
		parent = "preview",
		vertical_alignment = "top",
		size = {
			50,
			50,
		},
		position = {
			0,
			0,
			1,
		},
	},
	detailed_list = {
		horizontal_alignment = "right",
		parent = "detailed_button",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2] - 120 - 50,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	loading_overlay = {
		horizontal_alignment = "center",
		parent = "root_fit",
		vertical_alignment = "center",
		size = {
			314,
			33,
		},
		position = {
			0,
			0,
			1,
		},
	},
}
local loading_overlay_widgets = {
	loading_overlay = UIWidgets.create_simple_rect("root_fit", {
		255,
		12,
		12,
		12,
	}),
	loading_overlay_loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "loading_overlay", nil, nil, nil, 1),
	loading_overlay_loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "loading_overlay"),
}
local camera_position_by_character = {
	witch_hunter = {
		x = 1,
		y = -0.4,
		z = 0.4,
	},
	bright_wizard = {
		x = 1,
		y = -0.7,
		z = 0.2,
	},
	dwarf_ranger = {
		x = 1,
		y = -0.6,
		z = 0,
	},
	wood_elf = {
		x = 1,
		y = -0.5,
		z = 0.16,
	},
	empire_soldier = {
		x = 1,
		y = -0.6,
		z = 0.2,
	},
	empire_soldier_tutorial = {
		x = 1,
		y = -0.6,
		z = 0.2,
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	camera_position_by_character = camera_position_by_character,
	loading_overlay_widgets = loading_overlay_widgets,
}
