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
		"lake"
	}
}
settings.unlock_settings = {
	lake = {
		id = "1343500",
		class = "UnlockDlc",
		requires_restart = true
	},
	lake_upgrade = {
		id = "1345990",
		class = "UnlockDlc",
		requires_restart = true
	}
}
settings.unlock_settings_xb1 = {
	lake = {
		id = "52544E39-5A56-305A-C058-52563853C200",
		backend_reward_id = "lake",
		class = "UnlockDlc",
		requires_restart = true
	},
	lake_upgrade = {
		id = "52544E39-5A56-305A-C058-52563853C200",
		backend_reward_id = "lake_upgrade",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		lake = {
			product_label = "V2USGRAILKNIGHTK",
			backend_reward_id = "lake",
			class = "UnlockDlc",
			requires_restart = true,
			id = "7f6d2826dc0b4c23b28f56e169af41f6"
		},
		lake_upgrade = {
			id = "7f6d2826dc0b4c23b28f56e169af41f6",
			product_label = "V2USGRAILKNIGHTK",
			class = "UnlockDlc",
			backend_reward_id = "lake_upgrade"
		}
	},
	CUSA13645_00 = {
		lake = {
			product_label = "V2EUGRAILKNIGHTK",
			backend_reward_id = "lake",
			class = "UnlockDlc",
			requires_restart = true,
			id = "bc65d303c0774842b2f06a164082d76b"
		},
		lake_upgrade = {
			id = "bc65d303c0774842b2f06a164082d76b",
			product_label = "V2EUGRAILKNIGHTK",
			class = "UnlockDlc",
			backend_reward_id = "lake_upgrade"
		}
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
