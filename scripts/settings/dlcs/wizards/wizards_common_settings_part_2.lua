local settings = DLCSettings.wizards_part_2
settings.entity_extensions = {
	"scripts/unit_extensions/wizards/ward_extension",
	"scripts/unit_extensions/wizards/shockwave_spell_extension"
}
settings.entity_system_params = {
	ward_extension = {
		system_class_name = "WardSystem",
		system_name = "ward_system",
		extension_list = {
			"WardExtension"
		}
	},
	shockwave_spell_extension = {
		system_class_name = "ExtensionSystemBase",
		system_name = "shockwave_spell_extension",
		extension_list = {
			"ShockwaveSpellExtension"
		}
	}
}
settings.systems = {
	"scripts/entity_system/systems/ward/ward_system"
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/wizards/wizards_extension_templates_part_2"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_wizards_part_2"
}
settings.statistics_lookup = {
	"tower_skulls",
	"tower_wall_illusions",
	"tower_invisible_bridge",
	"tower_enable_guardian_of_lustria",
	"tower_note_puzzle",
	"tower_created_all_potions",
	"tower_time_challenge"
}
settings.network_go_types = {
	"pickup_projectile_wizards_barrel"
}
settings.husk_lookup = {}
settings.projectile_units = {
	vfx_scripted_projectile_unit = {
		dummy_linker_unit_name = "units/weapons/projectile/end_fight_tower/magic_missile_tower",
		transient_package_loader_ignore = true,
		projectile_unit_name = "units/weapons/projectile/end_fight_tower/magic_missile_tower"
	},
	sofia_vfx_scripted_projectile_unit = {
		dummy_linker_unit_name = "units/weapons/projectile/end_fight_tower/sofia_magic_missile_tower",
		transient_package_loader_ignore = true,
		projectile_unit_name = "units/weapons/projectile/end_fight_tower/sofia_magic_missile_tower"
	},
	olesya_vfx_scripted_projectile_unit = {
		dummy_linker_unit_name = "units/weapons/projectile/end_fight_tower/olesya_magic_missile_tower",
		transient_package_loader_ignore = true,
		projectile_unit_name = "units/weapons/projectile/end_fight_tower/olesya_magic_missile_tower"
	}
}
settings.projectiles = {
	vfx_scripted_projectile_unit = {
		projectile_units_template = "vfx_scripted_projectile_unit",
		radius = 0.2,
		linear_dampening = 0,
		angle = 0,
		only_one_impact = true,
		gravity_settings = "gaze_fireball",
		projectile_unit_template_name = "vfx_scripted_projectile_unit",
		impact_template_name = "vfx_impact",
		impact_collision_filter = "filter_physics_projectile"
	}
}
settings.effects = {
	"fx/ethereal_skulls_teleport_01"
}
settings.unlock_settings = {
	wizards_part_2 = {
		class = "AlwaysUnlocked"
	}
}
settings.unlock_settings_xb1 = {
	wizards_part_2 = {
		class = "AlwaysUnlocked"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		wizards_part_2 = {
			class = "AlwaysUnlocked"
		}
	},
	CUSA13645_00 = {
		wizards_part_2 = {
			class = "AlwaysUnlocked"
		}
	}
}
settings.game_object_initializers = {
	vfx_scripted_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
		local angle = locomotion_extension.angle
		local target_vector = locomotion_extension.target_vector
		local initial_position = locomotion_extension.initial_position_boxed:unbox()
		local speed = locomotion_extension.speed
		local gravity_settings = locomotion_extension.gravity_settings
		local trajectory_template_name = locomotion_extension.trajectory_template_name
		local rotation_speed = locomotion_extension.rotation_speed
		local fast_forward_time = -(locomotion_extension.t - Managers.time:time("game"))
		local IMPACT_COLLISION_FILTER = "filter_environment_overlap"
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
		local impact_template_name = projectile_extension.impact_template_name
		local data_table = {
			sphere_radius = 0.5,
			only_one_impact = true,
			go_type = NetworkLookup.go_types.vfx_scripted_projectile_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			angle = angle,
			initial_position = initial_position,
			target_vector = target_vector,
			speed = speed,
			gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
			trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
			debug_pos = Unit.local_position(unit, 0),
			fast_forward_time = fast_forward_time,
			impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
			collision_filter = IMPACT_COLLISION_FILTER
		}

		return data_table
	end
}
settings.game_object_extractors = {
	vfx_scripted_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local angle = GameSession.game_object_field(game_session, go_id, "angle")
		local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
		local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
		local speed = GameSession.game_object_field(game_session, go_id, "speed")
		local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
		local trajectory_template_name = GameSession.game_object_field(game_session, go_id, "trajectory_template_name")
		local time_initialized = Managers.time:time("game")
		local fast_forward_time = GameSession.game_object_field(game_session, go_id, "fast_forward_time")
		local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
		local IMPACT_COLLISION_FILTER = "filter_environment_overlap"
		local extension_init_data = {
			projectile_locomotion_system = {
				is_husk = true,
				angle = angle,
				speed = speed,
				target_vector = target_vector,
				initial_position = initial_position,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
				fast_forward_time = fast_forward_time
			},
			projectile_impact_system = {
				only_one_impact = true,
				sphere_radius = 0.5,
				collision_filter = IMPACT_COLLISION_FILTER
			},
			projectile_system = {
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				time_initialized = time_initialized
			}
		}
		local unit_template_name = "vfx_scripted_projectile_unit"

		return unit_template_name, extension_init_data
	end
}
settings.ai_group_templates = {
	destructible_defenders = {
		setup_group = function (world, nav_world, group)
			return
		end,
		init = function (world, nav_world, group, t)
			return
		end,
		update = function (world, nav_world, group, t)
			return
		end,
		destroy = function (world, nav_world, group)
			return
		end,
		set_group_aggressive = function (group, preferred_target)
			Managers.state.entity:system("ai_group_system"):run_func_on_all_members(group, AIGroupTemplates.destructible_defenders.set_unit_aggressive, preferred_target)
		end,
		set_unit_aggressive = function (unit, group, preferred_target)
			if not ALIVE[unit] then
				return
			end

			local blackboard = BLACKBOARDS[unit]

			if preferred_target then
				local ai_simple = ScriptUnit.extension(unit, "ai_system")

				ai_simple:enemy_aggro(nil, preferred_target)
			end

			AiUtils.activate_unit(blackboard)

			blackboard.defend = false
		end
	},
	ethereal_skulls = {
		try_spawn_group = function (state, interactor_unit)
			local group_template = AIGroupTemplates.ethereal_skulls
			local last_state = group_template.last_state

			if state ~= "picked_up" or last_state ~= "spawned" then
				return
			end

			group_template.last_state = state

			if not group_template.group_size then
				local difficulty_index = Managers.state.difficulty:get_difficulty_index()
				local settings = DLCSettings.wizards_part_2.ethereal_skull_settings
				group_template.group_size = settings.num_spawned_per_difficulty[difficulty_index]
			end

			local group_id = group_template.group_id
			local group_size = group_template.group_size
			local group = Managers.state.entity:system("ai_group_system"):get_ai_group(group_id)

			if not group_id or not group then
				group_template:create_group(state, interactor_unit, group_size)

				return
			end

			local num_to_spawn = group_size - table.size(group.members)

			if num_to_spawn > 0 then
				group.num_spawned_members = group.num_spawned_members - num_to_spawn

				group_template.add_group_members(state, interactor_unit, group_id, group_size, num_to_spawn)
			end
		end,
		create_group = function (group_template, state, interactor_unit, group_size)
			local group_id = Managers.state.entity:system("ai_group_system"):generate_group_id()
			group_template.group_id = group_id

			group_template.add_group_members(state, interactor_unit, group_id, group_size, group_size)
		end,
		init = function (world, nav_world, group, t)
			return
		end,
		update = function (world, nav_world, group, t)
			return
		end,
		destroy = function (world, nav_world, group)
			return
		end,
		add_group_members = function (state, interactor_unit, group_id, group_size, num_to_spawn)
			local sofia_pos = Vector3(20.5, 76.7, 155.5)
			local optional_data = {
				sofia_unit_pos = Vector3Box(sofia_pos),
				target = interactor_unit,
				prepare_func = function (breed, extension_init_data)
					local is_husk = false

					breed:modify_extension_init_data(is_husk, extension_init_data)
				end,
				spawned_func = function (unit, breed, optional_data)
					local blackboard = BLACKBOARDS[unit]

					if blackboard then
						blackboard.sofia_unit_pos = optional_data.sofia_unit_pos
						blackboard.target = optional_data.target
					end
				end
			}
			local group_data = {
				template = "ethereal_skulls",
				id = group_id,
				size = group_size
			}
			local up = Vector3.up()
			local right = Vector3.right()
			local spawn_rot = Quaternion.identity()
			local height = Vector3(0, 0, 3)
			local dist_from_origin = 3
			local step = math.pi * 2 / num_to_spawn

			for i = 1, num_to_spawn do
				local relative_pos = Quaternion.rotate(Quaternion(up, step * i), right) * dist_from_origin + height
				local spawn_pos = sofia_pos + relative_pos
				height.z = height.z + 0.3
				local teleport_effect = "fx/ethereal_skulls_teleport_01"

				if teleport_effect then
					local effect_name_id = NetworkLookup.effects[teleport_effect]
					local node_id = 0
					local rotation_offset = Quaternion.identity()
					local network_manager = Managers.state.network

					network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, spawn_pos, rotation_offset, false)
				end

				Managers.state.conflict:spawn_queued_unit(Breeds.tower_homing_skull, Vector3Box(spawn_pos), QuaternionBox(spawn_rot), nil, "spawn_idle", nil, optional_data, group_data)
			end
		end
	}
}
