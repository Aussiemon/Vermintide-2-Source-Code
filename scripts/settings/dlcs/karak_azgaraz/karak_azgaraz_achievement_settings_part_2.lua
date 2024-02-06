-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_2.lua

local settings = DLCSettings.karak_azgaraz_part_2

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_karak_azgaraz_name",
				sorting = 8,
				entries = {
					"dwarf_towers",
					"dwarf_chain_speed",
					"dwarf_jump_puzzle",
					"dwarf_push",
					"karak_azgaraz_complete_dlc_dwarf_exterior_recruit",
					"karak_azgaraz_complete_dlc_dwarf_exterior_veteran",
					"karak_azgaraz_complete_dlc_dwarf_exterior_champion",
					"karak_azgaraz_complete_dlc_dwarf_exterior_legend",
					"karak_azgaraz_complete_dlc_dwarf_exterior_cataclysm",
					"exterior_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_karak_azgaraz_part_2",
}
