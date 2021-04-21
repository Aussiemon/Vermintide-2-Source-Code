require("scripts/ui/views/deus_menu/ui_widgets_deus")

local full_size = {
	1920,
	1080
}
local item_size = {
	410,
	0
}
local item_spacing = 18
local title_size = {
	360,
	32
}
local weapon_melee_position = {
	item_spacing,
	-120,
	1
}
local slot_size = {
	410,
	250
}
local healing_slot_position = {
	-slot_size[1] - item_spacing,
	-300,
	1
}
local potion_slot_position = {
	-slot_size[1] - item_spacing,
	healing_slot_position[2] - slot_size[2] - item_spacing,
	1
}
local grenade_slot_position = {
	-slot_size[1] - item_spacing,
	potion_slot_position[2] - slot_size[2] - item_spacing,
	1
}
local weapon_title_position = {
	item_size[1] * 0.5,
	0,
	1
}
local weapon_ranged_position = {
	weapon_melee_position[1] + item_size[1] + item_spacing,
	weapon_melee_position[2],
	1
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen_center = {
		vertical_alignment = "center",
		parent = "screen",
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
	window = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = full_size,
		position = {
			0,
			0,
			1
		}
	},
	weapon_melee = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = weapon_melee_position
	},
	weapon_ranged = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = weapon_ranged_position
	},
	weapon_melee_title = {
		vertical_alignment = "bottom",
		parent = "weapon_melee",
		horizontal_alignment = "center",
		size = title_size,
		position = weapon_title_position
	},
	weapon_ranged_title = {
		vertical_alignment = "bottom",
		parent = "weapon_ranged",
		horizontal_alignment = "center",
		size = title_size,
		position = weapon_title_position
	},
	healing_slot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = healing_slot_position
	},
	potion_slot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = potion_slot_position
	},
	grenade_slot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = grenade_slot_position
	}
}
local tooltip_passes = {
	"item_titles",
	"skin_applied",
	"ammunition",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"weapon_skin_title",
	"keywords",
	"light_attack_stats",
	"heavy_attack_stats",
	"detailed_stats_light",
	"detailed_stats_heavy",
	"detailed_stats_push",
	"detailed_stats_ranged_light",
	"detailed_stats_ranged_heavy"
}

local function create_title_widget(scenegraph_id, text)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "bg"
				},
				{
					style_id = "frame",
					pass_type = "texture_frame",
					texture_id = "frame",
					content_change_function = function (content, style)
						content.frame = UIFrameSettings[content.frame_settings_name].texture
						style.texture_size = UIFrameSettings[content.frame_settings_name].texture_size
						style.texture_sizes = UIFrameSettings[content.frame_settings_name].texture_sizes
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			frame_settings_name = "item_tooltip_frame_01",
			text = text
		},
		style = {
			frame = {},
			bg = {
				color = {
					255,
					3,
					3,
					3
				}
			},
			text = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255)
			},
			text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					1,
					-1,
					-1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local widgets = {
	weapon_melee = UIWidgets.create_simple_item_tooltip("weapon_melee", tooltip_passes),
	weapon_ranged = UIWidgets.create_simple_item_tooltip("weapon_ranged", tooltip_passes),
	weapon_melee_title = create_title_widget("weapon_melee_title", "deus_weapon_inspect_primary_title"),
	weapon_ranged_title = create_title_widget("weapon_ranged_title", "deus_weapon_inspect_secondary_title"),
	healing_slot = UIWidgets.create_framed_info_box("healing_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_healing_title"), "consumables_empty_medpack", {
		50,
		50
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable")),
	potion_slot = UIWidgets.create_framed_info_box("potion_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_potion_title"), "consumables_empty_potion", {
		50,
		50
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable")),
	grenade_slot = UIWidgets.create_framed_info_box("grenade_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_grenade_title"), "consumables_empty_grenade", {
		50,
		50
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable"))
}
local weapon_melee_content = widgets.weapon_melee.content
weapon_melee_content.disable_fade_in = true
weapon_melee_content.no_equipped_item = true
weapon_melee_content.force_top_alignment = true
local weapon_ranged_content = widgets.weapon_ranged.content
weapon_ranged_content.disable_fade_in = true
weapon_ranged_content.no_equipped_item = true
weapon_ranged_content.force_top_alignment = true

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets
}
