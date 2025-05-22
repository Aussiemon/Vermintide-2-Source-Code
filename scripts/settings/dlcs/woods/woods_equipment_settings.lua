-- chunkname: @scripts/settings/dlcs/woods/woods_equipment_settings.lua

local settings = DLCSettings.woods

settings.item_master_list_file_names = {
	"scripts/settings/dlcs/woods/item_master_list_woods",
}
settings.weapon_skins_file_names = {
	"scripts/settings/dlcs/woods/weapon_skins_woods",
}
settings.cosmetics_files = {
	"scripts/settings/dlcs/woods/cosmetics_woods",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/we_thornsister_career_skill",
	"scripts/settings/equipment/weapon_templates/javelin",
	"scripts/settings/equipment/weapon_templates/staff_life",
}
settings.default_items = {
	we_javelin = {
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "we_javelin_blacksmith_name",
	},
	we_life_staff = {
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "we_life_staff_blacksmith_name",
	},
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_woods",
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_woods",
}
settings.action_template_file_names = {
	"scripts/settings/dlcs/woods/action_career_we_thornsister_wall",
	"scripts/settings/dlcs/woods/action_career_we_thornsister_stagger",
	"scripts/settings/dlcs/woods/action_career_we_thornsister_target_wall",
	"scripts/settings/dlcs/woods/action_career_we_thornsister_target_stagger",
	"scripts/settings/dlcs/woods/action_rail_gun",
	"scripts/settings/dlcs/woods/action_spirit_storm",
}
settings.action_classes_lookup = {
	career_we_thornsister_stagger = "ActionCareerWEThornsisterStagger",
	career_we_thornsister_target_stagger = "ActionCareerWEThornsisterTargetStagger",
	career_we_thornsister_target_wall = "ActionCareerWEThornsisterTargetWall",
	career_we_thornsister_wall = "ActionCareerWEThornsisterWall",
	rail_gun = "ActionRailGun",
	spirit_storm = "ActionSpiritStorm",
}
settings.inventory_package_list = {
	"resource_packages/careers/we_thornsister",
	"units/beings/player/way_watcher_thornsister/first_person_base/chr_first_person_mesh",
	"units/beings/player/way_watcher_thornsister/third_person_base/chr_third_person_mesh",
	"units/beings/player/way_watcher_thornsister/skins/black_and_gold/chr_way_watcher_thornsister_black_and_gold",
	"units/beings/player/way_watcher_thornsister/skins/blue/chr_way_watcher_thornsister_blue",
	"units/beings/player/way_watcher_thornsister/skins/green/chr_way_watcher_thornsister_green",
	"units/beings/player/way_watcher_thornsister/skins/redblack/chr_way_watcher_thornsister_redblack",
	"units/beings/player/way_watcher_thornsister/skins/white/chr_way_watcher_thornsister_white",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_3p",
	"units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_3ps",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_runed",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_runed_3p",
	"units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_runed_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_runed_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_magic_3ps",
	"units/weapons/player/wpn_we_life_staff_01/wpn_we_life_staff_01",
	"units/weapons/player/wpn_we_life_staff_01/wpn_we_life_staff_01_3p",
	"units/weapons/player/wpn_we_life_staff_01/prj_we_life_staff_01_3ps",
	"units/weapons/player/wpn_we_life_staff_01/wpn_we_life_staff_01_runed",
	"units/weapons/player/wpn_we_life_staff_01/wpn_we_life_staff_01_runed_3p",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_3p",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_runed",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_runed_3p",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_magic",
	"units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_magic_3p",
	"units/beings/player/way_watcher_thornsister/headpiece/ww_t_hat_01",
	"units/beings/player/way_watcher_thornsister/headpiece/ww_t_hat_02",
	"units/beings/player/way_watcher_thornsister/headpiece/ww_t_hat_03",
	"units/beings/player/way_watcher_thornsister/headpiece/ww_t_hat_04",
	"units/beings/player/way_watcher_thornsister/headpiece/ww_t_fatshark_hat_01",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01_bleed",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wave_01",
}
settings.husk_lookup = {
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_3p",
	"units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_3ps",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_runed",
	"units/weapons/player/wpn_we_javelin_01/wpn_we_javelin_01_runed_3p",
	"units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_runed_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_runed_3ps",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic",
	"units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic_3p",
	"units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_magic_3ps",
	"units/weapons/player/wpn_we_life_staff_01/prj_we_life_staff_01_3ps",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01_bleed",
	"units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wave_01",
}
settings.projectile_units = {
	javelin = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_3ps",
	},
	javelin_02 = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_3ps",
	},
	javelin_02_runed = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_runed_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_runed_3ps",
	},
	javelin_01_runed = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_runed_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_javelin_01/prj_we_javelin_01_runed_3ps",
	},
	javelin_02_magic = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_magic_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_javelin_02/prj_we_javelin_02_magic_3ps",
	},
	lifestaff_light = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_life_staff_01/prj_we_life_staff_01_3ps",
		projectile_unit_name = "units/weapons/player/wpn_we_life_staff_01/prj_we_life_staff_01_3ps",
	},
}
settings.projectile_gravity_settings = {
	javelin = -9.82,
}
settings.projectiles = {
	javelin = {
		gravity_settings = "javelin",
		impact_type = "sphere_sweep",
		indexed = true,
		linear_dampening = 0.691,
		projectile_unit_template_name = "player_projectile_unit",
		projectile_units_template = "javelin",
		radius = 0.075,
		rotation_speed = 0,
		static_impact_type = "raycast",
		trajectory_template_name = "throw_trajectory",
		use_weapon_skin = true,
		bounce_angular_velocity = {
			3,
			-10,
			6,
		},
	},
	lifestaff_light = {
		gravity_settings = "bounty_hunter_shot",
		impact_type = "sphere_sweep",
		projectile_unit_template_name = "player_projectile_unit",
		projectile_units_template = "lifestaff_light",
		radius = 0.075,
		static_impact_type = "raycast",
		trajectory_template_name = "throw_trajectory",
		anim_blend_settings = {
			blend_time = 0.15,
			forward_offset = 0,
			link_node = "j_rightweaponattach",
			use_anim_rotation = false,
			blend_func = math.easeInCubic,
		},
	},
}
settings.explosion_templates = {
	we_thornsister_career_skill_wall_explosion = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			damage_profile = "thorn_wall_explosion",
			explosion_forward_scaling = 0.2,
			hit_sound_event = "thorn_wall_damage_light",
			hit_sound_event_cap = 1,
			no_friendly_fire = true,
			radius = 3.5,
			sound_event_name = "career_ability_kerillian_sister_wall_spawn",
			use_attacker_power_level = true,
		},
	},
	we_thornsister_career_skill_explosive_wall_explosion = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			damage_profile = "thorn_wall_explosion_improved_damage",
			dot_template_name = "thorn_sister_passive_poison",
			effect_name = "fx/thornwall_spike_damage",
			explosion_forward_scaling = 0.5,
			explosion_right_scaling = 0.1,
			hit_sound_event = "thorn_wall_damage_heavy",
			hit_sound_event_cap = 1,
			no_friendly_fire = true,
			radius = 4.5,
			sound_event_name = "career_ability_kerilian_sister_wall_spawn_damage",
			use_attacker_power_level = true,
		},
	},
	we_thornsister_career_skill_explosive_wall_explosion_improved = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			damage_profile = "thorn_wall_explosion_improved_damage",
			dot_template_name = "thorn_sister_passive_poison_improved",
			effect_name = "fx/thornwall_spike_damage",
			explosion_forward_scaling = 0.5,
			explosion_right_scaling = 0.1,
			hit_sound_event = "thorn_wall_damage_heavy",
			hit_sound_event_cap = 1,
			no_friendly_fire = true,
			radius = 4.5,
			sound_event_name = "career_ability_kerilian_sister_wall_spawn_damage",
			use_attacker_power_level = true,
		},
	},
	we_thornsister_career_skill_stagger_spell = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			damage_profile = "ability_push",
			explosion_cone_angle = 90,
			ignore_attacker_unit = true,
			max_damage_radius = 2,
			no_friendly_fire = true,
			no_prop_damage = true,
			only_line_of_sight = true,
			radius = 10,
			use_attacker_power_level = true,
		},
	},
	overcharge_explosion_sott = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			attack_template = "drakegun",
			damage_profile = "overcharge_explosion",
			damage_profile_glance = "overcharge_explosion_glance",
			effect_name = "fx/thornsister_overcharge_explosion",
			ignore_attacker_unit = true,
			max_damage_radius = 4,
			power_level = 500,
			radius = 5,
			sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
		},
	},
	kerillian_thorn_sister_talent_poison_aoe = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 3,
			damage_profile = "thorn_sister_talent_explosion",
			dot_template_name = "thorn_sister_passive_poison",
			effect_name = "fx/thornwall_poison_spikes",
			max_damage_radius_max = 2.5,
			max_damage_radius_min = 0.2,
			no_friendly_fire = true,
			radius_max = 2.5,
			radius_min = 0.2,
			sound_event_name = "thorn_hit_poison",
			use_attacker_power_level = true,
		},
	},
	kerillian_thorn_sister_talent_poison_aoe_improved = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 3,
			damage_profile = "thorn_sister_talent_explosion",
			dot_template_name = "thorn_sister_passive_poison_improved",
			effect_name = "fx/thornwall_poison_spikes",
			max_damage_radius_max = 2.5,
			max_damage_radius_min = 0.2,
			no_friendly_fire = true,
			radius_max = 2.5,
			radius_min = 0.2,
			sound_event_name = "thorn_hit_poison",
			use_attacker_power_level = true,
		},
	},
}
settings.area_damage_templates = {
	we_thornsister_thorn_wall = {
		server = {
			update = function (damage_source, unit, radius, damage, life_time, life_timer, damage_interval, damage_timer, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				return false
			end,
			do_damage = function (data, extension_unit)
				return
			end,
		},
		client = {
			update = function (world, radius, aoe_unit, player_screen_effect_name, player_unit_particles, aoe_dot_player_take_damage, explosion_template_name, slow_modifier)
				local side = Managers.state.side.side_by_unit[aoe_unit]

				if not side then
					return
				end

				local area_damage_position = POSITION_LOOKUP[aoe_unit]

				if not area_damage_position then
					return
				end

				local player_units = side.PLAYER_AND_BOT_UNITS

				for _, player_unit in pairs(player_units) do
					local unit_position = POSITION_LOOKUP[player_unit]

					if unit_position then
						local distance = Vector3.distance_squared(unit_position, area_damage_position)
						local is_inside_radius = distance < radius * radius

						if is_inside_radius then
							local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

							if buff_extension then
								buff_extension:add_buff("thorn_sister_wall_slow")
							end
						end
					end
				end
			end,
			spawn_effect = function (world, unit, effect_name, particle_var_table)
				local position = Unit.local_position(unit, 0)
				local effect_id = World.create_particles(world, effect_name, position)

				if particle_var_table ~= nil then
					for _, element in pairs(particle_var_table) do
						local effect_variable_id = World.find_particles_variable(world, effect_name, element.particle_variable)

						World.set_particles_variable(world, effect_id, effect_variable_id, element.value)
					end
				end

				return effect_id
			end,
			destroy = NOP,
		},
	},
}
settings.vortex_templates = {
	spirit_storm = {
		ai_ascension_speed = 1.5,
		ai_attract_speed = 20,
		ai_max_ascension_height = 1,
		ai_radius_change_speed = 1,
		ai_rotation_speed = 0.1,
		breed_name = "spirit_storm",
		damage = 5,
		full_fx_radius = 4,
		full_inner_radius = 1,
		full_outer_radius = 1.3,
		high_cost_nav_cost_map_cost_type = "vortex_danger_zone",
		inner_fx_name = "fx/thornsister_spirits",
		inner_fx_z_scale_multiplier = 0.3,
		keep_enemies_within_radius = 0,
		max_allowed_inner_radius_dist = 0.1,
		max_height = 3,
		max_height_player_target = 1.5,
		medium_cost_nav_cost_map_cost_type = "vortex_near",
		outer_fx_name = "fx/thornsister_spirits",
		outer_fx_z_scale_multiplier = 0.3,
		player_actions_allowed = false,
		player_ascend_speed = 5,
		player_attract_speed = 20,
		player_in_vortex_max_duration = 2,
		player_radius_change_speed = 1,
		player_rotation_speed = 0,
		start_sound_event_name = "weapon_life_staff_thorn_lift_wind_loop_start",
		stop_sound_event_name = "weapon_life_staff_thorn_lift_wind_loop_end",
		use_nav_cost_map_volumes = true,
		windup_time = 0,
		ai_eject_height = {
			5,
			5,
		},
		time_of_life = {
			8,
			8,
		},
		time_of_life_player_target = {
			2,
			2,
		},
		reduce_duration_per_breed = {
			chaos_bulwark = 0.5,
			chaos_warrior = 0.5,
		},
	},
}
