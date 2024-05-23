-- chunkname: @scripts/settings/dlcs/morris/deus_power_up_settings.lua

require("scripts/entity_system/systems/buff/buff_sync_type")
require("scripts/settings/dlcs/morris/deus_cost_settings")
require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

DeusPowerUpSettings = DeusPowerUpSettings or {
	cursed_chest_choice_amount = 3,
	cursed_chest_max_picks = 1,
	weapon_chest_choice_amount = 1,
}

local skulls_buffs_to_refresh = {
	"boon_skulls_01_stack",
	"boon_skulls_01_surge",
	"boon_skulls_02_stack",
	"boon_skulls_02_surge",
	"boon_skulls_04_regen",
	"boon_skulls_05_stack",
	"boon_skulls_05_surge",
}

DeusPowerUpBuffTemplates = {
	deus_coin_pickup_regen_buff = {
		buffs = {
			{
				apply_buff_func = "health_regen_start",
				heal_type = "health_regen",
				icon = "deus_healing",
				name = "deus_coin_pickup_regen_buff",
				time_between_heal = 1,
				update_func = "health_regen_update",
				heal = MorrisBuffTweakData.deus_coin_pickup_regen_buff.heal,
				duration = MorrisBuffTweakData.deus_coin_pickup_regen_buff.duration,
			},
		},
	},
	deus_large_ammo_pickup_infinite_ammo_buff = {
		buffs = {
			{
				icon = "icons_placeholder",
				name = "deus_large_ammo_pickup_infinite_ammo_buff",
				perks = {
					buff_perks.infinite_ammo,
				},
				duration = MorrisBuffTweakData.deus_large_ammo_pickup_infinite_ammo_buff.duration,
			},
		},
	},
	deus_revive_regen_buff = {
		buffs = {
			{
				apply_buff_func = "health_regen_start",
				heal_type = "health_regen",
				icon = "deus_revive_regen",
				max_stacks = 1,
				name = "deus_revive_regen_buff",
				refresh_durations = true,
				time_between_heal = 1,
				update_func = "health_regen_update",
				heal = MorrisBuffTweakData.deus_revive_regen_buff.heal,
				duration = MorrisBuffTweakData.deus_revive_regen_buff.duration,
			},
		},
	},
	active_ability_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_active_ability_movement_buff",
				icon = "movement_speed_on_active_ability_use",
				max_stacks = 1,
				name = "movement",
				refresh_durations = true,
				remove_buff_func = "remove_active_ability_movement_buff",
				multiplier = MorrisBuffTweakData.active_ability_movement_speed.multiplier,
				duration = MorrisBuffTweakData.active_ability_movement_speed.duration,
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	explosive_pushes = {
		buffs = {
			{
				authority = "server",
				buff_func = "on_push_explosion",
				event = "on_push",
				explosion_template = "buff_explosion",
				icon = "potion_buff_02",
				name = "explosive_pushes",
				power_scale = 1.5,
				duration = MorrisBuffTweakData.explosive_pushes.duration,
			},
		},
	},
	deus_crit_on_damage_taken_buff = {
		buffs = {
			{
				icon = "deus_icon_crit_on_damage_taken",
				max_stacks = 1,
				name = "deus_crit_on_damage_taken_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.deus_crit_on_damage_taken_buff.duration,
				perks = {
					buff_perks.guaranteed_crit,
				},
			},
		},
	},
	deus_damage_reduction_on_incapacitated_buff = {
		buffs = {
			{
				apply_buff_func = "apply_damage_reduction_on_incapacitated",
				icon = "deus_icon_damage_reduction_on_incapacitated",
				max_stacks = 1,
				name = "deus_damage_reduction_on_incapacitated_buff",
				remove_buff_func = "remove_damage_reduction_on_incapacitated",
				stat_buff = "damage_taken",
				multiplier = MorrisBuffTweakData.deus_damage_reduction_on_incapacitated_buff.multiplier,
				duration = MorrisBuffTweakData.deus_damage_reduction_on_incapacitated_buff.duration,
			},
		},
	},
	elites_on_kill_explosion_buff = {
		buffs = {
			{
				authority = "server",
				buff_func = "elites_on_kill_explosion",
				event = "on_kill",
				explosion_template = "buff_explosion",
				icon = "explosive_kills_on_elite_kills",
				max_stacks = 1,
				name = "elites_on_kill_explosion_buff",
				power_scale = 2,
				sound_event = "morris_power_ups_exploding_enemy",
				amount_of_explosions = MorrisBuffTweakData.explosive_kills_on_elite_kills.amount_of_explosions,
			},
		},
	},
	deus_knockdown_damage_immunity_buff = {
		buffs = {
			{
				buff_func = "play_particle_effect",
				event = "on_damage_taken",
				icon = "deus_knockdown_damage_immunity_aura",
				max_stacks = 1,
				name = "deus_knockdown_damage_immunity_buff",
				particle_fx = "fx/cw_allies_shield",
				proc_weight = 15,
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	drop_item_on_ability_use_cooldown = {
		buffs = {
			{
				duration = 5,
				icon = "drop_item_on_ability_use",
				is_cooldown = true,
				max_stacks = 1,
				name = "drop_item_on_ability_use_cooldown",
				refresh_durations = true,
			},
		},
	},
	deus_timed_block_free_shot_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_ammo_used",
				icon = "deus_utils",
				max_stacks = 1,
				name = "deus_timed_block_free_shot_buff",
				priority_buff = true,
				remove_on_proc = true,
				perks = {
					buff_perks.infinite_ammo,
				},
			},
		},
	},
	deus_special_farm_max_health = {
		buffs = {
			{
				authority = "server",
				buff_func = "deus_special_farm_max_health_on_special",
				buff_to_add = "deus_special_farm_max_health_buff",
				event = "on_special_killed",
				name = "deus_special_farm_max_health",
				specials_per_pop = 5,
			},
		},
	},
	deus_special_farm_max_health_buff = {
		buffs = {
			{
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				is_persistent = true,
				max_stacks = 10,
				multiplier = 0.1,
				name = "deus_special_farm_max_health_buff",
				priority_buff = true,
				stat_buff = "max_health",
			},
		},
	},
	deus_reckless_swings_buff = {
		buffs = {
			{
				buff_func = "deus_reckless_swings_buff_on_hit",
				event = "on_hit",
				icon = "deus_reckless_swings",
				max_stacks = 1,
				name = "deus_reckless_swings_buff",
				stat_buff = "power_level_melee",
				multiplier = MorrisBuffTweakData.deus_reckless_swings_buff.multiplier,
				damage_to_deal = MorrisBuffTweakData.deus_reckless_swings_buff.damage_to_deal,
			},
		},
	},
	deus_second_wind_attack_speed = {
		buffs = {
			{
				apply_buff_func = "apply_second_wind",
				buff_to_add = "deus_second_wind_cooldown",
				duration_end_func = "add_buff_local",
				icon = "deus_second_wind",
				max_stacks = 1,
				name = "deus_second_wind_attack_speed",
				remove_buff_func = "remove_second_wind",
				stat_buff = "attack_speed",
				perks = {
					buff_perks.invulnerable,
				},
				duration = MorrisBuffTweakData.deus_second_wind_attack_speed.duration,
				multiplier = MorrisBuffTweakData.deus_second_wind_attack_speed.multiplier,
			},
		},
	},
	deus_second_wind_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				name = "deus_second_wind_movement_speed",
				remove_buff_func = "remove_movement_buff",
				duration = MorrisBuffTweakData.deus_second_wind_movement_speed.duration,
				multiplier = MorrisBuffTweakData.deus_second_wind_movement_speed.multiplier,
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	deus_second_wind_cooldown = {
		buffs = {
			{
				icon = "deus_second_wind",
				is_cooldown = true,
				max_stacks = 1,
				name = "deus_second_wind_cooldown",
				duration = MorrisBuffTweakData.deus_second_wind_cooldown.duration,
			},
		},
	},
	deus_guard_aura = {
		buffs = {
			{
				authority = "server",
				buff_to_add = "deus_guard_buff",
				disregard_self = true,
				name = "deus_guard_aura",
				range = 10,
				remove_buff_func = "remove_aura_buff",
				update_frequency = 0.5,
				update_func = "activate_buff_on_distance",
			},
		},
	},
	deus_guard_buff = {
		buffs = {
			{
				buff_func = "deus_guard_buff_on_damage",
				event = "on_damage_taken",
				icon = "deus_icon_guard_aura_check",
				max_stacks = 1,
				name = "deus_guard_buff",
				stat_buff = "damage_taken",
				multiplier = MorrisBuffTweakData.deus_guard_buff.multiplier,
			},
		},
	},
	deus_push_increased_cleave_buff = {
		buffs = {
			{
				icon = "deus_push_increased_cleave",
				max_stacks = 1,
				name = "deus_push_increased_cleave_buff",
				stat_buff = "power_level_melee_cleave",
				duration = MorrisBuffTweakData.deus_push_increased_cleave_buff.duration,
				multiplier = MorrisBuffTweakData.deus_push_increased_cleave_buff.multiplier,
			},
		},
	},
	deus_parry_damage_immune_buff = {
		buffs = {
			{
				apply_buff_func = "apply_parry_damage_immune",
				icon = "deus_parry_damage_immune",
				max_stacks = 1,
				name = "deus_parry_damage_immune_buff",
				perks = {
					buff_perks.invulnerable,
				},
				duration = MorrisBuffTweakData.deus_parry_damage_immune_buff.duration,
			},
		},
	},
	deus_standing_still_damage_reduction_buff = {
		buffs = {
			{
				icon = "deus_standing_still_damage_reduction",
				name = "deus_standing_still_damage_reduction_buff",
				stat_buff = "damage_taken",
				multiplier = MorrisBuffTweakData.deus_standing_still_damage_reduction_buff.multiplier,
			},
		},
	},
	triple_melee_headshot_power_boost = {
		buffs = {
			{
				icon = "triple_melee_headshot_power",
				max_stacks = 1,
				name = "triple_melee_headshot_power_boost",
				refresh_durations = true,
				stat_buff = "power_level_melee",
				multiplier = MorrisBuffTweakData.triple_melee_headshot_power_boost.multiplier,
				duration = MorrisBuffTweakData.triple_melee_headshot_power_boost.duration,
			},
		},
	},
	melee_killing_spree_speed_boost = {
		buffs = {
			{
				apply_buff_func = "apply_screenspace_fx",
				icon = "melee_killing_spree_speed",
				max_stacks = 1,
				name = "melee_killing_spree_speed_boost",
				refresh_durations = true,
				remove_buff_func = "remove_screenspace_fx",
				screenspace_fx = "fx/cw_speed_screenspace",
				stat_buff = "attack_speed",
				multiplier = MorrisBuffTweakData.melee_killing_spree_speed_boost.multiplier,
				duration = MorrisBuffTweakData.melee_killing_spree_speed_boost.duration,
			},
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				name = "melee_killing_spree_speed_boost",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				multiplier = MorrisBuffTweakData.melee_killing_spree_speed_boost.baked_multiplier,
				duration = MorrisBuffTweakData.melee_killing_spree_speed_boost.duration,
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	last_player_standing_power_reg_boost = {
		buffs = {
			{
				icon = "last_player_standing_power_reg",
				name = "last_player_standing_power_boost",
				stat_buff = "power_level",
				multiplier = MorrisBuffTweakData.last_player_standing_power_reg_boost.multiplier,
				duration = MorrisBuffTweakData.last_player_standing_power_reg_boost.duration,
			},
			{
				apply_buff_func = "health_regen_start",
				heal_type = "health_regen",
				name = "last_player_standing_reg_boost",
				time_between_heal = 0.5,
				update_func = "health_regen_update",
				heal = MorrisBuffTweakData.last_player_standing_power_reg_boost.heal,
				duration = MorrisBuffTweakData.last_player_standing_power_reg_boost.duration,
			},
		},
	},
	cooldown_reg_not_hit_buff = {
		buffs = {
			{
				icon = "deus_icon_cooldown_reg_not_hit",
				name = "cooldown_reg_not_hit_buff",
				stat_buff = "cooldown_regen",
				multiplier = MorrisBuffTweakData.cooldown_reg_not_hit_buff.multiplier,
				max_stacks = MorrisBuffTweakData.cooldown_reg_not_hit_buff.max_stacks,
			},
		},
	},
	skulls_boon_buffs_tracker = {
		buffs = {
			{
				name = "skulls_boon_buffs_tracker",
			},
		},
	},
	boon_skulls_01_stack = {
		buffs = {
			{
				icon = "grudge_mark_frenzy_debuff",
				ignore_if_not_local = true,
				is_cooldown = true,
				name = "boon_skulls_01_stack",
				on_max_stacks_func = "add_buff_synced",
				refresh_durations = true,
				reset_on_max_stacks = true,
				stat_buff = "attack_speed",
				sync_type = "LocalAndServer",
				synced_buff_to_add = "boon_skulls_01_surge",
				duration = MorrisBuffTweakData.boon_skulls_01_data.duration,
				multiplier = MorrisBuffTweakData.boon_skulls_01_data.attack_speed_per_stack,
				max_stacks = MorrisBuffTweakData.boon_skulls_01_data.max_stacks,
			},
		},
	},
	boon_skulls_01_surge = {
		buffs = {
			{
				apply_buff_func = "skulls_event_boon_surge_applied",
				icon = "grudge_mark_frenzy_debuff",
				max_stacks = 1,
				name = "boon_skulls_01_surge",
				remove_buff_func = "skulls_event_boon_surge_removed",
				stat_buff = "attack_speed",
				duration = MorrisBuffTweakData.boon_skulls_01_data.duration,
				multiplier = MorrisBuffTweakData.boon_skulls_01_data.attack_speed_on_proc,
				refresh_duration_of_buffs_on_apply = skulls_buffs_to_refresh,
			},
		},
	},
	boon_skulls_02_stack = {
		buffs = {
			{
				icon = "potion_liquid_bravado",
				ignore_if_not_local = true,
				is_cooldown = true,
				name = "boon_skulls_02_stack",
				on_max_stacks_func = "add_buff_synced",
				refresh_durations = true,
				reset_on_max_stacks = true,
				stat_buff = "power_level",
				sync_type = "LocalAndServer",
				synced_buff_to_add = "boon_skulls_02_surge",
				duration = MorrisBuffTweakData.boon_skulls_02_data.duration,
				multiplier = MorrisBuffTweakData.boon_skulls_02_data.power_per_stack,
				max_stacks = MorrisBuffTweakData.boon_skulls_02_data.max_stacks,
			},
		},
	},
	boon_skulls_02_surge = {
		buffs = {
			{
				apply_buff_func = "skulls_event_boon_surge_applied",
				icon = "potion_liquid_bravado",
				max_stacks = 1,
				name = "boon_skulls_02_surge",
				remove_buff_func = "skulls_event_boon_surge_removed",
				stat_buff = "power_level",
				duration = MorrisBuffTweakData.boon_skulls_02_data.duration,
				multiplier = MorrisBuffTweakData.boon_skulls_02_data.power_on_proc,
				refresh_duration_of_buffs_on_apply = skulls_buffs_to_refresh,
			},
		},
	},
	boon_skulls_04_regen = {
		buffs = {
			{
				apply_buff_func = "skulls_event_boon_surge_applied",
				icon = "mutator_skulls_cooldown_reduction",
				name = "boon_skulls_04_regen",
				remove_buff_func = "boon_skulls_04_regen_remove",
				stat_buff = "cooldown_regen",
				update_frequency = 1,
				update_func = "boon_skulls_04_regen_update",
				multiplier = MorrisBuffTweakData.boon_skulls_04_data.proc_cooldown_regen,
				duration = MorrisBuffTweakData.boon_skulls_04_data.proc_duration,
				refresh_duration_of_buffs_on_apply = skulls_buffs_to_refresh,
			},
		},
	},
	boon_skulls_04_stack = {
		buffs = {
			{
				icon = "mutator_skulls_cooldown_reduction",
				is_cooldown = true,
				name = "boon_skulls_04_stack",
				max_stacks = MorrisBuffTweakData.boon_skulls_04_data.total_thp_to_consume,
			},
		},
	},
	boon_skulls_05_stack = {
		buffs = {
			{
				icon = "bardin_slayer_crit_chance",
				ignore_if_not_local = true,
				is_cooldown = true,
				name = "boon_skulls_05_stack",
				on_max_stacks_func = "add_buff_synced",
				refresh_durations = true,
				reset_on_max_stacks = true,
				stat_buff = "power_level",
				sync_type = "LocalAndServer",
				synced_buff_to_add = "boon_skulls_05_surge",
				multiplier = MorrisBuffTweakData.boon_skulls_05_data.power_per_stack,
				duration = MorrisBuffTweakData.boon_skulls_05_data.duration,
				max_stacks = MorrisBuffTweakData.boon_skulls_05_data.max_stacks,
			},
		},
	},
	boon_skulls_05_surge = {
		buffs = {
			{
				apply_buff_func = "skulls_event_boon_surge_applied",
				icon = "bardin_slayer_crit_chance",
				max_stacks = 1,
				name = "boon_skulls_05_surge",
				refresh_durations = true,
				remove_buff_func = "skulls_event_boon_surge_removed",
				stat_buff = "power_level",
				multiplier = MorrisBuffTweakData.boon_skulls_05_data.power_on_proc,
				duration = MorrisBuffTweakData.boon_skulls_05_data.duration,
				refresh_duration_of_buffs_on_apply = skulls_buffs_to_refresh,
			},
		},
	},
	boon_skulls_03_cooldown = {
		buffs = {
			{
				icon = "bardin_slayer_passive_increased_max_stacks",
				is_cooldown = true,
				max_stacks = 1,
				name = "boon_skulls_03_cooldown",
				duration = MorrisBuffTweakData.boon_skulls_03_data.cooldown,
				refresh_duration_of_buffs_on_apply = skulls_buffs_to_refresh,
			},
		},
	},
	boon_supportbomb_healing_01_zone = {
		buffs = {
			{
				area_end_sfx = "Play_boon_aoe_zone_stop",
				area_start_sfx = "Play_boon_aoe_zone_explode_healing",
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_supportbomb_healing_01_buff",
				buff_self = true,
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_supportbomb_healing_01_zone",
				area_radius = MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
				buff_sync_type = BuffSyncType.Server,
				duration = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_base_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_supportbomb_healing_01_buff = {
		buffs = {
			{
				heal_type = "heal_from_proc",
				name = "boon_supportbomb_healing_01_buff",
				update_frequency = 1,
				update_func = "heal_owner",
				heal_amount = MorrisBuffTweakData.boon_supportbomb_healing_01_data.heal_amount,
			},
		},
	},
	boon_supportbomb_concentration_01_zone = {
		buffs = {
			{
				area_end_sfx = "Play_boon_aoe_zone_stop",
				area_start_sfx = "Play_boon_aoe_zone_explode_cooldown",
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_supportbomb_concentration_01_buff",
				buff_self = true,
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_supportbomb_concentration_01_zone",
				area_radius = MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
				buff_sync_type = BuffSyncType.Client,
				duration = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_concentration_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_supportbomb_concentration_01_buff = {
		buffs = {
			{
				name = "boon_supportbomb_concentration_01_buff",
				stat_buff = "cooldown_regen",
				multiplier = MorrisBuffTweakData.boon_supportbomb_concentration_01_data.multiplier,
			},
		},
	},
	boon_supportbomb_crit_01_zone = {
		buffs = {
			{
				area_end_sfx = "Play_boon_aoe_zone_stop",
				area_start_sfx = "Play_boon_aoe_zone_explode_crit",
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_supportbomb_crit_01_buff",
				buff_self = true,
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_supportbomb_crit_01_zone",
				area_radius = MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
				buff_sync_type = BuffSyncType.Client,
				duration = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_crit_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_supportbomb_crit_01_buff = {
		buffs = {
			{
				name = "boon_supportbomb_crit_01_buff",
				stat_buff = "critical_strike_chance",
				bonus = MorrisBuffTweakData.boon_supportbomb_crit_01_data.bonus,
			},
		},
	},
	boon_supportbomb_speed_01_zone = {
		buffs = {
			{
				area_end_sfx = "Play_boon_aoe_zone_stop",
				area_start_sfx = "Play_boon_aoe_zone_explode_attackspeed",
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_supportbomb_speed_01_buff",
				buff_self = true,
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_supportbomb_speed_01_zone",
				area_radius = MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
				buff_sync_type = BuffSyncType.Client,
				duration = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_speed_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_supportbomb_speed_01_buff = {
		buffs = {
			{
				name = "boon_supportbomb_speed_01_buff",
				stat_buff = "attack_speed",
				multiplier = MorrisBuffTweakData.boon_supportbomb_speed_01_data.multiplier,
			},
		},
	},
	boon_supportbomb_strenght_01_zone = {
		buffs = {
			{
				area_end_sfx = "Play_boon_aoe_zone_stop",
				area_start_sfx = "Play_boon_aoe_zone_explode_power",
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_supportbomb_strenght_01_buff",
				buff_self = true,
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_supportbomb_strenght_01_zone",
				area_radius = MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
				buff_sync_type = BuffSyncType.ClientAndServer,
				duration = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_strenght_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									MorrisBuffTweakData.boon_supportbomb_shared_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_supportbomb_strenght_01_buff = {
		buffs = {
			{
				name = "boon_supportbomb_strenght_01_buff",
				stat_buff = "power_level",
				multiplier = MorrisBuffTweakData.boon_supportbomb_strenght_01_data.multiplier,
			},
		},
	},
	boon_career_ability_burning_aoe = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				name = "boon_career_ability_burning_aoe",
				reapply_buff_func = "reapply_dot_damage",
				refresh_durations = true,
				update_func = "apply_dot_damage",
				buff_sync_type = BuffSyncType.ClientAndServer,
				perks = {
					buff_perks.burning,
				},
				max_stacks = MorrisBuffTweakData.boon_career_ability_burning_aoe_data.max_stacks,
				time_between_dot_damages = MorrisBuffTweakData.boon_career_ability_burning_aoe_data.time_between_dot_damages,
				update_start_delay = MorrisBuffTweakData.boon_career_ability_burning_aoe_data.update_start_delay,
				duration = MorrisBuffTweakData.boon_career_ability_burning_aoe_data.duration,
			},
		},
	},
	boon_career_ability_poison_aoe = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "poison",
				name = "boon_career_ability_poison_aoe",
				reapply_buff_func = "reapply_dot_damage",
				refresh_durations = true,
				update_func = "apply_dot_damage",
				buff_sync_type = BuffSyncType.ClientAndServer,
				perks = {
					buff_perks.poisoned,
				},
				max_stacks = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.max_stacks,
				time_between_dot_damages = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.time_between_dot_damages,
				update_start_delay = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.update_start_delay,
				duration = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.duration,
			},
		},
	},
	boon_career_ability_bleed_aoe = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "bleed",
				name = "boon_career_ability_burning_aoe",
				reapply_buff_func = "reapply_dot_damage",
				refresh_durations = true,
				update_func = "apply_dot_damage",
				buff_sync_type = BuffSyncType.ClientAndServer,
				perks = {
					buff_perks.bleeding,
				},
				max_stacks = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.max_stacks,
				time_between_dot_damages = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.time_between_dot_damages,
				update_start_delay = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.update_start_delay,
				duration = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.duration,
			},
		},
	},
	boon_cursed_chest_damage_area_buff = {
		buffs = {
			{
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_cursed_chest_damage_buff",
				buff_self = true,
				enter_area_func = "enter_buff_area",
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				exit_area_func = "exit_buff_area",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_cursed_chest_damage_area_buff",
				area_radius = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
				buff_sync_type = BuffSyncType.ClientAndServer,
				duration = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_strenght_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius * 2.25,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_cursed_chest_damage_buff = {
		buffs = {
			{
				name = "boon_cursed_chest_damage_buff",
				stat_buff = "damage_dealt",
				multiplier = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.damage_multiplier,
				duration = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.duration,
				max_stacks = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.max_stacks,
			},
		},
	},
	boon_cursed_chest_cooldown_area_buff = {
		buffs = {
			{
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "boon_cursed_chest_cooldown_buff",
				buff_self = true,
				enter_area_func = "enter_buff_area",
				enter_area_sfx = "Play_boon_aoe_zone_enter",
				exit_area_func = "exit_buff_area",
				leave_area_sfx = "Play_boon_aoe_zone_exit",
				name = "boon_cursed_chest_cooldown_area_buff",
				area_radius = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.radius,
				buff_sync_type = BuffSyncType.ClientAndServer,
				duration = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.duration,
				buff_area_particles = {
					{
						continuous = true,
						destroy_policy = "destroy",
						effect = "fx/skulls_2024/boons_zone_concentration_fx",
						first_person = false,
						orphaned_policy = "destroy",
						third_person = true,
						custom_variables = {
							{
								name = "radius_min_max",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									1,
								},
							},
							{
								name = "decal_size",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius * 2.25,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius * 2.25,
									1,
								},
							},
							{
								name = "sphere_size",
								value = {
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.radius,
									1,
								},
							},
						},
					},
				},
			},
		},
	},
	boon_cursed_chest_cooldown_buff = {
		buffs = {
			{
				name = "boon_cursed_chest_cooldown_buff",
				stat_buff = "cooldown_regen",
				duration = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.duration,
				multiplier = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.cooldown_multiplier,
				max_stacks = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.max_stacks,
			},
		},
	},
}

DLCUtils.merge("deus_power_up_buff_templates", DeusPowerUpBuffTemplates)

DeusPowerUpTemplates = DeusPowerUpTemplates or {
	attack_speed = {
		advanced_description = "description_properties_attack_speed",
		display_name = "properties_attack_speed",
		icon = "icon_property_attack_speed",
		max_amount = 1,
		plain_display_name = "properties_attack_speed_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "attack_speed",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.attack_speed.multiplier,
			},
		},
	},
	stamina = {
		advanced_description = "description_properties_stamina",
		display_name = "properties_stamina",
		icon = "icon_property_stamina",
		max_amount = 1,
		plain_display_name = "properties_stamina_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "max_fatigue",
				},
			},
		},
		description_values = {
			{
				value_type = "bonus",
				value = MorrisBuffTweakData.stamina.bonus,
			},
		},
	},
	push_block_arc = {
		advanced_description = "description_properties_push_block_arc",
		display_name = "properties_push_block_arc",
		icon = "icon_property_block_arc",
		max_amount = 1,
		plain_display_name = "properties_push_block_arc_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "block_angle",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.push_block_arc.multiplier,
			},
		},
	},
	crit_chance = {
		advanced_description = "description_properties_crit_chance",
		display_name = "properties_crit_chance",
		icon = "icon_property_crit_chance",
		max_amount = 1,
		plain_display_name = "properties_crit_chance_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "critical_strike_chance",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.crit_chance.bonus,
			},
		},
	},
	ability_cooldown_reduction = {
		advanced_description = "description_properties_ability_cooldown_reduction",
		display_name = "properties_ability_cooldown_reduction",
		icon = "icon_property_activated_cdr",
		max_amount = 1,
		plain_display_name = "properties_ability_cooldown_reduction_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "activated_cooldown",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.ability_cooldown_reduction.multiplier,
			},
		},
	},
	crit_boost = {
		advanced_description = "description_properties_crit_boost",
		display_name = "properties_crit_boost",
		icon = "icon_property_crit_boost",
		max_amount = 1,
		plain_display_name = "properties_crit_boost_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "critical_strike_effectiveness",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.crit_boost.multiplier,
			},
		},
	},
	power_vs_skaven = {
		advanced_description = "description_properties_power_vs_skaven",
		display_name = "properties_power_vs_skaven",
		icon = "icon_property_power_skaven",
		max_amount = 1,
		plain_display_name = "properties_power_vs_skaven_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_skaven",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_skaven.multiplier,
			},
		},
	},
	power_vs_chaos = {
		advanced_description = "description_properties_power_vs_chaos",
		display_name = "properties_power_vs_chaos",
		icon = "icon_property_power_chaos",
		max_amount = 1,
		plain_display_name = "properties_power_vs_chaos_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_chaos",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_chaos.multiplier,
			},
		},
	},
	power_vs_unarmoured = {
		advanced_description = "description_properties_power_vs_unarmoured",
		display_name = "properties_power_vs_unarmoured",
		icon = "icon_property_power_unarmoured",
		max_amount = 1,
		plain_display_name = "properties_power_vs_unarmoured_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_unarmoured",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_unarmoured.multiplier,
			},
		},
	},
	power_vs_armoured = {
		advanced_description = "description_properties_power_vs_armoured",
		display_name = "properties_power_vs_armoured",
		icon = "icon_property_power_armoured",
		max_amount = 1,
		plain_display_name = "properties_power_vs_armoured_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_armoured",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_armoured.multiplier,
			},
		},
	},
	power_vs_large = {
		advanced_description = "description_properties_power_vs_large",
		display_name = "properties_power_vs_large",
		icon = "icon_property_power_large",
		max_amount = 1,
		plain_display_name = "properties_power_vs_large_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_large",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_large.multiplier,
			},
		},
	},
	power_vs_frenzy = {
		advanced_description = "description_properties_power_vs_frenzy",
		display_name = "properties_power_vs_frenzy",
		icon = "icon_property_power_frenzy",
		max_amount = 1,
		plain_display_name = "properties_power_vs_frenzy_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "power_level_frenzy",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_vs_frenzy.multiplier,
			},
		},
	},
	health = {
		advanced_description = "description_properties_health",
		display_name = "properties_health",
		icon = "icon_property_health_increase",
		max_amount = 1,
		plain_display_name = "properties_health_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "max_health",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.health.multiplier,
			},
		},
	},
	block_cost = {
		advanced_description = "description_properties_block_cost",
		display_name = "properties_block_cost",
		icon = "icon_property_block_cost_reduction",
		max_amount = 2,
		plain_display_name = "properties_block_cost_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "block_cost",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.block_cost.multiplier,
			},
		},
	},
	protection_skaven = {
		advanced_description = "description_properties_protection_skaven",
		display_name = "properties_protection_skaven",
		icon = "icon_property_dmg_reduction_skaven",
		max_amount = 1,
		plain_display_name = "properties_protection_skaven_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "protection_skaven",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.protection_skaven.multiplier,
			},
		},
	},
	protection_chaos = {
		advanced_description = "description_properties_protection_chaos",
		display_name = "properties_protection_chaos",
		icon = "icon_property_dmg_reduction_chaos",
		max_amount = 1,
		plain_display_name = "properties_protection_chaos_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "protection_chaos",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.protection_chaos.multiplier,
			},
		},
	},
	protection_aoe = {
		advanced_description = "description_properties_protection_aoe",
		display_name = "properties_protection_aoe",
		icon = "icon_property_dmg_reduction_aoe",
		max_amount = 1,
		plain_display_name = "properties_protection_aoe_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "protection_aoe",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.protection_aoe.multiplier,
			},
		},
	},
	respawn_speed = {
		advanced_description = "description_properties_respawn_speed",
		display_name = "properties_respawn_speed",
		icon = "icon_property_speed_respawn",
		max_amount = 1,
		plain_display_name = "properties_respawn_speed_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "faster_respawn",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.respawn_speed.multiplier,
			},
		},
	},
	revive_speed = {
		advanced_description = "description_properties_revive_speed",
		display_name = "properties_revive_speed",
		icon = "icon_property_speed_revive",
		max_amount = 1,
		plain_display_name = "properties_revive_speed_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "faster_revive",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.revive_speed.multiplier,
			},
		},
	},
	fatigue_regen = {
		advanced_description = "description_properties_fatigue_regen",
		display_name = "properties_fatigue_regen",
		icon = "icon_property_speed_stamina_regen",
		max_amount = 2,
		plain_display_name = "properties_fatigue_regen_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "fatigue_regen",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.fatigue_regen.multiplier,
			},
		},
	},
	movespeed = {
		advanced_description = "description_properties_movespeed",
		display_name = "properties_movespeed",
		icon = "icon_property_movement_speed",
		max_amount = 2,
		plain_display_name = "properties_movespeed_plain",
		buff_template = {
			buffs = {
				{
					apply_buff_func = "apply_movement_buff",
					remove_buff_func = "remove_movement_buff",
					path_to_movement_setting_to_modify = {
						"move_speed",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.movespeed.description_value,
			},
		},
	},
	curse_resistance = {
		advanced_description = "description_properties_curse_resistance",
		display_name = "properties_curse_resistance",
		icon = "icon_property_grimoire_resistance",
		max_amount = 1,
		plain_display_name = "properties_curse_resistance_plain",
		buff_template = {
			buffs = {
				{
					stat_buff = "curse_protection",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.curse_resistance.multiplier,
			},
		},
	},
	home_brewer = {
		advanced_description = "description_trait_ring_not_consume_potion",
		display_name = "trait_ring_not_consume_potion",
		icon = "charm_not_consume_potion",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					stat_buff = "not_consume_potion",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.home_brewer.proc_chance,
			},
		},
	},
	decanter = {
		advanced_description = "description_trait_ring_potion_duration",
		display_name = "trait_ring_potion_duration",
		icon = "charm_potion_duration_increased",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					perks = {
						buff_perks.potion_duration,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.decanter.multiplier,
			},
		},
	},
	healers_touch = {
		advanced_description = "description_trait_necklace_not_consume_healing",
		display_name = "trait_necklace_not_consume_healing",
		icon = "necklace_not_consume_healing",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					stat_buff = "not_consume_medpack",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.healers_touch.proc_chance,
			},
		},
	},
	hand_of_shallya = {
		advanced_description = "description_trait_necklace_heal_self_on_heal_other",
		display_name = "trait_necklace_heal_self_on_heal_other",
		icon = "necklace_heal_self_on_heal_other",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					stat_buff = "heal_self_on_heal_other",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.hand_of_shallya.multiplier,
			},
		},
	},
	power_up_of_shallya = {
		advanced_description = "description_trait_necklace_increased_healing_received",
		display_name = "trait_necklace_increased_healing_received",
		icon = "necklace_increased_healing_received",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					max_stacks = 1,
					stat_buff = "healing_received",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.power_up_of_shallya.multiplier,
			},
		},
	},
	natural_bond = {
		advanced_description = "description_trait_necklace_no_healing_health_regen_2",
		display_name = "trait_necklace_no_healing_health_regen",
		icon = "necklace_no_healing_health_regen",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					max_stacks = 1,
					update_func = "update_heal_ticks",
					perks = {
						buff_perks.no_permanent_health,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.natural_bond.heal_amount,
			},
			{
				value = MorrisBuffTweakData.natural_bond.time_between_heals,
			},
		},
	},
	barkskin = {
		advanced_description = "description_trait_necklace_damage_taken_reduction_on_heal_2",
		buff_name = "trait_necklace_damage_taken_reduction_on_heal",
		display_name = "trait_necklace_damage_taken_reduction_on_heal",
		icon = "necklace_damage_taken_reduction_on_heal",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					buff_func = "buff_defence_on_damage_taken",
					dormant = true,
					event = "on_damage_taken",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.barkskin.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.barkskin.sub_buff_duration,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.barkskin.sub_buff_duration,
			},
		},
	},
	grenadier = {
		advanced_description = "description_trait_trinket_not_consume_grenade",
		buff_name = "trait_trinket_not_consume_grenade",
		display_name = "trait_trinket_not_consume_grenade",
		icon = "trait_trinket_not_consume_grenade",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					stat_buff = "not_consume_grenade",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.grenadier.proc_chance,
			},
		},
	},
	explosive_ordinance = {
		advanced_description = "description_trait_trinket_increase_grenade_radius",
		display_name = "trait_trinket_increase_grenade_radius",
		icon = "trinket_increase_grenade_radius",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					dormant = true,
					stat_buff = "grenade_radius",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.explosive_ordinance.multiplier,
			},
		},
	},
	shrapnel = {
		advanced_description = "description_trait_trinket_grenade_damage_taken",
		display_name = "trait_trinket_grenade_damage_taken",
		icon = "trinket_reduce_radius_by_50_increase_power_by_50",
		max_amount = 1,
		buff_template = {
			buffs = {
				{
					buff_func = "debuff_defence_grenade_hit",
					event = "on_hit",
				},
			},
		},
		description_values = {
			{
				value = 0.2,
				value_type = "percent",
			},
			{
				value = 10,
				value_type = "duration",
			},
		},
	},
	deus_transmute_into_coins = {
		advanced_description = "description_deus_transmute_into_coins",
		display_name = "display_name_deus_transmute_into_coins",
		icon = "icons_placeholder",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "deus_transmute_into_coins",
					event = "on_hit",
					name = "deus_transmute_into_coins",
					sound_event = "morris_power_ups_drop_coins",
				},
			},
		},
		description_values = {},
	},
	heal_on_dot_damage_dealt = {
		advanced_description = "description_heal_on_dot_damage_dealt",
		display_name = "display_name_heal_on_dot_damage_dealt",
		icon = "heal_on_dot_damage_dealt",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "heal_on_dot_damage_dealt",
					event = "on_dot_damage_dealt",
					name = "heal_on_dot_damage_dealt",
					value = MorrisBuffTweakData.heal_on_dot_damage_dealt.heal_per_tick,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.heal_on_dot_damage_dealt.heal_per_tick,
			},
		},
	},
	explosive_kills_on_elite_kills = {
		advanced_description = "description_explosive_kills_on_elite_kills",
		display_name = "display_name_explosive_kills_on_elite_kills",
		icon = "explosive_kills_on_elite_kills",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff_on_melee_kills_proc",
					buff_to_add = "elites_on_kill_explosion_buff",
					event = "on_kill_elite_special",
					name = "explosive_kills_on_elite_kills",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.explosive_kills_on_elite_kills.amount_of_explosions,
			},
		},
	},
	explosive_pushes_on_damage_taken = {
		advanced_description = "description_explosive_pushes_on_damage_taken",
		display_name = "display_name_explosive_pushes_on_damage_taken",
		icon = "icons_placeholder",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff_on_proc",
					buff_to_add = "explosive_pushes",
					event = "on_damage_taken",
					name = "explosive_pushes_on_damage_taken",
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.explosive_pushes.duration,
			},
		},
	},
	deus_crit_on_damage_taken = {
		advanced_description = "description_deus_crit_on_damage_taken",
		display_name = "display_name_deus_crit_on_damage_taken",
		icon = "deus_icon_crit_on_damage_taken",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff_on_non_friendly_damage_taken",
					buff_to_add = "deus_crit_on_damage_taken_buff",
					event = "on_damage_taken",
					name = "deus_crit_on_damage_taken",
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_crit_on_damage_taken_buff.duration,
			},
		},
	},
	deus_damage_reduction_on_incapacitated = {
		advanced_description = "description_deus_damage_reduction_on_incapacitated",
		display_name = "display_name_deus_damage_reduction_on_incapacitated",
		icon = "deus_icon_damage_reduction_on_incapacitated",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "deus_damage_reduction_on_incapacitated",
					buff_to_add = "deus_damage_reduction_on_incapacitated_buff",
					event = "on_damage_taken",
					name = "deus_damage_reduction_on_incapacitated",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_damage_reduction_on_incapacitated_buff.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_damage_reduction_on_incapacitated_buff.duration,
			},
		},
	},
	deus_powerup_attack_speed = {
		advanced_description = "description_deus_powerup_attack_speed",
		display_name = "display_name_deus_powerup_attack_speed",
		icon = "deus_powerup_attack_speed",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_powerup_attack_speed",
					stat_buff = "attack_speed",
					multiplier = MorrisBuffTweakData.deus_powerup_attack_speed.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_powerup_attack_speed.multiplier,
			},
		},
	},
	deus_reckless_swings = {
		advanced_description = "description_deus_reckless_swings",
		display_name = "display_name_deus_reckless_swings",
		icon = "deus_reckless_swings",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_to_add = "deus_reckless_swings_buff",
					name = "deus_reckless_swings",
					update_frequency = 0.5,
					update_func = "update_server_buff_on_health_percent",
					health_threshold = MorrisBuffTweakData.deus_reckless_swings_buff.health_threshold,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_reckless_swings_buff.health_threshold,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_reckless_swings_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.deus_reckless_swings_buff.damage_to_deal,
			},
		},
	},
	deus_second_wind = {
		advanced_description = "description_deus_second_wind",
		display_name = "display_name_deus_second_wind",
		icon = "deus_second_wind",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "deus_second_wind_on_hit",
					event = "on_damage_taken",
					max_stacks = 1,
					name = "deus_second_wind",
					proc_weight = 10,
					buffs_to_add = {
						"deus_second_wind_attack_speed",
						"deus_second_wind_movement_speed",
					},
					health_threshold = MorrisBuffTweakData.deus_second_wind_attack_speed.health_threshold,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_second_wind_attack_speed.health_threshold,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_second_wind_attack_speed.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_second_wind_attack_speed.duration,
			},
		},
	},
	deus_push_cost_reduction = {
		advanced_description = "description_deus_push_cost_reduction",
		display_name = "display_name_deus_push_cost_reduction",
		icon = "deus_push_cost_reduction",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_push_cost_reduction",
					perks = {
						buff_perks.slayer_stamina,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_push_cost_reduction.visualizer_number,
			},
		},
	},
	deus_guard_aura_check = {
		advanced_description = "description_deus_guard_aura_check",
		display_name = "display_name_deus_guard_aura_check",
		icon = "deus_icon_guard_aura_check",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_to_add = "deus_guard_aura",
					name = "deus_guard_aura_check",
					update_frequency = 0.5,
					update_func = "update_server_buff_on_health_percent",
					health_threshold = MorrisBuffTweakData.deus_guard_buff.health_threshold,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_guard_buff.health_threshold,
			},
		},
	},
	deus_extra_stamina = {
		advanced_description = "description_deus_extra_stamina",
		display_name = "display_name_deus_extra_stamina",
		icon = "deus_icon_extra_stamina",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_extra_stamina",
					stat_buff = "max_fatigue",
					bonus = MorrisBuffTweakData.deus_extra_stamina.extra_stamina,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.deus_extra_stamina.visualizer_number,
			},
		},
	},
	deus_parry_damage_immune = {
		advanced_description = "description_deus_parry_damage_immune",
		display_name = "display_name_deus_parry_damage_immune",
		icon = "deus_parry_damage_immune",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff",
					buff_to_add = "deus_parry_damage_immune_buff",
					event = "on_timed_block",
					name = "deus_parry_damage_immune",
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_parry_damage_immune_buff.duration,
			},
		},
	},
	deus_skill_on_special_kill = {
		advanced_description = "description_deus_skill_on_special_kill",
		display_name = "display_name_deus_skill_on_special_kill",
		icon = "deus_skill_on_special_kill",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "skill_on_special_kill",
					event = "on_special_killed",
					name = "deus_skill_on_special_kill",
					percent_restored = MorrisBuffTweakData.deus_skill_on_special_kill.percent_restored,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_skill_on_special_kill.percent_restored,
			},
		},
	},
	drop_item_on_ability_use = {
		advanced_description = "description_drop_item_on_ability_use",
		display_name = "display_name_drop_item_on_ability_use",
		icon = "drop_item_on_ability_use",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "drop_item_on_ability_use",
					cooldown_buff = "drop_item_on_ability_use_cooldown",
					event = "on_ability_cooldown_started",
					name = "drop_item_on_active_ability_use",
					cooldown_durations = {
						deus_rally_flag = 180,
						holy_hand_grenade = 180,
						pockets_full_of_bombs_potion = 120,
					},
				},
			},
		},
		description_values = {},
	},
	movement_speed_on_active_ability_use = {
		advanced_description = "description_movement_speed_on_active_ability_use",
		display_name = "display_name_movement_speed_on_active_ability_use",
		icon = "movement_speed_on_active_ability_use",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff_on_proc",
					buff_to_add = "active_ability_movement_speed",
					event = "on_ability_cooldown_started",
					name = "movement_speed_on_active_ability_use",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.active_ability_movement_speed.visualizer_multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.active_ability_movement_speed.duration,
			},
		},
	},
	attack_speed_per_cooldown = {
		advanced_description = "description_attack_speed_per_cooldown",
		display_name = "display_name_attack_speed_per_cooldown",
		icon = "deus_icon_attack_speed_per_cooldown",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "attack_speed_per_cooldown",
					stat_buff = "attack_speed",
					update_func = "update_attack_speed_per_cooldown",
					value = MorrisBuffTweakData.attack_speed_per_cooldown.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.attack_speed_per_cooldown.multiplier,
			},
		},
	},
	cooldown_on_friendly_ability = {
		advanced_description = "description_cooldown_on_friendly_ability",
		display_name = "display_name_cooldown_on_friendly_ability",
		icon = "deus_icon_cooldown_on_friendly_ability",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "cooldown_on_friendly_ability",
					event = "on_ability_activated",
					name = "cooldown_on_friendly_ability",
					range = 20,
					value = MorrisBuffTweakData.cooldown_on_friendly_ability.percent_restored,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.cooldown_on_friendly_ability.percent_restored,
			},
		},
	},
	deus_push_increased_cleave = {
		advanced_description = "description_deus_push_increased_cleave",
		display_name = "display_name_deus_push_increased_cleave",
		icon = "deus_push_increased_cleave",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff",
					buff_to_add = "deus_push_increased_cleave_buff",
					event = "on_push",
					name = "deus_push_increased_cleave",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_push_increased_cleave_buff.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_push_increased_cleave_buff.duration,
			},
		},
	},
	deus_throw_speed_increase = {
		advanced_description = "description_deus_throw_speed_increase",
		display_name = "display_name_deus_throw_speed_increase",
		icon = "deus_utils",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					max_stacks = 1,
					name = "deus_throw_speed_increase",
					stat_buff = "throw_speed_increase",
					multiplier = MorrisBuffTweakData.deus_throw_speed_increase.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_throw_speed_increase.multiplier,
			},
		},
	},
	deus_grenade_multi_throw = {
		advanced_description = "description_deus_grenade_multi_throw",
		display_name = "display_name_deus_grenade_multi_throw",
		icon = "deus_icon_grenade_multi_throw",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_grenade_multi_throw",
					stat_buff = "grenade_extra_shot",
					bonus = MorrisBuffTweakData.deus_grenade_multi_throw.bonus,
				},
			},
		},
		description_values = {
			{
				value_type = "bonus",
				value = MorrisBuffTweakData.deus_grenade_multi_throw.bonus,
			},
		},
	},
	deus_knockdown_damage_immunity_aura = {
		advanced_description = "description_deus_knockdown_damage_immunity_aura",
		display_name = "display_name_deus_knockdown_damage_immunity_aura",
		icon = "deus_knockdown_damage_immunity_aura",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_to_add = "deus_knockdown_damage_immunity_buff",
					name = "deus_knockdown_damage_immunity_aura",
					range = 10,
					remove_buff_func = "remove_aura_buff",
					update_func = "deus_knockdown_damage_immunity_aura_func",
				},
			},
		},
		description_values = {
			exotic = {},
		},
	},
	deus_coin_pickup_regen = {
		advanced_description = "description_deus_coin_pickup_regen",
		display_name = "display_name_deus_coin_pickup_regen",
		icon = "deus_healing",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "add_buff_on_pickup",
					event = "on_consumable_picked_up",
					name = "deus_coin_pickup_regen",
					pickup_types = {
						deus_soft_currency = {
							"deus_coin_pickup_regen_buff",
						},
					},
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_coin_pickup_regen_buff.duration,
			},
		},
	},
	deus_ammo_pickup_give_allies_ammo = {
		advanced_description = "description_deus_ammo_pickup_give_allies_ammo",
		display_name = "display_name_deus_ammo_pickup_give_allies_ammo",
		icon = "deus_icon_ammo_pickup_give_allies_ammo",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "ally_gain_ammo_on_pickup",
					event = "on_consumable_picked_up",
					name = "deus_ammo_pickup_give_allies_ammo",
					pickup_types = {
						ammo = {
							max_range = 10,
							ammo_bonus_fraction = MorrisBuffTweakData.deus_ammo_pickup_give_allies_ammo.percent,
						},
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_ammo_pickup_give_allies_ammo.percent,
			},
		},
	},
	deus_target_full_health_damage_mult = {
		advanced_description = "description_deus_target_full_health_damage_mult",
		display_name = "display_name_deus_target_full_health_damage_mult",
		icon = "deus_target_full_health_damage_mult",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "deus_target_full_health_damage_mult",
					event = "on_player_damage_dealt",
					name = "deus_target_full_health_damage_mult",
					damage_mult = MorrisBuffTweakData.deus_target_full_health_damage_mult.baked_multiplier,
					valid_attack_types = {
						heavy_attack = true,
						light_attack = true,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_target_full_health_damage_mult.visualizer_number,
			},
		},
	},
	deus_barrel_power = {
		advanced_description = "description_deus_barrel_power",
		display_name = "display_name_deus_barrel_power",
		icon = "deus_icon_barrel_power",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "deus_damage_source_damage_mult",
					event = "on_damage_dealt",
					name = "deus_barrel_power",
					valid_damage_sources = {
						explosive_barrel = true,
						explosive_barrel_objective = true,
					},
					damage_mult = MorrisBuffTweakData.deus_barrel_power.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_barrel_power.visualizer_number,
			},
		},
	},
	deus_revive_regen = {
		advanced_description = "description_deus_revive_regen",
		display_name = "display_name_deus_revive_regen",
		icon = "deus_revive_regen",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "add_buff_on_ally_revived",
					event = "on_revived_ally",
					name = "deus_revive_regen",
					buff_to_add = {
						"deus_revive_regen_buff",
					},
					buff_to_add_revived = {
						"deus_revive_regen_buff",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_revive_regen_buff.duration,
			},
		},
	},
	deus_ammo_pickup_heal = {
		advanced_description = "description_deus_ammo_pickup_heal",
		display_name = "display_name_deus_ammo_pickup_heal",
		icon = "deus_icon_ammo_pickup_heal",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "heal_on_pickup",
					event = "on_consumable_picked_up",
					name = "deus_ammo_pickup_heal",
					sound_event = "hud_player_buff_regen_health",
					pickup_types = {
						ammo = {
							type = "health_regen",
							amount = MorrisBuffTweakData.deus_ammo_pickup_heal.amount,
						},
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.deus_ammo_pickup_heal.amount,
			},
		},
	},
	deus_max_health = {
		advanced_description = "description_deus_max_health",
		display_name = "display_name_deus_max_health",
		icon = "deus_max_health",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_max_health",
					stat_buff = "max_health",
					multiplier = MorrisBuffTweakData.deus_max_health.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_max_health.multiplier,
			},
		},
	},
	deus_health_regeneration = {
		advanced_description = "description_deus_health_regeneration",
		display_name = "display_name_deus_health_regeneration",
		icon = "deus_icon_health_regeneration",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "health_regen_start",
					authority = "server",
					heal_type = "health_regen",
					name = "deus_health_regeneration",
					update_func = "health_regen_update",
					time_between_heal = MorrisBuffTweakData.deus_health_regeneration.frequency,
					heal = MorrisBuffTweakData.deus_health_regeneration.amount,
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_health_regeneration.amount,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_health_regeneration.frequency,
			},
		},
	},
	deus_large_ammo_pickup_infinite_ammo = {
		advanced_description = "description_deus_large_ammo_pickup_infinite_ammo",
		display_name = "display_name_deus_large_ammo_pickup_infinite_ammo",
		icon = "deus_offense",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "add_buff_on_pickup",
					event = "on_consumable_picked_up",
					name = "deus_large_ammo_pickup_infinite_ammo",
					pickup_names = {
						all_ammo = {
							"deus_large_ammo_pickup_infinite_ammo_buff",
						},
						all_ammo_small = {
							"deus_large_ammo_pickup_infinite_ammo_buff",
						},
					},
				},
			},
		},
		description_values = {
			{
				value_type = "duration",
				value = MorrisBuffTweakData.deus_large_ammo_pickup_infinite_ammo_buff.duration,
			},
		},
	},
	deus_larger_clip = {
		advanced_description = "description_deus_larger_clip",
		display_name = "display_name_deus_larger_clip",
		icon = "deus_offense",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_larger_clip",
					stat_buff = "clip_size",
					multiplier = MorrisBuffTweakData.deus_larger_clip.multiplier,
				},
				{
					apply_buff_func = "refresh_ranged_slot_buffs",
					name = "deus_larger_clip_update",
					remove_buff_func = "refresh_ranged_slot_buffs",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_larger_clip.multiplier,
			},
		},
	},
	deus_timed_block_free_shot = {
		advanced_description = "description_deus_timed_block_free_shot",
		display_name = "display_name_deus_timed_block_free_shot",
		icon = "deus_utils",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff",
					buff_to_add = "deus_timed_block_free_shot_buff",
					event = "on_timed_block",
					name = "deus_timed_block_free_shot",
				},
			},
		},
		description_values = {},
	},
	deus_more_head_less_body_damage = {
		advanced_description = "description_deus_more_head_less_body_damage",
		display_name = "display_name_deus_more_head_less_body_damage",
		icon = "deus_more_head_less_body_damage",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_more_head_less_body_damage",
					stat_buff = "headshot_damage",
					multiplier = MorrisBuffTweakData.deus_more_head_less_body_damage.positive_multiplier,
				},
				{
					name = "deus_more_head_less_body_damage_negative",
					stat_buff = "non_headshot_damage",
					multiplier = MorrisBuffTweakData.deus_more_head_less_body_damage.negative_multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_more_head_less_body_damage.positive_multiplier,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_more_head_less_body_damage.negative_multiplier,
			},
		},
	},
	friendly_cooldown_on_ability = {
		advanced_description = "description_friendly_cooldown_on_ability",
		display_name = "display_name_friendly_cooldown_on_ability",
		icon = "friendly_cooldown_on_ability",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "friendly_cooldown_on_ability",
					event = "on_ability_activated",
					name = "friendly_cooldown_on_ability",
					range = 20,
					value = MorrisBuffTweakData.friendly_cooldown_on_ability.percent,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.friendly_cooldown_on_ability.percent,
			},
		},
	},
	triple_melee_headshot_power = {
		advanced_description = "description_triple_melee_headshot_power",
		display_name = "display_name_triple_melee_headshot_power",
		icon = "triple_melee_headshot_power",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "triple_melee_headshot_power_counter",
					buff_to_add = "triple_melee_headshot_power_boost",
					event = "on_hit",
					name = "triple_melee_headshot_power",
					hits = MorrisBuffTweakData.triple_melee_headshot_power_boost.count,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.triple_melee_headshot_power_boost.count,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.triple_melee_headshot_power_boost.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.triple_melee_headshot_power_boost.duration,
			},
		},
	},
	deus_cooldown_regen = {
		advanced_description = "description_deus_cooldown_regen",
		display_name = "display_name_deus_cooldown_regen",
		icon = "deus_icon_cooldown_regen",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					max_stacks = 10,
					name = "deus_cooldown_regen",
					stat_buff = "cooldown_regen",
					multiplier = MorrisBuffTweakData.deus_cooldown_regen.multiplier,
				},
			},
		},
		description_values = {
			{
				value = 0.1,
				value_type = "percent",
			},
		},
	},
	deus_infinite_dodges = {
		advanced_description = "description_deus_infinite_dodges",
		display_name = "display_name_deus_infinite_dodges",
		icon = "deus_infinite_dodges",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_infinite_dodges",
					perks = {
						buff_perks.infinite_dodge,
					},
				},
			},
		},
		description_values = {
			exotic = {},
		},
	},
	deus_uninterruptable_attacks = {
		advanced_description = "description_deus_uninterruptable_attacks",
		display_name = "display_name_deus_uninterruptable_attacks",
		icon = "deus_uninterruptable_attacks",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "deus_uninterruptable_attacks",
					perks = {
						buff_perks.uninterruptible,
					},
				},
			},
		},
		description_values = {},
	},
	deus_increased_healing_taken = {
		advanced_description = "description_deus_increased_healing_taken",
		display_name = "display_name_deus_increased_healing_taken",
		icon = "deus_increased_healing_taken",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					max_stacks = 10,
					name = "deus_more_healing_received",
					priority_buff = true,
					stat_buff = "healing_received",
					multiplier = MorrisBuffTweakData.deus_increased_healing_taken.multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_increased_healing_taken.multiplier,
			},
		},
	},
	last_player_standing_power_reg = {
		advanced_description = "description_last_player_standing_power_reg",
		display_name = "display_name_last_player_standing_power_reg",
		icon = "last_player_standing_power_reg",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "last_player_standing_knocked_down_check",
					buff_to_add = "last_player_standing_power_reg_boost",
					event = "on_ally_knocked_down",
					name = "last_player_standing_power_reg",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.last_player_standing_power_reg_boost.multiplier,
			},
			{
				value_type = "duration",
				value = MorrisBuffTweakData.last_player_standing_power_reg_boost.duration,
			},
		},
	},
	deus_cooldown_reg_not_hit = {
		advanced_description = "description_deus_cooldown_reg_not_hit",
		display_name = "display_name_deus_cooldown_reg_not_hit",
		icon = "deus_icon_cooldown_reg_not_hit",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "deus_cooldown_reg_not_hit_init",
					authority = "server",
					buff_func = "deus_cooldown_reg_not_hit_damage_taken",
					buff_to_add = "cooldown_reg_not_hit_buff",
					event = "on_damage_taken",
					name = "cooldown_reg_on_not_hit",
					update_func = "deus_cooldown_reg_not_hit_update",
					interval = MorrisBuffTweakData.cooldown_reg_not_hit_buff.frequency,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.cooldown_reg_not_hit_buff.frequency,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.cooldown_reg_not_hit_buff.multiplier,
			},
			{
				value_type = "stacks",
				value = MorrisBuffTweakData.cooldown_reg_not_hit_buff.max_stacks,
			},
		},
	},
	deus_push_charge = {
		advanced_description = "description_deus_push_charge",
		display_name = "display_name_deus_push_charge",
		icon = "deus_push_charge",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "deus_push_charge",
					event = "on_push",
					name = "deus_push_charge",
					sound_event = "dodge",
					lunge_settings = {
						duration = 0.25,
						falloff_to_speed = 5,
						initial_speed = 25,
					},
				},
			},
		},
		description_values = {},
	},
	transfer_temp_health_at_full = {
		advanced_description = "description_transfer_temp_health_at_full",
		display_name = "display_name_transfer_temp_health_at_full",
		icon = "transfer_temp_health_at_full",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "transfer_temp_health_at_full",
					event = "on_healed",
					name = "transfer_temp_health_at_full",
					range = 20,
				},
			},
		},
		description_values = {},
	},
	deus_standing_still_damage_reduction = {
		advanced_description = "description_deus_standing_still_damage_reduction",
		display_name = "display_name_deus_standing_still_damage_reduction",
		icon = "deus_standing_still_damage_reduction",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_to_add = "deus_standing_still_damage_reduction_buff",
					name = "deus_standing_still_damage_reduction",
					update_frequency = 0.2,
					update_func = "deus_standing_still_damage_reduction_update",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_standing_still_damage_reduction_buff.multiplier,
			},
		},
	},
	deus_free_potion_use_on_ability = {
		advanced_description = "description_deus_free_potion_use_on_ability",
		display_name = "display_name_deus_free_potion_use_on_ability",
		icon = "deus_icon_free_potion_use_on_ability",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "apply_held_potion_effect",
					event = "on_ability_cooldown_started",
					name = "deus_free_potion_use_on_ability",
					proc_chance = MorrisBuffTweakData.deus_free_potion_use_on_ability.proc_chance,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.deus_free_potion_use_on_ability.proc_chance,
			},
		},
	},
	deus_block_procs_parry = {
		advanced_description = "description_deus_block_procs_parry",
		display_name = "display_name_deus_block_procs_parry",
		icon = "deus_icon_block_procs_parry",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "block_procs_parry",
					event = "on_block",
					name = "deus_block_procs_parry",
				},
			},
		},
		description_values = {},
	},
	melee_killing_spree_speed = {
		advanced_description = "description_melee_killing_spree_speed",
		display_name = "display_name_melee_killing_spree_speed",
		icon = "melee_killing_spree_speed",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "melee_killing_spree_speed_counter",
					buff_to_add = "melee_killing_spree_speed_boost",
					event = "on_kill",
					name = "melee_killing_spree_speed",
					update_func = "melee_killing_spree_speed_counter_update",
					kills = MorrisBuffTweakData.melee_killing_spree_speed_boost.kill_amount,
					time = MorrisBuffTweakData.melee_killing_spree_speed_boost.kill_window,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.melee_killing_spree_speed_boost.kill_amount,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.melee_killing_spree_speed_boost.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.melee_killing_spree_speed_boost.duration,
			},
		},
	},
	boon_skulls_01 = {
		advanced_description = "description_boon_skulls_01",
		display_name = "display_name_boon_skulls_01",
		icon = "grudge_mark_frenzy_debuff",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "boon_skulls_01_on_hit",
					buff_to_add = "boon_skulls_01_stack",
					event = "on_melee_hit",
					name = "boon_skulls_01",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_01_data.attack_speed_per_stack,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_01_data.max_stacks,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_01_data.max_stacks,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_01_data.attack_speed_on_proc,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_01_data.duration,
			},
		},
	},
	boon_skulls_02 = {
		advanced_description = "description_boon_skulls_02",
		display_name = "display_name_boon_skulls_02",
		icon = "potion_liquid_bravado",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "boon_skulls_02_on_kill",
					buff_to_add = "boon_skulls_02_stack",
					event = "on_kill",
					name = "boon_skulls_02",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_02_data.power_per_stack,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_02_data.max_stacks,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_02_data.power_on_proc,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_02_data.duration,
			},
		},
	},
	boon_skulls_03 = {
		advanced_description = "description_boon_skulls_03",
		display_name = "display_name_boon_skulls_03",
		icon = "bardin_slayer_passive_increased_max_stacks",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "boon_skulls_03_on_parry",
					cooldown_buff_name = "boon_skulls_03_cooldown",
					event = "on_timed_block",
					explosion_template_name = "boon_skulls_03",
					name = "boon_skulls_03",
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_skulls_03_data.cooldown,
			},
		},
	},
	boon_skulls_04 = {
		advanced_description = "description_boon_skulls_04",
		display_name = "display_name_boon_skulls_04",
		icon = "mutator_skulls_cooldown_reduction",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "boon_skulls_04_on_hit",
					buff_to_add = "boon_skulls_04_regen",
					event = "on_melee_hit",
					name = "boon_skulls_04",
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_skulls_04_data.thp_on_hit,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_04_data.total_thp_to_consume,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_04_data.thp_per_second,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_04_data.proc_cooldown_regen,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_04_data.proc_duration,
			},
		},
	},
	boon_skulls_05 = {
		advanced_description = "description_boon_skulls_05",
		display_name = "display_name_boon_skulls_05",
		icon = "bardin_slayer_crit_chance",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "boon_skulls_05_on_hit",
					buff_to_add = "boon_skulls_05_stack",
					event = "on_melee_hit",
					name = "boon_skulls_05",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_05_data.power_per_stack,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_05_data.duration,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_05_data.max_stacks,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_skulls_05_data.power_on_proc,
			},
			{
				value = MorrisBuffTweakData.boon_skulls_05_data.duration,
			},
		},
	},
	talent_1_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 1,
	},
	talent_1_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 1,
	},
	talent_1_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 1,
	},
	talent_2_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 2,
	},
	talent_2_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 2,
	},
	talent_2_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 2,
	},
	talent_3_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 3,
	},
	talent_3_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 3,
	},
	talent_3_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 3,
	},
	talent_4_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 4,
	},
	talent_4_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 4,
	},
	talent_4_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 4,
	},
	talent_5_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 5,
	},
	talent_5_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 5,
	},
	talent_5_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 5,
	},
	talent_6_1 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 1,
		talent_tier = 6,
	},
	talent_6_2 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 2,
		talent_tier = 6,
	},
	talent_6_3 = {
		max_amount = 1,
		rectangular_icon = true,
		talent = true,
		talent_index = 3,
		talent_tier = 6,
	},
	deus_power_up_quest_granted_test_01 = {
		advanced_description = "description_deus_power_up_quest_granted_test_01",
		display_name = "display_name_deus_power_up_quest_granted_test_01",
		icon = "melee_killing_spree_speed",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "spawn_orb",
					event = "on_kill",
					name = "deus_power_up_quest_granted_test_01",
					orb_settings = {
						orb_name = "test_orb_01",
					},
				},
			},
		},
		description_values = {},
	},
	melee_wave = {
		advanced_description = "description_melee_wave",
		display_name = "display_name_melee_wave",
		icon = "deus_icon_melee_wave",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			create_parent_buff_shared_table = true,
			buffs = {
				{
					buff_func = "add_melee_wave_stacks",
					buff_to_add = "melee_wave_buff",
					event = "on_ability_activated",
					name = "melee_wave",
					stacks_to_add = MorrisBuffTweakData.melee_wave.stacks_to_add,
				},
				{
					buff_func = "melee_wave_effect",
					event = "on_hit",
					explosion_template = "melee_wave",
					name = "melee_wave_on_hit",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.melee_wave.stacks_to_add,
			},
		},
	},
	money_magnet = {
		advanced_description = "description_money_magnet",
		display_name = "display_name_money_magnet",
		icon = "deus_icon_money_magnet",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "money_magnet_start",
					name = "money_magnet",
					update_every = 1,
					update_func = "money_magnet_update",
					magnet_distance = MorrisBuffTweakData.money_magnet.magnet_distance,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.money_magnet.magnet_distance,
			},
		},
	},
	skill_by_block = {
		advanced_description = "description_skill_by_block",
		display_name = "display_name_skill_by_block",
		icon = "deus_icon_skill_by_block",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "reduce_activated_ability_cooldown_on_block",
					event = "on_block",
					name = "skill_by_block",
				},
			},
		},
		description_values = {},
	},
	speed_over_stamina = {
		advanced_description = "description_speed_over_stamina",
		display_name = "display_name_speed_over_stamina",
		icon = "deus_icon_speed_over_stamina",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "add_buff",
					buff_to_add = "speed_over_stamina_buff",
					event = "on_block_broken",
					name = "speed_over_stamina",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.speed_over_stamina_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.speed_over_stamina_buff.duration,
			},
		},
	},
	missing_health_power_up = {
		advanced_description = "description_missing_health_power_up",
		display_name = "display_name_missing_health_power_up",
		icon = "deus_icon_missing_health_power_up",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_to_add = "missing_health_power_up_buff",
					name = "missing_health_power_up",
					update_func = "activate_buff_stacks_based_on_health_chunks",
					chunk_size = MorrisBuffTweakData.missing_health_power_up_buff.chunk_size,
					max_stacks = MorrisBuffTweakData.missing_health_power_up_buff.max_stacks,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.missing_health_power_up_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.missing_health_power_up_buff.chunk_size,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.missing_health_power_up_buff.max_stacks,
			},
		},
	},
	detect_weakness = {
		advanced_description = "description_detect_weakness",
		display_name = "display_name_detect_weakness",
		icon = "deus_icon_kill_the_marked",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "apply_generic_aoe",
					mark_buff = "detect_weakness_marked_enemy",
					mark_cooldown = 20,
					name = "detect_weakness",
					remove_buff_func = "remove_generic_aoe",
					update_func = "update_generic_aoe",
					range_check = {
						only_ai = true,
						radius = 10,
						randomize_result = true,
						unit_entered_range_func = "detect_weakness_unit_entered_range",
						unit_left_range_func = "detect_weakness_unit_left_range",
						update_rate = 0.5,
					},
					markable_enemies = {
						beastmen_bestigor = true,
						beastmen_gor = true,
						beastmen_ungor = true,
						chaos_berzerker = true,
						chaos_fanatic = true,
						chaos_marauder = true,
						chaos_marauder_with_shield = true,
						chaos_raider = true,
						chaos_warrior = true,
						skaven_clan_rat = true,
						skaven_clan_rat_with_shield = true,
						skaven_plague_monk = true,
						skaven_slave = true,
						skaven_storm_vermin = true,
						skaven_storm_vermin_champion = true,
						skaven_storm_vermin_commander = true,
						skaven_storm_vermin_with_shield = true,
					},
				},
				{
					buff_func = "detect_weakness_on_kill",
					event = "on_kill",
					kill_buff = "detect_weakness_buff",
					mark_buff = "detect_weakness_marked_enemy",
					name = "detect_weakness_on_kill",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.detect_weakness_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.detect_weakness_buff.duration,
			},
		},
	},
	squats = {
		advanced_description = "description_squats",
		display_name = "display_name_squats",
		icon = "deus_icon_squats",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					actual_buff = "squats_buff",
					buff_func = "squats_add_buff",
					buff_to_add = "squats_buff",
					build_up_buff = "squats_build_up_buff",
					event = "on_crouch",
					name = "squats",
					stack_count_to_trigger_actual_buff = MorrisBuffTweakData.squats_build_up_buff.max_stacks,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.squats_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.squats_buff.duration,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.squats_buff.max_stacks,
			},
		},
	},
	pyrotechnical_echo = {
		advanced_description = "description_pyrotechnical_echo",
		display_name = "display_name_pyrotechnical_echo",
		icon = "deus_icon_pyrotechnical_echo",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "pyrotechnical_echo_on_grenade_exploded",
					event = "on_grenade_exploded",
					explosion_delay = 1,
					name = "pyrotechnical_echo",
					update_func = "pyrotechnical_echo_update",
				},
			},
		},
		description_values = {},
	},
	blazing_revenge = {
		advanced_description = "description_blazing_revenge",
		display_name = "display_name_blazing_revenge",
		icon = "deus_icon_blazing_revenge",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			create_parent_buff_shared_table = true,
			buffs = {
				{
					buff_func = "blazing_revenge_on_knocked_down",
					event = "on_knocked_down",
					explosion_template = "blazing_revenge",
					name = "blazing_revenge_on_knocked_down",
					radius = 2,
					remove_buff_func = "blazing_revenge_clear_aoe",
					sound_end_event = "boon_blazing_revenge_end",
					sound_start_event = "boon_blazing_revenge_start",
				},
				{
					buff_func = "blazing_revenge_clear_aoe",
					event = "on_revived",
					name = "blazing_revenge_on_revived",
					sound_end_event = "boon_blazing_revenge_end",
				},
				{
					buff_func = "blazing_revenge_clear_aoe",
					event = "on_death",
					name = "blazing_revenge_on_death",
					sound_end_event = "boon_blazing_revenge_end",
				},
			},
		},
		description_values = {},
	},
	cluster_barrel = {
		advanced_description = "description_cluster_barrel",
		display_name = "display_name_cluster_barrel",
		icon = "deus_icon_cluster_barrel",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					barrel_count = 4,
					buff_func = "cluster_barrel_on_barrel_exploded",
					event = "on_barrel_exploded",
					explode_time = 2,
					fuse_time = 3,
					item_name = "tiny_explosive_barrel",
					max_horizontal_velocity = 4,
					name = "cluster_barrel",
					random_explosion_delay = 0.8,
					vertical_velocity = 7,
				},
			},
		},
		description_values = {},
	},
	wolfpack = {
		advanced_description = "description_wolfpack",
		display_name = "display_name_wolfpack",
		icon = "deus_icon_wolfpack",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "wolfpack_apply",
					buff_to_add = "wolfpack_buff",
					name = "wolfpack",
					remove_buff_func = "wolfpack_remove",
					update_func = "wolfpack_update",
					range_check = {
						only_players = true,
						radius = 20,
						unit_entered_range_func = "wolfpack_entered_range",
						unit_left_range_func = "wolfpack_left_range",
						update_rate = 3,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.wolfpack_buff.multiplier,
			},
		},
	},
	comradery = {
		advanced_description = "description_comradery",
		display_name = "display_name_comradery",
		icon = "deus_icon_comradery",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "comradery_apply",
					buff_to_add = "comradery_buff",
					name = "comradery",
					remove_buff_func = "comradery_remove",
					update_func = "comradery_update",
					range_check = {
						only_players = true,
						radius = 10,
						unit_entered_range_func = "comradery_entered_range",
						unit_left_range_func = "comradery_left_range",
						update_rate = 3,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.comradery_buff.multiplier,
			},
		},
	},
	invigorating_strike = {
		advanced_description = "description_invigorating_strike",
		display_name = "display_name_invigorating_strike",
		icon = "deus_icon_invigorating_strike",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			create_parent_buff_shared_table = true,
			buffs = {
				{
					buff_func = "invigorating_strike_on_damage_dealt",
					cooldown_buff = "invigorating_strike_cooldown",
					damage_to_heal_conversion_multiplier = 0.4,
					event = "on_damage_dealt",
					name = "invigorating_strike",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.invigorating_strike_cooldown.duration,
			},
		},
	},
	staggering_force = {
		advanced_description = "description_staggering_force",
		display_name = "display_name_staggering_force",
		icon = "deus_icon_staggering_force",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "staggering_force_on_stagger",
					buff_to_add = "staggering_force_buff",
					event = "on_stagger",
					name = "staggering_force",
					enemy_count = MorrisBuffTweakData.staggering_force.enemy_count,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.staggering_force.enemy_count,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.staggering_force_buff.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.staggering_force_buff.duration,
			},
		},
	},
	thorn_skin = {
		advanced_description = "description_thorn_skin",
		display_name = "display_name_thorn_skin",
		icon = "deus_icon_thorn_skin",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "thorn_skin_effect",
					event = "on_damage_taken",
					explosion_template = "thorn_skin",
					name = "thorn_skin",
				},
			},
		},
		description_values = {},
	},
	pyrrhic_strength = {
		advanced_description = "description_pyrrhic_strength",
		display_name = "display_name_pyrrhic_strength",
		icon = "deus_icon_pyrrhic_strength",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "pyrrhic_strength_power",
					stat_buff = "power_level",
					multiplier = MorrisBuffTweakData.pyrrhic_strength_power.multiplier,
				},
				{
					name = "pyrrhic_strength_health",
					stat_buff = "health_curse",
					bonus = MorrisBuffTweakData.pyrrhic_strength_health.bonus,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.pyrrhic_strength_power.multiplier,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.pyrrhic_strength_health.bonus,
			},
		},
	},
	tenacious = {
		advanced_description = "description_tenacious",
		display_name = "display_name_tenacious",
		icon = "deus_icon_tenacious",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "tenacious",
					tick = 1,
					update_func = "tenacious_update",
					health_per_tick = MorrisBuffTweakData.tenacious.health_per_tick,
					health_threshold = MorrisBuffTweakData.tenacious.health_threshold,
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.tenacious.health_per_tick,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.tenacious.health_threshold,
			},
		},
	},
	lucky = {
		advanced_description = "description_lucky",
		display_name = "display_name_lucky",
		icon = "deus_icon_lucky",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			create_parent_buff_shared_table = true,
			buffs = {
				{
					buff_func = "lucky_on_non_crit",
					buff_to_add = "lucky_buff",
					event = "on_non_critical_action",
					name = "lucky_on_non_crit",
				},
				{
					buff_func = "lucky_on_crit",
					event = "on_critical_action",
					name = "lucky_on_crit",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.lucky_buff.bonus,
			},
		},
	},
	hidden_escape = {
		advanced_description = "description_hidden_escape",
		display_name = "display_name_hidden_escape",
		icon = "deus_icon_hidden_escape",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			create_parent_buff_shared_table = true,
			buffs = {
				{
					buff_func = "hidden_escape_on_damage_taken",
					buff_to_add = "hidden_escape_buff",
					cooldown_buff = "hidden_escape_cooldown_buff",
					event = "on_damage_taken",
					invisibility_cooldown = 60,
					name = "hidden_escape",
					invalid_damage_sources = {
						ground_impact = true,
						life_drain = true,
						life_tap = true,
						overcharge = true,
						temporary_health_degen = true,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.hidden_escape_cooldown_buff.duration,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.hidden_escape_buff.duration,
			},
		},
	},
	curative_empowerment = {
		advanced_description = "description_curative_empowerment",
		display_name = "display_name_curative_empowerment",
		icon = "deus_icon_curative_empowerment",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "curative_empowerment_on_healed_ally",
					buff_to_add = "curative_empowerment_buff",
					event = "on_healed_ally",
					heal_type = "bandage",
					name = "curative_empowerment",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.curative_empowerment_buff.multiplier,
			},
			{
				value = MorrisBuffTweakData.curative_empowerment_buff.duration,
			},
		},
	},
	pent_up_anger = {
		advanced_description = "description_pent_up_anger",
		display_name = "display_name_pent_up_anger",
		icon = "deus_icon_pent_up_anger",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "pent_up_anger_on_block",
					buff_to_add = "pent_up_anger_buff",
					crit_buff = "pent_up_anger_guaranteed_crit_buff",
					event = "on_block",
					name = "pent_up_anger",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.pent_up_anger_buff.max_stacks,
			},
		},
	},
	surprise_strike = {
		advanced_description = "description_surprise_strike",
		display_name = "display_name_surprise_strike",
		icon = "deus_icon_surprise_strike",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "surprise_strike_add_buff",
					buff_to_add = "surprise_strike_guaranteed_crit_buff",
					event = "on_visible",
					name = "surprise_strike",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.surprise_strike_guaranteed_crit_buff.duration,
			},
		},
	},
	bad_breath = {
		advanced_description = "description_bad_breath",
		display_name = "display_name_bad_breath",
		icon = "deus_icon_bad_breath",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "start_bad_breath_timer",
					cooldown_buff = "bad_breath_cooldown_buff",
					event = "on_player_disabled",
					explosion_template = "bad_breath",
					name = "bad_breath",
					rescue_delay = 0.5,
					update_func = "update_bad_breath",
					rescuable_disable_types = {
						assassin_pounced = true,
						corruptor_grab = true,
						pack_master_grab = true,
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.bad_breath_cooldown_buff.duration,
			},
		},
	},
	boulder_bro = {
		advanced_description = "description_boulder_bro",
		display_name = "display_name_boulder_bro",
		icon = "deus_icon_boulder_bro",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "boulder_bro_add_buff",
					buff_to_add = "boulder_bro_buff",
					name = "boulder_bro",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.boulder_bro_cooldown_buff.duration,
			},
		},
	},
	static_blade = {
		advanced_description = "description_static_blade",
		display_name = "display_name_static_blade",
		icon = "deus_icon_static_blade",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "static_blade_on_timed_block",
					cooldown_buff = "static_blade_cooldown_buff",
					damage_profile_name = "static_blade",
					damage_source = "buff",
					event = "on_timed_block",
					explosion_template = "static_blade",
					fx = "fx/cw_chain_lightning",
					name = "static_blade",
					sound_event = "boon_static_blade",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.static_blade_cooldown_buff.duration,
			},
		},
	},
	boon_bomb_heavy_01 = {
		advanced_description = "description_boon_bomb_heavy_01",
		display_name = "display_name_boon_bomb_heavy_01",
		icon = "deus_icon_boon_bomb_heavy_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					multiplier = -0.5,
					name = "boon_bomb_heavy_01",
					stat_buff = "grenade_throw_range",
				},
				{
					multiplier = 1,
					name = "boon_bomb_heavy_01_radius",
					stat_buff = "explosion_radius",
				},
				{
					multiplier = 1,
					name = "boon_bomb_heavy_01_damage",
					stat_buff = "explosion_damage",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = math.abs(MorrisBuffTweakData.boon_bomb_heavy_01_data.throw_range),
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_bomb_heavy_01_data.radius,
			},
		},
	},
	boonset_drone_part1 = {
		advanced_description = "description_boonset_drone_part1",
		display_name = "display_name_boonset_drone_part1",
		icon = "deus_icon_drone_part1",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "spawn_drones_proc_headshot",
					damage_profile_name = "deus_damage_drone",
					event = "on_damage_dealt",
					name = "boonset_drone_part1",
					num_drones = MorrisBuffTweakData.boonset_drone_part1_data.num_drones,
					radius = MorrisBuffTweakData.boonset_drone_part1_data.radius,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boonset_drone_part1_data.num_drones,
			},
		},
	},
	boonset_drone_part2 = {
		advanced_description = "description_boonset_drone_part2",
		display_name = "display_name_boonset_drone_part2",
		icon = "deus_icon_drone_part2",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "client",
					buff_func = "spawn_drones_proc",
					damage_profile_name = "deus_damage_drone",
					event = "on_timed_block",
					name = "boonset_drone_part2",
					num_drones = MorrisBuffTweakData.boonset_drone_part2_data.num_drones,
					radius = MorrisBuffTweakData.boonset_drone_part2_data.radius,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boonset_drone_part2_data.num_drones,
			},
		},
	},
	boonset_drone_part3 = {
		advanced_description = "description_boonset_drone_part3",
		display_name = "display_name_boonset_drone_part3",
		icon = "deus_icon_drone_part3",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "spawn_drones_proc",
					damage_profile_name = "deus_damage_drone",
					event = "on_critical_hit",
					name = "boonset_drone_part3",
					num_drones = MorrisBuffTweakData.boonset_drone_part3_data.num_drones,
					radius = MorrisBuffTweakData.boonset_drone_part3_data.radius,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boonset_drone_part3_data.num_drones,
			},
		},
	},
	boonset_drone_part4 = {
		advanced_description = "description_boonset_drone_part4",
		display_name = "display_name_boonset_drone_part4",
		icon = "deus_icon_drone_part4",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "boonset_drone_part4",
					stat_buff = "increased_drone_count",
					bonus = MorrisBuffTweakData.boonset_drone_part4_data.num_extra_drones,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boonset_drone_part4_data.num_extra_drones,
			},
		},
	},
	boonset_crit_set_bonus = {
		advanced_description = "description_boonset_crit_set_bonus",
		display_name = "display_name_boonset_crit_set_bonus",
		icon = "deus_icon_crit_set_bonus",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					bonus = 1,
					name = "boonset_crit_set_bonus",
					stat_buff = "critical_strike_chance_heavy",
				},
			},
		},
	},
	boon_supportbomb_healing_01 = {
		advanced_description = "description_boon_supportbomb_healing_01",
		display_name = "display_name_boon_supportbomb_healing_01",
		icon = "deus_icon_supportbomb_healing_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "grenade_explode_buff_area",
					buff_to_add = "boon_supportbomb_healing_01_zone",
					event = "on_grenade_exploded",
					name = "boon_supportbomb_healing_01",
					perks = {
						buff_perks.no_explosion_friendly_fire,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
			},
			{
				value = MorrisBuffTweakData.boon_supportbomb_healing_01_data.heal_amount,
			},
		},
	},
	boon_supportbomb_strenght_01 = {
		advanced_description = "description_boon_supportbomb_strenght_01",
		display_name = "display_name_boon_supportbomb_strenght_01",
		icon = "deus_icon_supportbomb_strenght_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "grenade_explode_buff_area",
					buff_to_add = "boon_supportbomb_strenght_01_zone",
					event = "on_grenade_exploded",
					name = "boon_supportbomb_strenght_01",
					perks = {
						buff_perks.no_explosion_friendly_fire,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_supportbomb_strenght_01_data.multiplier,
			},
		},
	},
	boon_supportbomb_speed_01 = {
		advanced_description = "description_boon_supportbomb_speed_01",
		display_name = "display_name_boon_supportbomb_speed_01",
		icon = "deus_icon_supportbomb_speed_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "grenade_explode_buff_area",
					buff_to_add = "boon_supportbomb_speed_01_zone",
					event = "on_grenade_exploded",
					name = "boon_supportbomb_speed_01",
					perks = {
						buff_perks.no_explosion_friendly_fire,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_supportbomb_speed_01_data.multiplier,
			},
		},
	},
	boon_supportbomb_concentration_01 = {
		advanced_description = "description_boon_supportbomb_concentration_01",
		display_name = "display_name_boon_supportbomb_concentration_01",
		icon = "deus_icon_supportbomb_concentration_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "grenade_explode_buff_area",
					buff_to_add = "boon_supportbomb_concentration_01_zone",
					event = "on_grenade_exploded",
					name = "boon_supportbomb_concentration_01",
					perks = {
						buff_perks.no_explosion_friendly_fire,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_supportbomb_concentration_01_data.multiplier,
			},
		},
	},
	boon_supportbomb_crit_01 = {
		advanced_description = "description_boon_supportbomb_crit_01",
		display_name = "display_name_boon_supportbomb_crit_01",
		icon = "deus_icon_supportbomb_crit_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "grenade_explode_buff_area",
					buff_to_add = "boon_supportbomb_crit_01_zone",
					event = "on_grenade_exploded",
					name = "boon_supportbomb_crit_01",
					perks = {
						buff_perks.no_explosion_friendly_fire,
					},
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_supportbomb_shared_data.duration,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_supportbomb_crit_01_data.bonus,
			},
		},
	},
	boon_careerskill_01 = {
		advanced_description = "description_boon_careerskill_01",
		display_name = "display_name_boon_careerskill_01",
		icon = "deus_icon_careerskill_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "lightning_adjecent_enemies",
					damage_profile_name = "boon_career_ability_lightning_aoe",
					damage_source = "buff",
					event = "on_ability_activated",
					explosion_template = "static_blade",
					fx = "fx/cw_chain_lightning",
					name = "boon_careerskill_01",
					sound_event = "boon_static_blade",
					area_radius = MorrisBuffTweakData.boon_career_ability_lightning_aoe_data.radius,
				},
			},
		},
	},
	boon_careerskill_02 = {
		advanced_description = "description_boon_careerskill_02",
		display_name = "display_name_boon_careerskill_02",
		icon = "deus_icon_careerskill_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "apply_dot_to_adjecent_enemies",
					dot_template_name = "boon_career_ability_burning_aoe",
					event = "on_ability_activated",
					name = "boon_careerskill_02",
					area_radius = MorrisBuffTweakData.boon_career_ability_burning_aoe_data.radius,
				},
			},
		},
	},
	boon_careerskill_03 = {
		advanced_description = "description_boon_careerskill_03",
		display_name = "display_name_boon_careerskill_03",
		icon = "deus_icon_careerskill_03",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "apply_dot_to_adjecent_enemies",
					dot_template_name = "boon_career_ability_poison_aoe",
					event = "on_ability_activated",
					name = "boon_careerskill_03",
					area_radius = MorrisBuffTweakData.boon_career_ability_poison_aoe_data.radius,
				},
			},
		},
	},
	boon_careerskill_04 = {
		advanced_description = "description_boon_careerskill_04",
		display_name = "display_name_boon_careerskill_04",
		icon = "deus_icon_careerskill_04",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "apply_dot_to_adjecent_enemies",
					dot_template_name = "boon_career_ability_bleed_aoe",
					event = "on_ability_activated",
					name = "boon_careerskill_04",
					area_radius = MorrisBuffTweakData.boon_career_ability_bleed_aoe_data.radius,
				},
			},
		},
	},
	boon_careerskill_06 = {
		advanced_description = "description_boon_careerskill_06",
		display_name = "display_name_boon_careerskill_06",
		icon = "deus_icon_careerskill_06",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "boon_careerskill_06",
					stat_buff = "extra_ability_charges",
					bonus = MorrisBuffTweakData.boon_careerskill_06_data.bonus,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_careerskill_06_data.bonus,
			},
		},
	},
	boon_careerskill_07 = {
		advanced_description = "description_boon_careerskill_07",
		display_name = "display_name_boon_careerskill_07",
		icon = "deus_icon_careerskill_07",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "spawn_drones_proc",
					damage_profile_name = "deus_damage_drone",
					event = "on_ability_activated",
					name = "boon_careerskill_07",
					num_drones = MorrisBuffTweakData.boon_careerskill_07_data.num_drones,
					radius = MorrisBuffTweakData.boon_careerskill_07_data.radius,
				},
			},
		},
		description_values = {
			{
				value = MorrisBuffTweakData.boon_careerskill_07_data.num_drones,
			},
		},
	},
	boon_dot_burning_01 = {
		advanced_description = "description_boon_dot_burning_01",
		display_name = "display_name_boon_dot_burning_01",
		icon = "deus_icon_dot_burning_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "boon_dot_burning_01_spread",
					dot_template_name = "boon_career_ability_burning_aoe",
					event = "on_kill",
					name = "boon_dot_burning_01",
					area_radius = MorrisBuffTweakData.boon_dot_burning_01_data.radius,
				},
			},
		},
	},
	boon_teamaura_01 = {
		advanced_description = "description_boon_teamaura_01",
		display_name = "display_name_boon_teamaura_01",
		icon = "deus_icon_teamaura_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "extra_damage_near_teammates_check",
					event = "damage_calculation_started",
					name = "boon_teamaura_01",
					distance_from_allies = MorrisBuffTweakData.boon_teamaura_01_data.distance_from_allies,
				},
				{
					buff_func = "extra_damage_near_teammates_cleanup",
					event = "damage_calculation_ended",
					name = "boon_teamaura_01_cleanup",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_teamaura_01_data.multiplier,
			},
		},
	},
	boon_teamaura_02 = {
		advanced_description = "description_boon_teamaura_02",
		display_name = "display_name_boon_teamaura_02",
		icon = "deus_icon_teamaura_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "extra_stagger_near_teammates_check",
					event = "stagger_calculation_started",
					name = "boon_teamaura_02",
					distance_from_allies = MorrisBuffTweakData.boon_teamaura_02_data.distance_from_allies,
				},
				{
					buff_func = "extra_stagger_near_teammates_cleanup",
					event = "stagger_calculation_ended",
					name = "boon_teamaura_02_cleanup",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_teamaura_02_data.multiplier,
			},
		},
	},
	boon_aura_01 = {
		advanced_description = "description_boon_aura_01",
		display_name = "display_name_boon_aura_01",
		icon = "deus_icon_aura_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "apply_generic_aoe",
					name = "boon_aura_01",
					remove_buff_func = "remove_generic_aoe",
					update_func = "update_generic_aoe",
					range_check = {
						only_ai = true,
						radius = 5,
						server_only = true,
						unit_entered_range_func = "teammates_extra_damage_aura_enter",
						unit_left_range_func = "teammates_extra_damage_aura_leave",
						update_rate = 1,
					},
				},
				{
					buff_func = "teammates_extra_damage_aura_reduce_own_damage",
					event = "damage_calculation_started",
					name = "deus_damage_aura_reduce_own_damage",
				},
				{
					buff_func = "teammates_extra_damage_aura_revert_own_damage",
					event = "damage_calculation_ended",
					name = "deus_damage_aura_increase_own_damage",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_aura_01.multiplier,
			},
		},
	},
	boon_aura_02 = {
		advanced_description = "description_boon_aura_02",
		display_name = "display_name_boon_aura_02",
		icon = "deus_icon_aura_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "apply_generic_aoe",
					name = "boon_aura_02",
					remove_buff_func = "remove_generic_aoe",
					update_func = "update_generic_aoe",
					range_check = {
						only_ai = true,
						radius = 5,
						server_only = true,
						unit_entered_range_func = "teammates_extra_stagger_aura_enter",
						unit_left_range_func = "teammates_extra_stagger_aura_leave",
						update_rate = 1,
					},
				},
				{
					buff_func = "teammates_extra_stagger_aura_reduce_own_stagger",
					event = "stagger_calculation_started",
					name = "deus_stagger_aura_reduce_own_stagger",
				},
				{
					buff_func = "teammates_extra_stagger_aura_revert_own_stagger",
					event = "stagger_calculation_ended",
					name = "deus_stagger_aura_increase_own_stagger",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_aura_02.multiplier,
			},
		},
	},
	boon_aura_03 = {
		advanced_description = "description_boon_aura_03",
		display_name = "display_name_boon_aura_03",
		icon = "deus_icon_aura_03",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					explosion_template_name = "periodic_aoe_stagger",
					name = "boon_aura_03",
					update_frequency = 5,
					update_func = "periodic_aoe_stagger",
				},
			},
		},
	},
	boon_aoe_02 = {
		advanced_description = "description_boon_aoe_02",
		display_name = "display_name_boon_aoe_02",
		icon = "deus_icon_aoe_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "cursed_chest_area_buff",
					buff_to_add = "boon_cursed_chest_damage_area_buff",
					event = "cursed_chest_running",
					name = "boon_aoe_02",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.damage_multiplier,
			},
			{
				value = MorrisBuffTweakData.boon_cursed_chest_damage_area_buff_data.duration,
			},
		},
	},
	boon_aoe_03 = {
		advanced_description = "description_boon_aoe_03",
		display_name = "display_name_boon_aoe_03",
		icon = "deus_icon_aoe_03",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "cursed_chest_area_buff",
					buff_to_add = "boon_cursed_chest_cooldown_area_buff",
					event = "cursed_chest_running",
					name = "boon_aoe_03",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.cooldown_multiplier,
			},
			{
				value = MorrisBuffTweakData.boon_cursed_chest_cooldown_area_buff_data.duration,
			},
		},
	},
	boon_meta_01 = {
		advanced_description = "description_boon_meta_01",
		display_name = "display_name_boon_meta_01",
		icon = "deus_icon_meta_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "boon_meta_01_apply",
					buff_func = "boon_meta_01_boon_granted",
					event = "on_boon_granted",
					name = "boon_meta_01",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_meta_01_data.damage_multiplier_per_stack,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_meta_01_data.attack_speed_multiplier_per_stack,
			},
		},
	},
	boon_weaponrarity_01 = {
		advanced_description = "description_boon_weaponrarity_01",
		display_name = "display_name_boon_weaponrarity_01",
		icon = "deus_icon_weaponrarity_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "boon_weaponrarity_01_apply",
					authority = "client",
					buff_func = "boon_weaponrarity_01_weapon_wielded",
					event = "on_wield",
					name = "boon_weaponrarity_01",
					stat_buff = "cooldown_regen",
					multiplier = MorrisBuffTweakData.boon_weaponrarity_01_data.base_multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_weaponrarity_01_data.base_multiplier,
			},
			{
				value_type = "percent",
				value = math.abs(MorrisBuffTweakData.boon_weaponrarity_01_data.multiplier_per_rarity),
			},
		},
	},
	boon_weaponrarity_02 = {
		advanced_description = "description_boon_weaponrarity_02",
		display_name = "display_name_boon_weaponrarity_02",
		icon = "deus_icon_weaponrarity_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					apply_buff_func = "boon_weaponrarity_02_apply",
					authority = "client",
					buff_func = "boon_weaponrarity_02_weapon_wielded",
					event = "on_wield",
					name = "boon_weaponrarity_02",
					stat_buff = "critical_strike_chance",
					bonus = MorrisBuffTweakData.boon_weaponrarity_02_data.base_bonus,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_weaponrarity_02_data.base_bonus,
			},
			{
				value_type = "percent",
				value = math.abs(MorrisBuffTweakData.boon_weaponrarity_02_data.bonus_per_rarity),
			},
		},
	},
	boon_range_01 = {
		advanced_description = "description_boon_range_01",
		display_name = "display_name_boon_range_01",
		icon = "deus_icon_range_01",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "boon_range_01",
					stat_buff = "ammo_used_multiplier",
					multiplier = MorrisBuffTweakData.boon_range_01_data.ammo_usage_multiplier,
				},
				{
					name = "boon_range_01_damage",
					stat_buff = "increased_weapon_damage_ranged",
					multiplier = MorrisBuffTweakData.boon_range_01_data.damage_multiplier,
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_range_01_data.damage_multiplier,
			},
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_range_01_data.ammo_usage_multiplier,
			},
		},
	},
	boon_range_02 = {
		advanced_description = "description_boon_range_02",
		display_name = "display_name_boon_range_02",
		icon = "deus_icon_ranged_02",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					authority = "server",
					buff_func = "boon_range_02_delayed_add_on_hit",
					event = "on_ranged_hit",
					name = "boon_range_02",
				},
				{
					buff_func = "boon_range_02_damage_check",
					event = "damage_calculation_started",
					name = "boon_range_02_damage_check",
				},
				{
					buff_func = "boon_range_02_damage_cleanup",
					event = "damage_calculation_ended",
					name = "boon_range_02_damage_cleanup",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_range_02_data.multiplier,
			},
			{
				value = MorrisBuffTweakData.boon_range_02_data.duration,
			},
		},
	},
	resolve = {
		advanced_description = "description_resolve",
		display_name = "display_name_resolve",
		icon = "deus_icon_resolve",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "resolve_on_revived",
					cooldown_buff = "resolve_cooldown_buff",
					event = "on_revived",
					full_heal_buff = "resolve_buff",
					name = "resolve",
					update_func = "resolve_update",
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.resolve.cooldown,
			},
		},
	},
	indomitable = {
		advanced_description = "description_indomitable",
		display_name = "display_name_indomitable",
		icon = "deus_icon_indomitable",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					name = "indomitable",
					perks = {
						buff_perks.infinite_wounds,
					},
				},
			},
		},
		description_values = {},
	},
	health_orbs = {
		advanced_description = "description_health_orbs",
		display_name = "display_name_health_orbs",
		icon = "deus_icon_health_orbs",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "on_damage_taken_health_orbs",
					event = "on_damage_taken",
					name = "health_orbs",
					health_per_orb = MorrisBuffTweakData.health_orbs.health_per_orb,
					orb_settings = {
						orb_name = "health_orb",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.health_orbs.health_per_orb,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.health_orbs.orb_health,
			},
		},
	},
	static_charge = {
		advanced_description = "description_static_charge",
		display_name = "display_name_static_charge",
		icon = "deus_icon_static_charge",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "on_kill_static_charge",
					event = "on_kill",
					name = "static_charge",
					kills_per_orb = MorrisBuffTweakData.static_charge.kills_per_orb,
					orb_settings = {
						orb_name = "static_charge",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.static_charge.kills_per_orb,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.static_charge.orb_duration,
			},
		},
	},
	sharing_is_caring = {
		advanced_description = "description_sharing_is_caring",
		display_name = "display_name_sharing_is_caring",
		icon = "deus_icon_sharing_is_caring",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "on_potion_consumed_sharing_is_caring",
					event = "on_potion_consumed",
					name = "sharing_is_caring",
				},
			},
		},
		description_values = {},
	},
	protection_orbs = {
		advanced_description = "description_protection_orbs",
		display_name = "display_name_protection_orbs",
		icon = "deus_icon_protection",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "on_timed_block_protection_orbs",
					event = "on_timed_block",
					name = "protection_orbs",
					cooldown = MorrisBuffTweakData.protection_orbs.trigger_cooldown,
					orb_settings = {
						orb_name = "protection_orb",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.protection_orbs.trigger_cooldown,
			},
			{
				value_type = "percent",
				value = -MorrisBuffTweakData.protection_orb.multiplier,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.protection_orb.duration,
			},
		},
	},
	focused_accuracy = {
		advanced_description = "description_focused_accuracy",
		display_name = "display_name_focused_accuracy",
		icon = "deus_icon_focussed_accuracy",
		max_amount = 1,
		rectangular_icon = true,
		buff_template = {
			buffs = {
				{
					buff_func = "focused_accuracy_on_hit",
					cooldown_buff = "focused_accuracy_cooldown",
					event = "on_hit",
					name = "focused_accuracy",
					orb_settings = {
						orb_name = "ability_cooldown_reduction_orb",
					},
				},
			},
		},
		description_values = {
			{
				value_type = "amount",
				value = MorrisBuffTweakData.focused_accuracy.cooldown_duration,
			},
			{
				value_type = "amount",
				value = MorrisBuffTweakData.ability_cooldown_reduction_orb.duration,
			},
		},
	},
	boon_deus_coins_greed = {
		advanced_description = "description_properties_deus_coins_greed",
		display_name = "properties_deus_coins_greed",
		icon = "bardin_ironbreaker_gromril_armour",
		max_amount = 1,
		plain_display_name = "properties_deus_coins_greed",
		buff_template = {
			buffs = {
				{
					stat_buff = "deus_coins_greed",
				},
			},
		},
		description_values = {
			{
				value_type = "percent",
				value = MorrisBuffTweakData.boon_deus_coins_greed.multiplier,
			},
		},
	},
}
DeusPowerUpIncompatibilityPairs = {
	wh_zealot = {},
	wh_bountyhunter = {
		{
			"talent_6_2",
			"talent_6_3",
		},
	},
	wh_captain = {},
	wh_priest = {},
	bw_scholar = {},
	bw_adept = {},
	bw_unchained = {},
	dr_ironbreaker = {},
	dr_slayer = {},
	dr_ranger = {
		{
			"talent_4_1",
			"talent_4_2",
		},
		{
			"talent_4_1",
			"talent_4_3",
		},
		{
			"talent_4_2",
			"talent_4_3",
		},
		{
			"talent_6_1",
			"talent_6_2",
		},
	},
	dr_engineer = {
		{
			"talent_4_1",
			"talent_4_3",
		},
		{
			"talent_6_1",
			"talent_6_2",
		},
		{
			"talent_6_1",
			"talent_6_3",
		},
	},
	we_shade = {
		{
			"talent_6_1",
			"talent_6_3",
		},
	},
	we_maidenguard = {},
	we_waywatcher = {
		{
			"talent_4_1",
			"talent_4_2",
		},
		{
			"talent_4_2",
			"talent_4_3",
		},
		{
			"talent_6_1",
			"talent_6_2",
		},
		{
			"talent_6_1",
			"talent_6_3",
		},
	},
	we_thornsister = {
		{
			"talent_6_1",
			"talent_6_2",
		},
		{
			"talent_6_2",
			"talent_6_3",
		},
	},
	es_huntsman = {
		{
			"talent_6_2",
			"talent_6_3",
		},
	},
	es_knight = {
		{
			"talent_4_1",
			"talent_4_2",
		},
		{
			"talent_4_1",
			"talent_4_3",
		},
		{
			"talent_4_2",
			"talent_4_3",
		},
	},
	es_mercenary = {
		{
			"talent_4_1",
			"talent_4_2",
		},
		{
			"talent_4_1",
			"talent_4_3",
		},
		{
			"talent_4_2",
			"talent_4_3",
		},
		{
			"talent_2_3",
			"lucky",
		},
	},
	es_questingknight = {
		{
			"talent_6_1",
			"talent_6_3",
		},
	},
}
DeusPowerUpExclusionList = DeusPowerUpExclusionList or {
	wh_zealot = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	wh_bountyhunter = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	wh_captain = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	wh_priest = {
		boon_range_01 = true,
		boon_range_02 = true,
		deus_ammo_pickup_give_allies_ammo = true,
		deus_ammo_pickup_heal = true,
		deus_large_ammo_pickup_infinite_ammo = true,
		deus_larger_clip = true,
		deus_timed_block_free_shot = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	bw_scholar = {
		deus_ammo_pickup_heal = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	bw_adept = {
		deus_ammo_pickup_heal = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	bw_unchained = {
		deus_ammo_pickup_heal = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	dr_ironbreaker = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	dr_slayer = {
		deus_ammo_pickup_give_allies_ammo = true,
		deus_ammo_pickup_heal = true,
		deus_large_ammo_pickup_infinite_ammo = true,
		deus_larger_clip = true,
		deus_timed_block_free_shot = true,
		heal_on_dot_damage_dealt = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	dr_ranger = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	dr_engineer = {
		boon_weaponrarity_01 = true,
		deus_cooldown_reg_not_hit = true,
		deus_cooldown_regen = true,
		deus_free_potion_use_on_ability = true,
		drop_item_on_ability_use = true,
		friendly_cooldown_on_ability = true,
		movement_speed_on_active_ability_use = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	we_shade = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	we_maidenguard = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	we_waywatcher = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	we_thornsister = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	es_huntsman = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	es_knight = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	es_mercenary = {
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
	es_questingknight = {
		boon_range_01 = true,
		boon_range_02 = true,
		deus_ammo_pickup_give_allies_ammo = true,
		deus_ammo_pickup_heal = true,
		deus_large_ammo_pickup_infinite_ammo = true,
		deus_larger_clip = true,
		deus_timed_block_free_shot = true,
		heal_on_dot_damage_dealt = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
		talent_4_1 = true,
		talent_4_2 = true,
		talent_4_3 = true,
	},
	bw_necromancer = {
		deus_ammo_pickup_heal = true,
		talent_3_1 = true,
		talent_3_2 = true,
		talent_3_3 = true,
	},
}
DeusPowerUpAvailabilityTypes = DeusPowerUpAvailabilityTypes or table.enum("cursed_chest", "shrine", "terror_event", "weapon_chest")
DeusPowerUpRarityPool = DeusPowerUpRarityPool or {
	rare = {
		{
			"talent_2_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_2_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_2_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_4_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_4_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_4_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_5_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_5_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_5_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"attack_speed",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"stamina",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"crit_chance",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"push_block_arc",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"ability_cooldown_reduction",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"crit_boost",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_skaven",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_chaos",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_unarmoured",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_armoured",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_large",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"power_vs_frenzy",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"health",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"block_cost",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"protection_skaven",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"protection_chaos",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"protection_aoe",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"respawn_speed",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"revive_speed",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"fatigue_regen",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"movespeed",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
		{
			"home_brewer",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"decanter",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"healers_touch",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"hand_of_shallya",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"power_up_of_shallya",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"natural_bond",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"barkskin",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"grenadier",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"explosive_ordinance",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"shrapnel",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_revive_regen",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_ammo_pickup_heal",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_more_head_less_body_damage",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"friendly_cooldown_on_ability",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_skill_on_special_kill",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"triple_melee_headshot_power",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_standing_still_damage_reduction",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_damage_reduction_on_incapacitated",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_cooldown_regen",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_extra_stamina",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"money_magnet",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"speed_over_stamina",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"missing_health_power_up",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"cluster_barrel",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"wolfpack",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"comradery",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"staggering_force",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"tenacious",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"lucky",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"hidden_escape",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"pent_up_anger",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"surprise_strike",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"resolve",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"health_orbs",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"sharing_is_caring",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"protection_orbs",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"focused_accuracy",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_supportbomb_concentration_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_supportbomb_speed_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_bomb_heavy_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_aoe_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_aoe_03",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_03",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_04",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boonset_drone_part2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_07",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_aura_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_aura_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_meta_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_weaponrarity_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_teamaura_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_range_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_dot_burning_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_deus_coins_greed",
			{
				DeusPowerUpAvailabilityTypes.terror_event,
			},
			{},
		},
	},
	exotic = {
		{
			"talent_1_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_1_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_1_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_3_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_3_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_3_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"heal_on_dot_damage_dealt",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"explosive_kills_on_elite_kills",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"attack_speed_per_cooldown",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"cooldown_on_friendly_ability",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_max_health",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_health_regeneration",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_powerup_attack_speed",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_second_wind",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_crit_on_damage_taken",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_infinite_dodges",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_uninterruptable_attacks",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_increased_healing_taken",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"last_player_standing_power_reg",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_cooldown_reg_not_hit",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"movement_speed_on_active_ability_use",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_push_cost_reduction",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_free_potion_use_on_ability",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_block_procs_parry",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_push_charge",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_target_full_health_damage_mult",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_barrel_power",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_guard_aura_check",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boulder_bro",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"static_charge",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"pyrrhic_strength",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"invigorating_strike",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"pyrotechnical_echo",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"blazing_revenge",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"detect_weakness",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"skill_by_block",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"melee_wave",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"static_blade",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_power_up_quest_granted_test_01",
			{},
			{},
		},
		{
			"boon_weaponrarity_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_supportbomb_healing_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_supportbomb_crit_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_supportbomb_strenght_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boonset_drone_part1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boonset_drone_part3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_aura_03",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_range_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_teamaura_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
	},
	unique = {
		{
			"talent_6_1",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_6_2",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"talent_6_3",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"drop_item_on_ability_use",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_grenade_multi_throw",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_knockdown_damage_immunity_aura",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"transfer_temp_health_at_full",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"melee_killing_spree_speed",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_reckless_swings",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_parry_damage_immune",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"deus_push_increased_cleave",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"indomitable",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"bad_breath",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"curative_empowerment",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"thorn_skin",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boon_careerskill_06",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{},
		},
		{
			"boonset_drone_part4",
			{},
			{},
		},
		{
			"boonset_crit_set_bonus",
			{},
			{},
		},
	},
	event = {
		{
			"boon_skulls_01",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{
				"skulls_2023",
			},
		},
		{
			"boon_skulls_02",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{
				"skulls_2023",
			},
		},
		{
			"boon_skulls_03",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{
				"skulls_2023",
			},
		},
		{
			"boon_skulls_04",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{
				"skulls_2023",
			},
		},
		{
			"boon_skulls_05",
			{
				DeusPowerUpAvailabilityTypes.cursed_chest,
				DeusPowerUpAvailabilityTypes.weapon_chest,
				DeusPowerUpAvailabilityTypes.shrine,
			},
			{
				"skulls_2023",
			},
		},
	},
}
DeusPowerUpSets = {
	{
		completed_sfx = "hud_morris_boon_set_completed",
		progress_sfx = "hud_morris_boon_set_crit_layer",
		pieces = {
			{
				name = "pent_up_anger",
				rarity = "rare",
			},
			{
				name = "deus_crit_on_damage_taken",
				rarity = "exotic",
			},
			{
				name = "boon_supportbomb_crit_01",
				rarity = "exotic",
			},
		},
		rewards = {
			{
				name = "boonset_crit_set_bonus",
				rarity = "unique",
			},
		},
	},
	{
		completed_sfx = "hud_morris_boon_set_completed",
		num_required_pieces = 3,
		progress_sfx = "hud_morris_boon_set_drone_layer",
		pieces = {
			{
				name = "boonset_drone_part1",
				rarity = "exotic",
			},
			{
				name = "boonset_drone_part2",
				rarity = "rare",
			},
			{
				name = "boonset_drone_part3",
				rarity = "exotic",
			},
			{
				name = "boon_careerskill_07",
				rarity = "rare",
			},
		},
		rewards = {
			{
				name = "boonset_drone_part4",
				rarity = "unique",
			},
		},
	},
}
DeusPowerUpRarities = DeusPowerUpRarities or {
	"event",
	"rare",
	"exotic",
	"unique",
}
DeusPowerUpRarityWeights = DeusPowerUpRarityWeights or {
	default = {
		event = {
			150,
			150,
			150,
		},
		rare = {
			60,
			60,
			60,
		},
		exotic = {
			30,
			30,
			30,
		},
		unique = {
			10,
			10,
			10,
		},
	},
}
DeusPowerUpTalentLookup = {}

for power_up_name, power_up_settings in pairs(DeusPowerUpTemplates) do
	if power_up_settings.talent then
		local talent_tier = power_up_settings.talent_tier
		local talent_index = power_up_settings.talent_index
		local talent_tier_map = DeusPowerUpTalentLookup[talent_tier] or {}

		DeusPowerUpTalentLookup[talent_tier] = talent_tier_map
		talent_tier_map[talent_index] = power_up_name
	end
end

local is_valid = true
local error_message = "[DeusPowerUpSettings] One or more errors in power_up settings."

for _, power_up_configs in pairs(DeusPowerUpRarityPool) do
	for _, power_config in ipairs(power_up_configs) do
		local power_up_name = power_config[1]

		if not DeusPowerUpTemplates[power_up_name] then
			is_valid = false
			error_message = error_message .. string.format("\n'%s' is in rarity pool but has no template.", power_up_name)
		end
	end
end

if #DeusPowerUpRarities ~= table.size(DeusPowerUpRarityPool) then
	is_valid = false
	error_message = error_message .. string.format("\nSizes of DeusPowerUpRarities (%d) and DeusPowerUpRarityPool (%d) are not the same! Make sure both tables have the same rarities!", #DeusPowerUpRarities, table.size(DeusPowerUpRarityPool))
end

for _, rarity in ipairs(DeusPowerUpRarities) do
	if not DeusPowerUpRarityPool[rarity] then
		is_valid = false
		error_message = error_message .. string.format("\nDeusPowerUpRarities contains the rarity '%s' which is missing in DeusPowerUpRarityPool.", rarity)
	end
end

for _, rarity in ipairs(DeusPowerUpRarities) do
	local power_up_costs = DeusCostSettings.shop.power_ups

	if not power_up_costs[rarity] then
		error_message = error_message .. string.format("\nPower up with the rarity '%s' can be generated but there is no cost settings for that.", rarity)
	end
end

assert(is_valid, error_message)

DeusPowerUpRarityChance = DeusPowerUpRarityChance or {}
DeusPowerUps = DeusPowerUps or {}
DeusPowerUpsArray = DeusPowerUpsArray or {}
DeusPowerUpSetLookup = table.select_map(table.set(DeusPowerUpRarities), function (_, rarity)
	return {}
end)
DeusPowerUpsLookup = {}

for difficulty, config in pairs(DeusPowerUpRarityWeights) do
	local normalized_config = {}
	local count = #config.rare

	for i = 1, count do
		local weight_sum = 0

		for _, weights in pairs(config) do
			weight_sum = weight_sum + weights[i]
		end

		for rarity, weights in pairs(config) do
			normalized_config[rarity] = normalized_config[rarity] or {}
			normalized_config[rarity][i] = weights[i] / weight_sum
		end
	end

	DeusPowerUpRarityChance[difficulty] = normalized_config
end

for career_name, incompatibility_list in pairs(DeusPowerUpIncompatibilityPairs) do
	for _, pair in ipairs(incompatibility_list) do
		local power_up_1 = pair[1]
		local power_up_2 = pair[2]
		local power_up_1_template = DeusPowerUpTemplates[power_up_1]
		local power_up_2_template = DeusPowerUpTemplates[power_up_2]

		assert(power_up_1_template, tostring(power_up_1) .. "in DeusPowerUpIncompatibilityPairs, but not in DeusPowerUpTemplates")
		assert(power_up_2_template, tostring(power_up_2) .. "in DeusPowerUpIncompatibilityPairs, but not in DeusPowerUpTemplates")

		local incompatibility_1 = power_up_1_template.incompatibility or {}
		local incompatibility_2 = power_up_2_template.incompatibility or {}
		local career_incompatibility_1 = incompatibility_1[career_name] or {}
		local career_incompatibility_2 = incompatibility_2[career_name] or {}

		career_incompatibility_1[#career_incompatibility_1 + 1] = power_up_2
		career_incompatibility_2[#career_incompatibility_2 + 1] = power_up_1
		incompatibility_1[career_name] = career_incompatibility_1
		incompatibility_2[career_name] = career_incompatibility_2
		power_up_1_template.incompatibility = incompatibility_1
		power_up_2_template.incompatibility = incompatibility_2
	end
end

for rarity, power_up_configs in pairs(DeusPowerUpRarityPool) do
	DeusPowerUps[rarity] = {}
	DeusPowerUpsArray[rarity] = {}

	for _, power_up_config in ipairs(power_up_configs) do
		local power_up_name = power_up_config[1]
		local availability = power_up_config[2]
		local mutators = power_up_config[3]
		local template = DeusPowerUpTemplates[power_up_name]
		local new_power_up

		if template.talent then
			new_power_up = {
				talent = true,
				name = power_up_name,
				talent_tier = template.talent_tier,
				talent_index = template.talent_index,
				rarity = rarity,
				max_amount = template.max_amount or 1,
				availability = availability,
				mutators = mutators,
				incompatibility = template.incompatibility,
			}
		else
			new_power_up = {
				display_name = template.display_name,
				plain_display_name = template.plain_display_name,
				name = power_up_name,
				rarity = rarity,
				buff_name = "power_up_" .. power_up_name .. "_" .. rarity,
				max_amount = template.max_amount or 1,
				advanced_description = template.advanced_description,
				description_values = template.description_values,
				icon = template.icon,
				availability = availability,
				mutators = mutators,
				incompatibility = template.incompatibility,
			}

			local buff_template = table.clone(template.buff_template)
			local tweak_data = MorrisBuffTweakData[power_up_name]

			if tweak_data then
				for key, value in pairs(tweak_data) do
					buff_template.buffs[1][key] = value
				end
			end

			buff_template.buffs[1].name = new_power_up.buff_name
			DeusPowerUpBuffTemplates[new_power_up.buff_name] = buff_template
		end

		DeusPowerUps[rarity][power_up_name] = new_power_up

		table.insert(DeusPowerUpsArray[rarity], new_power_up)

		DeusPowerUps[rarity][power_up_name].id = #DeusPowerUpsArray[rarity]
		DeusPowerUps[rarity][power_up_name].lookup_id = #DeusPowerUpsLookup + 1
		DeusPowerUpsLookup[#DeusPowerUpsLookup + 1] = new_power_up
		DeusPowerUpsLookup[power_up_name] = new_power_up
	end
end

for _, power_up_set in pairs(DeusPowerUpSets) do
	for _, set_piece_settings in pairs(power_up_set.pieces) do
		local rarity = set_piece_settings.rarity
		local name = set_piece_settings.name

		DeusPowerUpSetLookup[rarity][name] = DeusPowerUpSetLookup[rarity][name] or {}

		table.insert(DeusPowerUpSetLookup[rarity][name], power_up_set)
	end

	for _, set_reward_settings in pairs(power_up_set.rewards) do
		local rarity = set_reward_settings.rarity
		local name = set_reward_settings.name

		DeusPowerUpSetLookup[rarity][name] = DeusPowerUpSetLookup[rarity][name] or {}

		table.insert(DeusPowerUpSetLookup[rarity][name], power_up_set)
	end
end
