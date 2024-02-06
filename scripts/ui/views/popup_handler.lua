﻿-- chunkname: @scripts/ui/views/popup_handler.lua

require("scripts/managers/input/mock_input_manager")
require("scripts/settings/ui_settings")
require("scripts/helpers/ui_atlas_helper")
require("scripts/helpers/ui_widget_utils")
require("scripts/helpers/ui_utils")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.popup + 1,
		},
		size = {
			1920,
			1080,
		},
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.popup,
		},
		size = {
			1920,
			1080,
		},
	},
	popup_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			100,
			1,
		},
		size = {
			800,
			610,
		},
	},
	title_box = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "top",
		size = {
			700,
			100,
		},
		position = {
			0,
			-20,
			40,
		},
	},
	popup_password_box = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			600,
			50,
		},
	},
	popup_password_input = {
		horizontal_alignment = "center",
		parent = "popup_password_box",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			580,
			40,
		},
	},
	popup_password_text = {
		horizontal_alignment = "center",
		parent = "popup_password_box",
		vertical_alignment = "bottom",
		position = {
			0,
			50,
			2,
		},
		size = {
			520,
			200,
		},
	},
	popup_text_box = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "top",
		position = {
			0,
			-120,
			1,
		},
		size = {
			700,
			340,
		},
	},
	popup_text = {
		horizontal_alignment = "center",
		parent = "popup_text_box",
		vertical_alignment = "top",
		position = {
			0,
			-35,
			2,
		},
		size = {
			520,
			260,
		},
	},
	buttons_root = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "bottom",
		position = {
			0,
			83,
			1,
		},
		size = {
			1,
			1,
		},
	},
	button_1_1 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			270,
			70,
		},
	},
	button_2_1 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			-170,
			0,
			1,
		},
		size = {
			270,
			70,
		},
	},
	button_2_2 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			170,
			0,
			1,
		},
		size = {
			270,
			70,
		},
	},
	button_3_1 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			-200,
			18,
			1,
		},
		size = {
			270,
			70,
		},
	},
	button_3_2 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			0,
			-15,
			1,
		},
		size = {
			270,
			70,
		},
	},
	button_3_3 = {
		horizontal_alignment = "center",
		parent = "buttons_root",
		vertical_alignment = "center",
		position = {
			200,
			18,
			1,
		},
		size = {
			270,
			70,
		},
	},
	timer = {
		horizontal_alignment = "right",
		parent = "popup_root",
		vertical_alignment = "top",
	},
	center_timer = {
		horizontal_alignment = "center",
		parent = "popup_text_box",
		vertical_alignment = "bottom",
		position = {
			0,
			20,
			1,
		},
		size = {
			700,
			30,
		},
	},
}

local function create_default_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_11
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "background_fade",
			texture_id = "background_fade",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
		{
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text_field",
		},
		{
			pass_type = "text",
			style_id = "timer",
			text_id = "timer_field",
		},
		{
			pass_type = "text",
			style_id = "timer_shadow",
			text_id = "timer_field",
		},
		{
			pass_type = "text",
			style_id = "center_timer",
			text_id = "center_timer_field",
		},
		{
			pass_type = "text",
			style_id = "center_timer_shadow",
			text_id = "center_timer_field",
		},
	}
	local content = {
		background_fade = "options_window_fade_01",
		background_tint = "gradient_dice_game_reward",
		center_timer_field = "",
		text_field = "",
		text_start_offset = 0,
		timer_field = "",
		title_text = "",
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
	}
	local style = {
		background = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		background_fade = {
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "popup_text_box",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		inner_frame = {
			scenegraph_id = "popup_text_box",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				4,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				0,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		title_text = {
			dynamic_font = true,
			dynamic_font_size = true,
			font_size = 50,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "title_box",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		title_text_shadow = {
			dynamic_font = true,
			dynamic_font_size = true,
			font_size = 50,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "title_box",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
		text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_text",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		text_shadow = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_text",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
		timer = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				320,
				203,
				8,
			},
		},
		timer_shadow = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				322,
				201,
				7,
			},
		},
		center_timer = {
			dynamic_font = true,
			font_size = 44,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "center_timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		center_timer_shadow = {
			dynamic_font = true,
			font_size = 44,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "center_timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
	}

	widget.element.passes = passes
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

local function create_password_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_11
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local checkbox_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "background_fade",
			texture_id = "background_fade",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "timer",
			text_id = "timer_field",
		},
		{
			pass_type = "text",
			style_id = "timer_shadow",
			text_id = "timer_field",
		},
		{
			pass_type = "text",
			style_id = "center_timer",
			text_id = "center_timer_field",
		},
		{
			pass_type = "text",
			style_id = "center_timer_shadow",
			text_id = "center_timer_field",
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
		{
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text_field",
		},
		{
			input_text_id = "input",
			pass_type = "keystrokes",
		},
		{
			pass_type = "text",
			style_id = "input",
			text_id = "input",
		},
		{
			pass_type = "text",
			style_id = "input_shadow",
			text_id = "input",
		},
		{
			pass_type = "texture",
			style_id = "status_texture_glow",
			texture_id = "status_texture_glow",
			content_check_function = function (content)
				return not content.active
			end,
		},
		{
			pass_type = "texture",
			style_id = "status_texture_frame",
			texture_id = "status_texture_frame",
			content_check_function = function (content)
				return not content.active
			end,
		},
		{
			pass_type = "text",
			style_id = "placeholder_input",
			text_id = "placeholder_input",
			content_check_function = function (content)
				return content.input == ""
			end,
		},
		{
			pass_type = "text",
			style_id = "placeholder_input_shadow",
			text_id = "placeholder_input",
			content_check_function = function (content)
				return content.input == ""
			end,
		},
		{
			pass_type = "text",
			style_id = "status_message",
			text_id = "status_message",
			content_check_function = function (content)
				return content.status_message and not content.error_message
			end,
		},
		{
			pass_type = "text",
			style_id = "error_message",
			text_id = "status_message",
			content_check_function = function (content)
				return content.status_message and content.error_message
			end,
		},
		{
			pass_type = "text",
			style_id = "status_message_shadow",
			text_id = "status_message",
			content_check_function = function (content)
				return content.status_message
			end,
		},
		{
			content_id = "checkbox_hotspot",
			pass_type = "hotspot",
			style_id = "checkbox_background",
			content_change_function = function (content, style)
				local parent_style = style.parent

				if content.on_pressed then
					content.is_selected = not content.is_selected

					if content.is_selected then
						parent_style.input.replacing_character = nil
						parent_style.input_shadow.replacing_character = nil
					else
						parent_style.input.replacing_character = "*"
						parent_style.input_shadow.replacing_character = "*"
					end
				end
			end,
		},
		{
			pass_type = "rect",
			style_id = "checkbox_background",
		},
		{
			pass_type = "texture_frame",
			style_id = "checkbox_frame",
			texture_id = "checkbox_frame",
		},
		{
			pass_type = "texture",
			style_id = "checkbox",
			texture_id = "checkbox",
			content_check_function = function (content)
				local checkbox_hotspot = content.checkbox_hotspot

				return checkbox_hotspot.is_selected
			end,
		},
		{
			pass_type = "text",
			style_id = "checkbox_text",
			text_id = "checkbox_text",
		},
		{
			pass_type = "text",
			style_id = "checkbox_text_shadow",
			text_id = "checkbox_text",
		},
	}
	local content = {
		active = true,
		background_fade = "options_window_fade_01",
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		center_timer_field = "",
		checkbox = "matchmaking_checkbox",
		checkbox_text = "popup_info_show_password",
		input = "",
		input_mode = "insert",
		placeholder_input = "popup_info_type_password",
		status_texture_frame = "loading_title_divider_background",
		status_texture_glow = "loading_title_divider",
		text_field = "",
		text_index = 1,
		text_start_offset = 0,
		timer_field = "",
		title_text = "",
		checkbox_hotspot = {
			is_selected = false,
		},
		checkbox_frame = checkbox_frame_settings.texture,
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
	}
	local style = {
		checkbox = {
			horizontal_alignment = "right",
			scenegraph_id = "popup_password_box",
			vertical_alignment = "top",
			texture_size = {
				22,
				16,
			},
			offset = {
				0,
				27,
				6,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		checkbox_frame = {
			horizontal_alignment = "right",
			scenegraph_id = "popup_password_box",
			vertical_alignment = "top",
			area_size = {
				25,
				25,
			},
			texture_size = checkbox_frame_settings.texture_size,
			texture_sizes = checkbox_frame_settings.texture_sizes,
			offset = {
				0,
				30,
				5,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		checkbox_background = {
			scenegraph_id = "popup_password_box",
			size = {
				25,
				25,
			},
			offset = {
				575,
				55,
				5,
			},
			color = {
				200,
				10,
				10,
				10,
			},
		},
		checkbox_text = {
			dynamic_font = true,
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "right",
			localize = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-30,
				45,
				6,
			},
		},
		checkbox_text_shadow = {
			dynamic_font = true,
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "right",
			localize = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				-28,
				43,
				5,
			},
		},
		text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_password_text",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		text_shadow = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_password_text",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
		error_message = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_password_box",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("red", 255),
			offset = {
				0,
				-55,
				6,
			},
		},
		status_message = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_password_box",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				-55,
				6,
			},
		},
		status_message_shadow = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "popup_password_box",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-57,
				5,
			},
		},
		status_texture_frame = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				314,
				33,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				160,
				1,
			},
		},
		status_texture_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				314,
				33,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				160,
				2,
			},
		},
		background = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		background_fade = {
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "popup_password_box",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		inner_frame = {
			scenegraph_id = "popup_password_box",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				4,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				0,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		title_text = {
			dynamic_font = true,
			dynamic_font_size = true,
			font_size = 50,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "title_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		title_text_shadow = {
			dynamic_font = true,
			dynamic_font_size = true,
			font_size = 50,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "title_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
		placeholder_input = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = {
				200,
				40,
				40,
				40,
			},
			offset = {
				0,
				0,
				7,
			},
		},
		placeholder_input_shadow = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("black", 200),
			offset = {
				2,
				-2,
				6,
			},
		},
		input = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				10,
				6,
			},
			caret_size = {
				3,
				35,
			},
			caret_offset = {
				-5,
				-7,
				8,
			},
			caret_color = Colors.get_color_table_with_alpha("gray", 255),
		},
		input_shadow = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "popup_password_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				8,
				5,
			},
			caret_size = {
				3,
				35,
			},
			caret_offset = {
				-5,
				-9,
				7,
			},
			caret_color = Colors.get_color_table_with_alpha("black", 255),
		},
		timer = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				320,
				203,
				8,
			},
		},
		timer_shadow = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				322,
				201,
				7,
			},
		},
		center_timer = {
			dynamic_font = true,
			font_size = 44,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "center_timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				6,
			},
		},
		center_timer_shadow = {
			dynamic_font = true,
			font_size = 44,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "center_timer",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				5,
			},
		},
	}

	widget.element.passes = passes
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

local default_window_widget = create_default_window("popup_root", scenegraph_definition.popup_root.size)
local password_window_widget = create_password_window("popup_root", scenegraph_definition.popup_root.size)

local function create_gamepad_button(input_action, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
			},
		},
		content = {
			text = "",
			input_action = input_action,
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
				scenegraph_id = scenegraph_id,
			},
			icon = {
				size = {
					34,
					34,
				},
				offset = {
					0,
					15,
					1,
				},
				scenegraph_id = scenegraph_id,
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

PopupHandler = class(PopupHandler)

PopupHandler.init = function (self, context, from_manager)
	fassert(from_manager, "Not created by the popoup manager")

	self.ui_renderer = context.ui_renderer
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self.wwise_world = Managers.world:wwise_world(context.world)
	self.debug_num_updates = 0
	self.popup_results = {}
	self.popups = {}
	self.n_popups = 0
	self.popup_ids = 0

	self:create_ui_elements()

	self.gamepad_button_colors = {
		enabled = Colors.get_color_table_with_alpha("white", 255),
		disabled = Colors.get_color_table_with_alpha("gray", 255),
	}
	self.mock_input_manager = MockInputManager:new()
end

PopupHandler.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager

	local block_reasons = {
		popup = true,
	}

	input_manager:create_input_service("popup", "IngameMenuKeymaps", "IngameMenuFilters", block_reasons)
	input_manager:map_device_to_service("popup", "keyboard")
	input_manager:map_device_to_service("popup", "mouse")
	input_manager:map_device_to_service("popup", "gamepad")

	if self:has_popup() then
		self:acquire_input()
	end
end

PopupHandler.get_input_manager = function (self)
	return self.input_manager
end

PopupHandler.remove_input_manager = function (self, application_shutdown)
	if self:has_popup() then
		self:release_input()
	end

	if not application_shutdown and self:has_popup() then
		local popup_id, popup = self:active_popup()

		error(string.format("Trying to proceed to next gamestate without handling popup %q: %q", popup.topic or "nil", popup.text or "nil"))
	end

	self.input_manager = nil
end

PopupHandler.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._popup_widgets_by_name = {
		default = UIWidget.init(default_window_widget),
		password = UIWidget.init(password_window_widget),
	}

	local button_widgets = {
		{},
		{},
		{},
	}
	local gamepad_button_widgets = {
		{},
		{},
		{},
	}
	local disable_localization = true
	local font_size

	button_widgets[1][1] = UIWidget.init(UIWidgets.create_default_button("button_1_1", scenegraph_definition.button_1_1.size, "n/a", font_size))
	button_widgets[2][1] = UIWidget.init(UIWidgets.create_default_button("button_2_1", scenegraph_definition.button_2_1.size, "n/a", font_size))
	button_widgets[2][2] = UIWidget.init(UIWidgets.create_default_button("button_2_2", scenegraph_definition.button_2_2.size, "n/a", font_size))
	button_widgets[3][1] = UIWidget.init(UIWidgets.create_default_button("button_3_1", scenegraph_definition.button_3_1.size, "n/a", font_size))
	button_widgets[3][2] = UIWidget.init(UIWidgets.create_default_button("button_3_2", scenegraph_definition.button_3_2.size, "n/a", font_size))
	button_widgets[3][3] = UIWidget.init(UIWidgets.create_default_button("button_3_3", scenegraph_definition.button_3_3.size, "n/a", font_size))
	gamepad_button_widgets[1][1] = UIWidget.init(create_gamepad_button("confirm_press", "button_1_1"))
	gamepad_button_widgets[2][1] = UIWidget.init(create_gamepad_button("confirm_press", "button_2_1"))
	gamepad_button_widgets[2][2] = UIWidget.init(create_gamepad_button("back", "button_2_2"))
	gamepad_button_widgets[3][1] = UIWidget.init(create_gamepad_button("confirm_press", "button_3_1"))
	gamepad_button_widgets[3][2] = UIWidget.init(create_gamepad_button("back", "button_3_2"))
	gamepad_button_widgets[3][3] = UIWidget.init(create_gamepad_button("refresh", "button_3_3"))
	self.button_widgets = button_widgets
	self.gamepad_button_widgets = gamepad_button_widgets
end

PopupHandler.acquire_input = function (self, ignore_cursor_stack)
	local input_manager = self.input_manager

	self:release_input(true)
	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "popup", "PopupHandler")

	if not ignore_cursor_stack then
		ShowCursorStack.push()
	end
end

PopupHandler.release_input = function (self, ignore_cursor_stack)
	local input_manager = self.input_manager
	local block_reason = "popup"

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse",
	}, 1, "popup", "PopupHandler", block_reason)

	if not ignore_cursor_stack then
		ShowCursorStack.pop()
	end
end

PopupHandler.update = function (self, dt, from_manager)
	fassert(from_manager, "Update does not come from the popup manager")

	self.debug_num_updates = self.debug_num_updates + 1

	local n_popups = self.n_popups
	local current_popup = self.popups[n_popups]

	if current_popup then
		if not current_popup.initialized then
			self:_initialize_popup(current_popup)
		end

		local ui_renderer = self.ui_renderer
		local ui_renderer, input_manager = ui_renderer, self.input_manager or self.mock_input_manager
		local input_service = input_manager:get_service("popup")
		local gamepad_active = input_manager:is_device_active("gamepad")
		local widget = current_popup.widget

		widget.style.text.font_size = current_popup.text_font_size
		widget.style.text_shadow.font_size = current_popup.text_font_size
		widget.content.text_field = current_popup.text
		widget.content.title_text = current_popup.topic

		local result

		if current_popup.timer then
			local timer = string.format("%d", math.floor(current_popup.timer))

			if current_popup.timer_format_func then
				timer = current_popup.timer_format_func(timer)
			end

			local timer_field, timer_style, timer_shadow_style

			if current_popup.timer_alignment == "center" then
				widget.content.center_timer_field = timer
				timer_style = widget.style.center_timer
				timer_shadow_style = widget.style.center_timer_shadow
				widget.content.timer_field = ""
			else
				widget.content.center_timer_field = ""
				widget.content.timer_field = timer
				timer_style = widget.style.timer
				timer_shadow_style = widget.style.timer_shadow
			end

			if current_popup.timer_font_size then
				widget.style.timer.font_size = current_popup.timer_font_size
				widget.style.center_timer.font_size = current_popup.timer_font_size
			end

			if current_popup.timer_blink then
				timer_style.text_color = Colors.lerp_color_tables(Colors.get_color_table_with_alpha("white", 255), Colors.get_color_table_with_alpha("cheeseburger", 255), current_popup.timer % 15 % 1)
			end

			current_popup.timer = current_popup.timer - dt

			if current_popup.timer <= 0 then
				result = current_popup.default_result
			end
		else
			widget.content.timer_field = ""
			widget.content.center_timer_field = ""
			widget.style.timer.font_size = 36
			widget.style.center_timer.font_size = 44
		end

		UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, widget)

		local n_args = current_popup.n_args

		if n_args then
			local args = current_popup.args
			local buttons = self.button_widgets[n_args]
			local gamepad_buttons = self.gamepad_button_widgets[n_args]

			for i = 1, n_args do
				local button_text = " " .. args[i * 2]
				local button_enabled = current_popup.button_enabled_state[i] == true

				if gamepad_active then
					local gamepad_button = gamepad_buttons[i]
					local button_content = gamepad_button.content
					local input_action = button_content.input_action

					if not button_content.icon then
						local action_texture_data = self:get_gamepad_input_texture_data(input_service, input_action)

						button_content.icon = action_texture_data.texture
					end

					button_content.text = button_text

					local button_style = gamepad_button.style
					local text_style = button_style.text

					text_style.text_color = button_enabled and self.gamepad_button_colors.enabled or self.gamepad_button_colors.disabled

					local font, scaled_font_size = UIFontByResolution(text_style)
					local text_width, text_height, min = UIRenderer.text_size(ui_renderer, button_text, font[1], scaled_font_size)

					button_style.icon.offset[1] = 80 - text_width * 0.5

					UIRenderer.draw_widget(ui_renderer, gamepad_button)

					if input_service:get(input_action, true) then
						result = args[i * 2 - 1]

						self:play_sound("Play_hud_select")
					end
				else
					local button = buttons[i]

					UIWidgetUtils.animate_default_button(button, dt)

					button.content.title_text = button_text

					local button_hotspot = button.content.button_hotspot

					button_hotspot.disable_button = not button_enabled

					UIRenderer.draw_widget(ui_renderer, button)

					if button_hotspot.on_hover_enter then
						self:play_sound("Play_hud_hover")
					end

					if button_hotspot.on_release then
						table.clear(button.content.button_hotspot)

						result = args[i * 2 - 1]

						self:play_sound("Play_hud_select")
					end

					result = result or self:_handle_keyboard_input(current_popup)
				end
			end
		end

		if result then
			local result_params
			local result_param_ids = current_popup.result_param_ids

			if result_param_ids then
				result_params = {}

				local widget_content = widget.content

				for _, param_id in ipairs(result_param_ids) do
					result_params[param_id] = widget_content[param_id]
				end
			end

			self.popup_results[current_popup.popup_id] = {
				result,
				result_params,
			}
			n_popups = n_popups - 1
			self.n_popups = n_popups

			if n_popups == 0 then
				self:release_input()
			end
		end

		UIRenderer.end_pass(ui_renderer)
	end
end

PopupHandler._handle_keyboard_input = function (self, current_popup)
	local n_args = current_popup.n_args
	local button_widgets = self.button_widgets[n_args]
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		for _, button_data in pairs(button_widgets) do
			local button_widget = button_data

			button_widget.content.button_hotspot.is_selected = false
		end

		current_popup.button_index = nil

		return
	end

	local index = current_popup.button_index or 1
	local input_service = Managers.input:get_service("popup")

	if input_service:get("move_right_hold_continuous") then
		index = math.clamp(index + 1, 1, n_args)
	elseif input_service:get("move_left_hold_continuous") then
		index = math.clamp(index - 1, 1, n_args)
	elseif input_service:get("confirm_press") and current_popup.button_enabled_state[index] then
		local args = current_popup.args

		self:play_sound("Play_hud_select")
		print("Popup Choice:", args[index * 2 - 1])

		current_popup.button_index = nil

		return args[index * 2 - 1]
	end

	if index ~= current_popup.button_index then
		for idx, button_data in ipairs(button_widgets) do
			local button_widget = button_data

			button_widget.content.button_hotspot.is_selected = index == idx
		end

		current_popup.button_index = index

		self:play_sound("Play_hud_hover")
	end
end

PopupHandler.get_gamepad_input_texture_data = function (self, input_service, input_action, ignore_keybinding)
	local platform = PLATFORM

	if IS_WINDOWS then
		platform = "xb1"
	end

	if ignore_keybinding then
		return ButtonTextureByName(input_action, platform)
	else
		return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
	end
end

PopupHandler.set_button_enabled = function (self, popup_id, button_index, enabled)
	local popup

	for i = 1, self.n_popups do
		local temp_popup = self.popups[i]

		if temp_popup.popup_id == popup_id then
			popup = temp_popup
		end
	end

	popup.button_enabled_state[button_index] = enabled
end

PopupHandler.active_popup = function (self)
	local popup = self.popups[self.n_popups]

	if popup then
		return popup.popup_id, popup
	end
end

PopupHandler.queue_popup = function (self, popup_type, text, topic, ...)
	local n_popups, popups = self.n_popups, self.popups

	n_popups = n_popups + 1
	self.n_popups = n_popups

	local new_popup = popups[n_popups] or {
		args = {},
	}

	self.popup_ids = self.popup_ids + 1

	local popup_id = tostring(self.popup_ids)

	new_popup.popup_id = popup_id

	local widget = self._popup_widgets_by_name[popup_type]
	local text_style = widget.style.text
	local scaled_text_field_size = UIScaleVectorToResolution(scenegraph_definition.popup_text.size)
	local number_of_text_rows = self:get_number_of_rows(text, text_style, scaled_text_field_size[1])

	new_popup.text_font_size = number_of_text_rows >= 7 and 20 or 28
	new_popup.text = text
	new_popup.topic = topic
	new_popup.widget = widget
	new_popup.type = popup_type

	local n_args = select("#", ...)

	assert(math.floor(n_args / 2) * 2 == n_args, "Need one action for each button text")
	assert(n_args > 0, "Need at least one button...")

	new_popup.n_args = n_args / 2
	new_popup.button_enabled_state = {}

	for i = 1, new_popup.n_args do
		new_popup.button_enabled_state[i] = true
	end

	new_popup.timer = nil
	new_popup.default_result = nil

	pack_index[n_args](new_popup.args, 1, ...)

	local ignore_cursor_stack = n_popups > 1

	if self.input_manager then
		self:acquire_input(ignore_cursor_stack)
	end

	popups[n_popups] = new_popup

	self:_reset_popup_initialized()

	return popup_id
end

PopupHandler._initialize_popup = function (self, popup)
	local popup_type = popup.type

	if popup_type == "password" then
		self:_initialize_password_popup(popup)
	end

	popup.initialized = true
end

PopupHandler._initialize_password_popup = function (self, popup)
	local widget = popup.widget
	local content = widget.content
	local style = widget.style

	content.input = ""
	content.active = true
	content.text_index = 1
	content.caret_index = 1
	content.input_mode = "insert"
	content.status_message = nil
	content.error_message = nil

	table.clear(content.checkbox_hotspot)

	style.input.replacing_character = "*"
	style.input_shadow.replacing_character = "*"
	style.input.input_color = Colors.get_color_table_with_alpha("font_default", 255)

	local animations = widget.animations
	local caret_anim = self:_animate_element_pulse(style.input.caret_color, 1, 60, 255, 2)
	local caret_shadow_anim = self:_animate_element_pulse(style.input_shadow.caret_color, 1, 60, 255, 2)

	animations[caret_anim] = true
	animations[caret_shadow_anim] = true

	local result_param_ids = {
		"input",
	}

	popup.result_param_ids = result_param_ids
	popup.initialized = true
end

PopupHandler.set_popup_verifying_password = function (self, popup_id, is_verifying, status_message, error_message)
	local active_popup_id, popup = self:active_popup()

	if active_popup_id ~= popup_id then
		return
	end

	local widget = popup.widget
	local content = widget.content

	content.status_message = error_message or status_message
	content.error_message = error_message
	content.active = not is_verifying

	local animations = widget.animations

	table.clear(animations)

	local caret_color = widget.style.input.caret_color
	local caret_shadow_color = widget.style.input_shadow.caret_color
	local input_color = widget.style.input.text_color

	if is_verifying then
		caret_color[1] = 0
		caret_shadow_color[1] = 0
		input_color[1] = 200
		input_color[2] = 40
		input_color[3] = 40
		input_color[4] = 40
	else
		local caret_anim = self:_animate_element_pulse(caret_color, 1, 60, 255, 2)
		local caret_shadow_anim = self:_animate_element_pulse(caret_shadow_color, 1, 60, 255, 2)

		animations[caret_anim] = true
		animations[caret_shadow_anim] = true

		local default_color = Colors.get_color_table_with_alpha("font_default", 255)

		input_color[1] = default_color[1]
		input_color[2] = default_color[2]
		input_color[3] = default_color[3]
		input_color[4] = default_color[4]
	end

	local n_args = popup.n_args

	for i = 1, n_args do
		self:set_button_enabled(popup_id, i, not is_verifying)
	end
end

PopupHandler._animate_element_pulse = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, time)

	return new_animation
end

PopupHandler.activate_timer = function (self, popup_id, time, default_result, alignment, blink, optional_timer_format_func, optional_font_size)
	local n_popups = self.n_popups
	local popups = self.popups
	local popup

	for i = 1, n_popups do
		local temp_popup = popups[i]

		if temp_popup.popup_id == popup_id then
			popup = temp_popup
		end
	end

	assert(popup, string.format("[PopupHandler:activate_timer] There is no popup with id %s", popup_id))

	local index

	for idx, value in ipairs(popup.args) do
		if value == default_result then
			index = idx

			break
		end
	end

	if default_result == "timeout" then
		index = 1
	end

	assert(index, string.format("[PopupHandler:activate_timer] There is no result named %s in popup declaration %s", default_result, popup.topic))
	assert(index % 2 == 1, string.format("[PopupHandler:activate_timer] You need to pass the result - not the text %s in popup declaration %s", default_result, popup.topic))

	popup.timer = time
	popup.default_result = default_result
	popup.timer_alignment = alignment or "right"
	popup.timer_blink = blink == nil and true or blink
	popup.timer_format_func = optional_timer_format_func
	popup.timer_font_size = optional_font_size
end

PopupHandler.has_popup = function (self)
	return self.n_popups > 0
end

PopupHandler.has_popup_with_id = function (self, popup_id)
	for _, popup in pairs(self.popups) do
		if popup.popup_id == popup_id then
			return true
		end
	end

	return false
end

PopupHandler._reset_popup_initialized = function (self)
	for _, popup in pairs(self.popups) do
		popup.initialized = false
	end
end

PopupHandler.cancel_popup = function (self, popup_id)
	local n_popups = self.n_popups
	local popups = self.popups

	for i = 1, n_popups do
		local popup = popups[i]

		if popup.popup_id == popup_id then
			local temp = popups[n_popups]

			popups[n_popups] = popup
			popups[i] = temp
			self.n_popups = n_popups - 1

			if self.n_popups == 0 then
				self:release_input()
			end

			return
		end
	end
end

PopupHandler.cancel_all_popups = function (self)
	local n_popups = self.n_popups
	local popups = self.popups

	for i = 1, n_popups do
		popups[i] = nil
	end

	if n_popups > 0 then
		self:release_input()
	end

	self.n_popups = 0
end

PopupHandler.query_result = function (self, popup_id)
	local result = self.popup_results[popup_id]

	self.popup_results[popup_id] = nil

	if result then
		return unpack(result)
	end
end

PopupHandler.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

PopupHandler.fit_text_width_to_popup = function (self, text)
	local widget = self._popup_widgets_by_name.default

	return UIRenderer.crop_text_width(self.ui_renderer, text, 500, widget.style.text)
end

PopupHandler.get_number_of_rows = function (self, localized_text, text_style, text_area_width)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local lines = UIRenderer.word_wrap(self.ui_renderer, localized_text, font[1], scaled_font_size, text_area_width)

	return #lines
end
