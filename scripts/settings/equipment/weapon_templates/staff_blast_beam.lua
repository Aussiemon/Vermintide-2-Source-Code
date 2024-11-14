-- chunkname: @scripts/settings/equipment/weapon_templates/staff_blast_beam.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_shoot_beam_end",
			anim_event = "attack_shoot_beam_start",
			charge_sound_husk_name = "player_combat_weapon_staff_fire_beam_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_fire_beam_husk",
			charge_sound_name = "player_combat_weapon_staff_fire_beam",
			charge_sound_stop_event = "stop_player_combat_weapon_staff_fire_beam",
			charge_sound_switch = "projectile_charge_sound",
			damage_interval = 0.45,
			damage_profile = "beam",
			do_zoom = true,
			fire_time = 0.3,
			hit_effect = "staff_spark",
			hold_input = "action_one_hold",
			initial_damage_profile = "beam_initial",
			is_spell = true,
			kind = "beam",
			minimum_hold_time = 0.5,
			overcharge_interval = 0.45,
			overcharge_type = "beam_staff_alternate",
			particle_effect_target = "fx/wpnfx_staff_beam_target_remap",
			particle_effect_trail = "fx/wpnfx_staff_beam_trail_remap",
			particle_effect_trail_3p = "fx/wpnfx_staff_beam_trail_3p_remap",
			range = 50,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
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
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.3,
					sub_action = "charged_beam",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.3,
					sub_action = "charged_beam",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_sparks",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			area_damage = true,
			charge_value = "light_attack",
			crosshair_style = "shotgun",
			damage_profile = "blast",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_fire_cone",
			fire_sound_on_husk = true,
			fire_time = 2,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "bullet_spray",
			overcharge_type = "shotgun",
			spread_template_override = "blunderbuss",
			total_time = 2,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.75,
					start_time = 0,
				},
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 1,
					start_time = 0.3,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.31,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_two_hold",
					start_time = 0.31,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.31,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.3,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -1,
				restore_duration = 0.2,
				vertical_climb = -2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "flamethrower_charge_start",
			charge_sound_husk_name = "player_combat_weapon_staff_fire_beam_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_fire_beam_husk",
			charge_sound_name = "player_combat_weapon_staff_fire_beam",
			charge_sound_stop_event = "stop_player_combat_weapon_staff_fire_beam",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			crosshair_style = "shotgun",
			fx_node = "fx_01",
			hold_input = "action_two_hold",
			kind = "charge",
			minimum_hold_time = 0.2,
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			particle_effect_target = "fx/wpnfx_staff_beam_target_remap",
			particle_effect_trail = "fx/wpnfx_staff_beam_trail_remap",
			particle_effect_trail_3p = "fx/wpnfx_staff_beam_trail_3p_remap",
			scale_anim_by_charge_time_buff = false,
			scale_chain_window_by_charge_time_buff = true,
			spread_template_override = "blunderbuss",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.9,
					start_time = 0,
				},
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.7,
					external_multiplier = 0.8,
					start_time = 0.3,
				},
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 1,
					start_time = 0.7,
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
					start_time = 0.2,
					sub_action = "shoot_charged",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
		},
		charged_beam = {
			anim_event = "attack_shoot_beam_spark",
			charge_value = "light_attack",
			damage_profile = "beam_shot",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_sound_event = "weapon_staff_fire_beam_end_shot",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "fireball_impact",
			kind = "handgun",
			overcharge_type = "beam_staff_sniper",
			reset_aim_on_attack = true,
			spread_template_override = "handgun",
			total_time = 0.66,
			use_beam_consecutive_hits = true,
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	weapon_reload = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "cooldown_start",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_sound_name = "player_combat_weapon_staff_cooldown",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "stop_player_combat_weapon_staff_cooldown",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 3,
			do_not_validate_with_hold = true,
			hold_input = "weapon_reload_hold",
			kind = "charge",
			minimum_hold_time = 0.5,
			uninterruptible = true,
			vent_overcharge = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.2,
					start_time = 0,
					end_time = math.huge,
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
			chain_condition_func = function (action_user, input_extension)
				local overcharge_extension = ScriptUnit.extension(action_user, "overcharge_system")

				return overcharge_extension:get_overcharge_value() ~= 0
			end,
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.default_spread_template = "spear"
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	time_until_overcharge_decreases = 0.5,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	aim_at_node_charged = "j_spine1",
	can_charge_shot = true,
	charge_when_obstructed = true,
	charge_when_outside_max_range_charged = false,
	charged_attack_action_name = "shoot_charged",
	fire_input = "fire_hold",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = false,
	max_range = 50,
	max_range_charged = 6,
	minimum_charge_time = 0.21,
	obstruction_fuzzyness_range = 1,
	obstruction_fuzzyness_range_charged = 6,
	aim_data = {
		max_radius_pseudo_random_c = 0.0557,
		min_radius_pseudo_random_c = 0.94737,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	aim_data_charged = {
		max_radius_pseudo_random_c = 0.01475,
		min_radius_pseudo_random_c = 0.0557,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0,
	effective_max_range = 30,
	max_range = 50,
	no_aim_input_multiplier = 0,
	target_node = "j_spine1",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.fireball
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 7,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 3,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 5,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 2,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_sniper",
	"weapon_keyword_crowd_control",
	"weapon_keyword_damage_over_time",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "shoot_charged",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "shoot_charged",
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff",
}

local staff_blast_beam_vs = table.clone(weapon_template)

staff_blast_beam_vs.actions.action_one.default.damage_profile = "beam_vs"
staff_blast_beam_vs.actions.action_one.default.initial_damage_profile = "beam_initial_vs"
staff_blast_beam_vs.actions.action_one.shoot_charged.damage_profile = "blast_vs"
staff_blast_beam_vs.actions.action_two.charged_beam.damage_profile = "beam_shot_vs"

return {
	staff_blast_beam_template_1 = table.clone(weapon_template),
	staff_blast_beam_template_1_vs = table.clone(staff_blast_beam_vs),
}
