﻿-- chunkname: @scripts/ui/views/hero_view/states/definitions/hero_view_state_keep_decorations_definitions.lua

local list_window_size = {
	480,
	700,
}
local list_scrollbar_size = {
	16,
	list_window_size[2] - 20,
}
local info_window_size = {
	450,
	list_window_size[2] + 20,
}
local IS_PC = IS_WINDOWS
local entry_height = IS_PC and 35 or 50
local entry_font_size = IS_PC and 22 or 28
local list_entry_size = {
	400,
	entry_height,
}
local scenegraph_definition = {
	screen = {
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
	list_window = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = list_window_size,
		position = {
			120,
			-140,
			10,
		},
	},
	list_scrollbar = {
		horizontal_alignment = "left",
		parent = "list_window",
		vertical_alignment = "top",
		size = list_scrollbar_size,
		position = {
			-30,
			-10,
			10,
		},
	},
	list_scroll_root = {
		horizontal_alignment = "left",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	list_entry = {
		horizontal_alignment = "left",
		parent = "list_scroll_root",
		vertical_alignment = "top",
		size = list_entry_size,
		position = {
			25,
			0,
			0,
		},
	},
	list_detail_top = {
		horizontal_alignment = "left",
		parent = "list_scrollbar",
		vertical_alignment = "top",
		size = {
			488,
			95,
		},
		position = {
			-45,
			60,
			2,
		},
	},
	list_detail_bottom = {
		horizontal_alignment = "left",
		parent = "list_scrollbar",
		vertical_alignment = "bottom",
		size = {
			488,
			95,
		},
		position = {
			-45,
			-60,
			2,
		},
	},
	confirm_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			380,
			70,
		},
		position = {
			0,
			30,
			10,
		},
	},
	close_button = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			300,
			70,
		},
		position = {
			-80,
			30,
			10,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = info_window_size,
		position = {
			-70,
			-130,
			10,
		},
	},
	info_top_left = {
		horizontal_alignment = "left",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			244,
			95,
		},
		position = {
			0,
			40,
			2,
		},
	},
	info_top_right = {
		horizontal_alignment = "right",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			244,
			95,
		},
		position = {
			0,
			40,
			2,
		},
	},
	info_bottom_left = {
		horizontal_alignment = "left",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			244,
			95,
		},
		position = {
			0,
			-40,
			2,
		},
	},
	info_bottom_right = {
		horizontal_alignment = "right",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			244,
			95,
		},
		position = {
			0,
			-40,
			2,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			info_window_size[1] - 40,
			300,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			78,
			28,
		},
		position = {
			0,
			-45,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "title_divider",
		vertical_alignment = "top",
		size = {
			info_window_size[1] - 40,
			300,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	artist_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			info_window_size[1] - 40,
			300,
		},
		position = {
			0,
			10,
			1,
		},
	},
}
local rect_color = {
	200,
	10,
	10,
	10,
}
local title_text_style = {
	dynamic_font_size = false,
	dynamic_height = false,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local artist_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_entry_widget()
	local masked = true
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_04
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local new_frame_settings = UIFrameSettings.frame_outer_glow_01
	local new_frame_spacing = new_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local scenegraph_id = "list_entry"
	local size = scenegraph_definition[scenegraph_id].size
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "background",
		},
		{
			pass_type = "text",
			style_id = "title",
			text_id = "title",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "locked_title",
			text_id = "title",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "title_shadow",
			text_id = "title",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "edge_fade",
			texture_id = "edge_fade",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "new_frame",
			texture_id = "new_frame",
			content_check_function = function (content)
				return content.new and not content.button_hotspot.is_hover
			end,
			content_change_function = function (content, style)
				local progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

				style.color[1] = 55 + progress * 200
			end,
		},
		{
			pass_type = "texture",
			style_id = "dot_texture",
			texture_id = "dot_texture",
			content_check_function = function (content)
				local locked = content.locked
				local equipped = content.equipped
				local new = content.new
				local in_use = content.in_use

				return not locked and not equipped and not new and not in_use
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock_texture",
			texture_id = "lock_texture",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "equipped_texture",
			texture_id = "equipped_texture",
			content_check_function = function (content)
				return content.equipped
			end,
		},
		{
			pass_type = "texture",
			style_id = "equipped_shadow_texture",
			texture_id = "equipped_texture",
			content_check_function = function (content)
				return content.equipped
			end,
		},
		{
			pass_type = "texture",
			style_id = "in_use_texture",
			texture_id = "equipped_texture",
			content_check_function = function (content)
				return content.in_use and not content.equipped
			end,
		},
		{
			pass_type = "texture",
			style_id = "new_texture",
			texture_id = "new_texture",
			content_check_function = function (content)
				return content.new
			end,
			content_change_function = function (content, style)
				local progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

				style.color[1] = 55 + progress * 200
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
	}
	local content = {
		background = "rect_masked",
		dot_texture = "tooltip_marker",
		edge_fade = "playername_bg_02",
		equipped = false,
		equipped_texture = "matchmaking_checkbox",
		lock_texture = "achievement_symbol_lock",
		locked = false,
		new = false,
		new_texture = "list_item_tag_new",
		title = "",
		button_hotspot = {},
		hover_frame = hover_frame_settings.texture,
		new_frame = new_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		size = size,
	}
	local style = {
		title = {
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			font_size = entry_font_size,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			hover_text_color = Colors.get_color_table_with_alpha("white", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				40,
				0,
				2,
			},
			size = {
				size[1] - 55,
				size[2],
			},
		},
		locked_title = {
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			font_size = entry_font_size,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			hover_text_color = {
				255,
				80,
				80,
				80,
			},
			default_text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				40,
				0,
				2,
			},
			size = {
				size[1] - 55,
				size[2],
			},
		},
		title_shadow = {
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			font_size = entry_font_size,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				41,
				-1,
				1,
			},
			size = {
				size[1] - 55,
				size[2],
			},
		},
		background = {
			masked = masked,
			size = {
				size[1] - 20,
				size[2],
			},
			color = {
				180,
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
		edge_fade = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				20,
				size[2],
			},
			color = {
				180,
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
			masked = masked,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
			size = {
				size[1],
				size[2],
			},
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
			},
		},
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				12,
			},
		},
		new_frame = {
			masked = masked,
			texture_size = new_frame_settings.texture_size,
			texture_sizes = new_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
			size = {
				size[1],
				size[2],
			},
			frame_margins = {
				-new_frame_spacing,
				-new_frame_spacing,
			},
		},
		dot_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				13,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				11,
				-1,
				5,
			},
		},
		lock_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				56,
				40,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-10,
				0,
				2,
			},
		},
		equipped_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				37,
				31,
			},
			color = Colors.get_color_table_with_alpha("green", 255),
			offset = {
				4,
				0,
				3,
			},
		},
		equipped_shadow_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				37,
				31,
			},
			color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				5,
				-1,
				2,
			},
		},
		new_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				113.4,
				45.9,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				-64,
				0,
				2,
			},
		},
		in_use_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				37,
				31,
			},
			color = Colors.get_color_table_with_alpha("gray", 255),
			offset = {
				4,
				0,
				3,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

local function create_dummy_entry_widget()
	local masked = true
	local scenegraph_id = "list_entry"
	local size = scenegraph_definition[scenegraph_id].size
	local passes = {
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "edge_fade",
			texture_id = "edge_fade",
		},
	}
	local content = {
		background = "rect_masked",
		edge_fade = "playername_bg_02",
		equipped = false,
		locked = false,
		new = false,
		title = "",
		button_hotspot = {},
		size = size,
	}
	local style = {
		background = {
			masked = masked,
			size = {
				size[1] - 20,
				size[2],
			},
			color = {
				180,
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
		edge_fade = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				20,
				size[2],
			},
			color = {
				180,
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
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

local function create_rect_with_frame(scenegraph_id, size, rect_color)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
	}
	local content = {
		frame = "menu_frame_13",
	}
	local style = {
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = size,
			color = rect_color or {
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
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = size,
			texture_size = {
				84,
				84,
			},
			texture_sizes = {
				corner = {
					32,
					32,
				},
				vertical = {
					27,
					1,
				},
				horizontal = {
					1,
					27,
				},
			},
			frame_margins = {
				-27,
				-27,
			},
			color = rect_color or {
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

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20

	local element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge",
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge",
			},
		},
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
		hotspot = {},
	}
	local style = {
		mask = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				size[1],
				size[2],
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
				0,
			},
		},
		mask_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				fade_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				fade_height,
				0,
			},
		},
		mask_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				fade_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-fade_height,
				0,
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2,
			},
		},
	}
	local widget = {}

	widget.element = element
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
local widgets_definitions = {
	list_detail_top = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "list_detail_top"),
	list_detail_bottom = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "list_detail_bottom"),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_window", scenegraph_definition.list_scrollbar.size, "gold"),
	list_mask = create_list_mask("list_window", scenegraph_definition.list_window.size, 10),
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	title_divider = UIWidgets.create_simple_texture("keep_decorations_divider_02", "title_divider"),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	artist_text = UIWidgets.create_simple_text("n/a", "artist_text", nil, nil, artist_text_style),
	background = UIWidgets.create_simple_texture("options_window_fade_01", "screen"),
	info_window = create_rect_with_frame("info_window", {
		info_window_size[1] - 20,
		info_window_size[2],
	}, rect_color),
	info_bottom_right = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0.5,
			1,
		},
		{
			1,
			0,
		},
	}, "info_bottom_right"),
	info_bottom_left = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			1,
			1,
		},
		{
			0.5,
			0,
		},
	}, "info_bottom_left"),
	info_top_right = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0.5,
			0,
		},
		{
			1,
			1,
		},
	}, "info_top_right"),
	info_top_left = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			1,
			0,
		},
		{
			0.5,
			1,
		},
	}, "info_top_left"),
	confirm_button = UIWidgets.create_default_button("confirm_button", scenegraph_definition.confirm_button.size, "button_frame_01_gold", nil, Localize("menu_settings_apply"), 32, nil, "button_detail_01_gold", nil, disable_with_gamepad),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, "button_frame_01_gold", nil, Localize("interaction_action_close"), 32, nil, "button_detail_01_gold", nil, disable_with_gamepad),
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

				local offset = 200 * (1 - anim_progress)
				local info_window_default_position = scenegraph_definition.info_window.position

				ui_scenegraph.info_window.position[1] = info_window_default_position[1] + offset

				local close_button_default_position = scenegraph_definition.close_button.position

				ui_scenegraph.close_button.position[1] = close_button_default_position[1] + offset

				local list_window_default_position = scenegraph_definition.list_window.position

				ui_scenegraph.list_window.position[1] = list_window_default_position[1] - offset

				local confirm_button_default_position = scenegraph_definition.confirm_button.position

				ui_scenegraph.confirm_button.position[2] = confirm_button_default_position[2] - offset
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	{
		description_text = "input_description_close",
		input_action = "back",
		priority = 3,
	},
}
local input_actions = {
	default = {
		actions = {
			{
				description_text = "input_description_apply",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
	remove = {
		actions = {
			{
				description_text = "input_description_remove",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
}

return {
	input_actions = input_actions,
	entry_widget_definition = create_entry_widget(),
	dummy_entry_widget_definition = create_dummy_entry_widget(),
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions,
}
