local weapon_template = {}
local anim_scale = 0.9
weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 0,
			num_projectiles_per_shot = 1,
			extra_shot_delay = 0.08,
			kind = "rail_gun",
			weapon_action_hand = "left",
			ranged_attack = true,
			aim_assist_max_ramp_multiplier = 0.8,
			roll_crit_once = true,
			burst_shot_delay = 0.08,
			spread_pitch = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			bullseye = false,
			apply_recoil = true,
			anim_end_event = "attack_finished",
			fire_time = 0.01,
			speed = 9000,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_shoot",
			reload_when_out_of_ammo = false,
			is_spell = true,
			num_layers_spread = 1,
			hit_effect = "life_impact",
			num_shots = 4,
			overcharge_type = "life_staff_light",
			apply_shot_cost_once = true,
			total_time = 1.4,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			anim_time_scale = anim_scale,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			buff_data = {
				{
					start_time = 0.02,
					external_multiplier = 0.25,
					end_time = 0.3,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default_chain",
					start_time = 0.7,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			controller_effects = {
				start = {
					effect_type = "rumble",
					params = {
						rumble_effect = "light_swing"
					}
				},
				fire = {
					effect_type = "rumble",
					params = {
						rumble_effect = "handgun_fire"
					}
				}
			},
			on_shoot_particle_fx = {
				node_name = "j_righthandindex3",
				effect = "fx/lifestaff_launch_projectile"
			},
			projectile_info = Projectiles.lifestaff_light,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 1,
				damage_profile = "burst_thorn",
				link = true,
				depth_offset = 0.05
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:are_you_locked_out() == false
			end,
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 0.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		default_chain = {
			ammo_usage = 0,
			num_projectiles_per_shot = 1,
			extra_shot_delay = 0.08,
			kind = "rail_gun",
			weapon_action_hand = "left",
			ranged_attack = true,
			aim_assist_max_ramp_multiplier = 0.8,
			roll_crit_once = true,
			burst_shot_delay = 0.08,
			spread_pitch = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			apply_recoil = true,
			bullseye = false,
			anim_end_event = "attack_finished",
			fire_time = 0.01,
			speed = 9000,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_shoot_last",
			reload_when_out_of_ammo = false,
			is_spell = true,
			num_layers_spread = 1,
			hit_effect = "life_impact",
			num_shots = 4,
			overcharge_type = "life_staff_light",
			apply_shot_cost_once = true,
			total_time = 1.4,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			anim_time_scale = anim_scale,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			buff_data = {
				{
					start_time = 0.02,
					external_multiplier = 0.25,
					end_time = 0.3,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			controller_effects = {
				start = {
					effect_type = "rumble",
					params = {
						rumble_effect = "light_swing"
					}
				},
				fire = {
					effect_type = "rumble",
					params = {
						rumble_effect = "handgun_fire"
					}
				}
			},
			on_shoot_particle_fx = {
				node_name = "j_righthandindex3",
				effect = "fx/lifestaff_launch_projectile"
			},
			projectile_info = Projectiles.lifestaff_light,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 1,
				damage_profile = "burst_thorn",
				link = true,
				depth_offset = 0.05
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 0.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		cast_vortex = {
			damage_window_start = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
			kind = "spirit_storm",
			anim_end_event = "attack_finished",
			overcharge_amount = 10,
			is_spell = true,
			damage_profile = "spirit_storm",
			alert_enemies = true,
			damage_window_end = 0,
			alert_sound_range_fire = 12,
			weapon_action_hand = "left",
			fire_time = 0,
			fire_sound_on_husk = true,
			anim_event = "attack_shoot_fireball_charged",
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
			end
		}
	},
	action_two = {
		default = {
			aim_time = 0,
			default_zoom = "zoom_in_trueflight",
			weapon_action_hand = "left",
			kind = "career_true_flight_aim",
			not_wield_previous = true,
			hold_input = "action_two_hold",
			aim_sticky_target_size = 1,
			aim_obstructed_by_walls = true,
			minimum_hold_time = 0.2,
			ignore_bosses = true,
			anim_end_event = "attack_finished",
			aim_sticky_time = 0,
			num_projectiles = 1,
			uninterruptible = true,
			anim_event = "attack_charge_fireball",
			allow_hold_toggle = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			zoom_condition_function = function ()
				return true
			end,
			prioritized_breeds = {
				beastmen_bestigor = 1,
				skaven_plague_monk = 1,
				chaos_raider = 1,
				chaos_warrior = 1,
				chaos_berzerker = 1,
				skaven_warpfire_thrower = 1,
				chaos_vortex_sorcerer = 1,
				skaven_gutter_runner = 1,
				skaven_pack_master = 1,
				skaven_poison_wind_globadier = 1,
				chaos_corruptor_sorcerer = 1,
				skaven_ratling_gunner = 1,
				skaven_storm_vermin_commander = 1,
				skaven_storm_vermin = 1,
				beastmen_standard_bearer = 1,
				skaven_storm_vermin_with_shield = 1
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:are_you_locked_out() == false
			end,
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
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "cast_vortex",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				}
			}
		}
	},
	weapon_reload = {
		default = {
			charge_sound_stop_event = "Stop_weapon_life_staff_cooldown_loop",
			weapon_action_hand = "left",
			uninterruptible = true,
			charge_effect_material_variable_name = "intensity",
			kind = "charge",
			anim_end_event = "cooldown_end",
			do_not_validate_with_hold = true,
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.5,
			vent_overcharge = true,
			charge_time = 3,
			hold_input = "weapon_reload_hold",
			anim_event = "cooldown_start",
			charge_sound_name = "Play_weapon_life_staff_cooldown_loop",
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

				return overcharge_extension:get_overcharge_value() ~= 0 and overcharge_extension:are_you_locked_out() == false
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end
		}
	},
	action_inspect = table.clone(ActionTemplates.action_inspect),
	action_wield = ActionTemplates.wield
}

weapon_template.actions.action_inspect.default.condition_func = function (action_user, input_extension)
	if not ActionTemplates.action_inspect.default.condition_func(action_user, input_extension) then
		return false
	end

	local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

	return overcharge_extension:are_you_locked_out() == false
end

weapon_template.default_spread_template = "spear"
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	overcharge_warning_critical_sound_event = "weapon_life_staff_overcharge_warning_critical",
	overcharge_warning_med_sound_event = "weapon_life_staff_overcharge_warning_medium",
	time_until_overcharge_decreases = 0.5,
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_value_decrease_rate = 1,
	overcharge_warning_high_sound_event = "weapon_life_staff_overcharge_warning_high",
	overcharge_threshold = 10
}
weapon_template.attack_meta_data = {
	max_range = 30,
	max_range_charged = 50,
	can_charge_shot = true,
	charge_when_outside_max_range_charged = false,
	ignore_hitting_allies_charged = true,
	ignore_disabled_enemies_charged = true,
	aim_at_node = "j_head",
	obstruction_fuzzyness_range_charged = 6,
	aim_at_node_charged = "j_spine1",
	ignore_enemies_for_obstruction_charged = true,
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
	},
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Armored),
	effective_against_charged = bit.bor(BreedCategory.Armored, BreedCategory.Special, BreedCategory.Shielded, BreedCategory.SuperArmor)
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
weapon_template.jump_anim_enabled_1p = true
left_hand_unit = "units/weapons/player/wpn_we_life_staff_01/wpn_we_life_staff_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_life_staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "LIFE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 6,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 4
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 7,
		[DamageTypes.DAMAGE] = 0
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_sniper",
	"weapon_keyword_crowd_control",
	"weapon_keyword_rapid_fire"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one"
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff"
}

return {
	staff_life = table.clone(weapon_template)
}
