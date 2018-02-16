local push_radius = 2
local time_mod = 0.8
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.1,
			bullseye = false,
			fire_at_gaze_setting = "tobii_fire_at_gaze_blunderbuss",
			kind = "shotgun",
			damage_profile = "shot_shotgun",
			num_layers_spread = 2,
			total_time_secondary = 1,
			charge_value = "light_attack",
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 5,
			reload_when_out_of_ammo = true,
			hit_effect = "shotgun_bullet_impact",
			anim_event_last_ammo = "attack_shoot_last",
			shot_count = 12,
			apply_recoil = true,
			damage_window_end = 0,
			range = 100,
			ammo_usage = 1,
			fire_time = 0.1,
			anim_event_secondary = "reload",
			active_reload_time = 0.35,
			anim_event = "attack_shoot",
			total_time = 0.66,
			allowed_chain_actions = {
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
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			recoil_settings = {
				horizontal_climb = -3,
				restore_duration = 0.45,
				vertical_climb = 15,
				climb_duration = 0.15,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			damage_window_start = 0.2,
			push_radius = 2,
			anim_end_event = "attack_finished",
			kind = "shield_slam",
			reload_when_out_of_ammo = true,
			anim_event = "attack_push",
			hit_time = 0.25,
			push_dot = 0.75,
			hit_effect = "melee_hit_slashing",
			damage_window_end = 0.3,
			impact_sound_event = "blunt_hit",
			charge_value = "heavy_attack",
			no_damage_impact_sound_event = "blunt_hit_armour",
			damage_profile_aoe = "shield_slam_shotgun_aoe",
			dedicated_target_range = 2,
			damage_profile = "shield_slam_shotgun",
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod*1.15,
			allowed_chain_actions = {
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
				},
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
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
	reload_time = 1.5,
	reload_on_ammo_pickup = true
}
weapon_template.default_spread_template = "blunderbuss"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.rifles
weapon_template.display_unit = "units/weapons/weapon_display/display_rifle"
weapon_template.wield_anim = "to_blunderbuss"
weapon_template.wield_anim_no_ammo = "to_blunderbuss_noammo"
weapon_template.crosshair_style = "shotgun"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_blunderbuss"
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
weapon_template.attack_meta_data = {
	max_range = 15,
	aim_at_node = "j_spine",
	ignore_enemies_for_obstruction = true
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.wwise_dep_right_hand = {
	"wwise/blunderbuss"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.2,
			range = 0.3,
			damage = 0.75,
			targets = 1,
			stagger = 0.6
		},
		heavy_attack = {
			speed = 0.5,
			range = 0.05,
			damage = 0.25,
			targets = 1,
			stagger = 0.8
		}
	},
	perks = {
		light_attack = {
			"armor_penetration"
		},
		heavy_attack = {}
	}
}
Weapons = Weapons or {}
Weapons.blunderbuss_template_1 = table.create_copy(Weapons.blunderbuss_template_1, weapon_template)

return 
