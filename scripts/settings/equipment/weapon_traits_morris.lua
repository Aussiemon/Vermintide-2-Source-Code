local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local morris_weapon_traits = {}
local buff_tweak_data = {
	armor_breaker_on_armored_kill = {
		trigger_on_breed = {
			chaos_warrior = true,
			skaven_ratling_gunner = true,
			skaven_storm_vermin_with_shield = true,
			beastmen_bestigor = true,
			beastmen_standard_bearer = true,
			skaven_warpfire_thrower = true,
			skaven_storm_vermin_commander = true,
			skaven_storm_vermin = true,
			skaven_storm_vermin_champion = true
		}
	},
	armor_breaker = {
		max_stacks = 1,
		duration = 16,
		default_power_level = 40
	},
	shield_of_isha = {
		value = 20
	},
	bloodthirst = {
		reset_after_time = 30,
		buff_name_to_add = "bloodthirst_attack_speed",
		kills_needed = 5
	},
	bloodthirst_attack_speed = {
		max_stacks = 5,
		multiplier = 0.02
	},
	headhunter = {
		buff_name_to_add = "headhunter_damage",
		remove_amount = 1,
		valid_hit_zones = {
			head = true,
			weakspot = true
		},
		ignore_hit_zones = {
			afro = true
		}
	},
	headhunter_damage = {
		max_stacks = 20,
		multiplier = 0.1
	}
}
morris_weapon_traits.buff_templates = {
	stagger_aoe_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				name = "stagger_aoe_on_crit",
				explosion_template = "stagger_aoe_on_crit",
				buff_func = "stagger_aoe_on_hit"
			}
		}
	},
	armor_breaker_on_armored_kill = {
		buffs = {
			{
				event = "on_kill",
				name = "armor_breaker_on_armored_kill",
				buff_func = "armor_breaker_on_armored_kill"
			}
		}
	},
	armor_breaker = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_01",
				name = "armor_breaker",
				remove_buff_func = "remove_armor_breaker",
				icon = "teammate_consumable_icon_defence",
				refresh_durations = true,
				update_func = "update_armor_breaker",
				apply_buff_func = "start_armor_breaker"
			}
		}
	},
	shield_of_isha = {
		buffs = {
			{
				name = "shield_of_isha",
				stat_buff = "max_damage_taken",
				value = buff_tweak_data.shield_of_isha.value
			}
		}
	},
	bloodthirst = {
		buffs = {
			{
				update_func = "update_bloodthirst",
				name = "bloodthirst",
				buff_func = "bloodthirst_on_kill",
				event = "on_kill",
				remove_buff_func = "remove_bloodthirst",
				apply_buff_func = "start_bloodthirst"
			}
		}
	},
	bloodthirst_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
				name = "bloodthirst_attack_speed"
			}
		}
	},
	headhunter = {
		buffs = {
			{
				name = "headhunter",
				buff_func = "headhunter_on_damage_dealt",
				event = "on_damage_dealt",
				remove_buff_func = "remove_headhunter",
				apply_buff_func = "start_headhunter"
			}
		}
	},
	headhunter_damage = {
		buffs = {
			{
				stat_buff = "damage_dealt",
				name = "headhunter_damage"
			}
		}
	}
}
morris_weapon_traits.traits = {
	stagger_aoe_on_crit = {
		display_name = "traits_stagger_aoe_on_crit",
		buffer = "server",
		advanced_description = "description_stagger_aoe_on_crit",
		icon = "deus_icon_trait_shockwave",
		buff_name = "stagger_aoe_on_crit",
		description_values = {
			{
				value = ExplosionTemplates.stagger_aoe_on_crit.radius
			}
		}
	},
	armor_breaker = {
		display_name = "traits_armor_breaker",
		buffer = "server",
		advanced_description = "description_armor_breaker",
		icon = "deus_icon_trait_armorbreaker",
		buff_name = "armor_breaker_on_armored_kill",
		description_values = {
			{
				value = ExplosionTemplates.armor_breaker.radius
			}
		}
	},
	shield_of_isha = {
		display_name = "traits_shield_of_isha",
		advanced_description = "description_shield_of_isha",
		icon = "deus_icon_trait_shield_of_isha",
		buff_name = "shield_of_isha",
		description_values = {
			{
				value = buff_tweak_data.shield_of_isha.value
			}
		}
	},
	bloodthirst = {
		display_name = "traits_bloodthirst",
		advanced_description = "description_bloodthirst",
		icon = "deus_icon_trait_bloodthirst",
		buff_name = "bloodthirst",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bloodthirst_attack_speed.multiplier
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.bloodthirst.kills_needed
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.bloodthirst_attack_speed.max_stacks
			},
			{
				value_type = "duration",
				value = buff_tweak_data.bloodthirst.reset_after_time
			}
		}
	},
	headhunter = {
		display_name = "traits_headhunter",
		buffer = "server",
		advanced_description = "description_headhunter",
		icon = "deus_icon_trait_headhunter",
		buff_name = "headhunter",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.headhunter_damage.multiplier
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.headhunter_damage.max_stacks
			},
			{
				value_type = "bonus",
				value = buff_tweak_data.headhunter.remove_amount
			}
		}
	},
	home_run = {
		display_name = "traits_home_run",
		buffer = "both",
		advanced_description = "description_home_run",
		icon = "deus_icon_trait_homerun",
		crafting_disabled = true,
		buff_name = "home_run",
		description_values = {},
		compatible_weapon_list = {
			dr_2h_cog_hammer = true,
			wh_2h_hammer = true,
			es_2h_hammer = true,
			dr_2h_hammer = true
		}
	},
	shield_splinters = {
		display_name = "traits_shield_splinters",
		buffer = "server",
		advanced_description = "description_shield_splinters",
		icon = "deus_icon_trait_shield_of_splinters",
		crafting_disabled = true,
		buff_name = "shield_splinters",
		description_values = {},
		compatible_weapon_list = {
			dr_shield_hammer = true,
			dr_1h_throwing_axes = true,
			dr_2h_axe = true,
			es_blunderbuss = true,
			es_sword_shield = true,
			bw_1h_mace = true,
			dr_2h_pick = true,
			dr_shield_axe = true,
			dr_2h_cog_hammer = true,
			wh_2h_hammer = true,
			es_mace_shield = true,
			es_sword_shield_breton = true,
			we_2h_axe = true,
			es_2h_sword_executioner = true,
			wh_hammer_shield = true,
			es_bastard_sword = true,
			wh_deus_01 = true,
			wh_1h_axe = true,
			dr_2h_hammer = true,
			es_2h_hammer = true
		}
	},
	refilling_shot = {
		display_name = "traits_refilling_shot",
		buffer = "client",
		advanced_description = "description_refilling_shot",
		icon = "deus_icon_trait_refilling_shot",
		crafting_disabled = true,
		buff_name = "refilling_shot",
		description_values = {},
		compatible_weapon_list = {
			wh_repeating_pistols = true,
			es_handgun = true,
			dr_rakegun = true,
			wh_brace_of_pistols = true,
			dr_steam_pistol = true,
			es_blunderbuss = true,
			wh_deus_01 = true,
			es_repeating_handgun = true,
			dr_handgun = true,
			dr_drake_pistol = true,
			dr_drakegun = true
		}
	},
	piercing_projectiles = {
		display_name = "traits_piercing_projectile",
		crafting_disabled = true,
		advanced_description = "description_piercing_projectiles",
		icon = "deus_icon_trait_piercing_projectile",
		buff_name = "piercing_projectiles",
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.piercing_projectiles.bonus
			}
		},
		compatible_weapon_list = {
			bw_skullstaff_fireball = true,
			dr_1h_throwing_axes = true,
			wh_repeating_pistols = true,
			bw_skullstaff_beam = true,
			we_shortbow_hagbane = true,
			we_shortbow = true,
			es_longbow = true,
			wh_brace_of_pistols = true,
			bw_skullstaff_spear = true,
			we_deus_01 = true,
			dr_handgun = true,
			we_longbow = true,
			es_handgun = true,
			dr_steam_pistol = true,
			es_repeating_handgun = true,
			bw_skullstaff_geiser = true,
			bw_deus_01 = true,
			dr_drake_pistol = true
		}
	},
	serrated_blade = {
		rectangular_icon = true,
		display_name = "traits_serrated_blade",
		crafting_disabled = true,
		buff_name = "serrated_blade",
		buffer = "server",
		advanced_description = "description_serrated_blade",
		icon = "deus_icon_trait_serrated_blade",
		description_values = {},
		compatible_weapon_list = {
			we_dual_wield_sword_dagger = true,
			we_1h_axe = true,
			es_1h_sword = true,
			wh_1h_falchion = true,
			wh_fencing_sword = true,
			wh_dual_wield_axe_falchion = true,
			we_dual_wield_swords = true,
			dr_1h_axe = true,
			wh_1h_axe = true,
			wh_2h_billhook = true,
			bw_sword = true,
			we_1h_sword = true,
			dr_dual_wield_axes = true
		}
	},
	crescendo_strike = {
		rectangular_icon = true,
		display_name = "traits_crescendo_strike",
		advanced_description = "description_crescendo_strike",
		icon = "deus_icon_trait_crescendo_strike",
		crafting_disabled = true,
		buff_name = "crescendo_strike",
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.crescendo_strike_buff.bonus
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.crescendo_strike_buff.duration
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.crescendo_strike_buff.max_stacks
			}
		},
		compatible_weapon_list = {
			dr_dual_wield_hammers = true,
			we_1h_axe = true,
			we_dual_wield_daggers = true,
			wh_1h_falchion = true,
			wh_1h_hammer = true,
			wh_dual_wield_axe_falchion = true,
			bw_1h_flail_flaming = true,
			dr_1h_axe = true,
			wh_dual_hammer = true,
			bw_sword = true,
			we_1h_sword = true,
			es_dual_wield_hammer_sword = true,
			bw_1h_mace = true,
			es_1h_mace = true,
			we_2h_axe = true,
			we_dual_wield_swords = true,
			es_1h_sword = true,
			dr_1h_hammer = true,
			bw_dagger = true
		}
	},
	follow_up = {
		rectangular_icon = true,
		display_name = "traits_follow_up",
		advanced_description = "description_follow_up",
		icon = "deus_icon_trait_follow_up",
		crafting_disabled = true,
		buff_name = "follow_up",
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.follow_up_cooldown.duration
			}
		},
		compatible_weapon_list = {
			dr_shield_axe = true,
			we_1h_axe = true,
			dr_2h_axe = true,
			wh_1h_falchion = true,
			es_halberd = true,
			wh_dual_wield_axe_falchion = true,
			dr_2h_pick = true,
			dr_1h_axe = true,
			es_1h_sword = true,
			es_sword_shield_breton = true,
			bw_sword = true,
			we_1h_sword = true,
			bw_1h_crowbill = true,
			bw_1h_flail_flaming = true,
			bw_1h_mace = true,
			es_1h_mace = true,
			wh_1h_hammer = true,
			dr_2h_cog_hammer = true,
			es_2h_sword_executioner = true,
			wh_flail_shield = true,
			wh_dual_hammer = true,
			wh_hammer_book = true,
			es_bastard_sword = true,
			es_1h_flail = true,
			wh_1h_axe = true,
			dr_1h_hammer = true,
			wh_2h_hammer = true,
			dr_2h_hammer = true,
			es_2h_hammer = true
		}
	},
	deus_extra_shot = {
		rectangular_icon = true,
		display_name = "traits_extra_shot",
		advanced_description = "description_deus_extra_shot",
		icon = "deus_icon_trait_extra_shot",
		crafting_disabled = true,
		buff_name = "deus_extra_shot",
		description_values = {
			{
				value_type = "bonus",
				value = MorrisBuffTweakData.deus_extra_shot.bonus
			}
		},
		compatible_weapon_list = {
			we_deus_01 = true,
			dr_1h_throwing_axes = true,
			wh_repeating_pistols = true,
			wh_brace_of_pistols = true,
			we_shortbow_hagbane = true,
			we_shortbow = true,
			es_longbow = true,
			we_crossbow_repeater = true,
			dr_crossbow = true,
			we_javelin = true,
			dr_handgun = true,
			we_longbow = true,
			es_handgun = true,
			wh_crossbow = true,
			dr_steam_pistol = true,
			wh_crossbow_repeater = true,
			es_repeating_handgun = true,
			dr_deus_01 = true,
			dr_drake_pistol = true
		}
	},
	always_blocking = {
		rectangular_icon = true,
		display_name = "traits_always_blocking",
		advanced_description = "description_always_blocking",
		icon = "deus_icon_trait_always_blocking",
		crafting_disabled = true,
		buff_name = "always_blocking",
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_always_blocking.duration
			}
		},
		compatible_weapon_list = {
			wh_flail_shield = true,
			we_1h_spears_shield = true,
			dr_shield_hammer = true,
			es_sword_shield = true,
			wh_hammer_shield = true,
			dr_shield_axe = true,
			es_mace_shield = true,
			es_deus_01 = true,
			es_sword_shield_breton = true
		}
	},
	deus_big_swing_stagger = {
		rectangular_icon = true,
		display_name = "traits_big_swing_stagger",
		advanced_description = "description_deus_big_swing_stagger",
		icon = "deus_icon_trait_big_swing_stagger",
		crafting_disabled = true,
		buff_name = "deus_big_swing_stagger",
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.deus_big_swing_stagger_buff.targets_to_hit
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_big_swing_stagger_buff.multiplier
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_big_swing_stagger_buff.duration
			}
		},
		compatible_weapon_list = {
			we_2h_axe = true,
			wh_2h_hammer = true,
			dr_2h_axe = true,
			es_2h_sword_executioner = true,
			es_bastard_sword = true,
			dr_2h_cog_hammer = true,
			wh_2h_sword = true,
			es_2h_sword = true,
			dr_2h_hammer = true,
			es_2h_hammer = true
		}
	},
	deus_ammo_pickup_reload_speed = {
		rectangular_icon = true,
		display_name = "traits_ammo_pickup_reload_speed",
		advanced_description = "description_deus_ammo_pickup_reload_speed",
		icon = "deus_icon_trait_ammo_pickup_reload_speed",
		crafting_disabled = true,
		buff_name = "deus_ammo_pickup_reload_speed",
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_ammo_pickup_reload_speed_buff.multiplier
			},
			{
				value_type = "range",
				value = MorrisBuffTweakData.deus_ammo_pickup_reload_speed_buff.duration
			}
		},
		compatible_weapon_list = {
			wh_repeating_pistols = true,
			es_handgun = true,
			wh_crossbow = true,
			wh_brace_of_pistols = true,
			dr_steam_pistol = true,
			wh_crossbow_repeater = true,
			es_repeating_handgun = true,
			we_crossbow_repeater = true,
			wh_deus_01 = true,
			dr_crossbow = true,
			es_blunderbuss = true,
			dr_handgun = true,
			dr_deus_01 = true,
			dr_drake_pistol = true
		}
	},
	deus_crit_chain_lightning = {
		rectangular_icon = true,
		display_name = "traits_crit_chain_lightning",
		crafting_disabled = true,
		buff_name = "deus_crit_chain_lightning",
		buffer = "server",
		advanced_description = "description_deus_crit_chain_lightning",
		icon = "deus_icon_trait_crit_chain_lightning",
		description_values = {
			{
				value_type = "targets",
				value = MorrisBuffTweakData.deus_crit_chain_lightning.max_targets
			}
		},
		compatible_weapon_list = {
			wh_1h_hammer = true,
			we_1h_axe = true,
			es_1h_sword = true,
			wh_1h_falchion = true,
			bw_1h_flail_flaming = true,
			dr_1h_axe = true,
			dr_1h_hammer = true,
			bw_sword = true,
			we_1h_sword = true,
			bw_dagger = true,
			bw_1h_mace = true,
			es_1h_mace = true
		}
	},
	deus_ranged_crit_explosion = {
		rectangular_icon = true,
		display_name = "traits_ranged_crit_explosion",
		crafting_disabled = true,
		buff_name = "deus_ranged_crit_explosion",
		buffer = "server",
		advanced_description = "description_deus_ranged_crit_explosion_trait",
		icon = "deus_icon_trait_ranged_crit_explosion",
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_ranged_crit_explosion.multiplier
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.deus_ranged_crit_explosion.cooldown_duration
			}
		},
		compatible_weapon_list = {
			bw_skullstaff_fireball = true,
			dr_1h_throwing_axes = true,
			wh_repeating_pistols = true,
			wh_brace_of_pistols = true,
			we_shortbow_hagbane = true,
			we_shortbow = true,
			es_longbow = true,
			we_crossbow_repeater = true,
			es_repeating_handgun = true,
			we_deus_01 = true,
			we_javelin = true,
			dr_handgun = true,
			we_life_staff = true,
			we_longbow = true,
			es_handgun = true,
			wh_crossbow = true,
			dr_steam_pistol = true,
			wh_crossbow_repeater = true,
			dr_crossbow = true,
			bw_skullstaff_spear = true,
			dr_drake_pistol = true
		}
	},
	deus_collateral_damage_on_melee_killing_blow = {
		rectangular_icon = true,
		display_name = "traits_collateral_damage_on_melee_killing_blow",
		buffer = "server",
		advanced_description = "description_deus_collateral_damage_on_melee_killing_blow",
		icon = "deus_icon_trait_collateral_damage_on_melee_killing_blow",
		buff_name = "deus_collateral_damage_on_melee_killing_blow",
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_collateral_damage_on_melee_killing_blow.proc_chance
			}
		}
	}
}

for name, data in pairs(morris_weapon_traits.traits) do
	data.name = name
end

morris_weapon_traits.combinations = {
	deus_melee = {
		{
			"melee_timed_block_cost"
		},
		{
			"melee_shield_on_assist"
		},
		{
			"melee_heal_on_crit"
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		},
		{
			"home_run"
		},
		{
			"shield_splinters"
		},
		{
			"serrated_blade"
		},
		{
			"crescendo_strike"
		},
		{
			"follow_up"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_collateral_damage_on_melee_killing_blow"
		}
	},
	deus_shield_melee = {
		{
			"melee_timed_block_cost"
		},
		{
			"melee_counter_push_power"
		},
		{
			"melee_heal_on_crit"
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		},
		{
			"shield_of_isha"
		},
		{
			"melee_increase_damage_on_block"
		},
		{
			"melee_timed_block_cost"
		},
		{
			"home_run"
		},
		{
			"shield_splinters"
		},
		{
			"serrated_blade"
		},
		{
			"crescendo_strike"
		},
		{
			"follow_up"
		},
		{
			"always_blocking"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_collateral_damage_on_melee_killing_blow"
		}
	},
	deus_heavy_melee = {
		{
			"melee_attack_speed_on_crit"
		},
		{
			"melee_timed_block_cost"
		},
		{
			"melee_heal_on_crit"
		},
		{
			"armor_breaker"
		},
		{
			"bloodthirst"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		},
		{
			"home_run"
		},
		{
			"shield_splinters"
		},
		{
			"serrated_blade"
		},
		{
			"crescendo_strike"
		},
		{
			"follow_up"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_collateral_damage_on_melee_killing_blow"
		},
		{
			"deus_big_swing_stagger"
		}
	},
	deus_ranged = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		},
		{
			"shield_splinters"
		},
		{
			"piercing_projectiles"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_ranged_crit_explosion"
		}
	},
	deus_ranged_ammo = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		},
		{
			"shield_splinters"
		},
		{
			"refilling_shot"
		},
		{
			"piercing_projectiles"
		},
		{
			"deus_extra_shot"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_ranged_crit_explosion"
		},
		{
			"deus_ammo_pickup_reload_speed"
		}
	},
	deus_ranged_heat = {
		{
			"ranged_reduced_overcharge"
		},
		{
			"ranged_remove_overcharge_on_crit"
		},
		{
			"headhunter"
		},
		{
			"stagger_aoe_on_crit"
		},
		{
			"shield_splinters"
		},
		{
			"piercing_projectiles"
		},
		{
			"deus_extra_shot"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_ranged_crit_explosion"
		}
	},
	ranged_energy = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		},
		{
			"shield_splinters"
		},
		{
			"piercing_projectiles"
		},
		{
			"deus_extra_shot"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_ranged_crit_explosion"
		}
	},
	deus_ranged_energy = {
		{
			"ranged_restore_stamina_headshot"
		},
		{
			"ranged_reduce_cooldown_on_crit"
		},
		{
			"ranged_increase_power_level_vs_armour_crit"
		},
		{
			"ranged_consecutive_hits_increase_power"
		},
		{
			"shield_splinters"
		},
		{
			"piercing_projectiles"
		},
		{
			"deus_extra_shot"
		},
		{
			"deus_crit_chain_lightning"
		},
		{
			"deus_ranged_crit_explosion"
		}
	}
}

BuffUtils.apply_buff_tweak_data(morris_weapon_traits.buff_templates, buff_tweak_data)

for key, value in pairs(morris_weapon_traits.buff_templates) do
	fassert(not WeaponTraits.buff_templates[key], "duplicate buff_template found between WeaponTraits.buff_templates and buff_templates added by morris dlc")

	WeaponTraits.buff_templates[key] = value
end

for key, value in pairs(morris_weapon_traits.traits) do
	fassert(not WeaponTraits.traits[key], "duplicate traits found between WeaponTraits.traits and traits added by morris dlc")

	WeaponTraits.traits[key] = value
end

for key, value in pairs(morris_weapon_traits.combinations) do
	fassert(not WeaponTraits.combinations[key], "duplicate combinations found between WeaponTraits.combinations and combinations added by morris dlc")

	WeaponTraits.combinations[key] = value
end
