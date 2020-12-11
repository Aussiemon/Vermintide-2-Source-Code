local settings = DLCSettings.cog
settings.career_setting_files = {
	"scripts/settings/dlcs/cog/career_settings_cog"
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/cog/passive_ability_engineer",
	"scripts/settings/dlcs/cog/career_ability_settings_cog"
}
settings.action_template_files = {
	"scripts/settings/dlcs/cog/action_templates_cog"
}
settings.talent_settings = {
	"scripts/settings/dlcs/cog/talent_settings_cog_dwarf_ranger"
}
settings.profile_files = {
	"scripts/settings/dlcs/cog/cog_profiles"
}
settings.local_backend_data = "scripts/settings/dlcs/cog/local_backend_data_cog"
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_cog"
}
settings.attachment_node_linking = {
	"scripts/settings/dlcs/cog/attachment_node_linking_cog"
}
settings.interactions = {
	"cog_missing_cog_pickup"
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/cog/cog_interactions"
}
settings.statistics_lookup = {
	"cog_mission_streak_act1_legend_dr_engineer",
	"cog_mission_streak_act2_legend_dr_engineer",
	"cog_mission_streak_act3_legend_dr_engineer",
	"climbing_enemies_killed",
	"steam_pistol_headshots",
	"cog_bomb_kills",
	"clutch_pumps",
	"hammer_cliff_pushes",
	"cog_exploding_barrel_kills",
	"cog_hammer_kill_storm",
	"cog_hammer_kill_leech",
	"cog_hammer_kill_hale",
	"cog_air_bomb",
	"cog_penta_bomb",
	"cog_fire_bomb",
	"cog_kill_barrage",
	"cog_all_kill_barrage",
	"cog_long_bomb",
	"cog_hammer_axe_kills",
	"cog_wizard_hammer",
	"cog_steam_elite_kill",
	"cog_steam_alt",
	"cog_bomb_grind",
	"cog_chain_headshot",
	"cog_crank_kill_ratling",
	"cog_pistol_headshot_grind",
	"cog_clutch_pump",
	"cog_hammer_cliff_push",
	"cog_only_crank",
	"cog_long_crank_fire",
	"cog_missing_cog",
	"complete_all_engineer_challenges"
}
settings.anim_lookup = {
	"to_steam_pistol",
	"to_steam_pistol_noammo",
	"to_cog_hammer",
	"switch_to_normal",
	"switch_to_charged",
	"cog_hammer_mode",
	"to_engineer_career_skill"
}
settings.effects = {}
settings.tracked_weapon_kills_per_breed_stats = {
	dr_2h_cog_hammer = {
		"cog"
	},
	dr_steam_pistol = {
		"cog"
	},
	bardin_engineer_career_skill_weapon = {
		"cog"
	},
	bardin_engineer_career_skill_weapon_heavy = {
		"cog"
	}
}
settings._tracked_weapon_kill_stats = {
	bardin_engineer_career_skill_weapon = {
		"cog"
	},
	bardin_engineer_career_skill_weapon_heavy = {
		"cog"
	},
	dr_2h_cog_hammer = {
		"cog"
	}
}
settings.unlock_settings = {
	cog = {
		id = "1443780",
		class = "UnlockDlc",
		requires_restart = true
	},
	cog_upgrade = {
		id = "1443790",
		class = "UnlockDlc",
		requires_restart = true
	}
}
settings.unlock_settings_xb1 = {
	cog = {
		id = "48544E39-5A31-3058-C047-324D54486800",
		backend_reward_id = "cog",
		class = "UnlockDlc",
		requires_restart = true
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		cog = {
			product_label = "V2USENGINEERCARB",
			backend_reward_id = "cog",
			class = "UnlockDlc",
			requires_restart = true,
			id = "10cc3340ad9040e29daa599e48249a64"
		}
	},
	CUSA13645_00 = {
		cog = {
			product_label = "V2EUENGINEERCARB",
			backend_reward_id = "cog",
			class = "UnlockDlc",
			requires_restart = true,
			id = "1693ba3b42364865a57670ae52b05477"
		}
	}
}
settings.progression_unlocks = {
	dr_engineer = {
		description = "end_screen_career_unlocked",
		profile = "dwarf_ranger",
		value = "dr_engineer",
		title = "dr_engineer",
		level_requirement = 0,
		unlock_type = "career"
	}
}

return
