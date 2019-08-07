local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			spell_proc_time = 0.2,
			damage_profile = "beam",
			is_spell = true,
			kind = "beam",
			damage_interval = 0.45,
			range = 50,
			charge_sound_stop_event = "stop_player_combat_weapon_staff_fire_beam",
			overcharge_interval = 0.45,
			charge_sound_switch = "projectile_charge_sound",
			charge_sound_husk_name = "player_combat_weapon_staff_fire_beam_husk",
			hit_effect = "staff_spark",
			particle_effect_trail = "fx/wpnfx_staff_beam_trail",
			minimum_hold_time = 0.5,
			initial_damage_profile = "beam_initial",
			overcharge_type = "beam_staff_alternate",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_fire_beam_husk",
			anim_end_event = "attack_shoot_beam_end",
			fire_time = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_max_ramp_multiplier = 0.8,
			particle_effect_target = "fx/wpnfx_staff_beam_target",
			hold_input = "action_one_hold",
			anim_event = "attack_shoot_beam_start",
			particle_effect_trail_3p = "fx/wpnfx_staff_beam_trail_3p",
			charge_sound_name = "player_combat_weapon_staff_fire_beam",
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
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
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
					sub_action = "charged_beam",
					start_time = 0.3,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "charged_beam",
					start_time = 0.3,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			}
		},
		shoot_charged = {
			damage_window_start = 0.1,
			damage_profile = "blast",
			is_spell = true,
			crosshair_style = "shotgun",
			kind = "bullet_spray",
			fire_sound_event = "weapon_staff_fire_cone",
			fire_sound_on_husk = true,
			spread_template_override = "blunderbuss",
			spell_proc_time = 0.3,
			charge_value = "light_attack",
			apply_recoil = true,
			hit_effect = "fireball_impact",
			anim_event_last_ammo = "attack_shoot_last",
			area_damage = true,
			damage_window_end = 0,
			overcharge_type = "beam_staff_shotgun",
			alert_sound_range_fire = 12,
			fire_time = 2,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_sparks",
			total_time = 2,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.75,
					end_time = 0.3,
					buff_name = "planted_fast_decrease_movement"
				},
				{
					start_time = 0.3,
					external_multiplier = 1,
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
					start_time = 0.31,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.31,
					action = "action_two",
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
			end,
			recoil_settings = {
				horizontal_climb = -1,
				restore_duration = 0.2,
				vertical_climb = -2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_staff_fire_beam",
			scale_chain_window_by_charge_time_buff = true,
			anim_end_event = "attack_finished",
			crosshair_style = "shotgun",
			kind = "charge",
			particle_effect_trail_3p = "fx/wpnfx_staff_beam_trail_3p",
			charge_sound_husk_name = "player_combat_weapon_staff_fire_beam_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_fire_beam_husk",
			spread_template_override = "blunderbuss",
			overcharge_interval = 0.3,
			scale_anim_by_charge_time_buff = false,
			particle_effect_trail = "fx/wpnfx_staff_beam_trail",
			minimum_hold_time = 0.2,
			overcharge_type = "drakegun_charging",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			particle_effect_target = "fx/wpnfx_staff_beam_target",
			hold_input = "action_two_hold",
			anim_event = "flamethrower_charge_start",
			fx_node = "fx_01",
			charge_sound_name = "player_combat_weapon_staff_fire_beam",
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
					start_time = 0.2,
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
		},
		charged_beam = {
			reset_aim_on_attack = true,
			damage_window_start = 0.1,
			damage_profile = "beam_shot",
			fire_time = 0,
			kind = "handgun",
			headshot_multiplier = 2,
			spread_template_override = "handgun",
			hit_effect = "fireball_impact",
			damage_window_end = 0,
			overcharge_type = "beam_staff_sniper",
			charge_value = "light_attack",
			use_beam_consecutive_hits = true,
			fire_sound_event = "weapon_staff_fire_beam_end_shot",
			anim_event = "attack_shoot_beam_spark",
			total_time = 0.66,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_two",
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
					start_time = 0.2,
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
weapon_template.default_spread_template = "spear"
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	overcharge_threshold = 10,
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	time_until_overcharge_decreases = 0.5,
	overcharge_value_decrease_rate = 1
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	obstruction_fuzzyness_range_charged = 6,
	charged_attack_action_name = "shoot_charged",
	charge_when_outside_max_range_charged = false,
	ignore_enemies_for_obstruction_charged = false,
	max_range = 50,
	aim_at_node_charged = "j_spine1",
	minimum_charge_time = 0.21,
	max_range_charged = 6,
	can_charge_shot = true,
	fire_input = "fire_hold",
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = false,
	obstruction_fuzzyness_range = 1,
	aim_data = {
		min_radius_pseudo_random_c = 0.94737,
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
weapon_template.tooltip_keywords = {
	"weapon_keyword_sniper",
	"weapon_keyword_crowd_control",
	"weapon_keyword_damage_over_time"
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
	"wwise/staff"
}

return {
	staff_blast_beam_template_1 = table.clone(weapon_template)
}
