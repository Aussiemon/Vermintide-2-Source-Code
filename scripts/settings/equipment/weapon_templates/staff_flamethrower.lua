-- chunkname: @scripts/settings/equipment/weapon_templates/staff_flamethrower.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_end_event = "attack_finished",
			anim_event = "attack_shoot_flamethrower",
			anim_time_scale = 1,
			area_damage = true,
			charge_value = "light_attack",
			damage_interval = 0.5,
			damage_profile = "flamethrower_spray",
			dot_check = 0.97,
			fire_sound_event = "Play_player_combat_weapon_staff_flamethrower_shoot",
			fire_sound_on_husk = true,
			fire_stop_time = 0.55,
			fire_time = 0.3,
			hit_effect = "flamethrower",
			hold_input = "action_one_hold",
			is_spell = true,
			kind = "flamethrower",
			minimum_hold_time = 2,
			no_headshot_sound = true,
			overcharge_interval = 0.5,
			overcharge_type = "spear_3",
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			spray_range = 7,
			stop_fire_event = "Stop_player_combat_weapon_staff_flamethrower_shoot",
			total_time = 1.3,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.25,
					external_multiplier = 0.5,
					start_time = 0,
				},
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 1,
					start_time = 0.25,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 1,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.75,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_end_event = "attack_finished",
			anim_event = "attack_shoot_flamethrower_charged",
			area_damage = true,
			charge_fuel_time_multiplier = 5,
			charge_value = "light_attack",
			damage_interval = 0.25,
			damage_profile = "flamethrower",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "Play_player_combat_weapon_staff_flamethrower_shoot_charged",
			fire_sound_on_husk = true,
			fire_time = 0.3,
			hit_effect = "flamethrower",
			hold_input = "action_one_hold",
			initial_damage_profile = "flamethrower_initial",
			is_spell = true,
			kind = "flamethrower",
			minimum_hold_time = 0.75,
			no_headshot_sound = true,
			overcharge_interval = 0.25,
			overcharge_type = "drakegun_charging",
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			stop_fire_event = "Stop_player_combat_weapon_staff_flamethrower_shoot",
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
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
		},
	},
	action_two = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "flamethrower_charge_start",
			charge_ready_sound_event = "weapon_staff_charge_ready",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_name = "player_combat_weapon_staff_charge",
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			hold_input = "action_two_hold",
			is_spell = true,
			kind = "charge",
			minimum_hold_time = 0.2,
			overcharge_interval = 0.3,
			overcharge_type = "flamethrower",
			remove_overcharge_on_interrupt = true,
			scale_anim_by_charge_time_buff = false,
			scale_chain_window_by_charge_time_buff = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.9,
					start_time = 0,
				},
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.7,
					external_multiplier = 0.8,
					start_time = 0.3,
				},
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 1,
					start_time = 0.7,
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
					start_time = 0.65,
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
	explosion_template = "overcharge_explosion_dwarf",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	time_until_overcharge_decreases = 0.5,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	always_charge_before_firing = false,
	can_charge_shot = false,
	charge_when_obstructed = false,
	charge_when_outside_max_range = false,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = true,
	max_range = 10,
	minimum_charge_time = 0.65,
	aim_data = {
		max_radius_pseudo_random_c = 0.03222,
		min_radius_pseudo_random_c = 0.3021,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Shielded, BreedCategory.Armored, BreedCategory.Special),
}
weapon_template.default_spread_template = "drakegun"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/staff"
weapon_template.crosshair_style = "circle"
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
	"wwise/flamethrower",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 2,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 2,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_damage_over_time",
	"weapon_keyword_charged_attack",
	"weapon_keyword_close_range",
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
	staff_flamethrower_template = weapon_template,
}
