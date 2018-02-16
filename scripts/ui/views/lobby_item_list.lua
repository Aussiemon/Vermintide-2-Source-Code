require("foundation/scripts/util/local_require")
require("scripts/managers/telemetry/iso_country_names")
require("scripts/settings/level_settings")

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] + window_spacing
local window_text_width = window_size[1] - (window_frame_width*2 + 60)
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	window_size[1]*3 + window_spacing*2 + large_window_frame_width*2,
	window_size[2] + large_window_frame_width*2
}
local filter_frame_size = {
	400,
	inner_window_size[2]
}
local info_frame_size = {
	400,
	inner_window_size[2]
}
local window_size = {
	inner_window_size[1] - filter_frame_size[1] - info_frame_size[1] + 12,
	inner_window_size[2] - 60
}
local element_settings = {
	height_spacing = 7,
	height = 45,
	width = window_size[1] - 50
}
local ListSettings = {
	font_size = 18
}
local scrollbar_width = 22
local max_list_entries = 100
local time_until_remove = 5
local title_text_position = {
	20,
	0,
	2
}
local level_text_position = {
	window_size[1]*0.3,
	0,
	2
}
local difficulty_text_position = {
	window_size[1]*0.6,
	0,
	2
}
local num_players_text_position = {
	window_size[1]*0.8,
	0,
	2
}
local status_text_position = {
	window_size[1]*0.6,
	0,
	2
}
local country_text_position = {
	-5,
	0,
	2
}
local country_button_position = {
	-50,
	0,
	2
}
local level_lock_position = {
	level_text_position[1] - 25,
	10,
	3
}
local difficulty_lock_position = {
	difficulty_text_position[1] - 25,
	10,
	3
}
local status_lock_position = {
	status_text_position[1] - 25,
	10,
	3
}
local definitions = {
	scenegraph_definition = {
		root = {
			is_root = true,
			size = {
				1920,
				1080
			},
			position = {
				0,
				0,
				UILayer.default + 20
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
		item_list = {
			vertical_alignment = "bottom",
			parent = "window",
			horizontal_alignment = "left",
			size = {
				window_size[1],
				window_size[2]
			},
			position = {
				filter_frame_size[1] + 8,
				12,
				1
			}
		},
		loading_overlay = {
			vertical_alignment = "bottom",
			parent = "item_list",
			horizontal_alignment = "left",
			size = {
				window_size[1] - 16,
				window_size[2] + 7
			},
			position = {
				-4,
				-8,
				6
			}
		},
		loading_icon = {
			vertical_alignment = "center",
			parent = "loading_overlay",
			horizontal_alignment = "center",
			position = {
				0,
				0,
				1
			},
			size = {
				50,
				50
			}
		},
		loading_text = {
			vertical_alignment = "center",
			parent = "loading_icon",
			horizontal_alignment = "center",
			position = {
				0,
				-90,
				1
			},
			size = {
				800,
				50
			}
		},
		scrollbar_root = {
			vertical_alignment = "top",
			parent = "item_list",
			horizontal_alignment = "right",
			position = {
				-24,
				-7,
				20
			},
			size = {
				22,
				520
			}
		},
		label_root = {
			vertical_alignment = "top",
			parent = "item_list",
			horizontal_alignment = "left",
			position = {
				0,
				35,
				0
			},
			size = {
				window_size[1],
				40
			}
		},
		host_text_button = {
			vertical_alignment = "top",
			parent = "label_root",
			horizontal_alignment = "left",
			position = title_text_position,
			size = {
				100,
				40
			}
		},
		level_text_button = {
			parent = "label_root",
			horizontal_alignment = "left",
			position = level_text_position,
			size = {
				100,
				40
			}
		},
		difficulty_text_button = {
			parent = "label_root",
			horizontal_alignment = "left",
			position = difficulty_text_position,
			size = {
				130,
				40
			}
		},
		players_text_button = {
			parent = "label_root",
			horizontal_alignment = "left",
			position = num_players_text_position,
			size = {
				120,
				40
			}
		}
	},
	widget_definitions = {
		inventory_list_widget = {
			scenegraph_id = "item_list",
			element = {
				passes = {
					{
						style_id = "list_style",
						pass_type = "list_pass",
						content_id = "list_content",
						passes = {
							{
								style_id = "background",
								pass_type = "hotspot",
								content_id = "button_hotspot"
							},
							{
								pass_type = "on_click",
								click_check_content_id = "button_hotspot",
								click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
									ui_content.button_hotspot.is_selected = true

									return 
								end
							},
							{
								pass_type = "texture_frame",
								style_id = "frame",
								texture_id = "frame"
							},
							{
								pass_type = "texture",
								style_id = "background",
								texture_id = "background_normal_hover",
								content_check_function = function (ui_content)
									local button_hotspot = ui_content.button_hotspot

									return button_hotspot.is_hover and not button_hotspot.is_selected
								end
							},
							{
								pass_type = "texture",
								style_id = "background",
								texture_id = "background_selected",
								content_check_function = function (ui_content)
									local button_hotspot = ui_content.button_hotspot

									return button_hotspot.is_selected and not button_hotspot.is_hover
								end
							},
							{
								pass_type = "texture",
								style_id = "background",
								texture_id = "background_selected_hover",
								content_check_function = function (ui_content)
									local button_hotspot = ui_content.button_hotspot

									return button_hotspot.is_selected and button_hotspot.is_hover
								end
							},
							{
								pass_type = "texture",
								style_id = "locked_level",
								texture_id = "locked_level",
								content_check_function = function (ui_content)
									return ui_content.level_is_locked
								end
							},
							{
								pass_type = "texture",
								style_id = "locked_difficulty",
								texture_id = "locked_difficulty",
								content_check_function = function (ui_content)
									return ui_content.difficulty_is_locked
								end
							},
							{
								style_id = "title_text",
								pass_type = "text",
								text_id = "title_text"
							},
							{
								style_id = "level_text",
								pass_type = "text",
								text_id = "level_text"
							},
							{
								style_id = "difficulty_text",
								pass_type = "text",
								text_id = "difficulty_text"
							},
							{
								style_id = "num_players_text",
								pass_type = "text",
								text_id = "num_players_text"
							}
						}
					},
					{
						style_id = "hover",
						pass_type = "hover",
						content_id = "hotspot"
					}
				}
			},
			content = {
				list_content = {}
			},
			style = {
				list_style = {},
				hover = {
					offset = {
						0,
						306
					},
					size = {
						1100,
						530
					}
				}
			}
		},
		test = UIWidgets.create_simple_rect("item_list", {
			200,
			0,
			255,
			0
		}),
		window = UIWidgets.create_simple_rect("window", {
			200,
			255,
			0,
			0
		}),
		host_text_button = UIWidgets.create_text_button("host_text_button", "lb_host", ListSettings.font_size),
		level_text_button = UIWidgets.create_text_button("level_text_button", "lb_level", ListSettings.font_size),
		difficulty_text_button = UIWidgets.create_text_button("difficulty_text_button", "lb_difficulty", ListSettings.font_size),
		players_text_button = UIWidgets.create_text_button("players_text_button", "lb_players", ListSettings.font_size),
		loading_overlay = UIWidgets.create_simple_rect("loading_overlay", {
			100,
			0,
			0,
			0
		}),
		loading_icon = UIWidgets.create_simple_rotated_texture("matchmaking_connecting_icon", 0, {
			25,
			25
		}, "loading_icon"),
		loading_text = UIWidgets.create_simple_text("matchmaking_status_cannot_find_game", "loading_text", 28, Colors.get_color_table_with_alpha("cheeseburger", 0))
	}
}

local function setup_list_hover_area(width, height)
	local list_definition = definitions.widget_definitions.inventory_list_widget
	local hover_pass = list_definition.element.passes[2]
	local hover_style = list_definition.style.hover
	local size = hover_style.size
	local offset = hover_style.offset
	size[1] = width
	size[2] = height
	offset[2] = 0

	return 
end

local function setup_mouse_scroll_widget_definition(scroll_field_width, scroll_field_height)
	definitions.scenegraph_definition.scrollbar_root.size[2] = scroll_field_height
	local scenegraph_id = "mouse_scroll_field"
	local scroll_field_scenegraph_definition = {
		horizontal_alignment = "right",
		position = {
			0,
			-2,
			1
		},
		size = {
			scroll_field_width + 24,
			scroll_field_height
		},
		parent = "scrollbar_root"
	}
	definitions.scenegraph_definition[scenegraph_id] = scroll_field_scenegraph_definition
	definitions.widget_definitions.scroll_field = {
		element = {
			passes = {
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis)
						local scroll_step = ui_content.scroll_step or 0.1
						local current_scroll_value = ui_content.internal_scroll_value
						current_scroll_value = current_scroll_value + scroll_step*-scroll_axis.y
						ui_content.internal_scroll_value = math.clamp(current_scroll_value, 0, 1)

						return 
					end
				}
			}
		},
		content = {
			scroll_step = 0.05,
			internal_scroll_value = 0
		},
		style = {},
		scenegraph_id = scenegraph_id
	}

	return 
end

local function lobby_level_display_name(lobby_data)
	local level = lobby_data.selected_level_key or lobby_data.level_key
	local level_setting = level and LevelSettings[level]
	local level_display_name = level and level_setting.display_name
	local level_text = (level and Localize(level_display_name)) or "-"

	return level_text
end

local function lobby_level_sort_order(lobby_data)
	local level = lobby_data.selected_level_key or lobby_data.level_key
	local level_setting = level and LevelSettings[level]
	local map_settings = level_setting and level_setting.map_settings
	local level_sort_order = map_settings and map_settings.sorting

	return level_sort_order or 0
end

local function lobby_difficulty_display_name(lobby_data)
	local difficulty = lobby_data.difficulty
	local difficulty_setting = difficulty and DifficultySettings[difficulty]
	local difficulty_display_name = difficulty and difficulty_setting.display_name
	local difficulty_text = (difficulty and Localize(difficulty_display_name)) or "-"

	return difficulty_text
end

local function lobby_difficulty_rank(lobby_data)
	local difficulty = lobby_data.difficulty
	local difficulty_setting = difficulty and DifficultySettings[difficulty]
	local difficulty_rank = (difficulty and difficulty_setting.rank) or 0

	return difficulty_rank
end

local function lobby_status_text(lobby_data)
	local is_private = lobby_data.matchmaking == "false"
	local is_full = lobby_data.num_players == MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
	local is_in_inn = lobby_data.level_key == "inn_level"
	local is_broken = lobby_data.is_broken
	local status = (is_broken and "lb_broken") or (is_private and "lb_private") or (is_full and "lb_full") or (is_in_inn and "lb_in_inn") or "lb_started"
	local status_text = (status and Localize(status)) or ""

	return status_text
end

local function lobby_country_text(lobby_data)
	local country_code = lobby_data.country_code
	local country_text = (country_code and iso_countries[country_code]) or ""

	return country_text
end

function level_is_locked(lobby_data)
	local level = lobby_data.selected_level_key or lobby_data.level_key

	if not level then
		return false
	end

	local in_inn = lobby_data.level_key == "inn_level"

	if in_inn then
		return false
	end

	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)
	local statistics_db = player_manager.statistics_db(player_manager)
	local player_stats_id = player.stats_id(player)
	local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level)

	if not level_unlocked then
		return true
	end

	return 
end

function difficulty_is_locked(lobby_data)
	local level_key = lobby_data.selected_level_key or lobby_data.level_key
	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)
	local statistics_db = player_manager.statistics_db(player_manager)
	local player_stats_id = player.stats_id(player)
	local difficulty = lobby_data.difficulty

	if not difficulty or not level_key then
		return false
	end

	local profile_name = player.profile_display_name(player)
	local career_name = player.career_name(player)
	local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

	if not has_required_power_level then
		return true
	end

	return 
end

function status_is_locked(lobby_data)
	local num_players = lobby_data.num_players
	local matchmaking = lobby_data.matchmaking

	if not num_players or not matchmaking then
		return false
	end

	local is_private = lobby_data.matchmaking == "false"
	local is_full = lobby_data.num_players == MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
	local is_broken = lobby_data.is_broken

	return is_broken or is_full or is_private
end

local entry_frame_settings = UIFrameSettings.menu_frame_12

local function create_lobby_list_entry_content(lobby_data)
	local my_peer_id = Network:peer_id()
	local host = lobby_data.host
	local title_text = lobby_data.server_name or lobby_data.unique_server_name or lobby_data.name or lobby_data.host

	if host == my_peer_id or not title_text then
		return 
	end

	local level_text = lobby_level_display_name(lobby_data)
	local num_players_text = lobby_data.num_players or 0
	local difficulty_text = lobby_difficulty_display_name(lobby_data)
	local status_text = lobby_status_text(lobby_data)
	local is_invalid = not lobby_data.valid
	local status_text_parsed = (is_invalid and "[INV]" .. status_text) or status_text
	local country_text = lobby_country_text(lobby_data)
	local content = {
		locked_difficulty = "locked_icon_01",
		locked_status = "locked_icon_01",
		background_selected = "lb_list_item_clicked",
		background_normal_hover = "lb_list_item_hover",
		visible = true,
		background_selected_hover = "lb_list_item_clicked",
		background_normal = "lb_list_item_normal",
		locked_level = "locked_icon_01",
		button_hotspot = {},
		lobby_data = lobby_data,
		title_text = title_text,
		level_text = level_text,
		difficulty_text = difficulty_text,
		num_players_text = num_players_text .. "/4",
		status_text = status_text_parsed,
		country_text = country_text,
		level_is_locked = level_is_locked(lobby_data),
		difficulty_is_locked = difficulty_is_locked(lobby_data),
		status_is_locked = status_is_locked(lobby_data),
		frame = entry_frame_settings.texture
	}

	return content
end

local function create_empty_lobby_list_entry_content()
	local content = {
		difficulty_text = "",
		title_text = "",
		num_players_text = "",
		background_normal = "lb_list_item_bg",
		fake = true,
		country_text = "",
		background_normal_hover = "lb_list_item_bg",
		background_selected = "lb_list_item_bg",
		level_text = "",
		status_text = "",
		background_selected_hover = "lb_list_item_bg",
		button_hotspot = {},
		frame = entry_frame_settings.texture
	}

	return content
end

local function create_lobby_list_entry_style()
	local style = {
		frame = {
			texture_size = entry_frame_settings.texture_size,
			texture_sizes = entry_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				element_settings.width,
				element_settings.height
			},
			offset = {
				0,
				0,
				5
			}
		},
		background = {
			size = {
				element_settings.width,
				element_settings.height
			},
			offset = {
				0,
				0,
				1
			}
		},
		locked_level = {
			size = {
				20,
				26
			},
			offset = level_lock_position
		},
		locked_difficulty = {
			size = {
				20,
				26
			},
			offset = difficulty_lock_position
		},
		locked_status = {
			size = {
				20,
				26
			},
			offset = status_lock_position
		},
		title_text = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = title_text_position
		},
		level_text = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = level_text_position
		},
		difficulty_text = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = difficulty_text_position
		},
		num_players_text = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = {
				num_players_text_position[1] + 5,
				num_players_text_position[2],
				num_players_text_position[3]
			}
		},
		status_text = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = status_text_position
		},
		country_text = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			font_type = "hell_shark",
			size = {
				element_settings.width,
				element_settings.height
			},
			text_color = Colors.color_definitions.white,
			font_size = ListSettings.font_size,
			offset = country_text_position
		}
	}

	return style
end

LobbyItemsList = class(LobbyItemsList)
LobbyItemsList.init = function (self, ingame_ui_context, settings)
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	local num_list_items = settings.num_list_items

	if settings.use_top_renderer then
		self.ui_renderer = ingame_ui_context.ui_top_renderer
	else
		self.ui_renderer = ingame_ui_context.ui_renderer
	end

	self.world_manager = ingame_ui_context.world_manager
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	local scenegraph_definition = definitions.scenegraph_definition
	local item_list_definitions = scenegraph_definition.item_list
	local scroll_field_width = item_list_definitions.size[1]
	local scroll_field_height = item_list_definitions.size[2]
	settings.list_size = {
		item_list_definitions.size[1],
		item_list_definitions.size[2]
	}

	setup_mouse_scroll_widget_definition(scroll_field_width, scroll_field_height)
	setup_list_hover_area(scroll_field_width, scroll_field_height)

	self.settings = settings
	self.widget_definitions = definitions.widget_definitions
	self.bar_animations = {}
	self.inventory_list_animations = {}
	self.scenegraph_definition = scenegraph_definition
	self.lobby_list = {}
	self.input_service_name = settings.input_service_name

	self.create_ui_elements(self, settings.offset)

	self.list_style = {
		vertical_alignment = "top",
		scenegraph_id = "item_list",
		size = settings.list_size,
		list_member_offset = {
			0,
			-(element_settings.height + element_settings.height_spacing),
			0
		},
		item_styles = {}
	}
	self.selected_list_index = 1

	return 
end
LobbyItemsList.destroy = function (self)
	return 
end
LobbyItemsList.create_ui_elements = function (self, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(self.scenegraph_definition)
	local scrollbar_scenegraph_id = "scrollbar_root"
	local scrollbar_scenegraph = self.scenegraph_definition[scrollbar_scenegraph_id]
	self.scrollbar_widget = UIWidget.init(UIWidgets.create_scrollbar(scrollbar_scenegraph_id, scrollbar_scenegraph.size))
	self.item_list_widget = UIWidget.init(self.widget_definitions.inventory_list_widget)
	self.scroll_field_widget = UIWidget.init(self.widget_definitions.scroll_field)
	self.test = UIWidget.init(self.widget_definitions.test)
	self.window = UIWidget.init(self.widget_definitions.window)
	self.host_text_button = UIWidget.init(self.widget_definitions.host_text_button)
	self.level_text_button = UIWidget.init(self.widget_definitions.level_text_button)
	self.difficulty_text_button = UIWidget.init(self.widget_definitions.difficulty_text_button)
	self.players_text_button = UIWidget.init(self.widget_definitions.players_text_button)
	self.loading_overlay = UIWidget.init(self.widget_definitions.loading_overlay)
	self.loading_icon = UIWidget.init(self.widget_definitions.loading_icon)
	self.loading_text = UIWidget.init(self.widget_definitions.loading_text)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	return 
end

local function sort_lobbies_on_host_asc(lobby_a, lobby_b)
	local host_a = lobby_a.server_name or lobby_a.unique_server_name or lobby_a.host or ""
	local host_b = lobby_b.server_name or lobby_b.unique_server_name or lobby_b.host or ""

	return host_a < host_b
end

local function sort_lobbies_on_host_desc(lobby_a, lobby_b)
	local host_a = lobby_a.server_name or lobby_a.unique_server_name or lobby_a.host or ""
	local host_b = lobby_b.server_name or lobby_b.unique_server_name or lobby_b.host or ""

	return host_b < host_a
end

local function sort_lobbies_on_levels_asc(lobby_a, lobby_b)
	local level_a = lobby_level_sort_order(lobby_a)
	local level_b = lobby_level_sort_order(lobby_b)

	return level_a < level_b
end

local function sort_lobbies_on_levels_desc(lobby_a, lobby_b)
	local level_a = lobby_level_sort_order(lobby_a)
	local level_b = lobby_level_sort_order(lobby_b)

	return level_b < level_a
end

local function sort_lobbies_on_difficulty_asc(lobby_a, lobby_b)
	local difficulty_a = lobby_difficulty_rank(lobby_a)
	local difficulty_b = lobby_difficulty_rank(lobby_b)

	return difficulty_a < difficulty_b
end

local function sort_lobbies_on_difficulty_desc(lobby_a, lobby_b)
	local difficulty_a = lobby_difficulty_rank(lobby_a)
	local difficulty_b = lobby_difficulty_rank(lobby_b)

	return difficulty_b < difficulty_a
end

local function sort_lobbies_on_status_asc(lobby_a, lobby_b)
	local status_a = lobby_status_text(lobby_a)
	local status_b = lobby_status_text(lobby_b)

	return status_a < status_b
end

local function sort_lobbies_on_status_desc(lobby_a, lobby_b)
	local status_a = lobby_status_text(lobby_a)
	local status_b = lobby_status_text(lobby_b)

	return status_b < status_a
end

local function sort_lobbies_on_num_players_asc(lobby_a, lobby_b)
	local num_players_a = tonumber(lobby_a.num_players) or 0
	local num_players_b = tonumber(lobby_b.num_players) or 0

	return num_players_a < num_players_b
end

local function sort_lobbies_on_num_players_desc(lobby_a, lobby_b)
	local num_players_a = tonumber(lobby_a.num_players) or 0
	local num_players_b = tonumber(lobby_b.num_players) or 0

	return num_players_b < num_players_a
end

local function sort_lobbies_on_country_asc(lobby_a, lobby_b)
	local country_text_a = lobby_country_text(lobby_a)
	local country_text_b = lobby_country_text(lobby_b)

	return country_text_a < country_text_b
end

local function sort_lobbies_on_country_desc(lobby_a, lobby_b)
	local country_text_a = lobby_country_text(lobby_a)
	local country_text_b = lobby_country_text(lobby_b)

	return country_text_b < country_text_a
end

LobbyItemsList.update = function (self, dt, loading)
	if loading then
		if not self._loading_previous_frame then
			self.loading_overlay_fade_in(self, 180)
		end

		self.rotate_loading_icon(self, dt)
	elseif self._loading_previous_frame then
		self.loading_overlay_fade_out(self)
	end

	self._loading_previous_frame = loading
	local item_list_widget = self.item_list_widget
	local list_content = item_list_widget.content.list_content
	local list_style = item_list_widget.style.list_style
	local selected_list_index = self.selected_list_index
	local hover_list_index = self.hover_list_index
	local number_of_items_in_list = self.number_of_items_in_list
	local input_manager = self.input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	self.lobby_list_index_changed = nil
	self.inventory_list_index_pressed = nil
	local num_list_content = #list_content

	if gamepad_active then
		if 0 < number_of_items_in_list then
			self.handle_gamepad_input(self, dt, number_of_items_in_list)
			self.update_gamepad_list_scroll(self)
		end
	else
		self.gamepad_changed_selected_list_index = nil
	end

	for i = 1, num_list_content, 1 do
		local button_content = list_content[i]
		local button_hotspot = button_content.button_hotspot

		if not button_content.fake then
			if button_hotspot.on_hover_enter then
				self.play_sound(self, "Play_hud_hover")
			end

			if (button_hotspot.is_selected or self.gamepad_changed_selected_list_index == i) and i ~= selected_list_index then
				self.lobby_list_index_changed = i

				self.play_sound(self, "Play_hud_select")

				break
			end
		end
	end

	self.update_scroll(self)

	local host_button_hotspot = self.host_text_button.content.button_text
	local level_button_hotspot = self.level_text_button.content.button_text
	local difficulty_button_hotspot = self.difficulty_text_button.content.button_text
	local player_button_hotspot = self.players_text_button.content.button_text

	if host_button_hotspot.on_hover_enter or level_button_hotspot.on_hover_enter or difficulty_button_hotspot.on_hover_enter or player_button_hotspot.on_hover_enter then
		self.play_sound(self, "Play_hud_hover")
	end

	if host_button_hotspot.on_pressed then
		local sort_func = self._pick_sort_func(self, sort_lobbies_on_host_asc, sort_lobbies_on_host_desc)
		local lobbies = self.lobbies

		self.populate_lobby_list(self, lobbies, sort_func)
		self.play_sound(self, "Play_hud_select")
	end

	if level_button_hotspot.on_pressed then
		local sort_func = self._pick_sort_func(self, sort_lobbies_on_levels_asc, sort_lobbies_on_levels_desc)
		local lobbies = self.lobbies

		self.populate_lobby_list(self, lobbies, sort_func)
		self.play_sound(self, "Play_hud_select")
	end

	if difficulty_button_hotspot.on_pressed then
		local sort_func = self._pick_sort_func(self, sort_lobbies_on_difficulty_asc, sort_lobbies_on_difficulty_desc)
		local lobbies = self.lobbies

		self.populate_lobby_list(self, lobbies, sort_func)
		self.play_sound(self, "Play_hud_select")
	end

	if player_button_hotspot.on_pressed then
		local sort_func = self._pick_sort_func(self, sort_lobbies_on_num_players_asc, sort_lobbies_on_num_players_desc)
		local lobbies = self.lobbies

		self.populate_lobby_list(self, lobbies, sort_func)
		self.play_sound(self, "Play_hud_select")
	end

	return 
end
LobbyItemsList.handle_gamepad_input = function (self, dt, num_elements)
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, self.input_service_name)
	local controller_cooldown = self.controller_cooldown

	if controller_cooldown and 0 < controller_cooldown then
		self.controller_cooldown = controller_cooldown - dt
		local speed_multiplier = self.speed_multiplier or 1
		local decrease = GamepadSettings.menu_speed_multiplier_frame_decrease
		local min_multiplier = GamepadSettings.menu_min_speed_multiplier
		self.speed_multiplier = math.max(speed_multiplier - decrease, min_multiplier)

		return 
	else
		selected_list_index = self.selected_list_index or 1

		if selected_list_index then
			local speed_multiplier = self.speed_multiplier or 1
			local new_list_index = nil
			local move_up = input_service.get(input_service, "move_up")
			local move_up_hold = input_service.get(input_service, "move_up_hold")

			if move_up or move_up_hold then
				new_list_index = math.max(selected_list_index - 1, 1)
				self.controller_cooldown = GamepadSettings.menu_cooldown*speed_multiplier
			else
				local move_down = input_service.get(input_service, "move_down")
				local move_down_hold = input_service.get(input_service, "move_down_hold")

				if move_down or move_down_hold then
					self.controller_cooldown = GamepadSettings.menu_cooldown*speed_multiplier
					new_list_index = math.min(selected_list_index + 1, num_elements)
				end
			end

			if new_list_index and new_list_index ~= selected_list_index then
				self.gamepad_changed_selected_list_index = new_list_index

				return 
			end
		end
	end

	self.speed_multiplier = 1

	return 
end
LobbyItemsList.update_gamepad_list_scroll = function (self)
	local selected_list_index = self.selected_list_index

	if not selected_list_index then
		return 
	end

	local is_outside, state = self.is_entry_outside(self, selected_list_index)

	while is_outside do
		local button_scroll_step = self.scrollbar_widget.content.button_scroll_step
		local scroll_value = self.scroll_value

		if state == "below" then
			scroll_value = math.min(scroll_value + button_scroll_step, 1)
		else
			scroll_value = math.max(scroll_value - button_scroll_step, 0)
		end

		if scroll_value ~= self.scroll_value then
			self.set_scroll_amount(self, scroll_value)
		end

		is_outside, state = self.is_entry_outside(self, self.selected_list_index)
	end

	return 
end
LobbyItemsList.is_entry_outside = function (self, index)
	local item_list_widget = self.item_list_widget

	if item_list_widget then
		local list_content = item_list_widget.content.list_content
		local list_style = item_list_widget.style.list_style
		local max_visible_elements = list_style.num_draws
		local total_elements = #list_content
		local current_start_index = list_style.start_index

		if index < current_start_index then
			return true, "above"
		elseif math.min((current_start_index + max_visible_elements) - 1, total_elements) < index then
			return true, "below"
		end
	end

	return false
end
LobbyItemsList._pick_sort_func = function (self, sort_func_asc, sort_func_desc)
	local sort_func = self.sort_lobbies_function

	if sort_func and sort_func == sort_func_asc then
		sort_func = sort_func_desc
	else
		sort_func = sort_func_asc
	end

	self.sort_lobbies_function = sort_func

	return sort_func
end
LobbyItemsList.rotate_loading_icon = function (self, dt)
	local loading_icon_style = self.loading_icon.style.texture_id
	local angle_fraction = loading_icon_style.fraction or 0
	angle_fraction = (angle_fraction + dt)%1
	local anim_fraction = math.easeOutCubic(angle_fraction)
	local angle = anim_fraction*math.degrees_to_radians(360)
	loading_icon_style.angle = angle
	loading_icon_style.fraction = angle_fraction

	return 
end
LobbyItemsList.loading_overlay_fade_in = function (self, alpha)
	local widget = self.loading_icon
	local style = widget.style
	local color = style.texture_id.color
	local animation = UIAnimation.init(UIAnimation.function_by_time, color, 1, color[1], 255, 0.3, math.easeOutCubic)

	table.clear(widget.animations)

	widget.animations[animation] = true

	table.clear(self.loading_overlay.animations)

	self.loading_overlay.style.rect.color[1] = alpha

	return 
end
LobbyItemsList.loading_overlay_fade_out = function (self)
	local function fade(widget, color)
		local animation = UIAnimation.init(UIAnimation.function_by_time, color, 1, color[1], 0, 0.3, math.easeOutCubic)

		table.clear(widget.animations)

		widget.animations[animation] = true

		return 
	end

	fade(self.loading_overlay, self.loading_overlay.style.rect.color)
	fade(self.loading_icon, self.loading_icon.style.texture_id.color)
	fade(self.loading_text, self.loading_text.style.text.text_color)

	return 
end
LobbyItemsList.animate_loading_text = function (self)
	local widget = self.loading_text
	local style = widget.style
	local color = style.text.text_color

	if color[1] ~= 255 then
		local animation = UIAnimation.init(UIAnimation.function_by_time, color, 1, color[1], 255, 0.3, math.easeOutCubic, UIAnimation.wait, 3.2, UIAnimation.function_by_time, color, 1, 255, 0, 0.3, math.easeOutCubic)

		table.clear(widget.animations)

		widget.animations[animation] = true
	end

	return 
end
LobbyItemsList.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, self.input_service_name)

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.item_list_widget)
	UIRenderer.draw_widget(ui_renderer, self.scroll_field_widget)
	UIRenderer.draw_widget(ui_renderer, self.scrollbar_widget)
	UIRenderer.draw_widget(ui_renderer, self.host_text_button)
	UIRenderer.draw_widget(ui_renderer, self.level_text_button)
	UIRenderer.draw_widget(ui_renderer, self.difficulty_text_button)
	UIRenderer.draw_widget(ui_renderer, self.players_text_button)
	UIRenderer.draw_widget(ui_renderer, self.loading_overlay)
	UIRenderer.draw_widget(ui_renderer, self.loading_icon)
	UIRenderer.draw_widget(ui_renderer, self.loading_text)
	UIRenderer.end_pass(ui_renderer)

	return 
end
LobbyItemsList.sort_lobbies = function (self, lobbies, sort_func)
	table.sort(lobbies, sort_func)

	return 
end
LobbyItemsList.remove_invalid_lobbies = function (self, lobbies)
	local valid_lobbies = {}
	local num_lobbies = #lobbies

	for i = 1, num_lobbies, 1 do
		local lobby = lobbies[i]

		if lobby then
			valid_lobbies[#valid_lobbies + 1] = lobby
		end
	end

	return valid_lobbies
end
LobbyItemsList.populate_lobby_list = function (self, lobbies, ignore_scroll_reset)
	local settings = self.settings
	local item_list_widget = self.item_list_widget
	local list_content = {}
	local list_style = self.list_style
	local num_lobbies = 0
	local sort_func = self.sort_lobbies_function
	local selected_lobby = self.selected_lobby(self)
	local valid_lobbies = self.remove_invalid_lobbies(self, lobbies)

	if sort_func then
		self.sort_lobbies(self, valid_lobbies, sort_func)
	end

	for lobby_id, lobby_data in pairs(valid_lobbies) do
		local style = create_lobby_list_entry_style()
		local content = create_lobby_list_entry_content(lobby_data)

		if content then
			num_lobbies = num_lobbies + 1
			list_content[num_lobbies] = content
			list_style.item_styles[num_lobbies] = style

			if max_list_entries <= num_lobbies then
				break
			end
		end
	end

	self.lobbies = valid_lobbies
	self.number_of_items_in_list = num_lobbies
	item_list_widget.content.list_content = list_content
	item_list_widget.style.list_style = list_style
	item_list_widget.style.list_style.start_index = 1
	item_list_widget.style.list_style.num_draws = settings.num_list_items
	item_list_widget.element.pass_data[1].num_list_elements = nil
	local num_draws = item_list_widget.style.list_style.num_draws

	if num_lobbies < num_draws then
		local num_empty = num_draws - num_lobbies%num_draws

		if num_empty <= num_draws then
			for i = 1, num_empty, 1 do
				local content = create_empty_lobby_list_entry_content()
				local style = create_lobby_list_entry_style()
				local index = #list_content + 1
				list_content[index] = content
				list_style.item_styles[index] = style
			end
		end
	end

	self.set_scrollbar_length(self, nil, ignore_scroll_reset)

	self.selected_list_index = nil

	return 
end
LobbyItemsList.update_scroll = function (self)
	local scroll_bar_value = self.scrollbar_widget.content.scroll_bar_info.value
	local mouse_scroll_value = self.scroll_field_widget.content.internal_scroll_value
	local current_scroll_value = self.scroll_value

	if current_scroll_value ~= mouse_scroll_value then
		self.set_scroll_amount(self, mouse_scroll_value)
	elseif current_scroll_value ~= scroll_bar_value then
		self.set_scroll_amount(self, scroll_bar_value)
	end

	return 
end
LobbyItemsList.set_scroll_amount = function (self, value)
	local current_scroll_value = self.scroll_value

	if not current_scroll_value or value ~= current_scroll_value then
		local widget_scroll_bar_info = self.scrollbar_widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		self.scroll_field_widget.content.internal_scroll_value = value
		self.scroll_value = value

		self.scroll_inventory_list(self, value)
	end

	return 
end
LobbyItemsList.set_scrollbar_length = function (self, start_scroll_value, ignore_scroll_reset)
	local settings = self.settings
	local columns = settings.columns
	local total_inventory_slots = settings.num_list_items
	local number_of_items_in_list = self.number_of_items_in_list
	local item_diff_count = math.max(number_of_items_in_list - total_inventory_slots, 0)
	local scrollbar_content = self.scrollbar_widget.content
	local widget_scroll_bar_info = scrollbar_content.scroll_bar_info
	local bar_fraction = 0
	local step_fraction = 0

	if 0 < item_diff_count then
		local number_of_elements_per_step = (columns and columns) or 1
		local number_of_steps_possible = math.ceil(item_diff_count/number_of_elements_per_step)
		local number_of_steps_total = math.ceil(number_of_items_in_list/number_of_elements_per_step)
		local list_fraction = number_of_steps_total/1
		bar_fraction = list_fraction*number_of_steps_possible - 1
		step_fraction = number_of_steps_possible/1
	else
		bar_fraction = 1
		step_fraction = 1
	end

	widget_scroll_bar_info.bar_height_percentage = bar_fraction
	self.scroll_field_widget.content.scroll_step = step_fraction
	scrollbar_content.button_scroll_step = step_fraction

	if ignore_scroll_reset then
		local current_scroll_value = self.scroll_value
		self.scroll_value = nil

		self.set_scroll_amount(self, current_scroll_value or 0)
	else
		self.set_scroll_amount(self, start_scroll_value or 0)
	end

	return 
end
LobbyItemsList.scroll_inventory_list = function (self, value)
	local item_list_widget = self.item_list_widget

	if item_list_widget then
		local list_content = item_list_widget.content.list_content
		local list_style = item_list_widget.style.list_style
		local max_visible_elements = list_style.num_draws
		local column_count = list_style.columns
		local total_elements = #list_content

		if max_visible_elements and max_visible_elements < total_elements then
			local elements_to_scroll = total_elements - max_visible_elements
			local new_start_index = math.max(0, math.round(value*elements_to_scroll)) + 1

			if column_count and new_start_index%column_count == 0 then
				new_start_index = (new_start_index + column_count) - 1
			end

			list_style.start_index = new_start_index
		end
	end

	return 
end
LobbyItemsList.on_lobby_selected = function (self, index, play_sound)
	local item_list_widget = self.item_list_widget
	local list_content = item_list_widget.content.list_content
	local number_of_items_in_list = self.number_of_items_in_list

	if not number_of_items_in_list or number_of_items_in_list < 1 then
		return 
	end

	if play_sound then
		self.play_sound(self, self.item_select_sound_event)
	end

	if index and list_content[index] then
		for i = 1, #list_content, 1 do
			list_content[i].button_hotspot.is_selected = i == index
		end

		self.lobby_list_select_animation_time = 0
		self.selected_list_index = index
	end

	return 
end
LobbyItemsList.selected_lobby = function (self)
	local selected_list_index = self.selected_list_index

	if not selected_list_index then
		return 
	end

	local item_list_widget = self.item_list_widget
	local list_content = item_list_widget.content.list_content
	local selected_list_content = list_content[selected_list_index]

	if not selected_list_content then
		return 
	end

	return selected_list_content.lobby_data
end
LobbyItemsList.set_selected_lobby = function (self, selected_lobby_data)
	self.selected_list_index = nil
	local selected_lobby_id = selected_lobby_data.id
	local item_list_widget = self.item_list_widget
	local list_content = item_list_widget.content.list_content
	local number_of_items_in_list = self.number_of_items_in_list

	for i = 1, number_of_items_in_list, 1 do
		local content = list_content[i]
		local lobby_data = content.lobby_data
		local lobby_id = lobby_data.id

		if selected_lobby_id == lobby_id then
			self.on_lobby_selected(self, i, false)
		end
	end

	return 
end
LobbyItemsList.animate_element_by_time = function (self, target, destination_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, destination_index, from, to, time, math.easeInCubic)

	return new_animation
end
LobbyItemsList.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)

	return 
end

return 
