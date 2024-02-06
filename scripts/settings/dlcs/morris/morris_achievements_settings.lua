-- chunkname: @scripts/settings/dlcs/morris/morris_achievements_settings.lua

local settings = DLCSettings.morris

settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_morris",
}
settings.achievement_outline = {
	levels = {
		categories = {
			{
				name = "area_selection_morris_name",
				sorting = 7,
				entries = {
					"morris_complete_journey_citadel",
					"morris_complete_journey_dominant_god_khorne",
					"morris_complete_journey_dominant_god_nurgle",
					"morris_complete_journey_dominant_god_tzeentch",
					"morris_complete_journey_dominant_god_slaanesh",
					"morris_complete_journey_citadel_we_champion",
					"morris_complete_journey_citadel_we_legend",
					"morris_complete_journey_citadel_we_cataclysm",
					"morris_complete_journey_citadel_wh_champion",
					"morris_complete_journey_citadel_wh_legend",
					"morris_complete_journey_citadel_wh_cataclysm",
					"morris_complete_journey_citadel_dr_champion",
					"morris_complete_journey_citadel_dr_legend",
					"morris_complete_journey_citadel_dr_cataclysm",
					"morris_complete_journey_citadel_bw_champion",
					"morris_complete_journey_citadel_bw_legend",
					"morris_complete_journey_citadel_bw_cataclysm",
					"morris_complete_journey_citadel_es_champion",
					"morris_complete_journey_citadel_es_legend",
					"morris_complete_journey_citadel_es_cataclysm",
				},
			},
		},
	},
}
