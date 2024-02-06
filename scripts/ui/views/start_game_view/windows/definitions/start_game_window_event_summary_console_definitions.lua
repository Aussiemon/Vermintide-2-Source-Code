-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_summary_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local game_option_size = {
	window_size[1] - 20,
	700,
}
local event_summary_size = {
	game_option_size[1] - 10,
	0,
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
		horizontal_alignment = "left",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			850,
			0,
			1,
		},
	},
	event_summary = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = event_summary_size,
		position = {
			0,
			0,
			1,
		},
	},
}
local event_summary_passes = {
	"event_mission",
	"mutators",
	"console_item_background",
}
local widgets = {
	event_summary = UIWidgets.create_simple_item_presentation("event_summary", event_summary_passes),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
