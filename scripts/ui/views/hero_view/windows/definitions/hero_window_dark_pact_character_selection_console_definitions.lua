-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_dark_pact_character_selection_console_definitions.lua

local SCREEN_SIZE = {
	1920,
	1080,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = SCREEN_SIZE,
		position = {
			0,
			0,
			UILayer.default + 100,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 101,
		},
	},
	left_side_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	selection_anchor = {
		horizontal_alignment = "left",
		parent = "left_side_root",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			-40,
			-140,
			2,
		},
	},
	select_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			0,
			25,
			3,
		},
	},
	pactsworn_name = {
		horizontal_alignment = "left",
		parent = "left_side_root",
		vertical_alignment = "center",
		size = {
			768,
			50,
		},
		position = {
			110,
			0,
			1,
		},
	},
	pactsworn_stat_1 = {
		horizontal_alignment = "left",
		parent = "pactsworn_name",
		vertical_alignment = "center",
		size = {
			768,
			50,
		},
		position = {
			50,
			-85,
			2,
		},
	},
	pactsworn_stat_1_icon = {
		horizontal_alignment = "left",
		parent = "pactsworn_stat_1",
		vertical_alignment = "center",
		size = {
			32,
			32,
		},
		position = {
			-42,
			10,
			2,
		},
	},
	pactsworn_stat_2 = {
		horizontal_alignment = "left",
		parent = "pactsworn_name",
		vertical_alignment = "center",
		size = {
			768,
			50,
		},
		position = {
			50,
			-115,
			2,
		},
	},
	pactsworn_stat_2_icon = {
		horizontal_alignment = "left",
		parent = "pactsworn_stat_2",
		vertical_alignment = "center",
		size = {
			32,
			32,
		},
		position = {
			-42,
			10,
			2,
		},
	},
	pactsworn_description = {
		horizontal_alignment = "left",
		parent = "pactsworn_name",
		vertical_alignment = "center",
		size = {
			576,
			80,
		},
		position = {
			0,
			-175,
			2,
		},
	},
	equipment_skin = {
		horizontal_alignment = "left",
		parent = "left_side_root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			160,
			-280,
			2,
		},
	},
	weapon_tooltip = {
		horizontal_alignment = "center",
		parent = "equipment_skin",
		vertical_alignment = "center",
		position = {
			0,
			0,
			15,
		},
	},
}
local pacstworn_name_text_style = {
	dynamic_font_size = true,
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		10,
	},
}
local equipment_icon_size = {
	55.5,
	54.6,
}
local equipment_frame_size = {
	148,
	145.6,
}
local slot_size = {
	331.20000000000005,
	94.4,
}

local function create_loadout_equipment(scenegraph_id, offset, slot_name)
	local widget_def = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = offset or {
		0,
		0,
		0,
	}

	passes[#passes + 1] = {
		pass_type = "hotspot",
		style_id = slot_name .. "_hotspot",
		content_id = slot_name,
		content_check_function = function (content)
			return true
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "weapon_frame",
		style_id = slot_name .. "_frame",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "equipment_hover_frame",
		style_id = slot_name .. "_frame",
		content_check_function = function (content, style)
			local hotspot = content[slot_name]

			return hotspot.highlight or hotspot.is_hover
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "icon",
		style_id = slot_name .. "_icon",
		content_id = slot_name,
		content_check_function = function (content)
			return content.item and content.icon
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "mask",
		style_id = slot_name .. "_mask",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "rarity",
		style_id = slot_name .. "_mask",
		content_id = slot_name,
	}
	passes[#passes + 1] = {
		item_id = "item",
		pass_type = "item_tooltip",
		scenegraph_id = "weapon_tooltip",
		style_id = "weapon_tooltip",
		content_id = slot_name,
		content_check_function = function (content)
			return content.item and (content.is_hover or content.is_selected)
		end,
	}

	local title_bg_name = "title_bg" .. slot_name

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = title_bg_name,
		style_id = title_bg_name,
	}

	local title_bg_effect_name = "title_bg_effect" .. slot_name

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = title_bg_effect_name,
		style_id = title_bg_effect_name,
		content_check_function = function (content)
			local hotspot = content[slot_name]

			return hotspot.highlight or hotspot.is_hover
		end,
	}

	local title_text_name = "title_text" .. slot_name

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text_name,
		style_id = title_text_name,
		content_check_function = function (content)
			local hotspot = content[slot_name]

			return hotspot.item and not hotspot.highlight and not hotspot.is_hover
		end,
		content_change_function = function (content, style)
			local item = content[slot_name].item
			local item_data = item.data
			local item_type = item_data.item_type

			content[title_text_name] = content.is_dark_pact and "dark_pact_" .. item_type or item_type
		end,
	}

	local title_text_selected_name = "title_text_selected" .. slot_name

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text_name,
		style_id = title_text_selected_name,
		content_check_function = function (content)
			local hotspot = content[slot_name]

			return hotspot.item and (hotspot.highlight or hotspot.is_hover)
		end,
		content_change_function = function (content, style)
			local item = content[slot_name].item
			local item_data = item.data
			local item_type = item_data.item_type

			content[title_text_name] = content.is_dark_pact and "dark_pact_" .. item_type or item_type
		end,
	}

	local title_shadow_text_name = "title_shadow_text" .. slot_name

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text_name,
		style_id = title_shadow_text_name,
		content_check_function = function (content)
			return content[slot_name].item
		end,
	}

	local sub_title_text_name = "sub_title_text" .. slot_name

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = sub_title_text_name,
		style_id = sub_title_text_name,
		content_check_function = function (content)
			return content[slot_name].item
		end,
		content_change_function = function (content, style)
			local item = content[slot_name].item
			local _, display_name = UIUtils.get_ui_information_from_item(item)

			content[sub_title_text_name] = display_name
		end,
	}

	local sub_title_shadow_text_name = "sub_title_shadow_text" .. slot_name

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = sub_title_text_name,
		style_id = sub_title_shadow_text_name,
		content_check_function = function (content)
			return content[slot_name].item
		end,
	}
	content[slot_name] = {
		is_selected = false,
		no_equipped_item = true,
		rarity = "icon_bg_default",
	}
	content[title_bg_name] = {
		texture_id = "item_slot_side_fade",
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
	}
	content[title_bg_effect_name] = "item_slot_side_effect"
	content[title_text_name] = Localize("not_assigned")
	content[sub_title_text_name] = Localize("not_assigned")
	content.slot_name = slot_name
	style[slot_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		area_size = equipment_icon_size,
		texture_size = equipment_icon_size,
		offset = {
			0,
			0,
			0,
		},
	}
	style[slot_name .. "_hotspot"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		area_size = {
			equipment_frame_size[1] * 0.7,
			equipment_frame_size[2] * 0.7,
		},
		offset = {
			0,
			0,
			10,
		},
	}
	style[slot_name .. "_icon"] = {
		horizontal_alignment = "center",
		masked = true,
		vertical_alignment = "center",
		area_size = {
			54,
			54,
		},
		texture_size = {
			54,
			54,
		},
		offset = {
			0,
			0,
			2,
		},
	}
	style[slot_name .. "_mask"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		area_size = equipment_icon_size,
		texture_size = equipment_icon_size,
		offset = {
			0,
			0,
			1,
		},
	}
	style[slot_name .. "_frame"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = equipment_frame_size,
		offset = {
			0,
			0,
			1,
		},
	}
	style[slot_name .. "_hover_frame"] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = equipment_frame_size,
		offset = {
			0,
			0,
			10,
		},
	}
	style[title_bg_name] = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		size = slot_size,
		texture_size = slot_size,
		color = {
			255,
			0,
			0,
			0,
		},
		offset = {
			0,
			-slot_size[2] / 2,
			-5,
		},
	}
	style[title_bg_effect_name] = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		size = slot_size,
		texture_size = slot_size,
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			-slot_size[2] / 2,
			-4,
		},
	}
	style[title_text_name] = {
		font_size = 30,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = true,
		upper_case = true,
		vertical_alignment = "top",
		size = slot_size,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			equipment_frame_size[1] * 0.5 - 14,
			-slot_size[2] * 0.5 - 16,
			5,
		},
	}
	style[title_text_selected_name] = {
		font_size = 30,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = true,
		upper_case = true,
		vertical_alignment = "top",
		size = slot_size,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			equipment_frame_size[1] * 0.5 - 14,
			-slot_size[2] * 0.5 - 16,
			5,
		},
	}
	style[title_shadow_text_name] = {
		font_size = 30,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = true,
		upper_case = true,
		vertical_alignment = "top",
		size = slot_size,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			equipment_frame_size[1] * 0.5 - 14 + 2,
			-slot_size[2] * 0.5 - 16 - 2,
			4,
		},
	}
	style[sub_title_text_name] = {
		font_size = 20,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = true,
		vertical_alignment = "top",
		size = slot_size,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			equipment_frame_size[1] * 0.5 - 14,
			-slot_size[2] * 0.5 - 50,
			5,
		},
	}
	style[sub_title_shadow_text_name] = {
		font_size = 20,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = true,
		vertical_alignment = "top",
		size = slot_size,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			equipment_frame_size[1] * 0.5 - 14 + 2,
			-slot_size[2] * 0.5 - 52,
			4,
		},
	}
	content.equipment_hover_frame = "loadout_item_slot_glow_console"
	content.background = "icon_bg_default"
	content.mask = "mask_rect"
	content.weapon_frame = "loadout_item_slot_console"
	style.weapon_tooltip = {
		draw_downwards = false,
	}
	widget_def.element.passes = passes
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset

	return widget_def
end

local stat_text_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = false,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("light_gray", 255),
	offset = {
		0,
		0,
		10,
	},
}
local stat_text_style_shadow = table.clone(stat_text_style)

stat_text_style_shadow.offset = {
	2,
	-2,
	9,
}
stat_text_style_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)

local description_text_style = table.clone(stat_text_style)

description_text_style.dynamic_font_size_word_wrap = true
description_text_style.word_wrap = true
description_text_style.use_shadow = true

local disable_with_gamepad = true
local widget_definitions = {
	pactsworn_name = UIWidgets.create_simple_text("PACTSWORN NAME", "pactsworn_name", nil, nil, pacstworn_name_text_style),
	name_separator = UIWidgets.create_simple_uv_texture("radial_chat_bg_line_horz", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "pactsworn_name", nil, nil, Colors.get_color_table_with_alpha("font_button_normal", 255), {
		0,
		-14,
		2,
	}, nil, {
		scenegraph_definition.pactsworn_name.size[1],
		4,
	}),
	equipment_skin = create_loadout_equipment("equipment_skin", nil, "slot_skin"),
	pactsworn_stat_1 = UIWidgets.create_simple_text("stat_1", "pactsworn_stat_1", nil, nil, stat_text_style),
	pactsworn_stat_shadow_1 = UIWidgets.create_simple_text("stat_1", "pactsworn_stat_1", nil, nil, stat_text_style_shadow),
	pactsworn_stat_1_icon = UIWidgets.create_simple_texture("icons_placeholder", "pactsworn_stat_1_icon"),
	pactsworn_stat_2 = UIWidgets.create_simple_text("stat_2", "pactsworn_stat_2", nil, nil, stat_text_style),
	pactsworn_stat_shadow_2 = UIWidgets.create_simple_text("stat_2", "pactsworn_stat_2", nil, nil, stat_text_style_shadow),
	pactsworn_stat_2_icon = UIWidgets.create_simple_texture("icons_placeholder", "pactsworn_stat_2_icon"),
	pactsworn_description = UIWidgets.create_simple_text("pactsworn_description", "pactsworn_description", nil, nil, description_text_style),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_select_pactsworn",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	select_inventory = {
		{
			description_text = "input_description_select_inventory",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
	hero_unavailable = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 2,
		},
	},
	dlc_unavailable = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "menu_store_purchase_button_unlock",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
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
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 1,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	generic_input_actions = generic_input_actions,
	animation_definitions = animation_definitions,
}
