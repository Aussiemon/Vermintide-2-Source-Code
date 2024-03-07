-- chunkname: @scripts/settings/equipment/weapon_templates/drakegun.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_end_event = "attack_finished",
			anim_event = "attack_shoot",
			area_damage = true,
			charge_value = "light_attack",
			damage_interval = 0.2,
			damage_profile = "flamethrower_spray",
			damage_window_end = 0,
			damage_window_start = 0.1,
			dot_check = 0.97,
			fire_sound_event = "Play_player_combat_weapon_drakegun_flamethrower_shoot",
			fire_sound_on_husk = true,
			fire_stop_time = 0.3,
			fire_time = 0.1,
			fx_node = "fx_muzzle",
			hit_effect = "flamethrower",
			hit_zone_override = "torso",
			hold_input = "action_one_hold",
			kind = "flamethrower",
			minimum_hold_time = 2,
			no_headshot_sound = true,
			overcharge_interval = 0.2,
			overcharge_type = "spear_3",
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			particle_effect_impact = "fx/wpnfx_flamethrower_hit_01",
			ranged_attack = true,
			spray_range = 7,
			stop_fire_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot",
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
					start_time = 0.9,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 1.1,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 1.5,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.9,
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
			anim_event = "attack_shoot_charged",
			area_damage = true,
			charge_fuel_time_multiplier = 5,
			charge_value = "light_attack",
			damage_interval = 0.25,
			damage_profile = "flamethrower",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "Play_player_combat_weapon_drakegun_flamethrower_shoot_charged",
			fire_sound_on_husk = true,
			fire_time = 0.15,
			fx_node = "fx_muzzle",
			hit_effect = "flamethrower",
			hold_input = "action_one_hold",
			initial_damage_profile = "flamethrower_initial",
			kind = "flamethrower",
			minimum_hold_time = 0.75,
			no_headshot_sound = true,
			overcharge_interval = 0.25,
			overcharge_type = "drakegun_charging",
			particle_effect_flames = "fx/wpnfx_flamethrower_1p_01",
			particle_effect_flames_3p = "fx/wpnfx_flamethrower_01",
			particle_effect_impact = "fx/wpnfx_flamethrower_hit_01",
			ranged_attack = true,
			stop_fire_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot",
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.25,
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
					action = "action_two",
					input = "action_two_hold",
					release_required = "action_two_hold",
					start_time = 0.7,
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
			anim_event = "attack_charge",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_ready_sound_event = "weapon_drakegun_charge_ready",
			charge_sound_name = "player_combat_weapon_drakegun_charge",
			charge_sound_stop_event = "player_combat_weapon_drakegun_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			hold_input = "action_two_hold",
			kind = "charge",
			minimum_hold_time = 0.2,
			overcharge_interval = 0.2,
			overcharge_type = "flamethrower",
			remove_overcharge_on_interrupt = true,
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
					start_time = 0.45,
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
			anim_end_event = "cooldown_end",
			anim_event = "cooldown_start",
			charge_sound_name = "weapon_drakegun_cooldown_loop",
			charge_sound_stop_event = "stop_weapon_drakegun_cooldown_loop",
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
	max_value = 30,
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	overcharge_warning_critical_sound_event = "drakegun_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "drakegun_overcharge_warning_high",
	overcharge_warning_low_sound_event = "drakegun_overcharge_warning_low",
	overcharge_warning_med_sound_event = "drakegun_overcharge_warning_med",
	time_until_overcharge_decreases = 0.5,
}
weapon_template.overcharge_data.critical_overcharge_margin = weapon_template.overcharge_data.max_value * 0.03
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	always_charge_before_firing = false,
	can_charge_shot = true,
	charge_when_obstructed = false,
	charge_when_outside_max_range = false,
	charged_attack_action_name = "shoot_charged",
	max_range = 15,
	minimum_charge_time = 0.1,
	obstruction_fuzzyness_range = 1,
	obstruction_fuzzyness_range_charged = 1,
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Shielded, BreedCategory.Armored, BreedCategory.Special),
}
weapon_template.default_spread_template = "drakegun"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.drakegun
weapon_template.display_unit = "units/weapons/weapon_display/display_drakegun"
weapon_template.wield_anim = "to_drakegun"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/drakegun"
weapon_template.crosshair_style = "circle"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "DRAKEFIRE"
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.85,
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.85,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 1,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 2,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_crowd_control",
	"weapon_keyword_close_range",
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
weapon_template.wwise_dep_right_hand = {
	"wwise/drakegun",
	"wwise/flamethrower",
}

return {
	drakegun_template_1 = table.clone(weapon_template),
}
