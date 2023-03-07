local settings = DLCSettings.steak
settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				sorting = 5,
				name = "achv_menu_levels_crater_category_title",
				entries = {
					"scorpion_complete_crater_recruit",
					"scorpion_complete_crater_veteran",
					"scorpion_complete_crater_champion",
					"scorpion_complete_crater_legend",
					"scorpion_complete_crater_cataclysm",
					"scorpion_crater_pendant",
					"scorpion_crater_dark_tongue_1",
					"scorpion_crater_dark_tongue_2",
					"scorpion_crater_dark_tongue_3",
					"scorpion_crater_detour",
					"scorpion_crater_ambush"
				}
			}
		}
	},
	heroes = {
		categories = {
			{
				name = "inventory_name_empire_soldier",
				entries = {
					"scorpion_markus_weapon_unlock"
				}
			},
			{
				name = "inventory_name_dwarf_ranger",
				entries = {
					"scorpion_bardin_weapon_unlock"
				}
			},
			{
				name = "inventory_name_wood_elf",
				entries = {
					"scorpion_kerillian_weapon_unlock"
				}
			},
			{
				name = "inventory_name_witch_hunter",
				entries = {
					"scorpion_victor_weapon_unlock"
				}
			},
			{
				name = "inventory_name_bright_wizard",
				entries = {
					"scorpion_sienna_weapon_unlock"
				}
			}
		}
	}
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_steak"
}
