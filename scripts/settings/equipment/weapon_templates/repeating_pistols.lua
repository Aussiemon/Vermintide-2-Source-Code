-- chunkname: @scripts/settings/equipment/weapon_templates/repeating_pistols.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.2,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 1.5,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			damage_profile = "shot_machinegun",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_repeating_pistol",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "handgun",
			reload_time = 1.25,
			reload_when_out_of_ammo = true,
			total_time = 0.5,
			total_time_secondary = 2,
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
					release_required = "action_one_hold",
					start_time = 0.1,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.1,
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
				restore_duration = 0.15,
				vertical_climb = 0.75,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		bullet_spray = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			ammo_requirement = 1,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			apply_recoil = true,
			bullseye = false,
			charge_value = "light_attack",
			damage_profile = "shot_machinegun_shotgun",
			damage_window_end = 0,
			damage_window_start = 0,
			fire_at_gaze_setting = "tobii_fire_at_gaze_repeating_pistol",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "shotgun",
			num_layers_spread = 1,
			play_reload_animation = true,
			range = 50,
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			shot_count = 8,
			special_ammo_thing = true,
			spread_pitch = 0.5,
			spread_template_override = "repeating_handgun_special",
			total_time = 1,
			use_ammo_at_time = 0.3,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					start_time = 1,
					sub_action = "default",
				},
			},
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = -4,
				restore_duration = 0.5,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
		},
	},
	action_two = {
		default = {
			aim_sound_delay = 0.6,
			aim_sound_event = "weapon_repeater_special_cylinder",
			allow_hold_toggle = true,
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "lock_target",
			can_abort_reload = true,
			crosshair_style = "shotgun",
			fire_at_gaze_setting = "tobii_fire_at_gaze_repeating_pistol",
			hold_input = "action_two_hold",
			kind = "aim",
			minimum_hold_time = 0.5,
			spread_template_override = "repeating_handgun_special",
			unaim_sound_event = "stop_weapon_repeater_special_cylinder",
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
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.6,
					sub_action = "default",
				},
			},
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
	reload_time = 1.5,
	should_update_anim_ammo = true,
}
weapon_template.default_spread_template = "repeating_pistol"
weapon_template.right_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.repeater_pistol
weapon_template.display_unit = "units/weapons/weapon_display/display_repeating_pistols"
weapon_template.wield_anim = "to_repeater_pistol"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/repeater_pistol"
weapon_template.crosshair_style = "default"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_repeating_pistol"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "REPEATING_PISTOL"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_neck",
	can_charge_shot = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
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
weapon_template.wwise_dep_right_hand = {
	"wwise/repeating_handgun_pistol",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 7,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 3,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 7,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_rapid_fire",
	"weapon_keyword_close_range",
	"weapon_keyword_high_damage",
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
		action_name = "action_two",
		sub_action_name = "default",
	},
}

return {
	repeating_pistol_template_1 = table.clone(weapon_template),
}
