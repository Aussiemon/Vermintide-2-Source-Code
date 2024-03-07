-- chunkname: @scripts/settings/equipment/weapon_templates/grudge_raker.lua

local time_mod = 0.8
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			active_reload_time = 0.35,
			alert_sound_range_fire = 15,
			alert_sound_range_hit = 4,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_secondary = "reload",
			apply_recoil = true,
			bullseye = true,
			charge_value = "light_attack",
			damage_profile = "shot_shotgun",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_grudgeraker",
			fire_time = 0,
			hit_effect = "shotgun_bullet_impact",
			kind = "shotgun",
			num_layers_spread = 1,
			play_reload_animation = true,
			range = 100,
			ranged_attack = true,
			reload_time = 2.5,
			reload_when_out_of_ammo = true,
			shot_count = 9,
			total_time = 0.66,
			total_time_secondary = 2,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_one",
					doubleclick_window = 0.2,
					input = "action_one",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					start_time = 0.6,
					sub_action = "auto_reload_on_empty",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			additional_critical_strike_chance = 0,
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			charge_value = "heavy_attack",
			damage_profile = "shield_slam_shotgun",
			damage_profile_aoe = "shield_slam_shotgun_aoe",
			damage_profile_target = "shield_slam_shotgun",
			damage_window_end = 0.3,
			damage_window_start = 0.2,
			dedicated_target_range = 3.5,
			forward_offset = 0.75,
			hit_effect = "melee_hit_slashing",
			hit_time = 0.25,
			impact_sound_event = "blunt_hit",
			kind = "shield_slam",
			no_damage_impact_sound_event = "blunt_hit_armour",
			push_radius = 2.5,
			reload_when_out_of_ammo = true,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.25,
			allowed_chain_actions = {
				{
					action = "action_wield",
					end_time = 0.2,
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.45,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.65,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
			end,
			critical_strike = {},
		},
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 2,
	ammo_per_reload = 2,
	max_ammo = 16,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1.8,
	should_update_anim_ammo = true,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine",
	ignore_enemies_for_obstruction = true,
	max_range = 30,
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.default_spread_template = "rake_shot"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.grudge_raker
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_grudge_raker"
weapon_template.wield_anim = "to_grudge_raker"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/grudgeraker"
weapon_template.wield_anim_no_ammo = "to_grudge_raker_noammo"
weapon_template.crosshair_style = "shotgun"
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_grudgeraker"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "SHOTGUN"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/rakegun",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 2,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_crowd_control",
	"weapon_keyword_close_range",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_two",
		sub_action_name = "default",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_two",
		sub_action_name = "default",
	},
}

local grudgeraker_vs = table.clone(weapon_template)

grudgeraker_vs.actions.action_one.default.damage_profile = "shot_shotgun_vs"

return {
	grudge_raker_template_1 = table.clone(weapon_template),
	grudge_raker_template_1_vs = table.clone(grudgeraker_vs),
}
