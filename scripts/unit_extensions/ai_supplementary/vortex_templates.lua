VortexTemplates = {
	standard = {
		full_inner_radius = 3.5,
		outer_fx_z_scale_multiplier = 0.1,
		min_inner_radius = 0.38,
		inner_fx_z_scale_multiplier = 0.1,
		player_ascend_speed = 1,
		player_eject_height = 2.5,
		player_actions_allowed = false,
		full_outer_radius = 8,
		player_ejected_bliss_time = 5,
		min_outer_radius = 2,
		high_cost_nav_cost_map_cost_type = "vortex_danger_zone",
		ai_rotation_speed = 15,
		random_wander = false,
		stop_and_process_player = true,
		player_eject_distance = 12,
		player_eject_speed = 12,
		max_height = 10,
		medium_cost_nav_cost_map_cost_type = "vortex_near",
		player_in_vortex_max_duration = 5,
		player_attract_speed = 15,
		start_radius = 0.1,
		min_fx_radius = 2,
		force_player_look_dir_to_spinn_dir = false,
		outer_fx_name = "fx/wpn_chaos_plague_vortex_small_outer",
		ai_attract_speed = 20,
		inner_fx_name = "fx/wpn_chaos_plague_vortex_small",
		windup_time = 0.5,
		ai_radius_change_speed = 1,
		player_rotation_speed = 10,
		forced_standing_still = false,
		use_nav_cost_map_volumes = true,
		ai_ascension_speed = 3,
		max_allowed_inner_radius_dist = 1.5,
		player_radius_change_speed = 1,
		full_fx_radius = 8,
		breed = Breeds.chaos_vortex,
		ai_eject_height = {
			3,
			5
		},
		time_of_life = {
			20,
			22
		},
		damage = {
			5,
			3,
			1.5
		},
		difficulty_damage = {
			easy = {
				2,
				4,
				2
			},
			normal = {
				3,
				5,
				3
			},
			hard = {
				5,
				7,
				5
			},
			survival_hard = {
				10,
				8,
				5
			},
			harder = {
				10,
				8,
				10
			},
			survival_harder = {
				15,
				10,
				10
			},
			hardest = {
				20,
				10,
				15
			},
			survival_hardest = {
				30,
				15,
				22.5
			}
		}
	},
	boss_sorcerer = {
		full_inner_radius = 7.5,
		outer_fx_z_scale_multiplier = 0.1,
		min_inner_radius = 6,
		inner_fx_z_scale_multiplier = 0.1,
		player_ascend_speed = 1,
		player_eject_height = 3.5,
		player_actions_allowed = false,
		full_outer_radius = 9,
		player_ejected_bliss_time = 5,
		high_cost_nav_cost_map_cost_type = "vortex_danger_zone",
		ai_rotation_speed = 15,
		random_wander = false,
		stop_and_process_player = true,
		player_eject_distance = 6,
		player_eject_speed = 12,
		max_height = 20,
		medium_cost_nav_cost_map_cost_type = "vortex_near",
		min_outer_radius = 7,
		player_in_vortex_max_duration = 5,
		player_attract_speed = 15,
		start_radius = 0.1,
		min_fx_radius = 7,
		force_player_look_dir_to_spinn_dir = false,
		outer_fx_name = "fx/wpn_chaos_plague_vortex_small_outer",
		ai_attract_speed = 20,
		inner_fx_name = "fx/wpn_chaos_plague_vortex",
		windup_time = 1,
		ai_radius_change_speed = 1,
		player_rotation_speed = 10,
		forced_standing_still = true,
		use_nav_cost_map_volumes = true,
		ai_ascension_speed = 3,
		max_allowed_inner_radius_dist = 1.5,
		player_radius_change_speed = 1,
		full_fx_radius = 9,
		breed = Breeds.chaos_vortex,
		ai_eject_height = {
			3,
			4
		},
		time_of_life = {
			7,
			8
		},
		damage = {
			5,
			3,
			1.5
		},
		difficulty_damage = {
			easy = {
				2,
				4,
				2
			},
			normal = {
				3,
				5,
				3
			},
			hard = {
				5,
				7,
				5
			},
			survival_hard = {
				10,
				8,
				5
			},
			harder = {
				10,
				8,
				10
			},
			survival_harder = {
				15,
				10,
				10
			},
			hardest = {
				20,
				10,
				15
			},
			survival_hardest = {
				30,
				15,
				22.5
			}
		},
		suck_in_ai_func = function (blackboard)
			local stat_name = "halescourge_tornado_enemies"
			local current_difficulty = Managers.state.difficulty:get_difficulty()
			local allowed_difficulties = QuestSettings.allowed_difficulties[stat_name]
			local allowed_difficulty = allowed_difficulties[current_difficulty]
			local achievements_enabled = Development.parameter("v2_achievements")

			if achievements_enabled and allowed_difficulty and not blackboard.completed_vortex_suck_in_challenge then
				if not blackboard.num_ai_units_sucked_in then
					blackboard.num_ai_units_sucked_in = 0
					local num_ai_units_sucked_in = blackboard.num_ai_units_sucked_in or 0
					blackboard.num_ai_units_sucked_in = num_ai_units_sucked_in + 1

					if QuestSettings.halescourge_tornado_enemies <= blackboard.num_ai_units_sucked_in then
						local statistics_db = Managers.player:statistics_db()

						statistics_db:increment_stat_and_sync_to_clients(stat_name)

						blackboard.completed_vortex_suck_in_challenge = true
					end
				end
			end
		end
	}
}

return
