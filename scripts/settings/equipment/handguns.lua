local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.1,
			damage_profile = "shot_sniper",
			charge_value = "light_attack",
			kind = "handgun",
			anim_event_no_ammo_left = "attack_shoot_last",
			reload_when_out_of_ammo = true,
			apply_recoil = true,
			total_time_secondary = 2,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 2,
			hit_effect = "bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			headshot_multiplier = 2,
			damage_window_end = 0,
			ammo_usage = 1,
			fire_time = 0,
			anim_event_secondary = "reload",
			active_reload_time = 0.35,
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 0.66,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.66,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.66,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.66,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.66,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension.clear_input_buffer(input_extension)

				return 
			end,
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 3,
				climb_duration = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoomed_shot = {
			damage_window_start = 0.1,
			anim_end_event = "to_unzoom",
			max_penetrations = 2,
			kind = "handgun",
			anim_event_no_ammo_left = "attack_shoot_last",
			charge_value = "light_attack",
			reload_when_out_of_ammo = true,
			apply_recoil = true,
			damage_profile = "shot_sniper",
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 2,
			hit_effect = "bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			minimum_hold_time = 0.66,
			damage_window_end = 0,
			headshot_multiplier = 3,
			ammo_usage = 1,
			fire_time = 0,
			active_reload_time = 0.35,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.7,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 3,
				climb_duration = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 3,
				climb_duration = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoom_cancel = {
			kind = "dummy",
			keep_buffer = true,
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = {
			anim_end_event = "to_unzoom",
			anim_event = "to_zoom",
			kind = "aim",
			cooldown = 0.3,
			ammo_requirement = 1,
			minimum_hold_time = 0.3,
			keep_buffer = true,
			aim_at_gaze_setting = "tobii_aim_at_gaze_handgun",
			hold_input = "action_two_hold",
			can_abort_reload = false,
			allow_hold_toggle = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "zoomed_shot",
					start_time = 0.4,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			zoom_condition_function = function ()
				return true
			end,
			unzoom_condition_function = function (end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension.total_remaining_ammo(ammo_extension) <= 0 then
					return false
				end

				return true
			end,
			aim_assist_settings = {
				max_range = 22,
				no_aim_input_multiplier = 0,
				always_auto_aim = true,
				base_multiplier = 0.15,
				target_node = "j_head",
				effective_max_range = 10,
				breed_scalars = {
					skaven_storm_vermin = 0.25,
					skaven_clan_rat = 1,
					skaven_slave = 1
				}
			}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_career_skill = ActionTemplates.career_skill_dummy,
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
	ammo_per_reload = 1,
	max_ammo = 12,
	ammo_per_clip = 1,
	play_reload_anim_on_wield_reload = true,
	reload_time = 2,
	reload_on_ammo_pickup = true
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	minimum_charge_time = 0.45,
	charged_attack_action_name = "zoomed_shot",
	can_charge_shot = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = true,
	aim_at_node_charged = "j_head"
}
weapon_template.default_spread_template = "handgun"
weapon_template.spread_lerp_speed = 3
weapon_template.spread_lerp_speed_zoom = 2.5
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.rifles
weapon_template.display_unit = "units/weapons/weapon_display/display_rifle"
weapon_template.wield_anim = "to_handgun"
weapon_template.wield_anim_no_ammo = "to_handgun_noammo"
weapon_template.crosshair_style = "default"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "HANDGUN"
weapon_template.no_dodge = true
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
	target_node = "j_spine1",
	effective_max_range = 10,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/handgun_rifle"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.2,
			range = 0.8,
			damage = 0.90625,
			targets = 0.4,
			stagger = 0.6
		},
		heavy_attack = {
			speed = 0.2,
			range = 0.9,
			damage = 0.90625,
			targets = 0.4,
			stagger = 0.6
		}
	},
	perks = {
		light_attack = {
			"head_shot",
			"armor_penetration"
		},
		heavy_attack = {
			"head_shot",
			"armor_penetration"
		}
	}
}
Weapons = Weapons or {}
Weapons.handgun_template_1 = table.clone(weapon_template)

return 
