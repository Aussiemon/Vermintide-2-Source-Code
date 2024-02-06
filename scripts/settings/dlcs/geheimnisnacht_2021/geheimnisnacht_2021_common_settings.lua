-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_common_settings.lua

local settings = DLCSettings.geheimnisnacht_2021

settings.live_events_packages = {
	geheimnisnacht_2021 = {
		resource_packages = {
			"resource_packages/dlcs/geheimnisnacht_2021_event",
		},
	},
}
settings.anim_lookup = {
	"idle_pray_01",
	"idle_pray_02",
	"idle_pray_03",
	"idle_pray_04",
	"idle_pray_05",
	"to_ritual_skull",
}
settings.effects = {}
settings.unlock_settings = {}
settings.dialogue_lookup = {}
settings.dialogue_settings = {}
settings.auto_load_files = {}
settings.network_packages = {
	"resource_packages/dlcs/geheimnisnacht_2021_event",
}
settings.network_sound_events = {
	"enemy_skaven_halloween_ritual_loop",
	"enemy_skaven_halloween_ritual_loop_stop",
	"enemy_marauder_halloween_ritual_loop",
	"enemy_marauder_halloween_ritual_loop_stop",
	"halloween_event_ritual_loop",
	"halloween_event_ritual_loop_stop",
	"Play_event_stinger_geheimnisnacht_ritual_broken",
}
settings.entity_extensions = {
	"scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_altar_extension",
}
settings.prop_extension = {
	"Geheimnisnacht2021AltarExtension",
}
settings.death_reactions = {
	"scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_death_reactions",
}
settings.interactions = {
	"geheimnisnacht_2021_altar",
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_interactions",
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_unit_extension_templates",
}
settings.husk_lookup = {
	"units/gameplay/ritual_site_01",
	"units/weapons/player/pup_ritual_site_01/pup_ritual_site_01",
}
settings.generic_terror_event_files = {
	"scripts/settings/dlcs/geheimnisnacht_2021/geheimnisnacht_2021_generic_terror_events",
}
settings.mutators = {
	"geheimnisnacht_2021",
	"geheimnisnacht_2021_hard_mode",
}
settings.missions = {
	mission_geheimnisnacht_2021_event = {
		mission_template_name = "goal",
		text = "mission_geheimnisnacht_2021_event",
	},
}
settings.network_go_types = {
	"geheimnisnacht_2021_altar",
}
settings.item_master_list_file_names = {
	"scripts/settings/dlcs/geheimnisnacht_2021/item_master_list_geheimnisnacht_2021",
}
settings.weapon_skins_file_names = {
	"scripts/settings/dlcs/geheimnisnacht_2021/weapon_skins_geheimnisnacht_2021",
}
settings.pickups = {
	level_events = {
		geheimnisnacht_2021_side_objective = {
			debug_pickup_category = "special",
			disallow_bot_pickup = true,
			hud_description = "chaos_artifact",
			individual_pickup = false,
			item_description = "chaos_artifact",
			item_name = "wpn_geheimnisnacht_2021_side_objective",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_medkit",
			slot_name = "slot_potion",
			spawn_weighting = 1,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_ritual_site_01/pup_ritual_site_01",
		},
	},
}
settings.action_template_file_names = {
	"scripts/settings/dlcs/geheimnisnacht_2021/action_throw_geheimnisnacht_2021",
	"scripts/settings/dlcs/geheimnisnacht_2021/action_inspect_geheimnisnacht_2021",
}
settings.action_classes_lookup = {
	inspect_geheimnisnacht_2021 = "ActionInspectGeheimnisnacht2021",
	throw_geheimnisnacht_2021 = "ActionThrowGeheimnisnacht2021",
}
settings.game_object_templates = {
	geheimnisnacht_2021_altar = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		syncs_position = true,
		syncs_rotation = true,
	},
}
settings.game_object_initializers = {
	geheimnisnacht_2021_altar = function (unit, unit_name, unit_template, gameobject_functor_context)
		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local altar_extension = ScriptUnit.has_extension(unit, "props_system")
		local data_table = {
			go_type = NetworkLookup.go_types.geheimnisnacht_2021_altar,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			health = health_extension:get_max_health(),
			state = altar_extension:get_current_state(),
		}

		return data_table
	end,
}
settings.game_object_extractors = {
	geheimnisnacht_2021_altar = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local health = GameSession.game_object_field(game_session, game_object_id, "health")
		local state = GameSession.game_object_field(game_session, game_object_id, "state")
		local unit_template_name = "geheimnisnacht_2021_altar"
		local extension_init_data = {
			health_system = {
				health = health,
			},
			death_system = {
				death_reaction_template = "geheimnisnacht_2021_altar",
				is_husk = true,
			},
			hit_reaction_system = {
				hit_reaction_template = "level_object",
				is_husk = true,
			},
			props_system = {
				state = state,
			},
		}

		return unit_template_name, extension_init_data
	end,
}
settings.ai_group_templates = {
	geheimnisnacht_2021_altar_cultists = {
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
			Managers.state.event:trigger("geheimnisnacht_2021_altar_cultists_killed", group.id)
		end,
		wake_up_group = function (group, prime_target_unit)
			group.idle = false, Managers.state.event:trigger("geheimnisnacht_2021_altar_cultists_aggroed", group.id)

			Managers.state.entity:system("ai_group_system"):run_func_on_all_members(group, AIGroupTemplates.geheimnisnacht_2021_altar_cultists.wake_up_unit, prime_target_unit)
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
		end,
	},
	critter_nurglings = {
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
		wake_up_group = function (group)
			Managers.state.entity:system("ai_group_system"):run_func_on_all_members(group, AIGroupTemplates.critter_nurglings.wake_up_unit)
		end,
		wake_up_unit = function (unit, group)
			local blackboard = BLACKBOARDS[unit]

			blackboard.is_fleeing = true
		end,
	},
}
