local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.1,
			anim_event = "attack_shoot",
			fire_sound_on_husk = true,
			fire_time = 0.1,
			kind = "flamethrower",
			damage_profile = "flamethrower_spray",
			area_damage = true,
			stop_fire_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot",
			alert_sound_range_hit = 2,
			overcharge_interval = 0.2,
			dot_check = 0.97,
			damage_interval = 0.2,
			alert_sound_range_fire = 12,
			hit_zone_override = "torso",
			minimum_hold_time = 2,
			damage_window_end = 0,
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			anim_end_event = "attack_finished",
			fire_sound_event = "Play_player_combat_weapon_drakegun_flamethrower_shoot",
			fire_stop_time = 0.3,
			fx_node = "fx_muzzle",
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			hit_effect = "flamethrower",
			spray_range = 7,
			overcharge_type = "spear",
			charge_value = "light_attack",
			no_headshot_sound = true,
			hold_input = "action_one_hold",
			particle_effect_impact = "fx/wpnfx_flamethrower_hit_01",
			total_time = 1.3,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.25,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.25,
					external_multiplier = 1,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.9,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 1.1,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 1.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.9,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end
		},
		shoot_charged = {
			damage_window_start = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_shoot_charged",
			initial_damage_profile = "flamethrower_initial",
			kind = "flamethrower",
			no_headshot_sound = true,
			hit_effect = "flamethrower",
			charge_fuel_time_multiplier = 5,
			overcharge_interval = 0.25,
			alert_sound_range_fire = 12,
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			damage_interval = 0.25,
			fire_sound_event = "Play_player_combat_weapon_drakegun_flamethrower_shoot_charged",
			stop_fire_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot",
			minimum_hold_time = 0.75,
			damage_window_end = 0,
			overcharge_type = "drakegun_charging",
			charge_value = "light_attack",
			fire_time = 0.15,
			fire_sound_on_husk = true,
			area_damage = true,
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			alert_sound_range_hit = 2,
			hold_input = "action_one_hold",
			damage_profile = "flamethrower",
			fx_node = "fx_muzzle",
			particle_effect_impact = "fx/wpnfx_flamethrower_hit_01",
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
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
					start_time = 0.7,
					action = "action_two",
					release_required = "action_two_hold",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "player_combat_weapon_drakegun_charge_down",
			anim_end_event = "attack_finished",
			charge_ready_sound_event = "weapon_drakegun_charge_ready",
			charge_effect_material_variable_name = "intensity",
			kind = "charge",
			remove_overcharge_on_interrupt = true,
			overcharge_interval = 0.2,
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.2,
			overcharge_type = "flamethrower",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			hold_input = "action_two_hold",
			anim_event = "attack_charge",
			charge_sound_name = "player_combat_weapon_drakegun_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 0.8,
					end_time = 0.7,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.7,
					external_multiplier = 1,
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
					start_time = 0.45,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			}
		}
	},
	weapon_reload = {
		default = {
			charge_sound_stop_event = "stop_weapon_drakegun_cooldown_loop",
			anim_end_event = "attack_finished",
			uninterruptible = true,
			kind = "charge",
			do_not_validate_with_hold = true,
			minimum_hold_time = 0.5,
			vent_overcharge = true,
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
	overcharge_value_decrease_rate = 1,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	max_value = 30,
	time_until_overcharge_decreases = 0.5,
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_threshold = 10,
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	explosion_template = "overcharge_explosion_dwarf",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	hit_overcharge_threshold_sound = "ui_special_attack_ready"
}
weapon_template.attack_meta_data = {
	max_range = 50,
	obstruction_fuzzyness_range_charged = 1,
	always_charge_before_firing = false,
	charged_attack_action_name = "shoot_charged",
	aim_at_node = "j_spine1",
	can_charge_shot = true,
	minimum_charge_time = 0.1,
	charge_when_obstructed = false,
	charge_when_outside_max_range = false,
	obstruction_fuzzyness_range = 1
}
weapon_template.default_spread_template = "drakegun"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.drakegun
weapon_template.display_unit = "units/weapons/weapon_display/display_drakegun"
weapon_template.wield_anim = "to_drakegun"
weapon_template.crosshair_style = "circle"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "DRAKEFIRE"
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.85
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.85
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_crowd_control",
	"weapon_keyword_close_range",
	"weapon_keyword_overheat"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
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
		action_name = "action_one",
		sub_action_name = "shoot_charged"
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/drakegun",
	"wwise/flamethrower"
}
Weapons = Weapons or {}
Weapons.drakegun_template_1 = table.clone(weapon_template)

return
