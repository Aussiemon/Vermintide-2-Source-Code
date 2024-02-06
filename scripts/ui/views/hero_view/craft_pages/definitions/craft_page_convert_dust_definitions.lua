﻿-- chunkname: @scripts/ui/views/hero_view/craft_pages/definitions/craft_page_convert_dust_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)

NUM_CRAFT_SLOTS_X = 1
NUM_CRAFT_SLOTS_Y = 1
NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS_X * NUM_CRAFT_SLOTS_Y

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
		parent = "window",
		vertical_alignment = "center",
		size = {
			186,
			186,
		},
		position = {
			0,
			0,
			6,
		},
	},
	item_grid_icon = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "center",
		size = {
			72,
			62,
		},
		position = {
			0,
			0,
			0,
		},
	},
	material_bg = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "bottom",
		size = {
			284,
			146,
		},
		position = {
			0,
			-160,
			2,
		},
	},
	material_text_1 = {
		horizontal_alignment = "center",
		parent = "material_bg",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			0,
			-10,
			2,
		},
	},
	material_text_2 = {
		horizontal_alignment = "center",
		parent = "material_bg",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			0,
			-10,
			2,
		},
	},
	craft_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - 100,
			60,
		},
		position = {
			0,
			20,
			35,
		},
	},
	craft_bar_bg = {
		horizontal_alignment = "center",
		parent = "craft_button",
		vertical_alignment = "top",
		size = {
			400,
			6,
		},
		position = {
			0,
			28,
			5,
		},
	},
	craft_bar_fg = {
		horizontal_alignment = "center",
		parent = "craft_bar_bg",
		vertical_alignment = "center",
		size = {
			424,
			30,
		},
		position = {
			4,
			-4,
			2,
		},
	},
	craft_bar = {
		horizontal_alignment = "left",
		parent = "craft_bar_bg",
		vertical_alignment = "center",
		size = {
			400,
			6,
		},
		position = {
			0,
			0,
			1,
		},
	},
}

local function create_craft_material_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_warning",
					text_id = "text",
					content_check_function = function (content)
						return content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "rect",
					style_id = "text_bg",
					content_check_function = function (content)
						return content.draw_background
					end,
				},
				{
					pass_type = "rect",
					style_id = "text_bg_2",
					content_check_function = function (content)
						return content.draw_background
					end,
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.item
					end,
				},
			},
		},
		content = {
			draw_background = true,
			effect = "sparkle_effect",
			icon = "icon_crafting_dust_01_small",
			text = "0",
			warning = false,
			button_hotspot = {},
		},
		style = {
			text_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					60,
					80,
				},
				color = {
					0,
					10,
					10,
					10,
				},
				offset = {
					2,
					10,
					1,
				},
			},
			text_bg_2 = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					60,
					25,
				},
				color = {
					180,
					5,
					5,
					5,
				},
				offset = {
					0,
					12,
					0,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					50,
					50,
				},
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
			effect = {
				angle = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				offset = {
					110,
					120,
					4,
				},
				pivot = {
					128,
					128,
				},
				texture_size = {
					256,
					256,
				},
				color = Colors.get_color_table_with_alpha("white", 0),
			},
			text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					10,
					3,
				},
			},
			text_warning = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					10,
					3,
				},
			},
			text_shadow = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					8,
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
end

local disable_with_gamepad = true
local widgets = {
	item_grid_bg = UIWidgets.create_simple_texture("crafting_bg_02", "item_grid", nil, nil, nil, -1),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, NUM_CRAFT_SLOTS_Y, NUM_CRAFT_SLOTS_X, 20, 20),
	item_grid_icon = UIWidgets.create_simple_texture("crafting_icon_dust", "item_grid_icon"),
	craft_button = UIWidgets.create_default_button("craft_button", scenegraph_definition.craft_button.size, nil, nil, Localize("hero_view_crafting_convert"), 24, nil, "button_detail_02", nil, disable_with_gamepad),
	craft_bar_fg = UIWidgets.create_simple_texture("crafting_bar_fg", "craft_bar_fg"),
	craft_bar_bg = UIWidgets.create_simple_rect("craft_bar_bg", {
		255,
		0,
		0,
		0,
	}),
	craft_bar = UIWidgets.create_simple_texture("crafting_bar", "craft_bar", nil, nil, nil, 2),
	material_text_1 = create_craft_material_widget("material_text_1"),
	material_text_2 = create_craft_material_widget("material_text_2"),
	material_bg = UIWidgets.create_simple_texture("crafting_bg_conversion", "material_bg"),
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
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
