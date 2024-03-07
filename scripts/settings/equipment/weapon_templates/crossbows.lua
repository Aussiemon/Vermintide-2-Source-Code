-- chunkname: @scripts/settings/equipment/weapon_templates/crossbows.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			active_reload_time = 0.25,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.3,
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_infinite_ammo_1p = "attack_shoot_no_reload",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			apply_recoil = true,
			attack_template = "bolt_sniper",
			charge_value = "arrow_hit",
			hit_effect = "arrow_impact",
			kind = "crossbow",
			ranged_attack = true,
			reload_when_out_of_ammo = true,
			speed = 12000,
			total_time = 0.42,
			unhide_ammo_on_infinite_ammo = true,
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				damage_profile = "crossbow_bolt",
				depth = 0.025,
				depth_offset = -0.2,
				link = true,
				targets = 3,
				wall_nail = true,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		zoomed_shot = {
			active_reload_time = 0.25,
			additional_critical_strike_chance = 0.1,
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_end_event = "to_unzoom",
			anim_event = "attack_shoot",
			anim_event_infinite_ammo_1p = "attack_shoot_no_reload",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			apply_recoil = true,
			attack_template = "bolt_sniper",
			charge_value = "zoomed_arrow_hit",
			hit_effect = "arrow_impact",
			hold_input = "action_two_hold",
			kind = "crossbow",
			minimum_hold_time = 0.5,
			ranged_attack = true,
			reload_when_out_of_ammo = true,
			reset_aim_on_attack = true,
			speed = 12000,
			total_time = 0.8,
			unhide_ammo_on_infinite_ammo = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.55,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.75,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.55,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				damage_profile = "crossbow_bolt",
				depth = 0.025,
				depth_offset = -0.2,
				link = true,
				targets = 3,
				wall_nail = true,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 1,
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
			aim_at_gaze_setting = "tobii_aim_at_gaze_crossbow",
			aim_sound_delay = 0.2,
			allow_hold_toggle = true,
			ammo_requirement = 1,
			anim_end_event = "to_unzoom",
			anim_event = "to_zoom",
			can_abort_reload = false,
			cooldown = 0.3,
			hold_input = "action_two_hold",
			kind = "aim",
			minimum_hold_time = 0.15,
			reset_aim_assist_on_exit = true,
			weapon_action_hand = "left",
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
					start_time = 0.15,
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
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	ammo_per_reload = 1,
	destroy_when_out_of_ammo = false,
	has_wield_reload_anim = true,
	max_ammo = 20,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.bolt,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_neck",
	can_charge_shot = true,
	charge_above_range = 20,
	charge_when_obstructed = false,
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = true,
	minimum_charge_time = 0.45,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0.1,
	effective_max_range = 40,
	max_range = 50,
	no_aim_input_multiplier = 0.3,
	target_node = "j_neck",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1.2,
	},
}

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.02,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
}
weapon_template.default_spread_template = "crossbow"
weapon_template.spread_lerp_speed = 6
weapon_template.spread_lerp_speed_zoom = 3.5
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.crossbow
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_crossbow"
weapon_template.wield_anim = "to_crossbow_loaded"
weapon_template.wield_anim_no_ammo = "to_crossbow_noammo"
weapon_template.wield_anim_not_loaded = "to_crossbow"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/crossbow"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "CROSSBOW"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 1
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/crossbow",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 4,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_sniper",
	"weapon_keyword_piercing_bolts",
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

local crossbow_bolt_vs = table.clone(weapon_template)

crossbow_bolt_vs.actions.action_one.default.impact_data.damage_profile = "crossbow_bolt_vs"
crossbow_bolt_vs.actions.action_one.zoomed_shot.impact_data.damage_profile = "crossbow_bolt_vs"

return {
	crossbow_template_1 = table.clone(weapon_template),
	crossbow_template_1_vs = table.clone(crossbow_bolt_vs),
}
