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
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1094,
			873
		},
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			978,
			678
		},
		position = {
			0,
			20,
			1
		}
	},
	summary_title = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-48,
			1
		}
	},
	title_bg = {
		vertical_alignment = "center",
		parent = "summary_title",
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
	experience_fg = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			985,
			91
		},
		position = {
			-2,
			-80,
			7
		}
	},
	sparkle_effect = {
		vertical_alignment = "center",
		parent = "experience_fg",
		horizontal_alignment = "center",
		size = {
			256,
			256
		},
		position = {
			434,
			15,
			10
		}
	},
	experience_bar = {
		vertical_alignment = "bottom",
		parent = "experience_fg",
		horizontal_alignment = "center",
		size = {
			816,
			70
		},
		position = {
			2,
			0,
			-6
		}
	},
	next_level_text = {
		vertical_alignment = "bottom",
		parent = "experience_fg",
		horizontal_alignment = "right",
		size = {
			54,
			54
		},
		position = {
			-9,
			9,
			-1
		}
	},
	current_level_text = {
		vertical_alignment = "bottom",
		parent = "experience_fg",
		horizontal_alignment = "left",
		size = {
			54,
			54
		},
		position = {
			13,
			9,
			-1
		}
	},
	experience_entry_root = {
		vertical_alignment = "top",
		parent = "experience_bar",
		horizontal_alignment = "center",
		size = {
			250,
			50
		},
		position = {
			0,
			-60,
			1
		}
	},
	summary_entry_root = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			820,
			40
		},
		position = {
			0,
			-100,
			1
		}
	},
	summary_entry_title = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			820,
			40
		},
		position = {
			0,
			210,
			1
		}
	},
	summary_entry_total_title = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			820,
			40
		},
		position = {
			0,
			-260,
			1
		}
	},
	summary_entry_total_essence_group = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			838,
			137
		},
		position = {
			0,
			-340,
			1
		}
	},
	summary_entry_essence_background = {
		vertical_alignment = "center",
		parent = "summary_entry_total_essence_group",
		horizontal_alignment = "center",
		size = {
			890,
			88
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_entry_essence_background_effect_left = {
		vertical_alignment = "center",
		parent = "summary_entry_essence_background",
		horizontal_alignment = "left",
		size = {
			240,
			88
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_entry_essence_background_effect_right = {
		vertical_alignment = "center",
		parent = "summary_entry_essence_background",
		horizontal_alignment = "right",
		size = {
			240,
			88
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_entry_total_essence_title = {
		vertical_alignment = "center",
		parent = "summary_entry_essence_background",
		horizontal_alignment = "left",
		size = {
			646,
			97
		},
		position = {
			34,
			0,
			1
		}
	},
	summary_entry_total_essence_gained = {
		vertical_alignment = "center",
		parent = "summary_entry_essence_background",
		horizontal_alignment = "right",
		size = {
			300,
			97
		},
		position = {
			-34,
			0,
			1
		}
	},
	summary_entry_essence_icon = {
		vertical_alignment = "center",
		parent = "summary_entry_total_essence_gained",
		horizontal_alignment = "right",
		size = {
			32,
			32
		},
		position = {
			0,
			0,
			1
		}
	},
	entry_window = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			980,
			64
		},
		position = {
			0,
			0,
			3
		}
	},
	stamp = {
		vertical_alignment = "top",
		parent = "entry_window",
		horizontal_alignment = "center",
		size = {
			1024,
			83
		},
		position = {
			0,
			5,
			5
		}
	},
	left_entry_holder = {
		vertical_alignment = "center",
		parent = "entry_window",
		horizontal_alignment = "left",
		size = {
			50,
			102
		},
		position = {
			0,
			0,
			2
		}
	},
	right_entry_holder = {
		vertical_alignment = "center",
		parent = "entry_window",
		horizontal_alignment = "right",
		size = {
			50,
			102
		},
		position = {
			0,
			0,
			2
		}
	}
}
local summary_entry_widgets = {}
local num_experience_entries = 10

for i = 1, num_experience_entries, 1 do
	summary_entry_widgets["summary_entry_" .. i] = UIWidgets.create_summary_entry("summary_entry_root", scenegraph_definition.summary_entry_root.size, i)
end

local summary_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		-2
	}
}
local objective_title_text_style = {
	font_size = 32,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local experience_title_text_style = {
	font_size = 32,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		0,
		2
	}
}
local total_title_text_style = {
	font_size = 32,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local experience_total_text_style = {
	font_size = 32,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_up_text_style = {
	font_size = 40,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		2,
		10
	}
}
local essence_text_style = {
	font_size = 32,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local essence_amount_style = {
	font_size = 32,
	upper_case = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local essence_max_amount_style = {
	font_size = 32,
	upper_case = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = {
		255,
		160,
		160,
		160
	},
	offset = {
		0,
		0,
		2
	}
}
local widgets = {
	objective_title = UIWidgets.create_simple_text(Localize("summary_screen_objective_title"), "summary_entry_title", nil, nil, objective_title_text_style),
	experience_title = UIWidgets.create_simple_text(Localize("summary_screen_experience_title"), "summary_entry_title", nil, nil, experience_title_text_style),
	total_title = UIWidgets.create_simple_text(Localize("summary_screen_total_title"), "summary_entry_total_title", nil, nil, total_title_text_style),
	experience_total_text = UIWidgets.create_simple_text("", "summary_entry_total_title", nil, nil, experience_total_text_style),
	next_level_text = UIWidgets.create_simple_text("0", "next_level_text", nil, nil, level_text_style),
	current_level_text = UIWidgets.create_simple_text("0", "current_level_text", nil, nil, level_text_style),
	summary_title = UIWidgets.create_simple_text(Localize("end_screen_mission_summary"), "summary_title", nil, nil, summary_title_style),
	level_up_text = UIWidgets.create_simple_text(Localize("summary_screen_level_up"), "experience_bar", nil, nil, level_up_text_style),
	background = UIWidgets.create_simple_texture("summary_screen", "background"),
	experience_fg = UIWidgets.create_simple_texture("summary_screen_fg", "experience_fg"),
	experience_bar = UIWidgets.create_summary_experience_bar("experience_bar", scenegraph_definition.experience_bar.size),
	sparkle_effect = UIWidgets.create_simple_rotated_texture("sparkle_effect", 0, {
		128,
		128
	}, "sparkle_effect", nil, nil, {
		0,
		255,
		255,
		255
	}),
	essence_background = UIWidgets.create_tiled_texture("summary_entry_essence_background", "menu_frame_bg_06", {
		256,
		256
	}, nil, nil, {
		255,
		100,
		100,
		100
	}),
	essence_background_shadow = UIWidgets.create_simple_texture("options_window_fade_01", "summary_entry_essence_background", nil, nil, nil, 2),
	essence_background_effect_left = UIWidgets.create_simple_uv_texture("scorpion_icon_lit", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "summary_entry_essence_background_effect_left", nil, nil, {
		255,
		100,
		100,
		100
	}),
	essence_background_effect_right = UIWidgets.create_simple_texture("scorpion_icon_lit", "summary_entry_essence_background_effect_right", nil, nil, {
		150,
		255,
		255,
		255
	}),
	essence_background_frame = UIWidgets.create_frame("summary_entry_essence_background", scenegraph_definition.summary_entry_essence_background.size, "button_frame_01", 3),
	total_essence_title = UIWidgets.create_simple_text(Localize("summary_total_essence_title"), "summary_entry_total_essence_title", nil, nil, essence_text_style),
	essence_total_text = UIWidgets.create_simple_text("", "summary_entry_total_essence_gained", nil, nil, essence_amount_style),
	essence_total_text_max = UIWidgets.create_simple_text(Localize("weave_endscreen_max_essence"), "summary_entry_total_essence_gained", nil, nil, essence_max_amount_style),
	icon_essence = UIWidgets.create_simple_texture("icon_crafting_essence_small", "summary_entry_essence_icon")
}
local num_experience_entries = 10

for i = 1, num_experience_entries, 1 do
	widgets["experience_entry_" .. i] = UIWidgets.create_experience_entry("experience_entry_root", scenegraph_definition.experience_entry_root.size)
end

local animation_definitions = {
	transition_enter = {
		{
			name = "fade_in",
			start_progress = 2,
			end_progress = 2.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				ui_scenegraph.background.local_position[2] = 400 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	transition_exit = {
		{
			name = "fade_out",
			start_progress = 1,
			end_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.background.local_position[2] = -400 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	summary_entry_initial = {
		{
			name = "move",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local content = widget.content
				local style = widget.style
				local offset = widget.offset
				local scenegraph_id = widget.scenegraph_id
				local default_size = scenegraph_definition[scenegraph_id].size
				local list_index = params.list_index
				local spacing = params.spacing
				local start_position = (default_size[2] + spacing) * (list_index - 1)
				local position_increase = default_size[2] + spacing
				offset[2] = -start_position
				offset[2] = -start_position
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local stamp_default_position = scenegraph_definition.entry_window.position
				local stamp_default_size = scenegraph_definition.entry_window.size
				local stamp_position = ui_scenegraph.entry_window.local_position
				local widget = params.widget
				local content = widget.content
				local style = widget.style
				local offset = widget.offset
				local anim_progress = math.easeInCubic(1 - progress)
				offset[1] = -30 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "description_entry",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local content = widget.content
				local style = widget.style
				local summary_text_style = style.summary_text
				local summary_text_shadow_style = style.summary_text_shadow
				summary_text_style.text_color[1] = 0
				summary_text_shadow_style.text_color[1] = 0
				content.summary_text = params.title_text or "n/a"
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local style = widget.style
				local summary_text_style = style.summary_text
				local summary_text_shadow_style = style.summary_text_shadow
				local background_style = style.background
				local alpha = math.easeOutCubic(progress) * 255
				summary_text_style.text_color[1] = alpha
				summary_text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "xp_entry",
			start_progress = 0.5,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = params.widget
				local content = widget.content
				local style = widget.style
				local xp_text_style = style.xp_text
				local xp_text_shadow_style = style.xp_text_shadow
				xp_text_style.text_color[1] = 0
				xp_text_shadow_style.text_color[1] = 0
				content.xp_text = ""
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local style = widget.style
				local content = widget.content
				local experience = params.experience
				local value = params.value
				local counter = math.floor((experience or value) * progress)

				if not content.xp_count or content.xp_count ~= counter then
					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_entry_count")
				end

				content.xp_count = counter
				content.xp_text = tostring(counter)
				local xp_text_style = style.xp_text
				local xp_text_shadow_style = style.xp_text_shadow
				local alpha = math.easeOutCubic(progress) * 255
				xp_text_style.text_color[1] = alpha
				xp_text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	total_experience_increase = {
		{
			name = "bump",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.experience_total_text
				local content = widget.content
				local style = widget.style
				local experience = params.experience

				if experience then
					local current_experience_count = content.experience or 0
					local new_experience = current_experience_count + experience
					content.text = tostring(new_experience)
					content.experience = new_experience
					content.animate = true

					WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_entry_total_sum")
				else
					content.animate = false
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.experience_total_text
				local style = widget.style
				local content = widget.content

				if content.animate then
					local text_style = style.text
					local text_shadow_style = style.text_shadow
					local start_font_size = 32
					local target_font_size = 40
					local anim_progress = math.ease_pulse(progress)
					local new_font_size = start_font_size + (target_font_size - start_font_size) * anim_progress
					text_style.font_size = new_font_size
					text_shadow_style.font_size = new_font_size
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	level_up = {
		{
			name = "in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_level_up")
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.level_up_text
				local style = widget.style
				local content = widget.content
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(1 - progress)
				offset[1] = -(30 + 220 * anim_progress)
				local alpha = 255 - anim_progress * 255
				style.text.text_color[1] = alpha
				style.text_shadow.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "move",
			start_progress = 0.3,
			end_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.level_up_text
				local style = widget.style
				local content = widget.content
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(progress)
				offset[1] = -30 + 30 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "out",
			start_progress = 1.3,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.level_up_text
				local style = widget.style
				local content = widget.content
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(progress)
				offset[1] = 250 * anim_progress
				local alpha = 255 - anim_progress * 255
				style.text.text_color[1] = alpha
				style.text_shadow.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "spark",
			start_progress = 1.2,
			end_progress = 1.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.sparkle_effect
				local style = widget.style
				local content = widget.content
				local offset = widget.offset
				local anim_progress = math.easeOutCubic(progress)
				local degrees = 180 * anim_progress
				local texture_style = style.texture_id
				texture_style.angle = math.degrees_to_radians(degrees)
				texture_style.color[1] = 255 * math.ease_pulse(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "bump_next_level",
			start_progress = 1.3,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.next_level_text
				local style = widget.style
				local content = widget.content
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local start_font_size = 42
				local target_font_size = 60
				local anim_progress = math.easeOutCubic(progress)
				local anim_progress = math.ease_pulse(anim_progress)
				local new_font_size = start_font_size + (target_font_size - start_font_size) * anim_progress
				text_style.font_size = new_font_size
				text_shadow_style.font_size = new_font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "bump_current_level",
			start_progress = 1.3,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = widgets.current_level_text
				local style = widget.style
				local content = widget.content
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				local start_font_size = 42
				local target_font_size = 60
				local anim_progress = math.easeOutCubic(progress)
				local anim_progress = math.ease_pulse(anim_progress)
				local new_font_size = start_font_size + (target_font_size - start_font_size) * anim_progress
				text_style.font_size = new_font_size
				text_shadow_style.font_size = new_font_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	summary_entry_text_shadow = {
		{
			name = "description",
			start_progress = 1.2,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local style = widget.style
				local summary_text_shadow_style = style.summary_text_shadow
				local alpha = math.easeOutCubic(1 - progress) * 255
				summary_text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "xp",
			start_progress = 1.2,
			end_progress = 1.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget = params.widget
				local style = widget.style
				local xp_text_shadow_style = style.xp_text_shadow
				local alpha = math.easeOutCubic(1 - progress) * 255
				xp_text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	summary_entry_widgets = summary_entry_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
