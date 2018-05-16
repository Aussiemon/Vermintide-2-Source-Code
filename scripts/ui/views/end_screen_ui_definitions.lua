local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner
		},
		size = {
			1920,
			1080
		}
	},
	end_screen_banner_defeat = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			680,
			240
		}
	},
	end_screen_banner_victory = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			50,
			2
		},
		size = {
			680,
			240
		}
	},
	victory_effect_1 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_victory",
		horizontal_alignment = "center",
		position = {
			4,
			90,
			1
		},
		size = {
			900,
			530
		}
	},
	victory_effect_2 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_victory",
		horizontal_alignment = "center",
		position = {
			4,
			90,
			2
		},
		size = {
			900,
			530
		}
	},
	defeat_effect_1 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_defeat",
		horizontal_alignment = "center",
		position = {
			50,
			-100,
			-2
		},
		size = {
			1080,
			600
		}
	},
	defeat_effect_2 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_defeat",
		horizontal_alignment = "center",
		position = {
			-50,
			-200,
			-1
		},
		size = {
			230,
			400
		}
	},
	victory_effect_shine_1 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_victory",
		horizontal_alignment = "center",
		position = {
			46,
			28,
			5
		},
		size = {
			256,
			256
		}
	},
	victory_effect_shine_2 = {
		vertical_alignment = "center",
		parent = "end_screen_banner_victory",
		horizontal_alignment = "center",
		position = {
			-190,
			84,
			5
		},
		size = {
			200,
			200
		}
	},
	title_text_defeat = {
		vertical_alignment = "top",
		parent = "end_screen_banner_defeat",
		horizontal_alignment = "center",
		position = {
			0,
			90,
			3
		},
		size = {
			1200,
			100
		}
	},
	title_text_victory = {
		vertical_alignment = "top",
		parent = "end_screen_banner_victory",
		horizontal_alignment = "center",
		position = {
			0,
			90,
			3
		},
		size = {
			1200,
			100
		}
	}
}
local widget_definitions = {
	background_rect = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect"
				}
			}
		},
		content = {},
		style = {
			rect = {
				color = {
					0,
					0,
					0,
					0
				}
			}
		}
	}
}
local title_text_victory_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 100,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local title_text_defeat_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 100,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}
local victory_widgets = {
	title_text = UIWidgets.create_simple_text(Localize("end_screen_win"), "title_text_victory", nil, nil, title_text_victory_style),
	banner = UIWidgets.create_simple_texture("end_screen_banner_victory", "end_screen_banner_victory"),
	effect_1 = UIWidgets.create_simple_texture("end_screen_effect_victory_1", "victory_effect_1"),
	effect_2 = UIWidgets.create_simple_texture("end_screen_effect_victory_2", "victory_effect_2"),
	shine_1 = UIWidgets.create_simple_rotated_texture("sparkle_effect", 0, {
		128,
		128
	}, "victory_effect_shine_1"),
	shine_2 = UIWidgets.create_simple_rotated_texture("sparkle_effect", math.degrees_to_radians(75), {
		100,
		100
	}, "victory_effect_shine_2")
}
local defeat_widgets = {
	title_text = UIWidgets.create_simple_text(Localize("end_screen_loss"), "title_text_defeat", nil, nil, title_text_defeat_style),
	banner = UIWidgets.create_simple_texture("end_screen_banner_defeat", "end_screen_banner_defeat"),
	effect_1 = UIWidgets.create_simple_texture("end_screen_effect_defeat_1", "defeat_effect_1"),
	effect_2 = UIWidgets.create_simple_texture("end_screen_effect_defeat_2", "defeat_effect_2")
}
local animations = {
	victory = {
		{
			name = "entry",
			start_progress = 1,
			end_progress = 1.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.banner.style.texture_id.color[1] = 0
				widgets.effect_1.style.texture_id.color[1] = 0
				widgets.effect_2.style.texture_id.color[1] = 0
				widgets.title_text.style.text.text_color[1] = 0
				widgets.title_text.style.text_shadow.text_color[1] = 0
				widgets.shine_1.style.texture_id.color[1] = 0
				widgets.shine_2.style.texture_id.color[1] = 0
				params.draw_flags.banner_alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				widgets.banner.style.texture_id.color[1] = 255 * anim_fraction
				local banner_default_size = scenegraph_definition.end_screen_banner_victory.size
				ui_scenegraph.end_screen_banner_victory.size[1] = banner_default_size[1] + banner_default_size[1] * 3 * anim_size_fraction
				ui_scenegraph.end_screen_banner_victory.size[2] = banner_default_size[2] + banner_default_size[2] * 3 * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text",
			start_progress = 1.4,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local alpha = 255 * anim_fraction
				local text_style = widgets.title_text.style.text
				local text_shadow_style = widgets.title_text.style.text_shadow
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				local new_text_size = 100 + 100 * anim_font_size_fraction
				text_style.font_size = new_text_size
				text_shadow_style.font_size = new_text_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "shine_1",
			start_progress = 1.5,
			end_progress = 2.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local alpha_fraction = math.ease_pulse(anim_fraction)
				local alpha = 255 * alpha_fraction
				widgets.shine_1.style.texture_id.color[1] = alpha
				local degrees = 90
				widgets.shine_1.style.texture_id.angle = math.degrees_to_radians(degrees * anim_fraction)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "shine_2",
			start_progress = 1.4,
			end_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local alpha_fraction = math.ease_pulse(anim_fraction)
				local alpha = 255 * alpha_fraction
				widgets.shine_2.style.texture_id.color[1] = alpha
				local degrees = -90
				widgets.shine_2.style.texture_id.angle = math.degrees_to_radians(75 + degrees * anim_fraction)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "glow",
			start_progress = 1.4,
			end_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local alpha = 255 * anim_fraction
				widgets.effect_1.style.texture_id.color[1] = alpha
				widgets.effect_2.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 6,
			end_progress = 6.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				params.draw_flags.banner_alpha_multiplier = 1 - anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	defeat = {
		{
			name = "entry",
			start_progress = 1.4,
			end_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.banner.style.texture_id.color[1] = 0
				widgets.effect_1.style.texture_id.color[1] = 0
				widgets.effect_2.style.texture_id.color[1] = 0
				widgets.title_text.style.text.text_color[1] = 0
				widgets.title_text.style.text_shadow.text_color[1] = 0
				params.draw_flags.banner_alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				widgets.banner.style.texture_id.color[1] = 255 * anim_fraction
				local banner_default_size = scenegraph_definition.end_screen_banner_defeat.size
				ui_scenegraph.end_screen_banner_defeat.size[1] = banner_default_size[1] + banner_default_size[1] * 3 * anim_size_fraction
				ui_scenegraph.end_screen_banner_defeat.size[2] = banner_default_size[2] + banner_default_size[2] * 3 * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text",
			start_progress = 1.8,
			end_progress = 2.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local alpha = 255 * anim_fraction
				local text_style = widgets.title_text.style.text
				local text_shadow_style = widgets.title_text.style.text_shadow
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				local new_text_size = 100 + 100 * anim_font_size_fraction
				text_style.font_size = new_text_size
				text_shadow_style.font_size = new_text_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "effect_1",
			start_progress = 1,
			end_progress = 1.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local alpha = 255 * anim_fraction
				widgets.effect_1.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "effect_2",
			start_progress = 1.7,
			end_progress = 3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.ease_out_quad(progress)
				local alpha = 255 * anim_fraction
				widgets.effect_2.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 6,
			end_progress = 6.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				params.draw_flags.banner_alpha_multiplier = 1 - anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	fade_in_background = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.draw_background = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				local color = widget.style.rect.color
				local alpha = 255 * anim_fraction
				color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	fade_out_background = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				local color = widget.style.rect.color
				local alpha = 255 - anim_fraction * 255
				color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.draw_background = false
			end
		}
	},
	auto_display_text = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				params.draw_flags.draw_text = true
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				widget.style.banner_effect_texture.color[1] = anim_fraction * 255
				widget.style.banner_texture.color[1] = anim_fraction * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 4,
			end_progress = 4.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				widget.style.banner_effect_texture.color[1] = (1 - anim_fraction) * 255
				widget.style.banner_texture.color[1] = (1 - anim_fraction) * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.draw_text = false
			end
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widget_definitions,
	victory_widgets = victory_widgets,
	defeat_widgets = defeat_widgets,
	animations = animations
}
