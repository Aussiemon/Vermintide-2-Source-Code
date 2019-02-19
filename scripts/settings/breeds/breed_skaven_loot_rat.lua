local breed_data = {
	detection_radius = 12,
	flingable = true,
	has_inventory = true,
	walk_speed = 3,
	run_speed = 5,
	target_selection = "pick_closest_target",
	dodge_crosshair_delay = 0.1,
	smart_targeting_width = 0.2,
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_4",
	armor_category = 1,
	poison_resistance = 70,
	dodge_crosshair_max_distance = 30,
	debug_spawn_category = "Misc",
	awards_positive_reinforcement_message = true,
	no_stagger_duration = true,
	bone_lod_level = 1,
	hit_reaction = "ai_default",
	smart_object_template = "special",
	wield_inventory_on_spawn = true,
	target_selection_alerted = "pick_closest_target_infinte_range",
	default_inventory_template = "loot_rat_sack",
	dodge_cooldown = 2,
	smart_targeting_outer_width = 0.6,
	hit_effect_template = "HitEffectsSkavenLootRat",
	smart_targeting_height_multiplier = 3.5,
	radius = 1,
	unit_template = "ai_unit_loot_rat",
	perception_previous_attacker_stickyness_value = 0,
	race = "skaven",
	proximity_system_check = true,
	death_reaction = "loot_rat",
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	dodge_crosshair_min_distance = 4,
	weapon_reach = 1.6,
	vortexable = true,
	dodge_crosshair_radius = 1,
	behavior = "loot_rat",
	base_unit = "units/beings/enemies/skaven_loot_rat/chr_skaven_loot_rat",
	threat_value = 0,
	dodge_damage_points = 20,
	max_health = {
		25,
		25,
		37.5,
		50,
		75
	},
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_special,
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
	run_on_update = AiBreedSnippets.on_loot_rat_update,
	run_on_alerted = AiBreedSnippets.on_loot_rat_alerted,
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 4,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 4,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
			}
		},
		left_leg = {
			prio = 4,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 4,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		tail = {
			prio = 4,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			push_actors = {
				"j_hips",
				"j_taill"
			}
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_righthand = "j_righthand",
		c_rightfoot = "j_rightfoot",
		c_tail2 = "j_tail2",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_tail5 = "j_tail5",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine1",
		c_tail6 = "j_tail6",
		c_rightupleg = "j_rightupleg",
		c_tail1 = "j_taill",
		c_tail4 = "j_tail4",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_righttoebase = "j_righttoebase",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_tail3 = "j_tail3",
		c_rightforearm = "j_rightforearm",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips",
		c_lefttoebase = "j_lefttoebase"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_taill = 0.05,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_tail3 = 0.05,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_leftshoulder = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_spine1 = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_tail6 = 0.05,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2,
		j_tail2 = 0.05
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 10,
		bot_ratling_gun_fire = 10,
		jumps = 10,
		ledges_with_fence = 10,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 10,
		fire_grenade = 10
	}
}
Breeds.skaven_loot_rat = table.create_copy(Breeds.skaven_loot_rat, breed_data)
local action_data = {
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "smash_door",
		damage = {
			5,
			5,
			5
		}
	},
	flee = {
		escaped_players_distance_sq = 10000
	},
	idle = {
		sound_when_near_distance_sqr = 900,
		sound_when_near_event = "Play_loot_rat_near_sound"
	},
	dodge = {
		dodge_time = 1.9,
		dodge_distance = 2,
		dodge_anim = "dodge_run_fwd"
	},
	follow = {
		distance_to_attack = 3,
		start_anims_name = {
			bwd = "move_fwd",
			fwd = "move_fwd",
			left = "move_fwd",
			right = "move_fwd"
		},
		start_anims_data = {
			move_fwd = {}
		}
	},
	explosion_attack = {
		action_weight = 10
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
			}
		}
	}
}
BreedActions.skaven_loot_rat = table.create_copy(BreedActions.skaven_loot_rat, action_data)

return
