-- chunkname: @scripts/settings/equipment/weapon_templates/handguns.lua

local weapon_template = {}

weapon_template.actions = {
	action_wield = ActionTemplates.wield,
	action_one = {
		default = {
			active_reload_time = 0.35,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.3,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "light_attack",
			damage_profile = "shot_sniper",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			ignore_shield_hit = true,
			kind = "handgun",
			ranged_attack = true,
			reload_when_out_of_ammo = true,
			total_time = 0.5,
			total_time_secondary = 2,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.66,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.66,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.66,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.66,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.35,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
			end,
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 3,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		zoomed_shot = {
			active_reload_time = 0.35,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.3,
			alert_sound_range_fire = 10,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_end_event = "to_unzoom",
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			apply_recoil = true,
			charge_value = "light_attack",
			damage_profile = "shot_sniper",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_time = 0,
			headshot_multiplier = 3,
			hit_effect = "bullet_impact",
			hold_input = "action_two_hold",
			ignore_shield_hit = true,
			kind = "handgun",
			minimum_hold_time = 0.66,
			ranged_attack = true,
			reload_when_out_of_ammo = true,
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.7,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.7,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 3,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.6,
			aim_at_gaze_setting = "tobii_aim_at_gaze_handgun",
			allow_hold_toggle = true,
			ammo_requirement = 1,
			anim_end_event = "to_unzoom",
			anim_event = "to_zoom",
			can_abort_reload = false,
			cooldown = 0.3,
			hold_input = "action_two_hold",
			keep_buffer = true,
			kind = "aim",
			minimum_hold_time = 0.3,
			reset_aim_assist_on_exit = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.4,
					sub_action = "zoomed_shot",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
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
			end,
		},
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 1,
	ammo_per_reload = 1,
	max_ammo = 16,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1.5,
	should_update_anim_ammo = true,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_head",
	can_charge_shot = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction = true,
	minimum_charge_time = 0.45,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored, BreedCategory.Shielded),
}
action_anim_overrides = {
	animation_variation_id = 1,
}
weapon_template.default_spread_template = "handgun"
weapon_template.spread_lerp_speed = 5
weapon_template.spread_lerp_speed_zoom = 3.75
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.rifles
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_handguns"
weapon_template.wield_anim = "to_handgun"
weapon_template.wield_anim_no_ammo = "to_handgun_noammo"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/handgun"
weapon_template.crosshair_style = "default"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "HANDGUN"
weapon_template.no_dodge = true
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	target_node = "j_spine1",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 0.25,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 7,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 3,
		[DamageTypes.DAMAGE] = 7,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 0,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 0,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/handgun",
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_sniper",
	"weapon_keyword_headshotting",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "zoomed_shot",
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

local handgun_es = table.clone(weapon_template)
local handgun_dr = table.clone(weapon_template)

handgun_dr.wield_anim = "to_handgun_dr"
handgun_dr.wield_anim_no_ammo = "to_handgun_dr_noammo"
handgun_dr.state_machine = "units/beings/player/first_person_base/state_machines/ranged/handgun_dr"

local handgun_vs = table.clone(weapon_template)

handgun_vs.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 1,
	ammo_per_reload = 1,
	max_ammo = 13,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1.5,
	should_update_anim_ammo = true,
}

local handgun_vs_dr = table.clone(handgun_vs)

handgun_vs_dr.wield_anim = "to_handgun_dr"
handgun_vs_dr.wield_anim_no_ammo = "to_handgun_dr_noammo"
handgun_vs_dr.state_machine = "units/beings/player/first_person_base/state_machines/ranged/handgun_dr"

return {
	handgun_template_1 = table.clone(handgun_es),
	handgun_template_2 = table.clone(handgun_dr),
	handgun_template_1_vs = table.clone(handgun_vs),
	handgun_template_2_vs = table.clone(handgun_vs_dr),
}
