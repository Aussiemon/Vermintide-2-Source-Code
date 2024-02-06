-- chunkname: @scripts/settings/dlcs/paperweight/paperweight_achievements_settings.lua

local settings = DLCSettings.paperweight

settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_paperweight",
}
settings.achievement_outline = {
	heroes = {
		categories = {
			{
				name = "inventory_name_empire_soldier",
				entries = {
					"holly_kruber_complete_all_levels",
					"holly_kruber_weapon_skin_2",
					"holly_kruber_weapon_skin_3",
				},
			},
			{
				name = "inventory_name_dwarf_ranger",
				entries = {
					"holly_bardin_complete_all_levels",
					"holly_bardin_weapon_skin_2",
					"holly_bardin_weapon_skin_3",
				},
			},
			{
				name = "inventory_name_wood_elf",
				entries = {
					"holly_kerillian_complete_all_levels",
					"holly_kerillian_weapon_skin_2",
					"holly_kerillian_weapon_skin_3",
				},
			},
			{
				name = "inventory_name_witch_hunter",
				entries = {
					"holly_saltzpyre_complete_all_levels",
					"holly_saltzpyre_weapon_skin_2",
					"holly_saltzpyre_weapon_skin_3",
				},
			},
			{
				name = "inventory_name_bright_wizard",
				entries = {
					"holly_sienna_complete_all_levels",
					"holly_sienna_weapon_skin_2",
					"holly_sienna_weapon_skin_3",
				},
			},
		},
	},
}
