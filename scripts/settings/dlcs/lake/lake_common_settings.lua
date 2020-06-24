local settings = DLCSettings.lake
settings.career_setting_files = {
	"scripts/settings/dlcs/lake/career_settings_lake"
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/lake/passive_ability_questing_knight",
	"scripts/settings/dlcs/lake/career_ability_settings_lake"
}
settings.action_template_files = {
	"scripts/settings/dlcs/lake/action_templates_lake"
}
settings.talent_settings = {
	"scripts/settings/dlcs/lake/talent_settings_lake_empire_soldier"
}
settings.profile_files = {
	"scripts/settings/dlcs/lake/lake_profiles"
}
settings.local_backend_data = "scripts/settings/dlcs/lake/local_backend_data_lake"
settings.challenge_categories = {
	"questing_knight"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_lake"
}
settings.statistics_lookup = {
	"lake_mission_streak_act1_legend_es_questingknight",
	"lake_mission_streak_act2_legend_es_questingknight",
	"lake_mission_streak_act3_legend_es_questingknight",
	"lake_boss_killblow",
	"lake_charge_stagger",
	"lake_bastard_block",
	"lake_untouchable",
	"lake_speed_quest",
	"lake_timing_quest",
	"complete_all_grailknight_challenges"
}
settings.anim_lookup = {
	"swap_charge_stance",
	"holding_right_charge"
}
settings.effects = {
	"fx/grail_knight_active_ability"
}
settings.tracked_weapon_kills_per_breed_stats = {
	markus_questingknight_career_skill_weapon = {
		"holly"
	}
}
settings.unlock_settings = {
	lake = {
		class = "UnlockDlc",
		id = "1343500"
	},
	lake_upgrade = {
		class = "UnlockDlc",
		id = "1345990"
	}
}
settings.progression_unlocks = {
	es_questingknight = {
		description = "end_screen_career_unlocked",
		profile = "empire_soldier",
		value = "es_questingknight",
		title = "es_questingknight",
		level_requirement = 0,
		unlock_type = "career"
	}
}

return
