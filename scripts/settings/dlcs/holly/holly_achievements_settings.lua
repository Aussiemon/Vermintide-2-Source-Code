-- chunkname: @scripts/settings/dlcs/holly/holly_achievements_settings.lua

local settings = DLCSettings.holly

settings.achievement_outline = {
	levels = {
		entries = {
			"holly_complete_recruit",
			"holly_complete_veteran",
			"holly_complete_champion",
			"holly_complete_legend",
			"scorpion_complete_back_to_ubersreik_cataclysm",
			"holly_complete_plaza_recruit",
			"holly_complete_plaza_veteran",
			"holly_complete_plaza_champion",
			"holly_complete_plaza_legend",
			"scorpion_complete_plaza_cataclysm",
		},
		categories = {
			{
				name = "achv_menu_levels_holly_category_title",
				sorting = 3,
				entries = {
					"holly_find_all_runes",
					"holly_magnus_barrel_relay_race",
					"holly_magnus_barrel_relay_race_hardest",
					"holly_magnus_secret_room",
					"holly_magnus_gutter_runner_treasure",
					"holly_magnus_gutter_runner_treasure_hardest",
					"holly_forest_ambush_synchronized_explosives",
					"holly_forest_ambush_synchronized_explosives_hardest",
					"holly_forest_ambush_bretonnian_dance",
					"holly_forest_ambush_dragonbane_gem",
					"holly_cemetery_sleep",
					"holly_cemetery_synchronized_chains",
					"holly_cemetery_synchronized_chains_hardest",
					"holly_cemetery_bones",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_holly",
}
