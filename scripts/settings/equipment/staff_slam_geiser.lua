local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		geiser_launch = {
			damage_window_start = 0.1,
			boost_curve_type = "ninja_curve",
			is_spell = true,
			boost_curve_coefficient = 1,
			kind = "geiser",
			particle_radius_variable = "spawn_cylinder",
			attack_template = "wizard_staff_geiser",
			particle_effect = "fx/wpnfx_staff_geiser_fire",
			fire_sound_event = "player_combat_weapon_staff_geiser_fire",
			fire_sound_event_parameter = "drakegun_charge_fire",
			critical_attack_template = "wizard_staff_geiser_crit",
			damage_window_end = 0,
			overcharge_type = "geiser_charged",
			anim_end_event = "attack_finished",
			fire_time = 0.1,
			dot_template_name = "burning_1W_dot",
			anim_event = "attack_geiser_placed",
			total_time = 1,
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
					start_time = 0.5,
					action = "default",
					input = "action_two"
				},
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
			attack_template_list = {
				"wizard_staff_geiser",
				"wizard_staff_geiser_fryem",
				"wizard_staff_geiser_crit"
			},
			dot_template_name_list = {
				"burning_1W_dot",
				"burning_3W_dot",
				"burning_3W_dot"
			}
		},
		default = {
			damage_window_start = 0.1,
			attack_template = "flame_blast",
			is_spell = true,
			fire_time = 0.3,
			kind = "bullet_spray",
			charge_value = "light_attack",
			alert_sound_range_hit = 2,
			area_damage = true,
			hit_effect = "fireball_impact",
			anim_event_last_ammo = "attack_shoot_last",
			damage_window_end = 0,
			overcharge_type = "beam_staff_shotgun",
			alert_sound_range_fire = 12,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			dot_template_name = "burning_1W_dot",
			anim_event = "attack_shoot_sparks",
			total_time = 2,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
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
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			}
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			height = 6,
			charge_ready_sound_event = "weapon_staff_charge_ready",
			min_radius = 1,
			kind = "geiser_targeting",
			debug_draw = false,
			angle = 0,
			attack_template = "wizard_staff",
			charge_sound_switch = "projectile_charge_sound",
			overcharge_interval = 0.3,
			particle_effect = "fx/wpnfx_staff_geiser_charge",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			minimum_hold_time = 0.2,
			gravity = -9.82,
			overcharge_type = "charging",
			anim_end_event = "attack_geiser_end",
			fire_time = 0.1,
			charge_time = 2,
			speed = 15,
			hold_input = "action_two_hold",
			anim_event = "attack_geiser_start",
			max_radius = 4,
			charge_sound_name = "player_combat_weapon_staff_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0,
					buff_name = "planted_casting_long_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "geiser_launch",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
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
	action_three = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			anim_end_event = "attack_finished",
			uninterruptible = true,
			charge_effect_material_variable_name = "intensity",
			kind = "charge",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.5,
			vent_overcharge = true,
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			hold_input = "action_three_hold",
			anim_event = "cooldown_start",
			charge_sound_name = "player_combat_weapon_staff_cooldown",
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
			}
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
	explosion_template = "overcharge_explosion_brw",
	overcharge_threshold = 10,
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	time_until_overcharge_decreases = 0.5,
	overcharge_value_decrease_rate = 1
}
weapon_template.show_reticule = false
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.crosshair_style = "default"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.85
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.85
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.5,
			range = 0.25,
			damage = 0.4,
			targets = 0.8,
			stagger = 0.6
		},
		heavy_attack = {
			speed = 0.4,
			range = 0.4,
			damage = 0.4,
			targets = 1,
			stagger = 0.9
		}
	},
	perks = {
		light_attack = {
			"burn"
		},
		heavy_attack = {
			"armor_penetration",
			"burn"
		}
	}
}
Weapons = Weapons or {}
Weapons.staff_slam_geiser_template_1 = table.clone(weapon_template)
Weapons.staff_slam_geiser_template_1_t2 = table.clone(weapon_template)

return 
