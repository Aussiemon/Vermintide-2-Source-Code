-- chunkname: @scripts/settings/dlcs/penny/penny_achievements_settings_part_3.lua

local settings = DLCSettings.penny_part_3

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_penny_name",
				sorting = 5,
				entries = {
					"penny_complete_castle",
					"penny_complete_castle_recruit",
					"penny_complete_castle_veteran",
					"penny_complete_castle_champion",
					"penny_complete_castle_legend",
					"penny_complete_castle_cataclysm",
					"penny_complete_recruit",
					"penny_complete_veteran",
					"penny_complete_champion",
					"penny_complete_legend",
					"penny_complete_cataclysm",
					"penny_castle_chalice",
					"penny_castle_skull",
					"penny_castle_flask",
					"penny_castle_eruptions",
					"penny_castle_no_kill",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_penny_part_3",
}
