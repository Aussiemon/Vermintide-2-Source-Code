local panel_height = UISettings.hero_panel_height
local hero_entry_width = 108
local hero_entry_height = 108
local hero_entry_spacing = 20
local career_entry_width = 86
local career_entry_height = 108
local career_entry_spacing = 20
local video_window_width = 320
local video_window_height = 180
local window_width = 360
local window_height = 900
local career_window_width = 500
local career_window_height = 600
local career_width = 300
local career_height = 200
local hero_width = career_width
local hero_height = 101
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
			UILayer.default
		}
	},
	right_side_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	left_side_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_selection_frame_root = {
		vertical_alignment = "top",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			350,
			70
		},
		position = {
			100,
			-50,
			1
		}
	},
	initial_header = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			50
		},
		position = {
			0,
			-40,
			100
		}
	},
	selection_divider = {
		vertical_alignment = "center",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			264,
			32
		},
		position = {
			220,
			0,
			1
		}
	},
	hero_title = {
		vertical_alignment = "top",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			window_width,
			50
		},
		position = {
			0,
			-30,
			1
		}
	},
	selection_description = {
		vertical_alignment = "bottom",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			400,
			100
		},
		position = {
			0,
			300,
			1
		}
	},
	hero_tabs = {
		vertical_alignment = "center",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			40,
			1
		}
	},
	career_title = {
		vertical_alignment = "top",
		parent = "career_tabs",
		horizontal_alignment = "center",
		size = {
			career_window_width,
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	career_tabs = {
		vertical_alignment = "bottom",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-(career_entry_height + 25),
			1
		}
	},
	locked_info_text = {
		vertical_alignment = "top",
		parent = "career_tabs",
		horizontal_alignment = "center",
		size = {
			386,
			150
		},
		position = {
			0,
			-15,
			1
		}
	},
	selection_info = {
		vertical_alignment = "top",
		parent = "career_tabs",
		horizontal_alignment = "center",
		size = {
			520,
			134
		},
		position = {
			0,
			-58,
			1
		}
	},
	selection_info_top = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			10,
			1
		}
	},
	selection_info_bottom = {
		vertical_alignment = "bottom",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			16,
			1
		}
	},
	info_career_name = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			-16,
			1
		}
	},
	info_hero_name = {
		vertical_alignment = "top",
		parent = "info_career_name",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			-35,
			1
		}
	},
	info_hero_level = {
		vertical_alignment = "top",
		parent = "info_hero_name",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			-30,
			1
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			window_width,
			window_height
		},
		position = {
			-50,
			30,
			1
		}
	},
	info_window_top = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			14,
			5
		}
	},
	info_window_bottom = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			0,
			5
		}
	},
	info_window_video = {
		vertical_alignment = "top",
		parent = "info_window_top",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			video_window_height
		},
		position = {
			0,
			-50,
			1
		}
	},
	info_window_title = {
		vertical_alignment = "top",
		parent = "info_window_top",
		horizontal_alignment = "center",
		size = {
			477,
			50
		},
		position = {
			0,
			80,
			1
		}
	},
	info_window_passive = {
		vertical_alignment = "bottom",
		parent = "info_window_video",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			250
		},
		position = {
			0,
			-270,
			1
		}
	},
	info_window_passive_title = {
		vertical_alignment = "top",
		parent = "info_window_passive",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	info_passive_icon = {
		vertical_alignment = "top",
		parent = "info_window_passive",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			10,
			-40,
			2
		}
	},
	info_passive_title = {
		vertical_alignment = "top",
		parent = "info_passive_icon",
		horizontal_alignment = "left",
		size = {
			video_window_width - 90,
			80
		},
		position = {
			90,
			0,
			1
		}
	},
	info_passive_description = {
		vertical_alignment = "bottom",
		parent = "info_window_passive",
		horizontal_alignment = "left",
		size = {
			video_window_width - 20,
			100
		},
		position = {
			10,
			15,
			2
		}
	},
	info_window_ability = {
		vertical_alignment = "bottom",
		parent = "info_window_passive",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			250
		},
		position = {
			0,
			-270,
			1
		}
	},
	info_window_ability_title = {
		vertical_alignment = "top",
		parent = "info_window_ability",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	info_ability_icon = {
		vertical_alignment = "top",
		parent = "info_window_ability",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			10,
			-40,
			2
		}
	},
	info_ability_title = {
		vertical_alignment = "top",
		parent = "info_ability_icon",
		horizontal_alignment = "left",
		size = {
			video_window_width - 90,
			80
		},
		position = {
			90,
			0,
			1
		}
	},
	info_ability_description = {
		vertical_alignment = "bottom",
		parent = "info_window_ability",
		horizontal_alignment = "left",
		size = {
			video_window_width - 20,
			100
		},
		position = {
			10,
			15,
			2
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			0,
			25,
			3
		}
	},
	hero_name_title = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			600,
			50
		},
		position = {
			0,
			140,
			1
		}
	},
	hero_banner_level = {
		vertical_alignment = "top",
		parent = "hero_name_title",
		horizontal_alignment = "center",
		size = {
			115.19999999999999,
			144
		},
		position = {
			0,
			-45,
			1
		}
	},
	hero_level = {
		vertical_alignment = "bottom",
		parent = "hero_name_title",
		horizontal_alignment = "center",
		size = {
			600,
			40
		},
		position = {
			0,
			-40,
			1
		}
	},
	portrait_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-80,
			1
		}
	}
}
local hero_career_style = {
	font_size = 36,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_style = {
	word_wrap = true,
	font_size = 24,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_style = {
	word_wrap = true,
	font_size = 20,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local locked_info_text_style = {
	word_wrap = true,
	font_size = 26,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}
local skill_title_style = {
	word_wrap = true,
	font_size = 28,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local skill_info_title_style = {
	word_wrap = true,
	use_shadow = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local skill_description_style = {
	word_wrap = true,
	font_size = 16,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local selection_description_style = {
	word_wrap = true,
	upper_case = true,
	localize = true,
	use_shadow = true,
	font_size = 58,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_icons = {}

for index, profile_index in ipairs(ProfilePriority) do
	hero_icons[#hero_icons + 1] = "unit_frame_portrait_default"
end

local career_images = {
	"icons_placeholder",
	"icons_placeholder",
	"icons_placeholder"
}
local disable_with_gamepad = true
local widgets = {
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	hero_tabs = UIWidgets.create_icon_selector("hero_tabs", {
		hero_entry_width,
		hero_entry_height
	}, hero_icons, hero_entry_spacing),
	career_tabs = UIWidgets.create_icon_selector("career_tabs", {
		career_entry_width,
		career_entry_height
	}, career_images, career_entry_spacing, true),
	info_window_video = UIWidgets.create_frame("info_window_video", scenegraph_definition.info_window_video.size, "menu_frame_06"),
	locked_info_text = UIWidgets.create_simple_text("Unlocked at level:", "locked_info_text", nil, nil, locked_info_text_style),
	info_passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "info_passive_icon"),
	info_passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "info_passive_icon", nil, nil, nil, 1),
	info_ability_icon = UIWidgets.create_simple_texture("icons_placeholder", "info_ability_icon"),
	info_ability_icon_frame = UIWidgets.create_simple_texture("talent_frame", "info_ability_icon", nil, nil, nil, 1),
	info_passive_title = UIWidgets.create_simple_text("n/a", "info_passive_title", nil, nil, skill_title_style),
	info_ability_title = UIWidgets.create_simple_text("n/a", "info_ability_title", nil, nil, skill_title_style),
	info_passive_description = UIWidgets.create_simple_text("n/a", "info_passive_description", nil, nil, skill_description_style),
	info_ability_description = UIWidgets.create_simple_text("n/a", "info_ability_description", nil, nil, skill_description_style),
	info_window_passive_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "info_window_passive_title", nil, nil, skill_info_title_style),
	info_window_ability_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "info_window_ability_title", nil, nil, skill_info_title_style),
	selection_divider = UIWidgets.create_simple_texture("divider_01_top", "selection_divider"),
	selection_description = UIWidgets.create_simple_text("profile_choose", "selection_description", nil, nil, selection_description_style),
	info_window = UIWidgets.create_simple_texture("info_window_background", "info_window"),
	selection_info = UIWidgets.create_simple_texture("tab_menu_bg_03", "selection_info"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style)
}
local generic_input_actions = {
	default = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		}
	},
	default_back = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_back"
		}
	},
	available = {
		actions = {
			{
				input_action = "refresh",
				priority = 1,
				description_text = "input_description_confirm"
			}
		}
	}
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
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * (1 - anim_progress)
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
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	character_selection_widgets = widgets,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
