MorrisBuffTweakData = MorrisBuffTweakData or {
	friendly_murderer_potion = {
		duration = 10,
		range = 10,
		difficulty_multiplier = {
			harder = 0.3,
			hard = 0.35,
			normal = 0.4,
			hardest = 0.25,
			cataclysm = 0.2,
			cataclysm_3 = 0.2,
			cataclysm_2 = 0.2,
			easy = 0.4
		}
	},
	friendly_murderer_potion_increased = {
		duration = 20,
		range = 10,
		difficulty_multiplier = {
			harder = 0.3,
			hard = 0.35,
			normal = 0.4,
			hardest = 0.25,
			cataclysm = 0.2,
			cataclysm_3 = 0.2,
			cataclysm_2 = 0.2,
			easy = 0.4
		}
	},
	hold_my_beer_potion = {
		multiplier = 1,
		movespeed_multiplier = 0.5,
		duration = 20,
		movespeed_duration = 1.5,
		fx_duration = 20
	},
	hold_my_beer_potion_increased = {
		multiplier = 1.5,
		movespeed_multiplier = 0.75,
		duration = 30,
		movespeed_duration = 1.5,
		fx_duration = 30
	},
	liquid_bravado_potion = {
		multiplier = 1,
		duration = 15
	},
	liquid_bravado_potion_increased = {
		multiplier = 1.5,
		duration = 25
	},
	vampiric_draught_potion = {
		duration = 15,
		difficulty_multiplier = {
			harder = 0.3,
			hard = 0.35,
			normal = 0.4,
			hardest = 0.25,
			cataclysm = 0.2,
			cataclysm_3 = 0.2,
			cataclysm_2 = 0.2,
			easy = 0.4
		}
	},
	vampiric_draught_potion_increased = {
		duration = 30,
		difficulty_multiplier = {
			harder = 0.3,
			hard = 0.35,
			normal = 0.4,
			hardest = 0.25,
			cataclysm = 0.2,
			cataclysm_3 = 0.2,
			cataclysm_2 = 0.2,
			easy = 0.4
		}
	},
	moot_milk_potion = {
		activation_effect = "fx/screenspace_hungover_01",
		dodge_distance_multiplier = 2,
		dodge_speed_multiplier = 2,
		effect_duration = 3,
		duration = 30
	},
	moot_milk_potion_increased = {
		activation_effect = "fx/screenspace_hungover_01",
		dodge_distance_multiplier = 3,
		dodge_speed_multiplier = 3,
		effect_duration = 3,
		duration = 45
	},
	killer_in_the_shadows_potion = {
		duration = 5
	},
	killer_in_the_shadows_potion_increased = {
		duration = 15
	},
	pockets_full_of_bombs_potion = {
		movespeed_multiplier = 0.5,
		duration = 10,
		movespeed_duration = 10
	},
	pockets_full_of_bombs_potion_increased = {
		movespeed_multiplier = 0.75,
		duration = 20,
		movespeed_duration = 20
	},
	poison_proof_potion = {
		duration = 120
	},
	poison_proof_potion_increased = {
		duration = 240
	},
	attack_speed = {
		multiplier = 0.1
	},
	stamina = {
		bonus = 4
	},
	push_block_arc = {
		multiplier = 0.6
	},
	crit_chance = {
		bonus = 0.1
	},
	ability_cooldown_reduction = {
		multiplier = -0.2
	},
	crit_boost = {
		multiplier = 0.4
	},
	power_vs_skaven = {
		multiplier = 0.2
	},
	power_vs_chaos = {
		multiplier = 0.2
	},
	power_vs_unarmoured = {
		multiplier = 0.2
	},
	power_vs_armoured = {
		multiplier = 0.2
	},
	power_vs_large = {
		multiplier = 0.4
	},
	power_vs_frenzy = {
		multiplier = 0.2
	},
	health = {
		multiplier = 0.2
	},
	block_cost = {
		multiplier = -0.3
	},
	protection_skaven = {
		multiplier = 0.2
	},
	protection_chaos = {
		multiplier = 0.2
	},
	protection_aoe = {
		multiplier = 0.3
	},
	respawn_speed = {
		multiplier = -0.6
	},
	revive_speed = {
		multiplier = -0.6
	},
	fatigue_regen = {
		multiplier = 0.3
	},
	movespeed = {
		description_value = 0.05,
		multiplier = 1.05
	},
	curse_resistance = {
		multiplier = -0.5
	},
	home_brewer = {
		proc_chance = 0.25
	},
	decanter = {
		multiplier = 0.5
	},
	concoction = {
		multiplier = -0.5
	},
	healers_touch = {
		proc_chance = 0.25
	},
	hand_of_shallya = {
		multiplier = 0.5
	},
	power_up_of_shallya = {
		multiplier = 0.3
	},
	natural_bond = {
		time_between_heals = 5,
		heal_amount = 1
	},
	barkskin = {
		sub_buff_duration = 2,
		multiplier = -0.4
	},
	grenadier = {
		proc_chance = 0.5
	},
	explosive_ordinance = {
		multiplier = 0.5
	},
	deus_coin_pickup_regen_buff = {
		heal = 5,
		duration = 10
	},
	deus_ammo_pickup_range_pen_buff = {
		duration = 15,
		bonus = 2
	},
	deus_ammo_pickup_reload_speed_buff = {
		duration = 10,
		multiplier = -0.5
	},
	deus_large_ammo_pickup_infinite_ammo_buff = {
		duration = 10
	},
	deus_revive_regen_buff = {
		heal = 2,
		duration = 15
	},
	active_ability_movement_speed = {
		duration = 5,
		multiplier = 1.4,
		visualizer_multiplier = 0.4
	},
	explosive_pushes = {
		duration = 5
	},
	deus_always_blocking = {
		duration = 10
	},
	deus_crit_on_damage_taken_buff = {
		duration = 3
	},
	deus_damage_reduction_on_incapacitated_buff = {
		duration = 10,
		multiplier = -0.5
	},
	deus_consumable_extra_shot_buff = {
		duration = 15,
		bonus = 1
	},
	deus_reckless_swings_buff = {
		health_threshold = 0.5,
		multiplier = 0.25,
		damage_to_deal = 3
	},
	deus_big_swing_stagger_buff = {
		multiplier = 0.7,
		duration = 3,
		targets_to_hit = 5
	},
	deus_second_wind_attack_speed = {
		multiplier = 0.15,
		duration = 10,
		health_threshold = 0.1
	},
	deus_second_wind_movement_speed = {
		duration = 10,
		multiplier = 1.2
	},
	deus_second_wind_cooldown = {
		duration = 30
	},
	deus_guard_buff = {
		health_threshold = 0.75,
		multiplier = -0.5
	},
	deus_push_increased_cleave_buff = {
		multiplier = 0.5,
		duration = 3
	},
	deus_parry_damage_immune_buff = {
		duration = 2
	},
	deus_standing_still_damage_reduction_buff = {
		multiplier = -0.6
	},
	triple_melee_headshot_power_boost = {
		duration = 10,
		multiplier = 0.15,
		count = 3
	},
	melee_killing_spree_speed_boost = {
		kill_amount = 10,
		baked_multiplier = 1.2,
		multiplier = 0.2,
		kill_window = 10,
		duration = 10
	},
	last_player_standing_power_reg_boost = {
		heal = 5,
		multiplier = 1,
		duration = 10
	},
	cooldown_reg_not_hit_buff = {
		max_stacks = 5,
		multiplier = 0.05,
		frequency = 5
	},
	heal_on_dot_damage_dealt = {
		heal_per_tick = 0.25
	},
	explosive_kills_on_elite_kills = {
		amount_of_explosions = 1
	},
	deus_powerup_attack_speed = {
		multiplier = 0.1
	},
	deus_push_cost_reduction = {
		visualizer_number = 0.5
	},
	deus_extra_stamina = {
		extra_stamina = 4,
		visualizer_number = 2
	},
	deus_skill_on_special_kill = {
		percent_restored = 0.1
	},
	attack_speed_per_cooldown = {
		multiplier = 0.2
	},
	cooldown_on_friendly_ability = {
		percent_restored = 0.1
	},
	deus_crit_chain_lightning = {
		max_targets = 5,
		max_chain_range = 15
	},
	deus_ranged_crit_explosion = {
		cooldown_duration = 10,
		multiplier = 0.3
	},
	deus_extra_shot = {
		bonus = 1
	},
	follow_up_cooldown = {
		duration = 3
	},
	deus_collateral_damage_on_melee_killing_blow = {
		max_range = 3,
		proc_chance = 0.5
	},
	deus_throw_speed_increase = {
		multiplier = 1
	},
	deus_grenade_multi_throw = {
		bonus = 1
	},
	deus_ammo_pickup_give_allies_ammo = {
		percent = 0.1
	},
	deus_target_full_health_damage_mult = {
		visualizer_number = 0.2,
		baked_multiplier = 1.2
	},
	deus_barrel_power = {
		visualizer_number = 3,
		multiplier = 4
	},
	deus_ammo_pickup_heal = {
		amount = 15
	},
	deus_max_health = {
		multiplier = 0.5
	},
	deus_health_regeneration = {
		frequency = 3,
		amount = 1
	},
	deus_larger_clip = {
		multiplier = 1
	},
	deus_more_head_less_body_damage = {
		positive_multiplier = 0.5,
		negative_multiplier = -0.1
	},
	friendly_cooldown_on_ability = {
		percent = 0.1
	},
	deus_cooldown_regen = {
		multiplier = 0.1
	},
	deus_increased_healing_taken = {
		multiplier = 0.5
	},
	deus_free_potion_use_on_ability = {
		proc_chance = 0.5
	},
	melee_wave = {
		stacks_to_add = 3
	},
	money_magnet = {
		magnet_distance = 10
	},
	skill_by_block = {
		bonus = 2
	},
	speed_over_stamina_buff = {
		duration = 15,
		multiplier = 0.15
	},
	missing_health_power_up_buff = {
		max_stacks = 5,
		multiplier = -0.05,
		chunk_size = 20
	},
	detect_weakness_buff = {
		duration = 10,
		multiplier = 0.3
	},
	squats_build_up_buff = {
		max_stacks = 5,
		duration = 3
	},
	squats_buff = {
		duration = 25,
		multiplier = 0.5
	},
	comradery_buff = {
		multiplier = 0.05
	},
	wolfpack_buff = {
		multiplier = 0.05
	},
	invigorating_strike_cooldown = {
		duration = 10
	},
	staggering_force = {
		enemy_count = 5
	},
	staggering_force_buff = {
		multiplier = 0.2,
		duration = 5
	},
	piercing_projectiles = {
		bonus = 1
	},
	pyrrhic_strength_health = {
		bonus = -0.5
	},
	pyrrhic_strength_power = {
		multiplier = 0.25
	},
	tenacious = {
		health_per_tick = 2,
		health_threshold = 0.3
	},
	crescendo_strike_buff = {
		max_stacks = 10,
		duration = 10,
		bonus = 0.05
	},
	lucky_buff = {
		bonus = 0.05
	},
	hidden_escape_buff = {
		duration = 5
	},
	hidden_escape_cooldown_buff = {
		duration = 30
	},
	curative_empowerment = {
		health_percentage_chunk = 0.1
	},
	curative_empowerment_buff = {
		duration = 40,
		multiplier = 0.2
	},
	pent_up_anger_buff = {
		max_stacks = 3
	},
	bad_breath_cooldown_buff = {
		duration = 45
	},
	boulder_bro_cooldown_buff = {
		duration = 1
	},
	static_blade_cooldown_buff = {
		duration = 8
	},
	health_orbs = {
		health_per_orb = 10,
		orb_health = 5
	},
	static_charge = {
		orb_duration = 5,
		kills_per_orb = 10
	},
	protection_orb = {
		duration = 10,
		multiplier = -0.5
	},
	protection_orbs = {
		trigger_cooldown = 3
	},
	focused_accuracy = {
		cooldown_duration = 3
	},
	ability_cooldown_reduction_orb = {
		duration = 0.5,
		multiplier = 4.5
	},
	resolve = {
		cooldown = 120
	},
	surprise_strike_guaranteed_crit_buff = {
		duration = 2
	},
	boon_deus_coins_greed = {
		multiplier = 0.15
	}
}
