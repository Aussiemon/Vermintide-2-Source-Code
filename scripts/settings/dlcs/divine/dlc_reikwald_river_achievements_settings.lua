-- chunkname: @scripts/settings/dlcs/divine/dlc_reikwald_river_achievements_settings.lua

local settings = DLCSettings.divine

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_divine_name",
				sorting = 10,
				entries = {
					"divine_all_challenges",
					"divine_complete_recruit",
					"divine_complete_veteran",
					"divine_complete_champion",
					"divine_complete_legend",
					"divine_complete_cataclysm",
					"divine_nautical_miles_challenge",
					"divine_anchor_challenge",
					"divine_sink_ships_challenge",
					"divine_cannon_challenge",
					"divine_chaos_warrior_challenge",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_divine",
}
