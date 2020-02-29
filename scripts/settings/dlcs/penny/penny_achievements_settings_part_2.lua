local settings = DLCSettings.penny_part_2
settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				sorting = 5,
				name = "area_selection_penny_name",
				entries = {
					"penny_bastion_journal",
					"penny_bastion_overstay",
					"penny_bastion_sprinter",
					"penny_bastion_yorick",
					"penny_bastion_torch",
					"penny_complete_bastion",
					"penny_complete_bastion_recruit",
					"penny_complete_bastion_veteran",
					"penny_complete_bastion_champion",
					"penny_complete_bastion_legend",
					"penny_complete_bastion_cataclysm"
				}
			}
		}
	}
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_penny_part_2"
}

return
