-- chunkname: @scripts/settings/breeds/breed_chaos_dummy_sorcerer.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	armor_category = 3,
	armored_on_no_damage = true,
	base_unit = "units/beings/enemies/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
	behavior = "dummy_sorcerer",
	bone_lod_level = 0,
	boss_staggers = true,
	combat_music_state = "no_boss",
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_sorcerer",
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = true,
	hit_effect_template = "HitEffectsDummySorcerer",
	hit_mass_count = 8,
	hit_reaction = "ai_default",
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_no_seeing",
	poison_resistance = 100,
	primary_armor_category = 6,
	race = "chaos",
	run_speed = 0.65,
	stagger_immune = true,
	target_selection = "pick_no_targets",
	threat_value = 8,
	unit_template = "ai_unit_chaos_dummy_sorcerer",
	walk_speed = 0.65,
	wield_inventory_on_spawn = true,
	infighting = InfightingSettings.none,
	max_health = {
		1500,
		1500,
		1500,
		1500,
		1500,
		1500,
		1500,
		1500,
	},
	stagger_duration = BreedTweaks.stagger_duration.sorcerer,
	hit_mass_counts = {
		8,
		8,
		10,
		12,
		15,
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		return stagger_types.none, 0, 0
	end,
	debug_color = {
		255,
		255,
		255,
		255,
	},
	hitzone_multiplier_types = {},
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
	run_on_spawn = AiBreedSnippets.on_dummy_sorcerer_spawn,
}

Breeds.chaos_dummy_sorcerer = table.create_copy(Breeds.chaos_dummy_sorcerer, breed_data)

local action_data = {
	idle = {
		idle_animation = {
			"attack_cast_spell_loop",
		},
	},
}

BreedActions.chaos_dummy_sorcerer = table.create_copy(BreedActions.chaos_dummy_sorcerer, action_data)
