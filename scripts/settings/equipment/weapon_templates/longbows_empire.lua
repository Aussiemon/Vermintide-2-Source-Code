local ARROW_HIT_EFFECT = "arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			charge_value = "arrow_hit",
			kind = "bow",
			weapon_action_hand = "left",
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_light",
			apply_recoil = true,
			ammo_usage = 1,
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			anim_event_last_ammo = "attack_shoot_fast_last",
			override_reload_time = 0.25,
			speed = 6500,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_shoot_fast",
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.5,
					end_time = 0.3,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and (ammo_extension:total_remaining_ammo() <= 0 or ammo_extension:is_reloading()) then
					return false
				end

				return true
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.carbine_arrow,
			impact_data = {
				wall_nail = true,
				depth = 0.1,
				targets = 1,
				damage_profile = "arrow_carbine",
				link = true,
				depth_offset = -0.6
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged = {
			reset_aim_on_attack = true,
			play_reload_animation = true,
			kind = "bow",
			charge_value = "zoomed_arrow_hit",
			weapon_action_hand = "left",
			unzoom_time = 0.3,
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_heavy",
			anim_event_last_ammo = "attack_shoot_last",
			anim_end_event = "to_unzoom",
			apply_recoil = true,
			ammo_usage = 1,
			override_reload_time = 0.5,
			reload_event_delay_time = 0.3,
			speed = 10000,
			reload_animation_override = "reload",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_two",
					send_buffer = true,
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.sniper_arrow,
			impact_data = {
				wall_nail = true,
				depth = 0.15,
				targets = 1,
				damage_profile = "longbow_empire",
				link = true,
				depth_offset = -0.6
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		shoot_charged_heavy = {
			reset_aim_on_attack = true,
			play_reload_animation = true,
			kind = "bow",
			charge_value = "zoomed_arrow_hit",
			weapon_action_hand = "left",
			unzoom_time = 0.3,
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_heavy",
			anim_event_last_ammo = "attack_shoot_last",
			reload_event_delay_time = 0.3,
			apply_recoil = true,
			ammo_usage = 1,
			override_reload_time = 0.5,
			anim_end_event = "to_unzoom",
			speed = 16000,
			reload_animation_override = "reload",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 2.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.85,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.sniper_arrow,
			impact_data = {
				wall_nail = true,
				depth = 0.15,
				targets = 1,
				damage_profile = "arrow_sniper_kruber",
				link = true,
				depth_offset = -0.6
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			cooldown = 0.2,
			anim_time_scale = 2.2,
			kind = "aim",
			weapon_action_hand = "left",
			aim_sound_event = "player_combat_weapon_bow_tighten_grip_loop",
			aim_zoom_delay = 1,
			spread_template_override = "empire_longbow",
			aim_sound_delay = 0.1,
			anim_end_event = "draw_cancel",
			aim_at_gaze_setting = "tobii_aim_at_gaze_longbow_empire",
			aim_assist_ramp_multiplier = 0.6,
			wield_blend_event = "equip_end",
			minimum_hold_time = 0.2,
			aim_assist_max_ramp_multiplier = 0.8,
			heavy_aim_flow_delay = 0.9,
			ammo_usage = 1,
			unaim_sound_event = "stop_player_combat_weapon_bow_tighten_grip_loop",
			aim_assist_ramp_decay_delay = 0.2,
			charge_time = 0.5,
			heavy_aim_flow_event = "lua_heavy_zoom",
			hold_input = "action_two_hold",
			anim_event = "draw_bow",
			allow_hold_toggle = true,
			reload_when_out_of_ammo = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.0001,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield",
					end_time = math.huge
				},
				{
					sub_action = "shoot_charged_heavy",
					start_time = 1.25,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
				},
				{
					sub_action = "shoot_charged",
					start_time = 0.5,
					action = "action_one",
					end_time = 0.8,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
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
	action_wield = ActionTemplates.wield_left,
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
	ammo_per_reload = 1,
	ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
	ammo_hand = "left",
	ammo_per_clip = 1,
	ammo_unit_3p = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1_3p",
	max_ammo = 20,
	reload_on_ammo_pickup = true,
	reload_time = 0.65,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	aim_at_node_charged = "j_head",
	minimum_charge_time = 0.55,
	charge_against_armored_enemy = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "bow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim_not_loaded = "to_es_longbow"
weapon_template.wield_anim = "to_es_longbow"
weapon_template.wield_anim_no_ammo = "to_es_longbow_noammo"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "LONGBOW"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/bow"
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 30,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_sniper",
	"weapon_keyword_armour_piercing"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "shoot_charged"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		{
			action_name = "action_one",
			chain_start_time = 0.5,
			sub_action_name = "shoot_charged"
		},
		{
			action_name = "action_one",
			chain_start_time = 1.25,
			sub_action_name = "shoot_charged_heavy"
		},
		custom_chain = true
	}
}
local longbow_empire_template = table.clone(weapon_template)
local longbow_empire_tutorial_template = table.clone(weapon_template)
longbow_empire_tutorial_template.actions.action_one.default.impact_data.damage_profile = "tutorial_longbow"
longbow_empire_tutorial_template.actions.action_one.shoot_charged.impact_data.damage_profile = "tutorial_longbow_charged"
longbow_empire_tutorial_template.actions.action_one.shoot_charged_heavy.impact_data.damage_profile = "tutorial_longbow_charged"

return {
	longbow_empire_template = longbow_empire_template,
	longbow_empire_tutorial_template = longbow_empire_tutorial_template
}
