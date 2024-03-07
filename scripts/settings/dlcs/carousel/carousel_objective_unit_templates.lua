-- chunkname: @scripts/settings/dlcs/carousel/carousel_objective_unit_templates.lua

CarouselObjectiveUnitTemplates = {}
CarouselObjectiveUnitTemplates.versus_volume_objective = {
	unit_name = "units/gameplay/versus_volume_objective",
	unit_template_name = "versus_volume_objective_unit",
	create_extension_init_data_func = function (versus_objective_id, versus_objective_data, item_spawner_unit)
		local extension_init_data = {
			versus_objective_system = {
				objective_name = versus_objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = versus_objective_data.description,
				on_complete_func = versus_objective_data.on_complete_func,
				num_sections = versus_objective_data.num_sections,
				score_per_section = versus_objective_data.score_per_section,
				time_per_section = versus_objective_data.time_per_section,
				score_for_completion = versus_objective_data.score_for_completion,
				time_for_completion = versus_objective_data.time_for_completion,
				optional = versus_objective_data.optional,
				on_complete_sound_event = versus_objective_data.on_complete_sound_event,
			},
		}

		return extension_init_data
	end,
}
CarouselObjectiveUnitTemplates.versus_capture_point_objective = {
	unit_name = "units/gameplay/versus_capture_point_objective",
	unit_template_name = "versus_capture_point_objective_unit",
	create_extension_init_data_func = function (versus_objective_id, versus_objective_data, item_spawner_unit)
		local extension_init_data = {
			versus_objective_system = {
				objective_name = versus_objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = versus_objective_data.description,
				on_complete_func = versus_objective_data.on_complete_func,
				num_sections = versus_objective_data.num_sections,
				score_per_section = versus_objective_data.score_per_section,
				time_per_section = versus_objective_data.time_per_section,
				score_for_completion = versus_objective_data.score_for_completion,
				time_for_completion = versus_objective_data.time_for_completion,
				optional = versus_objective_data.optional,
				capture_rate_multiplier = versus_objective_data.capture_rate_multiplier,
				capture_time = versus_objective_data.capture_time,
				on_complete_sound_event = versus_objective_data.on_complete_sound_event,
			},
		}

		return extension_init_data
	end,
}
CarouselObjectiveUnitTemplates.versus_mission_objective = {
	unit_name = "units/gameplay/versus_mission_objective",
	unit_template_name = "versus_mission_objective_unit",
	create_extension_init_data_func = function (versus_objective_id, versus_objective_data, item_spawner_unit)
		local extension_init_data = {
			versus_objective_system = {
				objective_name = versus_objective_id,
				scale = Unit.local_scale(item_spawner_unit, 0),
				description = versus_objective_data.description,
				on_complete_func = versus_objective_data.on_complete_func,
				num_sections = versus_objective_data.num_sections,
				score_per_section = versus_objective_data.score_per_section,
				time_per_section = versus_objective_data.time_per_section,
				score_for_completion = versus_objective_data.score_for_completion,
				time_for_completion = versus_objective_data.time_for_completion,
				optional = versus_objective_data.optional,
				on_complete_sound_event = versus_objective_data.on_complete_sound_event,
			},
		}

		return extension_init_data
	end,
}
