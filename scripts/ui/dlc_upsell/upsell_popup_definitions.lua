﻿-- chunkname: @scripts/ui/dlc_upsell/upsell_popup_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local content_margin = 50
local window_w = 455
local window_h = 636
local content_w = window_w - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			window_w,
			window_h,
		},
	},
	window_top_detail = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			0,
			6,
		},
		size = {
			45,
			12,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			content_w,
			60,
		},
	},
	body = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "top",
		position = {
			0,
			-60,
			0,
		},
		size = {
			content_w,
			380,
		},
	},
	store_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			50,
			10,
		},
		size = {
			320,
			76,
		},
	},
	ok_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			-20,
			10,
		},
		size = {
			160,
			50,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_table("cheeseburger"),
	offset = {
		0,
		0,
		2,
	},
}
local body_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2,
	},
}

function create_frameless_button(scenegraph_id, size, background_texture, text, font_size, font_type, upper_case, text_color_name, detail_texture, detail_offset, disable_with_gamepad)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local side_detail_texture = detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local font_size = font_size or 24
	local font_type = font_type or "hell_shark"
	local text_color_name = text_color_name or "font_button_normal"
	local upper_case = upper_case == nil or upper_case
	local detail_offset = detail_offset or 9

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
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
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
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
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
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
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			side_detail = {
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
				texture_id = side_detail_texture,
			},
			button_hotspot = {},
			title_text = text or "n/a",
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
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					4,
					0,
				},
				size = {
					size[1],
					size[2] - 8,
				},
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					4,
					2,
				},
				size = {
					size[1],
					size[2] - 8,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					4,
					7,
				},
				size = {
					size[1],
					size[2] - 8,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				upper_case = upper_case,
				font_size = font_size,
				font_type = font_type,
				text_color = Colors.get_color_table_with_alpha(text_color_name, 255),
				default_text_color = Colors.get_color_table_with_alpha(text_color_name, 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				upper_case = upper_case,
				font_size = font_size,
				font_type = font_type,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				upper_case = upper_case,
				font_size = font_size,
				font_type = font_type,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					22,
					-2,
					5,
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
					size[2] - 16,
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					-4,
					4,
				},
				size = {
					size[1],
					11,
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
					-detail_offset,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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
					size[1] - side_detail_texture_size[1] + detail_offset,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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

local disable_with_gamepad = true
local widget_definitions = {
	window_background = UIWidgets.create_simple_texture("wom_upsell_popup_bg", "window"),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_12_gold", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0,
	}),
	title_text = UIWidgets.create_simple_text("menu_weave_area_no_wom_title", "title", nil, nil, title_text_style),
	body_text = UIWidgets.create_simple_text("menu_weave_area_no_wom_body", "body", nil, nil, body_text_style),
	ok_button = create_frameless_button("ok_button", scenegraph_definition.ok_button.size, nil, "", nil, nil, nil, nil, "button_detail_03_gold", nil, disable_with_gamepad),
	store_button = create_frameless_button("store_button", scenegraph_definition.store_button.size, nil, "", nil, "hell_shark_header", false, "white", "button_detail_01_gold", nil, disable_with_gamepad),
}
local animation_definitions = {
	transition_enter = {
		{
			duration = 0.2,
			name = "fade_in",
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 2,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
