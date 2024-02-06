-- chunkname: @scripts/settings/equipment/weapon_templates/staff_spark_spear.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_shoot_rapid_right",
			anim_time_scale = 1.5,
			apply_recoil = true,
			fire_at_gaze_setting = "tobii_fire_at_gaze_spark_spear",
			fire_sound_event = "weapon_staff_spark_spear",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.1,
			hit_effect = "staff_spark",
			hold_input = "action_one_hold",
			is_spell = true,
			kind = "charged_projectile",
			minimum_hold_time = 2,
			overcharge_type = "spark",
			speed = 9000,
			total_time = 1,
			uninterruptible = true,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.2,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					hold_allowed = true,
					input = "action_one",
					start_time = 0.2,
					sub_action = "rapid_left",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15,
			},
			projectile_info = Projectiles.spark,
			impact_data = {
				damage_profile = "fire_spark",
				depth = 0.075,
				depth_offset = -0.6,
				targets = 1,
				wall_nail = true,
			},
			timed_data = {
				life_time = 1.5,
				sound_event_name = "magic_hit",
			},
			recoil_settings = {
				climb_duration = 0.05,
				horizontal_climb = 1,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		rapid_left = {
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			anim_event = "attack_shoot_rapid_left",
			apply_recoil = true,
			attack_template = "wizard_staff_spark",
			fire_at_gaze_setting = "tobii_fire_at_gaze_spark_spear",
			fire_sound_event = "weapon_staff_spark_spear",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.1,
			hit_effect = "staff_spark",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "spark",
			speed = 9000,
			total_time = 1,
			uninterruptible = true,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.2,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15,
			},
			projectile_info = Projectiles.spark,
			impact_data = {
				damage_profile = "fire_spark",
				depth = 0.075,
				depth_offset = -0.6,
				targets = 1,
				wall_nail = true,
			},
			timed_data = {
				life_time = 1.5,
				sound_event_name = "magic_hit",
			},
			recoil_settings = {
				climb_duration = 0.05,
				horizontal_climb = -1,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 20,
			ammo_usage = 1,
			anim_event = "attack_shoot_spear_charged",
			anim_time_scale = 1.5,
			apply_recoil = true,
			charge_value = "light_attack",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.05,
			hit_effect = "staff_spear",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "spear",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			speed = 5000,
			sphere_sweep_dot_threshold = 0.5,
			sphere_sweep_length = 50,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_radius = 2,
			spread_template_override = "spear",
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload_hold",
					start_time = 0.3,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear",
			},
			timed_data = {
				life_time = 1.5,
				sound_event_name = "magic_hit",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged_2 = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 20,
			ammo_usage = 1,
			anim_event = "attack_shoot_spear_charged",
			anim_time_scale = 1.5,
			apply_recoil = true,
			charge_value = "light_attack",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.01,
			hit_effect = "staff_spear",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "spear_2",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			speed = 5000,
			sphere_sweep_dot_threshold = 0.5,
			sphere_sweep_length = 50,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_radius = 2,
			spread_template_override = "spear",
			total_time = 1,
			true_flight_template = "sniper",
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload_hold",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear_2",
			},
			timed_data = {
				life_time = 1.5,
				sound_event_name = "magic_hit",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged_3 = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 20,
			ammo_usage = 1,
			anim_event = "attack_shoot_spear_charged",
			anim_time_scale = 1.5,
			apply_recoil = true,
			charge_value = "light_attack",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.01,
			forced_charge_level = 1,
			hit_effect = "staff_spear",
			ignore_shield_hit = true,
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "spear_3",
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			speed = 5000,
			sphere_sweep_dot_threshold = 0.5,
			sphere_sweep_length = 50,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_radius = 2,
			spread_template_override = "spear",
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload_hold",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.spear,
			impact_data = {
				damage_profile = "fire_spear_3",
			},
			timed_data = {
				life_time = 1.5,
				sound_event_name = "magic_hit",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			aim_sound_delay = 0.5,
			aim_sound_event = "Play_weapon_staff_spear_charge_1",
			aim_zoom_delay = 1.25,
			anim_end_event = "attack_finished",
			anim_event = "attack_charge_spear",
			anim_time_scale = 1,
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_name = "player_combat_weapon_staff_charge",
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 1.25,
			heavy_aim_flow_delay = 1.25,
			heavy_aim_sound_event = "Play_weapon_staff_spear_charge_2",
			hold_input = "action_two_hold",
			kind = "aim",
			max_targets = 1,
			minimum_hold_time = 0.2,
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			scale_anim_by_charge_time_buff = true,
			scale_chain_window_by_charge_time_buff = true,
			sphere_sweep_dot_threshold = 0.7,
			sphere_sweep_length = 100,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_radius = 1.5,
			spread_template_override = "spear",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			zoom_condition_function = function ()
				return false
			end,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "shoot_charged_3",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.6,
					sub_action = "shoot_charged_2",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.4,
					sub_action = "shoot_charged",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
	},
	weapon_reload = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "cooldown_start",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_sound_name = "player_combat_weapon_staff_cooldown",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			do_not_validate_with_hold = true,
			hold_input = "weapon_reload_hold",
			kind = "charge",
			minimum_hold_time = 0.5,
			uninterruptible = true,
			vent_overcharge = true,
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
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.2,
					start_time = 0,
					end_time = math.huge,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	max_value = 40,
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	time_until_overcharge_decreases = 0.5,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_head",
	can_charge_shot = true,
	charge_when_obstructed = true,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = true,
	ignore_enemies_for_obstruction_charged = true,
	minimum_charge_time = 0.6,
	aim_data = {
		max_radius_pseudo_random_c = 0.0557,
		min_radius_pseudo_random_c = 0.3021,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	aim_data_charged = {
		max_radius_pseudo_random_c = 0.01475,
		min_radius_pseudo_random_c = 0.0557,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker),
	effective_against_charged = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.aim_assist_settings = {
	aim_at_node = "j_neck",
	aim_at_node_charged = "j_spine",
	base_multiplier = 0.15,
	can_charge_shot = true,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}
weapon_template.default_spread_template = "sparks"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 7,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 3,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 7,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 6,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_rapid_fire",
	"weapon_keyword_headshotting",
	"weapon_keyword_sniper",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "rapid_left",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "shoot_charged",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		{
			action_name = "action_one",
			chain_start_time = 0.4,
			sub_action_name = "shoot_charged",
		},
		{
			action_name = "action_one",
			chain_start_time = 0.6,
			sub_action_name = "shoot_charged_2",
		},
		{
			action_name = "action_one",
			chain_start_time = 1.25,
			sub_action_name = "shoot_charged_3",
		},
		custom_chain = true,
	},
}

return {
	staff_spark_spear_template_1 = table.clone(weapon_template),
}
