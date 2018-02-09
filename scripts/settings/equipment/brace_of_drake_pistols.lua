local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_hit = 5,
			alert_sound_range_fire = 12,
			fire_at_gaze_setting = "tobii_fire_at_gaze_drake_pistols",
			fire_time = 0,
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			apply_recoil = true,
			hit_effect = "drakefire_pistol",
			overcharge_type = "brace_of_drake_pistols_basic",
			charge_value = "light_attack",
			fire_sound_event = "player_combat_weapon_drakepistol_fire",
			speed = 6000,
			anim_event = "attack_shoot",
			reload_time = 1.25,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.75,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return input_extension.reset_release_input(input_extension)
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15
			},
			projectile_info = Projectiles.brace_of_drake_pistols_shot,
			impact_data = {
				damage_profile = "shot_drakefire",
				targets = 1
			},
			timed_data = {
				life_time = 1,
				aoe = {
					explosion = {
						radius_min = 0.5,
						boost_curve_coefficient = 1,
						radius_max = 1,
						damage_type_glance = "drakegun_glance",
						max_damage_radius_min = 0.1,
						attack_template = "drakegun",
						damage_type = "drakegun",
						attack_template_glance = "drakegun_glance",
						max_damage_radius_max = 0.75,
						boost_curve_type = "ninja_curve",
						sound_event_name = "drakepistol_hit",
						effect_name = "fx/wpnfx_drake_pistols_projectile_impact",
						armour_modifier = {
							attack = {
								1,
								0.8,
								2.5,
								1,
								1.5
							},
							impact = {
								1,
								0.8,
								2.5,
								1,
								1.5
							}
						},
						cleave_distribution = {
							attack = 0.2,
							impact = 0.2
						},
						power_distribution = {
							attack = 0.9,
							impact = 0.3
						},
						armour_modifier = {
							attack = {
								1,
								0.8,
								2.5,
								1,
								1.5
							},
							impact = {
								1,
								0.8,
								2.5,
								1,
								1.5
							}
						},
						cleave_distribution = {
							attack = 0.2,
							impact = 0.2
						},
						power_distribution = {
							attack = 0.9,
							impact = 0.3
						}
					}
				}
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged = {
			damage_window_start = 0.1,
			fire_at_gaze_setting = false,
			kind = "bullet_spray",
			fire_sound_event_parameter = "drakegun_charge_fire",
			alert_sound_range_fire = 12,
			attack_template = "drake_pistol_charged",
			spread_template_override = "drake_pistol_charged",
			fire_sound_event = "player_combat_weapon_drakepistol_fire",
			boost_curve_type = "ninja_curve",
			hit_effect = "fireball_impact",
			alert_sound_range_hit = 5,
			area_damage = true,
			apply_recoil = true,
			damage_window_end = 0,
			overcharge_type = "brace_of_drake_pistols_charged",
			charge_value = "light_attack",
			fire_time = 0,
			boost_curve_coefficient = 1,
			dot_template_name = "burning_1W_dot",
			anim_event = "attack_shoot_charged",
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_two",
					send_buffer = true,
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return input_extension.reset_release_input(input_extension)
			end,
			armour_modifier = {
				attack = {
					1,
					0.8,
					2.5,
					1,
					1.5
				},
				impact = {
					1,
					0.8,
					2.5,
					1,
					1.5
				}
			},
			cleave_distribution = {
				attack = 0.2,
				impact = 0.2
			},
			power_distribution_near = {
				attack = 0.25,
				impact = 0.3
			},
			power_distribution_far = {
				attack = 0,
				impact = 0
			},
			range_dropoff_settings = {
				dropoff_start = 5,
				dropoff_end = 15
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 15,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "player_combat_weapon_drakepistol_charge_down",
			charge_time = 3,
			fire_at_gaze_setting = false,
			crosshair_style = "shotgun",
			kind = "charge",
			charge_effect_material_variable_name = "intensity",
			anim_end_event = "attack_finished",
			spread_template_override = "drake_pistol_charged",
			overcharge_interval = 0.3,
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.2,
			overcharge_type = "drakegun_charging",
			charge_sound_switch = "projectile_charge_sound",
			charge_effect_name = "fx/wpnfx_drake_pistol_charge",
			hold_input = "action_two_hold",
			anim_event = "attack_charge",
			charge_sound_name = "player_combat_weapon_drakepistol_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					buff_name = "planted_fast_decrease_movement"
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
					sub_action = "shoot_charged",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			}
		}
	},
	weapon_reload = {
		default = {
			charge_sound_stop_event = "stop_weapon_drakegun_cooldown_loop",
			fire_at_gaze_setting = false,
			uninterruptible = true,
			kind = "charge",
			do_not_validate_with_hold = true,
			minimum_hold_time = 0.5,
			vent_overcharge = true,
			anim_end_event = "attack_finished",
			charge_time = 3,
			hold_input = "weapon_reload_hold",
			anim_event = "cooldown_start",
			charge_sound_name = "weapon_drakegun_cooldown_loop",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
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
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension.get_overcharge_value(overcharge_extension) ~= 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension.get_overcharge_value(overcharge_extension) ~= 0
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_career_skill = ActionTemplates.career_skill_dummy,
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
	overcharge_threshold = 10,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	time_until_overcharge_decreases = 0.25,
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_value_decrease_rate = 1.3,
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	explosion_template = "overcharge_explosion_dwarf",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	hit_overcharge_threshold_sound = "ui_special_attack_ready"
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.04,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
local charge_action = weapon_template.actions.action_two.default
charge_action.loaded_projectile_settings = "none"
weapon_template.default_spread_template = "brace_of_drake_pistols"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.drake_pistol.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.drake_pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_drakefire_pistols"
weapon_template.crosshair_style = "arrows"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_drake_pistols"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "DRAKEFIRE"
weapon_template.dodge_distance = 0.85
weapon_template.dodge_speed = 0.85
weapon_template.dodge_count = 1
weapon_template.wwise_dep_right_hand = {
	"wwise/drakegun"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/drakegun"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.4,
			range = 0.4,
			damage = 0.5,
			targets = 0.2,
			stagger = 0.6
		},
		heavy_attack = {
			speed = 0.2,
			range = 0.25,
			damage = 0.525,
			targets = 0.9,
			stagger = 0.4
		}
	},
	perks = {
		light_attack = {
			"armor_penetration"
		},
		heavy_attack = {
			"armor_penetration",
			"burn"
		}
	}
}
Weapons = Weapons or {}
Weapons.brace_of_drakefirepistols_template_1 = table.clone(weapon_template)

return 
