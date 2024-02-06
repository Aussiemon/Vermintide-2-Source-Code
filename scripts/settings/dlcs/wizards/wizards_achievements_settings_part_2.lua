-- chunkname: @scripts/settings/dlcs/wizards/wizards_achievements_settings_part_2.lua

local settings = DLCSettings.wizards_part_2

settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				name = "area_selection_onions_name",
				sorting = 8,
				entries = {
					"tower_skulls",
					"tower_wall_illusions",
					"tower_invisible_bridge",
					"tower_enable_guardian_of_lustria",
					"tower_note_puzzle",
					"tower_created_all_potions",
					"tower_time_challenge",
					"tower_normal",
					"tower_hard",
					"tower_harder",
					"tower_hardest",
					"tower_cataclysm",
					"tower_all_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_wizards_part_2",
}
