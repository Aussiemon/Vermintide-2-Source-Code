-- chunkname: @scripts/settings/equipment/weapon_templates/repeating_handguns.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			additional_critical_strike_chance = 0,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 1.5,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			critical_hit_effect = "bullet_critical_impact",
			damage_profile = "shot_repeating",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "handgun",
			reload_time = 0.5,
			reload_when_out_of_ammo = true,
			total_time = 0.65,
			total_time_secondary = 1.75,
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
					release_required = "action_one_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.4,
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
				vertical_climb = 4,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
			critical_strike = {},
		},
		bullet_spray = {
			additional_critical_strike_chance = 0,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 1.5,
			ammo_usage = 1,
			anim_event = "attack_shoot_fast",
			anim_event_last_ammo = "attack_shoot_fast_last",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			critical_hit_effect = "bullet_critical_impact",
			damage_profile = "shot_repeating",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			hold_input = "action_two_hold",
			kind = "handgun",
			recoil_factor = 0.6,
			reload_time = 0.5,
			reload_when_out_of_ammo = true,
			total_time = 0.66,
			total_time_secondary = 2,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			on_chain_keep_audio_loops = {
				"aim",
			},
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.4,
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
					input = "action_one_hold",
					start_time = 0.2,
					sub_action = "bullet_spray",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.55,
					sub_action = "spray_loop",
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
				restore_duration = 0.13,
				vertical_climb = 2.5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
			critical_strike = {},
		},
	},
	action_two = {
		default = {
			action_priority = 10,
			aim_sound_delay = 0.6,
			aim_sound_event = "weapon_repeating_handgun_special_cylinder",
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "lock_target",
			can_abort_reload = true,
			hold_input = "action_two_hold",
			kind = "aim",
			looping_aim_sound = true,
			minimum_hold_time = 1.5,
			unaim_sound_event = "stop_weapon_repeating_handgun_special_cylinder",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.4,
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
					start_time = 0.6,
					sub_action = "bullet_spray",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.6,
					sub_action = "bullet_spray",
				},
				{
					action = "action_one",
					input = "action_two",
					start_time = 0.6,
					sub_action = "spray_loop",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.6,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			zoom_condition_function = function ()
				return false
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end,
		},
		spray_loop = {
			aim_sound_delay = 0,
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "lock_target_loop",
			can_abort_reload = true,
			hold_input = "action_two_hold",
			kind = "aim",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			on_chain_keep_audio_loops = {
				"aim",
			},
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.4,
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
					sub_action = "bullet_spray",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.6,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			zoom_condition_function = function ()
				return false
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end,
		},
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 8,
	ammo_per_reload = 8,
	max_ammo = 40,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1.6,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_neck",
	can_charge_shot = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.repeating_handgun
weapon_template.display_unit = "units/weapons/weapon_display/display_repeating_handguns"
weapon_template.wield_anim = "to_repeating_handgun"
weapon_template.wield_anim_no_ammo = "to_repeating_handgun_noammo"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/repeating_handgun"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "REPEATING_HANDGUN"
weapon_template.crosshair_style = "default"
weapon_template.default_spread_template = "repeating_handgun"
weapon_template.spread_lerp_speed = 12
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 0.25,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 7,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 5,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/repeating_handgun_pistol",
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_rapid_fire",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_versatile",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "bullet_spray",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "bullet_spray",
	},
}

return {
	repeating_handgun_template_1 = table.clone(weapon_template),
}
