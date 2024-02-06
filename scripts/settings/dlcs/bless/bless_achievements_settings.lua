-- chunkname: @scripts/settings/dlcs/bless/bless_achievements_settings.lua

local settings = DLCSettings.bless

settings.achievement_outline = {
	heroes = {
		categories = {
			{
				name = "inventory_name_witch_hunter",
				sorting = 4,
				entries = {
					"bless_complete_all_helmgart_levels_wh_priest",
					"bless_complete_25_missions_wh_priest",
					"bless_saved_by_perk",
					"bless_book_run",
					"bless_heal_allies",
					"bless_fast_shield",
					"bless_unbreakable_damage_block",
					"bless_punch_back",
					"bless_cluch_revive",
					"bless_ranged_raki",
					"bless_chaos_warriors",
					"bless_very_righteous",
					"bless_smite_enemies",
					"bless_great_hammer_headshots",
					"bless_kill_specials_hammer_book",
					"bless_mighty_blow",
					"bless_block_attacks",
					"bless_righteous_stagger",
					"bless_charged_hammer",
					"bless_protected_killing",
					"complete_all_warrior_priest_challenges",
				},
			},
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_bless",
}
settings.achievement_events = {}
