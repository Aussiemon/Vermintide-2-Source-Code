local push_radius = 2
local time_mod = 0.8
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.1,
			kind = "shotgun",
			fire_at_gaze_setting = "tobii_fire_at_gaze_grudgeraker",
			total_time_secondary = 2,
			bullseye = true,
			num_layers_spread = 1,
			damage_profile = "shot_shotgun",
			charge_value = "light_attack",
			alert_sound_range_fire = 15,
			alert_sound_range_hit = 4,
			hit_effect = "shotgun_bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			reload_when_out_of_ammo = true,
			shot_count = 9,
			damage_window_end = 0,
			range = 100,
			ammo_usage = 1,
			fire_time = 0.1,
			apply_recoil = true,
			anim_event_secondary = "reload",
			active_reload_time = 0.35,
			anim_event = "attack_shoot",
			reload_time = 2.5,
			total_time = 0.66,
			allowed_chain_actions = {
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
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two"
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 5,
				climb_duration = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			damage_window_start = 0.2,
			push_radius = 2,
			kind = "shield_slam",
			damage_window_end = 0.3,
			reload_when_out_of_ammo = true,
			no_damage_impact_sound_event = "blunt_hit_armour",
			damage_profile = "shield_slam_shotgun",
			hit_time = 0.2,
			hit_effect = "melee_hit_slashing",
			additional_critical_strike_chance = 0,
			impact_sound_event = "blunt_hit",
			charge_value = "heavy_attack",
			anim_end_event = "attack_finished",
			damage_profile_aoe = "shield_slam_shotgun_aoe",
			dedicated_target_range = 2,
			anim_event = "attack_push",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_two",
					input = "action_two"
				}
			},
			critical_strike = {}
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
	ammo_per_reload = 2,
	max_ammo = 14,
	ammo_per_clip = 2,
	play_reload_anim_on_wield_reload = true,
	reload_time = 1.8,
	reload_on_ammo_pickup = true
}
weapon_template.attack_meta_data = {
	max_range = 30,
	aim_at_node = "j_spine",
	ignore_enemies_for_obstruction = true
}
weapon_template.default_spread_template = "rake_shot"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.grudge_raker
weapon_template.display_unit = "units/weapons/weapon_display/display_rifle"
weapon_template.wield_anim = "to_grudge_raker"
weapon_template.wield_anim_no_ammo = "to_grudge_raker_noammo"
weapon_template.crosshair_style = "shotgun"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_grudgeraker"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "SHOTGUN"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/rakegun"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_crowd_control",
	"weapon_keyword_close_range"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_two",
		sub_action_name = "default"
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
Weapons = Weapons or {}
Weapons.grudge_raker_template_1 = table.clone(weapon_template)

return
