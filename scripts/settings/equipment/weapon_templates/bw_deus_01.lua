local weapon_template = {
	actions = {
		action_one = {
			default = {
				spell_proc_time = 0.4,
				alert_sound_range_fire = 12,
				is_spell = true,
				fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
				kind = "magma_projectile",
				alert_sound_range_hit = 2,
				num_layers_spread = 2,
				aim_assist_max_ramp_multiplier = 0.8,
				aim_assist_ramp_decay_delay = 0.3,
				apply_recoil = true,
				hit_effect = "magma_impact",
				bullseye = false,
				anim_time_scale = 0.9,
				range = 100,
				fire_sound_event = "player_combat_weapon_bw_deus_01_fireball_fire",
				overcharge_type = "magma_basic",
				charge_value = "light_attack",
				fire_time = 0.27,
				fire_sound_on_husk = true,
				shot_count = 12,
				damage_profile = "staff_magma",
				speed = 7000,
				aim_assist_ramp_multiplier = 0.4,
				anim_event = "attack_shoot_fireball",
				total_time = 1,
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
				large_charge_value = 0,
				fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
				aoe_name = "magma",
				kind = "geiser",
				anim_end_event = "attack_finished",
				damage_profile = "geiser_magma_no_damage",
				medium_charge_value = 0,
				overcharge_type_heavy = "magma_charged_2",
				alert_enemies = true,
				small_charge_value = 0,
				fire_sound_on_husk = true,
				fire_sound_event = "player_combat_weapon_bw_deus_01_magma_fire",
				spell_proc_time = 0.2,
				damage_window_end = 0,
				overcharge_type = "magma_charged",
				alert_sound_range_fire = 12,
				fire_time = 0,
				is_spell = true,
				can_proc_in_inn = true,
				speed = 1500,
				apply_recoil = true,
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
				projectile_info = Projectiles.default,
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
				charge_sound_stop_event = "player_combat_weapon_bw_deus_01_charge_down",
				scale_chain_window_by_charge_time_buff = true,
				charge_ready_sound_event = "hud_gameplay_stance_deactivate",
				min_radius = 0.5,
				kind = "geiser_targeting",
				debug_draw = false,
				scale_anim_by_charge_time_buff = false,
				crosshair_style = "dot",
				attack_template = "staff_magma_charge",
				overcharge_interval = 0.3,
				charge_sound_switch = "projectile_charge_sound",
				charge_sound_husk_stop_event = "stop_player_combat_weapon_bw_deus_01_charge_husk",
				angle = 0,
				minimum_hold_time = 0.1,
				particle_effect = "fx/wpnfx_staff_geiser_charge",
				anim_end_event = "attack_geiser_end",
				fire_time = 0.1,
				speed = 15,
				anim_event = "attack_geiser_start",
				charge_sound_name = "player_combat_weapon_bw_deus_01_charge",
				height = 6,
				fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
				charge_sound_husk_name = "player_combat_weapon_bw_deus_01_charge_husk",
				gravity = -9.82,
				overcharge_type = "charging",
				charge_time = 0.6,
				hold_input = "action_two_hold",
				max_radius = 1,
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
						start_time = 0.5,
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
				charge_sound_stop_event = "stop_player_combat_weapon_bw_deus_01_cooldown",
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
				charge_sound_name = "player_combat_weapon_bw_deus_01_cooldown",
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
	},
	overcharge_data = {
		explosion_template = "overcharge_explosion_brw",
		overcharge_threshold = 10,
		hit_overcharge_threshold_sound = "ui_special_attack_ready",
		time_until_overcharge_decreases = 0.5,
		overcharge_value_decrease_rate = 1
	},
	attack_meta_data = {
		max_range = 12,
		obstruction_fuzzyness_range_charged = 3.5,
		aim_at_node = "j_spine1",
		max_range_charged = 18,
		ignore_enemies_for_obstruction = true,
		effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored)
	},
	default_spread_template = "bw_deus_01",
	right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff",
	right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff,
	left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
	left_hand_attachment_node_linking = AttachmentNodeLinking.fireball,
	display_unit = "units/weapons/weapon_display/display_staff",
	wield_anim = "to_staff",
	crosshair_style = "arrows",
	buff_type = "RANGED",
	weapon_type = "FIRE_STAFF",
	fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	particle_fx = {
		wield = {
			{
				orphaned_policy = "stop",
				effect = "fx/wpnfx_bw_deus_01_1p",
				third_person = false,
				link_target = "right_weapon",
				first_person = true,
				link_node = "fx_base",
				destroy_policy = "stop_spawning"
			},
			{
				orphaned_policy = "stop",
				effect = "fx/wpnfx_bw_deus_01",
				third_person = true,
				link_target = "right_weapon",
				first_person = false,
				link_node = "fx_base",
				destroy_policy = "stop_spawning"
			}
		}
	},
	particle_fx_lookup = table.mirror_array_inplace(table.keys(weapon_template.particle_fx)),
	wwise_dep_right_hand = {
		"wwise/bw_deus_01"
	},
	dodge_distance = 1,
	dodge_speed = 1,
	aim_assist_settings = {
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
	},
	weapon_diagram = {
		light_attack = {
			[DamageTypes.ARMOR_PIERCING] = 4,
			[DamageTypes.CLEAVE] = 6,
			[DamageTypes.SPEED] = 2,
			[DamageTypes.STAGGER] = 2,
			[DamageTypes.DAMAGE] = 5
		},
		heavy_attack = {
			[DamageTypes.ARMOR_PIERCING] = 1,
			[DamageTypes.CLEAVE] = 7,
			[DamageTypes.SPEED] = 3,
			[DamageTypes.STAGGER] = 0,
			[DamageTypes.DAMAGE] = 3
		}
	},
	tooltip_keywords = {
		"weapon_keyword_damage_over_time",
		"weapon_keyword_crowd_control",
		"weapon_keyword_charged_attack"
	},
	tooltip_compare = {
		light = {
			action_name = "action_one",
			sub_action_name = "default"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "geiser_launch"
		}
	},
	tooltip_detail = {
		light = {
			action_name = "action_one",
			sub_action_name = "default"
		},
		heavy = {
			action_name = "action_one",
			sub_action_name = "geiser_launch"
		}
	}
}

return {
	bw_deus_01_template_1 = table.clone(weapon_template)
}
