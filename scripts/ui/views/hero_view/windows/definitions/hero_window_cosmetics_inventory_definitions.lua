﻿-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_cosmetics_inventory_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
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
	window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	item_grid = {
		horizontal_alignment = "center",
		parent = "page_button_divider",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			window_size[2] - 130,
		},
		position = {
			0,
			-5,
			-10,
		},
	},
	item_grid_divider = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			15,
			7,
		},
	},
	item_grid_header_fade = {
		horizontal_alignment = "center",
		parent = "item_tabs_divider",
		vertical_alignment = "top",
		size = {
			window_size[1],
			60,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	item_grid_header = {
		horizontal_alignment = "center",
		parent = "item_grid_divider",
		vertical_alignment = "center",
		size = {
			window_size[1] - 20,
			40,
		},
		position = {
			0,
			8,
			1,
		},
	},
	item_grid_header_detail = {
		horizontal_alignment = "center",
		parent = "item_grid_header",
		vertical_alignment = "bottom",
		size = {
			264,
			32,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	item_tabs = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			40,
		},
		position = {
			0,
			-5,
			1,
		},
	},
	item_tabs_segments = {
		horizontal_alignment = "center",
		parent = "item_tabs",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			5,
			10,
		},
	},
	item_tabs_segments_top = {
		horizontal_alignment = "center",
		parent = "item_tabs",
		vertical_alignment = "top",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			-7,
			20,
		},
	},
	item_tabs_segments_bottom = {
		horizontal_alignment = "center",
		parent = "item_tabs",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			3,
			20,
		},
	},
	item_tabs_divider = {
		horizontal_alignment = "center",
		parent = "item_tabs",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			0,
			7,
		},
	},
	page_button_next = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] * 0.4,
			42,
		},
		position = {
			0,
			0,
			1,
		},
	},
	page_button_edge_right = {
		horizontal_alignment = "left",
		parent = "page_button_next",
		vertical_alignment = "center",
		size = {
			0,
			42,
		},
		position = {
			0,
			0,
			10,
		},
	},
	page_button_previous = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] * 0.4,
			42,
		},
		position = {
			0,
			0,
			1,
		},
	},
	page_button_edge_left = {
		horizontal_alignment = "right",
		parent = "page_button_previous",
		vertical_alignment = "center",
		size = {
			0,
			42,
		},
		position = {
			0,
			0,
			10,
		},
	},
	page_button_divider = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			0,
		},
		position = {
			0,
			42,
			14,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] * 0.2,
			42,
		},
		position = {
			0,
			0,
			3,
		},
	},
}
local item_grid_header_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local page_number_left_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(window_size[1] * 0.1 + 5),
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		window_size[1] * 0.1 + 4,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
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

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					6,
					6,
				},
				size = {
					5,
					size[2] - 9,
				},
				texture_tiling_size = {
					5,
					size[2] - 9,
				},
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					size[2] - 7,
					10,
				},
				size = {
					17,
					9,
				},
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					3,
					10,
				},
				size = {
					17,
					9,
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

local function create_window_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
	local button_color_name

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
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_background",
				},
				{
					content_id = "button_background",
					pass_type = "texture_uv",
					style_id = "button_background",
				},
				{
					pass_type = "tiled_texture",
					style_id = "button_edge",
					texture_id = "bottom_edge",
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
					style_id = "hover_glow",
					texture_id = "hover_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_disabled",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
			glass_top = "button_glass_01",
			use_bottom_edge = use_bottom_edge,
			button_hotspot = {},
			button_text = button_text or "n/a",
			hover_glow = optional_color_name and "button_state_hover_" .. optional_color_name or "button_state_hover",
			glow = optional_color_name and "button_state_normal_" .. optional_color_name or "button_state_normal",
			button_background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / button_background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / button_background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = button_background_texture,
			},
		},
		style = {
			button_background = {
				color = background_color,
				offset = {
					0,
					0,
					2,
				},
				size = size,
			},
			button_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2],
					3,
				},
				size = {
					size[1],
					5,
				},
				texture_tiling_size = {
					size[1],
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
					size[2] - 4,
					3,
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
					5,
					3,
				},
				size = {
					size[1],
					size[2] - 5,
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
					5,
					2,
				},
				size = {
					size[1],
					size[2] - 5,
				},
			},
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			button_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			button_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			button_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					3,
					3,
				},
				size = size,
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					5,
				},
				size = size,
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					5,
				},
				size = size,
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

local category_settings = {
	{
		hero_specific_filter = true,
		item_filter = "slot_type == hat",
		name = "hats",
		wield = true,
		display_name = Localize("inventory_screen_hats_title"),
		item_types = {
			"hat",
		},
		icon = UISettings.slot_icons.hat,
	},
	{
		hero_specific_filter = true,
		item_filter = "slot_type == skin",
		name = "skin",
		wield = true,
		display_name = Localize("inventory_screen_skins_title"),
		item_types = {
			"skin",
		},
		icon = UISettings.slot_icons.skins,
	},
	{
		hero_specific_filter = true,
		item_filter = "slot_type == frame",
		name = "frames",
		display_name = Localize("inventory_screen_frames_title"),
		item_types = {
			"frame",
		},
		icon = UISettings.slot_icons.portrait_frame,
	},
	{
		hero_specific_filter = true,
		item_filter = "item_type == weapon_pose",
		name = "poses",
		display_name = Localize("inventory_screen_poses_title"),
		item_types = {
			"weapon_pose",
		},
		icon = UISettings.slot_icons.pose,
	},
}
local num_tabs = #category_settings
local widgets = {
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 7, 5, 16, 10, false),
	item_tabs_divider = create_window_divider("item_tabs_divider", scenegraph_definition.item_tabs_divider.size),
	item_grid_header = UIWidgets.create_simple_text(Localize("hero_view_inventory"), "item_grid_header", nil, nil, item_grid_header_style),
	item_grid_header_fade = UIWidgets.create_simple_uv_texture("edge_fade_small", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "item_grid_header_fade"),
	item_grid_header_detail = UIWidgets.create_simple_texture("divider_01_top", "item_grid_header_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, window_frame, 10),
	window = UIWidgets.create_background("window", scenegraph_definition.window.size, "background_leather_02"),
	window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 1),
	item_tabs = UIWidgets.create_default_icon_tabs("item_tabs", scenegraph_definition.item_tabs.size, num_tabs),
	item_tabs_segments = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_vertical", {
		5,
		35,
	}, "item_tabs_segments", num_tabs - 1),
	item_tabs_segments_top = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_top", {
		17,
		9,
	}, "item_tabs_segments_top", num_tabs - 1),
	item_tabs_segments_bottom = UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_bottom", {
		17,
		9,
	}, "item_tabs_segments_bottom", num_tabs - 1),
	page_button_next = UIWidgets.create_simple_window_button("page_button_next", scenegraph_definition.page_button_next.size, Localize("menu_next"), 16),
	page_button_previous = UIWidgets.create_simple_window_button("page_button_previous", scenegraph_definition.page_button_previous.size, Localize("menu_previous"), 16),
	page_button_divider = create_window_divider("page_button_divider", scenegraph_definition.page_button_divider.size),
	page_button_edge_left = create_vertical_window_divider("page_button_edge_left", scenegraph_definition.page_button_edge_left.size),
	page_button_edge_right = create_vertical_window_divider("page_button_edge_right", scenegraph_definition.page_button_edge_right.size),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_rect("page_text_area", {
		255,
		0,
		0,
		0,
	}),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_change_tab",
			ignore_keybinding = true,
			input_action = "l1_r1",
			priority = 2,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 3,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

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
	category_settings = category_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
