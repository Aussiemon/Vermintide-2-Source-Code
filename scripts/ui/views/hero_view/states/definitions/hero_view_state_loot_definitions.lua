local panel_height = UISettings.hero_panel_height
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local panel_color = UISettings.console_menu_rect_color
local grid_size = {
	520,
	600
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	bottom_panel = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			79
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	chest_title = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-80,
			1
		}
	},
	chest_sub_title = {
		vertical_alignment = "top",
		parent = "chest_title",
		horizontal_alignment = "center",
		size = {
			1200,
			50
		},
		position = {
			0,
			-40,
			1
		}
	},
	info_root = {
		vertical_alignment = "center",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	info_window = {
		vertical_alignment = "center",
		parent = "info_root",
		horizontal_alignment = "right",
		size = {
			300,
			576
		},
		position = {
			-70,
			0,
			1
		}
	},
	info_text_box = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			270,
			430
		},
		position = {
			0,
			-140,
			1
		}
	},
	info_title_text = {
		vertical_alignment = "top",
		parent = "info_text_box",
		horizontal_alignment = "center",
		size = {
			320,
			50
		},
		position = {
			0,
			70,
			1
		}
	},
	info_portrait_root = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	item_grid_root = {
		vertical_alignment = "center",
		parent = "dead_space_filler",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	item_window = {
		vertical_alignment = "center",
		parent = "item_grid_root",
		horizontal_alignment = "left",
		size = grid_size,
		position = {
			50,
			0,
			10
		}
	},
	item_grid = {
		vertical_alignment = "center",
		parent = "item_window",
		horizontal_alignment = "center",
		size = {
			520,
			600
		},
		position = {
			0,
			0,
			1
		}
	},
	item_grid_title = {
		vertical_alignment = "top",
		parent = "item_window",
		horizontal_alignment = "center",
		size = {
			260,
			32
		},
		position = {
			0,
			-15,
			1
		}
	},
	page_text_area = {
		vertical_alignment = "bottom",
		parent = "item_grid",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			0,
			-25,
			3
		}
	},
	input_icon_previous = {
		vertical_alignment = "center",
		parent = "page_text_area",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-60,
			0,
			1
		}
	},
	input_icon_next = {
		vertical_alignment = "center",
		parent = "page_text_area",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			60,
			0,
			1
		}
	},
	input_arrow_next = {
		vertical_alignment = "center",
		parent = "input_icon_next",
		horizontal_alignment = "center",
		size = {
			19,
			27
		},
		position = {
			40,
			0,
			1
		}
	},
	input_arrow_previous = {
		vertical_alignment = "center",
		parent = "input_icon_previous",
		horizontal_alignment = "center",
		size = {
			19,
			27
		},
		position = {
			-40,
			0,
			1
		}
	},
	page_button_next = {
		vertical_alignment = "center",
		parent = "input_icon_next",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			20,
			0,
			1
		}
	},
	page_button_previous = {
		vertical_alignment = "center",
		parent = "input_icon_previous",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-20,
			0,
			1
		}
	},
	item_window_1 = {
		vertical_alignment = "center",
		parent = "item_grid_root",
		horizontal_alignment = "left",
		size = {
			270,
			180
		},
		position = {
			50,
			300,
			1
		}
	},
	item_grid_1 = {
		vertical_alignment = "center",
		parent = "item_window_1",
		horizontal_alignment = "center",
		size = {
			270,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	difficulty_icon_left_1 = {
		vertical_alignment = "center",
		parent = "item_window_1",
		horizontal_alignment = "left",
		size = {
			100,
			200
		},
		position = {
			-100,
			0,
			1
		}
	},
	difficulty_icon_right_1 = {
		vertical_alignment = "center",
		parent = "item_window_1",
		horizontal_alignment = "right",
		size = {
			100,
			200
		},
		position = {
			100,
			0,
			1
		}
	},
	item_window_2 = {
		vertical_alignment = "center",
		parent = "item_grid_root",
		horizontal_alignment = "left",
		size = {
			270,
			180
		},
		position = {
			50,
			100,
			1
		}
	},
	item_grid_2 = {
		vertical_alignment = "center",
		parent = "item_window_2",
		horizontal_alignment = "center",
		size = {
			270,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	difficulty_icon_left_2 = {
		vertical_alignment = "center",
		parent = "item_window_2",
		horizontal_alignment = "left",
		size = {
			100,
			200
		},
		position = {
			-100,
			0,
			1
		}
	},
	difficulty_icon_right_2 = {
		vertical_alignment = "center",
		parent = "item_window_2",
		horizontal_alignment = "right",
		size = {
			100,
			200
		},
		position = {
			100,
			0,
			1
		}
	},
	item_window_3 = {
		vertical_alignment = "center",
		parent = "item_grid_root",
		horizontal_alignment = "left",
		size = {
			270,
			180
		},
		position = {
			50,
			-100,
			1
		}
	},
	item_grid_3 = {
		vertical_alignment = "center",
		parent = "item_window_3",
		horizontal_alignment = "center",
		size = {
			270,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	difficulty_icon_left_3 = {
		vertical_alignment = "center",
		parent = "item_window_3",
		horizontal_alignment = "left",
		size = {
			100,
			200
		},
		position = {
			-100,
			0,
			1
		}
	},
	difficulty_icon_right_3 = {
		vertical_alignment = "center",
		parent = "item_window_3",
		horizontal_alignment = "right",
		size = {
			100,
			200
		},
		position = {
			100,
			0,
			1
		}
	},
	item_window_4 = {
		vertical_alignment = "center",
		parent = "item_grid_root",
		horizontal_alignment = "left",
		size = {
			270,
			180
		},
		position = {
			50,
			-300,
			1
		}
	},
	item_grid_4 = {
		vertical_alignment = "center",
		parent = "item_window_4",
		horizontal_alignment = "center",
		size = {
			270,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	difficulty_icon_left_4 = {
		vertical_alignment = "center",
		parent = "item_window_4",
		horizontal_alignment = "left",
		size = {
			100,
			200
		},
		position = {
			-100,
			0,
			1
		}
	},
	difficulty_icon_right_4 = {
		vertical_alignment = "center",
		parent = "item_window_4",
		horizontal_alignment = "right",
		size = {
			100,
			200
		},
		position = {
			100,
			0,
			1
		}
	},
	item_cap_warning_text = {
		vertical_alignment = "bottom",
		parent = "open_button",
		horizontal_alignment = "center",
		size = {
			500,
			100
		},
		position = {
			0,
			100,
			10
		}
	},
	open_button = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			30,
			10
		}
	},
	continue_button = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-230,
			10
		}
	},
	close_button = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			300,
			70
		},
		position = {
			-80,
			30,
			10
		}
	},
	loot_options_root = {
		vertical_alignment = "center",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-30,
			1
		}
	},
	loot_option_1 = {
		vertical_alignment = "center",
		parent = "loot_options_root",
		horizontal_alignment = "center",
		size = {
			364,
			0
		},
		position = {
			-600,
			0,
			1
		}
	},
	loot_option_1_center = {
		vertical_alignment = "center",
		parent = "loot_option_1",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	gamepad_tooltip_option_1 = {
		vertical_alignment = "center",
		parent = "loot_option_1",
		horizontal_alignment = "center",
		size = {
			450,
			0
		},
		position = {
			0,
			380,
			100
		}
	},
	loot_option_2 = {
		vertical_alignment = "center",
		parent = "loot_options_root",
		horizontal_alignment = "center",
		size = {
			364,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	loot_option_2_center = {
		vertical_alignment = "center",
		parent = "loot_option_2",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	gamepad_tooltip_option_2 = {
		vertical_alignment = "center",
		parent = "loot_option_2",
		horizontal_alignment = "center",
		size = {
			450,
			0
		},
		position = {
			0,
			380,
			100
		}
	},
	loot_option_3 = {
		vertical_alignment = "center",
		parent = "loot_options_root",
		horizontal_alignment = "center",
		size = {
			364,
			0
		},
		position = {
			600,
			0,
			1
		}
	},
	loot_option_3_center = {
		vertical_alignment = "center",
		parent = "loot_option_3",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	gamepad_tooltip_option_3 = {
		vertical_alignment = "center",
		parent = "loot_option_3",
		horizontal_alignment = "center",
		size = {
			450,
			0
		},
		position = {
			0,
			380,
			100
		}
	},
	debug_add_chest_5 = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			450,
			70
		},
		position = {
			-20,
			480,
			2
		}
	},
	debug_add_chest_4 = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			450,
			70
		},
		position = {
			-20,
			400,
			2
		}
	},
	debug_add_chest_3 = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			450,
			70
		},
		position = {
			-20,
			320,
			2
		}
	},
	debug_add_chest_2 = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			450,
			70
		},
		position = {
			-20,
			240,
			2
		}
	},
	debug_add_chest_1 = {
		vertical_alignment = "bottom",
		parent = "dead_space_filler",
		horizontal_alignment = "right",
		size = {
			450,
			70
		},
		position = {
			-20,
			160,
			2
		}
	}
}
local loot_option_positions_by_amount = {
	{
		{
			0,
			0
		},
		{
			0,
			0
		},
		{
			0,
			0
		}
	},
	{
		{
			-300,
			0
		},
		{
			300,
			0
		},
		{
			0,
			0
		}
	},
	{
		{
			-600,
			0
		},
		{
			0,
			0
		},
		{
			600,
			0
		}
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local warning_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 36,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}
local info_title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 24,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local info_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = true,
	use_shadow = true,
	font_size = 18,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local page_number_left_text_style = {
	word_wrap = true,
	font_size = 26,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-172,
		4,
		2
	}
}
local page_number_right_text_style = {
	word_wrap = true,
	font_size = 26,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		171,
		4,
		2
	}
}
local page_number_center_text_style = {
	word_wrap = true,
	font_size = 26,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2
	}
}
local item_grid_title_style = {
	word_wrap = false,
	font_size = 56,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		75,
		2
	}
}
local settings_by_screen = {
	{
		description = "n/a",
		name = "loot",
		hero_specific_filter = true,
		display_name = Localize("hero_view_crafting_tokens"),
		icons = {
			selected = "tabs_icon_equipment_glow",
			normal = "tabs_icon_equipment"
		},
		contains_new_content = function ()
			return false
		end,
		slot_type = ItemType.LOOT_CHEST,
		item_filter = "slot_type == " .. ItemType.LOOT_CHEST
	}
}
local option_icons = {}

for index, settings in ipairs(settings_by_screen) do
	option_icons[#option_icons + 1] = "tabs_icon_all_selected"
end

local viewport_widget = {
	scenegraph_id = "dead_space_filler",
	element = {
		passes = {
			{
				style_id = "viewport",
				pass_type = "viewport",
				content_id = "viewport"
			},
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			}
		}
	},
	style = {
		viewport = {
			scenegraph_id = "dead_space_filler",
			viewport_name = "chest_opening_viewport",
			level_name = "levels/end_screen/world",
			enable_sub_gui = false,
			fov = 120,
			world_name = "chest_opening",
			world_flags = {
				Application.DISABLE_SOUND,
				Application.DISABLE_ESRAM,
				Application.ENABLE_VOLUMETRICS
			},
			object_sets = {
				"flow_victory"
			},
			layer = UILayer.default,
			camera_position = {
				0,
				0,
				0
			},
			camera_lookat = {
				0,
				0,
				0
			}
		}
	},
	content = {
		button_hotspot = {}
	}
}

local function create_loot_preview_widget(scenegraph_id, size)
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "viewport",
			pass_type = "viewport",
			content_id = "viewport"
		},
		{
			pass_type = "hotspot",
			content_id = "button_hotspot"
		}
	}
	local content = {
		activated = true,
		button_hotspot = {}
	}
	local style = {
		viewport = {
			layer = 990,
			shading_environment = "environment/blank_offscreen_chest_item",
			viewport_type = "default_forward",
			enable_sub_gui = false,
			fov = 65,
			world_name = scenegraph_id,
			viewport_name = scenegraph_id,
			camera_position = {
				0,
				0,
				0
			},
			camera_lookat = {
				0,
				0,
				0
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_loot_widget(index, size)
	local frame_settings = UIFrameSettings.menu_frame_09
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "button_hotspot",
			pass_type = "hotspot",
			content_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.presentation_complete
			end
		},
		{
			style_id = "item_icon",
			pass_type = "hotspot",
			content_id = "item_hotspot",
			content_check_function = function (content)
				return content.parent.presentation_complete
			end
		},
		{
			pass_type = "hotspot",
			content_id = "item_hotspot_2",
			content_check_function = function (content)
				return content.parent.presentation_complete
			end
		},
		{
			style_id = "item_name",
			pass_type = "text",
			text_id = "item_name"
		},
		{
			style_id = "item_type",
			pass_type = "text",
			text_id = "item_type"
		},
		{
			style_id = "item_name_shadow",
			pass_type = "text",
			text_id = "item_name"
		},
		{
			style_id = "item_type_shadow",
			pass_type = "text",
			text_id = "item_type"
		},
		{
			item_id = "item",
			style_id = "item_tooltip",
			pass_type = "item_tooltip",
			content_check_function = function (content)
				local is_hover = content.item_hotspot.is_hover or content.item_hotspot_2.is_hover

				return is_hover and content.item
			end
		},
		{
			pass_type = "texture",
			style_id = "item_icon",
			texture_id = "item_icon"
		},
		{
			pass_type = "texture",
			style_id = "item_icon_frame",
			texture_id = "item_icon_frame"
		},
		{
			pass_type = "texture",
			style_id = "item_icon_rarity",
			texture_id = "item_icon_rarity"
		},
		{
			pass_type = "texture",
			style_id = "illusion_overlay",
			texture_id = "illusion_overlay",
			content_check_function = function (content)
				local item = content.item
				local item_skin = item and item.skin

				if item_skin then
					return item.data.item_type == "weapon_skin"
				end
			end
		},
		{
			pass_type = "texture",
			style_id = "illusion_icon",
			texture_id = "illusion_icon",
			content_check_function = function (content)
				local item = content.item
				local item_skin = item and item.skin

				if item_skin then
					return item.data.item_type ~= "weapon_skin" and WeaponSkins.default_skins[item.key] ~= item_skin
				end
			end
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
			content_check_function = function (content)
				return content.draw_frame
			end
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom",
			texture_id = "lock_bottom"
		},
		{
			pass_type = "texture",
			style_id = "lock_top",
			texture_id = "lock_top"
		},
		{
			pass_type = "texture",
			style_id = "lock_top_shadow",
			texture_id = "lock_top_shadow"
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_shadow",
			texture_id = "lock_bottom_shadow"
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_glow",
			texture_id = "lock_bottom_glow"
		},
		{
			pass_type = "texture",
			style_id = "lock_bottom_glow_2",
			texture_id = "lock_bottom_glow_2"
		},
		{
			pass_type = "texture",
			style_id = "lock_glow",
			texture_id = "lock_glow"
		},
		{
			pass_type = "texture",
			style_id = "lock_glow_1",
			texture_id = "lock_glow_1"
		},
		{
			pass_type = "texture",
			style_id = "lock_glow_2",
			texture_id = "lock_glow_2"
		},
		{
			pass_type = "texture",
			style_id = "final_glow",
			texture_id = "final_glow"
		},
		{
			pass_type = "texture",
			style_id = "final_glow_1",
			texture_id = "final_glow_1"
		},
		{
			pass_type = "texture",
			style_id = "final_glow_2",
			texture_id = "final_glow_2"
		},
		{
			pass_type = "texture",
			style_id = "image",
			texture_id = "image",
			content_check_function = function (content)
				return content.image
			end
		},
		{
			style_id = "loading_icon",
			texture_id = "loading_icon",
			pass_type = "rotated_texture",
			content_check_function = function (content)
				return content.is_loading
			end,
			content_change_function = function (content, style, _, dt)
				local progress = style.progress or 0
				progress = (progress + dt) % 1
				local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * math.pi * 2
				style.angle = angle
				style.progress = progress
			end
		},
		{
			style_id = "amount_text",
			pass_type = "text",
			text_id = "amount_text",
			content_check_function = function (content)
				return content.amount_text
			end
		},
		{
			style_id = "amount_text_shadow",
			pass_type = "text",
			text_id = "amount_text",
			content_check_function = function (content)
				return content.amount_text
			end
		}
	}
	local content = {
		loading_icon = "loot_loading",
		draw_frame = false,
		lock_glow_1 = "loot_presentation_glow_04",
		lock_glow = "loot_presentation_circle_glow_plentiful",
		final_glow_2 = "loot_presentation_glow_05",
		item_type = "n/a",
		lock_top = "loot_presentation_fg_01",
		lock_top_shadow = "loot_presentation_fg_01_fade",
		lock_bottom_shadow = "loot_presentation_fg_02_fade",
		illusion_overlay = "item_frame_illusion",
		lock_bottom = "loot_presentation_fg_02",
		item_icon = "icons_placeholder",
		illusion_icon = "item_applied_illusion_icon",
		lock_bottom_glow_2 = "loot_presentation_glow_01",
		item_icon_rarity = "icon_bg_plentiful",
		amount_text = "",
		final_glow_1 = "loot_presentation_glow_06",
		lock_bottom_glow = "loot_presentation_glow_02",
		item_icon_frame = "item_frame",
		final_glow = "loot_presentation_circle_glow_plentiful_large",
		item_name = "n/a",
		lock_glow_2 = "loot_presentation_glow_03",
		frame = frame_settings.texture,
		item_hotspot = {},
		item_hotspot_2 = {
			allow_multi_hover = true
		},
		button_hotspot = {
			hover_type = "circle"
		}
	}
	local style = {
		button_hotspot = {
			size = {
				400,
				400
			},
			offset = {
				size[1] / 2 - 200,
				size[2] / 2 - 200,
				0
			}
		},
		frame = {
			size = {
				[2] = size[2]
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				2
			}
		},
		loading_icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			angle = 0,
			texture_size = {
				150,
				150
			},
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			},
			scenegraph_id = "loot_option_" .. index .. "_center",
			pivot = {
				75,
				75
			}
		},
		image = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				364,
				364
			},
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			},
			scenegraph_id = "loot_option_" .. index .. "_center"
		},
		amount_text = {
			font_size = 42,
			upper_case = false,
			localize = false,
			word_wrap = false,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-100,
				3
			},
			scenegraph_id = "loot_option_" .. index .. "_center"
		},
		amount_text_shadow = {
			font_size = 42,
			upper_case = false,
			localize = false,
			word_wrap = false,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-102,
				2
			},
			scenegraph_id = "loot_option_" .. index .. "_center"
		},
		lock_top = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				364,
				364
			},
			offset = {
				0,
				182,
				13
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_top_shadow = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				364,
				95
			},
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_bottom = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				364,
				364
			},
			offset = {
				0,
				-182,
				18
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_bottom_shadow = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				364,
				95
			},
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_bottom_glow = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				93,
				88
			},
			offset = {
				0,
				-40,
				19
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		lock_bottom_glow_2 = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				93,
				88
			},
			offset = {
				0,
				-40,
				20
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		lock_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				600,
				600
			},
			offset = {
				0,
				0,
				21
			},
			color = {
				0,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		lock_glow_1 = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				408,
				408
			},
			offset = {
				0,
				0,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		lock_glow_2 = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				408,
				408
			},
			offset = {
				0,
				0,
				23
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		final_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				600,
				1000
			},
			offset = {
				0,
				0,
				21
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		final_glow_1 = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				600,
				1000
			},
			offset = {
				0,
				0,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		final_glow_2 = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				600,
				1000
			},
			offset = {
				0,
				0,
				23
			},
			color = {
				255,
				255,
				255,
				255
			},
			default_color = {
				0,
				255,
				255,
				255
			}
		},
		illusion_overlay = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				80,
				80
			},
			offset = {
				0,
				40,
				16
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		illusion_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				20,
				20
			},
			offset = {
				22,
				-12,
				16
			},
			color = Colors.get_color_table_with_alpha("promo", 255)
		},
		item_icon_frame = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				80,
				80
			},
			offset = {
				0,
				40,
				17
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		item_icon = {
			size = {
				80,
				80
			},
			offset = {
				size[1] / 2 - 40,
				-40,
				15
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		item_icon_rarity = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				80,
				80
			},
			offset = {
				0,
				40,
				14
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		item_name = {
			font_size = 30,
			upper_case = true,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			size = {
				size[1],
				50
			},
			offset = {
				0,
				size[2] + 182 + 70,
				30
			}
		},
		item_name_shadow = {
			font_size = 30,
			upper_case = true,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 0),
			size = {
				size[1],
				50
			},
			offset = {
				2,
				(size[2] + 182 + 70) - 2,
				29
			}
		},
		item_type = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			localize = false,
			font_size = 26,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			size = {
				size[1],
				50
			},
			offset = {
				0,
				size[2] + 182,
				30
			}
		},
		item_type_shadow = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			localize = false,
			font_size = 26,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 0),
			size = {
				size[1],
				50
			},
			offset = {
				2,
				(size[2] + 182) - 2,
				29
			}
		},
		item_tooltip = {
			font_size = 18,
			max_width = 500,
			localize = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			line_colors = {
				Colors.get_color_table_with_alpha("font_title", 255),
				Colors.get_color_table_with_alpha("white", 255)
			},
			size = {
				80,
				80
			},
			offset = {
				size[1] / 2 - 40,
				-40,
				4
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = "loot_option_" .. index

	return widget
end

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_vertical_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local disable_with_gamepad = true
local widgets = {
	chest_title = UIWidgets.create_simple_text("chest_title", "chest_title", nil, nil, title_text_style),
	chest_sub_title = UIWidgets.create_simple_text("chest_sub_title", "chest_sub_title", nil, nil, sub_title_text_style),
	info_text_title = UIWidgets.create_simple_text("n/a", "info_title_text", nil, nil, info_title_text_style),
	info_text_box = UIWidgets.create_simple_text("loot_opening_screen_desc", "info_text_box", nil, nil, info_text_style),
	info_window = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, nil, nil, Colors.get_color_table_with_alpha("console_menu_rect", 210)),
	item_grid_title = UIWidgets.create_simple_text(string.upper(Localize("hero_window_loot_crates")), "item_grid_title", nil, nil, item_grid_title_style),
	title_top_divider = UIWidgets.create_simple_texture("divider_01_top", "item_grid_title"),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 5, 4, 16, 16, false),
	page_button_next = UIWidgets.create_arrow_button("page_button_next", math.pi),
	page_button_previous = UIWidgets.create_arrow_button("page_button_previous"),
	input_icon_next = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_next"),
	input_icon_previous = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_previous"),
	input_arrow_next = UIWidgets.create_simple_uv_texture("settings_arrow_normal", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "input_arrow_next"),
	input_arrow_previous = UIWidgets.create_simple_texture("settings_arrow_normal", "input_arrow_previous"),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_texture("tab_menu_bg_03", "page_text_area"),
	open_button = UIWidgets.create_default_button("open_button", scenegraph_definition.open_button.size, nil, nil, Localize("interaction_action_open"), 32, "green", nil, nil, disable_with_gamepad),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, nil, nil, Localize("interaction_action_close"), 32, nil, nil, nil, disable_with_gamepad),
	item_cap_warning_text = UIWidgets.create_simple_text(Localize("item_cap_warning_text"), "item_cap_warning_text", nil, nil, warning_text_style)
}
local input_description_widgets = {
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_panel", nil, nil, panel_color)
}
local console_tooltip_pass_definition = {
	"skin_applied",
	"deed_mission",
	"deed_difficulty",
	"mutators",
	"deed_rewards",
	"ammunition",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"weapon_skin_title",
	"item_information_text",
	"loot_chest_difficulty",
	"loot_chest_power_range",
	"unwieldable",
	"console_keywords",
	"console_item_description",
	"light_attack_stats",
	"heavy_attack_stats",
	"detailed_stats_light",
	"detailed_stats_heavy",
	"detailed_stats_push",
	"detailed_stats_ranged_light",
	"detailed_stats_ranged_heavy",
	"console_item_background"
}
local gamepad_tooltip_widgets = {
	item_tooltip_1 = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_1", console_tooltip_pass_definition),
	item_tooltip_2 = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_2", console_tooltip_pass_definition),
	item_tooltip_3 = UIWidgets.create_simple_item_presentation("gamepad_tooltip_option_3", console_tooltip_pass_definition)
}
local option_background_widgets = {
	loot_background_1 = UIWidgets.create_background("loot_option_1", scenegraph_definition.loot_option_1.size, "item_tooltip_background_old"),
	loot_background_2 = UIWidgets.create_background("loot_option_2", scenegraph_definition.loot_option_2.size, "item_tooltip_background_old"),
	loot_background_3 = UIWidgets.create_background("loot_option_3", scenegraph_definition.loot_option_3.size, "item_tooltip_background_old")
}
local option_widgets = {
	loot_option_1 = create_loot_widget(1, scenegraph_definition.loot_option_1.size),
	loot_option_2 = create_loot_widget(2, scenegraph_definition.loot_option_2.size),
	loot_option_3 = create_loot_widget(3, scenegraph_definition.loot_option_3.size)
}
local preview_widgets = {
	loot_option_1 = create_loot_preview_widget("loot_option_1", scenegraph_definition.loot_option_1.size),
	loot_option_2 = create_loot_preview_widget("loot_option_2", scenegraph_definition.loot_option_2.size),
	loot_option_3 = create_loot_preview_widget("loot_option_3", scenegraph_definition.loot_option_3.size)
}
local continue_button = UIWidgets.create_default_button("continue_button", scenegraph_definition.continue_button.size, nil, nil, Localize("continue"), 32, nil, nil, nil, disable_with_gamepad)
local debug_button_widgets = {
	debug_add_chest_1 = UIWidgets.create_default_button("debug_add_chest_1", scenegraph_definition.debug_add_chest_1.size, nil, nil, "DEBUG: Normal Chest", nil, "green"),
	debug_add_chest_2 = UIWidgets.create_default_button("debug_add_chest_2", scenegraph_definition.debug_add_chest_2.size, nil, nil, "DEBUG: Hard Chest", nil, "green"),
	debug_add_chest_3 = UIWidgets.create_default_button("debug_add_chest_3", scenegraph_definition.debug_add_chest_3.size, nil, nil, "DEBUG: Nightmare Chest", nil, "green"),
	debug_add_chest_4 = UIWidgets.create_default_button("debug_add_chest_4", scenegraph_definition.debug_add_chest_4.size, nil, nil, "DEBUG: Cataclysm Chest", nil, "green")
}
local generic_input_actions = {
	default = {},
	chest_selected = {
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "confirm",
				priority = 2,
				description_text = "interaction_action_open"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	chest_not_selected = {
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "confirm",
				priority = 2,
				description_text = "input_description_select"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	chest_opened = {
		actions = {
			{
				input_action = "d_horizontal",
				priority = 1,
				description_text = "input_description_select",
				ignore_keybinding = true
			},
			{
				input_action = "confirm",
				priority = 1,
				description_text = "input_description_open"
			},
			{
				input_action = "special_1",
				priority = 2,
				description_text = "input_description_tooltip"
			}
		}
	},
	loot_presented = {
		actions = {
			{
				input_action = "back",
				priority = 1,
				description_text = "input_description_close"
			},
			{
				input_action = "special_1",
				priority = 2,
				description_text = "input_description_tooltip"
			}
		}
	}
}
local animation_definitions = {
	open_loot_widget = {
		{
			name = "rumble",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local wwise_world = params.wwise_world

				WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_rumble")
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local bounce_anim_progress = math.bounce(progress)
				local content = widget.content
				local style = widget.style
				local offset = widget.offset
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local definition_size = definition.size
				offset[1] = 5 - 5 * math.catmullrom(bounce_anim_progress, 10, 1, 1, -1)
				offset[2] = 5 - 5 * math.catmullrom(bounce_anim_progress, -1, 1, 1, 10)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "glow_exit",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style
				style.lock_bottom_glow.color[1] = math.max(style.lock_bottom_glow.color[1], style.lock_bottom_glow.default_color[1] * anim_progress)
				style.lock_bottom_glow_2.color[1] = math.max(style.lock_bottom_glow_2.color[1], style.lock_bottom_glow_2.default_color[1] * anim_progress)
				style.lock_glow.color[1] = math.min(style.lock_glow.color[1], style.lock_glow.default_color[1] * (1 - anim_progress))
				style.lock_glow_1.color[1] = math.min(style.lock_glow_1.color[1], style.lock_glow_1.default_color[1] * (1 - anim_progress))
				style.lock_glow_2.color[1] = math.min(style.lock_glow_2.color[1], style.lock_glow_2.default_color[1] * (1 - anim_progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "open",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				if not params.played_open_sound then
					local wwise_world = params.wwise_world

					WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_open")

					params.played_open_sound = true
				end

				local anim_progress = math.easeInCubic(progress)
				local content = widget.content
				local style = widget.style
				local scenegraph_id = widget.scenegraph_id
				local definition = scenegraph_definition[scenegraph_id]
				local definition_size = definition.size
				local new_height = anim_progress * 400
				ui_scenegraph[scenegraph_id].size[2] = new_height
				local reward_option = params.reward_option
				local background_widget = reward_option.background_widget
				local background_content = background_widget.content.background
				local background_uvs = background_content.uvs
				local background_texture = background_content.texture_id
				local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
				background_uvs[2][2] = math.min(new_height / background_texture_settings.size[2], 1)
				style.item_name.offset[2] = new_height + 182 + 35
				style.item_name_shadow.offset[2] = style.item_name.offset[2] - 2
				style.item_type.offset[2] = (new_height + 182) - 5
				style.item_type_shadow.offset[2] = style.item_type.offset[2] - 2
				style.item_icon.offset[2] = new_height - 40
				style.item_tooltip.offset[2] = new_height - 40
				content.draw_frame = true
				local frame_style = style.frame
				frame_style.size[2] = new_height + 20
				frame_style.offset[2] = -10
				reward_option.opened = true
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				local presentation_complete = true
				local reward_option = params.reward_option
				local item_previewer = reward_option.item_previewer
				local reward_key = reward_option.reward_key

				if item_previewer and reward_key then
					item_previewer:present_item(reward_key)
				end

				local world_previewer = reward_option.world_previewer

				if world_previewer then
					world_previewer:force_unhide_character()
				end

				reward_option.presentation_complete = presentation_complete
				widget.content.presentation_complete = presentation_complete

				if not params.played_opened_sound then
					local wwise_world = params.wwise_world

					WwiseWorld.trigger_event(wwise_world, "play_gui_chest_reward_opened")

					params.played_opened_sound = true
				end
			end
		},
		{
			name = "glow_enter",
			start_progress = 0.6,
			end_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style
				style.final_glow.color[1] = math.max(style.final_glow.color[1], style.final_glow.default_color[1] * anim_progress)
				style.final_glow_1.color[1] = math.max(style.final_glow_1.color[1], style.final_glow_1.default_color[1] * anim_progress)
				style.final_glow_2.color[1] = math.max(style.final_glow_2.color[1], style.final_glow_2.default_color[1] * anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "fade_in_text",
			start_progress = 0.8,
			end_progress = 1.2,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local content = widget.content
				local style = widget.style
				local alpha = 255 * anim_progress
				style.item_name.text_color[1] = alpha
				style.item_name_shadow.text_color[1] = alpha
				style.item_type.text_color[1] = alpha
				style.item_type_shadow.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		}
	},
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	loot_option_positions_by_amount = loot_option_positions_by_amount,
	gamepad_tooltip_widgets = gamepad_tooltip_widgets,
	input_description_widgets = input_description_widgets,
	widgets = widgets,
	option_widgets = option_widgets,
	debug_button_widgets = debug_button_widgets,
	option_background_widgets = option_background_widgets,
	preview_widgets = preview_widgets,
	viewport_widget = viewport_widget,
	continue_button = continue_button,
	settings_by_screen = settings_by_screen,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	background_fade_definition = UIWidgets.create_simple_rect("dead_space_filler", {
		0,
		5,
		5,
		5
	})
}
