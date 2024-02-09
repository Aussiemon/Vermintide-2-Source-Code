-- chunkname: @scripts/settings/dlcs/lake/lake_common_settings.lua

local settings = DLCSettings.lake

settings.career_setting_files = {
	"scripts/settings/dlcs/lake/career_settings_lake",
}
settings.player_breeds = {
	"scripts/settings/dlcs/lake/player_breeds_lake",
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/lake/passive_ability_questing_knight",
	"scripts/settings/dlcs/lake/career_ability_settings_lake",
}
settings.action_template_files = {
	"scripts/settings/dlcs/lake/action_templates_lake",
}
settings.talent_settings = {
	"scripts/settings/dlcs/lake/talent_settings_lake_empire_soldier",
}
settings.profile_files = {
	"scripts/settings/dlcs/lake/lake_profiles",
}
settings.challenge_categories = {
	"questing_knight",
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_lake",
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
	"complete_all_grailknight_challenges",
}
settings.anim_lookup = {
	"swap_charge_stance",
	"holding_right_charge",
}
settings.effects = {
	"fx/grail_knight_active_ability",
}
settings.unlock_settings = {
	lake = {
		class = "UnlockDlc",
		id = "1343500",
		requires_restart = true,
	},
	lake_upgrade = {
		class = "UnlockDlc",
		id = "1345990",
		requires_restart = true,
	},
}
settings.unlock_settings_xb1 = {
	lake = {
		backend_reward_id = "lake",
		class = "UnlockDlc",
		id = "52544E39-5A56-305A-C058-52563853C200",
		requires_restart = true,
	},
	lake_upgrade = {
		backend_reward_id = "lake_upgrade",
		class = "UnlockDlc",
		id = "52544E39-5A56-305A-C058-52563853C200",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		lake = {
			backend_reward_id = "lake",
			class = "UnlockDlc",
			id = "7f6d2826dc0b4c23b28f56e169af41f6",
			product_label = "V2USGRAILKNIGHTK",
			requires_restart = true,
		},
		lake_upgrade = {
			backend_reward_id = "lake_upgrade",
			class = "UnlockDlc",
			id = "7f6d2826dc0b4c23b28f56e169af41f6",
			product_label = "V2USGRAILKNIGHTK",
		},
	},
	CUSA13645_00 = {
		lake = {
			backend_reward_id = "lake",
			class = "UnlockDlc",
			id = "bc65d303c0774842b2f06a164082d76b",
			product_label = "V2EUGRAILKNIGHTK",
			requires_restart = true,
		},
		lake_upgrade = {
			backend_reward_id = "lake_upgrade",
			class = "UnlockDlc",
			id = "bc65d303c0774842b2f06a164082d76b",
			product_label = "V2EUGRAILKNIGHTK",
		},
	},
}
settings.progression_unlocks = {
	es_questingknight = {
		description = "end_screen_career_unlocked",
		level_requirement = 0,
		profile = "empire_soldier",
		title = "es_questingknight",
		unlock_type = "career",
		value = "es_questingknight",
	},
}
