return {
	description = "description_mutator_elite_specials",
	icon = "mutator_icon_powerful_elites",
	display_name = "display_name_mutator_elite_specials",
	server_initialize_function = function (context, data)
		MutatorUtils.store_breed_and_action_settings(context, data)

		Breeds.skaven_gutter_runner.run_speed = 14
		Breeds.skaven_gutter_runner.jump_speed = 40
		Breeds.skaven_gutter_runner.jump_range = 40
		BreedActions.skaven_ratling_gunner.shoot_ratling_gun.attack_time = {
			12,
			20
		}
		BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_start = 20
		BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_end = 35
		BreedActions.skaven_ratling_gunner.shoot_ratling_gun.ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
		Breeds.skaven_poison_wind_globadier.armor_category = 2
		BreedActions.skaven_poison_wind_globadier.advance_towards_players.time_until_first_throw = {
			0,
			1
		}
		BreedActions.skaven_poison_wind_globadier.advance_towards_players.throw_at_distance = {
			5,
			40
		}
		BreedActions.skaven_poison_wind_globadier.advance_towards_players.range = 60
		BreedActions.skaven_poison_wind_globadier.throw_poison_globe.barrage_count = 8
		BreedActions.skaven_poison_wind_globadier.throw_poison_globe.time_between_throws = {
			8,
			1
		}
		Breeds.skaven_warpfire_thrower.run_speed = 6
		BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
		BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.close_attack_range = 25
		BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.buff_name = "warpfire_thrower_face_base_mutator"
		BreedActions.skaven_warpfire_thrower.follow.distance_to_attack = 15
		Breeds.skaven_pack_master.run_speed = 6.2
		BreedActions.skaven_pack_master.follow.distance_to_attack = 4
		BreedActions.skaven_pack_master.initial_pull.pull_time = 0.8
		BreedActions.skaven_pack_master.initial_pull.pull_distance = 6
		BreedActions.skaven_pack_master.drag.override_movement_speed = 8
		BreedActions.skaven_pack_master.drag.force_hoist_time = 10
		BreedActions.skaven_pack_master.hoist.hoist_anim_length = 1
		Breeds.chaos_vortex_sorcerer.armor_category = 2
		Breeds.chaos_vortex.run_speed = 2.25
		Breeds.chaos_vortex_sorcerer.no_despawn_when_master_dies = true
		BreedActions.chaos_vortex_sorcerer.spawn_vortex.summoning_time = 1.5
		BreedActions.chaos_vortex_sorcerer.spawn_vortex.vortex_template_name = "elite_mutator"
		BreedActions.chaos_corruptor_sorcerer.grab_attack.max_distance_squared = 400
		BreedActions.chaos_corruptor_sorcerer.grab_attack.projectile_speed = 35
		BreedActions.chaos_corruptor_sorcerer.grab_attack.ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
		BreedActions.chaos_corruptor_sorcerer.skulk_approach.min_wave_distance = 5
		BreedActions.chaos_corruptor_sorcerer.skulk_approach.max_wave_distance = 15
		BreedActions.chaos_corruptor_sorcerer.skulk_approach.third_wave_min_distance = 4
		BreedActions.chaos_corruptor_sorcerer.skulk_approach.third_wave_max_distance = 15
	end,
	server_stop_function = function (context, data)
		MutatorUtils.restore_breed_and_action_settings(context, data)
	end
}
