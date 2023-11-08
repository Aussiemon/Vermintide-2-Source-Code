local HEALTH_MULTIPLIER = 2
local breed_data = {
	detection_radius = 12,
	bot_melee_aim_node = "j_neck",
	has_inventory = false,
	perception = "perception_regular",
	run_speed = 3,
	death_reaction = "chaos_greed_pinata",
	proximity_system_check = true,
	target_selection = "pick_closest_target",
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	smart_targeting_width = 0.2,
	no_stagger_duration = true,
	threat_value = 0,
	debug_spawn_category = "Misc",
	awards_positive_reinforcement_message = true,
	target_head_node = "j_neck",
	smart_object_template = "special",
	hit_reaction = "ai_default",
	flingable = false,
	target_selection_alerted = "pick_closest_target_infinte_range",
	override_bot_target_node = "j_neck",
	bone_lod_level = 0,
	smart_targeting_outer_width = 0.6,
	hit_effect_template = "HitEffectsChaosGreedPinata",
	smart_targeting_height_multiplier = 3.5,
	radius = 1,
	unit_template = "ai_unit_greed_pinata",
	perception_previous_attacker_stickyness_value = 0,
	race = "chaos",
	bloodlust_health = 0,
	poison_resistance = 70,
	armor_category = 1,
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 1,
	vortexable = false,
	behavior = "chaos_greed_pinata",
	base_unit = "units/props/deus_pinata/deus_pinata_01",
	aoe_height = 1.5,
	infighting = InfightingSettings.none,
	max_health = {
		25 * HEALTH_MULTIPLIER,
		25 * HEALTH_MULTIPLIER,
		37.5 * HEALTH_MULTIPLIER,
		50 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER
	},
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	debug_color = {
		255,
		100,
		200,
		200
	},
	run_on_spawn = AiBreedSnippets.on_greed_pinata_spawned,
	hit_zones = {
		torso = {
			prio = 1,
			actors = {
				"j_neck"
			}
		},
		neck = {
			prio = 2,
			actors = {
				"j_neck"
			}
		},
		full = {
			prio = 3,
			actors = {}
		}
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 10,
		bot_ratling_gun_fire = 10,
		jumps = 10,
		destructible_wall = 0,
		temporary_wall = 1,
		ledges_with_fence = 10,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 10,
		fire_grenade = 10
	}
}
Breeds.chaos_greed_pinata = table.create_copy(Breeds.chaos_greed_pinata, breed_data)
local action_data = {
	flee = {
		escaped_players_distance_sq = 10000
	},
	idle = {
		sound_when_near_distance_sqr = 900,
		sound_when_near_event = "Play_loot_rat_near_sound"
	},
	teleport = {
		teleport_effect = "fx/deus_prop_pinata_teleport"
	},
	stagger = {
		custom_exit_function = AiBreedSnippets.on_loot_rat_stagger_action_done,
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				}
			},
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd_gather"
				},
				bwd = {
					"stagger_fwd_gather"
				},
				left = {
					"stagger_fwd_gather"
				},
				right = {
					"stagger_fwd_gather"
				}
			}
		}
	}
}
BreedActions.chaos_greed_pinata = table.create_copy(BreedActions.chaos_greed_pinata, action_data)
