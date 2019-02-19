local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			total_time_secondary = 2,
			reload_when_out_of_ammo = true,
			kind = "handgun",
			anim_event = "attack_shoot",
			charge_value = "bullet_hit",
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			apply_recoil = true,
			speed = 16000,
			hit_effect = "bullet_impact",
			headshot_multiplier = 2,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.5,
			range = 100,
			ammo_usage = 1,
			fire_time = 0,
			aim_assist_ramp_decay_delay = 0.2,
			anim_event_secondary = "reload",
			aim_assist_ramp_multiplier = 0.1,
			damage_profile = "shot_carbine",
			reload_time = 0.1,
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				},
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
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine"
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		fast_shot = {
			reload_when_out_of_ammo = true,
			charge_value = "bullet_hit",
			kind = "handgun",
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			spread_template_override = "pistol_special",
			apply_recoil = true,
			damage_profile = "shot_carbine",
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			aim_assist_ramp_multiplier = 0.05,
			aim_assist_max_ramp_multiplier = 0.3,
			minimum_hold_time = 0.25,
			range = 100,
			ammo_usage = 1,
			fire_time = 0,
			aim_assist_auto_hit_chance = 0.75,
			aim_assist_ramp_decay_delay = 0.1,
			speed = 16000,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot_fast",
			reload_time = 0.1,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					input = "action_one_hold"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine"
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			anim_event = "lock_target",
			can_abort_reload = true,
			allow_hold_toggle = true,
			anim_end_event = "attack_finished",
			kind = "dummy",
			minimum_hold_time = 0.25,
			spread_template_override = "pistol_special",
			hold_input = "action_two_hold",
			ammo_requirement = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "fast_shot",
					start_time = 0,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					input = "action_one_hold"
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end
		}
	},
	weapon_reload = ActionTemplates.reload,
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
	ammo_per_reload = 2,
	max_ammo = 30,
	ammo_per_clip = 12,
	reload_on_ammo_pickup = true,
	reload_time = 1,
	play_reload_anim_on_wield_reload = true
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false
}
weapon_template.default_spread_template = "brace_of_pistols"
weapon_template.spread_lerp_speed = 5
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.pistol.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_dual_pistol"
weapon_template.reload_event = "reload"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "BRACE_OF_PISTOLS"
weapon_template.dodge_count = 100
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.aim_assist_settings = {
	max_range = 22,
	no_aim_input_multiplier = 0,
	aim_at_node = "j_spine",
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
	"wwise/handgun_rifle"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/handgun_rifle"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_rapid_fire",
	"weapon_keyword_versatile"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "fast_shot"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "fast_shot"
	}
}

return {
	brace_of_pistols_template_1 = table.clone(weapon_template)
}
