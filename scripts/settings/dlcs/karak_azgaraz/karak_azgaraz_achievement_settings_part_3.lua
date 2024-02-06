-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_3.lua

local settings = DLCSettings.karak_azgaraz_part_3

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_karak_azgaraz_name",
				sorting = 8,
				entries = {
					"dwarf_pressure_pad",
					"dwarf_big_jump",
					"dwarf_crows",
					"dwarf_speedrun",
					"karak_azgaraz_complete_dlc_dwarf_beacons_recruit",
					"karak_azgaraz_complete_dlc_dwarf_beacons_veteran",
					"karak_azgaraz_complete_dlc_dwarf_beacons_champion",
					"karak_azgaraz_complete_dlc_dwarf_beacons_legend",
					"karak_azgaraz_complete_dlc_dwarf_beacons_cataclysm",
					"beacons_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_karak_azgaraz_part_3",
}
