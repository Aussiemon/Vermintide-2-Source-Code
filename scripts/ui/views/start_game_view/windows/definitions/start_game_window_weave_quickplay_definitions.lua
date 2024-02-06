﻿-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_quickplay_definitions.lua

local window_default_settings = UISettings.game_start_windows
local large_window_size = window_default_settings.large_window_size
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_size = {
	large_window_size[1] - window_frame_width * 2,
	large_window_size[2] - window_frame_width * 2,
}
local game_option_size = {
	window_size[1],
	194,
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
	parent_window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = large_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	window = {
		horizontal_alignment = "right",
		parent = "parent_window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			-window_frame_width,
			0,
			1,
		},
	},
	difficulty_selected = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			150,
			150,
		},
		position = {
			0,
			220,
			2,
		},
	},
	difficulty_selected_effect = {
		horizontal_alignment = "center",
		parent = "difficulty_selected",
		vertical_alignment = "center",
		size = {
			300,
			300,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	difficulty_title = {
		horizontal_alignment = "center",
		parent = "difficulty_selected",
		vertical_alignment = "bottom",
		size = {
			600,
			50,
		},
		position = {
			0,
			-60,
			1,
		},
	},
	difficulty_description = {
		horizontal_alignment = "center",
		parent = "difficulty_title",
		vertical_alignment = "top",
		size = {
			600,
			100,
		},
		position = {
			0,
			-60,
			1,
		},
	},
	difficulty_option = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			160,
			160,
		},
		position = {
			0,
			-200,
			1,
		},
	},
	play_button_console = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			0,
			-30,
			1,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			400,
			72,
		},
		position = {
			0,
			25,
			20,
		},
	},
}
local difficulty_title_text_style = {
	dynamic_font_size = true,
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	font_size = not IS_WINDOWS and 28 or 20,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}

function create_play_button(scenegraph_id, size, text, font_size, disable_with_gamepad, tooltip_info)
	local button_color_name
	local optional_color_name = "green"

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_08
	local side_detail_glow = "button_detail_05_glow"
	local side_detail_glow_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_glow)
	local side_detail_glow_size = side_detail_glow_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					content_id = "hover_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_right",
					texture_id = "side_detail_right",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "side_detail_left",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_right_disabled",
					texture_id = "side_detail_right",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_left_disabled",
					texture_id = "side_detail_left",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail_glow",
					pass_type = "texture_uv",
					style_id = "side_detail_glow_right",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail_glow",
					pass_type = "texture",
					style_id = "side_detail_glow_left",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture",
					style_id = "effect",
					texture_id = "effect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					additional_option_id = "cancel_matchmaking_tooltip",
					content_id = "hover_hotspot",
					pass_type = "additional_option_tooltip",
					style_id = "cancel_matchmaking_tooltip",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return content.is_hover and button_hotspot.disable_button
					end,
				},
			},
		},
		content = {
			effect = "play_button_passive_glow",
			glass_top = "button_glass_01",
			glow = "button_state_normal_green",
			hover_glow = "button_state_hover_green",
			side_detail_left = "button_detail_05_left",
			side_detail_right = "button_detail_05_right",
			side_detail_glow = {
				uvs = {
					{
						1,
						0,
					},
					{
						0,
						1,
					},
				},
				texture_id = side_detail_glow,
			},
			button_hotspot = {},
			hover_hotspot = {
				cancel_matchmaking_tooltip = tooltip_info,
			},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			disable_with_gamepad = disable_with_gamepad,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = background_color,
				offset = {
					0,
					0,
					0,
				},
				size = {
					size[1],
					size[2],
				},
			},
			clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
				size = {
					size[1],
					size[2],
				},
			},
			disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					7,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					9,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					9,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					8,
				},
				size = {
					size[1],
					size[2],
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
					8,
				},
				size = {
					size[1],
					size[2],
				},
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					1,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 4,
					6,
				},
				size = {
					size[1],
					5,
				},
			},
			glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					3,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			effect = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					5,
				},
				size = {
					size[1],
					size[2],
				},
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_left_disabled = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					0,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_right_disabled = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_glow_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10,
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2],
				},
			},
			side_detail_glow_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_glow_size[1],
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10,
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2],
				},
			},
			cancel_matchmaking_tooltip = {
				horizontal_alignment = "center",
				max_width = 400,
				vertical_alignment = "top",
				offset = {
					0,
					0,
					0,
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

local function create_difficulty_button(scenegraph_id, size, background_icon, background_icon_unlit, background_texture, dlc_locked)
	local dynamic_font_size = true
	local icon_name = "difficulty_option_1"
	local icon_scale = 0.6
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_name)
	local icon_size = {
		math.floor(icon_settings.size[1] * icon_scale),
		math.floor(icon_settings.size[2] * icon_scale),
	}
	local background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local new_frame_name = "frame_outer_glow_01"
	local new_frame_settings = UIFrameSettings[new_frame_name]
	local new_frame_width = new_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "glass_texture",
					texture_id = "glass_texture",
				},
				{
					pass_type = "texture",
					style_id = "background_glow",
					texture_id = "background_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "select_edge",
					texture_id = "background_glow",
				},
				{
					pass_type = "texture",
					style_id = "select_texture",
					texture_id = "select_texture",
				},
				{
					pass_type = "texture",
					style_id = "dlc_locked_texture",
					texture_id = "dlc_locked_texture",
					content_check_function = function (content)
						return content.dlc_locked
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
			},
		},
		content = {
			background = "weaves_select_level_background",
			background_glow = "weaves_select_level_glow",
			dlc_locked_texture = "hero_icon_locked",
			glass_texture = "weaves_select_level_gloss",
			select_texture = "weave_difficulty_select_effect",
			title_text = "n/a",
			icon = icon_name,
			button_hotspot = {},
			dlc_locked = dlc_locked,
		},
		style = {
			background = {
				color = {
					30,
					138,
					0,
					187,
				},
				offset = {
					0,
					0,
					0,
				},
				size = size,
			},
			glass_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					150,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
				texture_size = size,
			},
			select_edge = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					193,
					161,
					116,
				},
				offset = {
					0,
					0,
					5,
				},
				texture_size = size,
			},
			background_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					138,
					0,
					187,
				},
				offset = {
					0,
					0,
					3,
				},
				texture_size = size,
			},
			select_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					38,
					0,
				},
				texture_size = {
					200,
					300,
				},
			},
			dlc_locked_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				color = {
					204,
					255,
					255,
					255,
				},
				texture_size = {
					60,
					70,
				},
				offset = {
					-100,
					0,
					4,
				},
			},
			title_text = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-30,
					6,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_disabled = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-30,
					6,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_shadow = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-32,
					5,
				},
				size = {
					size[1],
					size[2],
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("white", 255),
				default_color = Colors.get_color_table_with_alpha("white", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = icon_size,
				offset = {
					0,
					0,
					1,
				},
			},
			icon_disabled = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					40,
					40,
					40,
				},
				default_color = {
					255,
					40,
					40,
					40,
				},
				select_color = {
					255,
					40,
					40,
					40,
				},
				texture_size = icon_size,
				offset = {
					0,
					0,
					2,
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

	return widget
end

function create_start_game_console_play_button(scenegraph_id, text)
	local passes = {}
	local content = {}
	local style = {}
	local text_name = "text"
	local text_name_shadow = text_name .. "_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name,
		content_change_function = function (content, style)
			if content.locked then
				style.text_color = style.disabled_color
			else
				style.text_color = style.normal_color
			end
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name_shadow,
	}
	content[text_name] = text

	local text_offset = {
		0,
		6,
		1,
	}
	local text_style = {
		font_size = 48,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		localize = false,
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		disabled_color = Colors.get_color_table_with_alpha("dark_gray", 255),
		normal_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			text_offset[1],
			text_offset[2],
			text_offset[3],
		},
	}
	local text_shadow_style = table.clone(text_style)

	text_shadow_style.text_color = {
		255,
		0,
		0,
		0,
	}
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1,
	}
	style[text_name] = text_style
	style[text_name_shadow] = text_shadow_style

	local divider_name = "divider"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = divider_name,
		style_id = divider_name,
	}
	content[divider_name] = "divider_01_top"
	style[divider_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			264,
			32,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			0,
			-36,
			1,
		},
	}

	local input_texture_name = "input_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = input_texture_name,
		style_id = input_texture_name,
		content_change_function = function (content, style)
			if content.locked then
				style.saturated = true
			else
				style.saturated = false
			end
		end,
	}
	content[input_texture_name] = ""
	style[input_texture_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			64,
			64,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			0,
			-34,
			2,
		},
	}

	local glow_name = "glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = glow_name,
		style_id = glow_name,
		content_check_function = function (content)
			return not content.locked
		end,
	}
	content[glow_name] = "play_glow_mask"
	style[glow_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			256,
			126,
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			33,
			-1,
		},
	}

	local widget = {}

	widget.element = {
		passes = passes,
	}
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local disable_with_gamepad = true
local widgets = {
	difficulty_title = UIWidgets.create_simple_text("n/a", "difficulty_title", nil, nil, difficulty_title_text_style),
	difficulty_description = UIWidgets.create_simple_text("n/a", "difficulty_description", nil, nil, difficulty_description_text_style),
	difficulty_selected = UIWidgets.create_simple_texture("icons_placeholder", "difficulty_selected"),
	difficulty_selected_effect = UIWidgets.create_simple_texture("weave_difficulty_highlight_effect", "difficulty_selected_effect", nil, nil, {
		255,
		138,
		0,
		187,
	}),
	play_button = create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad, {
		title = Localize("start_game_weave_disabled_tooltip_title"),
		description = Localize("start_game_weave_disabled_tooltip_description"),
	}, disable_with_gamepad),
	play_button_console = create_start_game_console_play_button("play_button_console", Localize("start_game_window_play")),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	create_difficulty_button = create_difficulty_button,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
