-- chunkname: @scripts/settings/equipment/weapon_templates/repeating_crossbows_elf.lua

local weapon_template = {}

weapon_template.actions = {
	action_wield = ActionTemplates.wield_left,
	action_one = {
		default = {
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			apply_recoil = true,
			charge_value = "arrow_hit",
			cooldown = 0.5,
			cooldown_from_start = true,
			hit_effect = "arrow_impact",
			kind = "crossbow",
			reload_when_out_of_ammo = true,
			speed = 8000,
			total_time = 0.75,
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.5,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0.2,
				impact = 0.2,
			},
			projectile_info = Projectiles.repeating_crossbow_bolt,
			impact_data = {
				damage_profile = "crossbow_bolt_repeating",
				depth = 0.025,
				depth_offset = -0.2,
				link = true,
				targets = 2,
				wall_nail = true,
			},
			recoil_settings = {
				climb_duration = 0.15,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = 1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		zoomed_shot = {
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_end_event = "to_unzoom",
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot",
			anim_event_no_ammo_left = "attack_shoot",
			apply_burst_recoil = true,
			apply_recoil = true,
			burst = true,
			charge_value = "zoomed_arrow_hit",
			cooldown = 0.45,
			cooldown_from_start = true,
			hit_effect = "arrow_impact",
			hold_input = "action_two_hold",
			kind = "crossbow",
			minimum_hold_time = 0.3,
			multi_projectile_spread = 0.045,
			no_burst_spread = true,
			num_projectiles = 3,
			reload_when_out_of_ammo = true,
			speed = 8000,
			unit_fire_sound_event = "player_combat_weapon_repeating_crossbow_elf_fire",
			unit_fire_sound_source_node = "j_crossbow_top",
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.45,
					sub_action = "zoomed_shot",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.45,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0.2,
				impact = 0.2,
			},
			projectile_info = Projectiles.repeating_crossbow_bolt,
			impact_data = {
				damage_profile = "crossbow_bolt_repeating",
				depth = 0.025,
				depth_offset = -0.2,
				link = true,
				targets = 2,
				wall_nail = true,
			},
			recoil_settings = {
				climb_duration = 0.075,
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 0.05,
				climb_function = math.ease_out_quad,
				restore_function = math.ease_out_quad,
			},
			first_recoil_settings = {
				climb_duration = 0.075,
				horizontal_climb = 0,
				restore_duration = 0.3,
				vertical_climb = 1,
				climb_function = math.ease_out_quad,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			aim_at_gaze_setting = "tobii_aim_at_gaze_repeating_crossbow_elf",
			aim_sound_delay = 0.2,
			ammo_requirement = 1,
			anim_end_event = "to_unzoom",
			anim_event = "to_zoom",
			can_abort_reload = false,
			cooldown = 0.3,
			default_zoom = "first_person_node",
			hold_input = "action_two_hold",
			kind = "aim",
			minimum_hold_time = 0.15,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.9,
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
					start_time = 0.3,
					sub_action = "zoomed_shot",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
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
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 15,
	ammo_per_reload = 15,
	destroy_when_out_of_ammo = false,
	max_ammo = 45,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = false,
	reload_time = 2.5,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.repeating_bolt,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_head",
	can_charge_shot = true,
	charge_above_range = 10,
	charge_when_obstructed = false,
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = true,
	minimum_charge_time = 0.45,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.default_spread_template = "repeating_handgun"
weapon_template.spread_lerp_speed = 2
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.wood_elf_repeating_crossbow
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_crossbow"
weapon_template.wield_anim = "to_repeating_crossbow_elf"
weapon_template.wield_anim_no_ammo = "to_repeating_crossbow_elf_noammo"
weapon_template.wield_anim_not_loaded = "to_repeating_crossbow_elf"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/repeating_crossbow_elf"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "REPEATING_CROSSBOW"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/repeating_crossbow",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 6,
		[DamageTypes.CLEAVE] = 4,
		[DamageTypes.SPEED] = 7,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 5,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_rapid_fire",
	"weapon_keyword_versatile",
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

return {
	repeating_crossbow_elf_template = weapon_template,
}
