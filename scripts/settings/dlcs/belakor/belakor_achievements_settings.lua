local settings = DLCSettings.belakor
settings.achievement_outline = {
	levels = {
		categories = {
			{
				sorting = 7,
				name = "area_selection_morris_name",
				entries = {
					"blk_complete_arena",
					"blk_three_champions",
					"blk_fast_arena",
					"blk_fast_kill_totems",
					"blk_synced_destruction",
					"blk_white_run",
					"blk_clutch_skull",
					"blk_no_totem",
					"blk_hitless_skull",
					"complete_all_belakor_challenges"
				}
			}
		}
	}
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_belakor"
}
settings.achievement_events = {}

return
