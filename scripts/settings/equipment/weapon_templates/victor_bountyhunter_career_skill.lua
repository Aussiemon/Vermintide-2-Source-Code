local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_career_hold = {
		default = {
			anim_end_event = "ability_finished",
			kind = "career_dummy",
			uninterruptible = true,
			anim_event = "bounty_hunter_ability_draw",
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default",
					start_time = 0.35,
					action = "action_career_release",
					input = "action_career_not_hold"
				},
				{
					sub_action = "hold",
					start_time = 0.42,
					action = "action_career_hold",
					auto_chain = true
				}
			}
		},
		hold = {
			anim_end_event = "ability_finished",
			kind = "career_dummy",
			uninterruptible = true,
			anim_event = "bounty_hunter_ability_hold",
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_release",
					input = "action_career_not_hold"
				}
			}
		}
	},
	action_career_release = {
		default = {
			damage_window_start = 0.1,
			ray_against_large_hitbox = true,
			charge_value = "projectile",
			shot_count = 10,
			headshot_multiplier = 2,
			damage_profile = "shot_shotgun_ability",
			hit_mass_multiplier = 0.1,
			kind = "career_wh_two",
			weapon_action_hand = "left",
			alert_sound_range_hit = 2,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.5,
			aoe_radius = 2.5,
			fire_time_upper = 0.05,
			anim_time_scale = 1,
			aim_assist_ramp_decay_delay = 0.2,
			damage_window_end = 0,
			range = 100,
			anim_end_event = "ability_finished",
			fire_time_lower = 0.15,
			speed = 16000,
			shotgun_spread_template = "bounty_hunter_shotgun",
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "bounty_hunter_ability_shoot",
			railgun_spread_template = "bounty_hunter_handgun",
			aoe_time = 0.175,
			hit_effect = "shotgun_bullet_impact",
			alert_sound_range_fire = 12,
			damage_profile_aoe = "shield_slam_aoe",
			uninterruptible = true,
			total_time = 0.66,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			projectile_info = Projectiles.victor_bounty_hunter,
			impact_data = {
				damage_profile = "shot_sniper_ability"
			}
		}
	},
	action_two = {
		default = {
			kind = "career_dummy",
			weapon_action_hand = "left",
			anim_end_event = "ability_finished",
			anim_event = "bounty_hunter_ability_cancel",
			total_time = 0.47,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {}
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
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	charge_shot_delay = 0.1,
	always_charge_before_firing = true,
	charged_attack_action_name = "default",
	can_charge_shot = true,
	ignore_enemies_for_obstruction_charged = true,
	base_action_name = "action_career_release",
	aim_at_node_charged = "j_head",
	ignore_allies_for_obstruction = true,
	minimum_charge_time = 0.38,
	ignore_allies_for_obstruction_charged = true,
	charge_against_armored_enemy = true,
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = true
}
weapon_template.default_spread_template = "bounty_hunter_handgun"
weapon_template.left_hand_unit = "units/weapons/player/wpn_emp_shotgun/wpn_emp_shotgun"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bounty_hunter_handgun
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "bounty_hunter_ability_draw"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "HANDGUN"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.1
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
weapon_template.wwise_dep_left_hand = {
	"wwise/handgun_rifle"
}

return {
	victor_bountyhunter_career_skill_weapon = table.clone(weapon_template)
}
