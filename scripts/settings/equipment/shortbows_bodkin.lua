local push_radius = 2
local weapon_template = weapon_template or {}
local ARROW_HIT_EFFECT = "arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2
weapon_template.actions = {
	action_one = {
		default = {
			anim_event = "attack_shoot_fast",
			ammo_usage = 1,
			kind = "bow",
			apply_recoil = true,
			anim_event_last_ammo = "attack_shoot_fast_last",
			charge_value = "arrow_hit",
			weapon_action_hand = "left",
			fire_sound_event = "player_combat_weapon_shortbow_fire_light",
			speed = 5000,
			total_time = 0.83,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two",
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
			projectile_info = Projectiles.machinegun_bodkin_arrow,
			impact_data = {
				wall_nail = true,
				depth = 0.075,
				targets = 2,
				link = true,
				depth_offset = -0.6,
				damage = {
					enemy_unit_hit = {
						headshot_multiplier = 2,
						default_target = {
							boost_curve_coefficient = 1,
							boost_curve_type = "ninja_curve",
							attack_template = "arrow_machinegun",
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
						},
						critical_strike = {}
					},
					damagable_prop_hit = {
						boost_curve_coefficient = 1,
						boost_curve_type = "ninja_curve",
						attack_template = "arrow_machinegun",
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
				restore_duration = 0.15,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged = {
			ammo_usage = 1,
			charge_value = "zoomed_arrow_hit",
			kind = "bow",
			weapon_action_hand = "left",
			apply_recoil = true,
			anim_event_last_ammo = "attack_shoot_last",
			anim_end_event = "to_unzoom",
			fire_sound_event = "player_combat_weapon_shortbow_fire_heavy",
			speed = 9000,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			allow_hold_toggle = true,
			total_time = 1.66,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
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
					start_time = 0.66,
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
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.carbine_arrow_bodkin,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 3,
				link = true,
				depth_offset = -0.6,
				damage = {
					enemy_unit_hit = {
						default_target = {
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
				restore_duration = 0.15,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			aim_zoom_delay = 0.25,
			kind = "aim",
			anim_end_event = "draw_cancel",
			aim_sound_delay = 0.3,
			aim_sound_event = "player_combat_weapon_bow_tighten_grip_loop",
			minimum_hold_time = 0.2,
			ammo_usage = 1,
			weapon_action_hand = "left",
			unaim_sound_event = "stop_player_combat_weapon_bow_tighten_grip_loop",
			charge_time = 0.5,
			hold_input = "action_two_hold",
			anim_event = "draw_bow",
			allow_hold_toggle = true,
			reload_when_out_of_ammo = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "shoot_charged",
					start_time = 0.3,
					action = "action_one",
					input = "action_one_mouse",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.75,
					start_time = 0.3,
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
	ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
	ammo_hand = "left",
	ammo_per_clip = 1,
	ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1_3p",
	max_ammo = 17,
	reload_on_ammo_pickup = true,
	reload_time = 0.2,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	minimum_charge_time = 0.35,
	charged_attack_action_name = "shoot_charged",
	can_charge_shot = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = true,
	charge_against_armoured_enemy = true
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "bow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim = "to_shortbow"
weapon_template.wield_anim_no_ammo = "to_shortbow_noammo"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "SHORTBOW_BODKIN"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 6
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.5
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.5
	}
}
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
			speed = 0.9,
			range = 0.4,
			damage = 0.25,
			targets = 0.4,
			stagger = 0.2
		},
		heavy_attack = {
			speed = 0.4,
			range = 0.6,
			damage = 0.5,
			targets = 0.6,
			stagger = 0.4
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
Weapons.shortbow_bodkin_template_1 = table.clone(weapon_template)

return 
