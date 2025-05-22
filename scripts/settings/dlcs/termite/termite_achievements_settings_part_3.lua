-- chunkname: @scripts/settings/dlcs/termite/termite_achievements_settings_part_3.lua

local settings = DLCSettings.termite_part_3

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_termite_name",
				sorting = 9,
				entries = {
					"termite3_collectible_challenge",
					"termite3_searchlight_challenge",
					"termite3_generator_challenge",
					"termite3_portal_challenge",
					"termite3_complete_recruit",
					"termite3_complete_veteran",
					"termite3_complete_champion",
					"termite3_complete_legend",
					"termite3_complete_cataclysm",
					"termite3_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_termite_part_3",
}
