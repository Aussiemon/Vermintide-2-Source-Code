-- chunkname: @scripts/settings/breeds/breed_chaos_dummy_exalted_sorcerer_drachenfels.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	armor_category = 3,
	armored_on_no_damage = true,
	base_unit = "units/beings/enemies/chaos_dummy_sorcerer_boss_drachenfels/chr_chaos_dummy_sorcerer_boss_drachenfels",
	behavior = "dummy_exalted_sorcerer_drachenfels",
	bone_lod_level = 0,
	boss_staggers = true,
	combat_music_state = "no_boss",
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_exalted_sorcerer_drachenfels",
	detection_radius = 50,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = true,
	hit_effect_template = "HitEffectsDummySorcerer",
	hit_mass_count = 8,
	hit_reaction = "dummy",
	is_of_interest_func = "is_of_interest_boss_sorcerer",
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_all_seeing_boss",
	poison_resistance = 100,
	primary_armor_category = 6,
	race = "chaos",
	run_speed = 0.65,
	stagger_immune = true,
	target_selection = "pick_boss_sorcerer_target",
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
}

Breeds.chaos_dummy_exalted_sorcerer_drachenfels = table.create_copy(Breeds.chaos_dummy_exalted_sorcerer_drachenfels, breed_data)

local action_data = {
	idle = {
		no_anim = true,
	},
	spawn = {
		animation = "float_idle_nostaff",
		duration = 3,
	},
	defensive_seeking_bomb = {
		action_weight = 1,
		cast_time = 1,
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		volleys = 1,
		considerations = UtilityConsiderations.dummy_defensive_seeking_bomb,
		spell_data = {
			explosion_template_name = "chaos_slow_bomb_missile_new",
			life_time = 15,
			magic_missile = true,
			magic_missile_speed = 2.5,
			name = "seeking_bomb_missile",
			projectile_unit_name = "units/weapons/projectile/insect_swarm_missile_drachenfels/insect_swarm_missile_drachenfels_01",
			range = 40,
			true_flight_template_name = "sorcerer_slow_bomb_missile",
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
			projectile_size = {
				3,
				3,
				3,
			},
		},
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
	},
}

BreedActions.chaos_dummy_exalted_sorcerer_drachenfels = table.create_copy(BreedActions.chaos_dummy_exalted_sorcerer_drachenfels, action_data)
