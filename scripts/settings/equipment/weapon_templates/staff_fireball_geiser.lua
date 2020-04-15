local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			is_spell = true,
			alert_sound_range_hit = 2,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_time = 0.27,
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			charge_value = "light_attack",
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			hit_effect = "fireball_impact",
			apply_recoil = true,
			overcharge_type = "fireball_basic",
			alert_sound_range_fire = 12,
			fire_sound_event = "player_combat_weapon_staff_fireball_fire",
			fire_sound_on_husk = true,
			speed = 7000,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_shoot_fireball",
			total_time = 0.6,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
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
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.fireball,
			impact_data = {
				damage_profile = "staff_fireball"
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		geiser_launch = {
			damage_window_start = 0.1,
			damage_window_end = 0,
			fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
			aoe_name = "conflag",
			kind = "geiser",
			particle_radius_variable = "spawn_cylinder",
			anim_end_event = "attack_finished",
			damage_profile = "geiser",
			overcharge_type_heavy = "geiser_charged_2",
			fire_sound_event = "player_combat_weapon_staff_geiser_fire",
			alert_enemies = true,
			fire_sound_on_husk = true,
			fire_sound_event_parameter = "drakegun_charge_fire",
			is_spell = true,
			apply_recoil = true,
			particle_effect = "fx/wpnfx_staff_geiser_fire",
			overcharge_type = "geiser_charged",
			alert_sound_range_fire = 12,
			fire_time = 0,
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
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			recoil_settings = {
				horizontal_climb = -1,
				restore_duration = 0.3,
				vertical_climb = 5,
				climb_duration = 0.4,
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
			min_radius = 0.75,
			kind = "geiser_targeting",
			debug_draw = false,
			scale_anim_by_charge_time_buff = false,
			crosshair_style = "dot",
			attack_template = "wizard_staff",
			overcharge_interval = 0.3,
			charge_sound_switch = "projectile_charge_sound",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			angle = 0,
			minimum_hold_time = 0.2,
			particle_effect = "fx/wpnfx_staff_geiser_charge",
			anim_end_event = "attack_geiser_end",
			fire_time = 0.1,
			speed = 15,
			anim_event = "attack_geiser_start",
			charge_sound_name = "player_combat_weapon_staff_charge",
			height = 6,
			fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			gravity = -9.82,
			overcharge_type = "charging",
			charge_time = 1.8,
			hold_input = "action_two_hold",
			max_radius = 3.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.1,
					buff_name = "planted_casting_long_decrease_movement"
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
					sub_action = "geiser_launch",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end
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
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					buff_name = "planted_fast_decrease_movement",
					end_time = math.huge
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
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
	overcharge_value_decrease_rate = 1
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	obstruction_fuzzyness_range_charged = 3.5,
	charged_attack_action_name = "geiser_launch",
	can_charge_shot = true,
	minimum_charge_time = 0.21,
	aim_at_node_charged = "j_spine1",
	ignore_enemies_for_obstruction_charged = false,
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = false
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "fireball"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_geiser"
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
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0,
	target_node = "j_spine1",
	effective_max_range = 30,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_damage_over_time",
	"weapon_keyword_crowd_control",
	"weapon_keyword_charged_attack"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "geiser_launch"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "geiser_launch"
	}
}

return {
	staff_fireball_geiser_template_1 = table.clone(weapon_template)
}
