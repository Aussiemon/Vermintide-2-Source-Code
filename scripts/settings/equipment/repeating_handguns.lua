local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.1,
			kind = "handgun",
			total_time_secondary = 1.75,
			headshot_multiplier = 2,
			critical_hit_effect = "bullet_critical_impact",
			charge_value = "bullet_hit",
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 1.5,
			reload_when_out_of_ammo = true,
			apply_recoil = true,
			hit_effect = "bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			damage_profile = "shot_repeating",
			additional_critical_strike_chance = 0,
			damage_window_end = 0,
			aim_assist_max_ramp_multiplier = 0.3,
			ammo_usage = 1,
			fire_time = 0,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_ramp_decay_delay = 0.2,
			anim_event_secondary = "reload",
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_shoot",
			reload_time = 0.5,
			total_time = 0.65,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return input_extension.reset_release_input(input_extension)
			end,
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 4,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			},
			critical_strike = {}
		},
		bullet_spray = {
			damage_window_start = 0.1,
			damage_profile = "shot_repeating",
			critical_hit_effect = "bullet_critical_impact",
			kind = "handgun",
			recoil_factor = 0.6,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 1.5,
			reload_when_out_of_ammo = true,
			apply_recoil = true,
			total_time_secondary = 2,
			additional_critical_strike_chance = 0,
			hit_effect = "bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			headshot_multiplier = 2,
			damage_window_end = 0,
			aim_assist_ramp_multiplier = 0.1,
			ammo_usage = 1,
			fire_time = 0,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.5,
			anim_event_secondary = "reload",
			aim_assist_ramp_decay_delay = 0.2,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			reload_time = 0.5,
			charge_value = "bullet_hit",
			total_time = 0.66,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
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
					sub_action = "bullet_spray",
					start_time = 0.2,
					action = "action_one",
					auto_chain = true
				},
				{
					sub_action = "bullet_spray",
					start_time = 0.2,
					action = "action_one",
					input = "action_one_hold"
				}
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.13,
				vertical_climb = 2.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			},
			critical_strike = {}
		}
	},
	action_two = {
		default = {
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			kind = "aim",
			unaim_sound_event = "stop_weapon_repeating_handgun_special_cylinder",
			can_abort_reload = true,
			aim_sound_delay = 0.6,
			hold_input = "action_two_hold",
			anim_event = "lock_target",
			aim_sound_event = "weapon_repeating_handgun_special_cylinder",
			minimum_hold_time = 1.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.4,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "bullet_spray",
					start_time = 0.6,
					action = "action_one",
					input = "action_one"
				}
			},
			zoom_condition_function = function ()
				return false
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension.total_remaining_ammo(ammo_extension) <= 0 then
					return false
				end

				return true
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
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_reload = 8,
	max_ammo = 32,
	ammo_per_clip = 8,
	play_reload_anim_on_wield_reload = true,
	reload_time = 1.3,
	reload_on_ammo_pickup = true
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	can_charge_shot = false
}
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.repeating_handgun
weapon_template.display_unit = "units/weapons/weapon_display/display_rifle"
weapon_template.wield_anim = "to_repeating_handgun"
weapon_template.wield_anim_no_ammo = "to_repeating_handgun_noammo"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "REPEATING_HANDGUN"
weapon_template.crosshair_style = "default"
weapon_template.default_spread_template = "repeating_handgun"
weapon_template.spread_lerp_speed = 12
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.aim_assist_settings = {
	max_range = 22,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/repeating_handgun_pistol"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_rapid_fire",
	"weapon_keyword_armour_piercing",
	"weapon_keyword_versatile"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.4,
			range = 0.6,
			damage = 0.5,
			targets = 0.2,
			stagger = 0.4
		},
		heavy_attack = {
			speed = 0.8,
			range = 0.5,
			damage = 0.5,
			targets = 0.2,
			stagger = 0.4
		}
	},
	perks = {
		light_attack = {
			"armor_penetration"
		},
		heavy_attack = {
			"armor_penetration"
		}
	}
}
Weapons = Weapons or {}
Weapons.repeating_handgun_template_1 = table.clone(weapon_template)

return 
