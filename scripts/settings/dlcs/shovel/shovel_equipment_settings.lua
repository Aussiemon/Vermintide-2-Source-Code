-- chunkname: @scripts/settings/dlcs/shovel/shovel_equipment_settings.lua

local settings = DLCSettings.shovel

settings.item_master_list_file_names = {
	"scripts/settings/dlcs/shovel/item_master_list_shovel",
}
settings.weapon_skins_file_names = {
	"scripts/settings/dlcs/shovel/weapon_skins_shovel",
}
settings.cosmetics_files = {
	"scripts/settings/dlcs/shovel/cosmetics_shovel",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/bw_necromancer_career_skill",
	"scripts/settings/equipment/weapon_templates/bw_necromancer_career_utility",
	"scripts/settings/equipment/weapon_templates/staff_scythe",
	"scripts/settings/equipment/weapon_templates/staff_necromancy",
	"scripts/settings/equipment/weapon_templates/staff_death",
}
settings.default_items = {
	bw_ghost_scythe = {
		description = "description_default_bw_ghost_scythe",
		display_name = "bw_ghost_scythe_blacksmith_name",
		inventory_icon = "icon_wpn_bw_ghost_scythe_01",
	},
	bw_necromancy_staff = {
		description = "description_default_bw_necromancy_staff",
		display_name = "bw_necromancy_staff_blacksmith_name",
		inventory_icon = "icon_wpn_bw_necromancy_staff_01",
	},
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_shovel",
}
settings.action_template_file_names = {
	"scripts/settings/dlcs/shovel/action_soul_drain",
	"scripts/settings/dlcs/shovel/action_detonate",
	"scripts/settings/dlcs/shovel/action_damage_target",
	"scripts/settings/dlcs/shovel/action_chained_projectile",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_targetting",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_wave",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_single_target",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_raise_dead",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_raise_dead_targeting",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_area",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_attack",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_vent",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_stand",
	"scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_stand_targeting",
}
settings.action_classes_lookup = {
	career_bw_necromancer_area = "ActionCareerBWNecromancerArea",
	career_bw_necromancer_command_attack = "ActionCareerBWNecromancerCommandAttack",
	career_bw_necromancer_command_stand = "ActionCareerBwNecromancerCommandStand",
	career_bw_necromancer_command_stand_targeting = "ActionCareerBwNecromancerCommandStandTargeting",
	career_bw_necromancer_command_vent = "ActionCareerBWNecromancerCommandVent",
	career_bw_necromancer_raise_dead = "ActionCareerBWNecromancerRaiseDead",
	career_bw_necromancer_raise_dead_targeting = "ActionCareerBWNecromancerRaiseDeadTargeting",
	career_bw_necromancer_single_target = "ActionCareerBWNecromancerSingleTarget",
	career_bw_necromancer_targetting = "ActionCareerBWNecromancerTargetting",
	career_bw_necromancer_wave = "ActionCareerBWNecromancerWave",
	chained_projectile = "ActionChainedProjectile",
	damage_target = "ActionDamageTarget",
	detonate = "ActionDetonate",
	soul_drain = "ActionSoulDrain",
}
settings.inventory_package_list = {
	"resource_packages/careers/bw_necromancer",
	"units/beings/player/bright_wizard_necromancer/first_person_base/chr_first_person_mesh",
	"units/beings/player/bright_wizard_necromancer/third_person_base/chr_third_person_mesh",
	"units/beings/player/bright_wizard_necromancer_skin_01/first_person_base/chr_first_person_mesh",
	"units/beings/player/bright_wizard_necromancer_skin_01/third_person_base/chr_third_person_mesh",
	"units/beings/player/bright_wizard_necromancer_skin_01/skins/variant_a/chr_bright_wizard_necromancer_skin_01_a",
	"units/beings/player/bright_wizard_necromancer_skin_02/first_person_base/chr_first_person_mesh",
	"units/beings/player/bright_wizard_necromancer_skin_02/third_person_base/chr_third_person_mesh",
	"units/beings/player/bright_wizard_necromancer/skins/white/chr_bright_wizard_necromancer_white",
	"units/beings/player/bright_wizard_necromancer/headpiece/bw_n_fatshark_hat_01",
	"units/beings/player/bright_wizard_necromancer/headpiece/bw_n_hat_01",
	"units/beings/player/bright_wizard_necromancer/headpiece/bw_n_hat_02",
	"units/beings/player/bright_wizard_necromancer/headpiece/bw_n_hat_03",
	"units/beings/player/bright_wizard_necromancer/headpiece/bw_n_hat_04",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_fire",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_fire_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_runed_01",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_runed_01_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_runed_01_fire",
	"units/weapons/player/wpn_bw_ghost_scythe_01/wpn_bw_ghost_scythe_01_runed_01_fire_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_fire",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_fire_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_fire",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_fire_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_3p",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_fire",
	"units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_fire_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_01",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_01_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_01_runed_01",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_01_runed_01_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_runed_01",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_runed_01_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_magic_01",
	"units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_magic_01_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_02",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_02_3p",
	"units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_03",
	"units/weapons/player/wpn_bw_necromancer_ability/wpn_bw_necromancer_ability",
	"units/weapons/player/wpn_bw_necromancer_ability/wpn_bw_necromancer_ability_3p",
	"units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull",
	"units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull_3p",
	"units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull_3ps",
	"units/beings/player/bright_wizard_necromancer/talents/trapped_soul_skull",
}
settings.projectile_units = {
	necrostaff_skull = {
		projectile_unit_name = "units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull_3ps",
	},
	necromancer_curse_spirit = {
		projectile_unit_name = "units/weapons/player/wpn_bw_necromancy_staff_01/wpn_bw_necromancy_staff_projectile_03",
	},
}
settings.projectiles = {
	skull = {
		fire_from_muzzle = false,
		forced_hitzone = "torso",
		gravity_settings = "drake_pistols",
		impact_type = "sphere_sweep",
		indexed = true,
		muzzle_name = "fx_01",
		projectile_unit_template_name = "sticky_projectile_unit",
		projectile_units_template = "necrostaff_skull",
		radius = 0.2,
		static_impact_type = "sphere_sweep",
		trajectory_template_name = "throw_trajectory",
		unit_life_time = math.huge,
		anim_blend_settings = {
			blend_time = 0.35,
			forward_offset = 0,
			link_node = "a_effects_plane",
			use_anim_rotation = false,
			blend_func = function (t)
				return t < 0.5 and 0 or math.easeOutCubic((t - 0.5) * 2)
			end,
		},
		external_events = {
			detonate = function (projectile_ext)
				if projectile_ext._life_time <= 0 then
					return
				end

				projectile_ext._life_time = 0

				if not projectile_ext.is_husk then
					local charge_data = projectile_ext.charge_data
					local aoe_data = projectile_ext.is_charged and charge_data.charged_aoe or charge_data.aoe

					if aoe_data then
						local position = POSITION_LOOKUP[projectile_ext._projectile_unit]

						projectile_ext:do_aoe(aoe_data, position, true)
					end
				end
			end,
		},
	},
}
settings.explosion_templates = {
	sienna_necromancer_passive_explosion = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 15,
			damage_profile = "sienna_necromancer_blood_explosion",
			effect_name = "fx/wpnfx_skull_explosion_big_3p",
			max_damage_radius = 2.5,
			no_friendly_fire = true,
			no_prop_damage = true,
			radius = 3.5,
			sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
			use_attacker_power_level = true,
			server_hit_func = function (hit_unit, damage_source, attacking_unit, impact_position, explosion_data)
				if not ALIVE[hit_unit] then
					return
				end
			end,
		},
	},
	skull_detonation = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			attacker_power_level_offset = 0.25,
			damage_profile = "skull_detonation",
			damage_profile_glance = "skull_detonation",
			effect_name = "fx/wpnfx_skull_explosion_3p",
			max_damage_radius_max = 1.5,
			max_damage_radius_min = 1.5,
			radius_max = 1.5,
			radius_min = 1.5,
			sound_event_name = "weapon_sienna_necro_staff_projectile_explode",
			use_attacker_power_level = true,
		},
	},
	skull_detonation_charged = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			attacker_power_level_offset = 0.2,
			damage_profile = "skull_detonation_charged",
			damage_profile_glance = "skull_detonation_charged",
			effect_name = "fx/wpnfx_skull_explosion_big_3p",
			max_damage_radius_max = 3,
			max_damage_radius_min = 3,
			radius_max = 3,
			radius_min = 3,
			sound_event_name = "Play_mutator_enemy_split_small",
			use_attacker_power_level = true,
		},
	},
	sienna_necromancer_ability_6_3_stagger = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			damage_profile = "sienna_necromancer_ability_6_3_stagger",
			radius = 3,
			use_attacker_power_level = true,
		},
	},
	sienna_necromancer_ability_stagger = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			damage_profile = "ability_push",
			no_friendly_fire = true,
			radius = 3,
			use_attacker_power_level = true,
		},
	},
	sienna_necromancer_ability_stagger_improved = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			damage_profile = "ability_push",
			dot_template_name = "sienna_necromancer_4_3_dot",
			no_friendly_fire = true,
			radius = 3,
			use_attacker_power_level = true,
		},
	},
	sienna_necromancer_spawn_skeleton_stagger = {
		explosion = {
			attack_template = "necromancer_ability_spawn_stagger",
			damage_profile = "necromancer_ability_spawn_stagger",
			no_friendly_fire = true,
			no_prop_damage = true,
			power_level = 5,
			radius = 1.5,
			max_damage_radius = math.huge,
		},
	},
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_shovel",
}
