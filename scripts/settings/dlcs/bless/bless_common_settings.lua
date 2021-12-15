local settings = DLCSettings.bless
settings.career_setting_files = {
	"scripts/settings/dlcs/bless/career_settings_bless"
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/bless/career_ability_settings_bless"
}
settings.action_template_files = {
	"scripts/settings/dlcs/bless/action_templates_bless"
}
settings.talent_settings = {
	"scripts/settings/dlcs/bless/talent_settings_bless"
}
settings.profile_files = {
	"scripts/settings/dlcs/bless/bless_profiles"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_bless"
}
settings.statistics_lookup = {
	"bless_punch_back",
	"bless_saved_by_perk",
	"bless_block_attacks",
	"bless_righteous_stagger"
}
settings.hero_hud_components = {
	"PriestResourceBarUI"
}
settings.anim_lookup = {
	"bless_start",
	"bless_cancel",
	"bless_self",
	"bless_other",
	"bless_target_other",
	"bless_target_self",
	"righteous_fury_start",
	"righteous_fury_attack",
	"book_cast_buff_01",
	"book_cast_buff_02",
	"book_cast_buff_03",
	"spell_pose"
}
settings.effects = {
	"fx/wp_enemy_explosion"
}
settings.tracked_weapon_kills_per_breed_stats = {}
settings._tracked_weapon_kill_stats = {}
settings.dot_type_lookup = {
	victor_priest_nuke_dot = "burning_dot"
}
settings.unlock_settings = {
	bless = {
		id = "1782450",
		class = "UnlockDlc",
		requires_restart = true
	},
	bless_upgrade = {
		id = "1782451",
		class = "UnlockDlc",
		requires_restart = true
	}
}
settings.unlock_settings_xb1 = {
	bless = {
		id = "4A4E4E39-5646-3058-C053-53384D518F00",
		backend_reward_id = "bless",
		class = "UnlockDlc",
		requires_restart = true
	},
	bless_upgrade = {
		id = "4A4E4E39-5646-3058-C053-53384D518F00",
		backend_reward_id = "bless_upgrade",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		bless = {
			product_label = "V2USWARRIORPRIES",
			backend_reward_id = "bless",
			class = "UnlockDlc",
			requires_restart = true,
			id = "4ba165834b5b404c9ae6172f6e69452d"
		},
		bless_upgrade = {
			id = "4ba165834b5b404c9ae6172f6e69452d",
			product_label = "V2USWARRIORPRIES",
			class = "UnlockDlc",
			backend_reward_id = "bless_upgrade"
		}
	},
	CUSA13645_00 = {
		bless = {
			product_label = "V2EUWARRIORPRIES",
			backend_reward_id = "bless",
			class = "UnlockDlc",
			requires_restart = true,
			id = "3c117d927ef3441d9c7583b9980c956b"
		},
		bless_upgrade = {
			id = "3c117d927ef3441d9c7583b9980c956b",
			product_label = "V2EUWARRIORPRIES",
			class = "UnlockDlc",
			backend_reward_id = "bless_upgrade"
		}
	}
}
settings.progression_unlocks = {
	wh_priest = {
		description = "end_screen_career_unlocked",
		profile = "witch_hunter",
		value = "wh_priest",
		title = "wh_priest",
		level_requirement = 0,
		unlock_type = "career"
	}
}

return
