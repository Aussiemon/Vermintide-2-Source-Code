-- chunkname: @scripts/settings/dlcs/termite/termite_achievements_settings_part_1.lua

local settings = DLCSettings.termite_part_1

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_termite_name",
				sorting = 9,
				entries = {
					"termite1_skaven_markings_challenge",
					"termite1_bell_challenge",
					"termite1_towers_challenge",
					"termite1_waystone_timer_challenge_easy",
					"termite1_waystone_timer_challenge_hard",
					"termite1_complete_recruit",
					"termite1_complete_veteran",
					"termite1_complete_champion",
					"termite1_complete_legend",
					"termite1_complete_cataclysm",
					"termite1_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_termite_part_1",
}
