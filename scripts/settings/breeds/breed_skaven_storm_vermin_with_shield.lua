-- chunkname: @scripts/settings/breeds/breed_skaven_storm_vermin_with_shield.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 6,
	ai_toughness = 5,
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_height = 1.7,
	aoe_radius = 0.4,
	armor_category = 2,
	attack_general_sound_event = "Play_clan_rat_attack_vce",
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	attack_start_slow_factor_time = 0.4,
	attack_start_slow_fraction = 1,
	awards_positive_reinforcement_message = true,
	backstab_player_sound_event = "Play_stormvermin_attack_player_back_vce",
	base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin",
	behavior = "shield_vermin",
	block_stagger_mod = 0.5,
	block_stagger_mod_2 = 0.75,
	block_stamina = 1,
	bone_lod_level = 1,
	bots_should_flank = true,
	death_reaction = "ai_default",
	death_sound_event = "Play_stormvermin_die_vce",
	default_inventory_template = "stormvermin_sword_and_shield",
	detection_radius = 12,
	disable_crowd_dispersion = true,
	disable_local_hit_reactions = false,
	dodge_timer = 0.35,
	elite = true,
	enter_walk_distance = 1.5,
	exchange_order = 3,
	has_inventory = true,
	has_running_attack = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsStormVermin",
	hit_mass_count = 5,
	hit_mass_count_block = 10,
	hit_reaction = "ai_default",
	horde_behavior = "shield_vermin",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	husk_hit_reaction_cooldown = 1,
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	is_bot_threat = true,
	leave_walk_distance = 3.5,
	match_speed_distance = 2,
	no_random_stagger_duration = true,
	no_stagger_damage_reduction = true,
	opt_base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin_baked",
	panic_close_detection_radius_sq = 9,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -4.5,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	race = "skaven",
	radius = 1,
	run_speed = 4.8,
	scale_death_push = 0.8,
	shield_blunt_block_sound = "blunt_hit_shield_metal",
	shield_burning_block_sound = "Play_weapon_fire_torch_metal_shield_hit",
	shield_health = 3,
	shield_slashing_block_sound = "slashing_hit_shield_metal",
	shield_stab_block_sound = "stab_hit_shield_metal",
	shield_user = true,
	slot_template = "skaven_elite",
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.5,
	smart_targeting_outer_width = 1,
	smart_targeting_width = 0.2,
	stagger_resistance = 2.25,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 8,
	unbreakable_shield = true,
	unit_template = "ai_unit_shield_vermin",
	unit_variation_setting_name = "skaven_storm_vermin_with_shield",
	use_backstab_vo = true,
	using_combo = true,
	vortexable = true,
	walk_speed = 2,
	weapon_reach = 2,
	wwise_voice_switch_group = "stormvermin_vce",
	infighting = InfightingSettings.small,
	shield_opening_event = {
		"idle_shield_down",
		"idle_shield_down_2",
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	size_variation_range = {
		1.05,
		1.15,
	},
	max_health = BreedTweaks.max_health.stormvermin_with_shield,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_elite,
	stagger_duration = {
		0.5,
		1,
		2,
		0.4,
		0.5,
		3,
		1,
		1,
	},
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.stormvermin,
	stagger_reduction = BreedTweaks.stagger_reduction.stormvermin,
	hit_mass_counts = BreedTweaks.hit_mass_counts.stormvermin,
	hit_mass_counts_block = BreedTweaks.hit_mass_counts.stormvermin_shield_block,
	wwise_voices = {
		"low",
		"medium",
		"high",
	},
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	debug_color = {
		255,
		200,
		0,
		170,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		walk_animation_merge_options = {},
		move_animation_merge_options = {},
	},
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
				"j_neck",
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
				"j_neck",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips",
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
				"j_leftshoulder",
				"j_leftarm",
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
				"j_rightshoulder",
				"j_rightarm",
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
		tail = {
			prio = 3,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6",
			},
			push_actors = {
				"j_hips",
				"j_taill",
			},
		},
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro",
			},
		},
	},
	hitbox_ragdoll_translation = {
		c_head = "j_head",
		c_hips = "j_hips",
		c_leftarm = "j_leftarm",
		c_leftfoot = "j_leftfoot",
		c_leftforearm = "j_leftforearm",
		c_lefthand = "j_lefthand",
		c_leftleg = "j_leftleg",
		c_lefttoebase = "j_lefttoebase",
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_righttoebase = "j_righttoebase",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_spine2 = "j_spine1",
		c_tail1 = "j_taill",
		c_tail2 = "j_tail2",
		c_tail3 = "j_tail3",
		c_tail4 = "j_tail4",
		c_tail5 = "j_tail5",
		c_tail6 = "j_tail6",
	},
	ragdoll_actor_thickness = {
		j_head = 0.3,
		j_hips = 0.3,
		j_leftarm = 0.2,
		j_leftfoot = 0.2,
		j_leftforearm = 0.2,
		j_lefthand = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_lefttoebase = 0.2,
		j_leftupleg = 0.2,
		j_neck = 0.3,
		j_rightarm = 0.2,
		j_rightfoot = 0.2,
		j_rightforearm = 0.2,
		j_righthand = 0.2,
		j_rightleg = 0.2,
		j_rightshoulder = 0.3,
		j_righttoebase = 0.2,
		j_rightupleg = 0.2,
		j_spine = 0.3,
		j_spine1 = 0.3,
		j_tail2 = 0.05,
		j_tail3 = 0.05,
		j_tail4 = 0.05,
		j_tail5 = 0.05,
		j_tail6 = 0.05,
		j_taill = 0.05,
	},
}
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1,
			sweep = 2,
		},
		normal = {
			normal = 1,
			sweep = 2,
		},
		hard = {
			normal = 1,
			sweep = 2,
		},
		harder = {
			normal = 1,
			sweep = 2,
		},
		hardest = {
			normal = 1,
			sweep = 2,
		},
		cataclysm = {
			normal = 1,
			sweep = 2,
		},
		cataclysm_2 = {
			normal = 1,
			sweep = 2,
		},
		cataclysm_3 = {
			normal = 1,
			sweep = 2,
		},
		versus_base = {
			normal = 1,
			sweep = 2,
		},
	},
	cleave = {
		easy = {
			cleave = 2,
			normal = 1,
		},
		normal = {
			cleave = 2,
			normal = 1,
		},
		hard = {
			cleave = 2,
			normal = 1,
		},
		harder = {
			cleave = 2,
			normal = 1,
		},
		hardest = {
			cleave = 2,
			normal = 1,
		},
		cataclysm = {
			cleave = 2,
			normal = 1,
		},
		cataclysm_2 = {
			cleave = 2,
			normal = 1,
		},
		cataclysm_3 = {
			cleave = 2,
			normal = 1,
		},
		versus_base = {
			cleave = 2,
			normal = 1,
		},
	},
	push = {
		easy = {
			push = 1.5,
		},
		normal = {
			push = 1.5,
		},
		hard = {
			push = 1.5,
		},
		harder = {
			push = 1.5,
		},
		hardest = {
			push = 1.5,
		},
		cataclysm = {
			push = 1.5,
		},
		cataclysm_2 = {
			push = 1.5,
		},
		cataclysm_3 = {
			push = 1.5,
		},
		versus_base = {
			push = 1.5,
		},
	},
	running = {
		easy = {
			running = 2.5,
		},
		normal = {
			running = 2.5,
		},
		hard = {
			running = 2.5,
		},
		harder = {
			running = 2.5,
		},
		hardest = {
			running = 2.5,
		},
		cataclysm = {
			running = 2.5,
		},
		cataclysm_2 = {
			running = 2.5,
		},
		cataclysm_3 = {
			running = 2.5,
		},
		versus_base = {
			running = 2.5,
		},
	},
	frenzy = {
		easy = {
			frenzy = 3.5,
			normal = 1.5,
		},
		normal = {
			frenzy = 3.5,
			normal = 1.5,
		},
		hard = {
			frenzy = 3.5,
			normal = 1.5,
		},
		harder = {
			frenzy = 3.5,
			normal = 1.5,
		},
		hardest = {
			frenzy = 3.5,
			normal = 1.5,
		},
		cataclysm = {
			frenzy = 3.5,
			normal = 1.5,
		},
		cataclysm_2 = {
			frenzy = 3.5,
			normal = 1.5,
		},
		cataclysm_3 = {
			frenzy = 3.5,
			normal = 1.5,
		},
		versus_base = {
			frenzy = 3.5,
			normal = 1.5,
		},
	},
}
local COMBO_ALLOWED_STAGGERS = {
	false,
	false,
	true,
	false,
	true,
	true,
	false,
}

Breeds.skaven_storm_vermin_with_shield = table.create_copy(Breeds.skaven_storm_vermin_with_shield, breed_data)
Breeds.skaven_storm_vermin_with_shield.killfeed_fold_with = "skaven_storm_vermin"

local action_data = {
	alerted = {
		action_weight = 1,
		cooldown = -1,
		no_hesitation = true,
		start_anims_name = {
			bwd = "slam_shield_bwd",
			left = "slam_shield_left",
			right = "slam_shield_right",
			fwd = {
				"slam_shield_fwd",
				"slam_shield_fwd_2",
			},
		},
		start_anims_data = {
			slam_shield_fwd = {},
			slam_shield_fwd_2 = {},
			slam_shield_bwd = {
				dir = -1,
				rad = math.pi,
			},
			slam_shield_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			slam_shield_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	follow = {
		action_weight = 1,
		cooldown = -1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		considerations = UtilityConsiderations.clan_rat_follow,
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_special_attack,
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack,
	},
	special_attack_cleave = {
		attack_anim = "attack_special",
		attack_intensity_type = "cleave",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		cooldown = 1,
		damage = 50,
		damage_type = "cutting",
		height = 3,
		move_anim = "move_fwd",
		offset_forward = 0,
		offset_up = 0,
		range = 3,
		rotation_time = 1,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite,
	},
	special_attack_sweep = {
		attack_intensity_type = "sweep",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		cooldown = 1,
		damage = 40,
		damage_type = "cutting",
		height = 0.1,
		knocked_down_attack_threshold = 0.6,
		move_anim = "move_fwd",
		offset_forward = 0.5,
		offset_up = 1,
		range = 2.2,
		rotation_time = 1,
		width = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2",
		},
		knocked_down_attack_anim = {
			"attack_downed",
			"attack_downed_2",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite,
	},
	push_attack = {
		action_weight = 1,
		attack_anim = "attack_push",
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "blocked_sv_cleave",
		hit_react_type = "medium",
		impact_push_speed = 7,
		max_impact_push_speed = 8,
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_shield_push_attack,
		init_blackboard = {
			wake_up_push = 0,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite,
	},
	push_attack_wake_up = {
		action_weight = 20,
		attack_anim = "attack_push",
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "blocked_sv_cleave",
		hit_react_type = "medium",
		impact_push_speed = 7,
		max_impact_push_speed = 8,
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_shield_push_attack_wake_up,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite,
	},
	attack_riposte = {
		attack_anim = "attack_combo_1",
		attack_intensity_type = "normal",
		cooldown = 1,
		damage = 0,
		damage_type = "cutting",
		fatigue_type = "blocked_attack",
		height = 0,
		move_anim = "move_fwd",
		range = 2,
		width = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite,
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_elite,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_storm_vermin_with_shield dont have ai_shield_user_extension")

			local breed = blackboard.breed
			local current_health = blackboard.current_health_percent
			local blocked = blackboard.blocked
			local stagger = blackboard.stagger
			local stagger_type = blackboard.stagger_type
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local shield_user = not ai_shield_extension.shield_broken
			local is_blocking = ai_shield_extension.is_blocking
			local blocked_previous_attack = ai_shield_extension.blocked_previous_attack
			local block_count = 3

			if current_health <= 0.5 then
				block_count = 2
			end

			local stagger_anims, idle_event

			if shield_user and stagger then
				if not blocked and stagger <= block_count and action.shield_block_anims and blocked_previous_attack and blackboard.stagger_type ~= stagger_types.explosion then
					blackboard.stagger_time = blackboard.stagger_time + math.max(0.5, stagger / block_count) * breed.block_stagger_mod
					stagger_anims = action.shield_block_anims[stagger_type]

					ai_shield_extension:set_is_blocking(true)

					idle_event = "idle_shield_up"
				elseif not blocked and is_blocking and stagger == block_count and action.shield_stagger_anims then
					blackboard.stagger_time = blackboard.stagger_time + stagger / block_count * breed.block_stagger_mod_2

					local index = Math.random(1, 2)
					local anim_table = {
						"idle_shield_down",
						"idle_shield_down_2",
					}

					idle_event = anim_table[index]

					ai_shield_extension:set_is_blocking(false)

					blackboard.wake_up_push = math.huge
					stagger_anims = action.shield_stagger_anims[stagger_type]
				elseif stagger > block_count + 5 and action.shield_block_anims then
					blackboard.stagger_time = 0
					blackboard.stagger = 0

					ai_shield_extension:set_is_blocking(true)

					stagger_anims = action.shield_block_anims[stagger_type]
					blackboard.stagger_time = 0.2
					idle_event = "idle_shield_up"
				else
					stagger_anims = action.stagger_anims[stagger_type]
					blackboard.stagger_time = blackboard.stagger_time + stagger / block_count * breed.block_stagger_mod_2

					local index = Math.random(1, 2)
					local anim_table = {
						"idle_shield_down",
						"idle_shield_down_2",
					}

					idle_event = anim_table[index]

					ai_shield_extension:set_is_blocking(false)
				end
			else
				stagger_anims = action.stagger_anims[stagger_type]
				idle_event = "idle_shield_down"
			end

			return stagger_anims, idle_event, idle_event
		end,
		custom_exit_function = function (unit, blackboard, t)
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

			ai_shield_extension:set_is_blocking(true)
		end,
		shield_stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
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
					"stagger_bwd_shield",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
		},
		shield_block_anims = {
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_up_light",
					"stagger_bwd_shield_up_light_2",
				},
				left = {
					"stagger_left_shield_up_light",
				},
				right = {
					"stagger_right_shield_up_light",
				},
				dwn = {
					"stagger_bwd_shield_up_light_head",
					"stagger_bwd_shield_up_light_head_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_up_light",
				},
				left = {
					"stagger_left_shield_up_light",
				},
				right = {
					"stagger_right_shield_up_light",
				},
				dwn = {
					"stagger_bwd_shield_up_light",
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
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
		},
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_open",
				},
				bwd = {
					"stun_bwd_open",
				},
				left = {
					"stun_left_open",
				},
				right = {
					"stun_right_open",
				},
				dwn = {
					"stun_bwd_open",
				},
			},
			{
				fwd = {
					"stagger_fwd_open",
				},
				bwd = {
					"stagger_bwd_open",
				},
				left = {
					"stagger_left_open",
				},
				right = {
					"stagger_right_open",
				},
				dwn = {
					"stagger_bwd_open",
				},
			},
			{
				fwd = {
					"stagger_fwd_open",
				},
				bwd = {
					"stagger_bwd_open",
				},
				left = {
					"stagger_left_open",
				},
				right = {
					"stagger_right_open",
				},
			},
			{
				fwd = {
					"stun_fwd_open",
				},
				bwd = {
					"stun_bwd_open",
				},
				left = {
					"stun_left_open",
				},
				right = {
					"stun_right_open",
				},
			},
			{
				fwd = {
					"stagger_fwd_open",
				},
				bwd = {
					"stagger_bwd_open",
				},
				left = {
					"stagger_left_open",
				},
				right = {
					"stagger_right_open",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_exp",
				},
				left = {
					"stagger_left_exp",
				},
				right = {
					"stagger_right_exp",
				},
			},
			{
				fwd = {
					"stagger_fwd_open",
				},
				bwd = {
					"stagger_bwd_open",
				},
				left = {
					"stagger_left_open",
				},
				right = {
					"stagger_right_open",
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
					"stagger_fwd_open",
				},
				bwd = {
					"stagger_bwd_open",
				},
				left = {
					"stagger_left_open",
				},
				right = {
					"stagger_right_open",
				},
			},
		},
	},
}
local frenzy_attack = {
	action_weight = 10,
	attack_anim = "attack_pounce",
	attack_intensity_type = "frenzy",
	combo_anim_variations = 1,
	cooldown = 10,
	damage = 20,
	damage_type = "cutting_berserker",
	fatigue_type = "blocked_attack",
	move_anim = "move_fwd",
	moving_attack = true,
	num_attacks = 4,
	player_push_speed = 4,
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	considerations = UtilityConsiderations.storm_vermin_shield_combo_attack,
	init_blackboard = {
		time_since_last_combo = math.huge,
	},
	difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded_frenzy,
	combo_attacks = {
		attack_2 = {
			anim = "attack_combo_2",
			bot_threat_duration = 0.2,
			fatigue_type = "blocked_berzerker",
			is_animation_driven = false,
			move_anim = "attack_combo_2",
			next = "attack_3",
			next_blocked = "attack_3",
			next_hit = "attack_3",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			staggers_allowed = COMBO_ALLOWED_STAGGERS,
		},
		attack_3 = {
			anim = "attack_combo_3",
			bot_threat_duration = 0.2,
			fatigue_type = "blocked_sv_sweep",
			is_animation_driven = false,
			move_anim = "attack_combo_3",
			next = "attack_4",
			next_blocked = "attack_4",
			next_hit = "attack_4",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			staggers_allowed = COMBO_ALLOWED_STAGGERS,
		},
		attack_4 = {
			allow_push_stagger = true,
			anim = "attack_combo_4",
			bot_threat_duration = 0.2,
			damage_done_time = 1.1,
			fatigue_type = "blocked_berzerker",
			is_animation_driven = false,
			move_anim = "attack_combo_4",
			next = "done",
			rotation_scheme = "continuous",
			run_speed = 1.5,
			staggers_allowed = COMBO_ALLOWED_STAGGERS,
		},
	},
	target_type_exceptions = {
		poison_well = {
			attack_anim = "poison_well",
		},
	},
}

action_data.frenzy_attack = table.create_copy(action_data.frenzy_attack, frenzy_attack)
action_data.frenzy_attack.considerations = UtilityConsiderations.storm_vermin_shield_combo_attack
action_data.frenzy_attack.combo_attacks.attack_1 = {
	anim = "attack_combo_1",
	attack_intensity_type = "frenzy",
	bot_threat_duration = 0.2,
	combo_cooldown_start = true,
	fatigue_type = "blocked_berzerker",
	is_animation_driven = false,
	move_anim = "attack_combo_1",
	next = "attack_2",
	next_blocked = "attack_2",
	next_hit = "attack_2",
	no_abort_attack = true,
	rotation_scheme = "continuous",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = COMBO_ALLOWED_STAGGERS,
}
action_data.frenzy_attack_ranged = table.create_copy(action_data.frenzy_attack_ranged, frenzy_attack)
action_data.frenzy_attack_ranged.considerations = UtilityConsiderations.storm_vermin_shield_combo_attack
action_data.frenzy_attack_ranged.combo_attacks.attack_1 = {
	anim = "attack_combo_1",
	attack_intensity_type = "frenzy",
	bot_threat_duration = 0.2,
	combo_cooldown_start = true,
	fatigue_type = "blocked_berzerker",
	is_animation_driven = false,
	next = "attack_2",
	next_blocked = "attack_2",
	next_hit = "attack_2",
	no_abort_attack = true,
	rotation_scheme = "continuous",
	run_speed = 3,
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = COMBO_ALLOWED_STAGGERS,
}
BreedActions.skaven_storm_vermin_with_shield = table.create_copy(BreedActions.skaven_storm_vermin_with_shield, action_data)
