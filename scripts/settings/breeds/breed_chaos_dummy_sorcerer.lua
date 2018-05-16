local breed_data = {
	boss_staggers = true,
	perception = "perception_no_seeing",
	has_inventory = true,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	walk_speed = 0.65,
	run_speed = 0.65,
	target_selection = "pick_no_targets",
	death_reaction = "ai_default",
	not_bot_target = true,
	armored_on_no_damage = true,
	exchange_order = 1,
	combat_music_state = "no_boss",
	debug_spawn_category = "Misc",
	bone_lod_level = 0,
	hit_reaction = "ai_default",
	wield_inventory_on_spawn = true,
	default_inventory_template = "chaos_sorcerer",
	hit_effect_template = "HitEffectsDummySorcerer",
	primary_armor_category = 6,
	unit_template = "ai_unit_chaos_dummy_sorcerer",
	hit_mass_count = 8,
	race = "chaos",
	no_autoaim = true,
	poison_resistance = 100,
	armor_category = 3,
	far_off_despawn_immunity = true,
	stagger_immune = true,
	behavior = "dummy_sorcerer",
	base_unit = "units/beings/enemies/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
	threat_value = 8,
	max_health = {
		1500,
		1500,
		1500,
		1500,
		1500
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
	hit_mass_counts = {
		8,
		8,
		10,
		12,
		15
	},
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed)
		return 0, 0, 0
	end,
	debug_color = {
		255,
		255,
		255,
		255
	},
	hitzone_multiplier_types = {},
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
			prio = 3,
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
			prio = 4,
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
			prio = 4,
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
		afro = {
			prio = 5,
			actors = {
				"h_afro"
			}
		}
	},
	run_on_spawn = AiBreedSnippets.on_dummy_sorcerer_spawn
}
Breeds.chaos_dummy_sorcerer = table.create_copy(Breeds.chaos_dummy_sorcerer, breed_data)
local action_data = {
	idle = {
		idle_animation = {
			"attack_cast_spell_loop"
		}
	}
}
BreedActions.chaos_dummy_sorcerer = table.create_copy(BreedActions.chaos_dummy_sorcerer, action_data)

return
