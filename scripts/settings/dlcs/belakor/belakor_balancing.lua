-- chunkname: @scripts/settings/dlcs/belakor/belakor_balancing.lua

BelakorBalancing = {
	captains_chance_per_spawn = 0.5,
	captains_max_marked_enemies = 1,
	captains_stop_spawning_when_crystal_count = 2,
	crystal_throw_speed = 5,
	harder_spawn_interval = 3,
	homing_skulls_base_speed = 375,
	homing_skulls_debuff_movespeed_duration = 2,
	homing_skulls_debuff_movespeed_multiplier = 0.5,
	homing_skulls_distance_between_skulls = 2,
	homing_skulls_lerp_constant = 10,
	homing_skulls_max_speed_multiplier = 0.02,
	homing_skulls_max_time_between_spawns = 30,
	homing_skulls_maximum_count = 5,
	homing_skulls_min_distance_above_ground = 2,
	homing_skulls_min_speed_multiplier = 0.009,
	homing_skulls_min_time_between_spawns = 20,
	homing_skulls_minimum_count = 3,
	homing_skulls_radius = 10,
	homing_skulls_retry_time_on_spawn_failure = 3,
	homing_skulls_vertical_offset_frequency_multiplier = 4,
	homing_skulls_vertical_offset_multiplier = 0.1,
	statue_health = 50,
	totem_crystal_count = 1,
	totem_decal_duration = 2,
	totem_despawn_distance = 35,
	totem_distance_despawn_time = 10,
	totem_panic_decal_duration = 1.5,
	totem_spawn_cooldown = 1,
	totem_spawns_distance = 50,
	captains_possible_enemies = {
		beastmen_bestigor = true,
		beastmen_gor = true,
		beastmen_ungor = true,
		chaos_berzerker = true,
		chaos_fanatic = true,
		chaos_marauder = true,
		chaos_marauder_with_shield = true,
		chaos_raider = true,
		chaos_warrior = true,
		skaven_clan_rat = true,
		skaven_clan_rat_with_shield = true,
		skaven_plague_monk = true,
		skaven_slave = true,
		skaven_storm_vermin = true,
		skaven_storm_vermin_champion = true,
		skaven_storm_vermin_commander = true,
		skaven_storm_vermin_with_shield = true,
	},
	totem_health = {
		120,
		120,
		120,
		120,
		120,
		120,
		120,
		120,
	},
	spawn_crystal_func = function (position)
		local pickup_system = Managers.state.entity:system("pickup_system")
		local with_physics = true
		local rotation = Quaternion.identity()
		local spawn_type = "dropped"
		local pickup_name = "belakor_crystal"
		local override_unit_template_name = "belakor_crystal_throw"

		for i = 1, BelakorBalancing.totem_crystal_count do
			local velocity = Vector3(2 * math.random() - 1, 2 * math.random() - 1, 1)

			pickup_system:spawn_pickup(pickup_name, position + Vector3.up() * 2, rotation, with_physics, spawn_type, velocity, override_unit_template_name)
		end
	end,
	homing_skulls_min_pitch = math.pi * 0.1,
	homing_skulls_max_pitch = math.pi * 0.25,
	homing_skulls_pitch_delta = math.pi * 0.05,
	homing_skulls_yaw_delta = 2 * math.pi / 10,
	homing_skulls_speed_multiplier_curve_func = function (lifetime)
		return -(1 / (math.min(lifetime + 2, 4) / 4)) + 2
	end,
}
