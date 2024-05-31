-- chunkname: @scripts/ui/views/character_selection_view/states/definitions/character_selection_state_versus_loadouts_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local video_window_width = 426
local video_window_height = 240
local career_info_size = {
	450,
	170,
}
local talent_icon_size = {
	60,
	60,
}
local talent_grid_icon_size = {
	40,
	40,
}
local talent_spacing = 10
local talent_grid_spacing = {
	20,
	10,
}
local weapon_icon_size = {
	138.75,
	136.5,
}
local weapon_spacing = -30
local weapon_slots = {
	"slot_melee",
	"slot_ranged",
}
local button_size = {
	48,
	48,
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
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
			UILayer.default + 1,
		},
	},
	hero_info_panel = {
		horizontal_alignment = "left",
		parent = "area_left",
		vertical_alignment = "top",
		size = {
			441,
			118,
		},
		position = {
			50,
			50,
			1,
		},
	},
	hero_info_level_bg = {
		horizontal_alignment = "left",
		parent = "hero_info_panel",
		vertical_alignment = "center",
		size = {
			124,
			138,
		},
		position = {
			-62,
			0,
			2,
		},
	},
	hero_info_divider = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "top",
		size = {
			14,
			775,
		},
		position = {
			0,
			-126,
			200,
		},
	},
	hero_info_divider_edge = {
		horizontal_alignment = "center",
		parent = "hero_info_divider",
		vertical_alignment = "bottom",
		size = {
			28,
			22,
		},
		position = {
			0,
			-22,
			1,
		},
	},
	info_career_name = {
		horizontal_alignment = "center",
		parent = "hero_info_panel",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			76,
			-16,
			1,
		},
	},
	info_hero_name = {
		horizontal_alignment = "center",
		parent = "info_career_name",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	info_hero_level = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			450,
			25,
		},
		position = {
			0,
			0,
			1,
		},
	},
	hero_root = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			110,
			130,
		},
		position = {
			80,
			-200,
			100,
		},
	},
	hero_icon_root = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			48,
			144,
		},
		position = {
			-59,
			0,
			100,
		},
	},
	loadout_window_anchor = {
		horizontal_alignment = "left",
		parent = "hero_icon_root",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			20,
			-30,
			0,
		},
	},
	loadout_window = {
		horizontal_alignment = "left",
		parent = "loadout_window_anchor",
		vertical_alignment = "top",
		size = {
			534,
			600,
		},
		position = {
			40,
			0,
			0,
		},
	},
	loadout_window_bg = {
		horizontal_alignment = "left",
		parent = "loadout_window_anchor",
		vertical_alignment = "top",
		size = {
			534,
			525,
		},
		position = {
			20,
			0,
			-1,
		},
	},
	button_anchor = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	button = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = button_size,
		position = {
			-80,
			-5,
			1,
		},
	},
	default_button_header = {
		horizontal_alignment = "left",
		parent = "button",
		vertical_alignment = "top",
		size = button_size,
		position = {
			51.5,
			50,
			1,
		},
	},
	custom_button_header = {
		horizontal_alignment = "left",
		parent = "button",
		vertical_alignment = "top",
		size = button_size,
		position = {
			329,
			50,
			1,
		},
	},
	loadout_anchor = {
		parent = "loadout_window",
		position = {
			0,
			0,
			0,
		},
	},
	inventory_anchor = {
		parent = "loadout_anchor",
		position = {
			0,
			-200,
			0,
		},
	},
	back_button = {
		horizontal_alignment = "right",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-200,
			3,
		},
	},
	tag = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-170,
			0,
		},
	},
	loadout_info_divider = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = {
			450,
			4,
		},
		position = {
			0,
			-200,
			10,
		},
	},
	selected_loadout_header = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "bottom",
		size = {
			464,
			150,
		},
		position = {
			0,
			440,
			1,
		},
	},
	selected_loadout_icon = {
		horizontal_alignment = "left",
		parent = "loadout_window",
		vertical_alignment = "top",
		size = button_size,
		position = {
			0,
			-5,
			1,
		},
	},
	item_grid = {
		horizontal_alignment = "left",
		parent = "inventory_anchor",
		vertical_alignment = "top",
		size = {
			520,
			690,
		},
		position = {
			-10,
			160,
			10,
		},
	},
	talent_grid = {
		parent = "inventory_anchor",
		position = {
			0,
			-20,
			10,
		},
	},
	talent_grid_tooltip = {
		horizontal_alignment = "right",
		parent = "talent_grid",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			400,
			-30,
			1,
		},
		offset = {
			0,
			-5,
			0,
		},
	},
	weapons_header = {
		horizontal_alignment = "left",
		parent = "inventory_anchor",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	weapons = {
		horizontal_alignment = "left",
		parent = "weapons_header",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			45,
			-75,
			0,
		},
	},
	talents_header = {
		horizontal_alignment = "left",
		parent = "weapons",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			-45,
			-80,
			1,
		},
	},
	talents = {
		horizontal_alignment = "left",
		parent = "talents_header",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			30,
			-60,
			0,
		},
	},
	weapon_tooltip = {
		horizontal_alignment = "right",
		parent = "talents",
		vertical_alignment = "bottom",
		size = {
			400,
			0,
		},
		position = {
			500,
			0,
			1,
		},
		offset = {
			0,
			-5,
			0,
		},
	},
	talent_tooltip = {
		horizontal_alignment = "right",
		parent = "loadout_window",
		vertical_alignment = "center",
		size = {
			400,
			0,
		},
		position = {
			400,
			-220,
			1,
		},
		offset = {
			0,
			-5,
			0,
		},
	},
	locked_info_text = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "top",
		size = {
			641,
			50,
		},
		position = {
			0,
			60,
			1,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			career_info_size[1] + 20,
			885,
		},
		position = {
			0,
			50,
			1,
		},
	},
	info_window_video = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			video_window_width,
			video_window_height,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	info_video_edge_left = {
		horizontal_alignment = "right",
		parent = "info_window_video",
		vertical_alignment = "top",
		size = {
			230,
			59,
		},
		position = {
			-213,
			12,
			13,
		},
	},
	info_video_edge_right = {
		horizontal_alignment = "left",
		parent = "info_window_video",
		vertical_alignment = "top",
		size = {
			230,
			59,
		},
		position = {
			213,
			12,
			13,
		},
	},
	scrollbar_anchor = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] + 20,
			625,
		},
		position = {
			0,
			-260,
			1,
		},
	},
	scrollbar_window = {
		parent = "scrollbar_anchor",
	},
	passive_window = {
		horizontal_alignment = "center",
		parent = "scrollbar_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			0,
			1,
		},
	},
	passive_icon = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	passive_icon_frame = {
		horizontal_alignment = "center",
		parent = "passive_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	passive_title_text = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.65,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	passive_title_divider = {
		horizontal_alignment = "left",
		parent = "passive_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	passive_type_title = {
		horizontal_alignment = "right",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	passive_description_text = {
		horizontal_alignment = "left",
		parent = "passive_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	active_window = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			-career_info_size[2],
			1,
		},
	},
	active_icon = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	active_icon_frame = {
		horizontal_alignment = "center",
		parent = "active_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	active_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	active_title_divider = {
		horizontal_alignment = "left",
		parent = "active_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	active_type_title = {
		horizontal_alignment = "right",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	active_description_text = {
		horizontal_alignment = "left",
		parent = "active_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	perk_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "bottom",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-50,
			1,
		},
	},
	perk_title_divider = {
		horizontal_alignment = "left",
		parent = "perk_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	career_perk_1 = {
		horizontal_alignment = "left",
		parent = "perk_title_divider",
		vertical_alignment = "bottom",
		size = {
			420,
			1,
		},
		position = {
			10,
			-30,
			1,
		},
	},
	career_perk_2 = {
		horizontal_alignment = "left",
		parent = "career_perk_1",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	career_perk_3 = {
		horizontal_alignment = "left",
		parent = "career_perk_2",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	confirm_button = {
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
}
local hero_career_style = {
	dynamic_font_size = true,
	font_size = 40,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_name_style = {
	font_size = 30,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
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
local hero_level_style = {
	font_size = 52,
	font_type = "hell_shark",
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
local description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 18,
	font_type = "hell_shark_masked",
	horizontal_alignment = "left",
	localize = false,
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
local type_title_text_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark_masked",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("gray", 200),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header_masked",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
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
local loadout_header_style = {
	font_size = 22,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local button_header_style = {
	font_size = 22,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local selected_loadout_header_style = {
	dynamic_font_size = true,
	font_size = 35,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		60,
		0,
		2,
	},
}
local selected_loadout_desc_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		-55,
		2,
	},
	area_size = {
		scenegraph_definition.selected_loadout_header.size[1] - 20,
		90,
	},
}

local function create_info_text(text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_change_function = function (content, style)
						style.text_color = content.locked and style.locked_text_color or style.default_text_color
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.use_shadow
					end,
				},
			},
		},
		content = {
			disable_with_gamepad = true,
			use_shadow = true,
			text = text,
			original_text = text,
		},
		style = {
			text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("light_blue", 255),
				locked_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				skip_button_rendering = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					2,
					0,
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

local function create_loadout_equipment(scenegraph_id, offset)
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

	for i, slot_name in ipairs(weapon_slots) do
		passes[#passes + 1] = {
			pass_type = "hotspot",
			style_id = slot_name .. "_hotspot",
			content_id = slot_name,
			content_check_function = function (content)
				return content.item
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
				return content[slot_name].is_hover
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "lock",
			style_id = slot_name .. "_lock",
			content_check_function = function (content, style)
				return content[slot_name].is_hover and content[slot_name].locked
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "lock",
			style_id = slot_name .. "_lock_shadow",
			content_check_function = function (content, style)
				return content[slot_name].is_hover and content[slot_name].locked
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
			texture_id = "background",
			style_id = slot_name .. "_mask",
		}
		passes[#passes + 1] = {
			item_id = "item",
			pass_type = "item_tooltip",
			scenegraph_id = "weapon_tooltip",
			style_id = "weapon_tooltip",
			content_id = slot_name,
			content_check_function = function (content)
				return content.item and content.is_hover
			end,
		}
		content[slot_name] = {
			is_selected = true,
			no_equipped_item = true,
		}
		style[slot_name] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = weapon_icon_size,
			texture_size = weapon_icon_size,
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				0,
			},
		}
		style[slot_name .. "_hotspot"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				weapon_icon_size[1] * 0.75,
				weapon_icon_size[2] * 0.75,
			},
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				10,
			},
		}
		style[slot_name .. "_icon"] = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "center",
			area_size = {
				65,
				65,
			},
			texture_size = {
				65,
				65,
			},
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				2,
			},
		}
		style[slot_name .. "_mask"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				55,
				55,
			},
			texture_size = {
				55,
				55,
			},
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				1,
			},
		}
		style[slot_name .. "_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = weapon_icon_size,
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				1,
			},
		}
		style[slot_name .. "_hover_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = weapon_icon_size,
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				1,
			},
		}
		style[slot_name .. "_lock"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing),
				0,
				5,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			texture_size = {
				33,
				46,
			},
		}
		style[slot_name .. "_lock_shadow"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			offset = {
				(i - 1) * (weapon_icon_size[1] + weapon_spacing) + 2,
				-2,
				4,
			},
			color = Colors.get_color_table_with_alpha("black", 255),
			texture_size = {
				33,
				46,
			},
		}
	end

	content.equipment_hover_frame = "loadout_item_slot_glow_console"
	content.background = "icon_bg_default"
	content.mask = "mask_rect"
	content.weapon_frame = "loadout_item_slot_console"
	content.lock = "lobby_icon_lock"
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

local function create_loadout_talents(scenegraph_id, offset)
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
	local hover_frame = "frame_outer_glow_01"
	local frame_settings = UIFrameSettings[hover_frame]

	for i = 1, MaxTalentPoints do
		local talent_id = "talent_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "talent_frame",
			style_id = talent_id .. "_frame",
		}
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			texture_id = "talent_hover_frame",
			style_id = talent_id .. "_hover_frame",
			content_check_function = function (content, style)
				return content[talent_id].is_hover
			end,
		}
		passes[#passes + 1] = {
			pass_type = "hotspot",
			style_id = talent_id,
			content_id = talent_id,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "icon",
			style_id = talent_id,
			content_id = talent_id,
			content_check_function = function (content)
				return content.talent and content.icon
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "lock_icon",
			style_id = talent_id .. "_lock",
			content_check_function = function (content)
				return content[talent_id].talent and content[talent_id].is_hover and content.locked
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "lock_icon",
			style_id = talent_id .. "_lock_shadow",
			content_check_function = function (content)
				return content[talent_id].talent and content[talent_id].is_hover and content.locked
			end,
		}
		passes[#passes + 1] = {
			pass_type = "talent_tooltip",
			scenegraph_id = "talent_tooltip",
			style_id = "talent_tooltip",
			talent_id = "talent",
			content_id = talent_id,
			content_check_function = function (content)
				return content.talent and content.is_hover
			end,
		}
		content[talent_id] = {
			is_selected = true,
		}
		style[talent_id] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = talent_icon_size,
			texture_size = talent_icon_size,
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				0,
			},
		}
		style[talent_id .. "_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = talent_icon_size,
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				1,
			},
		}
		style[talent_id .. "_hover_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				0,
			},
			area_size = {
				85,
				85,
			},
		}
		style[talent_id .. "_lock"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				33,
				46,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				5,
			},
		}
		style[talent_id .. "_lock_shadow"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				33,
				46,
			},
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing) + 2,
				-2,
				4,
			},
		}
	end

	content.talent_hover_frame = frame_settings.texture
	content.talent_frame = "talent_frame"
	content.lock_icon = "lobby_icon_lock"
	style.talent_tooltip = {
		draw_downwards = false,
	}
	widget_def.element.passes = passes
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset

	return widget_def
end

local function create_talent_grid(scenegraph_id, offset)
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
	local talent_initial_offset = 25
	local hover_frame = "frame_outer_glow_01"
	local frame_settings = UIFrameSettings[hover_frame]

	for i = 1, MaxTalentPoints do
		local talent_row_id = "talent_row_" .. i

		passes[#passes + 1] = {
			pass_type = "text",
			texture_id = "talent_frame",
			text_id = talent_row_id .. "_header",
			style_id = talent_row_id .. "_header",
		}
		passes[#passes + 1] = {
			pass_type = "text",
			texture_id = "talent_frame",
			text_id = talent_row_id .. "_name",
			style_id = talent_row_id .. "_name",
		}
		content[talent_row_id .. "_header"] = tostring(i)
		content[talent_row_id .. "_name"] = " "
		style[talent_row_id .. "_header"] = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				-(i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]) - talent_grid_icon_size[2] * 0.125,
				2,
			},
		}
		style[talent_row_id .. "_name"] = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				talent_initial_offset + 3 * (talent_grid_icon_size[1] + talent_grid_spacing[1]),
				-(i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]) - talent_grid_icon_size[2] * 0.125,
				2,
			},
		}
		style["talent_tooltip_" .. i] = {
			offset = {
				0,
				-(i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]),
				0,
			},
		}

		for j = 1, 3 do
			local talent_id = "talent_" .. i .. "_" .. j

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = "talent_frame",
				style_id = talent_id .. "_frame",
			}
			passes[#passes + 1] = {
				pass_type = "texture_frame",
				texture_id = "talent_hover_frame",
				style_id = talent_id .. "_hover_frame",
				content_check_function = function (content, style)
					return content[talent_id].is_hover
				end,
			}
			passes[#passes + 1] = {
				pass_type = "hotspot",
				style_id = talent_id,
				content_id = talent_id,
				content_check_function = function (content)
					return content.talent
				end,
			}
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = "icon",
				style_id = talent_id,
				content_id = talent_id,
				content_check_function = function (content)
					return content.talent and content.icon
				end,
			}
			passes[#passes + 1] = {
				pass_type = "talent_tooltip",
				scenegraph_id = "talent_grid_tooltip",
				talent_id = "talent",
				style_id = "talent_tooltip_" .. i,
				content_id = talent_id,
				content_check_function = function (content)
					return content.talent and content.is_hover
				end,
			}
			content[talent_id] = {
				is_selected = true,
			}
			style[talent_id] = {
				horizontal_alignment = "left",
				saturated = true,
				vertical_alignment = "top",
				area_size = talent_grid_icon_size,
				texture_size = talent_grid_icon_size,
				offset = {
					talent_initial_offset + (j - 1) * (talent_grid_icon_size[1] + talent_grid_spacing[1]),
					-(i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]),
					0,
				},
			}
			style[talent_id .. "_frame"] = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = talent_grid_icon_size,
				offset = {
					talent_initial_offset + (j - 1) * (talent_grid_icon_size[1] + talent_grid_spacing[1]),
					-(i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]),
					1,
				},
			}
			style[talent_id .. "_hover_frame"] = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-12.5 + talent_initial_offset + (j - 1) * (talent_grid_icon_size[1] + talent_grid_spacing[1]),
					12.5 - (i - 1) * (talent_grid_icon_size[2] + talent_grid_spacing[2]),
					0,
				},
				area_size = {
					65,
					65,
				},
			}
		end
	end

	content.talent_hover_frame = frame_settings.texture
	content.talent_frame = "talent_frame"
	content.lock_icon = "lobby_icon_lock"
	widget_def.element.passes = passes
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset

	return widget_def
end

local function create_header(text, scenegraph_id, text_style)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_change_function = function (content, style)
						style.offset[1] = content.default_loadout and 25 or 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "lock_icon",
					texture_id = "lock_icon",
					content_check_function = function (content, style)
						return content.default_loadout
					end,
				},
			},
		},
		content = {
			default_loadout = false,
			lock_icon = "lobby_icon_lock",
			text = text,
		},
		style = {
			text = text_style,
			lock_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = Colors.get_color_table_with_alpha("font_default", 255),
				texture_size = {
					16.5,
					23,
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

local function create_back_button(scenegraph_id, texture, hover_texture, offset, size_multiplier)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = size_multiplier and {
		texture_settings.size[1] * size_multiplier,
		texture_settings.size[2] * size_multiplier,
	} or texture_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_shadow_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "selected_texture",
				},
			},
		},
		content = {
			button_hotspot = {},
			texture_id = texture,
			selected_texture = hover_texture,
		},
		style = {
			button_hotspot = {
				size = {
					60,
					60,
				},
				offset = {
					-30,
					-30,
					0,
				},
			},
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			texture_shadow_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					2,
					-2,
					0,
				},
			},
			texture_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			selected_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
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
					3,
				},
			},
		},
		offset = offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local button_frame_name
local button_background_texture = "icons_placeholder"
local button_font_size
local button_text = ""
local button_optional_color_name, button_optional_detail_texture, button_optional_detail_offset
local button_disable_with_gamepad = false
local button_skip_side_detail = true
local button_masked = false
local fit_background_texture = true
local widgets = {
	locked_info_text = create_info_text("", "locked_info_text"),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0,
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	hero_info_divider = UIWidgets.create_simple_texture("divider_vertical_hero_middle", "hero_info_divider"),
	hero_info_divider_edge = UIWidgets.create_simple_texture("divider_vertical_hero_end", "hero_info_divider_edge"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	loadout_window_background = UIWidgets.create_rect_with_outer_frame("loadout_window_bg", scenegraph_definition.loadout_window_bg.size, "frame_outer_fade_02", 0, Colors.get_color_table_with_alpha("console_menu_rect", 192)),
	loadout_frame = UIWidgets.create_rect_with_outer_frame("button", button_size, "frame_outer_glow_01", nil, {
		0,
		255,
		255,
		255,
	}, {
		220,
		255,
		255,
		255,
	}),
	confirm_button = UIWidgets.create_default_button("confirm_button", scenegraph_definition.confirm_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, true),
	loadout_info_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "loadout_info_divider"),
	selected_loadout_header = UIWidgets.create_simple_text("DEFAULT LOADOUT", "selected_loadout_header", nil, nil, selected_loadout_header_style),
	selected_loadout_desc = UIWidgets.create_simple_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dolor justo, maximus sit amet tristique eget, laoreet non erat.", "selected_loadout_header", nil, nil, selected_loadout_desc_style),
	selected_loadout_icon = UIWidgets.create_simple_texture("icons_placeholder", "selected_loadout_icon"),
}
local loadout_widgets = {
	weapons_header = create_header("hero_window_equipment", "weapons_header", loadout_header_style),
	loadout_weapons = create_loadout_equipment("weapons", {
		0,
		0,
		10,
	}),
	talents_header = create_header("hero_window_talents", "talents_header", loadout_header_style),
	loadout_talents = create_loadout_talents("talents", {
		0,
		0,
		10,
	}),
}
local loadout_selection_widgets = {
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 3, 5, 25, 10, false, nil, false),
	talent_grid = create_talent_grid("talent_grid"),
	back_button = create_back_button("back_button", "layout_button_back", "layout_button_back_glow", {
		-60,
		-20,
		100,
	}, 0.5),
}
local loadout_button_widgets = {}

for idx, loadout_data in ipairs(InventorySettings.loadouts) do
	local offset = loadout_data.loadout_type == "custom" and -20 or 0

	loadout_button_widgets[#loadout_button_widgets + 1] = UIWidgets.create_default_button("button", button_size, button_frame_name, button_background_texture, button_text, button_font_size, button_optional_color_name, button_optional_detail_texture, button_optional_detail_offset, button_disable_with_gamepad, button_skip_side_detail, button_masked, {
		0,
		offset - (button_size[1] + 5) * (idx - 1),
		0,
	}, fit_background_texture)
end

local disable_with_gamepad = true
local info_window_widgets = {
	background = UIWidgets.create_simple_rect("screen", {
		0,
		0,
		0,
		0,
	}, 100),
	info_window_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", 0, Colors.get_color_table_with_alpha("console_menu_rect", 192)),
	mask = UIWidgets.create_simple_texture("mask_rect", "scrollbar_anchor"),
	info_window_video = UIWidgets.create_frame("info_window_video", scenegraph_definition.info_window_video.size, "menu_frame_06"),
	info_video_edge_left = UIWidgets.create_simple_texture("frame_detail_03", "info_video_edge_left"),
	info_video_edge_right = UIWidgets.create_simple_uv_texture("frame_detail_03", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "info_video_edge_right"),
	perk_title_text = UIWidgets.create_simple_text(Localize("hero_view_perk_title"), "perk_title_text", nil, nil, sub_title_text_style),
	perk_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "perk_title_divider", true),
	career_perk_1 = UIWidgets.create_career_perk_text("career_perk_1"),
	career_perk_2 = UIWidgets.create_career_perk_text("career_perk_2"),
	career_perk_3 = UIWidgets.create_career_perk_text("career_perk_3"),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider", true),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon", true),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame", true),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider", true),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon", true),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame", true),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] - 200
				ui_scenegraph.area_right.local_position[1] = scenegraph_definition.area_right.position[1] + 200
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress * anim_progress * anim_progress
				ui_scenegraph.area_left.local_position[1] = math.lerp(scenegraph_definition.area_left.position[1] - 200, scenegraph_definition.area_left.position[1], anim_progress)
				ui_scenegraph.area_right.local_position[1] = math.lerp(scenegraph_definition.area_right.position[1] + 400, scenegraph_definition.area_right.position[1], anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	open_equipment_inventory = {
		{
			end_progress = 0.3,
			name = "slide_and_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.loadout_anchor.local_position[1] = scenegraph_definition.loadout_anchor.position[1] - 75
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress * anim_progress * anim_progress
				ui_scenegraph.loadout_anchor.local_position[1] = math.lerp(scenegraph_definition.loadout_anchor.position[1] - 75, scenegraph_definition.loadout_anchor.position[1], anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	show_loadout = {
		{
			end_progress = 0.3,
			name = "slide_and_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.loadout_anchor.local_position[1] = scenegraph_definition.loadout_anchor.position[1] + 75
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress * anim_progress * anim_progress
				ui_scenegraph.loadout_anchor.local_position[1] = math.lerp(scenegraph_definition.loadout_anchor.position[1] + 75, scenegraph_definition.loadout_anchor.position[1], anim_progress)
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
			description_text = "input_description_select_loadout",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_confirm",
			input_action = "refresh_press",
			priority = 3,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
}

return {
	tag_scenegraph_id = "tag",
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widgets,
	loadout_widgets_definitions = loadout_widgets,
	loadout_selection_widget_definitions = loadout_selection_widgets,
	loadout_button_widget_definitions = loadout_button_widgets,
	info_window_widgets_definitions = info_window_widgets,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	hero_icon_widget = UIWidgets.create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size),
	hero_widget = UIWidgets.create_hero_widget("hero_root", scenegraph_definition.hero_root.size),
	weapon_slots = weapon_slots,
	tag_widget_func = UIWidgets.create_rounded_rect_with_text,
	generic_input_actions = generic_input_actions,
}
