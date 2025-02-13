-- chunkname: @scripts/ui/hud_ui/versus_tab_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local PLAYER_PANEL_SIZE = {
	620,
	160,
}
local scenegraph_definition = {
	screen = {
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
		scale = not IS_WINDOWS and "hud_fit" or "fit",
	},
	level_name = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			400,
			60,
		},
		position = {
			0,
			-200,
			10,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "level_name",
		vertical_alignment = "center",
		size = {
			264,
			21,
		},
		position = {
			0,
			-40,
			0,
		},
	},
	sub_title = {
		horizontal_alignment = "center",
		parent = "title_divider",
		vertical_alignment = "center",
		size = {
			1600,
			60,
		},
		position = {
			0,
			-40,
			0,
		},
	},
	privacy_text = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1900,
			30,
		},
		position = {
			-10,
			-10,
			10,
		},
	},
	player_list_input_description = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1900,
			60,
		},
		position = {
			0,
			60,
			10,
		},
	},
	vs_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			500,
			50,
		},
		position = {
			0,
			0,
			10,
		},
	},
	talent_tooltip = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			400,
			0,
		},
		position = {
			0,
			0,
			20,
		},
	},
	item_tooltip = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			400,
			0,
		},
		position = {
			0,
			0,
			20,
		},
	},
	objective = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			544,
			55,
		},
		position = {
			0,
			-4,
			2,
		},
	},
	score = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			302.4,
			117.6,
		},
		position = {
			0,
			-60,
			10,
		},
	},
	console_cursor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			-10,
		},
	},
	team_1 = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			20,
			210,
			10,
		},
	},
	team_1_icon = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			232,
			196,
		},
		position = {
			-320,
			0,
			20,
		},
	},
	team_1_name = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			500,
			50,
		},
		position = {
			28,
			105,
			3,
		},
	},
	team_1_text = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			500,
			40,
		},
		position = {
			28,
			160,
			3,
		},
	},
	team_1_side_text = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = {
			500,
			40,
		},
		position = {
			28,
			40,
			3,
		},
	},
	team_1_score = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			200,
			120,
		},
		position = {
			-320,
			-60,
			3,
		},
	},
	team_1_player_panel_1 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			0,
			10,
		},
	},
	team_1_player_panel_2 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-170,
			10,
		},
	},
	team_1_player_panel_3 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-340,
			10,
		},
	},
	team_1_player_panel_4 = {
		horizontal_alignment = "left",
		parent = "team_1",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-510,
			10,
		},
	},
	team_1_player_frame_1 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_1",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_1_player_frame_2 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_2",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_1_player_frame_3 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_3",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_1_player_frame_4 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_4",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_1_player_insignia_1 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_1",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_1_player_insignia_2 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_2",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_1_player_insignia_3 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_3",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_1_player_insignia_4 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_4",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_1_player_ready_1 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_1",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_2 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_2",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_3 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_3",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_1_player_ready_4 = {
		horizontal_alignment = "left",
		parent = "team_1_player_panel_4",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			-80,
			0,
			1,
		},
	},
	team_2 = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-20,
			210,
			10,
		},
	},
	team_2_icon = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			232,
			196,
		},
		position = {
			320,
			0,
			20,
		},
	},
	team_2_name = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			500,
			50,
		},
		position = {
			-28,
			105,
			3,
		},
	},
	team_2_text = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			500,
			40,
		},
		position = {
			-28,
			160,
			3,
		},
	},
	team_2_side_text = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = {
			500,
			40,
		},
		position = {
			-28,
			40,
			3,
		},
	},
	team_2_score = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			200,
			120,
		},
		position = {
			320,
			-60,
			3,
		},
	},
	team_2_player_panel_1 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			0,
			10,
		},
	},
	team_2_player_panel_2 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-170,
			10,
		},
	},
	team_2_player_panel_3 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-340,
			10,
		},
	},
	team_2_player_panel_4 = {
		horizontal_alignment = "right",
		parent = "team_2",
		vertical_alignment = "top",
		size = PLAYER_PANEL_SIZE,
		position = {
			0,
			-510,
			10,
		},
	},
	team_2_player_frame_1 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_1",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_2_player_frame_2 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_2",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_2_player_frame_3 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_3",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_2_player_frame_4 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_4",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			128,
			69,
			3,
		},
	},
	team_2_player_insignia_1 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_1",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_2_player_insignia_2 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_2",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_2_player_insignia_3 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_3",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_2_player_insignia_4 = {
		horizontal_alignment = "left",
		parent = "team_2_player_panel_4",
		vertical_alignment = "bottom",
		position = {
			-275,
			0,
			3,
		},
	},
	team_2_player_ready_1 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_1",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_2 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_2",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_3 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_3",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	team_2_player_ready_4 = {
		horizontal_alignment = "right",
		parent = "team_2_player_panel_4",
		vertical_alignment = "center",
		size = {
			50,
			55,
		},
		position = {
			80,
			0,
			1,
		},
	},
	settings_container = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			480,
			560,
		},
		position = {
			0,
			-140,
			10,
		},
	},
	settings_anchor = {
		horizontal_alignment = "left",
		parent = "settings_container",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-10,
			100,
		},
	},
	custom_ruleset_text = {
		horizontal_alignment = "center",
		parent = "settings_container",
		vertical_alignment = "top",
		size = {
			480,
			30,
		},
		position = {
			0,
			40,
			1,
		},
	},
}
local level_name_style = {
	dynamic_font_size = false,
	font_size = 50,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_style = {
	dynamic_font_size = false,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_name_1_style = {
	font_size = 98,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("local_player_team_lighter", 255),
	offset = {
		0,
		0,
		0,
	},
}
local team_name_2_style = table.clone(team_name_1_style)

team_name_2_style.horizontal_alignment = "right"
team_name_2_style.text_color = Colors.get_color_table_with_alpha("opponent_team_lighter", 255)

local input_description_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		1,
	},
}
local vs_text_style = {
	font_size = 82,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_1_text_style = {
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("local_player_picking", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_2_text_style = table.clone(team_1_text_style)

team_2_text_style.horizontal_alignment = "right"
team_2_text_style.text_color = Colors.get_color_table_with_alpha("opponent_team", 255)

local team_1_side_text_style = {
	font_size = 38,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local team_2_side_text_style = table.clone(team_1_side_text_style)

team_2_side_text_style.horizontal_alignment = "right"

function create_empty_frame_widget(scenegraph_id)
	local shadow_frame_style = "shadow_frame_02"
	local shadow_frame_settings = UIFrameSettings[shadow_frame_style]
	local hover_frame_style = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_style]
	local empty_hover_frame_style = "frame_outer_glow_01"
	local empty_hover_frame_settings = UIFrameSettings[empty_hover_frame_style]
	local empty_frame_style = "frame_bevel_01"
	local empty_frame_settings = UIFrameSettings[empty_frame_style]

	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture_frame",
					style_id = "shadow_frame",
					texture_id = "shadow_frame",
					content_check_function = function (content)
						return content.empty
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return not content.empty and content.hotspot.is_hover
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "empty_hover",
					texture_id = "empty_hover",
					content_check_function = function (content)
						return content.empty and content.hotspot.is_hover
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "empty_frame",
					texture_id = "empty_frame",
					content_check_function = function (content)
						return content.empty
					end,
				},
			},
		},
		content = {
			empty = false,
			hotspot = {
				allow_multi_hover = true,
			},
			shadow_frame = shadow_frame_settings.texture,
			hover_frame = hover_frame_settings.texture,
			empty_hover = empty_hover_frame_settings.texture,
			empty_frame = empty_frame_settings.texture,
		},
		style = {
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
					255,
					255,
					255,
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
			empty_hover = {
				frame_margins = {
					-14,
					-14,
				},
				texture_size = empty_hover_frame_settings.texture_size,
				texture_sizes = empty_hover_frame_settings.texture_sizes,
				color = {
					255,
					151,
					151,
					151,
				},
				offset = {
					0,
					0,
					3,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

function create_settings_widget(scenegraph_id, data, ui_data, start_value, start_idx, setting_id, on_setting_changed_cb)
	local settings = data.values or {}
	local num_settings = #settings or 0
	local setting_name = "menu_settings_" .. data.setting_name
	local tooltip_text = "tooltip_" .. data.setting_name

	local function update_hotspot(content, style, dt)
		local parent = content.parent
		local hover_progress = content.hover_progress or 0
		local hover_speed = 15

		if content.is_hover then
			hover_progress = math.min(hover_progress + dt * hover_speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * hover_speed, 0)
		end

		content.hover_progress = hover_progress

		local press_progress = content.press_progress or 1
		local press_speed = 25

		if content.is_held then
			press_progress = math.max(press_progress - dt * press_speed, 0.5)
		else
			press_progress = math.min(press_progress + dt * press_speed, 1)
		end

		content.press_progress = press_progress
	end

	local function animate_button(content, style, hotspot, dt)
		local hover_progress = hotspot.hover_progress or 0
		local press_progress = hotspot.press_progress or 1

		style.color[1] = 255 * hover_progress

		if hotspot.is_hover then
			style.color[1] = 255 * press_progress
		end
	end

	local definition = {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "setting_name",
					text_id = "setting_name",
				},
				{
					pass_type = "texture",
					style_id = "setting_value_bg",
					texture_id = "setting_value_bg",
				},
				{
					pass_type = "text",
					style_id = "setting_value",
					text_id = "setting_value",
					content_change_function = function (content, style, _, dt)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_idx = content.setting_idx
						local new_value = values[setting_idx]

						if content.value ~= new_value then
							content.value = new_value

							local localization_options = ui_data and ui_data.localization_options
							local value_text = ""

							if localization_options and localization_options[new_value] then
								local text = localization_options[new_value]

								value_text = Localize(text)
							elseif type(content.value) == "number" and ui_data and ui_data.setting_type == "multiplier" then
								value_text = string.format("%.2f", content.value)
							else
								value_text = string.format("%s", content.value)
							end

							if (not localization_options or not localization_options[new_value]) and ui_data and ui_data.setting_type then
								local value_suffixes = DLCSettings.carousel and DLCSettings.carousel.custom_game_settigns_values_suffix

								if ui_data and value_suffixes and value_suffixes[ui_data.setting_type] then
									value_text = value_text .. value_suffixes[ui_data.setting_type]
								end
							end

							content.setting_value = value_text
						end

						if content.value ~= content.default_value then
							style.text_color = style.modified_color
						else
							style.text_color = style.default_color
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "divider",
				},
				{
					content_id = "setting_highlight_hotspot",
					pass_type = "hotspot",
					style_id = "setting_highlight_hotspot",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.hover_progress or 0
						local hover_speed = 15

						if content.is_hover or content.parent.is_gamepad_active and content.parent.focused and content.parent.is_selected then
							hover_progress = math.min(hover_progress + dt * hover_speed, 1)
						else
							hover_progress = math.max(hover_progress - dt * hover_speed, 0)
						end

						content.hover_progress = hover_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "setting_highlight",
					texture_id = "setting_highlight",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.setting_highlight_hotspot.hover_progress or 0

						style.color[1] = 255 * hover_progress
					end,
				},
				{
					pass_type = "option_tooltip",
					style_id = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (content, style)
						return content.setting_highlight_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			default_idx = 1,
			default_value = 0,
			divider = "rect_masked",
			setting_highlight = "party_selection_glow",
			setting_value_bg = "rect_masked",
			data = data,
			ui_data = ui_data,
			id = setting_id,
			name = data.setting_name,
			on_setting_changed_cb = on_setting_changed_cb,
			settings = settings,
			num_settings = num_settings,
			setting_idx = start_idx,
			setting_value = tostring(start_value),
			setting_name = setting_name,
			setting_highlight_hotspot = {
				allow_multi_hover = true,
			},
			tooltip_text = tooltip_text,
		},
		style = {
			setting_name = {
				font_size = 20,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					380,
					30,
				},
				area_size = {
					380,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					3,
				},
			},
			setting_value_bg = {
				masked = true,
				size = {
					128,
					30,
				},
				offset = {
					320,
					0,
					4,
				},
				color = Colors.get_color_table_with_alpha("black", 120),
			},
			setting_value = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					128,
					30,
				},
				area_size = {
					128,
					30,
				},
				modified_color = Colors.get_color_table_with_alpha("pale_golden_rod", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 180),
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					320,
					0,
					5,
				},
			},
			divider = {
				masked = true,
				size = {
					440,
					2,
				},
				offset = {
					0,
					-2,
					1,
				},
				color = Colors.get_color_table_with_alpha("gray", 100),
			},
			setting_highlight_hotspot = {
				size = {
					440,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			setting_highlight = {
				masked = true,
				texture_size = {
					440,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			tooltip_text = {
				font_size = 24,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					180,
					30,
				},
				area_size = {
					180,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			1,
		},
		scenegraph_id = scenegraph_id,
	}

	return definition
end

local widget_definitions = {
	level_name = UIWidgets.create_simple_text("level_name", "level_name", nil, nil, level_name_style),
	sub_title = UIWidgets.create_simple_text("sub_title", "sub_title", nil, nil, sub_title_style),
	background = UIWidgets.create_simple_rect("screen", {
		176,
		0,
		0,
		0,
	}),
	title_divider = UIWidgets.create_simple_texture("divider_01_top", "title_divider"),
	objective_text = UIWidgets.create_mission_objective_text_widget_still("objective"),
	score = UIWidgets.create_objective_score_widget("score", scenegraph_definition.score.size),
	team_1_name = UIWidgets.create_simple_text("", "team_1_name", nil, nil, team_name_1_style),
	team_1_icon = UIWidgets.create_simple_texture("banner_hammers_local", "team_1_icon"),
	team_1_text = UIWidgets.create_simple_text(Localize("vs_lobby_your_team"), "team_1_text", nil, nil, team_1_text_style),
	team_1_side_text = UIWidgets.create_simple_text("", "team_1_side_text", nil, nil, team_1_side_text_style),
	team_2_name = UIWidgets.create_simple_text("", "team_2_name", nil, nil, team_name_2_style),
	team_2_icon = UIWidgets.create_simple_texture("banner_skulls_opponent", "team_2_icon"),
	team_2_text = UIWidgets.create_simple_text(Localize("vs_lobby_enemy_team"), "team_2_text", nil, nil, team_2_text_style),
	team_2_side_text = UIWidgets.create_simple_text("", "team_2_side_text", nil, nil, team_2_side_text_style),
	input_description_text = UIWidgets.create_simple_text("player_list_show_mouse_description", "player_list_input_description", nil, nil, input_description_style),
}
local custom_ruleset_text_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local custom_game_settings_widgets = {
	settings_background = UIWidgets.create_rect_with_outer_frame("settings_container", scenegraph_definition.settings_container.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color, Colors.get_color_table_with_alpha("font_default", 125)),
	settings_mask = UIWidgets.create_simple_texture("mask_rect", "settings_container"),
	custom_ruleset_text = UIWidgets.create_simple_text(Localize("versus_custom_game_custom_ruleset"), "custom_ruleset_text", nil, nil, custom_ruleset_text_style),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeCubic(progress)

				params.render_settings.alpha_multiplier = anim_fraction
				ui_scenegraph.team_1.position[1] = scenegraph_definition.team_1.position[1] - (1 - anim_fraction) * 100
				ui_scenegraph.team_2.position[1] = scenegraph_definition.team_2.position[1] + (1 - anim_fraction) * 100
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	create_empty_frame_widget = create_empty_frame_widget,
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	custom_game_settings_widgets = custom_game_settings_widgets,
	create_settings_widget = create_settings_widget,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", UISettings.console_tooltip_pass_definitions),
}
