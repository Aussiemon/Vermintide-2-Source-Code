local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_event = "attack_shoot_fireball",
			fire_time = 0.27,
			is_spell = true,
			alert_sound_range_fire = 12,
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			hit_effect = "drakefire_pistol",
			overcharge_type = "fireball_basic",
			charge_value = "light_attack",
			fire_sound_event = "player_combat_weapon_staff_fireball_fire",
			speed = 4000,
			alert_sound_range_hit = 2,
			total_time = 0.6,
			allowed_chain_actions = {},
			projectile_info = Projectiles.bouncing_fireball,
			impact_data = {
				damage_profile = "staff_fireball"
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball
			}
		},
		bouncing_fireball_2 = {
			projectile_info = Projectiles.bouncing_fireball,
			impact_data = {
				damage_profile = "staff_fireball"
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball
			}
		},
		bouncing_fireball_3 = {
			projectile_info = Projectiles.bouncing_fireball,
			impact_data = {
				damage_profile = "staff_fireball"
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball
			}
		},
		shoot_charged = {
			scale_overcharge = true,
			alert_sound_range_hit = 2,
			is_spell = true,
			ammo_usage = 1,
			kind = "charged_projectile",
			fire_sound_event_parameter = "drakegun_charge_fire",
			reload_when_out_of_ammo = true,
			attack_template = "shot_carbine",
			overcharge_type = "fireball_charged",
			fire_sound_event = "player_combat_weapon_staff_fireball_fire",
			alert_sound_range_fire = 12,
			throw_up_this_much_in_target_direction = 0.15,
			charge_value = "light_attack",
			fire_time = 0.3,
			speed = 1000,
			anim_event = "attack_shoot_fireball_charged",
			reload_time = 2.5,
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 1.5,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			},
			projectile_info = Projectiles.flame_wave_fireball,
			impact_data = {
				damage_profile = "staff_fireball"
			},
			timed_data = {
				life_time = 1.5,
				aoe = ExplosionTemplates.fireball
			}
		},
		flame_wave = {
			projectile_info = Projectiles.flame_wave,
			impact_data = {
				damage_profile = "staff_fireball"
			}
		}
	},
	action_two = {
		default = {
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_ready_sound_event = "weapon_staff_charge_ready",
			kind = "charge",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			attack_template = "shot_carbine",
			overcharge_interval = 0.3,
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			minimum_hold_time = 0.2,
			overcharge_type = "drakegun_charging",
			anim_end_event = "attack_finished",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			hold_input = "action_two_hold",
			anim_event = "attack_charge_fireball",
			charge_sound_name = "player_combat_weapon_staff_charge",
			reload_when_out_of_ammo = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "shoot_charged",
					start_time = 0.2,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				}
			}
		}
	},
	weapon_reload = {
		default = {
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			charge_effect_material_variable_name = "intensity",
			uninterruptible = true,
			kind = "charge",
			charge_sound_parameter_name = "drakegun_charge_fire",
			do_not_validate_with_hold = true,
			charge_effect_material_name = "Fire",
			minimum_hold_time = 0.5,
			vent_overcharge = true,
			anim_end_event = "attack_finished",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			hold_input = "weapon_reload_hold",
			anim_event = "cooldown_start",
			charge_sound_name = "player_combat_weapon_staff_cooldown",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.2,
					buff_name = "planted_fast_decrease_movement",
					end_time = math.huge
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				}
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
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
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	overcharge_threshold = 10,
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	time_until_overcharge_decreases = 0.5,
	overcharge_value_decrease_rate = 1,
	overcharge_critical_buff = {
		{
			start_time = 0,
			buff_name = "overcharged_critical",
			end_time = math.huge
		}
	},
	overcharge_buff = {
		{
			start_time = 0,
			buff_name = "overcharged",
			end_time = math.huge
		}
	}
}
weapon_template.default_spread_template = "fireball"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.crosshair_style = "default"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 0.6
	},
	change_dodge_speed = {
		external_optional_multiplier = 0.6
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
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
		action_name = "action_one",
		sub_action_name = "shoot_charged"
	}
}
Weapons = Weapons or {}
Weapons.staff_firefly_flamewave_template_1 = table.create_copy(Weapons.staff_firefly_flamewave, weapon_template)

return
