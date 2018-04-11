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
			UILayer.end_screen
		}
	},
	chest_title = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-100,
			1
		}
	},
	chest_sub_title = {
		vertical_alignment = "top",
		parent = "chest_title",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-40,
			1
		}
	},
	upgrade_root = {
		vertical_alignment = "center",
		parent = "chest_title",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-110,
			5
		}
	},
	upgrade_background = {
		vertical_alignment = "center",
		parent = "upgrade_root",
		horizontal_alignment = "center",
		size = {
			500,
			90
		},
		position = {
			0,
			0,
			0
		}
	},
	upgrade_divider = {
		vertical_alignment = "center",
		parent = "upgrade_root",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-40,
			2
		}
	},
	upgrade_divider_glow = {
		vertical_alignment = "bottom",
		parent = "upgrade_divider",
		horizontal_alignment = "center",
		size = {
			264,
			80
		},
		position = {
			0,
			20,
			-1
		}
	},
	right_side_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			-20,
			0,
			1
		}
	},
	left_side_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			20,
			0,
			1
		}
	},
	score_bar_bg = {
		vertical_alignment = "bottom",
		parent = "score_entry_window",
		horizontal_alignment = "center",
		size = {
			278,
			30
		},
		position = {
			0,
			-36,
			1
		}
	},
	score_bar = {
		vertical_alignment = "bottom",
		parent = "score_bar_bg",
		horizontal_alignment = "left",
		size = {
			278,
			30
		},
		position = {
			0,
			0,
			2
		}
	},
	score_bar_edge = {
		vertical_alignment = "center",
		parent = "score_bar",
		horizontal_alignment = "right",
		size = {
			35,
			30
		},
		position = {
			35,
			0,
			3
		}
	},
	background = {
		vertical_alignment = "bottom",
		parent = "score_bar_bg",
		horizontal_alignment = "center",
		size = {
			820,
			90
		},
		position = {
			0,
			38,
			-3
		}
	},
	score_bar_fg = {
		vertical_alignment = "bottom",
		parent = "score_bar_bg",
		horizontal_alignment = "center",
		size = {
			352,
			134
		},
		position = {
			0,
			-14,
			8
		}
	},
	score_bar_start = {
		vertical_alignment = "bottom",
		parent = "score_bar_bg",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			3
		}
	},
	score_entry_texture = {
		vertical_alignment = "top",
		parent = "score_bar_bg",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			80,
			3
		}
	},
	score_entry_bg_left = {
		vertical_alignment = "center",
		parent = "score_entry_texture",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	score_entry_bg_right = {
		vertical_alignment = "center",
		parent = "score_entry_texture",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			0,
			0,
			-2
		}
	},
	score_entry_text = {
		vertical_alignment = "center",
		parent = "score_entry_texture",
		horizontal_alignment = "left",
		size = {
			800,
			40
		},
		position = {
			0,
			0,
			1
		}
	},
	score_entry_window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			360,
			576
		},
		position = {
			50,
			50,
			1
		}
	},
	score_window_top_divider = {
		vertical_alignment = "top",
		parent = "score_entry_window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			14,
			1
		}
	},
	score_entry_root = {
		vertical_alignment = "top",
		parent = "score_entry_window",
		horizontal_alignment = "left",
		size = {
			600,
			100
		},
		position = {
			40,
			-10,
			1
		}
	}
}
local upgrade_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 50,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 0),
	offset = {
		0,
		-4,
		2
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 0),
	offset = {
		0,
		0,
		2
	}
}
local score_entry_widgets = {}
local num_score_entries = 10

for i = 1, num_score_entries, 1 do
	score_entry_widgets[i] = UIWidgets.create_chest_score_entry("score_entry_root", scenegraph_definition.score_entry_root.size, i)
end

local widgets = {
	chest_title = UIWidgets.create_simple_text("chest_title", "chest_title", nil, nil, title_text_style),
	chest_sub_title = UIWidgets.create_simple_text("chest_sub_title", "chest_sub_title", nil, nil, sub_title_text_style),
	upgrade_background = UIWidgets.create_simple_texture("tab_menu_bg_02", "upgrade_background", nil, nil, {
		0,
		255,
		255,
		255
	}),
	upgrade_text = UIWidgets.create_simple_text("chest upgrade", "upgrade_background", nil, nil, upgrade_text_style),
	score_window_top_divider = UIWidgets.create_simple_texture("divider_01_top", "score_window_top_divider"),
	score_entry_window = UIWidgets.create_simple_texture("info_window_background", "score_entry_window"),
	score_entry_texture = UIWidgets.create_simple_texture("icons_placeholder", "score_entry_texture"),
	score_entry_bg_left = UIWidgets.create_simple_texture("tab_menu_bg_03", "score_entry_bg_left"),
	score_entry_bg_right = UIWidgets.create_simple_texture("tab_menu_bg_03", "score_entry_bg_right"),
	bar_bg = UIWidgets.create_simple_texture("chest_upgrade_bg", "score_bar_bg"),
	score_bar_edge = UIWidgets.create_simple_texture("chest_upgrade_fill_glow", "score_bar_edge"),
	score_bar = UIWidgets.create_simple_uv_texture("chest_upgrade_fill", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "score_bar"),
	score_bar_fg = UIWidgets.create_simple_texture("chest_upgrade_fg", "score_bar_fg")
}

local function create_bar_divider(icon_texture)
	return {
		scenegraph_id = "score_bar_start",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "divider"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				}
			}
		},
		content = {
			icon = icon_texture
		},
		style = {
			divider = {
				size = {
					4,
					80
				},
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			icon = {
				size = {
					60,
					60
				},
				offset = {
					-30,
					-65,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local animation_definitions = {
	transition_enter = {
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
				ui_scenegraph.score_entry_window.local_position[1] = 50 - 400 * (1 - anim_progress)

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	transition_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.score_entry_window.local_position[1] = 50 - 400 * anim_progress
				ui_scenegraph.chest_title.local_position[2] = -100 + 100 * anim_progress

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	score_entry_add = {
		{
			name = "icon_entry",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local icon_style = widget.style.texture_id
				icon_style.color[1] = 0
				params.enter_sound_played = false

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.enter_sound_played then
					params.enter_sound_played = true

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_chest_upgrade_topic_enter")
				end

				local widget = params.widget
				local style = widget.style
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				style.texture_id.color[1] = alpha
				style.text.text_color[1] = alpha
				style.text_disabled.text_color[1] = 255 - alpha
				local marker_color_from = Colors.color_definitions.font_default
				local marker_color_to = Colors.color_definitions.white
				local marker_color = style.marker.color

				Colors.lerp_color_tables(marker_color_from, marker_color_to, anim_progress, marker_color)

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "icon_size",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_pulse(progress)
				local widget = params.widget
				local icon_style = widget.style.texture_id
				local size = icon_style.texture_size
				local default_size = icon_style.default_size
				local offset = icon_style.offset
				local size_increase = 10
				size[1] = default_size[1] + size_increase * anim_progress
				size[2] = default_size[2] + size_increase * anim_progress
				offset[1] = -(size[1] - default_size[1]) * 0.5

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "text_bump",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_pulse(progress)
				local font_size = 20
				local max_font_size = 26
				local new_font_size = font_size + (max_font_size - font_size) * anim_progress
				local widget = params.widget
				widget.style.text.font_size = new_font_size
				widget.style.text_shadow.font_size = new_font_size
				widget.style.text_disabled.font_size = new_font_size

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	score_presentation_start = {
		{
			name = "highlight_start",
			start_progress = 0.5,
			end_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.enter_sound_played = false

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.enter_sound_played then
					params.enter_sound_played = true
					local sound_event = "play_gui_mission_summary_chest_upgrade_check_0" .. params.entry_index

					WwiseWorld.trigger_event(params.wwise_world, sound_event)
				end

				local widget = params.widget
				local style = widget.style
				local offset = widget.offset
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				local icon_glow_color = style.texture_id_glow.color
				local text_color = style.text.text_color
				icon_glow_color[1] = alpha
				local text_color_from = Colors.color_definitions.white
				local text_color_to = Colors.color_definitions.font_title

				Colors.lerp_color_tables(text_color_from, text_color_to, anim_progress, text_color)

				offset[1] = anim_progress * 20
				style.marker.offset[1] = -10 + -offset[1]

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	score_presentation_end = {
		{
			name = "highlight_end",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local style = widget.style
				local offset = widget.offset
				local anim_progress = math.easeInCubic(progress)
				local alpha = 255 - anim_progress * 255
				local icon_color = style.texture_id.color
				local icon_glow_color = style.texture_id_glow.color
				local text_color = style.text.text_color
				icon_glow_color[1] = alpha
				local text_color_from = Colors.color_definitions.font_title
				local text_color_to = Colors.get_color_table_with_alpha("font_default", 255)
				local color_multiplier = 0.8
				text_color_to[2] = text_color_to[2] * color_multiplier
				text_color_to[3] = text_color_to[3] * color_multiplier
				text_color_to[4] = text_color_to[4] * color_multiplier

				Colors.lerp_color_tables(text_color_from, text_color_to, anim_progress, text_color)
				Colors.lerp_color_tables(Colors.color_definitions.white, text_color_to, anim_progress, icon_color)

				offset[1] = 20 - anim_progress * 20
				style.marker.offset[1] = -10 + -offset[1]

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "checkbox_enter",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.checkbox_sound_played = false

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.checkbox_sound_played then
					params.checkbox_sound_played = true

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_chest_upgrade_topic_ticked")
				end

				local widget = params.widget
				local style = widget.style
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(progress)
				local alpha = anim_progress * 255
				style.checkbox.color[1] = alpha
				style.checkbox_shadow.color[1] = alpha
				local size = style.checkbox.texture_size
				local default_width = 37
				local default_height = 31
				size[1] = default_width + (1 - anim_progress) * default_width * 2
				size[2] = default_height + (1 - anim_progress) * default_height * 2

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	chest_title_initialize = {
		{
			name = "fade_in",
			start_progress = 0.5,
			end_progress = 0.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				widgets.chest_title.style.text.text_color[1] = alpha
				widgets.chest_title.style.text_shadow.text_color[1] = alpha
				widgets.chest_sub_title.style.text.text_color[1] = alpha
				widgets.chest_sub_title.style.text_shadow.text_color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	chest_title_update = {
		{
			name = "upgrade_background_fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				widgets.upgrade_background.style.texture_id.color[1] = alpha

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				widgets.upgrade_background.style.texture_id.color[1] = alpha
				local scenegraph_id = "upgrade_background"
				local default_size = scenegraph_definition[scenegraph_id].size
				local size = ui_scenegraph[scenegraph_id].size
				size[1] = default_size[1] + default_size[1] * (1 - anim_progress)
				size[2] = default_size[2] + default_size[2] * (1 - anim_progress)

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "upgrade_text_fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				widgets.upgrade_text.style.text.text_color[1] = alpha
				widgets.upgrade_text.style.text_shadow.text_color[1] = alpha

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				local widget = widgets.upgrade_text
				widget.style.text.text_color[1] = alpha
				widget.style.text_shadow.text_color[1] = alpha
				local font_size = 50
				local max_font_size = 100
				local new_font_size = font_size + (max_font_size - font_size) * (1 - anim_progress)
				widget.style.text.font_size = new_font_size
				widget.style.text_shadow.font_size = new_font_size

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "upgrade_background_fade_out",
			start_progress = 0.8,
			end_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = 255 - anim_progress * 255
				widgets.upgrade_background.style.texture_id.color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "upgrade_text_fade_out",
			start_progress = 0.9,
			end_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = 255 - anim_progress * 255
				widgets.upgrade_text.style.text.text_color[1] = alpha
				widgets.upgrade_text.style.text_shadow.text_color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "title_fade_in",
			start_progress = 1.2,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				widgets.chest_title.style.text.text_color[1] = alpha
				widgets.chest_title.style.text_shadow.text_color[1] = alpha
				widgets.chest_sub_title.style.text.text_color[1] = alpha
				widgets.chest_sub_title.style.text_shadow.text_color[1] = alpha

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress * 255
				widgets.chest_title.style.text.text_color[1] = alpha
				widgets.chest_title.style.text_shadow.text_color[1] = alpha
				widgets.chest_sub_title.style.text.text_color[1] = alpha
				widgets.chest_sub_title.style.text_shadow.text_color[1] = alpha

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
	score_entry_widgets = score_entry_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_bar_divider = create_bar_divider
}
