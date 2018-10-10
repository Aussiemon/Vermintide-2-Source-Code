local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			fire_time = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_spark_spear",
			is_spell = true,
			fire_sound_on_husk = true,
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			aim_assist_ramp_multiplier = 0.2,
			aim_assist_max_ramp_multiplier = 0.6,
			hit_effect = "staff_spark",
			aim_assist_ramp_decay_delay = 0.1,
			anim_time_scale = 1.5,
			apply_recoil = true,
			overcharge_type = "spark",
			fire_sound_event = "weapon_staff_spark_spear",
			speed = 9000,
			uninterruptible = true,
			anim_event = "attack_shoot_rapid_right",
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "rapid_left",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "rapid_left",
					start_time = 0.2,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15
			},
			projectile_info = Projectiles.spark,
			impact_data = {
				wall_nail = true,
				depth = 0.075,
				targets = 1,
				damage_profile = "fire_spark",
				depth_offset = -0.6
			},
			timed_data = {
				sound_event_name = "magic_hit",
				life_time = 1.5
			},
			recoil_settings = {
				horizontal_climb = 1,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_duration = 0.05,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		rapid_left = {
			fire_time = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_spark_spear",
			is_spell = true,
			attack_template = "wizard_staff_spark",
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			aim_assist_ramp_multiplier = 0.2,
			hit_effect = "staff_spark",
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			apply_recoil = true,
			overcharge_type = "spark",
			fire_sound_event = "weapon_staff_spark_spear",
			speed = 9000,
			uninterruptible = true,
			anim_event = "attack_shoot_rapid_left",
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.2,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15
			},
			projectile_info = Projectiles.spark,
			impact_data = {
				wall_nail = true,
				depth = 0.075,
				targets = 1,
				damage_profile = "fire_spark",
				depth_offset = -0.6
			},
			timed_data = {
				sound_event_name = "magic_hit",
				life_time = 1.5
			},
			recoil_settings = {
				horizontal_climb = -1,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_duration = 0.05,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged = {
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			fire_sound_on_husk = true,
			sphere_sweep_length = 50,
			fire_sound_event_parameter = "drakegun_charge_fire",
			sphere_sweep_dot_threshold = 0.5,
			kind = "charged_projectile",
			alert_sound_range_hit = 20,
			charge_value = "light_attack",
			alert_sound_range_fire = 12,
			apply_recoil = true,
			anim_time_scale = 1.5,
			damage_window_end = 0,
			fire_time = 0.05,
			speed = 5000,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "attack_shoot_spear_charged",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			is_spell = true,
			spread_template_override = "spear",
			hit_effect = "staff_spear",
			sphere_sweep_radius = 2,
			overcharge_type = "spear",
			ammo_usage = 1,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "weapon_reload",
					input = "weapon_reload_hold"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear"
			},
			timed_data = {
				sound_event_name = "magic_hit",
				life_time = 1.5
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged_2 = {
			damage_window_start = 0.1,
			fire_sound_on_husk = true,
			ammo_usage = 1,
			sphere_sweep_length = 50,
			fire_sound_event_parameter = "drakegun_charge_fire",
			sphere_sweep_dot_threshold = 0.5,
			true_flight_template = "sniper",
			alert_sound_range_hit = 20,
			charge_value = "light_attack",
			fire_sound_event = "weapon_staff_spark_spear_charged",
			kind = "charged_projectile",
			apply_recoil = true,
			anim_time_scale = 1.5,
			damage_window_end = 0,
			fire_time = 0.01,
			speed = 5000,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "attack_shoot_spear_charged",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			is_spell = true,
			spread_template_override = "spear",
			hit_effect = "staff_spear",
			sphere_sweep_radius = 2,
			overcharge_type = "spear_2",
			alert_sound_range_fire = 12,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "weapon_reload",
					input = "weapon_reload_hold"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			cleave_distribution = {
				attack = 0.25,
				impact = 0.25
			},
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear_2"
			},
			timed_data = {
				sound_event_name = "magic_hit",
				life_time = 1.5
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged_3 = {
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			fire_sound_on_husk = true,
			sphere_sweep_length = 50,
			fire_sound_event_parameter = "drakegun_charge_fire",
			sphere_sweep_dot_threshold = 0.5,
			kind = "charged_projectile",
			alert_sound_range_hit = 20,
			charge_value = "light_attack",
			alert_sound_range_fire = 12,
			apply_recoil = true,
			anim_time_scale = 1.5,
			damage_window_end = 0,
			fire_time = 0.01,
			speed = 5000,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "attack_shoot_spear_charged",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			is_spell = true,
			spread_template_override = "spear",
			hit_effect = "staff_spear",
			sphere_sweep_radius = 2,
			overcharge_type = "spear_3",
			ammo_usage = 1,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "weapon_reload",
					input = "weapon_reload_hold"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear_3"
			},
			timed_data = {
				sound_event_name = "magic_hit",
				life_time = 1.5
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			scale_chain_window_by_charge_time_buff = true,
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			aim_assist_ramp_decay_delay = 0.3,
			sphere_sweep_length = 100,
			overcharge_interval = 0.3,
			sphere_sweep_dot_threshold = 0.7,
			aim_assist_ramp_multiplier = 0.4,
			heavy_aim_sound_event = "Play_weapon_staff_spear_charge_2",
			aim_sound_delay = 1,
			kind = "aim",
			sphere_sweep_radius = 1.5,
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			aim_sound_event = "Play_weapon_staff_spear_charge_1",
			anim_time_scale = 1,
			minimum_hold_time = 0.2,
			aim_zoom_delay = 2.25,
			heavy_aim_flow_delay = 2.25,
			anim_end_event = "attack_finished",
			charge_sound_switch = "projectile_charge_sound",
			aim_assist_max_ramp_multiplier = 0.8,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "attack_charge_spear",
			charge_sound_name = "player_combat_weapon_staff_charge",
			spread_template_override = "spear",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			overcharge_type = "drakegun_charging",
			scale_anim_by_charge_time_buff = true,
			charge_time = 2.25,
			hold_input = "action_two_hold",
			max_targets = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			zoom_condition_function = function ()
				return false
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "shoot_charged_3",
					start_time = 1.25,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "shoot_charged_2",
					start_time = 0.6,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "shoot_charged",
					start_time = 0.4,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			}
		}
	},
	weapon_reload = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			hold_input = "weapon_reload_hold",
			charge_effect_material_variable_name = "intensity",
			kind = "charge",
			charge_sound_parameter_name = "drakegun_charge_fire",
			do_not_validate_with_hold = true,
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.5,
			vent_overcharge = true,
			anim_end_event = "attack_finished",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			uninterruptible = true,
			anim_event = "cooldown_start",
			charge_sound_name = "player_combat_weapon_staff_cooldown",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					buff_name = "planted_fast_decrease_movement",
					end_time = math.huge
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				}
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	overcharge_threshold = 10,
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	time_until_overcharge_decreases = 0.5,
	max_value = 40,
	overcharge_value_decrease_rate = 1
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	can_charge_shot = true,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction_charged = true,
	aim_at_node_charged = "j_head",
	minimum_charge_time = 0.55,
	charge_against_armored_enemy = true,
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = true,
	aim_data = {
		min_radius_pseudo_random_c = 0.3021,
		max_radius_pseudo_random_c = 0.0557,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16
	},
	aim_data_charged = {
		min_radius_pseudo_random_c = 0.0557,
		max_radius_pseudo_random_c = 0.01475,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16
	}
}
weapon_template.aim_assist_settings = {
	max_range = 22,
	no_aim_input_multiplier = 0,
	aim_at_node = "j_neck",
	can_charge_shot = true,
	base_multiplier = 0.15,
	aim_at_node_charged = "j_spine",
	effective_max_range = 10,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.default_spread_template = "sparks"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_rapid_fire",
	"weapon_keyword_headshotting",
	"weapon_keyword_sniper"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "rapid_left"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "shoot_charged"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		{
			action_name = "action_one",
			chain_start_time = 0.4,
			sub_action_name = "shoot_charged"
		},
		{
			action_name = "action_one",
			chain_start_time = 0.6,
			sub_action_name = "shoot_charged_2"
		},
		{
			action_name = "action_one",
			chain_start_time = 1.25,
			sub_action_name = "shoot_charged_3"
		},
		custom_chain = true
	}
}
Weapons = Weapons or {}
Weapons.staff_spark_spear_template_1 = table.clone(weapon_template)

return
