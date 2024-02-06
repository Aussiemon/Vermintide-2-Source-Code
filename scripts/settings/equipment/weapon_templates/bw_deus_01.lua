-- chunkname: @scripts/settings/equipment/weapon_templates/bw_deus_01.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_fireball",
			anim_time_scale = 0.9,
			apply_recoil = true,
			bullseye = false,
			charge_value = "light_attack",
			damage_profile = "staff_magma",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "player_combat_weapon_bw_deus_01_fireball_fire",
			fire_sound_on_husk = true,
			fire_time = 0.27,
			hit_effect = "magma_impact",
			is_spell = true,
			kind = "magma_projectile",
			num_layers_spread = 2,
			overcharge_type = "magma_basic",
			range = 100,
			shot_count = 9,
			speed = 7000,
			spell_proc_time = 0.4,
			total_time = 1,
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
					release_required = "action_one_hold",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			recoil_settings = {
				climb_duration = 0.2,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		geiser_launch = {
			alert_enemies = true,
			alert_sound_range_fire = 12,
			anim_end_event = "attack_finished",
			anim_event = "attack_geiser_placed",
			aoe_name = "magma",
			apply_recoil = true,
			can_proc_in_inn = true,
			damage_profile = "geiser_magma_no_damage",
			damage_window_end = 0,
			damage_window_start = 0.1,
			fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
			fire_sound_event = "player_combat_weapon_bw_deus_01_magma_fire",
			fire_sound_on_husk = true,
			fire_time = 0,
			is_spell = true,
			kind = "geiser",
			large_charge_value = 0,
			medium_charge_value = 0,
			overcharge_type = "magma_charged",
			overcharge_type_heavy = "magma_charged_2",
			small_charge_value = 0,
			speed = 1500,
			spell_proc_time = 0.2,
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.75,
					start_time = 0,
				},
			},
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
					start_time = 0.6,
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
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
			projectile_info = Projectiles.default,
			recoil_settings = {
				climb_duration = 0.4,
				horizontal_climb = -1,
				restore_duration = 0.3,
				vertical_climb = 5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			angle = 0,
			anim_end_event = "attack_geiser_end",
			anim_event = "attack_geiser_start",
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			charge_sound_husk_name = "player_combat_weapon_bw_deus_01_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_bw_deus_01_charge_husk",
			charge_sound_name = "player_combat_weapon_bw_deus_01_charge",
			charge_sound_stop_event = "player_combat_weapon_bw_deus_01_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 0.6,
			crosshair_style = "dot",
			debug_draw = false,
			fire_at_gaze_setting = "tobii_fire_at_gaze_geiser",
			fire_time = 0.1,
			gravity = -9.82,
			height = 6,
			hold_input = "action_two_hold",
			kind = "geiser_targeting",
			max_radius = 1,
			min_radius = 0.5,
			minimum_hold_time = 0.1,
			overcharge_interval = 0.3,
			overcharge_type = "charging",
			particle_effect = "fx/wpnfx_staff_geiser_charge_remap",
			scale_anim_by_charge_time_buff = false,
			scale_chain_window_by_charge_time_buff = true,
			speed = 15,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_casting_long_decrease_movement",
					external_multiplier = 0.1,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.2,
					sub_action = "geiser_launch",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.3,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:reset_release_input()
				input_extension:clear_input_buffer()
			end,
		},
	},
	weapon_reload = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "cooldown_start",
			charge_effect_material_name = "Fire",
			charge_effect_material_variable_name = "intensity",
			charge_sound_name = "player_combat_weapon_bw_deus_01_cooldown",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "stop_player_combat_weapon_bw_deus_01_cooldown",
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
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught,
}
weapon_template.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 1,
	time_until_overcharge_decreases = 0.5,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	ignore_enemies_for_obstruction = true,
	max_range = 12,
	max_range_charged = 18,
	obstruction_fuzzyness_range_charged = 3.5,
	effective_against = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.default_spread_template = "bw_deus_01"
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
weapon_template.fire_at_gaze_setting = "tobii_fire_at_gaze_geiser"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/bw_deus_01",
}
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
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
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 1,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 3,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_damage_over_time",
	"weapon_keyword_crowd_control",
	"weapon_keyword_charged_attack",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "geiser_launch",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "geiser_launch",
	},
}

return {
	bw_deus_01_template_1 = table.clone(weapon_template),
}
