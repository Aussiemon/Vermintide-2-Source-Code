local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] + window_spacing
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
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
	100
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
			-60,
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
			-100,
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
	lobby_info_box_level_name_lobbies = {
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
		position = {
			10,
			200,
			1
		},
		size = {
			200,
			34
		}
	},
	game_mode_stepper = {
		vertical_alignment = "top",
		parent = "filter_frame",
		horizontal_alignment = "center",
		position = {
			0,
			-73,
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
local title_text_style = {
	vertical_alignment = "bottom",
	upper_case = true,
	localize = false,
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}

local function sort_level_list(a, b)
	local level_settings = LevelSettings
	local a_map_settings = level_settings[a].map_settings
	local b_map_settings = level_settings[b].map_settings
	local a_sorting_index = (a_map_settings and (a_map_settings.sorting or 0)) or 0
	local b_sorting_index = (b_map_settings and (b_map_settings.sorting or 0)) or 0

	return a_sorting_index < b_sorting_index
end

local function setup_game_mode_data(statistics_db, player_stats_id)
	local game_mode_data = {}
	local game_modes = {}
	local only_release = GameSettingsDevelopment.release_levels_only

	for name, data in pairs(LevelSettings) do
		if type(data) == "table" then
			local debug_level = string.match(data.package_name, "resource_packages/levels/debug/")

			if not only_release or not debug_level then
				local game_mode = data.game_mode

				if game_mode and game_mode ~= "tutorial" and game_mode ~= "demo" then
					local unlockable = data.unlockable

					if unlockable and LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, name) then
						if not game_modes[game_mode] then
							local index = #game_mode_data + 1
							local game_mode_settings = GameModeSettings[game_mode]
							local game_mode_difficulties = game_mode_settings.difficulties
							local game_mode_display_name = game_mode_settings.display_name
							local difficulties = table.clone(game_mode_difficulties)
							difficulties[#difficulties + 1] = "any"
							game_modes[game_mode] = index
							game_mode_data[index] = {
								levels = {},
								difficulties = difficulties,
								game_mode_key = game_mode,
								game_mode_display_name = game_mode_display_name
							}
						end

						local data = game_mode_data[game_modes[game_mode]]
						local levels = data.levels
						levels[#levels + 1] = name
					end
				end
			end
		end
	end

	for index, data in ipairs(game_mode_data) do
		local levels = data.levels

		table.sort(levels, sort_level_list)

		levels[#levels + 1] = "any"
	end

	return game_mode_data
end

local show_lobbies_array = {
	"lb_show_joinable",
	"lb_show_all"
}
local distance_array = (PLATFORM == "ps4" and {
	"map_zone_options_2",
	"map_zone_options_3",
	"map_zone_options_5"
}) or {
	"map_zone_options_2",
	"map_zone_options_3",
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
LobbyBrowserGamepadWidgets = {
	stepper = {
		input_function = function (widget, input_service)
			local content = widget.content

			if input_service:get("move_left") then
				content.left_button_hotspot.on_release = true

				return true
			elseif input_service:get("move_right") then
				content.right_button_hotspot.on_release = true

				return true
			end
		end
	}
}

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

local function window_icon_tabs(scenegraph_id, size, amount, optional_color_name)
	local button_color_name = nil

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2]
	}
	local icon_size = {
		34,
		34
	}
	local start_width_offset = 0

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + button_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name
		}
		style[background_name] = {
			size = button_size,
			color = background_color,
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1)
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1
				}
			},
			texture_id = background_texture
		}
		local background_glow_name = "background_glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_glow_name,
			style_id = background_glow_name,
			content_check_function = function (content)
				return content.is_selected or content.is_hover
			end
		}
		style[background_glow_name] = {
			size = {
				button_size[1],
				button_size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2
			}
		}
		hotspot_content[background_glow_name] = "button_state_normal"
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + button_size[2]) - 3,
				1
			}
		}
		hotspot_content[glass_top_name] = "tabs_glass_top"
		local icon_name = "icon" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name
		}
		style[icon_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				(offset[1] + button_size[1] / 2) - icon_size[1] / 2,
				(offset[2] + button_size[2] / 2) - icon_size[1] / 2 + 2,
				2
			}
		}
		hotspot_content[icon_name] = "tabs_inventory_icon_trinkets_selected"
		local edge_fade_name = "edge_fade" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = edge_fade_name,
			style_id = edge_fade_name,
			content_check_function = function (content)
				return not content.is_selected
			end
		}
		style[edge_fade_name] = {
			size = {
				button_size[1],
				15
			},
			color = {
				200,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				5
			}
		}
		hotspot_content[edge_fade_name] = "edge_fade_small"
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
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
			hover_glow = (optional_color_name and "button_state_hover_" .. optional_color_name) or "button_state_hover",
			glow = (optional_color_name and "button_state_normal_" .. optional_color_name) or "button_state_normal",
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

function create_hero_slot_widget(scenegraph_id, profile_index)
	local element = {
		passes = {
			{
				texture_id = "hero_texture",
				style_id = "hero_texture",
				pass_type = "texture",
				retained_mode = false
			}
		}
	}
	local content = {
		hero_texture = "unit_frame_portrait_default",
		hero_icons = hero_icons[profile_index]
	}
	local style = {
		hero_texture = {
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
	local widget = {
		element = element,
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}

	return widget
end

local hero_icons = {}

for index, profile_index in ipairs(ProfilePriority) do
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
local level_name_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
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
	font_size = 16,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "arial",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
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
		invalid_checkbox = UIWidgets.create_checkbox_widget("lb_show_invalid", "", "invalid_checkbox", 0, {
			50,
			0,
			4
		})
	},
	lobbies = {
		level_stepper = UIWidgets.create_stepper("level_stepper", scenegraph_definition.level_stepper.size),
		difficulty_stepper = UIWidgets.create_stepper("difficulty_stepper", scenegraph_definition.difficulty_stepper.size),
		show_lobbies_stepper = UIWidgets.create_stepper("show_lobbies_stepper", scenegraph_definition.show_lobbies_stepper.size),
		distance_stepper = UIWidgets.create_stepper("distance_stepper", scenegraph_definition.distance_stepper.size),
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
		info_frame_status_text = UIWidgets.create_simple_text("Started", "lobby_info_box_status_lobbies", nil, nil, info_frame_text_style)
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
		server_buttons_frame = UIWidgets.create_frame("lobby_info_dedicated_server_buttons_frame", scenegraph_definition.lobby_info_dedicated_server_buttons_frame.size, window_frame, 5),
		add_to_favorites_button = create_window_button("lobby_info_add_to_favorites_button", scenegraph_definition.lobby_info_add_to_favorites_button.size, Localize("lb_add_to_favorites"), 20, false)
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
local generic_input_actions = {
	default = {
		{
			input_action = "d_horizontal",
			priority = 2,
			description_text = "input_description_switch_settings",
			ignore_keybinding = true
		},
		{
			input_action = "l1_r1",
			priority = 3,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 49,
			description_text = "lb_join"
		},
		{
			input_action = "special_1",
			priority = 50,
			description_text = "lb_reset_filters"
		},
		{
			input_action = "refresh",
			priority = 51,
			description_text = "lb_search"
		},
		{
			input_action = "back",
			priority = 52,
			description_text = "input_description_close"
		}
	},
	no_join = {
		{
			input_action = "d_horizontal",
			priority = 2,
			description_text = "input_description_switch_settings",
			ignore_keybinding = true
		},
		{
			input_action = "l1_r1",
			priority = 3,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "special_1",
			priority = 50,
			description_text = "lb_reset_filters"
		},
		{
			input_action = "refresh",
			priority = 51,
			description_text = "lb_search"
		},
		{
			input_action = "back",
			priority = 52,
			description_text = "input_description_close"
		}
	}
}

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
