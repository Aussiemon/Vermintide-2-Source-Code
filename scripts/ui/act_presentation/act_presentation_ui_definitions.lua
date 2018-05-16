local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.end_screen_banner
		}
	},
	level = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			180,
			180
		},
		position = {
			0,
			-200,
			1
		}
	},
	title_divider = {
		vertical_alignment = "bottom",
		parent = "level",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-120,
			1
		}
	},
	level_title = {
		vertical_alignment = "center",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			32,
			1
		}
	},
	difficulty_title = {
		vertical_alignment = "center",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			32,
			1
		}
	},
	act_title = {
		vertical_alignment = "center",
		parent = "title_divider",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-38,
			1
		}
	}
}
local act_title_text_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		1
	}
}
local level_title_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_title_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_level_widget()
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture",
			style_id = "glass",
			texture_id = "glass"
		},
		{
			pass_type = "texture",
			style_id = "frame_glow",
			texture_id = "frame_glow"
		}
	}
	local content = {
		glass = "act_presentation_fg_glass",
		icon = "level_icon_01",
		frame = "map_frame_00",
		frame_glow = "map_frame_glow_02"
	}
	local style = {
		frame_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				270,
				270
			},
			offset = {
				0,
				0,
				4
			},
			color = {
				0,
				255,
				255,
				255
			}
		},
		glass = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				216,
				216
			},
			offset = {
				0,
				0,
				3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				2
			},
			texture_size = {
				180,
				180
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				168,
				168
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
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = "level"

	return widget
end

local widgets = {
	level = create_level_widget(),
	act_title = UIWidgets.create_simple_text("ACT IV", "act_title", nil, nil, act_title_text_style),
	level_title = UIWidgets.create_simple_text("Catacombs", "level_title", nil, nil, level_title_text_style),
	title_divider = UIWidgets.create_simple_texture("divider_01_top", "title_divider")
}
local animations = {
	enter = {
		{
			name = "frame_change",
			start_progress = 0,
			end_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local difficulty_index = params.difficulty_index
				widgets.level.content.frame = "map_frame_0" .. difficulty_index
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "entry",
			start_progress = 2,
			end_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = 0
				params.played_entry_sound = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_entry_sound then
					params.played_entry_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_skullz_show_plate")
				end

				local anim_fraction = math.easeInCubic(progress)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = anim_fraction
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				local widget = widgets.level
				local style = widget.style
				local size_multiplier = 3
				local icon_size = style.icon.texture_size
				icon_size[1] = 168 + 168 * size_multiplier * anim_size_fraction
				icon_size[2] = 168 + 168 * size_multiplier * anim_size_fraction
				local frame_size = style.frame.texture_size
				frame_size[1] = 180 + 180 * size_multiplier * anim_size_fraction
				frame_size[2] = 180 + 180 * size_multiplier * anim_size_fraction
				local glass_size = style.glass.texture_size
				glass_size[1] = 216 + 216 * size_multiplier * anim_size_fraction
				glass_size[2] = 216 + 216 * size_multiplier * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text",
			start_progress = 2.4,
			end_progress = 2.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				local text_style = widgets.level_title.style.text
				local text_shadow_style = widgets.level_title.style.text_shadow
				local act_text_style = widgets.act_title.style.text
				local act_text_shadow_style = widgets.act_title.style.text_shadow
				local title_divider_style = widgets.title_divider.style.texture_id
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				act_text_style.text_color[1] = alpha
				act_text_shadow_style.text_color[1] = alpha
				title_divider_style.color[1] = alpha
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				local alpha = 255 * anim_fraction
				local text_style = widgets.level_title.style.text
				local text_shadow_style = widgets.level_title.style.text_shadow
				local act_text_style = widgets.act_title.style.text
				local act_text_shadow_style = widgets.act_title.style.text_shadow
				local title_divider_style = widgets.title_divider.style.texture_id
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				act_text_style.text_color[1] = alpha
				act_text_shadow_style.text_color[1] = alpha
				title_divider_style.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 5.7,
			end_progress = 6.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = 1 - anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	enter_first_time = {
		{
			name = "entry",
			start_progress = 2,
			end_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = 0
				params.played_entry_sound = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_entry_sound then
					params.played_entry_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_skullz_show_plate")
				end

				local anim_fraction = math.easeInCubic(progress)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = anim_fraction
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				local widget = widgets.level
				local style = widget.style
				local size_multiplier = 3
				local icon_size = style.icon.texture_size
				icon_size[1] = 168 + 168 * size_multiplier * anim_size_fraction
				icon_size[2] = 168 + 168 * size_multiplier * anim_size_fraction
				local frame_size = style.frame.texture_size
				frame_size[1] = 180 + 180 * size_multiplier * anim_size_fraction
				frame_size[2] = 180 + 180 * size_multiplier * anim_size_fraction
				local glass_size = style.glass.texture_size
				glass_size[1] = 216 + 216 * size_multiplier * anim_size_fraction
				glass_size[2] = 216 + 216 * size_multiplier * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text",
			start_progress = 2.4,
			end_progress = 2.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				local text_style = widgets.level_title.style.text
				local text_shadow_style = widgets.level_title.style.text_shadow
				local act_text_style = widgets.act_title.style.text
				local act_text_shadow_style = widgets.act_title.style.text_shadow
				local title_divider_style = widgets.title_divider.style.texture_id
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				act_text_style.text_color[1] = alpha
				act_text_shadow_style.text_color[1] = alpha
				title_divider_style.color[1] = alpha
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)
				local anim_font_size_fraction = math.ease_in_exp(1 - progress)
				local size_fraction = math.easeCubic(1 - progress)
				local anim_size_fraction = math.catmullrom(size_fraction, 1.8, 0, 1, -1)
				local alpha = 255 * anim_fraction
				local text_style = widgets.level_title.style.text
				local text_shadow_style = widgets.level_title.style.text_shadow
				local act_text_style = widgets.act_title.style.text
				local act_text_shadow_style = widgets.act_title.style.text_shadow
				local title_divider_style = widgets.title_divider.style.texture_id
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
				act_text_style.text_color[1] = alpha
				act_text_shadow_style.text_color[1] = alpha
				title_divider_style.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "glow",
			start_progress = 2.5,
			end_progress = 4.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				local frame_glow = widgets.level.style.frame_glow
				frame_glow.color[1] = alpha
				params.played_skull_sound = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_skull_sound then
					params.played_skull_sound = true
					local difficulty_index = params.difficulty_index

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_skullz_tier_0" .. difficulty_index)
				end

				local anim_fraction = math.easeOutCubic(progress)
				anim_fraction = math.ease_pulse(anim_fraction)
				local alpha = 255 * anim_fraction
				local frame_glow = widgets.level.style.frame_glow
				frame_glow.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "frame_change",
			start_progress = 3.2,
			end_progress = 3.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local difficulty_index = params.difficulty_index
				widgets.level.content.frame = "map_frame_0" .. difficulty_index
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 5.7,
			end_progress = 6.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local render_settings = params.render_settings
				render_settings.alpha_multiplier = 1 - anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	animations = animations,
	scenegraph_definition = scenegraph_definition,
	widgets = widgets
}
