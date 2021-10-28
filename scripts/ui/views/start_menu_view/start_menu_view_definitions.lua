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
	screen = {
		scale = "fit",
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
	exit_button = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			40,
			40
		},
		position = {
			0,
			0,
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
		name = "overview",
		display_name = "CHARACTER SELECTION",
		tab_screen = false,
		draw_background_world = true,
		state_name = "StartMenuStateOverview",
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
	},
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
	},
	{
		description = "Start game",
		name = "lobby_browser",
		display_name = "Lobby Browser",
		tab_screen = true,
		draw_background_world = true,
		state_name = "StartGameStateLobbyBrowser",
		icons = {
			selected = "tabs_icon_matchmaking_glow",
			normal = "tabs_icon_matchmaking"
		},
		camera_position = {
			0,
			0,
			0
		},
		camera_rotation = {
			0,
			0,
			0
		},
		contains_new_content = function ()
			return false
		end
	}
}
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
	exit_button = UIWidgets.create_simple_two_state_button("exit_button", "tabs_icon_close", "tabs_icon_close_glow"),
	console_cursor = UIWidgets.create_console_cursor("console_cursor")
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
