local settings = DLCSettings.belakor
settings.additional_system_extensions = {
	pickup_system = {
		{
			require = "scripts/unit_extensions/pickups/orb_pickup_unit_extension",
			class = "OrbPickupUnitExtension"
		}
	}
}
settings.pickup_system_extension_update = {
	"OrbPickupUnitExtension"
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/belakor/belakor_extension_templates"
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_belakor"
}
settings.anim_lookup = {
	"spawn_chaos_champion_01",
	"spawn_chaos_champion_02",
	"spawn_chaos_champion_03",
	"spawn_chaos_champion_04",
	"spawn_chaos_champion_05",
	"insert_locus_crystal"
}
settings.husk_lookup = {
	"units/props/deus_orb/deus_orb_01",
	"units/props/blk/blk_curse_shadow_dagger_01",
	"units/props/blk/blk_curse_shadow_homing_skull_01",
	"units/props/blk/blk_curse_shadow_dagger_spawner_01",
	"units/props/blk/blk_curse_shadow_homing_skulls_spawner_01",
	"units/weapons/player/pup_belakor_crystal/pup_belakor_crystal",
	"units/props/blk/blk_locus_01",
	"units/props/blk/blk_totem_01",
	"units/beings/enemies/blk_shadow_lieutenant/chr_blk_shadow_lieutenant",
	"units/gameplay/belakor_crystal_socket_01"
}
settings.game_object_initializers = {
	orb_pickup_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local orb_flight_target_position = pickup_extension:get_orb_flight_target_position()
		local data_table = {
			go_type = NetworkLookup.go_types.orb_pickup_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			orb_flight_target_position = orb_flight_target_position and orb_flight_target_position:unbox(),
			flight_enabled = (orb_flight_target_position and true) or false
		}

		return data_table
	end,
	shadow_dagger_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
		local angle = locomotion_extension.angle
		local speed = locomotion_extension.speed
		local gravity_settings = locomotion_extension.gravity_settings
		local target_vector = locomotion_extension.target_vector
		local initial_position = locomotion_extension.initial_position_boxed:unbox()
		local trajectory_template_name = locomotion_extension.trajectory_template_name
		local rotation_speed = locomotion_extension.rotation_speed
		local rotate_around_forward = locomotion_extension.rotate_around_forward
		local start_paused_for_time = locomotion_extension.start_paused_for_time
		local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
		local collision_filter = impact_extension.collision_filter
		local sphere_radius = impact_extension.sphere_radius
		local only_one_impact = impact_extension.only_one_impact
		local owner_unit = impact_extension.owner_unit
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
		local impact_template_name = projectile_extension.impact_template_name
		local damage_source = projectile_extension.damage_source
		local network_manager = Managers.state.network
		local data_table = {
			go_type = NetworkLookup.go_types.shadow_dagger_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			angle = angle,
			speed = speed,
			gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
			initial_position = initial_position,
			target_vector = target_vector,
			trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
			owner_unit = network_manager:unit_game_object_id(owner_unit),
			rotate_around_forward = rotate_around_forward,
			rotation_speed = rotation_speed,
			start_paused_for_time = start_paused_for_time,
			collision_filter = NetworkLookup.collision_filters[collision_filter],
			sphere_radius = sphere_radius,
			only_one_impact = only_one_impact,
			impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
			damage_source_id = NetworkLookup.damage_sources[damage_source]
		}

		return data_table
	end,
	shadow_skull_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local breed = Unit.get_data(unit, "breed")
		local side = Managers.state.side.side_by_unit[unit]
		local side_id = side.side_id
		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local health = health_extension:get_max_health()
		local data_table = {
			go_type = NetworkLookup.go_types.shadow_skull_unit,
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			husk_unit = NetworkLookup.husks[unit_name],
			health = health,
			breed_name = NetworkLookup.breeds[breed.name],
			bt_action_name = NetworkLookup.bt_action_names["n/a"],
			side_id = side_id
		}

		return data_table
	end,
	arena_belakor_big_statue_health = function (unit, unit_name, unit_template, gameobject_functor_context)
		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local data_table = {
			go_type = NetworkLookup.go_types.arena_belakor_big_statue_health,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			health = health_extension:get_max_health()
		}

		return data_table
	end,
	deus_belakor_locus = function (unit, unit_name, unit_template, gameobject_functor_context)
		local data_table = {
			go_type = NetworkLookup.go_types.deus_belakor_locus,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0)
		}

		return data_table
	end,
	belakor_crystal = function (unit, unit_name, unit_template, gameobject_functor_context)
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local data_table = {
			go_type = NetworkLookup.go_types.belakor_crystal,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			debug_pos = Unit.local_position(unit, 0),
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
		}

		return data_table
	end,
	belakor_crystal_throw = function (unit, unit_name, unit_template, gameobject_functor_context)
		local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
		local network_position = locomotion_extension.network_position
		local network_rotation = locomotion_extension.network_rotation
		local network_velocity = locomotion_extension.network_velocity
		local network_angular_velocity = locomotion_extension.network_angular_velocity
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local data_table = {
			go_type = NetworkLookup.go_types.belakor_crystal_throw,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
			debug_pos = Unit.local_position(unit, 0),
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
		}

		return data_table
	end,
	belakor_totem = function (unit, unit_name, unit_template, gameobject_functor_context)
		local breed = Unit.get_data(unit, "breed")
		local side = Managers.state.side.side_by_unit[unit]
		local side_id = side.side_id
		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local data_table = {
			go_type = NetworkLookup.go_types.belakor_totem,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			health = health_extension:get_max_health(),
			breed_name = NetworkLookup.breeds[breed.name],
			bt_action_name = NetworkLookup.bt_action_names["n/a"],
			side_id = side_id
		}

		return data_table
	end,
	shadow_homing_skulls_spawner = function (unit, unit_name, unit_template, gameobject_functor_context)
		local data_table = {
			go_type = NetworkLookup.go_types.shadow_homing_skulls_spawner,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0)
		}

		return data_table
	end,
	belakor_crystal_socket = function (unit, unit_name, unit_template, gameobject_functor_context)
		local data_table = {
			go_type = NetworkLookup.go_types.belakor_crystal_socket,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0)
		}

		return data_table
	end
}
settings.game_object_extractors = {
	orb_pickup_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local pickup_name = GameSession.game_object_field(game_session, game_object_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, game_object_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, game_object_id, "spawn_type")
		local orb_flight_target_position = GameSession.game_object_field(game_session, game_object_id, "orb_flight_target_position")
		local flight_enabled = GameSession.game_object_field(game_session, game_object_id, "flight_enabled")
		local extension_init_data = {
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
				orb_flight_target_position = orb_flight_target_position and Vector3Box(orb_flight_target_position),
				flight_enabled = flight_enabled
			}
		}
		local unit_template_name = "orb_pickup_unit"

		return unit_template_name, extension_init_data
	end,
	shadow_dagger_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local angle = GameSession.game_object_field(game_session, go_id, "angle")
		local speed = GameSession.game_object_field(game_session, go_id, "speed")
		local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
		local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
		local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
		local trajectory_template_name = GameSession.game_object_field(game_session, go_id, "trajectory_template_name")
		local owner_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit")
		local rotation_speed = GameSession.game_object_field(game_session, go_id, "rotation_speed")
		local rotate_around_forward = GameSession.game_object_field(game_session, go_id, "rotate_around_forward")
		local start_paused_for_time = GameSession.game_object_field(game_session, go_id, "start_paused_for_time")
		local only_one_impact = GameSession.game_object_field(game_session, go_id, "only_one_impact")
		local sphere_radius = GameSession.game_object_field(game_session, go_id, "sphere_radius")
		local collision_filter_id = GameSession.game_object_field(game_session, go_id, "collision_filter")
		local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
		local damage_source_id = GameSession.game_object_field(game_session, go_id, "damage_source_id")
		local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)
		local extension_init_data = {
			projectile_locomotion_system = {
				is_husk = true,
				angle = angle,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				target_vector = target_vector,
				initial_position = initial_position,
				trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
				rotation_speed = rotation_speed,
				rotate_around_forward = rotate_around_forward,
				start_paused_for_time = start_paused_for_time
			},
			projectile_impact_system = {
				collision_filter = NetworkLookup.collision_filters[collision_filter_id],
				only_one_impact = only_one_impact,
				sphere_radius = sphere_radius,
				owner_unit = owner_unit
			},
			projectile_system = {
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				owner_unit = owner_unit,
				damage_source = NetworkLookup.damage_sources[damage_source_id]
			},
			locomotion_system = {}
		}
		local unit_template_name = "shadow_dagger_unit"

		return unit_template_name, extension_init_data
	end,
	shadow_skull_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local breed_name_id = GameSession.game_object_field(game_session, go_id, "breed_name")
		local side_id = GameSession.game_object_field(game_session, go_id, "side_id")
		local health = GameSession.game_object_field(game_session, go_id, "health")
		local breed_name = NetworkLookup.breeds[breed_name_id]
		local breed = Breeds[breed_name]

		Unit.set_data(unit, "breed", breed)

		local extension_init_data = {
			ai_system = {
				go_id = go_id,
				game = game_session,
				side_id = side_id
			},
			health_system = {
				health = health
			},
			death_system = {
				is_husk = true,
				death_reaction_template = breed.death_reaction,
				disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
			},
			hit_reaction_system = {
				is_husk = true,
				hit_reaction_template = breed.hit_reaction,
				hit_effect_template = breed.hit_effect_template
			},
			dialogue_system = {
				faction = "enemy",
				breed_name = breed_name
			},
			proximity_system = {
				breed = breed
			},
			projectile_locomotion_system = {
				is_husk = true
			}
		}
		local is_husk = true

		breed:modify_extension_init_data(is_husk, extension_init_data)

		local unit_template_name = breed.unit_template

		return unit_template_name, extension_init_data
	end,
	arena_belakor_big_statue_health = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local health = GameSession.game_object_field(game_session, go_id, "health")
		local unit_template_name = "arena_belakor_big_statue_health"
		local extension_init_data = {
			health_system = {
				health = health
			},
			death_system = {
				death_reaction_template = "level_object",
				is_husk = true
			},
			hit_reaction_system = {
				is_husk = true,
				hit_reaction_template = "level_object"
			}
		}

		return unit_template_name, extension_init_data
	end,
	deus_belakor_locus = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local unit_template_name = "deus_belakor_locus"
		local pickup_settings = AllPickups.deus_02
		local extension_init_data = {}

		table.merge_recursive(extension_init_data, pickup_settings.additional_data_husk)

		return unit_template_name, extension_init_data
	end,
	belakor_crystal = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
		local extension_init_data = {
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}
		}
		local unit_template_name = "belakor_crystal"

		return unit_template_name, extension_init_data
	end,
	belakor_crystal_throw = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
		local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
		local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
		local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
		local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
		local extension_init_data = {
			projectile_locomotion_system = {
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity
			},
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}
		}
		local unit_template_name = "belakor_crystal_throw"

		return unit_template_name, extension_init_data
	end,
	belakor_totem = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local breed_name_id = GameSession.game_object_field(game_session, game_object_id, "breed_name")
		local side_id = GameSession.game_object_field(game_session, game_object_id, "side_id")
		local health = GameSession.game_object_field(game_session, game_object_id, "health")
		local breed_name = NetworkLookup.breeds[breed_name_id]
		local breed = Breeds[breed_name]

		Unit.set_data(unit, "breed", breed)

		local extension_init_data = {
			ai_system = {
				go_id = game_object_id,
				game = game_session,
				side_id = side_id
			},
			health_system = {
				health = health
			},
			death_system = {
				is_husk = true
			},
			hit_reaction_system = {
				is_husk = true
			},
			dialogue_system = {
				faction = "enemy",
				breed_name = breed_name
			},
			proximity_system = {
				breed = breed
			}
		}
		local is_husk = true

		breed:modify_extension_init_data(is_husk, extension_init_data)

		local unit_template_name = breed.unit_template

		return unit_template_name, extension_init_data
	end,
	shadow_homing_skulls_spawner = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local extension_init_data = {}
		local unit_template_name = "shadow_homing_skulls_spawner"

		return unit_template_name, extension_init_data
	end,
	belakor_crystal_socket = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local extension_init_data = {
			objective_socket_system = {
				use_game_object_id = true
			}
		}
		local unit_template_name = "belakor_crystal_socket"

		return unit_template_name, extension_init_data
	end
}
settings.game_object_templates = {
	orb_pickup_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	shadow_dagger_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	shadow_skull_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	arena_belakor_big_statue_health = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = false,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	deus_belakor_locus = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	belakor_crystal = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	belakor_crystal_throw = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	belakor_totem = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	shadow_homing_skulls_spawner = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	},
	belakor_crystal_socket = {
		game_object_created_func_name = "game_object_created_network_unit",
		syncs_position = true,
		syncs_rotation = true,
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false
	}
}
settings.entity_extensions = {
	"scripts/unit_extensions/ai_supplementary/shadow_dagger_spawner_extension",
	"scripts/unit_extensions/ai_supplementary/shadow_homing_skulls_spawner_extension",
	"scripts/unit_extensions/ai_supplementary/shadow_dagger_extension",
	"scripts/unit_extensions/deus/deus_belakor_locus_extension",
	"scripts/unit_extensions/deus/deus_arena_belakor_big_statue_extension",
	"scripts/unit_extensions/deus/deus_belakor_crystal_extension",
	"scripts/unit_extensions/deus/deus_belakor_totem_extension",
	"scripts/unit_extensions/deus/deus_belakor_statue_socket_extension",
	"scripts/unit_extensions/generic/kill_volume_handler_extension"
}
settings.systems = {
	"scripts/entity_system/systems/orb/orb_system"
}
settings.entity_system_params = {
	shadow_homing_skulls_spawner_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "shadow_homing_skulls_spawner_system",
		extension_list = {
			"ShadowHomingSkullsSpawnerExtension"
		}
	},
	shadow_dagger_spawner_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "shadow_dagger_spawner_system",
		extension_list = {
			"ShadowDaggerSpawnerExtension"
		}
	},
	shadow_dagger_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "shadow_dagger_system",
		extension_list = {
			"ShadowDaggerExtension"
		}
	},
	deus_belakor_locus_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_belakor_locus_system",
		extension_list = {
			"DeusBelakorLocusExtension"
		}
	},
	deus_belakor_crystal_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_belakor_crystal_system",
		extension_list = {
			"DeusBelakorCrystalExtension"
		}
	},
	deus_arena_belakor_big_statue_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_arena_belakor_big_statue_system",
		extension_list = {
			"DeusArenaBelakorBigStatueExtension"
		}
	},
	deus_belakor_totem_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_belakor_totem_system",
		extension_list = {
			"DeusBelakorTotemExtension"
		}
	},
	deus_belakor_statue_socket_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_belakor_statue_socket_system",
		extension_list = {
			"DeusBelakorStatueSocketExtension"
		}
	},
	orb_system = {
		system_class_name = "OrbSystem",
		system_name = "orb_system",
		extension_list = {}
	},
	kill_volume_handler_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "kill_volume_handler_system",
		extension_list = {
			"KillVolumeHandlerExtension"
		}
	}
}
settings.network_damage_sources = {
	"tiny_explosive_barrel"
}
settings.network_go_types = {
	"orb_pickup_unit",
	"shadow_dagger_spawner",
	"shadow_dagger_unit",
	"arena_belakor_big_statue_health",
	"deus_belakor_locus",
	"belakor_crystal",
	"belakor_crystal_throw",
	"belakor_totem",
	"shadow_homing_skulls_spawner",
	"shadow_skull_unit",
	"belakor_crystal_socket"
}
settings.mutators = {
	"challenge_test",
	"arena_belakor_script",
	"curse_belakors_shadows",
	"curse_shadow_daggers",
	"curse_shadow_homing_skulls",
	"curse_belakor_totems",
	"curse_grey_wings"
}
settings.network_packages = {
	"resource_packages/mutators/mutator_curse_shadow_daggers",
	"resource_packages/mutators/mutator_curse_shadow_homing_skulls",
	"resource_packages/mutators/mutator_curse_belakor_totems",
	"resource_packages/mutators/mutator_curse_grey_wings"
}
settings.effects = {
	"fx/cursed_chest_spawn_01_portal",
	"fx/blk_grey_wings_01",
	"fx/blk_grey_wings_spawn_01",
	"fx/blk_grey_wings_teleport_01",
	"fx/blk_grey_wings_teleport_direction_01",
	"fx/trail_locus"
}
settings.dialogue_event_data_lookup = {
	"belakor_crystal"
}
settings.ai_group_templates = {
	deus_belakor_locus_cultists = {
		setup_group = function (world, nav_world, group, first_unit)
			group.idle = true
		end,
		init = function (world, nav_world, group, t)
			return
		end,
		update = function (world, nav_world, group, t)
			return
		end,
		destroy = function (world, nav_world, group)
			Managers.state.event:trigger("deus_belakor_locus_cultists_killed", group.id)
		end,
		wake_up_group = function (group, prime_target_unit)
			group.idle = false

			Managers.state.event:trigger("deus_belakor_locus_cultists_aggroed", group.id)
			Managers.state.entity:system("ai_group_system"):run_func_on_all_members(group, AIGroupTemplates.deus_belakor_locus_cultists.wake_up_unit, prime_target_unit)
		end,
		wake_up_unit = function (unit, group, prime_target_unit)
			Managers.state.network:anim_event(unit, "idle")

			local ai_simple = ScriptUnit.extension(unit, "ai_system")

			ai_simple:enemy_aggro(nil, prime_target_unit)

			local breed = ai_simple._breed

			ai_simple:set_perception(breed.perception, breed.target_selection)

			local blackboard = BLACKBOARDS[unit]
			blackboard.ignore_interest_points = false
			blackboard.only_trust_your_own_eyes = false
			local optional_spawn_data = blackboard.optional_spawn_data

			if optional_spawn_data then
				optional_spawn_data.idle_animation = nil
			end
		end
	}
}
settings.death_reactions = {
	"scripts/settings/dlcs/belakor/belakor_death_reactions"
}
settings.interactions = {
	"deus_belakor_locus_pre_crystal",
	"deus_belakor_locus_with_crystal"
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/belakor/belakor_interactions"
}
settings.hit_effects = {
	"scripts/settings/hit_effects/hit_effects_shadow_totem",
	"scripts/settings/hit_effects/hit_effects_shadow_skull"
}

return
