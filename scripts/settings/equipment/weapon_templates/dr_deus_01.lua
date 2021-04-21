local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			attack_template = "bolt_sniper",
			unhide_ammo_on_infinite_ammo = true,
			alert_sound_range_fire = 4,
			kind = "grenade_thrower",
			anim_event_no_ammo_left = "attack_shoot_last",
			alert_sound_range_hit = 10,
			charge_value = "arrow_hit",
			reload_when_out_of_ammo = true,
			aim_assist_max_ramp_multiplier = 1,
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			aim_assist_ramp_decay_delay = 0.1,
			fire_time = 0,
			apply_recoil = true,
			ammo_usage = 1,
			anim_event_infinite_ammo = "attack_shoot_no_reload",
			weapon_action_hand = "left",
			speed = 2500,
			active_reload_time = 0.25,
			aim_assist_ramp_multiplier = 0.3,
			anim_event = "attack_shoot",
			total_time = 1.2,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			angular_velocity = {
				10,
				0,
				0
			},
			projectile_info = Projectiles.dr_deus_01,
			impact_data = {
				damage_profile = "dr_deus_01",
				targets = 1,
				aoe = ExplosionTemplates.dr_deus_01
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.dr_deus_01
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
		push = {
			damage_window_start = 0.05,
			push_radius = 3,
			anim_end_event = "attack_finished",
			outer_push_angle = 180,
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			attack_template = "basic_sweep_push",
			damage_profile_outer = "light_push",
			weapon_action_hand = "left",
			push_angle = 100,
			hit_effect = "melee_hit_hammers_1h",
			damage_window_end = 0.2,
			impact_sound_event = "slashing_hit",
			charge_value = "action_push",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			damage_profile_inner = "medium_push",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 1.25,
					end_time = 0.2,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_two",
					input = "action_two_hold"
				}
			},
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end
		}
	},
	action_two = {
		default = {
			cooldown = 0.15,
			minimum_hold_time = 0.2,
			anim_end_event = "parry_finished",
			kind = "block",
			weapon_action_hand = "left",
			reload_when_out_of_ammo = true,
			hold_input = "action_two_hold",
			anim_event = "parry_pose",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.8,
					buff_name = "planted_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "push",
					start_time = 0.2,
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					hold_required = {
						"action_two_hold"
					}
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_one",
					release_required = "action_two_hold",
					doubleclick_window = 0,
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				}
			},
			reload_when_out_of_ammo_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "stunned"
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
	max_ammo = 7,
	ammo_per_reload = 1,
	ammo_per_clip = 1,
	play_reload_anim_on_wield_reload = true,
	has_wield_reload_anim = false,
	ammo_hand = "left",
	destroy_when_out_of_ammo = false,
	reload_on_ammo_pickup = true,
	reload_time = 3,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.dr_deus_01_projectile
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	minimum_charge_time = 0.45,
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	charge_above_range = 10,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false,
	aim_at_node_charged = "j_neck"
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
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.dr_deus_01
weapon_template.display_unit = "units/weapons/weapon_display/display_drakegun"
weapon_template.wield_anim = "to_dr_deus_01_loaded"
weapon_template.wield_anim_no_ammo = "to_dr_deus_01_noammo"
weapon_template.wield_anim_not_loaded = "to_dr_deus_01"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "dr_deus_01"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 1
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/dr_deus_01"
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
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push"
	}
}

return {
	dr_deus_01_template_1 = table.clone(weapon_template)
}
