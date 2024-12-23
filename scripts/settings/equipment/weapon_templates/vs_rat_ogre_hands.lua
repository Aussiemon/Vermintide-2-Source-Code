-- chunkname: @scripts/settings/equipment/weapon_templates/vs_rat_ogre_hands.lua

local push_radius = 2
local time_mod = 0.9
local weapon_template = {}
local planted_decrease_movement_settings = {
	charge = {
		{
			buff_name = "planted_decrease_movement",
			external_multiplier = 0.2,
			start_time = 0,
		},
	},
	light_attack = {
		{
			buff_name = "planted_decrease_movement",
			end_time = 0.6,
			external_multiplier = 0.8,
			start_time = 0,
		},
		{
			buff_name = "planted_return_to_normal_walk_movement",
			start_time = 1.3,
		},
	},
	heavy_attack = {
		{
			buff_name = "planted_fast_decrease_movement",
			end_time = 0.3,
			external_multiplier = 1,
			start_time = 0,
		},
		{
			buff_name = "planted_decrease_movement",
			end_time = 0.6,
			external_multiplier = 0.4,
			start_time = 0.3,
		},
		{
			buff_name = "planted_decrease_movement",
			end_time = 1,
			external_multiplier = 0.001,
			start_time = 0.6,
		},
		{
			buff_name = "planted_return_to_normal_walk_movement",
			start_time = 1,
		},
		{
			buff_name = "set_rotation_limit",
			end_time = 0.8,
			external_value = 0.1,
			start_time = 0,
		},
		{
			buff_name = "planted_decrease_rotation_speed",
			end_time = 0.8,
			external_multiplier = 0.5,
			start_time = 0,
		},
		{
			buff_name = "planted_decrease_rotation_speed",
			end_time = 1,
			external_multiplier = 0.75,
			start_time = 0.8,
		},
	},
}
local knockback_tables = {
	frenzy = {
		catapult = false,
		catapult_players = false,
		player_knockback_speed = 9,
		player_knockback_speed_blocked = 9,
	},
	slam = {
		catapult = false,
		catapult_players = false,
		player_knockback_speed = 10,
		player_knockback_speed_blocked = 14,
	},
}

weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "attack_ogre_slam_charge",
			disallow_ghost_mode = true,
			kind = "melee_start",
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			condition_func = function (action_user, input_extension, ammo_extension, current_action_extension)
				local ghost_mode_extenstion = ScriptUnit.has_extension(action_user, "ghost_mode_system")
				local is_in_ghost_mode = ghost_mode_extenstion:is_in_ghost_mode()
				local career_extension = ScriptUnit.has_extension(action_user, "career_system")
				local ability_data = career_extension:get_activated_ability_data(1)

				if ability_data.is_priming then
					input_extension:clear_input_buffer()
					input_extension:reset_release_input()
				end

				return not is_in_ghost_mode and not ability_data.is_priming
			end,
			total_time = math.huge,
			anim_time_scale = time_mod * 1.15,
			buff_data = planted_decrease_movement_settings.charge,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "attack_swing_right",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 1.2,
					sub_action = "attack_slam",
				},
				{
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold",
					start_time = 0.6,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 1,
					sub_action = "attack_slam",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
		default_2 = {
			anim_end_event = "attack_finished",
			anim_event = "attack_ogre_slam_charge",
			attack_hold_input = "action_one_hold",
			disallow_ghost_mode = true,
			kind = "melee_start",
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			total_time = math.huge,
			anim_time_scale = time_mod * 1.15,
			buff_data = planted_decrease_movement_settings.charge,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "attack_swing_left",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 1.2,
					sub_action = "attack_slam",
				},
				{
					blocker = true,
					end_time = 1.5,
					input = "action_one_hold",
					start_time = 0.6,
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 1,
					sub_action = "attack_slam",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
		attack_swing_right = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0,
			aim_assist_ramp_multiplier = 0.4,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_right",
			damage_profile = "rat_ogre_light_1",
			damage_window_end = 0.65,
			damage_window_start = 0.54,
			dedicated_target_range = 2,
			disallow_ghost_mode = true,
			first_person_hit_anim = "shake_hit",
			hit_effect = "vs_rat_ogre_light",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 2.17,
			uninterruptible = true,
			use_precision_sweep = false,
			weapon_action_hand = "right",
			width_mod = 50,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = planted_decrease_movement_settings.light_attack,
			anim_time_scale = time_mod * 1.15,
			sweep_rotation_offset = {
				roll = math.pi * 0.5,
			},
			knockback_data = knockback_tables.frenzy,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.8,
					input = "action_one",
					start_time = 0.8,
					sub_action = "default_2",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 1.8,
					sub_action = "default",
				},
			},
		},
		attack_swing_left = {
			additional_critical_strike_chance = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_swing_left",
			charge_value = "action_push",
			damage_profile = "rat_ogre_light_2",
			damage_window_end = 0.87,
			damage_window_start = 0.8,
			dedicated_target_range = 2,
			disallow_ghost_mode = true,
			first_person_hit_anim = "shake_hit",
			hit_effect = "vs_rat_ogre_light",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 1.2,
			total_time = 2.17,
			uninterruptible = true,
			use_precision_sweep = false,
			weapon_action_hand = "left",
			width_mod = 50,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = planted_decrease_movement_settings.light_attack,
			anim_time_scale = time_mod * 1.15,
			sweep_rotation_offset = {
				roll = math.pi * 0.5,
			},
			knockback_data = knockback_tables.frenzy,
			buff_data = planted_decrease_movement_settings.light_attack,
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.4,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					release_required = "action_one_hold",
					start_time = 1.4,
					sub_action = "default",
				},
			},
		},
		attack_slam = {
			additional_critical_strike_chance = 0.1,
			anim_end_event = "attack_finished",
			anim_event = "attack_slam",
			damage_profile_left = "rat_ogre_slam_left",
			damage_profile_right = "rat_ogre_slam_right",
			damage_window_end = 0.225,
			damage_window_start = 0.1,
			dedicated_target_range = 2,
			disallow_ghost_mode = true,
			first_person_hit_anim = "shake_hit",
			height_mod = 5,
			hit_effect = "vs_rat_ogre_heavy",
			hit_stop_anim = "attack_hit",
			impact_sound_event = "blunt_hit",
			kind = "sweep",
			no_damage_impact_sound_event = "blunt_hit_armour",
			range_mod = 0.85,
			total_time = 1.33,
			uninterruptible = true,
			use_precision_sweep = false,
			weapon_action_hand = "both",
			width_mod = 100,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			anim_time_scale = time_mod * 1.15,
			lunge_settings = {
				duration = 0.32,
				falloff_to_speed = 5,
				initial_speed = 20,
			},
			sweep_rotation_offset = {
				roll = math.pi * 0.5,
			},
			knockback_data = knockback_tables.slam,
			buff_data = planted_decrease_movement_settings.heavy_attack,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 1.33,
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 1.25,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				return input_extension:reset_release_input()
			end,
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.weapon_sway_settings = {
	camera_look_sensitivity = 1,
	look_sensitivity = 0.5,
	recenter_acc = 5,
	recenter_max_vel = 5,
	recetner_dampening = 1,
	sway_range = 1,
	lerp_speed = math.huge,
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_invisible_weapon"
weapon_template.right_hand_unit = "units/weapons/player/wpn_invisible_weapon"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.vs_rat_ogre_hands.right
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.vs_rat_ogre_hands.left
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_axes"
weapon_template.wield_anim = "to_1h_axe"
weapon_template.buff_type = "MELEE_1H"
weapon_template.weapon_type = "AXE_1H"
weapon_template.max_fatigue_points = 6
weapon_template.buffs = {}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
		penetrating = true,
	},
	hold_attack = {
		arc = 0,
		penetrating = true,
	},
}
weapon_template.aim_assist_settings = {
	base_multiplier = 0,
	effective_max_range = 4,
	max_range = 5,
	no_aim_input_multiplier = 0,
	vertical_only = true,
	breed_scalars = {
		skaven_clan_rat = 0.5,
		skaven_slave = 0.5,
		skaven_storm_vermin = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 4,
	},
}
weapon_template.tooltip_keywords = {}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "light_attack_left",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "heavy_attack_left",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "default",
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/one_handed_axes",
}

return {
	vs_rat_ogre_hands = weapon_template,
}
