local scenegraph = {
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
local widgets = {
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
local animations = {}
animations.victory = {
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
			params.draw_flags.alpha_multiplier = 1
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
			params.draw_flags.alpha_multiplier = 1 - anim_fraction
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end
	}
}

return {
	scenegraph_definition = scenegraph,
	widget_definitions = widgets,
	animation_definitions = animations
}
