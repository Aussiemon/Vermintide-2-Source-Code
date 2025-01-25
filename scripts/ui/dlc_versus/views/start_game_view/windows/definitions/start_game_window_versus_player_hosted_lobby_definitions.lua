-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_player_hosted_lobby_definitions.lua

local MENU_BUTTON_FONT_SIZE = 24
local game_option_size = {
	520,
	194,
}
local team_panel_size = {
	480,
	80,
}
local player_panel_size = {
	480,
	100,
}
local team_area = {
	player_panel_size[1],
	30 + 4 * player_panel_size[2],
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	console_cursor = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			-10,
		},
		size = {
			1920,
			1080,
		},
	},
	settings_container = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			600,
			250,
		},
		position = {
			0,
			-600,
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "settings_container",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			0,
			game_option_size[2] + 200,
			1,
		},
	},
	button_controls = {
		horizontal_alignment = "center",
		parent = "settings_container",
		vertical_alignment = "bottom",
		size = {
			490,
			140,
		},
		position = {
			0,
			-230,
			1,
		},
	},
	force_start_button = {
		horizontal_alignment = "left",
		parent = "button_controls",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			60,
			25,
			1,
		},
	},
	locked_reason = {
		horizontal_alignment = "left",
		parent = "button_controls",
		vertical_alignment = "top",
		size = {
			490,
			140,
		},
		position = {
			0,
			40,
			1,
		},
	},
	settings_button = {
		horizontal_alignment = "left",
		parent = "button_controls",
		vertical_alignment = "top",
		size = {
			490,
			70,
		},
		position = {
			0,
			-170,
			1,
		},
	},
	leave_game_button = {
		horizontal_alignment = "center",
		parent = "team_1_panel",
		vertical_alignment = "bottom",
		size = {
			390,
			70,
		},
		position = {
			0,
			-625,
			1,
		},
	},
	lobby_name = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			825,
			119,
		},
		position = {
			0,
			-100,
			1,
		},
	},
	team_1 = {
		horizontal_alignment = "left",
		parent = "menu_root",
		vertical_alignment = "center",
		size = team_area,
		position = {
			100,
			0,
			10,
		},
	},
	team_1_panel = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = team_panel_size,
		position = {
			0,
			90,
			3,
		},
	},
	team_1_player_panel = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = player_panel_size,
		position = {
			0,
			-150 * 0,
			10,
		},
	},
	team_2 = {
		horizontal_alignment = "right",
		parent = "menu_root",
		vertical_alignment = "center",
		size = team_area,
		position = {
			-100,
			0,
			10,
		},
	},
	team_2_panel = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = team_panel_size,
		position = {
			0,
			90,
			3,
		},
	},
	team_2_player_panel = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = player_panel_size,
		position = {
			0,
			-150 * 0,
			10,
		},
	},
	toggle_settings_button = {
		horizontal_alignment = "left",
		parent = "settings_container",
		vertical_alignment = "top",
		size = {
			600,
			36,
		},
		position = {
			0,
			200,
			1,
		},
	},
}
local check_box_tooltip_data = {
	title = Localize("start_game_window_other_options_private"),
	description = Localize("start_game_window_other_options_private_description"),
}

local function create_team_widget(scenegraph_id, team_definition, team_color)
	return {
		scenegraph_id = scenegraph_id,
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "team_name",
					text_id = "team_name",
				},
				{
					pass_type = "text",
					style_id = "team_name_shadow",
					text_id = "team_name",
				},
				{
					pass_type = "text",
					style_id = "player_count",
					text_id = "player_count",
				},
				{
					pass_type = "texture",
					style_id = "team_icon_bg",
					texture_id = "team_icon_bg",
				},
				{
					pass_type = "texture",
					style_id = "team_icon",
					texture_id = "team_icon",
				},
			},
		},
		content = {
			player_count = "n/a",
			team_name = Localize(team_definition.display_name),
			team_icon_bg = team_definition.background_texture,
			team_icon = team_definition.team_icon,
			styles_with_team_color = {
				"team_name",
				"team_icon",
				"team_icon_bg",
			},
		},
		style = {
			team_name = {
				font_size = 48,
				font_type = "hell_shark_header",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "top",
				text_color = team_color,
				offset = {
					90,
					0,
					1,
				},
			},
			team_name_shadow = {
				font_size = 48,
				font_type = "hell_shark_header",
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "top",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					91,
					-1,
					0,
				},
			},
			player_count = {
				font_size = 24,
				font_type = "hell_shark",
				use_shadow = true,
				vertical_alignment = "top",
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					94,
					-48,
					1,
				},
			},
			team_icon_bg = {
				vertical_alignment = "top",
				texture_size = {
					80,
					80,
				},
				color = team_color,
			},
			team_icon = {
				vertical_alignment = "top",
				texture_size = {
					80,
					80,
				},
				color = team_color,
				offset = {
					0,
					0,
					1,
				},
			},
		},
	}
end

local settings_container_widget, create_setting_widget

settings_container_widget = {
	scenegraph_id = "settings_container",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "divider",
				texture_id = "divider",
			},
		},
	},
	content = {
		divider = "popup_divider",
	},
	style = {
		divider = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				379,
				8,
			},
			offset = {
				0,
				0,
				0,
			},
		},
	},
}

local locked_reason_style = {
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		255,
		62,
		62,
	},
	offset = {
		0,
		0,
		2,
	},
}
local disable_with_gamepad = true
local lobby_name = {
	scenegraph_id = "lobby_name",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "background",
				texture_id = "background",
				content_change_function = function (content, style)
					style.color[1] = content.input.active and 255 or 127
				end,
			},
			{
				pass_type = "texture",
				style_id = "top_detail_bar",
				texture_id = "detail_bar",
			},
			{
				pass_type = "texture",
				style_id = "bottom_detail_bar",
				texture_id = "detail_bar",
			},
			{
				pass_type = "texture",
				style_id = "top_center",
				texture_id = "top_center",
			},
			{
				pass_type = "texture",
				style_id = "top_detail",
				texture_id = "top_detail",
			},
			{
				pass_type = "texture",
				style_id = "top_detail_glow",
				texture_id = "top_detail_glow",
				content_check_function = function (content, style)
					return content.input.active
				end,
			},
			{
				pass_type = "texture",
				style_id = "bottom_center",
				texture_id = "bottom_center",
			},
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "input",
				input_text_id = "text",
				pass_type = "keystrokes",
			},
			{
				content_id = "input",
				pass_type = "text",
				style_id = "default_text",
				text_id = "default_text",
				content_check_function = function (content)
					return content.text == ""
				end,
			},
			{
				content_id = "input",
				pass_type = "text",
				style_id = "input_text",
				text_id = "text",
				content_change_function = function (content, style)
					local alpha = 0

					if content.active then
						alpha = 127 + 128 * math.sin(5 * Managers.time:time("ui"))
					end

					style.caret_color[1] = alpha
				end,
			},
		},
	},
	content = {
		background = "mission_objective_bg",
		bottom_center = "mission_objective_02",
		default_text = "Test 1",
		detail_bar = "mission_objective_05",
		top_center = "mission_objective_04",
		top_detail = "mission_objective_01",
		top_detail_glow = "mission_objective_glow_02",
		hotspot = {},
		input = {
			caret_index = 1,
			input_mode = "insert",
			max_length = 32,
			text = "",
			text_index = 1,
		},
	},
	style = {
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				-1,
			},
			texture_size = {
				825,
				90,
			},
		},
		top_center = {
			masked = false,
			texture_size = {
				54,
				22,
			},
			offset = {
				385.5,
				90,
				5,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		top_detail = {
			masked = false,
			texture_size = {
				54,
				22,
			},
			offset = {
				385.5,
				90,
				6,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		top_detail_glow = {
			masked = false,
			texture_size = {
				54,
				22,
			},
			offset = {
				385.5,
				90,
				7,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		bottom_center = {
			masked = false,
			texture_size = {
				54,
				22,
			},
			offset = {
				385.5,
				10,
				5,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		top_detail_bar = {
			masked = false,
			texture_size = {
				544,
				5,
			},
			offset = {
				140.5,
				100,
				2,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		bottom_detail_bar = {
			masked = false,
			texture_size = {
				544,
				5,
			},
			offset = {
				140.5,
				14,
				2,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		default_text = {
			dynamic_font = false,
			font_size = 46,
			font_type = "hell_shark_arial",
			horizontal_alignment = "center",
			horizontal_scroll = true,
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("dim_gray", 255),
			offset = {
				0,
				0,
				0,
			},
			area_size = {
				825,
				90,
			},
		},
		input_text = {
			dynamic_font = false,
			font_size = 46,
			font_type = "hell_shark_arial",
			horizontal_alignment = "center",
			horizontal_scroll = true,
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				1,
			},
			area_size = {
				825,
				90,
			},
			caret_size = {
				2,
				46,
			},
			caret_offset = {
				0,
				-8,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
	},
}
local widget_definitions = {
	mission_setting = UIWidgets.create_start_game_console_setting_button("game_option_1", Localize("start_game_window_mission"), nil, nil, nil, scenegraph_definition.game_option_1.size),
	team_1 = create_team_widget("team_1_panel", UISettings.teams_ui_assets.team_hammers, Colors.get_color_table_with_alpha("local_player_team_lighter", 255)),
	team_2 = create_team_widget("team_2_panel", UISettings.teams_ui_assets.team_skulls, Colors.get_color_table_with_alpha("opponent_team_lighter", 255)),
	toggle_custom_settings_button = UIWidgets.create_default_checkbox_button_console("toggle_settings_button", scenegraph_definition.toggle_settings_button.size, Localize("start_game_window_toggle_custom_setting"), 24, check_box_tooltip_data, "menu_frame_03_morris"),
	lobby_name = lobby_name,
	leave_game_button = UIWidgets.create_default_button("leave_game_button", scenegraph_definition.leave_game_button.size, nil, nil, Localize("exit"), MENU_BUTTON_FONT_SIZE, nil, nil, nil, disable_with_gamepad),
}
local host_widget_definitions = {
	force_start_button = UIWidgets.create_icon_and_name_button("force_start_button", "options_button_icon_quickplay", Localize("input_description_play")),
	locked_reason = UIWidgets.create_simple_text("tutorial_no_text", "locked_reason", nil, nil, locked_reason_style),
}

local function is_empty(content)
	return content.empty
end

local function is_not_empty(content)
	return not content.empty
end

local function create_player_panel_widget(team_index, player_index)
	local scenegraph_id = "team_" .. team_index .. "_player_panel"
	local size = scenegraph_definition[scenegraph_id].size
	local frame_settings = UIFrameSettings.button_frame_02
	local shadow_frame_settings = UIFrameSettings.shadow_frame_02
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_04
	local empty_hover_frame_settings = UIFrameSettings.frame_outer_glow_01
	local empty_frame_settings = UIFrameSettings.frame_bevel_01
	local team_color = team_index == 1 and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local insignia_scale_factor = size[2] / 138
	local insignia_texture_size = {
		50 * insignia_scale_factor,
		138 * insignia_scale_factor,
	}

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			-120 * (player_index - 1),
			0,
		},
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rect",
					style_id = "empty_background",
					content_check_function = is_empty,
				},
				{
					pass_type = "texture_frame",
					style_id = "empty_hover_frame",
					texture_id = "empty_hover_frame",
					content_check_function = function (content)
						return content.empty and content.button_hotspot.is_hover or content.is_gamepad_active and content.empty and content.is_selected
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "empty_frame",
					texture_id = "empty_frame",
					content_check_function = is_empty,
				},
				{
					pass_type = "text",
					style_id = "open_slot_text",
					text_id = "open_slot_text",
					content_check_function = is_empty,
				},
				{
					pass_type = "text",
					style_id = "open_slot_text_shadow",
					text_id = "open_slot_text",
					content_check_function = is_empty,
				},
				{
					pass_type = "rect",
					style_id = "background",
					content_check_function = is_not_empty,
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return not content.empty and content.button_hotspot.is_hover or content.is_gamepad_active and not content.empty and content.is_selected
					end,
					content_change_function = function (content, style, _, dt)
						local focused = content.focused

						style.color[1] = focused and 150 + 105 * math.sin(Managers.time:time("ui") * 7.5) or 255
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = is_not_empty,
				},
				{
					pass_type = "texture_frame",
					style_id = "shadow_frame",
					texture_id = "shadow_frame",
					content_check_function = is_not_empty,
				},
				{
					pass_type = "texture",
					style_id = "player_avatar",
					texture_id = "player_avatar",
					content_check_function = function (content)
						return not content.empty and content.player_avatar
					end,
				},
				{
					pass_type = "texture",
					style_id = "host_texture",
					texture_id = "host_texture",
					content_check_function = function (content)
						return not content.empty and content.show_host
					end,
				},
				{
					pass_type = "text",
					style_id = "player_name",
					text_id = "player_name",
					content_check_function = is_not_empty,
				},
				{
					pass_type = "text",
					style_id = "player_level",
					text_id = "player_level",
					content_check_function = is_not_empty,
				},
				{
					content_id = "insignia_main",
					pass_type = "texture_uv",
					style_id = "insignia_main",
					content_check_function = function (content)
						return not content.parent.empty
					end,
				},
				{
					content_id = "insignia_addon",
					pass_type = "texture_uv",
					style_id = "insignia_addon",
					content_check_function = function (content)
						return not content.parent.empty and content.uvs
					end,
				},
				{
					pass_type = "rect",
					style_id = "party_color",
					content_check_function = is_not_empty,
				},
				{
					pass_type = "rect",
					style_id = "kick_button_background",
					content_check_function = function (content, style)
						return content.show_kick_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "kick_button_frame",
					texture_id = "button_frame",
					content_check_function = function (content, style)
						return content.show_kick_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "kick_button_hotspot",
					texture_id = "kick_button_texture",
					content_check_function = function (content, style)
						return content.show_kick_button
					end,
				},
				{
					content_id = "kick_button_hotspot",
					pass_type = "hotspot",
					style_id = "kick_button_hotspot",
					content_check_function = function (content)
						return content.parent.show_kick_button and not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "kick_tooltip_text",
					content_check_function = function (content)
						return content.show_kick_button and content.kick_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "chat_button_background",
					texture_id = "chat_button_texture",
					content_check_function = function (content)
						return content.show_chat_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "chat_button_frame",
					texture_id = "button_frame",
					content_check_function = function (content)
						return content.show_chat_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "chat_button_hotspot",
					texture_id = "chat_button_texture",
					content_check_function = function (content)
						return content.show_chat_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "chat_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected
					end,
				},
				{
					content_id = "chat_button_hotspot",
					pass_type = "hotspot",
					style_id = "chat_button_hotspot",
					content_check_function = function (content)
						return content.parent.show_chat_button and not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_chat_button and not content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "profile_button_background",
					content_check_function = function (content)
						return content.show_profile_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "profile_button_frame",
					texture_id = "button_frame",
					content_check_function = function (content)
						return content.show_profile_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "profile_button_hotspot",
					texture_id = "profile_button_texture",
					content_check_function = function (content)
						return content.show_profile_button
					end,
				},
				{
					content_id = "profile_button_hotspot",
					pass_type = "hotspot",
					style_id = "profile_button_hotspot",
					content_check_function = function (content)
						return content.parent.show_profile_button and not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "profile_tooltip_text",
					content_check_function = function (content)
						return content.show_profile_button and content.profile_button_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			button_frame = "reward_pop_up_item_frame",
			chat_button_texture = "tab_menu_icon_02",
			chat_tooltip_text_mute = "input_description_mute_chat",
			chat_tooltip_text_unmute = "input_description_unmute_chat",
			disabled_texture = "tab_menu_icon_03",
			empty = true,
			host_texture = "host_icon",
			is_local_player = false,
			kick_button_texture = "tab_menu_icon_04",
			kick_tooltip_text = "input_description_vote_kick_player",
			player_level = "*Level 0",
			player_name = "*Missing Name",
			profile_button_texture = "tab_menu_icon_05",
			profile_tooltip_text = "input_description_show_profile",
			show_chat_button = false,
			show_kick_button = false,
			show_ping = false,
			show_profile_button = false,
			voice_button_texture = "tab_menu_icon_01",
			voice_tooltip_text_mute = "input_description_mute_voice",
			voice_tooltip_text_unmute = "input_description_unmute_voice",
			button_hotspot = {
				allow_multi_hover = true,
			},
			frame = frame_settings.texture,
			shadow_frame = shadow_frame_settings.texture,
			hover_frame = hover_frame_settings.texture,
			empty_hover_frame = empty_hover_frame_settings.texture,
			empty_frame = empty_frame_settings.texture,
			open_slot_text = Localize("vs_lobby_slot_available"),
			chat_button_hotspot = {},
			kick_button_hotspot = {},
			voice_button_hotspot = {},
			profile_button_hotspot = {},
			styles_with_team_color = {
				"player_name",
			},
			insignia_main = {
				texture_id = "insignias_main_small",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			insignia_addon = {
				texture_id = "insignias_addon_small",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			empty_background = {
				color = {
					80,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			empty_frame = {
				texture_size = empty_frame_settings.texture_size,
				texture_sizes = empty_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			shadow_frame = {
				frame_margins = {
					-14,
					-14,
				},
				texture_size = shadow_frame_settings.texture_size,
				texture_sizes = shadow_frame_settings.texture_sizes,
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			hover_frame = {
				frame_margins = {
					-14,
					-14,
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			empty_hover_frame = {
				frame_margins = {
					-14,
					-14,
				},
				texture_size = empty_hover_frame_settings.texture_size,
				texture_sizes = empty_hover_frame_settings.texture_sizes,
				color = {
					255,
					100,
					100,
					100,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			background = {
				color = {
					127,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			open_slot_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					60,
					60,
					60,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			open_slot_text_shadow = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					2,
					-2,
					1,
				},
			},
			player_avatar = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					size[2] - 6,
					size[2] - 6,
				},
				offset = {
					20 + insignia_texture_size[1],
					0,
					1,
				},
			},
			host_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				offset = {
					-15,
					-5,
					2,
				},
				texture_size = {
					40,
					40,
				},
			},
			player_name = {
				font_size = 22,
				font_type = "arial",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = team_color,
				offset = {
					120 + insignia_texture_size[1],
					-20,
					2,
				},
			},
			player_level = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					120 + insignia_texture_size[1],
					-50,
					2,
				},
			},
			insignia_main = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = insignia_texture_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					0,
					3,
				},
			},
			insignia_addon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = insignia_texture_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					0,
					2,
				},
			},
			party_color = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				texture_size = {
					5,
					size[2] - 10,
				},
				color = {
					255,
					255,
					0,
					255,
				},
				offset = {
					-5,
					0,
					5,
				},
			},
			tooltip_text = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					20,
				},
			},
			profile_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-20 + 0 * -50,
					10,
					11,
				},
			},
			profile_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-20 + 0 * -50,
					10,
					13,
				},
			},
			profile_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-20 + 0 * -50,
					10,
					12,
				},
			},
			voice_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-120,
					10,
					13,
				},
			},
			voice_chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-120,
					10,
					16,
				},
			},
			voice_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-120,
					10,
					14,
				},
			},
			voice_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					-120,
					10,
					15,
				},
			},
			chat_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-70,
					10,
					11,
				},
			},
			chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-70,
					10,
					16,
				},
			},
			chat_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-70,
					10,
					14,
				},
			},
			chat_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					-70,
					10,
					15,
				},
			},
			kick_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-120,
					10,
					13,
				},
			},
			kick_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-120,
					10,
					16,
				},
			},
			kick_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-120,
					10,
					14,
				},
			},
			ping_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					54,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-210,
					5,
					15,
				},
			},
			ping_text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				offset = {
					-255,
					13,
					3,
				},
				text_color = Colors.get_table("font_default"),
				high_ping_color = Colors.get_table("crimson"),
				medium_ping_color = Colors.get_table("gold"),
				low_ping_color = Colors.get_table("lime_green"),
			},
		},
	}
end

local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.5,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				local roll = math.random() < 0.01

				params.ease = roll and math.ease_out_elastic or math.easeOutCubic
				params.offset = roll and 100 or 200

				local s = params.offset

				ui_scenegraph.team_1.position[1] = scenegraph_def.team_1.position[1] - s
				ui_scenegraph.team_2.position[1] = scenegraph_def.team_2.position[1] + s
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local t = params.ease(progress)
				local s = (1 - t) * params.offset

				ui_scenegraph.team_1.position[1] = scenegraph_def.team_1.position[1] - s
				ui_scenegraph.team_2.position[1] = scenegraph_def.team_2.position[1] + s
				ui_scenegraph.leave_game_button.position[1] = scenegraph_def.leave_game_button.position[1] + s
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
		},
	},
}

return {
	create_player_panel_widget = create_player_panel_widget,
	loading_spinner_definition = UIWidgets.create_loading_spinner("menu_root"),
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	host_widget_definitions = host_widget_definitions,
}
