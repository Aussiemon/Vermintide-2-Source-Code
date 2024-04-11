-- chunkname: @scripts/settings/dlcs/karak_azgaraz/karak_azgaraz_achievement_settings_part_4.lua

local settings = DLCSettings.karak_azgaraz_part_4

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_karak_azgaraz_name",
				sorting = 8,
				entries = {
					"dwarf_feculent_buboes",
					"dwarf_statue_emote",
					"dwarf_barrel_kill",
					"dwarf_go_fish",
					"dwarf_elevator_speedrun",
					"karak_azgaraz_complete_dlc_dwarf_whaling_recruit",
					"karak_azgaraz_complete_dlc_dwarf_whaling_veteran",
					"karak_azgaraz_complete_dlc_dwarf_whaling_champion",
					"karak_azgaraz_complete_dlc_dwarf_whaling_legend",
					"karak_azgaraz_complete_dlc_dwarf_whaling_cataclysm",
					"whaling_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_karak_azgaraz_part_4",
}
