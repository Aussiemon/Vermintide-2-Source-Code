-- chunkname: @scripts/settings/breeds/breed_players_vs.lua

require("scripts/settings/breeds")

local vs_gutter_runner = table.clone(Breeds.skaven_gutter_runner)

vs_gutter_runner.animation_sync_rpc = "rpc_sync_anim_state_5"
vs_gutter_runner.cannot_be_aggroed = true
vs_gutter_runner.parent_breed_name = "skaven_gutter_runner"
vs_gutter_runner.poison_resistance = 100
vs_gutter_runner.starting_animation = "to_gutter_runner"
vs_gutter_runner.climb_type = "climb"
vs_gutter_runner.keep_weapon_on_death = true
vs_gutter_runner.movement_speed = 5
vs_gutter_runner.run_threshold = 4
vs_gutter_runner.pounce_prime_time = 1
vs_gutter_runner.pounce_speed = 25
vs_gutter_runner.pounce_upwards_amount = 0.15
vs_gutter_runner.pounce_start_forward_offset = 0.3
vs_gutter_runner.pounce_start_up_offset = 0.3
vs_gutter_runner.pounce_gravity = 10
vs_gutter_runner.pounce_look_sense = 0.8
vs_gutter_runner.pounce_hit_radius = 1.1
vs_gutter_runner.pounce_max_damage_time = 3
vs_gutter_runner.min_pounce_damage = 10
vs_gutter_runner.max_pounce_damage = 24
vs_gutter_runner.foff_explosion_template = "gutter_runner_foff"
vs_gutter_runner.foff_enter_anim_time = 0.32
vs_gutter_runner.time_before_ramping_damage = 1.5
vs_gutter_runner.time_to_reach_max_damage = 3
vs_gutter_runner.base_damage = 2.5
vs_gutter_runner.final_damage_multiplier = 4
vs_gutter_runner.stagger_duration = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
}
vs_gutter_runner.stagger_resistance = 2
vs_gutter_runner.stagger_resistance_ranged = 6
vs_gutter_runner.stagger_threshold_light = 1
vs_gutter_runner.stagger_threshold_medium = 2
vs_gutter_runner.stagger_threshold_heavy = 2.5
vs_gutter_runner.stagger_threshold_explosion = 3

local vs_packmaster = table.clone(Breeds.skaven_pack_master)

vs_packmaster.animation_sync_rpc = "rpc_sync_anim_state_7"
vs_packmaster.cannot_be_aggroed = true
vs_packmaster.parent_breed_name = "skaven_pack_master"
vs_packmaster.dragging_hit_zone_name = "full"
vs_packmaster.dragging_damage_type = "cutting"
vs_packmaster.starting_animation = "to_packmaster"
vs_packmaster.climb_type = "climb"
vs_packmaster.poison_resistance = 100
vs_packmaster.keep_weapon_on_death = false
vs_packmaster.movement_speed = 5
vs_packmaster.run_threshold = 4
vs_packmaster.strafe_speed_multiplier = 0.5
vs_packmaster.grab_movement_speed = 3.5
vs_packmaster.grab_hook_range = 4.5
vs_packmaster.grab_hook_cone_dot = 0.9
vs_packmaster.grab_anim_time = 0.55
vs_packmaster.grab_grace_period = {
	after = 0.5,
	before = 0.2,
}
vs_packmaster.grab_look_sense = 1
vs_packmaster.initial_drag_movement_speed = 6
vs_packmaster.initial_drag_movement_speed_duration = 1.5
vs_packmaster.drag_movement_speed = 3
vs_packmaster.equip_hook_weapon_spawn_time = 0.3333333333333333
vs_packmaster.equip_hook_exit_state_time = 0.6666666666666666
vs_packmaster.dragging_time_to_damage = 1
vs_packmaster.dragging_damage_amount = 2
vs_packmaster.stagger_duration = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
}
vs_packmaster.stagger_resistance = 100
vs_packmaster.stagger_resistance_ranged = 100
vs_packmaster.stagger_threshold_light = 1
vs_packmaster.stagger_threshold_medium = 2
vs_packmaster.stagger_threshold_heavy = 2.5
vs_packmaster.stagger_threshold_explosion = 3

local vs_poison_wind_globadier = table.clone(Breeds.skaven_poison_wind_globadier)

vs_poison_wind_globadier.animation_sync_rpc = "rpc_sync_anim_state_5"
vs_poison_wind_globadier.cannot_be_aggroed = true
vs_poison_wind_globadier.parent_breed_name = "skaven_poison_wind_globadier"
vs_poison_wind_globadier.poison_resistance = 100
vs_poison_wind_globadier.keep_weapon_on_death = true
vs_poison_wind_globadier.starting_animation = "to_globadier"
vs_poison_wind_globadier.climb_type = "climb"
vs_poison_wind_globadier.movement_speed = 4
vs_poison_wind_globadier.wind_up_movement_speed = 2
vs_poison_wind_globadier.run_threshold = 5
vs_poison_wind_globadier.globe_throw_prime_time = 0.65
vs_poison_wind_globadier.globe_throw_spawn_globe_time = 0.14
vs_poison_wind_globadier.globe_throw_finish_time = 0.5
vs_poison_wind_globadier.globe_throw_speed = 1600
vs_poison_wind_globadier.globe_throw_look_sense = 1
vs_poison_wind_globadier.globe_throw_aoe_radius = 5
vs_poison_wind_globadier.globe_throw_initial_radius = 5
vs_poison_wind_globadier.globe_throw_aoe_life_time = 6
vs_poison_wind_globadier.globe_throw_upwards_amount = 0.2
vs_poison_wind_globadier.globe_throw_impact_difficulty_damage = {
	1,
	1,
	1,
	1,
	1,
}
vs_poison_wind_globadier.globe_throw_dot_difficulty_damage = {
	9,
	9,
	9,
	9,
	9,
}
vs_poison_wind_globadier.globe_throw_dot_damage_interval = 1
vs_poison_wind_globadier.stagger_duration = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
}
vs_poison_wind_globadier.stagger_resistance = 100
vs_poison_wind_globadier.stagger_resistance_ranged = 500
vs_poison_wind_globadier.stagger_threshold_light = 1
vs_poison_wind_globadier.stagger_threshold_medium = 2
vs_poison_wind_globadier.stagger_threshold_heavy = 2.5
vs_poison_wind_globadier.stagger_threshold_explosion = 3

local vs_ratling_gunner = table.clone(Breeds.skaven_ratling_gunner)

vs_ratling_gunner.animation_sync_rpc = "rpc_sync_anim_state_6"
vs_ratling_gunner.base_unit = "units/beings/player/dark_pact_third_person_base/skaven_ratlinggunner"
vs_ratling_gunner.cannot_be_aggroed = true
vs_ratling_gunner.parent_breed_name = "skaven_ratling_gunner"
vs_ratling_gunner.poison_resistance = 100
vs_ratling_gunner.keep_weapon_on_death = false
vs_ratling_gunner.starting_animation = "to_ratling_gunner"
vs_ratling_gunner.climb_type = "climb"
vs_ratling_gunner.death_sound_event = "Play_player_ratling_gunner_dead"
vs_ratling_gunner.radius = 1
vs_ratling_gunner.aoe_height = 1.5
vs_ratling_gunner.size_variation_range = {
	1.1,
	1.1,
}
vs_ratling_gunner.player_locomotion_constrain_radius = 0.7
vs_ratling_gunner.weapon_reach = 2
vs_ratling_gunner.smart_targeting_width = 0.3
vs_ratling_gunner.smart_targeting_height_multiplier = 2.1
vs_ratling_gunner.smart_targeting_outer_width = 0.7
vs_ratling_gunner.movement_speed = 3.5
vs_ratling_gunner.run_threshold = 2.5
vs_ratling_gunner.shoot_ratlinggun_wind_up_time = 0.3
vs_ratling_gunner.shoot_ratlinggun_wind_up_movement_speed = {
	finish = 1.25,
	rate = 8,
	start = 0.75,
}
vs_ratling_gunner.shoot_ratlinggun_reload_movement_speed = {
	finish = 3.5,
	rate = 6,
	start = 1.25,
}
vs_ratling_gunner.shoot_ratlinggun_pose_weapon_time = 1.8
vs_ratling_gunner.reloading_max_time = 1
vs_ratling_gunner.reloading_movement_speed = 3
vs_ratling_gunner.shoot_ratlinggun_minimum_forced_cooldown = 0.01
vs_ratling_gunner.shoot_ratlinggun_max_firing_time = 100
vs_ratling_gunner.max_ammo = 120
vs_ratling_gunner.shoot_ratlinggun_power_level = 100
vs_ratling_gunner.armor_category = 1
vs_ratling_gunner.stagger_duration = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
}
vs_ratling_gunner.diff_stagger_resist = nil
vs_ratling_gunner.stagger_resistance = 2.5
vs_ratling_gunner.stagger_resistance_ranged = 6
vs_ratling_gunner.stagger_threshold_light = 1
vs_ratling_gunner.stagger_threshold_medium = 2
vs_ratling_gunner.stagger_threshold_heavy = 3
vs_ratling_gunner.stagger_threshold_explosion = 4

local vs_warpfire_thrower = table.clone(Breeds.skaven_warpfire_thrower)

vs_warpfire_thrower.animation_sync_rpc = "rpc_sync_anim_state_6"
vs_warpfire_thrower.cannot_be_aggroed = true
vs_warpfire_thrower.parent_breed_name = "skaven_warpfire_thrower"
vs_warpfire_thrower.poison_resistance = 100
vs_warpfire_thrower.keep_weapon_on_death = false
vs_warpfire_thrower.starting_animation = "to_warpfire_thrower"
vs_warpfire_thrower.climb_type = "climb"
vs_warpfire_thrower.movement_speed = 3.5
vs_warpfire_thrower.run_threshold = 4
vs_warpfire_thrower.shoot_warpfire_prime_time = 0.2
vs_warpfire_thrower.shoot_warpfire_wind_up_movement_speed = {
	finish = 0.5,
	rate = 1,
	start = 3,
}
vs_warpfire_thrower.shoot_warpfire_movement_speed_mod = 2
vs_warpfire_thrower.shoot_warpfire_max_flame_time = 4
vs_warpfire_thrower.shoot_warpfire_attack_range = 10
vs_warpfire_thrower.shoot_warpfire_close_attack_range = 7
vs_warpfire_thrower.shoot_warpfire_close_attack_cooldown = 0.2
vs_warpfire_thrower.shoot_warpfire_close_attack_hit_radius = 1.5
vs_warpfire_thrower.shoot_warpfire_close_attack_dot = 0.9
vs_warpfire_thrower.shoot_warpfire_minimum_forced_cooldown = 0.6
vs_warpfire_thrower.shoot_warpfire_long_attack_damage = {
	4,
	4,
	4,
	4,
	4,
	4,
}
vs_warpfire_thrower.stagger_duration = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
}
vs_warpfire_thrower.diff_stagger_resist = nil
vs_warpfire_thrower.stagger_resistance = 2.5
vs_warpfire_thrower.stagger_resistance_ranged = 6
vs_warpfire_thrower.stagger_threshold_light = 1
vs_warpfire_thrower.stagger_threshold_medium = 2
vs_warpfire_thrower.stagger_threshold_heavy = 3
vs_warpfire_thrower.stagger_threshold_explosion = 4
PlayerBreeds.vs_gutter_runner = vs_gutter_runner
PlayerBreeds.vs_packmaster = vs_packmaster
PlayerBreeds.vs_poison_wind_globadier = vs_poison_wind_globadier
PlayerBreeds.vs_ratling_gunner = vs_ratling_gunner
PlayerBreeds.vs_warpfire_thrower = vs_warpfire_thrower

for breed_name, breed_data in pairs(PlayerBreeds) do
	breed_data.name = breed_name

	local lookup = BreedHitZonesLookup[breed_name]

	if lookup then
		breed_data.hit_zones_lookup = lookup
	end
end

local climbing_action = {
	stagger_prohibited = true,
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		true,
		true,
	},
}
local tunneling_action = {
	stagger_prohibited = true,
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		true,
		true,
	},
}
local spawning_action = {
	stagger_prohibited = true,
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		true,
		true,
	},
}
local vs_warpfire_thrower_action = table.clone(BreedActions.skaven_warpfire_thrower)

vs_warpfire_thrower_action.climbing = climbing_action
vs_warpfire_thrower_action.tunneling = tunneling_action
vs_warpfire_thrower_action.spawning = spawning_action

local shoot_warpfire_thrower = vs_warpfire_thrower_action.shoot_warpfire_thrower

shoot_warpfire_thrower.ignore_staggers = {
	true,
	true,
	false,
	false,
	true,
	false,
}

local vs_gutter_runner_action = table.clone(BreedActions.skaven_gutter_runner)

vs_gutter_runner_action.climbing = climbing_action
vs_gutter_runner_action.tunneling = tunneling_action
vs_gutter_runner_action.spawning = spawning_action

local vs_packmaster_action = table.clone(BreedActions.skaven_pack_master)

vs_packmaster_action.climbing = climbing_action
vs_packmaster_action.tunneling = tunneling_action
vs_packmaster_action.spawning = spawning_action

local vs_poison_wind_globadier_action = table.clone(BreedActions.skaven_poison_wind_globadier)

vs_poison_wind_globadier_action.climbing = climbing_action
vs_poison_wind_globadier_action.tunneling = tunneling_action
vs_poison_wind_globadier_action.spawning = spawning_action

local vs_ratling_gunner_action = table.clone(BreedActions.skaven_ratling_gunner)

vs_ratling_gunner_action.climbing = climbing_action
vs_ratling_gunner_action.tunneling = tunneling_action
vs_ratling_gunner_action.spawning = spawning_action

local shoot_ratling_gun = vs_ratling_gunner_action.shoot_ratling_gun

shoot_ratling_gun.fire_rate_at_start = 15
shoot_ratling_gun.fire_rate_at_end = 20
shoot_ratling_gun.time_at_max_rate_of_fire = 3
shoot_ratling_gun.max_fire_rate_at_percentage = 0.5
shoot_ratling_gun.light_weight_projectile_template_name = "ratling_gunner_vs"
shoot_ratling_gun.target_switch_distance = {
	15,
	15,
}
shoot_ratling_gun.radial_speed_feet_shooting = math.pi * 0.725
shoot_ratling_gun.radial_speed_upper_body_shooting = math.pi * 0.35
shoot_ratling_gun.line_of_fire_nav_obstacle_half_extents = Vector3Box(1, 25, 1)
shoot_ratling_gun.arc_of_sight_nav_obstacle_half_extents = Vector3Box(5, 5, 1)
shoot_ratling_gun.ignore_staggers = {
	true,
	false,
	false,
	false,
	false,
	false,
}
BreedActions.vs_gutter_runner = vs_gutter_runner_action
BreedActions.vs_packmaster = vs_packmaster_action
BreedActions.vs_poison_wind_globadier = vs_poison_wind_globadier_action
BreedActions.vs_ratling_gunner = vs_ratling_gunner_action
BreedActions.vs_warpfire_thrower = vs_warpfire_thrower_action
