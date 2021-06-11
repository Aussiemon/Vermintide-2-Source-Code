local ARROW_HIT_EFFECT = "we_deus_01_arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2

local function check_energy_condition_func(unit, input_extension, ammo_extension)
	local energy_extension = ScriptUnit.has_extension(unit, "energy_system")

	return energy_extension and energy_extension:is_drainable()
end

local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "bow_energy",
			charge_value = "arrow_hit",
			weapon_action_hand = "left",
			apply_recoil = true,
			ammo_usage = 0,
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			anim_event_last_ammo = "attack_shoot_fast",
			fire_sound_event = "player_combat_weapon_we_deus_01_fire_light",
			speed = 9000,
			drain_amount = 5,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "attack_shoot_fast",
			total_time = 0.83,
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
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.75,
					start_time = 0.65,
					action = "action_one",
					sub_action = "default",
					input = "action_one_softbutton_gamepad",
					end_time = math.huge
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
					start_time = 0.65,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			condition_func = check_energy_condition_func,
			chain_condition_func = check_energy_condition_func,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.we_deus_01,
			impact_data = {
				damage_profile = "we_deus_01"
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
			anim_time_scale = 1.25,
			kind = "bow_energy",
			attack_template = "arrow_carbine",
			charge_value = "zoomed_arrow_hit",
			weapon_action_hand = "left",
			anim_event_last_ammo = "attack_shoot",
			minimum_hold_time = 0.4,
			apply_recoil = true,
			ammo_usage = 0,
			fire_sound_event = "player_combat_weapon_we_deus_01_fire_heavy",
			anim_end_event = "to_unzoom",
			speed = 16000,
			drain_amount = 7,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 0.6,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.55,
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
			chain_condition_func = check_energy_condition_func,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.we_deus_01,
			impact_data = {
				damage_profile = "we_deus_01",
				aoe = ExplosionTemplates.we_deus_01_large
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
		shoot_special_charged = {
			reset_aim_on_attack = true,
			anim_time_scale = 1.25,
			kind = "bow_energy",
			charge_value = "zoomed_arrow_hit",
			weapon_action_hand = "left",
			anim_end_event = "to_unzoom",
			apply_recoil = true,
			anim_event_last_ammo = "attack_shoot",
			minimum_hold_time = 0.4,
			ammo_usage = 0,
			fire_sound_event = "player_combat_weapon_we_deus_01_fire_heavy",
			speed = 16000,
			drain_amount = 6,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 0.6,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.25,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.55,
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
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.we_deus_01,
			impact_data = {
				damage_profile = "we_deus_01",
				aoe = ExplosionTemplates.we_deus_01_small
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			chain_condition_func = check_energy_condition_func,
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
			default_zoom = "zoom_in_trueflight",
			kind = "aim_energy",
			ammo_usage = 0,
			weapon_action_hand = "left",
			aim_zoom_delay = 0.01,
			anim_time_scale = 1.25,
			aim_sound_delay = 0.5,
			aim_at_gaze_setting = "tobii_aim_at_gaze_longbow",
			anim_end_event = "draw_cancel",
			aim_sound_event = "player_combat_weapon_we_deus_01_tighten_grip_loop",
			minimum_hold_time = 0.2,
			aim_assist_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.2,
			drain_rate = 0,
			unaim_sound_event = "stop_player_combat_weapon_we_deus_01_tighten_grip_loop",
			charge_time = 0.5,
			aim_assist_max_ramp_multiplier = 0.8,
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
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield",
					end_time = math.huge
				},
				{
					sub_action = "shoot_special_charged",
					start_time = 0.3,
					action = "action_one",
					end_time = 0.65,
					input = "action_one"
				},
				{
					sub_action = "shoot_charged",
					start_time = 0.65,
					action = "action_one",
					input = "action_one",
					end_time = math.huge
				},
				{
					softbutton_threshold = 0.75,
					start_time = 0.5,
					action = "action_one",
					sub_action = "shoot_charged",
					input = "action_one_softbutton_gamepad",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.65,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			condition_func = check_energy_condition_func,
			action_on_energy_drained = {
				action_name = "action_one",
				sub_action_name = "shoot_charged"
			},
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			zoom_condition_function = function ()
				return true
			end,
			unzoom_condition_function = function (end_reason)
				return end_reason ~= "new_interupting_action"
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
	hide_ammo_ui = true,
	ammo_per_reload = 1,
	infinite_ammo = true,
	ammo_per_clip = 1,
	ammo_hand = "left",
	max_ammo = 1,
	reload_on_ammo_pickup = true,
	reload_time = 0,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	minimum_charge_time = 0.55,
	charged_attack_action_name = "shoot_special_charged",
	can_charge_shot = true,
	max_range = 30,
	aim_at_node_charged = "j_spine1",
	max_range_charged = 50,
	ignore_enemies_for_obstruction_charged = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Armored, BreedCategory.Special, BreedCategory.SuperArmor, BreedCategory.Boss),
	effective_against_charged = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Armored, BreedCategory.Special, BreedCategory.Shielded, BreedCategory.SuperArmor, BreedCategory.Boss)
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "longbow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim = "to_longbow"
weapon_template.wield_anim_no_ammo = "to_longbow_noammo"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
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
	},
	we_deus_01_kerillian_critical_bleed_dot_disable = {}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/we_deus_01"
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
	"weapon_keyword_armour_piercing",
	"weapon_keyword_sniper",
	"weapon_keyword_versatile"
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
			chain_start_time = 0.65,
			sub_action_name = "shoot_charged"
		},
		{
			action_name = "action_one",
			chain_start_time = 0.8,
			sub_action_name = "shoot_special_charged"
		},
		custom_chain = true
	}
}

return {
	we_deus_01_template_1 = table.clone(weapon_template)
}
