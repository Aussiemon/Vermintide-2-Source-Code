-- chunkname: @scripts/settings/dlcs/woods/woods_common_settings.lua

local settings = DLCSettings.woods

settings.career_setting_files = {
	"scripts/settings/dlcs/woods/career_settings_woods",
}
settings.player_breeds = {
	"scripts/settings/dlcs/woods/player_breeds_woods",
}
settings.career_ability_settings = {
	"scripts/settings/dlcs/woods/career_ability_settings_woods",
}
settings.action_template_files = {
	"scripts/settings/dlcs/woods/action_templates_woods",
}
settings.talent_settings = {
	"scripts/settings/dlcs/woods/talent_settings_woods",
}
settings.profile_files = {
	"scripts/settings/dlcs/woods/woods_profiles",
}
settings.death_reactions = {
	"scripts/settings/dlcs/woods/woods_death_reactions",
}
settings.spawn_unit_templates = "scripts/settings/dlcs/woods/woods_spawn_unit_templates"
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_woods",
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/woods/woods_unit_extension_templates",
}
settings.statistics_lookup = {
	"woods_javelin_melee_kills",
	"woods_lift_kills",
	"woods_javelin_combo",
	"woods_triple_lift",
	"woods_heal_grind",
	"woods_amount_healed",
	"woods_wall_kill_grind",
	"woods_wall_kill",
	"woods_bleed_grind",
	"woods_bleed_tics",
	"woods_chaos_pinata",
	"woods_bleed_boss",
	"woods_wall_kill_gutter",
	"woods_ability_combo",
	"woods_wall_tank",
	"woods_wall_hits_soaked",
	"woods_wall_block_ratling",
	"woods_ratling_shots_soaked",
	"woods_wall_dual_save",
	"woods_free_ability_grind",
	"woods_free_abilities_used",
}
settings.anim_lookup = {
	"thorn_ability_start",
	"thorn_ability_cancel",
	"thorn_ability_flip",
	"thorn_ability_cast",
	"thorn_ability_flip_back",
	"attack_chain_01",
	"attack_chain_02",
	"attack_chain_03",
	"attack_throw_last",
	"overcharge_end",
	"sot_landing",
	"to_javelin",
	"to_javelin_noammo",
}
settings.effects = {
	"fx/magic_thorn_sister_finger_trail",
	"fx/magic_thorn_sister_finger_trail_3p",
	"fx/magic_thorn_sister_finger_trail_long",
	"fx/magic_thorn_sister_finger_trail_medium",
	"fx/lifestaff_idle",
	"fx/lifestaff_trail",
	"fx/lifestaff_trail_3p",
	"fx/lifestaff_impact",
	"fx/thornsister_buff",
	"fx/thornsister_overcharge",
	"fx/thornsister_spirits",
	"fx/thorn_wall_aura",
	"fx/thorn_leaves",
	"fx/thorn_indicator",
	"fx/javelin_trail",
	"fx/thornsister_buff_screenspace",
	"fx/thornsister_overcharge_explosion",
	"fx/thornsister_vine_trail",
	"fx/thornsister_overcharge_explosion_3p",
}
settings.material_effect_mappings_file_names = {
	"scripts/settings/material_effect_mappings_woods",
}
settings._tracked_weapon_kill_stats = {}
settings.unlock_settings = {
	woods = {
		class = "UnlockDlc",
		id = "1629000",
		requires_restart = true,
	},
	woods_upgrade = {
		class = "UnlockDlc",
		id = "1629010",
		requires_restart = true,
	},
}
settings.unlock_settings_xb1 = {
	woods = {
		backend_reward_id = "woods",
		class = "UnlockDlc",
		id = "47365039-5234-3046-C035-4B5831583300",
		requires_restart = true,
	},
	woods_upgrade = {
		backend_reward_id = "woods_upgrade",
		class = "UnlockDlc",
		id = "47365039-5234-3046-C035-4B5831583300",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		woods = {
			backend_reward_id = "woods",
			class = "UnlockDlc",
			id = "6925f575a58740ef84ac8031ccaabfe8",
			product_label = "V2USSISTERTHORNK",
			requires_restart = true,
		},
		woods_upgrade = {
			backend_reward_id = "woods_upgrade",
			class = "UnlockDlc",
			id = "6925f575a58740ef84ac8031ccaabfe8",
			product_label = "V2USSISTERTHORNK",
		},
	},
	CUSA13645_00 = {
		woods = {
			backend_reward_id = "woods",
			class = "UnlockDlc",
			id = "c8ae619a4d82456486e5bae83c206057",
			product_label = "V2EUSISTERTHORNK",
			requires_restart = true,
		},
		woods_upgrade = {
			backend_reward_id = "woods_upgrade",
			class = "UnlockDlc",
			id = "c8ae619a4d82456486e5bae83c206057",
			product_label = "V2EUSISTERTHORNK",
		},
	},
}
settings.store_layout = {
	structure = {
		cosmetics = {
			kerillian = {
				thornsister = {
					weapon_skins = "item_details",
				},
			},
		},
	},
	pages = {
		thornsister = {
			category_button_texture = "store_category_icon_kerillian_thornsister",
			display_name = "we_thornsister",
			item_filter = "can_wield_we_thornsister",
			layout = "category",
			sort_order = 3,
			sound_event_enter = "Play_hud_store_category_button",
		},
	},
}
settings.prop_extension = {
	"ThornSisterWallExtension",
}
settings.area_damage_extension = {
	"SummonedVortexExtension",
	"SummonedVortexHuskExtension",
}
settings.entity_extensions = {
	"scripts/settings/dlcs/woods/thornsister_wall_extension",
	"scripts/settings/dlcs/woods/summoned_vortex_extension",
	"scripts/settings/dlcs/woods/summoned_vortex_husk_extension",
}
settings.health_extension_files = {
	"scripts/settings/dlcs/woods/thorn_wall_health_extension",
}
settings.health_extensions = {
	"ThornWallHealthExtension",
}
settings.network_damage_types = {
	"burst_thorn",
}
settings.dot_type_lookup = {
	thorn_sister_passive_poison = "poison_dot",
	thorn_sister_passive_poison_improved = "poison_dot",
	thorn_sister_wall_bleed = "poison_dot",
	weapon_bleed_dot_javelin = "poison_dot",
}
settings.progression_unlocks = {
	we_thornsister = {
		description = "end_screen_career_unlocked",
		level_requirement = 0,
		profile = "wood_elf",
		title = "we_thornsister",
		unlock_type = "career",
		value = "we_thornsister",
	},
}
settings.network_go_types = {
	"thornsister_thorn_wall_unit",
	"vortex_unit",
}
settings.game_object_templates = {
	thornsister_thorn_wall_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
	vortex_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_yaw = true,
	},
}
settings.game_object_initializers = {
	thornsister_thorn_wall_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")
		local aoe_dot_damage = area_damage_extension.aoe_dot_damage
		local aoe_init_damage = area_damage_extension.aoe_init_damage
		local aoe_dot_damage_interval = area_damage_extension.aoe_dot_damage_interval
		local radius = area_damage_extension.radius
		local life_time = area_damage_extension.life_time
		local player_screen_effect_name = area_damage_extension.player_screen_effect_name
		local dot_effect_name = area_damage_extension.dot_effect_name
		local area_damage_template = area_damage_extension.area_damage_template
		local invisible_unit = area_damage_extension.invisible_unit
		local extra_dot_effect_name = area_damage_extension.extra_dot_effect_name
		local explosion_template_name = area_damage_extension.explosion_template_name
		local owner_player = area_damage_extension.owner_player

		if dot_effect_name == nil then
			dot_effect_name = "n/a"
		end

		if extra_dot_effect_name == nil then
			extra_dot_effect_name = "n/a"
		end

		if explosion_template_name == nil then
			explosion_template_name = "n/a"
		end

		if player_screen_effect_name == nil then
			player_screen_effect_name = "n/a"
		end

		local owner_player_id = NetworkConstants.invalid_game_object_id

		if owner_player then
			owner_player_id = owner_player.game_object_id
		end

		local wall_extension = ScriptUnit.extension(unit, "props_system")
		local wall_index = wall_extension.wall_index
		local group_spawn_index = wall_extension.group_spawn_index
		local source_unit = wall_extension:owner()
		local source_unit_id = source_unit and Managers.state.unit_storage:go_id(source_unit) or NetworkConstants.invalid_game_object_id
		local data_table = {
			go_type = NetworkLookup.go_types.thornsister_thorn_wall_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			aoe_dot_damage = aoe_dot_damage,
			aoe_init_damage = aoe_init_damage,
			aoe_dot_damage_interval = aoe_dot_damage_interval,
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			radius = radius,
			life_time = life_time,
			player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name],
			dot_effect_name = NetworkLookup.effects[dot_effect_name],
			extra_dot_effect_name = NetworkLookup.effects[extra_dot_effect_name],
			invisible_unit = invisible_unit,
			area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
			explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name],
			owner_player_id = owner_player_id,
			health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
			wall_index = wall_index,
			group_spawn_index = group_spawn_index,
			owner_unit_id = source_unit_id,
		}

		return data_table
	end,
	vortex_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local mover = Unit.mover(unit)
		local vortex_extension = ScriptUnit.has_extension(unit, "area_damage_system")
		local inner_decal_unit = vortex_extension._inner_decal_unit
		local inner_decal_unit_id = NetworkConstants.invalid_game_object_id

		if Unit.alive(inner_decal_unit) then
			inner_decal_unit_id = Managers.state.network:unit_game_object_id(inner_decal_unit)
		end

		local outer_decal_unit = vortex_extension._outer_decal_unit
		local outer_decal_unit_id = NetworkConstants.invalid_game_object_id

		if Unit.alive(outer_decal_unit) then
			outer_decal_unit_id = Managers.state.network:unit_game_object_id(outer_decal_unit)
		end

		local owner_unit = vortex_extension._owner_unit
		local owner_unit_id = NetworkConstants.invalid_game_object_id

		if Unit.alive(owner_unit) then
			owner_unit_id = Managers.state.network:unit_game_object_id(owner_unit)
		end

		local target_unit = vortex_extension.target_unit
		local target_unit_id = NetworkConstants.invalid_game_object_id

		if Unit.alive(target_unit) then
			target_unit_id = Managers.state.network:unit_game_object_id(target_unit)
		end

		local side_id = Managers.state.side.side_by_unit[owner_unit].side_id
		local data_table = {
			fx_radius_percentage = 1,
			height_percentage = 1,
			inner_radius_percentage = 1,
			go_type = NetworkLookup.go_types.vortex_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			position = mover and Mover.position(mover) or Unit.local_position(unit, 0),
			yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
			velocity = Vector3(0, 0, 0),
			vortex_template_id = NetworkLookup.vortex_templates[vortex_extension.vortex_template_name],
			inner_decal_unit_id = inner_decal_unit_id,
			outer_decal_unit_id = outer_decal_unit_id,
			owner_unit_id = owner_unit_id,
			side_id = side_id,
			target_unit_id = target_unit_id,
		}

		return data_table
	end,
}
settings.game_object_extractors = {
	thornsister_thorn_wall_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local aoe_dot_damage = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage")
		local aoe_init_damage = GameSession.game_object_field(game_session, go_id, "aoe_init_damage")
		local aoe_dot_damage_interval = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage_interval")
		local radius = GameSession.game_object_field(game_session, go_id, "radius")
		local life_time = GameSession.game_object_field(game_session, go_id, "life_time")
		local player_screen_effect_name = GameSession.game_object_field(game_session, go_id, "player_screen_effect_name")
		local dot_effect_name = GameSession.game_object_field(game_session, go_id, "dot_effect_name")
		local area_damage_template = GameSession.game_object_field(game_session, go_id, "area_damage_template")
		local invisible_unit = GameSession.game_object_field(game_session, go_id, "invisible_unit")
		local extra_dot_effect_name = GameSession.game_object_field(game_session, go_id, "extra_dot_effect_name")
		local explosion_template_name = GameSession.game_object_field(game_session, go_id, "explosion_template_name")
		local owner_player_id = GameSession.game_object_field(game_session, go_id, "owner_player_id")
		local health = GameSession.game_object_field(game_session, go_id, "health")
		local wall_index = GameSession.game_object_field(game_session, go_id, "wall_index")
		local source_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit_id")

		extra_dot_effect_name = NetworkLookup.effects[extra_dot_effect_name]

		if extra_dot_effect_name == "n/a" then
			extra_dot_effect_name = nil
		end

		explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name]

		if explosion_template_name == "n/a" then
			explosion_template_name = nil
		end

		player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name]

		if player_screen_effect_name == "n/a" then
			player_screen_effect_name = nil
		end

		dot_effect_name = NetworkLookup.effects[dot_effect_name]

		if dot_effect_name == "n/a" then
			dot_effect_name = nil
		end

		local nav_mesh_effect

		if explosion_template_name then
			local template = ExplosionUtils.get_template(explosion_template_name)

			if template then
				local aoe_data = template.aoe

				nav_mesh_effect = aoe_data.nav_mesh_effect
			end
		end

		local owner_player

		if owner_player_id ~= NetworkConstants.invalid_game_object_id then
			owner_player = Managers.player:player_from_game_object_id(owner_player_id)
		end

		local source_unit

		if source_unit_id ~= NetworkConstants.invalid_game_object_id then
			source_unit = Managers.state.unit_storage:unit(source_unit_id)
		end

		local extension_init_data = {
			area_damage_system = {
				aoe_dot_damage = aoe_dot_damage,
				aoe_init_damage = aoe_init_damage,
				aoe_dot_damage_interval = aoe_dot_damage_interval,
				radius = radius,
				life_time = life_time,
				invisible_unit = invisible_unit,
				player_screen_effect_name = player_screen_effect_name,
				dot_effect_name = dot_effect_name,
				nav_mesh_effect = nav_mesh_effect,
				extra_dot_effect_name = extra_dot_effect_name,
				area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
				explosion_template_name = explosion_template_name,
				source_attacker_unit = source_unit,
			},
			props_system = {
				life_time = life_time,
				owner_unit = source_unit,
				wall_index = wall_index,
			},
			health_system = {
				health = health,
			},
			death_system = {
				death_reaction_template = "thorn_wall",
				is_husk = true,
			},
			hit_reaction_system = {
				hit_reaction_template = "level_object",
				is_husk = true,
			},
		}
		local unit_template_name = "thornsister_thorn_wall_unit"

		return unit_template_name, extension_init_data
	end,
	vortex_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local vortex_template_id = GameSession.game_object_field(game_session, game_object_id, "vortex_template_id")
		local vortex_template_name = NetworkLookup.vortex_templates[vortex_template_id]
		local inner_decal_unit_id = GameSession.game_object_field(game_session, game_object_id, "inner_decal_unit_id")
		local inner_decal_unit = Managers.state.unit_storage:unit(inner_decal_unit_id)
		local outer_decal_unit_id = GameSession.game_object_field(game_session, game_object_id, "outer_decal_unit_id")
		local outer_decal_unit = Managers.state.unit_storage:unit(outer_decal_unit_id)
		local owner_unit_id = GameSession.game_object_field(game_session, game_object_id, "owner_unit_id")
		local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)
		local side_id = GameSession.game_object_field(game_session, game_object_id, "side_id")
		local target_unit_id = GameSession.game_object_field(game_session, game_object_id, "target_unit_id")
		local target_unit = Managers.state.unit_storage:unit(target_unit_id)
		local extension_init_data = {
			area_damage_system = {
				vortex_template_name = vortex_template_name,
				inner_decal_unit = inner_decal_unit,
				outer_decal_unit = outer_decal_unit,
				owner_unit = owner_unit,
				side_id = side_id,
				target_unit = target_unit,
			},
		}
		local unit_template_name = "vortex_unit"

		return unit_template_name, extension_init_data
	end,
}
