local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_width_offset = window_size[1] + window_spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	window_size[1] * 3 + window_spacing * 2 + large_window_frame_width * 2,
	window_size[2] + large_window_frame_width * 2
}
local filter_frame_size = {
	400,
	inner_window_size[2]
}
local info_frame_size = {
	400,
	inner_window_size[2]
}
local lobby_list_size = {
	inner_window_size[1] - filter_frame_size[1] - info_frame_size[1],
	inner_window_size[2] - 50
}
local lobby_info_box_size_lobbies = {
	300,
	120
}
local lobby_info_box_size_lobbies_weaves = {
	lobby_info_box_size_lobbies[1],
	85
}
local lobby_info_box_size_servers = {
	lobby_info_box_size_lobbies[1],
	163
}
local lobby_info_buttons_size = {
	250,
	30
}
local lobby_info_server_buttons_frame_size = {
	lobby_info_buttons_size[1],
	lobby_info_buttons_size[2] * 1 + 5
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
	root_fit = {
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
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			window_width_offset,
			0,
			1
		}
	},
	filter_frame = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = filter_frame_size,
		position = {
			0,
			0,
			1
		}
	},
	filter_frame_edge = {
		vertical_alignment = "bottom",
		parent = "filter_frame",
		horizontal_alignment = "right",
		size = {
			0,
			inner_window_size[2] - 5
		},
		position = {
			0,
			0,
			50
		}
	},
	search_button = {
		vertical_alignment = "bottom",
		parent = "filter_frame",
		horizontal_alignment = "center",
		size = {
			400,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	reset_button = {
		vertical_alignment = "bottom",
		parent = "filter_frame",
		horizontal_alignment = "center",
		size = {
			400,
			80
		},
		position = {
			0,
			80,
			1
		}
	},
	lobby_list_frame = {
		vertical_alignment = "bottom",
		parent = "filter_frame",
		horizontal_alignment = "right",
		size = lobby_list_size,
		position = {
			lobby_list_size[1],
			0,
			1
		}
	},
	lobby_list_tabs = {
		vertical_alignment = "top",
		parent = "filter_frame",
		horizontal_alignment = "right",
		size = {
			lobby_list_size[1],
			40
		},
		position = {
			lobby_list_size[1],
			-5,
			1
		}
	},
	lobby_list_tabs_divider = {
		vertical_alignment = "top",
		parent = "lobby_list_frame",
		horizontal_alignment = "center",
		size = {
			lobby_list_size[1] - 4,
			0
		},
		position = {
			2,
			0,
			51
		}
	},
	title_text_detail = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			21 - large_window_frame_width,
			30
		}
	},
	title_text_detail_glow = {
		vertical_alignment = "top",
		parent = "title_text_detail",
		horizontal_alignment = "center",
		size = {
			544,
			16
		},
		position = {
			0,
			5,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title_text_detail",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			50
		},
		position = {
			0,
			25,
			1
		}
	},
	lobby_info_frame = {
		vertical_alignment = "bottom",
		parent = "lobby_list_frame",
		horizontal_alignment = "right",
		size = info_frame_size,
		position = {
			info_frame_size[1],
			0,
			1
		}
	},
	lobby_info_divider = {
		vertical_alignment = "bottom",
		parent = "lobby_info_frame",
		horizontal_alignment = "left",
		size = {
			0,
			inner_window_size[2] - 5
		},
		position = {
			0,
			0,
			50
		}
	},
	lobby_info_host = {
		vertical_alignment = "top",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1],
			32
		},
		position = {
			0,
			0,
			1
		}
	},
	lobby_info_level_image_frame = {
		vertical_alignment = "top",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = {
			180,
			180
		},
		position = {
			0,
			-40,
			2
		}
	},
	lobby_info_level_image = {
		vertical_alignment = "center",
		parent = "lobby_info_level_image_frame",
		horizontal_alignment = "center",
		size = {
			168,
			168
		},
		position = {
			0,
			0,
			-1
		}
	},
	lobby_info_level_text = {
		vertical_alignment = "bottom",
		parent = "lobby_info_level_image_frame",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1] - 40,
			32
		},
		position = {
			0,
			-50,
			0
		}
	},
	wind_icon_bg = {
		vertical_alignment = "bottom",
		parent = "lobby_info_level_image_frame",
		horizontal_alignment = "center",
		size = {
			62.05,
			62.05
		},
		position = {
			0,
			-20,
			2
		}
	},
	wind_icon_slot = {
		vertical_alignment = "center",
		parent = "wind_icon_bg",
		horizontal_alignment = "center",
		size = {
			54.4,
			54.4
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon_glow = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			43.35,
			45.05
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			54.4,
			54.4
		},
		position = {
			0,
			0,
			2
		}
	},
	lobby_info_weave_level_text = {
		vertical_alignment = "top",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1] - 20,
			32
		},
		position = {
			0,
			-20,
			0
		}
	},
	lobby_info_wind_text = {
		vertical_alignment = "bottom",
		parent = "lobby_info_level_text",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1],
			32
		},
		position = {
			0,
			-40,
			0
		}
	},
	lobby_info_hero_tabs = {
		vertical_alignment = "bottom",
		parent = "lobby_info_level_text",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-120,
			1
		}
	},
	lobby_info_box_info_frame_lobbies = {
		vertical_alignment = "center",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = lobby_info_box_size_lobbies,
		position = {
			0,
			-60,
			1
		}
	},
	lobby_info_box_host_lobbies = {
		vertical_alignment = "top",
		parent = "lobby_info_box_info_frame_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-10,
			1
		}
	},
	lobby_info_box_game_type_lobbies = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_host_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_level_name_lobbies = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_game_type_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_difficulty_lobbies = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_level_name_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_players_lobbies = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_difficulty_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_status_lobbies = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_players_lobbies",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_info_frame_lobbies_weaves = {
		vertical_alignment = "center",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = lobby_info_box_size_lobbies_weaves,
		position = {
			0,
			-30,
			1
		}
	},
	lobby_info_box_host_lobbies_weaves = {
		vertical_alignment = "top",
		parent = "lobby_info_box_info_frame_lobbies_weaves",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies_weaves[1] - 20,
			16
		},
		position = {
			0,
			-10,
			1
		}
	},
	lobby_info_box_game_type_lobbies_weaves = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_host_lobbies_weaves",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies_weaves[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_level_name_lobbies_weaves = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_game_type_lobbies_weaves",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies_weaves[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_players_lobbies_weaves = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_game_type_lobbies_weaves",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies_weaves[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_status_lobbies_weaves = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_players_lobbies_weaves",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_lobbies_weaves[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_twitch_logo = {
		vertical_alignment = "center",
		parent = "lobby_info_box_status_servers",
		horizontal_alignment = "center",
		size = {
			130,
			29
		},
		position = {
			0,
			0,
			1
		}
	},
	lobby_info_box_info_frame_servers = {
		vertical_alignment = "center",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = lobby_info_box_size_servers,
		position = {
			0,
			-100,
			1
		}
	},
	lobby_info_box_name_servers = {
		vertical_alignment = "top",
		parent = "lobby_info_box_info_frame_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-10,
			1
		}
	},
	lobby_info_box_ip_adress_servers = {
		vertical_alignment = "top",
		parent = "lobby_info_box_name_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_password_protected_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_ip_adress_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_ping_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_password_protected_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_favorite_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_ping_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_level_name_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_favorite_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_difficulty_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_level_name_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_players_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_difficulty_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_box_status_servers = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_players_servers",
		horizontal_alignment = "center",
		size = {
			lobby_info_box_size_servers[1] - 20,
			16
		},
		position = {
			0,
			-16,
			1
		}
	},
	lobby_info_dedicated_server_buttons_frame = {
		vertical_alignment = "bottom",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = lobby_info_server_buttons_frame_size,
		position = {
			0,
			140,
			1
		}
	},
	lobby_info_add_to_favorites_button = {
		vertical_alignment = "top",
		parent = "lobby_info_dedicated_server_buttons_frame",
		horizontal_alignment = "center",
		size = lobby_info_buttons_size,
		position = {
			0,
			-5,
			-1
		}
	},
	lobby_info_refresh_button = {
		vertical_alignment = "bottom",
		parent = "lobby_info_add_to_favorites_button",
		horizontal_alignment = "center",
		size = lobby_info_buttons_size,
		position = {
			0,
			-lobby_info_buttons_size[2],
			0
		}
	},
	mutator_window = {
		vertical_alignment = "bottom",
		parent = "lobby_info_box_info_frame_lobbies",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1],
			0
		},
		position = {
			0,
			35,
			1
		}
	},
	mutator_icon = {
		vertical_alignment = "top",
		parent = "mutator_window",
		horizontal_alignment = "left",
		size = {
			60,
			60
		},
		position = {
			10,
			-50,
			5
		}
	},
	mutator_icon_frame = {
		vertical_alignment = "center",
		parent = "mutator_icon",
		horizontal_alignment = "center",
		size = {
			60,
			60
		},
		position = {
			0,
			0,
			1
		}
	},
	mutator_title_text = {
		vertical_alignment = "top",
		parent = "mutator_window",
		horizontal_alignment = "left",
		size = {
			info_frame_size[1] * 0.6,
			50
		},
		position = {
			10,
			-5,
			1
		}
	},
	mutator_title_divider = {
		vertical_alignment = "bottom",
		parent = "mutator_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	mutator_description_text = {
		vertical_alignment = "top",
		parent = "mutator_icon",
		horizontal_alignment = "left",
		size = {
			info_frame_size[1] - 110,
			60
		},
		position = {
			90,
			0,
			1
		}
	},
	objective_title = {
		vertical_alignment = "bottom",
		parent = "mutator_icon",
		horizontal_alignment = "left",
		size = {
			info_frame_size[1],
			40
		},
		position = {
			0,
			-60,
			3
		}
	},
	objective_title_bg = {
		vertical_alignment = "center",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			467,
			59
		},
		position = {
			0,
			0,
			-1
		}
	},
	objective_1 = {
		vertical_alignment = "bottom",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1],
			30
		},
		position = {
			0,
			-35,
			3
		}
	},
	objective_2 = {
		vertical_alignment = "bottom",
		parent = "objective_1",
		horizontal_alignment = "center",
		size = {
			info_frame_size[1],
			30
		},
		position = {
			0,
			-35,
			0
		}
	},
	name_input_box = {
		vertical_alignment = "top",
		parent = "filter_frame",
		horizontal_alignment = "center",
		position = {
			0,
			-130,
			1
		},
		size = {
			340,
			40
		}
	},
	name_input_box_banner = {
		parent = "name_input_box",
		position = {
			0,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	search_type_stepper = {
		vertical_alignment = "top",
		parent = "name_input_box",
		horizontal_alignment = "center",
		position = {
			0,
			-85,
			0
		},
		size = {
			240,
			40
		}
	},
	search_type_banner = {
		parent = "search_type_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	join_button = {
		vertical_alignment = "bottom",
		parent = "lobby_info_frame",
		horizontal_alignment = "center",
		size = {
			400,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	invalid_checkbox = {
		parent = "filter_frame",
		horizontal_alignment = "left",
		position = {
			10,
			200,
			1
		},
		size = {
			300,
			34
		}
	},
	game_mode_stepper = {
		vertical_alignment = "top",
		parent = "filter_frame",
		horizontal_alignment = "center",
		position = {
			0,
			-130,
			1
		},
		size = {
			240,
			40
		}
	},
	game_mode_banner = {
		parent = "game_mode_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	level_stepper = {
		vertical_alignment = "top",
		parent = "game_mode_stepper",
		horizontal_alignment = "center",
		position = {
			0,
			-85,
			1
		},
		size = {
			240,
			40
		}
	},
	level_banner = {
		parent = "level_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	difficulty_stepper = {
		vertical_alignment = "top",
		parent = "level_stepper",
		horizontal_alignment = "center",
		position = {
			0,
			-85,
			0
		},
		size = {
			240,
			40
		}
	},
	difficulty_banner = {
		parent = "difficulty_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	show_lobbies_stepper = {
		vertical_alignment = "top",
		parent = "difficulty_stepper",
		horizontal_alignment = "center",
		position = {
			0,
			-85,
			0
		},
		size = {
			240,
			40
		}
	},
	show_lobbies_banner = {
		parent = "show_lobbies_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	distance_stepper = {
		vertical_alignment = "top",
		parent = "show_lobbies_stepper",
		horizontal_alignment = "center",
		position = {
			0,
			-85,
			0
		},
		size = {
			240,
			40
		}
	},
	distance_banner = {
		parent = "distance_stepper",
		position = {
			-45,
			30,
			1
		},
		size = {
			340,
			56
		}
	},
	filter_divider = {
		vertical_alignment = "bottom",
		parent = "search_button",
		horizontal_alignment = "center",
		position = {
			0,
			93,
			2
		},
		size = {
			301,
			18
		}
	},
	lobby_type_button = {
		vertical_alignment = "top",
		parent = "filter_frame",
		horizontal_alignment = "center",
		position = {
			0,
			-5,
			0
		},
		size = {
			400,
			50
		}
	}
}

local function sort_level_list(a, b)
	local level_settings = LevelSettings
	local a_map_settings = level_settings[a].map_settings
	local b_map_settings = level_settings[b].map_settings
	local a_sorting_index = a_map_settings and (a_map_settings.sorting or 0) or 0
	local b_sorting_index = b_map_settings and (b_map_settings.sorting or 0) or 0

	return a_sorting_index < b_sorting_index
end

local function setup_game_mode_data(statistics_db, player_stats_id)
	local game_mode_data = {}
	local game_mode_index = {}
	local only_release = GameSettingsDevelopment.release_levels_only

	for name, level_data in pairs(LevelSettings) do
		if type(level_data) == "table" and (not only_release or not DebugLevels[name]) then
			local game_mode = level_data.game_mode or level_data.mechanism

			if game_mode and game_mode ~= "tutorial" and game_mode ~= "demo" then
				local unlockable = level_data.unlockable and not level_data.default

				if unlockable and LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, name) then
					if not game_mode_index[game_mode] then
						local game_mode_settings = GameModeSettings[game_mode]
						local game_mode_difficulties = game_mode_settings.difficulties
						local game_mode_display_name = game_mode_settings.display_name
						local difficulties = table.clone(game_mode_difficulties)
						difficulties[#difficulties + 1] = "any"
						game_mode_data[#game_mode_data + 1] = {
							levels = {},
							difficulties = difficulties,
							game_mode_key = game_mode,
							game_mode_display_name = game_mode_display_name
						}
						game_mode_index[game_mode] = #game_mode_data
					end

					if (not level_data.supported_game_modes or level_data.supported_game_modes[game_mode]) and not level_data.ommit_from_lobby_browser then
						local data = game_mode_data[game_mode_index[game_mode]]
						local levels = data.levels
						levels[#levels + 1] = name
					end
				end
			end
		end
	end

	for i = 1, #game_mode_data do
		local data = game_mode_data[i]
		local levels = data.levels

		table.sort(levels, sort_level_list)

		levels[#levels + 1] = "any"
	end

	local function game_mode_sort_func(game_mode_data_a, game_mode_data_b)
		local game_mode_a_name = Localize(game_mode_data_a.game_mode_display_name)
		local game_mode_b_name = Localize(game_mode_data_b.game_mode_display_name)

		return game_mode_a_name < game_mode_b_name
	end

	table.sort(game_mode_data, game_mode_sort_func)

	local game_modes = {}

	for i = 1, #game_mode_data do
		local game_mode_key = game_mode_data[i].game_mode_key
		local game_mode_index = #game_modes + 1
		game_modes[game_mode_index] = game_mode_key
		game_modes[game_mode_key] = game_mode_index
	end

	local game_mode = "weave"
	local game_mode_settings = GameModeSettings[game_mode]
	local game_mode_difficulties = game_mode_settings.difficulties
	local game_mode_display_name = game_mode_settings.display_name
	local index = #game_mode_data + 1
	local difficulties = table.clone(game_mode_difficulties)
	difficulties[#difficulties + 1] = "any"
	game_mode_data[index] = {
		difficulties = difficulties,
		game_mode_key = game_mode,
		game_mode_display_name = game_mode_display_name
	}
	game_modes[game_mode] = #game_modes + 1
	game_modes[#game_modes + 1] = game_mode
	local game_mode = "any"
	game_modes[game_mode] = #game_modes + 1
	game_modes[#game_modes + 1] = game_mode
	game_mode_data.game_modes = game_modes

	return game_mode_data
end

local show_lobbies_array = {
	"lb_show_joinable",
	"lb_show_all"
}
local distance_array = IS_PS4 and {
	"map_zone_options_2",
	"map_zone_options_3",
	"map_zone_options_5"
} or {
	"map_zone_options_2",
	"map_zone_options_4",
	"map_zone_options_5"
}
local search_type_array = {
	"internet",
	"lan",
	"friends",
	"favorites",
	"history"
}
local search_type_text_array = {
	"lb_search_type_internet",
	"lb_search_type_lan",
	"lb_search_type_friends",
	"lb_search_type_favorites",
	"lb_search_type_history"
}

local function create_game_type_text_config()
	return {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		localize = false,
		font_size = 28,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
	}
end

local function create_banner_text_config()
	return {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		localize = true,
		font_size = 28,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
	}
end

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					6
				},
				size = {
					size[1],
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 9,
					-6,
					10
				},
				size = {
					9,
					17
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_window_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
	local button_color_name = nil

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local button_background_texture = "button_bg_01"
	local button_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_background_texture)
	local widget = {
		element = {
			passes = {
				{
					style_id = "button_background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "button_background",
					pass_type = "texture_uv",
					content_id = "button_background"
				},
				{
					texture_id = "bottom_edge",
					style_id = "button_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_disabled",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_shadow",
					pass_type = "text",
					text_id = "button_text"
				},
				{
					style_id = "button_clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				}
			}
		},
		content = {
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
			glass_top = "button_glass_01",
			bottom_edge = "menu_frame_09_divider",
			use_bottom_edge = use_bottom_edge,
			button_hotspot = {},
			button_text = button_text or "n/a",
			hover_glow = optional_color_name and "button_state_hover_" .. optional_color_name or "button_state_hover",
			glow = optional_color_name and "button_state_normal_" .. optional_color_name or "button_state_normal",
			button_background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / button_background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / button_background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = button_background_texture
			}
		},
		style = {
			button_background = {
				color = background_color,
				offset = {
					0,
					0,
					2
				},
				size = size
			},
			button_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2],
					3
				},
				size = {
					size[1],
					5
				},
				texture_tiling_size = {
					size[1],
					5
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 4,
					3
				},
				size = {
					size[1],
					5
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					3
				},
				size = {
					size[1],
					size[2] - 5
				}
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					2
				},
				size = {
					size[1],
					size[2] - 5
				}
			},
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			button_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					2,
					4
				},
				size = size
			},
			button_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					2,
					4
				},
				size = size
			},
			button_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					0,
					3
				},
				size = size
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					5
				},
				size = size
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					5
				},
				size = size
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local hero_icons = {}

for i = 1, #ProfilePriority do
	hero_icons[#hero_icons + 1] = "unit_frame_portrait_default"
end

local hero_entry_size_scale = 0.75
local hero_entry_width = 96 * hero_entry_size_scale
local hero_entry_height = 112 * hero_entry_size_scale
local hero_entry_spacing = 5 * hero_entry_size_scale
hero_entry_frame_size = {
	86 * hero_entry_size_scale,
	108 * hero_entry_size_scale
}

local function create_objective(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				}
			}
		},
		content = {
			text = "-",
			icon = "trial_gem",
			background = "chest_upgrade_fill_glow"
		},
		style = {
			background = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					49,
					44
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1
				}
			},
			text = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1] - 60,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					50,
					0,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1] - 60,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					52,
					-2,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local level_name_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 32,
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
local weave_name_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = false,
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
local wind_name_style = {
	font_size = 20,
	upper_case = false,
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
		2
	}
}
local mutator_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
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
local mutator_description_text_style = {
	font_size = 18,
	use_shadow = true,
	localize = true,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
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
local objective_title_text_style = {
	font_size = 28,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local info_frame_text_title_style = {
	font_size = 16,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "arial",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local info_frame_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 16,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "arial",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		80,
		0,
		2
	},
	size = {
		200,
		16
	}
}
local widgets = {
	base = {
		window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, window_frame, 10),
		filter_frame_edge = create_vertical_window_divider("filter_frame_edge", scenegraph_definition.filter_frame_edge.size),
		lobby_info_divider = create_vertical_window_divider("lobby_info_divider", scenegraph_definition.lobby_info_divider.size),
		lobby_list_tabs_divider = create_window_divider("lobby_list_tabs_divider", scenegraph_definition.lobby_list_tabs_divider.size),
		search_button = create_window_button("search_button", scenegraph_definition.search_button.size, Localize("lb_search"), 32, false, "green"),
		reset_button = create_window_button("reset_button", scenegraph_definition.reset_button.size, Localize("lb_reset_filters"), 32, false),
		lobby_type_button = create_window_button("lobby_type_button", scenegraph_definition.lobby_type_button.size, Localize("lb_lobby_type_lobbies"), 32, false),
		join_button = create_window_button("join_button", scenegraph_definition.join_button.size, Localize("lb_join"), 32, false),
		invalid_checkbox = UIWidgets.create_checkbox_widget("lb_show_invalid", "", "invalid_checkbox", 10, {
			-40,
			0,
			4
		})
	},
	lobbies = {
		game_type_stepper = UIWidgets.create_stepper("game_mode_stepper", scenegraph_definition.game_mode_stepper.size),
		level_stepper = UIWidgets.create_stepper("level_stepper", scenegraph_definition.level_stepper.size),
		difficulty_stepper = UIWidgets.create_stepper("difficulty_stepper", scenegraph_definition.difficulty_stepper.size),
		show_lobbies_stepper = UIWidgets.create_stepper("show_lobbies_stepper", scenegraph_definition.show_lobbies_stepper.size),
		distance_stepper = UIWidgets.create_stepper("distance_stepper", scenegraph_definition.distance_stepper.size),
		game_mode_banner_widget = UIWidgets.create_title_and_tooltip("game_mode_banner", scenegraph_definition.level_banner.size, "lb_game_type", "lb_game_type_tooltip", create_banner_text_config()),
		level_banner_widget = UIWidgets.create_title_and_tooltip("level_banner", scenegraph_definition.level_banner.size, "map_level_setting", "map_level_setting_tooltip", create_banner_text_config()),
		difficulty_banner_widget = UIWidgets.create_title_and_tooltip("difficulty_banner", scenegraph_definition.difficulty_banner.size, "map_difficulty_setting", "map_difficulty_setting_tooltip", create_banner_text_config()),
		show_lobbies_banner_widget = UIWidgets.create_title_and_tooltip("show_lobbies_banner", scenegraph_definition.show_lobbies_banner.size, "lb_show_lobbies", "lb_show_lobbies_tooltip", create_banner_text_config()),
		distance_banner_widget = UIWidgets.create_title_and_tooltip("distance_banner", scenegraph_definition.distance_banner.size, "map_search_zone_setting", "map_search_zone_setting_tooltip", create_banner_text_config())
	},
	servers = {
		name_input_box = UIWidgets.create_text_input_rect("name_input_box", scenegraph_definition.name_input_box.size, {
			5,
			10,
			0
		}),
		search_type_stepper = UIWidgets.create_stepper("search_type_stepper", scenegraph_definition.search_type_stepper.size),
		name_input_box_banner = UIWidgets.create_title_and_tooltip("name_input_box_banner", scenegraph_definition.name_input_box_banner.size, "lb_server_name", "lb_server_name_tooltip", create_banner_text_config()),
		search_type_banner_widget = UIWidgets.create_title_and_tooltip("search_type_banner", scenegraph_definition.search_type_banner.size, "lb_search_type_setting", "lb_search_type_setting_tooltip", create_banner_text_config())
	},
	lobby_info_box_base = {
		level_image_frame = UIWidgets.create_simple_texture("map_frame_00", "lobby_info_level_image_frame"),
		level_image = UIWidgets.create_simple_texture("level_icon_01", "lobby_info_level_image"),
		level_name = UIWidgets.create_simple_text("level_name", "lobby_info_level_text", nil, nil, level_name_style),
		hero_tabs = UIWidgets.create_icon_selector("lobby_info_hero_tabs", {
			hero_entry_width,
			hero_entry_height
		}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true)
	},
	lobby_info_box_weaves = {
		wind_icon = UIWidgets.create_simple_texture("icon_wind_azyr", "wind_icon"),
		wind_icon_glow = UIWidgets.create_simple_texture("winds_icon_background_glow", "wind_icon_glow"),
		wind_icon_bg = UIWidgets.create_simple_texture("weave_item_icon_border_selected", "wind_icon_bg"),
		wind_icon_slot = UIWidgets.create_simple_texture("weave_item_icon_border_center", "wind_icon_slot"),
		mutator_icon = UIWidgets.create_simple_texture("icons_placeholder", "mutator_icon"),
		mutator_icon_frame = UIWidgets.create_simple_texture("talent_frame", "mutator_icon_frame"),
		mutator_title_text = UIWidgets.create_simple_text("n/a", "mutator_title_text", nil, nil, mutator_title_text_style),
		mutator_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "mutator_title_divider"),
		mutator_description_text = UIWidgets.create_simple_text("n/a", "mutator_description_text", nil, nil, mutator_description_text_style),
		objective_title_bg = UIWidgets.create_simple_texture("menu_subheader_bg", "objective_title_bg"),
		objective_title = UIWidgets.create_simple_text("weave_objective_title", "objective_title", nil, nil, objective_title_text_style),
		objective_1 = create_objective("objective_1", scenegraph_definition.objective_1.size),
		objective_2 = create_objective("objective_2", scenegraph_definition.objective_2.size),
		weave_name = UIWidgets.create_simple_text("weave_name", "lobby_info_weave_level_text", nil, nil, weave_name_style),
		wind_name = UIWidgets.create_simple_text("wind_name", "lobby_info_wind_text", nil, nil, wind_name_style)
	},
	lobby_info_box_deus = {
		expedition_icon = UIWidgets.create_expedition_widget_func("lobby_info_level_image", nil, DeusJourneySettings.journey_cave, "journey_cave", {
			width = 800,
			spacing_x = 40
		}, 1.2),
		level_name = UIWidgets.create_simple_text("level_name", "lobby_info_level_text", nil, nil, level_name_style),
		hero_tabs = UIWidgets.create_icon_selector("lobby_info_hero_tabs", {
			hero_entry_width,
			hero_entry_height
		}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true)
	},
	lobby_info_box_lobbies_weaves = {
		info_frame = UIWidgets.create_frame("lobby_info_box_info_frame_lobbies_weaves", scenegraph_definition.lobby_info_box_info_frame_lobbies_weaves.size, window_frame, 5),
		info_frame_host_title = UIWidgets.create_simple_text(Localize("lb_host") .. ":", "lobby_info_box_host_lobbies_weaves", nil, nil, info_frame_text_title_style),
		info_frame_host_text = UIWidgets.create_simple_text("host", "lobby_info_box_host_lobbies_weaves", nil, nil, info_frame_text_style),
		info_frame_players_title = UIWidgets.create_simple_text(Localize("lb_players") .. ":", "lobby_info_box_players_lobbies_weaves", nil, nil, info_frame_text_title_style),
		info_frame_players_text = UIWidgets.create_simple_text("1/4", "lobby_info_box_players_lobbies_weaves", nil, nil, info_frame_text_style),
		info_frame_status_title = UIWidgets.create_simple_text(Localize("lb_status") .. ":", "lobby_info_box_status_lobbies_weaves", nil, nil, info_frame_text_title_style),
		info_frame_status_text = UIWidgets.create_simple_text("Started", "lobby_info_box_status_lobbies_weaves", nil, nil, info_frame_text_style),
		info_frame_game_type_title = UIWidgets.create_simple_text(Localize("lb_game_type") .. ":", "lobby_info_box_game_type_lobbies_weaves", nil, nil, info_frame_text_title_style),
		info_frame_game_type_text = UIWidgets.create_simple_text(Localize("lb_game_type_weave"), "lobby_info_box_game_type_lobbies_weaves", nil, nil, info_frame_text_style)
	},
	lobby_info_box_lobbies_deus = {
		info_frame = UIWidgets.create_frame("lobby_info_box_info_frame_lobbies", scenegraph_definition.lobby_info_box_info_frame_lobbies.size, window_frame, 5),
		info_frame_host_title = UIWidgets.create_simple_text(Localize("lb_host") .. ":", "lobby_info_box_host_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_host_text = UIWidgets.create_simple_text("host", "lobby_info_box_host_lobbies", nil, nil, info_frame_text_style),
		info_frame_level_name_title = UIWidgets.create_simple_text(Localize("lb_level") .. ":", "lobby_info_box_level_name_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_level_name_text = UIWidgets.create_simple_text("level_name", "lobby_info_box_level_name_lobbies", nil, nil, info_frame_text_style),
		info_frame_difficulty_title = UIWidgets.create_simple_text(Localize("lb_difficulty") .. ":", "lobby_info_box_difficulty_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_difficulty_text = UIWidgets.create_simple_text("difficulty", "lobby_info_box_difficulty_lobbies", nil, nil, info_frame_text_style),
		info_frame_players_title = UIWidgets.create_simple_text(Localize("lb_players") .. ":", "lobby_info_box_players_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_players_text = UIWidgets.create_simple_text("1/4", "lobby_info_box_players_lobbies", nil, nil, info_frame_text_style),
		info_frame_status_title = UIWidgets.create_simple_text(Localize("lb_status") .. ":", "lobby_info_box_status_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_status_text = UIWidgets.create_simple_text("Started", "lobby_info_box_status_lobbies", nil, nil, info_frame_text_style),
		info_frame_game_type_title = UIWidgets.create_simple_text(Localize("lb_game_type") .. ":", "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_game_type_text = UIWidgets.create_simple_text(Localize("lb_game_type_none"), "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_style),
		info_frame_twitch_logo = UIWidgets.create_simple_texture("twitch_logo_new", "lobby_info_box_twitch_logo", nil, nil, nil, nil)
	},
	lobby_info_box_lobbies = {
		info_frame = UIWidgets.create_frame("lobby_info_box_info_frame_lobbies", scenegraph_definition.lobby_info_box_info_frame_lobbies.size, window_frame, 5),
		info_frame_host_title = UIWidgets.create_simple_text(Localize("lb_host") .. ":", "lobby_info_box_host_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_host_text = UIWidgets.create_simple_text("host", "lobby_info_box_host_lobbies", nil, nil, info_frame_text_style),
		info_frame_level_name_title = UIWidgets.create_simple_text(Localize("lb_level") .. ":", "lobby_info_box_level_name_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_level_name_text = UIWidgets.create_simple_text("level_name", "lobby_info_box_level_name_lobbies", nil, nil, info_frame_text_style),
		info_frame_difficulty_title = UIWidgets.create_simple_text(Localize("lb_difficulty") .. ":", "lobby_info_box_difficulty_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_difficulty_text = UIWidgets.create_simple_text("difficulty", "lobby_info_box_difficulty_lobbies", nil, nil, info_frame_text_style),
		info_frame_players_title = UIWidgets.create_simple_text(Localize("lb_players") .. ":", "lobby_info_box_players_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_players_text = UIWidgets.create_simple_text("1/4", "lobby_info_box_players_lobbies", nil, nil, info_frame_text_style),
		info_frame_status_title = UIWidgets.create_simple_text(Localize("lb_status") .. ":", "lobby_info_box_status_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_status_text = UIWidgets.create_simple_text("Started", "lobby_info_box_status_lobbies", nil, nil, info_frame_text_style),
		info_frame_game_type_title = UIWidgets.create_simple_text(Localize("lb_game_type") .. ":", "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_game_type_text = UIWidgets.create_simple_text(Localize("lb_game_type_none"), "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_style),
		info_frame_twitch_logo = UIWidgets.create_simple_texture("twitch_logo_new", "lobby_info_box_twitch_logo", nil, nil, nil, nil)
	},
	lobby_info_box_servers = {
		info_frame = UIWidgets.create_frame("lobby_info_box_info_frame_servers", scenegraph_definition.lobby_info_box_info_frame_servers.size, window_frame, 5),
		info_frame_name_title = UIWidgets.create_simple_text(Localize("lb_name") .. ":", "lobby_info_box_name_servers", nil, nil, info_frame_text_title_style),
		info_frame_name_text = UIWidgets.create_simple_text("server_name", "lobby_info_box_name_servers", nil, nil, info_frame_text_style),
		info_frame_ip_adress_title = UIWidgets.create_simple_text(Localize("lb_ip_adress") .. ":", "lobby_info_box_ip_adress_servers", nil, nil, info_frame_text_title_style),
		info_frame_ip_adress_text = UIWidgets.create_simple_text("1.3.3.7", "lobby_info_box_ip_adress_servers", nil, nil, info_frame_text_style),
		info_frame_password_protected_title = UIWidgets.create_simple_text(Localize("lb_password_protected") .. ":", "lobby_info_box_password_protected_servers", nil, nil, info_frame_text_title_style),
		info_frame_password_protected_text = UIWidgets.create_simple_text("Yes", "lobby_info_box_password_protected_servers", nil, nil, info_frame_text_style),
		info_frame_ping_title = UIWidgets.create_simple_text(Localize("lb_ping") .. ":", "lobby_info_box_ping_servers", nil, nil, info_frame_text_title_style),
		info_frame_ping_text = UIWidgets.create_simple_text("1337", "lobby_info_box_ping_servers", nil, nil, info_frame_text_style),
		info_frame_favorite_title = UIWidgets.create_simple_text(Localize("lb_favorite") .. ":", "lobby_info_box_favorite_servers", nil, nil, info_frame_text_title_style),
		info_frame_favorite_text = UIWidgets.create_simple_text("Yes", "lobby_info_box_favorite_servers", nil, nil, info_frame_text_style),
		info_frame_level_name_title = UIWidgets.create_simple_text(Localize("lb_level") .. ":", "lobby_info_box_level_name_servers", nil, nil, info_frame_text_title_style),
		info_frame_level_name_text = UIWidgets.create_simple_text("level_name", "lobby_info_box_level_name_servers", nil, nil, info_frame_text_style),
		info_frame_difficulty_title = UIWidgets.create_simple_text(Localize("lb_difficulty") .. ":", "lobby_info_box_difficulty_servers", nil, nil, info_frame_text_title_style),
		info_frame_difficulty_text = UIWidgets.create_simple_text("difficulty", "lobby_info_box_difficulty_servers", nil, nil, info_frame_text_style),
		info_frame_players_title = UIWidgets.create_simple_text(Localize("lb_players") .. ":", "lobby_info_box_players_servers", nil, nil, info_frame_text_title_style),
		info_frame_players_text = UIWidgets.create_simple_text("1/4", "lobby_info_box_players_servers", nil, nil, info_frame_text_style),
		info_frame_status_title = UIWidgets.create_simple_text(Localize("lb_status") .. ":", "lobby_info_box_status_servers", nil, nil, info_frame_text_title_style),
		info_frame_status_text = UIWidgets.create_simple_text("Started", "lobby_info_box_status_servers", nil, nil, info_frame_text_style),
		info_frame_game_type_title = UIWidgets.create_simple_text(Localize("lb_game_type") .. ":", "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_title_style),
		info_frame_game_type_text = UIWidgets.create_simple_text(Localize("lb_game_type_none"), "lobby_info_box_game_type_lobbies", nil, nil, info_frame_text_style),
		server_buttons_frame = UIWidgets.create_frame("lobby_info_dedicated_server_buttons_frame", scenegraph_definition.lobby_info_dedicated_server_buttons_frame.size, window_frame, 5),
		add_to_favorites_button = create_window_button("lobby_info_add_to_favorites_button", scenegraph_definition.lobby_info_add_to_favorites_button.size, Localize("lb_add_to_favorites"), 20, false)
	}
}

table.clear(widgets.base.lobby_type_button.element.passes)

return {
	show_lobbies_table = show_lobbies_array,
	distance_table = distance_array,
	setup_game_mode_data = setup_game_mode_data,
	search_type_table = search_type_array,
	search_type_text_table = search_type_text_array,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	widgets = widgets
}
