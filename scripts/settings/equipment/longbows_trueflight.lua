local push_radius = 2
local ARROW_HIT_EFFECT = "arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_event = "attack_shoot_fast",
			ammo_usage = 1,
			kind = "true_flight_bow",
			attack_template = "arrow_machinegun",
			sphere_sweep_dot_threshold = 0.75,
			weapon_action_hand = "left",
			true_flight_template = "carbine",
			sphere_sweep_radius = 2,
			sphere_sweep_length = 50,
			anim_event_last_ammo = "attack_shoot_fast_last",
			charge_value = "arrow_hit",
			apply_recoil = true,
			fire_reason = "action_complete",
			fire_sound_event = "player_combat_weapon_bow_fire_light_homing",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.8,
			speed = 8000,
			aim_assist_ramp_decay_delay = 0.3,
			sphere_sweep_max_nr_of_results = 100,
			total_time = 0.83,
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
					start_time = 0.8,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.4,
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
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return input_extension.reset_release_input(input_extension)
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.true_flight_carbine,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 1,
				link = true,
				depth_offset = -0.6,
				damage = {
					enemy_unit_hit = {
						headshot_multiplier = 2,
						default_target = {
							boost_curve_coefficient = 0.5,
							boost_curve_type = "ninja_curve",
							attack_template = "arrow_carbine",
							armour_modifier_near = {
								attack = {
									1,
									0.6,
									2.5,
									1,
									1.5
								},
								impact = {
									1,
									0.3,
									2.5,
									1,
									1.5
								}
							},
							armour_modifier_far = {
								attack = {
									1,
									0,
									2.5,
									1,
									1.5
								},
								impact = {
									1,
									0.1,
									2.5,
									1,
									1.5
								}
							},
							power_distribution_near = {
								attack = 0.4,
								impact = 0.2
							},
							power_distribution_far = {
								attack = 0.05,
								impact = 0.05
							},
							range_dropoff_settings = {
								dropoff_start = 10,
								dropoff_end = 30
							}
						},
						critical_strike = {}
					},
					damagable_prop_hit = {
						boost_curve_coefficient = 1,
						boost_curve_type = "ninja_curve",
						attack_template = "arrow_carbine",
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
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged = {
			kind = "true_flight_bow",
			sphere_sweep_dot_threshold = 0.75,
			weapon_action_hand = "left",
			true_flight_template = "carbine",
			sphere_sweep_radius = 2,
			sphere_sweep_length = 50,
			anim_event_last_ammo = "attack_shoot_last",
			sphere_sweep_max_nr_of_results = 100,
			minimum_hold_time = 0.5,
			charge_value = "arrow_hit",
			ammo_usage = 1,
			fire_time = 0.15,
			fire_sound_event = "player_combat_weapon_bow_fire_light_homing",
			apply_recoil = true,
			attack_template = "arrow_carbine",
			speed = 8000,
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_max_ramp_multiplier = 0.8,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			aim_assist_ramp_decay_delay = 0.3,
			allow_hold_toggle = true,
			total_time = 1.66,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.66,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0,
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
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return input_extension.reset_release_input(input_extension)
			end,
			hit_effect = ARROW_HIT_EFFECT,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15
			},
			projectile_info = Projectiles.true_flight_carbine,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 1,
				link = true,
				depth_offset = -0.6,
				damage = {
					enemy_unit_hit = {
						headshot_multiplier = 2,
						default_target = {
							boost_curve_coefficient = 0.5,
							boost_curve_type = "ninja_curve",
							attack_template = "arrow_carbine",
							armour_modifier_near = {
								attack = {
									1,
									0.6,
									2.5,
									1,
									1.5
								},
								impact = {
									1,
									0.3,
									2.5,
									1,
									1.5
								}
							},
							armour_modifier_far = {
								attack = {
									1,
									0,
									2.5,
									1,
									1.5
								},
								impact = {
									1,
									0.1,
									2.5,
									1,
									1.5
								}
							},
							power_distribution_near = {
								attack = 0.4,
								impact = 0.2
							},
							power_distribution_far = {
								attack = 0.05,
								impact = 0.05
							},
							range_dropoff_settings = {
								dropoff_start = 10,
								dropoff_end = 30
							}
						},
						critical_strike = {}
					},
					damagable_prop_hit = {
						boost_curve_coefficient = 1,
						boost_curve_type = "ninja_curve",
						attack_template = "arrow_carbine",
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
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			anim_event = "draw_bow",
			default_zoom = "zoom_in_trueflight",
			anim_end_event = "draw_cancel",
			kind = "true_flight_bow_aim",
			sphere_sweep_dot_threshold = 0.7,
			sphere_sweep_length = 100,
			sphere_sweep_max_nr_of_results = 100,
			aim_sound_delay = 0.5,
			aim_sound_event = "player_combat_weapon_bow_tighten_grip_loop",
			weapon_action_hand = "left",
			sphere_sweep_radius = 1.5,
			minimum_hold_time = 0.2,
			aim_zoom_delay = 0.25,
			ammo_usage = 1,
			unaim_sound_event = "stop_player_combat_weapon_bow_tighten_grip_loop",
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_max_ramp_multiplier = 0.8,
			hold_input = "action_two_hold",
			max_targets = 1,
			allow_hold_toggle = true,
			reload_when_out_of_ammo = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
				"increased_zoom_in"
			},
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "shoot_charged",
					start_time = 0.65,
					action = "action_one",
					input = "action_one_mouse",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.75,
					start_time = 0.5,
					action = "action_one",
					sub_action = "shoot_charged",
					input = "action_one_softbutton_gamepad",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			zoom_condition_function = function ()
				return true
			end,
			unzoom_condition_function = function (end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension.total_remaining_ammo(ammo_extension) <= 0 then
					return false
				end

				return true
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
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
weapon_template.ammo_data = {
	ammo_per_reload = 1,
	ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1",
	ammo_hand = "left",
	ammo_per_clip = 1,
	ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_homing_arrow_t1_3p",
	max_ammo = 20,
	reload_on_ammo_pickup = true,
	reload_time = 0.4,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 30,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 0.5,
		skaven_slave = 0.3
	}
}
weapon_template.default_spread_template = "longbow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim = "to_longbow"
weapon_template.wield_anim_no_ammo = "to_longbow_noammo"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "LONGBOW_TRUEFLIGHT"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.dodge_count = 3
weapon_template.wwise_dep_left_hand = {
	"wwise/bow"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.6,
			range = 0.6,
			damage = 0.5,
			targets = 0.2,
			stagger = 0.4
		},
		heavy_attack = {
			speed = 0.4,
			range = 0.8,
			damage = 0.75,
			targets = 0.4,
			stagger = 0.6
		}
	},
	perks = {
		light_attack = {
			"head_shot",
			"armor_penetration"
		},
		heavy_attack = {
			"head_shot",
			"armor_penetration"
		}
	}
}
Weapons = Weapons or {}
Weapons.longbow_trueflight_template_1 = table.clone(weapon_template)

return 
