-- chunkname: @scripts/settings/weave_unit_templates.lua

WeaveUnitTemplates = {}
WeaveUnitTemplates.weave_capture_point = {
	unit_name = "units/gameplay/weave_capture_point",
	unit_template_name = "weave_capture_point_unit",
	create_extension_init_data_func = function (weave_objective_id, weave_objective_data, item_spawner_unit)
		local extension_init_data = {
			weave_objective_system = {
				objective_name = weave_objective_id,
				timer = weave_objective_data.timer,
				score = weave_objective_data.score,
				percentage_of_players_required = weave_objective_data.percentage_of_players_required,
				timer_recharge_per_second = weave_objective_data.timer_recharge_per_second,
				capture_rate_multiplier = weave_objective_data.capture_rate_multiplier,
				scale = Unit.local_scale(item_spawner_unit, 0),
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = weave_objective_data.on_start_func,
				on_enter_func = weave_objective_data.on_enter_func,
				on_progress_func = weave_objective_data.on_progress_func,
				on_exit_func = weave_objective_data.on_exit_func,
				on_complete_func = weave_objective_data.on_complete_func,
			},
		}

		return extension_init_data
	end,
}
WeaveUnitTemplates.weave_target = {
	unit_name = "units/props/generic/weave_target",
	unit_template_name = "weave_target_unit",
	create_extension_init_data_func = function (weave_objective_id, weave_objective_data, item_spawner_unit)
		local extension_init_data = {
			weave_objective_system = {
				objective_name = weave_objective_id,
				attacks_allowed = weave_objective_data.attacks_allowed,
				score = weave_objective_data.score,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = weave_objective_data.on_start_func,
				on_progress_func = weave_objective_data.on_progress_func,
				on_complete_func = weave_objective_data.on_complete_func,
			},
			health_system = {
				health = weave_objective_data.health,
				damage_per_hit = weave_objective_data.damage_per_hit,
				health_regen = weave_objective_data.health_regen,
			},
		}

		return extension_init_data
	end,
}
WeaveUnitTemplates.weave_interaction = {
	unit_name = "units/gameplay/weave_interaction",
	unit_template_name = "weave_interaction_unit",
	create_extension_init_data_func = function (weave_objective_id, weave_objective_data, item_spawner_unit)
		local extension_init_data = {
			weave_objective_system = {
				objective_name = weave_objective_id,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = weave_objective_data.on_start_func,
				on_interact_start_func = weave_objective_data.on_interact_start_func,
				on_interact_interupt_func = weave_objective_data.on_interact_interupt_func,
				on_interact_complete_func = weave_objective_data.on_interact_complete_func,
				on_progress_func = weave_objective_data.on_progress_func,
				on_complete_func = weave_objective_data.on_complete_func,
				score = weave_objective_data.score,
				duration = weave_objective_data.duration,
				num_times_to_complete = weave_objective_data.num_times_to_complete,
			},
		}

		return extension_init_data
	end,
}
WeaveUnitTemplates.weave_doom_wheel = {
	unit_name = "units/gameplay/weave/weave_prop_skaven_doom_wheel_01",
	unit_template_name = "weave_doom_wheel",
	create_extension_init_data_func = function (weave_objective_id, weave_objective_data, item_spawner_unit)
		local group_name = Unit.get_data(item_spawner_unit, "group_name")
		local extension_init_data = {
			weave_objective_system = {
				objective_name = weave_objective_id,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				timer = weave_objective_data.timer,
				score = weave_objective_data.score,
				on_socket_start_func = weave_objective_data.on_socket_start_func,
				on_socket_progress_func = weave_objective_data.on_socket_progress_func,
				on_socket_complete_func = weave_objective_data.on_socket_complete_func,
				on_fuze_start_func = weave_objective_data.on_fuze_start_func,
				on_fuze_progress_func = weave_objective_data.on_fuze_progress_func,
				on_fuze_complete_func = weave_objective_data.on_fuze_complete_func,
			},
			objective_socket_system = {
				use_game_object_id = true,
			},
		}

		return extension_init_data
	end,
}
WeaveUnitTemplates.weave_kill_enemies = {
	unit_name = "units/gameplay/weave_kill_enemies",
	unit_template_name = "weave_kill_enemies_unit",
	create_extension_init_data_func = function (weave_objective_id, weave_objective_data, item_spawner_unit)
		local extension_init_data = {
			weave_objective_system = {
				objective_name = weave_objective_id,
				on_start_func = weave_objective_data.on_start_func,
				on_progress_func = weave_objective_data.on_progress_func,
				on_complete_func = weave_objective_data.on_complete_func,
				score = weave_objective_data.score,
				base_score_per_kill = weave_objective_data.base_score_per_kill,
				breed_score_multipliers = weave_objective_data.breed_score_multipliers,
				score_multiplier = weave_objective_data.score_multiplier,
				amount = weave_objective_data.amount,
				breeds_allowed = weave_objective_data.breeds_allowed,
				races_allowed = weave_objective_data.races_allowed,
				hit_zones_allowed = weave_objective_data.hit_zones_allowed,
				attacks_allowed = weave_objective_data.attacks_allowed,
				damage_types_allowed = weave_objective_data.damage_types_allowed,
			},
		}

		return extension_init_data
	end,
}
