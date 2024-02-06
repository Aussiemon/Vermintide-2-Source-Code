-- chunkname: @scripts/settings/dlcs/morris/morris_equipment_settings.lua

local settings = DLCSettings.morris

settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_morris",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/dr_deus_01",
	"scripts/settings/equipment/weapon_templates/es_deus_01",
	"scripts/settings/equipment/weapon_templates/wh_deus_01",
	"scripts/settings/equipment/weapon_templates/bw_deus_01",
	"scripts/settings/equipment/weapon_templates/we_deus_01",
	"scripts/settings/dlcs/morris/morris_potion_settings",
	"scripts/settings/equipment/weapon_templates/deus_relic",
	"scripts/settings/equipment/weapon_templates/deus_rally_flag",
	"scripts/settings/equipment/weapon_templates/deus_grenades",
}
settings.default_items = {
	dr_deus_01 = {
		description = "dr_deus_01_description",
		display_name = "dr_deus_01_name",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
	},
	es_deus_01 = {
		description = "es_deus_01_description",
		display_name = "es_deus_01_name",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
	},
	we_deus_01 = {
		description = "we_deus_01_description",
		display_name = "we_deus_01_name",
		inventory_icon = "icon_wpn_we_moonfire_t1",
	},
	bw_deus_01 = {
		description = "bw_deus_01_description",
		display_name = "bw_deus_01_name",
		inventory_icon = "icon_wpn_brw_magmastaff_t1",
	},
	wh_deus_01 = {
		description = "wh_deus_01_description",
		display_name = "wh_deus_01_name",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
	},
}
settings.inventory_settings = {
	"scripts/settings/inventory_settings_morris",
}
settings.cosmetics_files = {
	"scripts/settings/dlcs/morris/morris_cosmetics",
}
settings.inventory_package_list = {
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01",
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_3p",
	"units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01",
	"units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
	"units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3ps",
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_runed",
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_runed_3p",
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_magic",
	"units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_magic_3p",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_3p",
	"units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
	"units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
	"units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3ps",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_runed",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_runed_3p",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
	"units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic_3p",
	"units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03",
	"units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_3p",
	"units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
	"units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
	"units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3ps",
	"units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_runed",
	"units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_runed_3p",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_3p",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_runed",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_runed_3p",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_magic",
	"units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_magic_3p",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_3p",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_3p",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_runed",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_runed_3p",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_runed",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_runed_3p",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_magic",
	"units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_magic_3p",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic",
	"units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic_3p",
	"units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03",
	"units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03_3p",
	"units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03",
	"units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03_3p",
	"units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03_runed",
	"units/weapons/player/wpn_es_deus_spear_03/wpn_es_deus_spear_03_runed_3p",
	"units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03_runed",
	"units/weapons/player/wpn_es_deus_shield_03/wpn_es_deus_shield_03_runed_3p",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_3p",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3ps",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_runed",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_runed_3p",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_magic",
	"units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_magic_3p",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_3p",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3p",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3ps",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_runed",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_runed_3p",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_magic",
	"units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_magic_3p",
	"units/weapons/player/wpn_we_deus_03/wpn_we_deus_03",
	"units/weapons/player/wpn_we_deus_03/wpn_we_deus_03_3p",
	"units/weapons/player/wpn_we_deus_03/wpn_we_deus_03_runed",
	"units/weapons/player/wpn_we_deus_03/wpn_we_deus_03_runed_3p",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_3p",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_runed",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_runed_3p",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_magic",
	"units/weapons/player/wpn_bw_deus_01/wpn_bw_deus_01_magic_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_baelfire",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_baelfire_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_baelfire",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_baelfire_3p",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_baelfire",
	"units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_baelfire_3p",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_3p",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_runed",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_runed_3p",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_magic",
	"units/weapons/player/wpn_bw_deus_03/wpn_bw_deus_03_magic_3p",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_3p",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_3p_drop",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_runed",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_runed_3p",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_runed_3p_drop",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_magic",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_magic_3p",
	"units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01_magic_3p_drop",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_3p",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_3p_drop",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_runed",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_runed_3p",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_runed_3p_drop",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic_3p",
	"units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic_3p_drop",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_3p",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_3p_drop",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed_3p",
	"units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed_3p_drop",
	"wwise/dr_deus_01",
	"wwise/we_deus_01",
	"wwise/bw_deus_01",
	"wwise/es_deus_01",
	"wwise/wh_deus_01",
}
settings.damage_profile_template_files_names = {
	"scripts/settings/dlcs/morris/damage_profile_templates_dlc_morris",
}
settings.weave_traits = {
	ranged_energy = {
		"weave_ranged_restore_stamina_headshot",
		"weave_ranged_reduce_cooldown_on_crit",
		"weave_ranged_increase_power_level_vs_armour_crit",
		"weave_ranged_consecutive_hits_increase_power",
	},
}
settings.attack_template_files_names = {
	"scripts/settings/dlcs/morris/attack_templates_dlc_morris",
}
settings.action_template_file_names = {
	"scripts/unit_extensions/weapons/actions/action_grenade_thrower",
	"scripts/unit_extensions/weapons/actions/action_bow_energy",
	"scripts/unit_extensions/weapons/actions/action_aim_energy",
	"scripts/unit_extensions/weapons/actions/action_magma_projectile",
	"scripts/unit_extensions/weapons/actions/action_multi_shoot",
	"scripts/unit_extensions/weapons/actions/action_deus_relic_throw",
}
settings.player_unit_status_settings_file_names = {
	"scripts/settings/dlcs/morris/player_unit_status_settings_morris",
}
settings.action_classes_lookup = {
	aim_energy = "ActionAimEnergy",
	bow_energy = "ActionBowEnergy",
	deus_relic_throw = "ActionDeusRelicThrow",
	grenade_thrower = "ActionGrenadeThrower",
	magma_projectile = "ActionMagmaProjectile",
	multi_shoot = "ActionMultiShoot",
}
settings.projectile_units = {
	dr_deus_01_head = {
		dummy_linker_unit_name = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
		projectile_unit_name = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3ps",
	},
	we_deus_01_arrow = {
		dummy_linker_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
		projectile_unit_name = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3ps",
	},
	holy_hand_grenade = {
		projectile_unit_name = "units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_01_t1_3p",
	},
}
settings.projectiles = {
	dr_deus_01 = {
		gravity_settings = "drakegun",
		impact_type = "sphere_sweep",
		life_time = 3,
		pickup_name = "grenade",
		projectile_unit_template_name = "player_projectile_unit",
		projectile_units_template = "dr_deus_01_head",
		radius = 0.1,
		trajectory_template_name = "throw_trajectory",
	},
	we_deus_01 = {
		gravity_settings = "arrows",
		impact_type = "sphere_sweep",
		pickup_name = "we_arrow",
		projectile_unit_template_name = "player_projectile_unit",
		projectile_units_template = "we_deus_01_arrow",
		radius = 0.075,
		static_impact_type = "raycast",
		trajectory_template_name = "throw_trajectory",
	},
	holy_hand_grenade = {
		disable_throwing_dialogue = true,
		gravity_settings = "drakegun",
		impact_type = "sphere_sweep",
		life_time = 5,
		pickup_name = "grenade",
		projectile_unit_template_name = "player_projectile_unit",
		projectile_units_template = "holy_hand_grenade",
		radius = 0.1,
		rotation_speed = 10,
		show_warning_icon = true,
		trajectory_template_name = "throw_trajectory",
	},
}
settings.default_items = {
	dr_deus_01 = {
		description = "dr_deus_01_description",
		display_name = "dr_deus_01_name",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
	},
	es_deus_01 = {
		description = "es_deus_01_description",
		display_name = "es_deus_01_name",
		inventory_icon = "icon_wpn_empire_spearshield_t1",
	},
	bw_deus_01 = {
		description = "bw_deus_01_description",
		display_name = "bw_deus_01_name",
		inventory_icon = "icon_wpn_brw_magmastaff_t1",
	},
	we_deus_01 = {
		description = "we_deus_01_description",
		display_name = "we_deus_01_name",
		inventory_icon = "icon_wpn_we_moonfire_t1",
	},
	wh_deus_01 = {
		description = "wh_deus_01_description",
		display_name = "wh_deus_01_name",
		inventory_icon = "icon_wpn_emp_duckfoot_t1",
	},
}
settings.spread_templates = {
	wh_deus_01 = {
		continuous = {
			still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			crouch_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			crouch_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_crouch_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_crouch_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
		},
		immediate = {
			being_hit = {
				immediate_pitch = 0.2,
				immediate_yaw = 0.2,
			},
			shooting = {
				immediate_pitch = 10,
				immediate_yaw = 10,
			},
		},
	},
	wh_deus_01_special = {
		continuous = {
			still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			crouch_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			crouch_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_crouch_still = {
				max_pitch = 3,
				max_yaw = 9,
			},
			zoomed_crouch_moving = {
				max_pitch = 3,
				max_yaw = 9,
			},
		},
		immediate = {
			being_hit = {
				immediate_pitch = 0.2,
				immediate_yaw = 0.2,
			},
			shooting = {
				immediate_pitch = 10,
				immediate_yaw = 10,
			},
		},
	},
	bw_deus_01 = {
		continuous = {
			still = {
				max_pitch = 6,
				max_yaw = 9,
			},
			moving = {
				max_pitch = 6,
				max_yaw = 9,
			},
			crouch_still = {
				max_pitch = 6,
				max_yaw = 9,
			},
			crouch_moving = {
				max_pitch = 6,
				max_yaw = 9,
			},
			zoomed_still = {
				max_pitch = 0,
				max_yaw = 0,
			},
			zoomed_moving = {
				max_pitch = 0.4,
				max_yaw = 0.4,
			},
			zoomed_crouch_still = {
				max_pitch = 0,
				max_yaw = 0,
			},
			zoomed_crouch_moving = {
				max_pitch = 0.4,
				max_yaw = 0.4,
			},
		},
		immediate = {
			being_hit = {
				immediate_pitch = 0.2,
				immediate_yaw = 0.2,
			},
			shooting = {
				immediate_pitch = 10,
				immediate_yaw = 10,
			},
		},
	},
}
settings.extra_loot_chest_score_types = {
	deus = {
		coin_chests_collected = 0.5,
		cursed_chests_purified = 7,
		cursed_levels_completed = 10,
		game_won = 10,
		max_random_score = 30,
		quickplay = 10,
	},
}
