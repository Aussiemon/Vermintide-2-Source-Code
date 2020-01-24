local settings = DLCSettings.penny_part_1
settings.achievement_outline = {
	levels = {
		entries = {},
		categories = {
			{
				sorting = 5,
				name = "area_selection_penny_name",
				entries = {
					"penny_portals_portal",
					"penny_portals_heads",
					"penny_portals_cleanser",
					"penny_portals_vintage",
					"penny_portals_hideout",
					"penny_complete_portals",
					"penny_complete_portals_recruit",
					"penny_complete_portals_veteran",
					"penny_complete_portals_champion",
					"penny_complete_portals_legend",
					"penny_complete_portals_cataclysm"
				}
			}
		}
	}
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_penny_part_1"
}

return
