-- chunkname: @scripts/settings/equipment/weapon_templates/victor_bountyhunter_career_skill.lua

local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "bounty_hunter_ability_draw",
			kind = "career_dummy",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_two",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_release",
					start_time = 0.35,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
					start_time = 0.35,
					sub_action = "default",
				},
				{
					action = "action_career_hold",
					auto_chain = true,
					start_time = 0.42,
					sub_action = "hold",
				},
			},
		},
		hold = {
			anim_end_event = "ability_finished",
			anim_event = "bounty_hunter_ability_hold",
			kind = "career_dummy",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_two",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_release",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
	},
	action_career_release = {
		default = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_end_event = "ability_finished",
			anim_event = "bounty_hunter_ability_shoot",
			anim_time_scale = 1,
			aoe_radius = 2.5,
			aoe_time = 0.175,
			charge_value = "projectile",
			damage_profile = "shot_shotgun_ability",
			damage_profile_aoe = "shield_slam_aoe",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_time_lower = 0,
			fire_time_upper = 0,
			headshot_multiplier = 2,
			hit_effect = "shotgun_bullet_impact",
			ignore_shield_hit = true,
			kind = "career_wh_two",
			railgun_spread_template = "bounty_hunter_handgun",
			range = 100,
			ray_against_large_hitbox = true,
			shot_count = 10,
			shotgun_spread_template = "bounty_hunter_shotgun",
			speed = 16000,
			total_time = 0.66,
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			projectile_info = Projectiles.victor_bounty_hunter,
			impact_data = {
				damage_profile = "shot_sniper_ability",
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "bounty_hunter_ability_cancel",
			kind = "career_dummy",
			total_time = 0.47,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	aim_at_node_charged = "j_head",
	always_charge_before_firing = true,
	base_action_name = "action_career_release",
	can_charge_shot = true,
	charge_shot_delay = 0.1,
	charge_when_obstructed = true,
	charged_attack_action_name = "default",
	ignore_allies_for_obstruction = true,
	ignore_allies_for_obstruction_charged = true,
	ignore_enemies_for_obstruction = true,
	ignore_enemies_for_obstruction_charged = true,
	minimum_charge_time = 0.38,
}
weapon_template.default_spread_template = "bounty_hunter_handgun"
weapon_template.left_hand_unit = "units/weapons/player/wpn_emp_shotgun/pn_emp_shotgunw"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bounty_hunter_handgun
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "bounty_hunter_ability_draw"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_bountyhunter"
weapon_template.load_state_machine = false
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED_ABILITY"
weapon_template.weapon_type = "HANDGUN"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.1,
	},
}
weapon_template.aim_assist_settings = {
	aim_at_node = "j_spine",
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 0.25,
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/rakegun",
}

return {
	victor_bountyhunter_career_skill_weapon = table.clone(weapon_template),
}
