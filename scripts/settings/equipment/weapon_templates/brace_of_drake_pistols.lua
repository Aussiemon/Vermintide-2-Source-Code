-- chunkname: @scripts/settings/equipment/weapon_templates/brace_of_drake_pistols.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 5,
			anim_event = "attack_shoot",
			apply_recoil = true,
			charge_value = "light_attack",
			fire_at_gaze_setting = "tobii_fire_at_gaze_drake_pistols",
			fire_sound_event = "player_combat_weapon_drakepistol_fire",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_time = 0,
			hit_effect = "drakefire_pistol",
			kind = "charged_projectile",
			overcharge_type = "brace_of_drake_pistols_basic",
			ranged_attack = true,
			reload_time = 1.25,
			speed = 6000,
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.75,
					external_multiplier = 0.9,
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
					chain_ready_sound = "weapon_gun_ready",
					input = "action_one",
					release_required = "action_two_hold",
					sound_time_offset = -0.05,
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.7,
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
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0.15,
				impact = 0.15,
			},
			projectile_info = Projectiles.brace_of_drake_pistols_shot,
			impact_data = {
				damage_profile = "shot_drakefire",
				targets = 1,
			},
			timed_data = {
				life_time = 1,
				aoe = ExplosionTemplates.drake_pistol_aoe,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 5,
			anim_event = "attack_shoot_charged",
			apply_recoil = true,
			area_damage = true,
			charge_value = "light_attack",
			damage_profile = "blast",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_at_gaze_setting = false,
			fire_sound_event = "player_combat_weapon_drakepistol_fire",
			fire_sound_event_parameter = "drakegun_charge_fire",
			fire_time = 0,
			hit_effect = "drake_impact",
			kind = "bullet_spray",
			overcharge_type = "shotgun",
			ranged_attack = true,
			spread_template_override = "drake_pistol_charged",
			total_time = 1,
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
					start_time = 0.7,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					send_buffer = true,
					start_time = 0.7,
					sub_action = "default",
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
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 15,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "attack_charge",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_effect_name = "fx/wpnfx_drake_pistol_charge",
			charge_sound_name = "player_combat_weapon_drakepistol_charge",
			charge_sound_stop_event = "player_combat_weapon_drakepistol_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			crosshair_style = "shotgun",
			fire_at_gaze_setting = false,
			hold_input = "action_two_hold",
			kind = "charge",
			minimum_hold_time = 0.2,
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			spread_template_override = "drake_pistol_charged",
			weapon_action_hand = "both",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.75,
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
			charge_sound_name = "weapon_drakegun_cooldown_loop",
			charge_sound_stop_event = "stop_weapon_drakegun_cooldown_loop",
			charge_time = 3,
			do_not_validate_with_hold = true,
			fire_at_gaze_setting = false,
			hold_input = "weapon_reload_hold",
			kind = "charge",
			minimum_hold_time = 0.5,
			uninterruptible = true,
			vent_overcharge = true,
			weapon_action_hand = "both",
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
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
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

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.04,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	aim_at_node_charged = "j_spine1",
	can_charge_shot = true,
	charge_when_obstructed = true,
	charge_when_outside_max_range_charged = false,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = true,
	max_range = 20,
	max_range_charged = 6,
	minimum_charge_time = 0.21,
	obstruction_fuzzyness_range = 1,
	obstruction_fuzzyness_range_charged = 6,
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
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
	effective_against_charged = bit.bor(BreedCategory.Infantry, BreedCategory.Armored),
}

local charge_action = weapon_template.actions.action_two.default

charge_action.loaded_projectile_settings = "none"
weapon_template.default_spread_template = "brace_of_drake_pistols"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.drake_pistol.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.drake_pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_drakefire_pistols"
weapon_template.wield_anim = "to_drakefire_pistols"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/drakefire_pistol"
weapon_template.crosshair_style = "arrows"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_drake_pistols"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "DRAKEFIRE"
weapon_template.dodge_count = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/drakegun",
}
weapon_template.wwise_dep_left_hand = {
	"wwise/drakegun",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 1,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_overheat",
	"weapon_keyword_crowd_control",
	"weapon_keyword_damage_over_time",
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
	brace_of_drakefirepistols_template_1 = table.clone(weapon_template),
}
