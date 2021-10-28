local_require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root_1 = {
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
	menu_root = {
		vertical_alignment = "center",
		parent = "root_1",
		horizontal_alignment = "center",
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
	title_divider = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			1800,
			2
		},
		position = {
			0,
			-150,
			1
		}
	},
	hero_panel = {
		vertical_alignment = "top",
		parent = "dead_space_filler",
		horizontal_alignment = "center",
		size = {
			1920,
			UISettings.hero_panel_height
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_panel_hero_bg = {
		vertical_alignment = "center",
		parent = "hero_panel",
		horizontal_alignment = "left",
		size = {
			417,
			UISettings.hero_panel_height
		},
		position = {
			0,
			0,
			11
		}
	},
	hero_panel_party_bg = {
		vertical_alignment = "center",
		parent = "hero_panel",
		horizontal_alignment = "right",
		size = {
			417,
			UISettings.hero_panel_height
		},
		position = {
			0,
			0,
			11
		}
	},
	exit_button = {
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
	panel_center_edge = {
		vertical_alignment = "bottom",
		parent = "hero_panel",
		horizontal_alignment = "center",
		size = {
			1920,
			9
		},
		position = {
			0,
			45,
			10
		}
	},
	panel_edge = {
		vertical_alignment = "bottom",
		parent = "hero_panel",
		horizontal_alignment = "center",
		size = {
			1920,
			56
		},
		position = {
			0,
			-35,
			12
		}
	},
	screen_selector = {
		vertical_alignment = "center",
		parent = "hero_panel",
		horizontal_alignment = "center",
		size = {
			1,
			1
		},
		position = {
			0,
			20,
			1
		}
	},
	title_text = {
		vertical_alignment = "bottom",
		parent = "hero_panel",
		horizontal_alignment = "center",
		size = {
			1000,
			28
		},
		position = {
			0,
			80,
			1
		}
	},
	title_description_text = {
		vertical_alignment = "top",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			1000,
			28
		},
		position = {
			0,
			-35,
			1
		}
	},
	hero_name_text = {
		vertical_alignment = "top",
		parent = "hero_panel",
		horizontal_alignment = "left",
		size = {
			1000,
			28
		},
		position = {
			10,
			-20,
			1
		}
	},
	hero_level_text = {
		vertical_alignment = "top",
		parent = "hero_name_text",
		horizontal_alignment = "left",
		size = {
			1000,
			28
		},
		position = {
			0,
			-28,
			1
		}
	},
	hero_prestige_level_text = {
		vertical_alignment = "top",
		parent = "hero_name_text",
		horizontal_alignment = "left",
		size = {
			1000,
			28
		},
		position = {
			120,
			-28,
			1
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "root_1",
		horizontal_alignment = "center",
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
	hero_selector = {
		vertical_alignment = "bottom",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			1,
			1
		},
		position = {
			0,
			50,
			1
		}
	}
}
local settings_by_screen = {
	{
		description = "switch character here",
		name = "character",
		display_name = "CHARACTER SELECTION",
		tab_screen = false,
		draw_background_world = true,
		state_name = "CharacterSelectionStateCharacter",
		icons = {
			selected = "tabs_icon_prestige_glow",
			normal = "tabs_icon_prestige"
		},
		camera_position = {
			0,
			0,
			-0.3
		},
		camera_rotation = {
			0,
			0,
			-0.1
		},
		contains_new_content = function ()
			return false
		end
	}
}
local title_text_style = {
	vertical_alignment = "center",
	font_size = 36,
	localize = false,
	horizontal_alignment = "center",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_text_style = {
	vertical_alignment = "bottom",
	font_size = 36,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_text_style = {
	vertical_alignment = "bottom",
	font_size = 20,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local title_description_text_style = {
	vertical_alignment = "top",
	font_size = 20,
	localize = false,
	horizontal_alignment = "center",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_icons = {
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead",
	"unit_frame_portrait_dead"
}
local disable_with_gamepad = true
local widgets_definitions = {
	viewport = {
		scenegraph_id = "dead_space_filler",
		element = {
			passes = {
				{
					pass_type = "viewport",
					style_id = "viewport"
				}
			}
		},
		style = {
			viewport = {
				scenegraph_id = "dead_space_filler",
				viewport_name = "inventory_preview_viewport",
				level_name = "levels/ui_character_selection/world",
				enable_sub_gui = false,
				fov = 50,
				world_name = "inventory_preview",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS
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
					-0.1
				}
			}
		},
		content = {}
	},
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	title_description_text = UIWidgets.create_simple_text("n/a", "title_description_text", nil, nil, title_description_text_style),
	hero_name_text = UIWidgets.create_simple_text("n/a", "hero_name_text", nil, nil, hero_name_text_style),
	hero_level_text = UIWidgets.create_simple_text("n/a", "hero_level_text", nil, nil, hero_level_text_style),
	hero_prestige_level_text = UIWidgets.create_simple_text("n/a", "hero_prestige_level_text", nil, nil, hero_level_text_style),
	background = UIWidgets.create_simple_texture("large_frame_01", "dead_space_filler"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("interaction_action_close"), nil, nil, nil, nil, disable_with_gamepad)
}
local animations = {}
local attachments = {
	witch_hunter = {
		{
			unit_name = "units/beings/player/witch_hunter/headpiece/wh_hat_03",
			linking = AttachmentNodeLinking.hat.slot_hat
		}
	},
	bright_wizard = {
		{
			unit_name = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff_3p",
			linking = AttachmentNodeLinking.staff.third_person.wielded
		},
		{
			unit_name = "units/beings/player/bright_wizard/headpiece/bw_clothgate_01",
			linking = AttachmentNodeLinking.bw_gate.slot_hat
		}
	},
	dwarf_ranger = {
		{
			unit_name = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.right.third_person.wielded
		},
		{
			unit_name = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.left.third_person.wielded
		},
		{
			unit_name = "units/beings/player/dwarf_ranger/headpiece/dr_helmet_01",
			linking = AttachmentNodeLinking.hat.slot_hat
		}
	},
	wood_elf = {
		{
			unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
			linking = AttachmentNodeLinking.arrow.third_person.wielded
		},
		{
			unit_name = "units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2_3p",
			linking = AttachmentNodeLinking.bow.third_person.wielded
		},
		{
			unit_name = "units/beings/player/way_watcher/headpiece/ww_hood_01",
			linking = AttachmentNodeLinking.hat_skinned.slot_hat
		}
	},
	empire_soldier = {
		{
			unit_name = "units/beings/player/empire_soldier/headpiece/es_hat_01",
			linking = AttachmentNodeLinking.hat.slot_hat
		},
		{
			unit_name = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2_3p",
			linking = AttachmentNodeLinking.one_handed_melee_weapon.right.third_person.wielded
		}
	}
}
local flow_events = {
	witch_hunter = {
		hovered = "witch_hunter_hovered",
		available = "witch_hunter_available",
		unavailable = "witch_hunter_unavailable",
		selected = "witch_hunter_selected",
		unselected = "witch_hunter_unselected",
		unhovered = "witch_hunter_unhovered"
	},
	bright_wizard = {
		hovered = "bright_wizard_hovered",
		available = "bright_wizard_available",
		unavailable = "bright_wizard_unavailable",
		selected = "bright_wizard_selected",
		unselected = "bright_wizard_unselected",
		unhovered = "bright_wizard_unhovered"
	},
	dwarf_ranger = {
		hovered = "dwarf_ranger_hovered",
		available = "dwarf_ranger_available",
		unavailable = "dwarf_ranger_unavailable",
		selected = "dwarf_ranger_selected",
		unselected = "dwarf_ranger_unselected",
		unhovered = "dwarf_ranger_unhovered"
	},
	wood_elf = {
		hovered = "wood_elf_hovered",
		available = "wood_elf_available",
		unavailable = "wood_elf_unavailable",
		selected = "wood_elf_selected",
		unselected = "wood_elf_unselected",
		unhovered = "wood_elf_unhovered"
	},
	empire_soldier = {
		hovered = "empire_soldier_hovered",
		available = "empire_soldier_available",
		unavailable = "empire_soldier_unavailable",
		selected = "empire_soldier_selected",
		unselected = "empire_soldier_unselected",
		unhovered = "empire_soldier_unhovered"
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions,
	settings_by_screen = settings_by_screen,
	attachments = attachments,
	flow_events = flow_events,
	animations = animations
}
