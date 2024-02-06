-- chunkname: @scripts/settings/dlcs/wizards/wizards_achievements_settings_part_1.lua

local settings = DLCSettings.wizards_part_1

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_onions_name",
				sorting = 8,
				entries = {
					"trail_cog_strike",
					"trail_shatterer",
					"trail_sleigher",
					"trail_beacons_are_lit",
					"onions_complete_trail_recruit",
					"onions_complete_trail_veteran",
					"onions_complete_trail_champion",
					"onions_complete_trail_legend",
					"onions_complete_trail_cataclysm",
					"onions_complete_all",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_wizards_part_1",
}
