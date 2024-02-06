-- chunkname: @scripts/settings/equipment/weapon_templates/staff_fireball_fireball.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_fireball",
			apply_recoil = true,
			charge_value = "light_attack",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "player_combat_weapon_staff_fireball_fire",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.27,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_basic",
			speed = 9000,
			total_time = 1,
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
					release_required = "action_one_hold",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.3,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.fireball,
			impact_data = {
				damage_profile = "staff_fireball",
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball,
			},
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_fireball_charged",
			apply_recoil = true,
			charge_value = "light_attack",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "player_combat_weapon_staff_fireball_fire",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_sound_on_husk = true,
			fire_time = 0.3,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_charged",
			scale_overcharge = true,
			scale_power_level = 0.5,
			speed = 3000,
			throw_up_this_much_in_target_direction = 0.1,
			total_time = 1,
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
					start_time = 0.6,
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
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.fireball_charged,
			impact_data = {
				damage_profile = "staff_fireball_charged",
				aoe = ExplosionTemplates.fireball_charged,
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball_charged,
			},
			recoil_settings = {
				climb_duration = 0.2,
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
			anim_end_event = "attack_finished",
			anim_event = "attack_charge_fireball",
			anim_time_scale = 1.5,
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_name = "player_combat_weapon_staff_charge_fireball",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			hold_input = "action_two_hold",
			kind = "charge",
			minimum_hold_time = 0.3,
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			reload_when_out_of_ammo = true,
			scale_anim_by_charge_time_buff = true,
			scale_chain_window_by_charge_time_buff = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
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
					start_time = 0.2,
					sub_action = "shoot_charged",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
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
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.2,
					start_time = 0,
					end_time = math.huge,
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
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
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	time_until_overcharge_decreases = 0.5,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	aim_at_node_charged = "j_spine1",
	can_charge_shot = true,
	charge_when_obstructed = true,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = false,
	minimum_charge_time = 0.21,
	obstruction_fuzzyness_range_charged = 3,
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special),
	effective_against_charged = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
}
weapon_template.default_spread_template = "fireball"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/staff"
weapon_template.crosshair_style = "arrows"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_fireball"
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
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0,
	effective_max_range = 30,
	max_range = 50,
	no_aim_input_multiplier = 0,
	target_node = "j_spine1",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 3,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_crowd_control",
	"weapon_keyword_damage_over_time",
	"weapon_keyword_overheat",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
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
		action_name = "action_one",
		sub_action_name = "shoot_charged",
	},
}

return {
	staff_fireball_fireball_template_1 = table.clone(weapon_template),
}
