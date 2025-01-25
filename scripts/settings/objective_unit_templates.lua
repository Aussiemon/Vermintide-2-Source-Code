-- chunkname: @scripts/settings/objective_unit_templates.lua

ObjectiveUnitTemplates = {}
ObjectiveUnitTemplates.objective_group = {
	unit_name = "units/hub_elements/empty",
	unit_template_name = "objective_group",
	create_extension_init_data_func = function (objective_id, objective_data, _)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				on_start_func = objective_data.on_start_func,
				on_enter_func = objective_data.on_enter_func,
				on_progress_func = objective_data.on_progress_func,
				on_exit_func = objective_data.on_exit_func,
				on_complete_func = objective_data.on_complete_func,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.weave_capture_point = {
	unit_name = "units/gameplay/weave_capture_point",
	unit_template_name = "weave_capture_point_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				timer = objective_data.timer,
				percentage_of_players_required = objective_data.percentage_of_players_required,
				capture_rate_multiplier = objective_data.capture_rate_multiplier,
				scale = Unit.local_scale(item_spawner_unit, 0),
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = objective_data.on_start_func,
				on_enter_func = objective_data.on_enter_func,
				on_progress_func = objective_data.on_progress_func,
				on_exit_func = objective_data.on_exit_func,
				on_complete_func = objective_data.on_complete_func,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.weave_target = {
	unit_name = "units/props/generic/weave_target",
	unit_template_name = "weave_target_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				attacks_allowed = objective_data.attacks_allowed,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = objective_data.on_start_func,
				on_progress_func = objective_data.on_progress_func,
				on_complete_func = objective_data.on_complete_func,
			},
			health_system = {
				health = objective_data.health,
				damage_per_hit = objective_data.damage_per_hit,
				health_regen = objective_data.health_regen,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.weave_interaction = {
	unit_name = "units/gameplay/weave_interaction",
	unit_template_name = "weave_interaction_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				on_start_func = objective_data.on_start_func,
				on_interact_start_func = objective_data.on_interact_start_func,
				on_interact_interupt_func = objective_data.on_interact_interupt_func,
				on_interact_complete_func = objective_data.on_interact_complete_func,
				on_progress_func = objective_data.on_progress_func,
				on_complete_func = objective_data.on_complete_func,
				duration = objective_data.duration,
				num_times_to_complete = objective_data.num_times_to_complete,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.weave_doom_wheel = {
	unit_name = "units/gameplay/weave/weave_prop_skaven_doom_wheel_01",
	unit_template_name = "weave_doom_wheel",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local group_name = Unit.get_data(item_spawner_unit, "group_name")
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				terror_event_spawner_id = Unit.get_data(item_spawner_unit, "terror_event_spawner_id"),
				timer = objective_data.timer,
				on_socket_start_func = objective_data.on_socket_start_func,
				on_socket_progress_func = objective_data.on_socket_progress_func,
				on_socket_complete_func = objective_data.on_socket_complete_func,
				on_fuze_start_func = objective_data.on_fuze_start_func,
				on_fuze_progress_func = objective_data.on_fuze_progress_func,
				on_fuze_complete_func = objective_data.on_fuze_complete_func,
			},
			objective_socket_system = {
				use_game_object_id = true,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.weave_kill_enemies = {
	unit_name = "units/gameplay/weave_kill_enemies",
	unit_template_name = "weave_kill_enemies_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				on_start_func = objective_data.on_start_func,
				on_progress_func = objective_data.on_progress_func,
				on_complete_func = objective_data.on_complete_func,
				base_score_per_kill = objective_data.base_score_per_kill,
				breed_score_multipliers = objective_data.breed_score_multipliers,
				score_multiplier = objective_data.score_multiplier,
				amount = objective_data.amount,
				breeds_allowed = objective_data.breeds_allowed,
				races_allowed = objective_data.races_allowed,
				hit_zones_allowed = objective_data.hit_zones_allowed,
				attacks_allowed = objective_data.attacks_allowed,
				damage_types_allowed = objective_data.damage_types_allowed,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.versus_volume_objective = {
	unit_name = "units/gameplay/versus_volume_objective",
	unit_template_name = "versus_volume_objective_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = objective_data.description,
				on_complete_func = objective_data.on_complete_func,
				num_sections = objective_data.num_sections,
				score_per_section = objective_data.score_per_section,
				time_per_section = objective_data.time_per_section,
				score_for_completion = objective_data.score_for_completion,
				time_for_completion = objective_data.time_for_completion,
				on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event,
				on_leaf_complete_sound_event = objective_data.on_leaf_complete_sound_event,
				on_section_progress_sound_event = objective_data.on_section_progress_sound_event,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.versus_capture_point_objective = {
	unit_name = "units/gameplay/versus_capture_point_objective",
	unit_template_name = "versus_capture_point_objective_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = objective_data.description,
				on_complete_func = objective_data.on_complete_func,
				num_sections = objective_data.num_sections,
				score_per_section = objective_data.score_per_section,
				time_per_section = objective_data.time_per_section,
				score_for_completion = objective_data.score_for_completion,
				time_for_completion = objective_data.time_for_completion,
				capture_rate_multiplier = objective_data.capture_rate_multiplier,
				capture_time = objective_data.capture_time,
				on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event,
				on_leaf_complete_sound_event = objective_data.on_leaf_complete_sound_event,
				on_section_progress_sound_event = objective_data.on_section_progress_sound_event,
			},
		}

		return extension_init_data
	end,
}
ObjectiveUnitTemplates.versus_mission_objective = {
	unit_name = "units/gameplay/versus_mission_objective",
	unit_template_name = "versus_mission_objective_unit",
	create_extension_init_data_func = function (objective_id, objective_data, item_spawner_unit)
		local extension_init_data = {
			objective_system = {
				objective_name = objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = objective_data.description,
				on_complete_func = objective_data.on_complete_func,
				num_sections = objective_data.num_sections,
				score_per_section = objective_data.score_per_section,
				time_per_section = objective_data.time_per_section,
				score_for_completion = objective_data.score_for_completion,
				time_for_completion = objective_data.time_for_completion,
				on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event,
				on_leaf_complete_sound_event = objective_data.on_leaf_complete_sound_event,
				on_section_progress_sound_event = objective_data.on_section_progress_sound_event,
			},
		}

		return extension_init_data
	end,
}
