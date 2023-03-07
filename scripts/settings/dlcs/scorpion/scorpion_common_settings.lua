local settings = DLCSettings.scorpion
settings.unlock_settings = {
	scorpion_beta_extended_access = {
		class = "UnlockDlc",
		id = "1093530"
	}
}
settings.unlock_settings_xb1 = {
	scorpion = {
		id = "633879CB-F38D-409B-BBFE-48EA39EF3277",
		backend_reward_id = "scorpion",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		scorpion = {
			id = "39bf75fa504440fa967c4cdd16772fc6",
			product_label = "V2MAPPACKUS00003",
			class = "UnlockDlc",
			backend_reward_id = "scorpion"
		}
	},
	CUSA13645_00 = {
		scorpion = {
			id = "f649de4928ae4ca5831d8d06693c97a0",
			product_label = "V2MAPPACKEU00003",
			class = "UnlockDlc",
			backend_reward_id = "scorpion"
		}
	}
}
settings.statistics_lookup = {
	"scorpion_weaves_heavens_season_1",
	"weave_beasts_destroyed_totems",
	"weave_light_low_curse",
	"scorpion_weaves_fire_season_1",
	"weave_shadow_kill_no_shrouded",
	"weave_death_hit_by_spirit",
	"scorpion_keep_standard_bearer_alive"
}
settings.husk_lookup = {
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/wpn_dw_thrown_axe_01_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/prj_dw_thrown_axe_01_t2_magic_01_3ps",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2_magic_01",
	"units/test_unit/light_beacon",
	"units/weave/beasts/beast_totem_mutator",
	"units/gameplay/weave_capture_point",
	"units/gameplay/weave_interaction",
	"units/gameplay/weave_kill_enemies",
	"units/props/generic/weave_target",
	"units/gameplay/weave/weave_prop_skaven_doom_wheel_01"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_scorpion"
}
settings.end_view = {
	"scripts/ui/views/level_end/level_end_view_weave"
}
settings.end_view_state = {
	"scripts/ui/views/level_end/states/end_view_state_weave"
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/scorpion/scorpion_interactions"
}
