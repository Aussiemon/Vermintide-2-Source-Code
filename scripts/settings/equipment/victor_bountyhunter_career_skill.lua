local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_career = {
		default = {
			hold_input = "action_career_hold",
			anim_end_event = "ability_finished",
			kind = "dummy",
			weapon_action_hand = "left",
			uninterruptible = true,
			anim_event = "bounty_hunter_ability_draw",
			minimum_hold_time = 0.37,
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
					sub_action = "hold_charge",
					start_time = 0,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default",
					start_time = 0.37,
					action = "action_career_hold",
					input = "action_career_hold",
					end_time = math.huge
				}
			}
		}
	},
	action_career_hold = {
		default = {
			hold_input = "action_career_hold",
			anim_end_event = "ability_finished",
			kind = "dummy",
			weapon_action_hand = "left",
			uninterruptible = true,
			anim_event = "bounty_hunter_ability_hold",
			minimum_hold_time = 0,
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
					action = "action_career_release",
					input = "action_career_release",
					end_time = math.huge
				}
			}
		}
	},
	action_career_release = {
		hold_charge = {
			anim_time_scale = 1,
			anim_end_event = "ability_finished",
			weapon_action_hand = "left",
			kind = "dummy",
			uninterruptible = true,
			anim_event = "bounty_hunter_ability_draw",
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
					start_time = 0.35,
					action = "action_career_release",
					auto_chain = true
				}
			}
		},
		default = {
			damage_window_start = 0.1,
			damage_profile = "shot_shotgun_ability",
			ray_against_large_hitbox = true,
			hit_mass_multiplier = 0.1,
			kind = "career_wh_two",
			shotgun_fire_sound_event = "Play_victor_bounty_hunter_shotgun_ability",
			weapon_action_hand = "left",
			anim_time_scale = 1,
			shot_count = 10,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			aoe_radius = 2.5,
			fire_time_upper = 0.05,
			headshot_multiplier = 2,
			damage_window_end = 0,
			range = 100,
			aim_assist_max_ramp_multiplier = 0.3,
			anim_end_event = "ability_finished",
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_ramp_decay_delay = 0.2,
			fire_time_lower = 0.15,
			speed = 16000,
			shotgun_spread_template = "blunderbuss",
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "bounty_hunter_ability_shoot",
			railgun_spread_template = "bounty_hunter_handgun",
			aoe_time = 0.175,
			railgun_fire_sound_event = "Play_victor_bounty_hunter_railgun_ability",
			hit_effect = "shotgun_bullet_impact",
			charge_value = "projectile",
			damage_profile_aoe = "shield_slam_aoe",
			uninterruptible = true,
			total_time = 0.66,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				return 
			end,
			condition_func = function (user_unit)
				return true
			end,
			projectile_info = Projectiles.victor_bounty_hunter,
			impact_data = {
				damage_profile = "shot_sniper_ability"
			}
		}
	},
	action_two = {
		default = {
			weapon_action_hand = "left",
			anim_end_event = "ability_finished",
			kind = "career_cancel",
			total_time = 0,
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
Weapons = Weapons or {}
Weapons.victor_bountyhunter_career_skill_weapon = table.create_copy(Weapons.victor_bountyhunter_career_skill_weapon, weapon_template)

return 
