-- chunkname: @scripts/settings/breeds/breed_training_dummy.lua

local HEALTH_MULTIPLIER = 2
local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_height = 1.5,
	armor_category = 1,
	awards_positive_reinforcement_message = true,
	base_unit = "units/gameplay/training_dummy/training_dummy_bob",
	behavior = "training_dummy",
	bloodlust_health = 0,
	bone_lod_level = 0,
	bot_melee_aim_node = "j_neck",
	cannot_be_aggroed = true,
	death_reaction = "level_object",
	detection_radius = 12,
	disable_local_hit_reactions = true,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	flesh_material = "stone",
	flingable = false,
	has_inventory = false,
	hit_effect = "fx/hit_metal",
	hit_effect_template = "HitEffectsTrainingDummy",
	hit_mass_count = 40,
	hit_reaction = "dummy",
	ignore_breed_limits = true,
	no_blood = true,
	no_blood_splatter_on_damage = true,
	no_stagger_duration = true,
	not_bot_target = true,
	override_bot_target_node = "j_neck",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = 0,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	proximity_system_check = true,
	race = "dummy",
	radius = 1,
	run_speed = 3,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 3.5,
	smart_targeting_outer_width = 0.6,
	smart_targeting_width = 0.2,
	target_head_node = "j_neck",
	target_selection = "pick_closest_target",
	target_selection_alerted = "pick_closest_target_infinte_range",
	threat_value = 0,
	unit_template = "ai_unit_training_dummy_bob",
	vortexable = false,
	weapon_reach = 1,
	infighting = InfightingSettings.small,
	max_health = {
		25 * HEALTH_MULTIPLIER,
		25 * HEALTH_MULTIPLIER,
		37.5 * HEALTH_MULTIPLIER,
		50 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
		75 * HEALTH_MULTIPLIER,
	},
	hit_mass_counts = BreedTweaks.hit_mass_counts.marauder,
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
	debug_color = {
		255,
		100,
		200,
		200,
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
		},
		neck = {
			prio = 1,
			actors = {
				"c_head",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_torso",
			},
			push_actors = {
				"c_spine",
			},
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
			},
		},
		aux = {
			prio = 4,
			actors = {
				"c_base_simple",
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
	modify_extension_init_data = function (breed, extension_init_data, optional_data, position, rotation)
		local data1 = extension_init_data.projectile_locomotion_system or {}

		data1.network_position = extension_init_data.network_position or AiAnimUtils.position_network_scale(position, true)
		data1.network_rotation = extension_init_data.network_rotation or AiAnimUtils.rotation_network_scale(rotation, true)
		data1.network_velocity = extension_init_data.network_velocity or AiAnimUtils.velocity_network_scale(Vector3.zero(), true)
		data1.network_angular_velocity = extension_init_data.network_angular_velocity or AiAnimUtils.velocity_network_scale(Vector3.zero(), true)
		extension_init_data.projectile_locomotion_system = data1

		local data2 = extension_init_data.pickup_system or {}

		data2.has_physics = false
		data2.spawn_type = "debug"
		data2.pickup_name = "training_dummy_bob"
		extension_init_data.pickup_system = data2
	end,
	debug_spawn_optional_data = {
		prepare_func = function (breed, extension_init_data, optional_data, position, rotation)
			breed.modify_extension_init_data(breed, extension_init_data, optional_data, position, rotation)
		end,
	},
}

Breeds.training_dummy = table.create_copy(Breeds.training_dummy, breed_data)

local action_data = {
	dummy_idle = {},
	stagger = {
		stagger_anims = {
			{
				fwd = {
					"stagger_light_bwd",
				},
				bwd = {
					"stagger_light_fwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_light_right",
				},
			},
			{
				fwd = {
					"stagger_light_bwd",
				},
				bwd = {
					"stagger_light_fwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_light_right",
				},
			},
			{
				fwd = {
					"stagger_heavy_bwd",
				},
				bwd = {
					"stagger_heavy_fwd",
				},
				left = {
					"stagger_heavy_left",
				},
				right = {
					"stagger_heavy_right",
				},
			},
			{
				fwd = {
					"stagger_light_bwd",
				},
				bwd = {
					"stagger_light_fwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_light_right",
				},
			},
			{
				fwd = {
					"stagger_heavy_bwd",
				},
				bwd = {
					"stagger_heavy_fwd",
				},
				left = {
					"stagger_heavy_left",
				},
				right = {
					"stagger_heavy_right",
				},
			},
			{
				fwd = {
					"stagger_heavy_bwd",
				},
				bwd = {
					"stagger_heavy_fwd",
				},
				left = {
					"stagger_heavy_left",
				},
				right = {
					"stagger_heavy_right",
				},
			},
			{
				fwd = {
					"stagger_heavy_bwd",
				},
				bwd = {
					"stagger_heavy_fwd",
				},
				left = {
					"stagger_heavy_left",
				},
				right = {
					"stagger_heavy_right",
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
					"stagger_heavy_bwd",
				},
				bwd = {
					"stagger_heavy_fwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_heavy_right",
				},
			},
		},
	},
}

BreedActions.training_dummy = table.create_copy(BreedActions.training_dummy, action_data)
