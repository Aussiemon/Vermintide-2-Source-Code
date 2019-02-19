local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	top_panel_fade = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			400
		},
		position = {
			0,
			-69,
			UILayer.default + 3
		}
	},
	bottom_panel_fade = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			400
		},
		position = {
			0,
			69,
			UILayer.default + 3
		}
	},
	background_gradient = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			800,
			1
		},
		position = {
			0,
			0,
			1
		}
	}
}
local widgets = {
	screen_shadow = UIWidgets.create_simple_texture("gradient_store_menu", "screen", nil, nil, nil, 1),
	top_panel_fade = UIWidgets.create_simple_texture("loot_presentation_fg_01_fade", "top_panel_fade", nil, nil, {
		200,
		255,
		255,
		255
	}),
	bottom_panel_fade = UIWidgets.create_simple_texture("loot_presentation_fg_02_fade", "bottom_panel_fade", nil, nil, {
		200,
		255,
		255,
		255
	}),
	tiled_background_layer = UIWidgets.create_tiled_texture("screen", "menu_frame_bg_08", {
		512,
		512
	}, {
		0,
		0,
		2
	}, nil, {
		255,
		255,
		255,
		255
	}),
	tiled_star_layer = UIWidgets.create_tiled_texture("screen", "store_bg_marble_highlights", {
		512,
		512
	}, {
		0,
		0,
		3
	}),
	background_gradient = UIWidgets.create_simple_rotated_texture("store_bg_gradient", 0, {
		0,
		0
	}, "background_gradient"),
	start_gradient = UIWidgets.create_simple_rotated_texture("store_bg_marble_highlights_mask", 0, {
		0,
		0
	}, "background_gradient"),
	background_rect = UIWidgets.create_simple_rect("screen", Colors.get_color_table_with_alpha("font_button_normal", 255))
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
