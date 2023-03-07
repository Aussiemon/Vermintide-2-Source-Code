local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	detection_radius = 50,
	walk_speed = 0.65,
	has_inventory = true,
	perception = "perception_all_seeing_boss",
	not_bot_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	run_speed = 0.65,
	target_selection = "pick_boss_sorcerer_target",
	exchange_order = 1,
	armored_on_no_damage = true,
	boss_staggers = true,
	poison_resistance = 100,
	combat_music_state = "no_boss",
	debug_spawn_category = "Misc",
	bone_lod_level = 0,
	hit_reaction = "dummy",
	wield_inventory_on_spawn = true,
	default_inventory_template = "chaos_exalted_sorcerer_drachenfels",
	hit_effect_template = "HitEffectsDummySorcerer",
	primary_armor_category = 6,
	unit_template = "ai_unit_chaos_dummy_sorcerer",
	hit_mass_count = 8,
	race = "chaos",
	no_autoaim = true,
	death_reaction = "ai_default",
	armor_category = 3,
	far_off_despawn_immunity = true,
	is_of_interest_func = "is_of_interest_boss_sorcerer",
	stagger_immune = true,
	behavior = "dummy_exalted_sorcerer_drachenfels",
	base_unit = "units/beings/enemies/chaos_dummy_sorcerer_boss_drachenfels/chr_chaos_dummy_sorcerer_boss_drachenfels",
	threat_value = 8,
	max_health = {
		1500,
		1500,
		1500,
		1500,
		1500,
		1500,
		1500,
		1500
	},
	stagger_duration = BreedTweaks.stagger_duration.sorcerer,
	hit_mass_counts = {
		8,
		8,
		10,
		12,
		15
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		return stagger_types.none, 0, 0
	end,
	debug_color = {
		255,
		255,
		255,
		255
	},
	hitzone_multiplier_types = {},
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
	}
}
Breeds.chaos_dummy_exalted_sorcerer_drachenfels = table.create_copy(Breeds.chaos_dummy_exalted_sorcerer_drachenfels, breed_data)
local action_data = {
	idle = {
		no_anim = true
	},
	spawn = {
		duration = 3,
		animation = "float_idle_nostaff"
	},
	defensive_seeking_bomb = {
		create_nav_tag_volume = true,
		radius = 2,
		cast_time = 1,
		initial_radius = 1.2,
		nav_tag_volume_layer = "bot_poison_wind",
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		volleys = 1,
		volley_delay = 0.3,
		action_weight = 1,
		aoe_dot_damage_interval = 1,
		considerations = UtilityConsiderations.dummy_defensive_seeking_bomb,
		spell_data = {
			name = "seeking_bomb_missile",
			explosion_template_name = "chaos_slow_bomb_missile_new",
			magic_missile = true,
			magic_missile_speed = 2.5,
			true_flight_template_name = "sorcerer_slow_bomb_missile",
			projectile_unit_name = "units/weapons/projectile/insect_swarm_missile_drachenfels/insect_swarm_missile_drachenfels_01",
			range = 40,
			life_time = 15,
			throw_pos = Vector3Box(),
			target_direction = Vector3Box(),
			projectile_size = {
				3,
				3,
				3
			}
		},
		aoe_init_damage = {
			{
				0,
				1,
				0
			},
			{
				0,
				1,
				0
			},
			{
				5,
				1,
				0
			},
			{
				7,
				1,
				0
			},
			{
				10,
				1,
				0
			},
			{
				15,
				1,
				0
			},
			{
				15,
				1,
				0
			},
			{
				15,
				1,
				0
			}
		},
		aoe_dot_damage = {
			{
				2,
				0,
				0
			},
			{
				4,
				0,
				0
			},
			{
				6,
				0,
				0
			},
			{
				8,
				0,
				0
			},
			{
				15,
				0,
				0
			},
			{
				20,
				0,
				0
			},
			{
				20,
				0,
				0
			},
			{
				20,
				0,
				0
			}
		},
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749
		}
	}
}
BreedActions.chaos_dummy_exalted_sorcerer_drachenfels = table.create_copy(BreedActions.chaos_dummy_exalted_sorcerer_drachenfels, action_data)
