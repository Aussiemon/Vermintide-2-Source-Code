﻿-- chunkname: @scripts/ui/hud_ui/emote_photomode_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local ROW_SIZE = 45
local WINDOW_SIZE_PC = {
	325,
	ROW_SIZE * 2,
}
local WINDOW_SIZE_GAMEPAD = {
	325,
	ROW_SIZE * 4,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	controls_pc = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			-20,
			0,
		},
		size = WINDOW_SIZE_PC,
	},
	controls_gamepad = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			-20,
			0,
		},
		size = WINDOW_SIZE_GAMEPAD,
	},
}

local function create_input_widget(scenegraph_id, display_name, input_action, row)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_id",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text_id",
				},
			},
		},
		content = {
			text_id = Localize(display_name) .. ": $KEY;Player__" .. input_action .. ":",
		},
		style = {
			text = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				localize = false,
				pixel_perfect = true,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				localize = false,
				pixel_perfect = true,
				skip_button_rendering = true,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 128),
				offset = {
					2,
					-2,
					1,
				},
			},
		},
		offset = {
			0,
			-row * ROW_SIZE,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_background(scenegraph_id, color)
	return {
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "mask_vertical",
					texture_id = "mask_id",
				},
				{
					content_id = "background_id",
					pass_type = "texture_uv",
					style_id = "background",
				},
			},
		},
		content = {
			mask_id = "horizontal_gradient_mask",
			background_id = {
				texture_id = "subtitles_bg",
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
			test = {
				horizontal_alignment = "bottom",
				vertical_alignment = "right",
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					-5,
				},
				texture_size = {
					scenegraph_definition[scenegraph_id].size[1],
					scenegraph_definition[scenegraph_id].size[2] + ROW_SIZE,
				},
			},
			mask_vertical = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				angle = -math.pi * 0.5,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					50,
					0,
				},
				pivot = {
					(scenegraph_definition[scenegraph_id].size[2] + ROW_SIZE + 50) * 0.5,
					scenegraph_definition[scenegraph_id].size[1] * 0.5,
				},
				texture_size = {
					scenegraph_definition[scenegraph_id].size[2] + ROW_SIZE + 50,
					scenegraph_definition[scenegraph_id].size[1],
				},
			},
			background = {
				horizontal_alignment = "bottom",
				masked = true,
				vertical_alignment = "right",
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
				texture_size = {
					scenegraph_definition[scenegraph_id].size[1],
					scenegraph_definition[scenegraph_id].size[2] + ROW_SIZE,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local widgets = {}
local num_elements = 2
local widgets_pc = {
	rect = create_background("controls_pc", {
		70,
		0,
		0,
		0,
	}, num_elements),
	hide_hud = create_input_widget("controls_pc", "photomode_hide_hud", "emote_toggle_hud_visibility", 0),
	zoom_mouse = create_input_widget("controls_pc", "photomode_camera_zoom", "emote_camera_zoom", 1),
}
local num_elements = 4
local widgets_gamepad = {
	rect = create_background("controls_gamepad", {
		255,
		255,
		255,
		255,
	}, num_elements),
	hide_hud = create_input_widget("controls_gamepad", "photomode_hide_hud", "emote_toggle_hud_visibility", 0),
	zoom_in_gamepad = create_input_widget("controls_gamepad", "photomode_camera_zoom_in", "emote_camera_zoom_in", 1),
	zoom_out_gamepad = create_input_widget("controls_gamepad", "photomode_camera_zoom_out", "emote_camera_zoom_out", 2),
	exit_gamepad = create_input_widget("controls_gamepad", "exit", "crouch", 3),
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	widgets_pc = widgets_pc,
	widgets_gamepad = widgets_gamepad,
}
