-- chunkname: @scripts/settings/versus_horde_ability_settings.lua

local horde_ability_settings = {
	cooldown = 300,
	enable_activation_in_ghost_mode = true,
	horde_units_batch_sync_interval = 1,
	max_num_horde_units_per_player = 32,
	max_score_difference_modifier = 250,
	recharge_boosts_on_downed_units = false,
	save_charges_between_rounds = true,
	team_size_difference_recharge_modifier = {
		[0] = 1,
		1.3,
		1.75,
		2.5,
	},
	score_difference_recharge_modifier = {
		[250] = {
			boost_mod = 1,
			cooldown_mod = 0.5,
		},
		[200] = {
			boost_mod = 1,
			cooldown_mod = 0.6,
		},
		[150] = {
			boost_mod = 1,
			cooldown_mod = 0.7,
		},
		[100] = {
			boost_mod = 1,
			cooldown_mod = 0.8,
		},
		[50] = {
			boost_mod = 1,
			cooldown_mod = 0.9,
		},
		[0] = {
			boost_mod = 1,
			cooldown_mod = 1,
		},
		[-50] = {
			boost_mod = 1.2,
			cooldown_mod = 1.1,
		},
		[-100] = {
			boost_mod = 1.4,
			cooldown_mod = 1.2,
		},
		[-150] = {
			boost_mod = 1.6,
			cooldown_mod = 1.3,
		},
		[-200] = {
			boost_mod = 1.8,
			cooldown_mod = 1.4,
		},
		[-250] = {
			boost_mod = 2,
			cooldown_mod = 1.5,
		},
	},
	compositions_per_faction = {
		beastmen = "versus_horde_ability_beastmen",
		chaos = "versus_horde_ability_chaos",
		skaven = "versus_horde_ability_skaven",
	},
	recharge_boosts = {
		actions = {
			gutter_runner_pinned = 6,
			hero_downed = 10,
			pack_master_grab = 6,
			pack_master_hoist = 24,
		},
		damage_sources = {
			vomit_face = 1.4,
			vs_chaos_troll_axe = 0.4,
			vs_gutter_runner = 1.2,
			vs_packmaster = 1.2,
			vs_poison_wind_globadier = 1,
			vs_rat_ogre_hands = 0.4,
			vs_ratling_gunner_gun = 0.15,
			vs_warpfire_thrower = 0.15,
		},
	},
}

return horde_ability_settings
