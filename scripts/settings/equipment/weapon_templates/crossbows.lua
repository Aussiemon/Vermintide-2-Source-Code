local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			attack_template = "bolt_sniper",
			unhide_ammo_on_infinite_ammo = true,
			kind = "crossbow",
			anim_event_no_ammo_left = "attack_shoot_last",
			alert_sound_range_hit = 2,
			charge_value = "arrow_hit",
			reload_when_out_of_ammo = true,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			ammo_usage = 1,
			alert_sound_range_fire = 4,
			weapon_action_hand = "left",
			anim_event_infinite_ammo = "attack_shoot_no_reload",
			speed = 12000,
			active_reload_time = 0.25,
			aim_assist_ramp_multiplier = 0.3,
			anim_event = "attack_shoot",
			total_time = 0.42,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 3,
				damage_profile = "crossbow_bolt",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoomed_shot = {
			reset_aim_on_attack = true,
			anim_end_event = "to_unzoom",
			kind = "crossbow",
			anim_event_no_ammo_left = "attack_shoot_last",
			additional_critical_strike_chance = 0.1,
			attack_template = "bolt_sniper",
			weapon_action_hand = "left",
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 2,
			reload_when_out_of_ammo = true,
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			minimum_hold_time = 0.5,
			charge_value = "zoomed_arrow_hit",
			ammo_usage = 1,
			anim_event_infinite_ammo = "attack_shoot_no_reload",
			apply_recoil = true,
			unhide_ammo_on_infinite_ammo = true,
			speed = 12000,
			active_reload_time = 0.25,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.55,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 3,
				damage_profile = "crossbow_bolt",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			anim_end_event = "to_unzoom",
			can_abort_reload = false,
			kind = "aim",
			cooldown = 0.3,
			aim_assist_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.3,
			aim_sound_delay = 0.2,
			ammo_requirement = 1,
			minimum_hold_time = 0.15,
			weapon_action_hand = "left",
			reset_aim_assist_on_exit = true,
			aim_at_gaze_setting = "tobii_aim_at_gaze_crossbow",
			aim_assist_max_ramp_multiplier = 1,
			hold_input = "action_two_hold",
			anim_event = "to_zoom",
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
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "zoomed_shot",
					start_time = 0.15,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
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
	action_wield = ActionTemplates.wield_left
}
weapon_template.ammo_data = {
	max_ammo = 20,
	ammo_per_reload = 1,
	ammo_per_clip = 1,
	play_reload_anim_on_wield_reload = true,
	has_wield_reload_anim = true,
	ammo_hand = "left",
	destroy_when_out_of_ammo = false,
	reload_on_ammo_pickup = true,
	reload_time = 1,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.bolt
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	aim_at_node_charged = "j_neck",
	minimum_charge_time = 0.45,
	charge_above_range = 20,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored)
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0.3,
	always_auto_aim = true,
	base_multiplier = 0.1,
	target_node = "j_neck",
	effective_max_range = 40,
	breed_scalars = {
		skaven_storm_vermin = 1.2,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.02,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "crossbow"
weapon_template.spread_lerp_speed = 6
weapon_template.spread_lerp_speed_zoom = 3.5
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.crossbow
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_crossbow"
weapon_template.wield_anim = "to_crossbow_loaded"
weapon_template.wield_anim_no_ammo = "to_crossbow_noammo"
weapon_template.wield_anim_not_loaded = "to_crossbow"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "CROSSBOW"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/crossbow"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_sniper",
	"weapon_keyword_piercing_bolts"
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
	crossbow_template_1 = table.clone(weapon_template)
}
