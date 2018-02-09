local window_default_settings = UISettings.game_start_windows
local small_window_background = window_default_settings.background
local small_window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1]*3 + small_window_spacing*2 + large_window_frame_width*2,
	small_window_size[2] + 80
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2]
}
local scenegraph_definition = {
	root = {
		is_root = true,
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
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
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
	header = {
		vertical_alignment = "top",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			1920,
			50
		},
		position = {
			0,
			-20,
			100
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	window_background = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5
		},
		position = {
			0,
			0,
			0
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1
		}
	},
	inner_window_header = {
		vertical_alignment = "top",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			inner_window_size[1],
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	exit_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			380,
			42
		},
		position = {
			0,
			-16,
			10
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			658,
			60
		},
		position = {
			0,
			34,
			10
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	}
}
local windows = {
	options = {
		class_name = "HeroWindowOptions",
		name = "options"
	},
	character_preview = {
		class_name = "HeroWindowCharacterPreview",
		name = "character_preview"
	},
	inventory = {
		class_name = "HeroWindowInventory",
		name = "inventory"
	},
	loadout_inventory = {
		class_name = "HeroWindowLoadoutInventory",
		name = "loadout_inventory"
	},
	loadout = {
		alignment_index = 2,
		name = "loadout",
		class_name = "HeroWindowLoadout"
	},
	talents = {
		class_name = "HeroWindowTalents",
		name = "talents"
	},
	crafting = {
		class_name = "HeroWindowCrafting",
		name = "crafting"
	},
	prestige = {
		class_name = "HeroWindowPrestige",
		name = "prestige"
	},
	cosmetics_loadout = {
		alignment_index = 2,
		name = "cosmetics_loadout",
		class_name = "HeroWindowCosmeticsLoadout"
	},
	cosmetics_inventory = {
		class_name = "HeroWindowCosmeticsInventory",
		name = "cosmetics_inventory"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "equipment",
		sound_event_exit = "play_gui_equipment_close",
		close_on_exit = true,
		windows = {
			options = 1,
			loadout = 4,
			character_preview = 2,
			loadout_inventory = 3
		}
	},
	{
		sound_event_enter = "play_gui_talents_button",
		name = "talents",
		sound_event_exit = "play_gui_talents_close",
		close_on_exit = true,
		windows = {
			options = 1,
			talents = 2
		}
	},
	{
		sound_event_enter = "play_gui_craft_button",
		name = "forge",
		sound_event_exit = "play_gui_craft_close",
		close_on_exit = true,
		windows = {
			options = 1,
			inventory = 3,
			crafting = 2
		}
	},
	{
		sound_event_enter = "play_gui_cosmetics_button",
		name = "cosmetics",
		sound_event_exit = "play_gui_cosmetics_close",
		close_on_exit = true,
		windows = {
			options = 1,
			cosmetics_inventory = 3,
			character_preview = 2,
			cosmetics_loadout = 4
		}
	},
	{
		close_on_exit = true,
		name = "prestige",
		windows = {
			options = 1,
			prestige = 2
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
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
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11"),
	window_background_mask = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080
	}, nil, true),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080
	}, nil, nil, {
		255,
		100,
		100,
		100
	}),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34),
	back_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_back"), 24, nil, "button_detail_03", 34),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("hero_view_title"), "title_text", nil, nil, title_text_style)
}
local animation_definitions = {
	on_enter = {
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
				params.render_settings.alpha_multiplier = 1

				return 
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

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	windows = windows,
	widgets = widgets,
	window_layouts = window_layouts,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
