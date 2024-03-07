-- chunkname: @scripts/settings/breeds/breed_chaos_tentacle_sorcerer.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	aoe_height = 2.1,
	aoe_radius = 0.7,
	armor_category = 5,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_sorcerer_tentacle/chr_chaos_sorcerer_tentacle",
	behavior = "chaos_tentacle_sorcerer",
	bone_lod_level = 1,
	bot_hitbox_radius_approximation = 0.8,
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_sorcerer",
	detection_radius = 9999999,
	dialogue_source_name = "chaos_tentacle_sorcerer",
	disable_second_hit_ragdoll = true,
	exchange_order = 2,
	flingable = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	height = 2.4,
	hit_effect_template = "HitEffectsChaosSorcerer",
	hit_mass_count = 8,
	hit_reaction = "ai_default",
	initial_is_passive = false,
	is_bot_aid_threat = true,
	minion_detection_radius = 10,
	perception = "perception_all_seeing",
	perception_continuous = "perception_continuous_keep_target",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 1,
	run_speed = 0.65,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.2,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	special = true,
	target_selection = "pick_closest_target",
	threat_value = 20,
	unit_template = "ai_unit_chaos_tentacle_sorcerer",
	vortexable = false,
	walk_speed = 0.65,
	wield_inventory_on_spawn = true,
	infighting = InfightingSettings.small,
	max_health = {
		14,
		16,
		20,
		24,
		35,
		35,
		35,
		35,
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
		1,
	},
	hit_mass_counts = BreedTweaks.hit_mass_counts.sorcerer,
	debug_color = {
		255,
		200,
		200,
		0,
	},
	disabled = Development.setting("disable_tentacle_sorcerer") or false,
	run_on_spawn = AiBreedSnippets.on_chaos_tentacle_sorcerer_spawn,
	hitzone_multiplier_types = {
		head = "headshot",
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_leftshoulder",
				"c_rightshoulder",
			},
			push_actors = {
				"j_spine1",
			},
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
			},
			push_actors = {
				"j_spine1",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
			},
			push_actors = {
				"j_spine1",
			},
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"h_afro",
			},
		},
	},
	allowed_layers = {
		bot_poison_wind = 2,
		bot_ratling_gun_fire = 10,
		destructible_wall = 5,
		doors = 1.5,
		fire_grenade = 10,
		jumps = 5,
		ledges = 5,
		ledges_with_fence = 5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
}

Breeds.chaos_tentacle_sorcerer = table.create_copy(Breeds.chaos_tentacle_sorcerer, breed_data)

local action_data = {
	skulk_approach = {
		close_distance = 7,
		far_away_from_target_sq = 400,
		move_animation = "move_fwd",
		part_hp_lost_to_teleport = 0.1,
		preferred_distance = 10,
		search_func_name = "update_portal_search",
		sorcerer_type = "tentacle",
		teleport_cooldown = {
			7,
			10,
		},
	},
	spawn_portal = {
		attack_anim = "attack_staff",
		spawn_func_name = "spawn_portal",
		tentacle_spawn_delay = 4,
	},
	quick_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		teleport_start_anim = "teleport_start",
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
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_exp",
				},
				right = {
					"stagger_left_exp",
				},
				left = {
					"stagger_right_exp",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
		},
	},
}

BreedActions.chaos_tentacle_sorcerer = table.create_copy(BreedActions.chaos_tentacle_sorcerer, action_data)
