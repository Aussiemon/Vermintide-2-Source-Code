-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_panel_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1] - window_frame_width * 2,
	(window_size[2] - window_frame_height * 2) / 3.5,
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	panel = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			60,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	panel_fade = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			30,
		},
		position = {
			0,
			-60,
			UILayer.default + 1,
		},
	},
	panel_edge = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			4,
		},
		position = {
			0,
			0,
			UILayer.default + 10,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	close_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			50,
			-40,
			3,
		},
	},
}
local panel_color = UISettings.console_menu_rect_color
local widgets = {
	panel = UIWidgets.create_simple_rect("panel", {
		255,
		0,
		0,
		0,
	}),
	panel_fade = UIWidgets.create_simple_uv_texture("vertical_gradient", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "panel_fade", false, false, {
		255,
		0,
		0,
		0,
	}),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_back", "layout_button_back_glow"),
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

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
