local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_wield = ActionTemplates.wield_left,
	action_one = {
		default = {
			kind = "crossbow",
			alert_sound_range_fire = 4,
			cooldown = 0.5,
			anim_event_no_ammo_left = "attack_shoot_last",
			alert_sound_range_hit = 2,
			charge_value = "arrow_hit",
			reload_when_out_of_ammo = true,
			cooldown_from_start = true,
			apply_recoil = true,
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			ammo_usage = 1,
			weapon_action_hand = "left",
			speed = 8000,
			anim_event = "attack_shoot",
			total_time = 0.75,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0.2,
				impact = 0.2
			},
			projectile_info = Projectiles.repeating_crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 2,
				damage_profile = "crossbow_bolt_repeating",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = 1,
				climb_duration = 0.15,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoomed_shot = {
			burst = true,
			reload_when_out_of_ammo = true,
			alert_sound_range_hit = 2,
			alert_sound_range_fire = 4,
			multi_projectile_spread = 0.045,
			unit_fire_sound_event = "player_combat_weapon_repeating_crossbow_elf_fire",
			ammo_usage = 1,
			weapon_action_hand = "left",
			cooldown_from_start = true,
			kind = "crossbow",
			anim_event_last_ammo = "attack_shoot",
			minimum_hold_time = 0.3,
			anim_end_event = "to_unzoom",
			speed = 8000,
			anim_event = "attack_shoot",
			apply_recoil = true,
			apply_burst_recoil = true,
			no_burst_spread = true,
			cooldown = 0.45,
			anim_event_no_ammo_left = "attack_shoot",
			unit_fire_sound_source_node = "j_crossbow_top",
			hit_effect = "arrow_impact",
			charge_value = "zoomed_arrow_hit",
			num_projectiles = 3,
			hold_input = "action_two_hold",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "zoomed_shot",
					start_time = 0.45,
					action = "action_one",
					input = "action_one",
					hold_required = {
						"action_two_hold"
					}
				},
				{
					sub_action = "default",
					start_time = 0.45,
					action = "action_one",
					input = "action_one"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0.2,
				impact = 0.2
			},
			projectile_info = Projectiles.repeating_crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 2,
				damage_profile = "crossbow_bolt_repeating",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 0.05,
				climb_duration = 0.075,
				climb_function = math.ease_out_quad,
				restore_function = math.ease_out_quad
			},
			first_recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 1,
				climb_duration = 0.075,
				climb_function = math.ease_out_quad,
				restore_function = math.ease_out_quad
			}
		},
		zoom_cancel = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = {
			default_zoom = "first_person_node",
			anim_end_event = "to_unzoom",
			kind = "aim",
			can_abort_reload = false,
			cooldown = 0.3,
			aim_sound_delay = 0.2,
			ammo_requirement = 1,
			minimum_hold_time = 0.15,
			weapon_action_hand = "left",
			aim_at_gaze_setting = "tobii_aim_at_gaze_repeating_crossbow_elf",
			hold_input = "action_two_hold",
			anim_event = "to_zoom",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.9,
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
					sub_action = "zoomed_shot",
					start_time = 0.3,
					action = "action_one",
					input = "action_one"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			zoom_condition_function = function ()
				return true
			end,
			unzoom_condition_function = function (end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end
		}
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect_left,
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
	max_ammo = 30,
	ammo_per_reload = 15,
	ammo_per_clip = 15,
	play_reload_anim_on_wield_reload = true,
	ammo_hand = "left",
	destroy_when_out_of_ammo = false,
	reload_on_ammo_pickup = false,
	reload_time = 2.5,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.repeating_bolt
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	aim_at_node_charged = "j_head",
	minimum_charge_time = 0.45,
	charge_above_range = 10,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false
}
weapon_template.default_spread_template = "repeating_handgun"
weapon_template.spread_lerp_speed = 2
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.wood_elf_repeating_crossbow
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_crossbow"
weapon_template.wield_anim = "to_repeating_crossbow_elf"
weapon_template.wield_anim_no_ammo = "to_repeating_crossbow_elf_noammo"
weapon_template.wield_anim_not_loaded = "to_repeating_crossbow_elf"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "REPEATING_CROSSBOW"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/repeating_crossbow"
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
		sub_action_name = "zoomed_shot"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_two",
		sub_action_name = "default"
	}
}

return {
	repeating_crossbow_elf_template = table.clone(weapon_template)
}
