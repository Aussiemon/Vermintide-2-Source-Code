local breed_data = {
	detection_radius = 9999999,
	initial_is_passive = false,
	has_inventory = true,
	walk_speed = 0.65,
	run_speed = 0.65,
	special = true,
	minion_detection_radius = 10,
	target_selection = "pick_closest_target",
	smart_targeting_width = 0.3,
	exchange_order = 2,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	aoe_radius = 0.7,
	hit_effect_template = "HitEffectsChaosSorcerer",
	debug_spawn_category = "Misc",
	armor_category = 5,
	is_bot_aid_threat = true,
	bot_hitbox_radius_approximation = 0.8,
	hit_reaction = "ai_default",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	threat_value = 20,
	wield_inventory_on_spawn = true,
	default_inventory_template = "chaos_sorcerer",
	smart_targeting_outer_width = 0.7,
	flingable = true,
	smart_targeting_height_multiplier = 2.2,
	bone_lod_level = 1,
	radius = 1,
	smart_object_template = "special",
	unit_template = "ai_unit_chaos_tentacle_sorcerer",
	hit_mass_count = 8,
	dialogue_source_name = "chaos_tentacle_sorcerer",
	race = "chaos",
	disable_second_hit_ragdoll = true,
	proximity_system_check = true,
	death_reaction = "ai_default",
	perception = "perception_all_seeing",
	player_locomotion_constrain_radius = 0.7,
	awards_positive_reinforcement_message = true,
	poison_resistance = 100,
	vortexable = false,
	perception_continuous = "perception_continuous_keep_target",
	behavior = "chaos_tentacle_sorcerer",
	base_unit = "units/beings/enemies/chaos_sorcerer_tentacle/chr_chaos_sorcerer_tentacle",
	aoe_height = 2.1,
	max_health = {
		14,
		16,
		20,
		24,
		35,
		35,
		35,
		35
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_special,
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
	hit_mass_counts = BreedTweaks.hit_mass_counts.sorcerer,
	debug_color = {
		255,
		200,
		200,
		0
	},
	disabled = Development.setting("disable_tentacle_sorcerer") or false,
	run_on_spawn = AiBreedSnippets.on_chaos_tentacle_sorcerer_spawn,
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
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
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_leg = {
			prio = 3,
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
			prio = 3,
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
		full = {
			prio = 4,
			actors = {}
		},
		afro = {
			prio = 5,
			actors = {
				"h_afro"
			}
		}
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 5,
		bot_ratling_gun_fire = 10,
		jumps = 5,
		destructible_wall = 5,
		temporary_wall = 0,
		ledges_with_fence = 5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 2,
		fire_grenade = 10
	}
}
Breeds.chaos_tentacle_sorcerer = table.create_copy(Breeds.chaos_tentacle_sorcerer, breed_data)
local action_data = {
	skulk_approach = {
		sorcerer_type = "tentacle",
		move_animation = "move_fwd",
		close_distance = 7,
		part_hp_lost_to_teleport = 0.1,
		far_away_from_target_sq = 400,
		search_func_name = "update_portal_search",
		preferred_distance = 10,
		teleport_cooldown = {
			7,
			10
		}
	},
	spawn_portal = {
		spawn_func_name = "spawn_portal",
		tentacle_spawn_delay = 4,
		attack_anim = "attack_staff"
	},
	quick_teleport = {
		teleport_end_anim = "teleport_end",
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start"
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			blackboard.stagger_ignore_anim_cb = true
			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				right = {
					"stagger_left_exp"
				},
				left = {
					"stagger_right_exp"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
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
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			}
		}
	}
}
BreedActions.chaos_tentacle_sorcerer = table.create_copy(BreedActions.chaos_tentacle_sorcerer, action_data)

return
