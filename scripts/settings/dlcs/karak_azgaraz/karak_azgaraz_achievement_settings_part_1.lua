-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_1.lua

local settings = DLCSettings.karak_azgaraz_part_1

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_karak_azgaraz_name",
				sorting = 8,
				entries = {
					"dwarf_valaya_emote",
					"dwarf_rune",
					"dwarf_barrel_carry",
					"dwarf_bells",
					"dwarf_pressure",
					"karak_azgaraz_complete_dlc_dwarf_interior_recruit",
					"karak_azgaraz_complete_dlc_dwarf_interior_veteran",
					"karak_azgaraz_complete_dlc_dwarf_interior_champion",
					"karak_azgaraz_complete_dlc_dwarf_interior_legend",
					"karak_azgaraz_complete_dlc_dwarf_interior_cataclysm",
					"interior_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_karak_azgaraz_part_1",
}
