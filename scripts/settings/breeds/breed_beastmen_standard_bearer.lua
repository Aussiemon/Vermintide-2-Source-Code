local breed_data = {
	detection_radius = 60,
	proximity_system_check = true,
	walk_speed = 2.75,
	leave_walk_distance = 4.5,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	animation_sync_rpc = "rpc_sync_anim_state_5",
	exchange_order = 3,
	animation_movement_template = "beastmen_bestigor",
	armored_on_no_damage = true,
	aoe_radius = 0.4,
	is_always_spawnable = true,
	disable_crowd_dispersion = true,
	defensive_threshold_distance = 7,
	ai_strength = 3,
	target_selection = "pick_closest_target",
	death_reaction = "ai_default",
	line_of_sight_distance_sq = 1600,
	slot_template = "beastmen_elite",
	no_stagger_duration = false,
	wield_inventory_on_spawn = false,
	attack_general_sound_event = "play_enemy_standard_bearer_attack_husk_vce",
	default_inventory_template = "beastmen_standard_bearer_dual_setup",
	stagger_resistance = 2.25,
	patrol_detection_radius = 10,
	is_bot_threat = true,
	flingable = true,
	primary_armor_category = 6,
	panic_close_detection_radius_sq = 9,
	radius = 1,
	wwise_voice_switch_group = "beastmen_standard_bearer_vce",
	hit_mass_count = 5,
	patrol_active_perception = "perception_regular",
	attack_player_sound_event = "play_enemy_standard_bearer_attack_vce",
	perception_previous_attacker_stickyness_value = 0,
	race = "beastmen",
	scale_death_push = 1,
	poison_resistance = 100,
	armor_category = 2,
	push_sound_event = "Play_generic_pushed_impact_large",
	dialogue_source_name = "beastmen_standard_bearer",
	backstab_player_sound_event = "Play_enemy_standard_bearer_attack_player_back_vce",
	death_sound_event = "Play_standard_bearer_die_vce",
	uses_attack_sfx_callback = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	awards_positive_reinforcement_message = true,
	bone_lod_level = 1,
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "standard_bearer",
	bots_should_flank = true,
	aoe_height = 1.7,
	has_inventory = true,
	threat_value = 8,
	run_speed = 4.8,
	follow_reach = 1,
	smart_object_template = "special",
	ai_toughness = 5,
	stagger_threshold_light = 0.5,
	hit_reaction = "ai_default",
	passive_in_patrol = true,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	special = true,
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVermin",
	smart_targeting_height_multiplier = 2.5,
	horde_behavior = "standard_bearer",
	unit_template = "ai_unit_beastmen_bestigor",
	has_running_attack = true,
	perception = "perception_standard_bearer",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	pickup_standard_distance = 20,
	base_unit = "units/beings/enemies/beastmen_standard_bearer/chr_beastmen_standard_bearer",
	enter_walk_distance = 2.5,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 2,
		target_stickyness_duration_b = 10,
		aggro_decay_per_sec = 1,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		target_targeted_by_other_charge = 0.2,
		target_is_charged = 0.2,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 100,
		target_disabled_mul = 0.15
	},
	infighting = InfightingSettings.small,
	size_variation_range = {
		1.3,
		1.3
	},
	max_health = BreedTweaks.max_health.standard_bearer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.gor,
	stagger_reduction = BreedTweaks.stagger_reduction.bestigor,
	bloodlust_health = BreedTweaks.bloodlust_health.beastmen_elite,
	stagger_duration = BreedTweaks.stagger_duration.bestigor,
	hit_mass_counts = BreedTweaks.hit_mass_counts.bestigor,
	wwise_voices = {
		"standard_bearer_vce_profile_a",
		"standard_bearer_vce_profile_b",
		"standard_bearer_vce_profile_c"
	},
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire
		})
	},
	debug_color = {
		255,
		200,
		0,
		170
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		walk_animation_merge_options = {},
		move_animation_merge_options = {}
	},
	run_on_spawn = AiBreedSnippets.on_beastmen_standard_bearer_spawn,
	run_on_husk_spawn = AiBreedSnippets.on_beastmen_standard_bearer_husk_spawn,
	run_on_death = AiBreedSnippets.on_beastmen_standard_bearer_death,
	run_on_despawn = AiBreedSnippets.on_beastmen_standard_bearer_death,
	run_on_update = AiBreedSnippets.on_beastmen_standard_bearer_update,
	hitzone_armor_categories = {
		head = {
			attack = 5,
			impact = 2
		},
		neck = {
			attack = 5,
			impact = 2
		}
	},
	hitzone_multiplier_types = {
		head = "headshot",
		neck = "headshot"
	},
	hitzone_primary_armor_categories = {
		head = 5,
		neck = 5
	},
	hit_zones = {
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
			prio = 2,
			actors = {
				"c_spine1",
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
			prio = 3,
			actors = {
				"c_leftshoulder",
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
			prio = 3,
			actors = {
				"c_rightshoulder",
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
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot"
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
				"c_rightfoot"
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
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_leftshoulder = "j_leftshoulder",
		c_rightshoulder = "j_rightshoulder",
		c_rightfoot = "j_rightfoot",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_rightforearm = "j_rightforearm",
		c_leftleg = "j_leftleg",
		c_righthand = "j_righthand",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_spine1 = "j_spine1",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_spine1 = 0.3,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	},
	additional_breed_packages_to_load = function (difficulty)
		local spawn_list = BreedTweaks.standard_bearer_spawn_list[difficulty]
		local additional_breeds = {}

		if spawn_list and #spawn_list > 0 then
			for i = 1, #spawn_list do
				additional_breeds[#additional_breeds + 1] = spawn_list[i]
			end
		end

		return additional_breeds
	end
}
Breeds.beastmen_standard_bearer = table.create_copy(Breeds.beastmen_standard_bearer, breed_data)
local breed_data_crater = {
	dialogue_source_name = "beastmen_standard_bearer_crater",
	debug_spawn_category = "Misc"
}

for key, value in pairs(breed_data) do
	local keep_value = breed_data_crater[key]

	if keep_value == "SET_TO_NIL" then
		breed_data_crater[key] = nil
	elseif keep_value ~= nil then
		breed_data_crater[key] = keep_value
	else
		breed_data_crater[key] = value
	end
end

Breeds.beastmen_standard_bearer_crater = table.create_copy(Breeds.beastmen_standard_bearer_crater, breed_data_crater)
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1.5,
			sweep = 3
		},
		normal = {
			normal = 1.5,
			sweep = 3
		},
		hard = {
			normal = 1.5,
			sweep = 3
		},
		harder = {
			normal = 1.5,
			sweep = 3
		},
		hardest = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm_2 = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm_3 = {
			normal = 1.5,
			sweep = 3
		}
	},
	cleave = {
		easy = {
			cleave = 3,
			normal = 1.5
		},
		normal = {
			cleave = 3,
			normal = 1.5
		},
		hard = {
			cleave = 3,
			normal = 1.5
		},
		harder = {
			cleave = 3,
			normal = 1.5
		},
		hardest = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm_2 = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm_3 = {
			cleave = 3,
			normal = 1.5
		}
	},
	push = {
		easy = {
			push = 1.5
		},
		normal = {
			push = 1.5
		},
		hard = {
			push = 1.5
		},
		harder = {
			push = 1.5
		},
		hardest = {
			push = 1.5
		},
		cataclysm = {
			push = 1.5
		},
		cataclysm_2 = {
			push = 1.5
		},
		cataclysm_3 = {
			push = 1.5
		}
	},
	running = {
		easy = {
			running = 3.5
		},
		normal = {
			running = 3.5
		},
		hard = {
			running = 3.5
		},
		harder = {
			running = 3.5
		},
		hardest = {
			running = 3.5
		},
		cataclysm = {
			running = 3.5
		},
		cataclysm_2 = {
			running = 3.5
		},
		cataclysm_3 = {
			running = 3.5
		}
	}
}
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "alerted_bwd",
			fwd = "alerted_fwd",
			left = "alerted_left",
			right = "alerted_right"
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	follow = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	place_standard_follow = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.place_standard_follow
	},
	switch_weapons = {
		switch_animation = "to_combat"
	},
	place_standard = {
		place_standard_animation = "place_standard",
		standard_health = 10,
		standard_template_name = "healing_standard",
		stop_chanting_sound_event = "Stop_enemy_beastmen_standar_chanting_loop",
		action_weight = 1,
		considerations = UtilityConsiderations.beastmen_place_standard
	},
	place_standard_stagger_immune = {
		place_standard_animation = "place_standard",
		standard_health = 10,
		standard_template_name = "healing_standard",
		stop_chanting_sound_event = "Stop_enemy_beastmen_standar_chanting_loop",
		action_weight = 1,
		considerations = UtilityConsiderations.beastmen_place_standard,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	pick_up_standard = {
		action_weight = 1,
		chanting_sound_event = "Play_enemy_beastmen_standar_chanting_loop",
		pick_up_standard_animation = "pick_up_standard"
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_special_attack
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack
	},
	special_attack_cleave = {
		height = 3,
		offset_forward = 0,
		fatigue_type = "blocked_sv_cleave",
		offset_up = 0,
		cooldown = 1,
		rotation_time = 1,
		hit_react_type = "heavy",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		attack_anim = "attack_special",
		range = 3,
		damage = 20,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "cleave",
		move_anim = "move_fwd",
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	special_attack_sweep = {
		hit_react_type = "medium",
		height = 0.1,
		offset_forward = 0.5,
		offset_up = 1,
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "blocked_sv_sweep",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		range = 2.2,
		damage = 20,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "sweep",
		move_anim = "move_fwd",
		width = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2"
		},
		step_attack_anim = {
			"attack_move",
			"attack_move_2"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	push_attack = {
		impact_push_speed = 7,
		damage = 0,
		max_impact_push_speed = 8,
		fatigue_type = "sv_push",
		hit_react_type = "heavy",
		attack_intensity_type = "push",
		action_weight = 1,
		damage_type = "blunt",
		unblockable = true,
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_push_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		hit_react_type = "medium",
		name = "smash_door",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = "attack_pounce"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		},
		difficulty_duration = BreedTweaks.blocked_duration.beastmen_elite
	}
}
action_data.stagger = {
	custom_enter_function = function (unit, blackboard, t, action)
		local charge_stagger = blackboard.charge_stagger
		local stagger_anims, override_rotation = nil

		if charge_stagger then
			stagger_anims = action.charge_stagger_anims[blackboard.stagger_type]
			blackboard.charge_stagger = nil
			local impact_dir = blackboard.stagger_direction:unbox()
			local new_impact_dir = Quaternion.forward(Unit.local_rotation(unit, 0)) + Vector3.flat(impact_dir) * 0.5

			blackboard.stagger_direction:store(Vector3.normalize(new_impact_dir))

			override_rotation = Quaternion.look(Vector3.normalize(new_impact_dir))
		else
			stagger_anims = action.stagger_anims[blackboard.stagger_type]
		end

		return stagger_anims, "idle", nil, override_rotation
	end,
	stagger_anims = {
		{
			fwd = {
				"stun_fwd_sword",
				"stun_fwd_sword_2"
			},
			bwd = {
				"stun_bwd_sword",
				"stun_bwd_sword_2",
				"stun_bwd_sword_3"
			},
			left = {
				"stun_left_sword",
				"stun_left_sword_2"
			},
			right = {
				"stun_right_sword",
				"stun_right_sword_2",
				"stun_right_sword_3"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left"
			},
			right = {
				"stagger_right"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left_heavy",
				"stagger_left_heavy_2",
				"stagger_left_heavy_3"
			},
			right = {
				"stagger_right_heavy_3"
			}
		},
		{
			fwd = {
				"stun_ranged_fwd"
			},
			bwd = {
				"stun_ranged_bwd"
			},
			left = {
				"stun_ranged_left"
			},
			right = {
				"stun_ranged_right"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd_stab"
			},
			left = {
				"stagger_left"
			},
			right = {
				"stagger_right"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_exp"
			},
			left = {
				"stagger_left_exp"
			},
			right = {
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
			left = {
				"stagger_left"
			},
			right = {
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
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left"
			},
			right = {
				"stagger_right"
			}
		}
	},
	charge_stagger_anims = {
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
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
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_charge"
			},
			left = {
				"stagger_left_charge"
			},
			right = {
				"stagger_right_charge"
			}
		}
	}
}
BreedActions.beastmen_standard_bearer = table.create_copy(BreedActions.beastmen_standard_bearer, action_data)
