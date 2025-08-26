-- chunkname: @scripts/settings/equipment/weapon_templates/staff_death.lua

local weapon_template = {}
local common_default_action_settings = {
	aim_assist_max_ramp_multiplier = 0.8,
	aim_assist_ramp_decay_delay = 0.3,
	aim_assist_ramp_multiplier = 0.4,
	alert_sound_range_fire = 12,
	alert_sound_range_hit = 2,
	apply_recoil = true,
	chain_sound_event = "weapon_sienna_necro_staff_projectile_chain",
	charge_value = "light_attack",
	do_not_validate_with_hold = true,
	fire_sound_event = "weapon_sienna_necro_staff_cast_projectile",
	fire_sound_on_husk = false,
	fire_time = 0.18,
	hit_effect = "fireball_impact",
	is_spell = true,
	kind = "charged_projectile",
	overcharge_type = "fireball_basic",
	speed = 5000,
	total_time = 1.4,
	buff_data = {
		{
			buff_name = "planted_fast_decrease_movement",
			end_time = 0.4,
			external_multiplier = 0.8,
			start_time = 0.1,
		},
	},
	recoil_settings = {
		climb_duration = 0.1,
		horizontal_climb = -0.15,
		restore_duration = 0.8,
		vertical_climb = 0.05,
		climb_function = math.easeInCubic,
		restore_function = math.ease_out_quad,
	},
	enter_function = function (attacker_unit, input_extension)
		input_extension:clear_input_buffer()

		return input_extension:reset_release_input()
	end,
	projectile_info = Projectiles.bw_necromancy_staff,
	impact_data = {
		damage_profile = "death_staff_curse",
	},
	timed_data = {
		life_time = 1.5,
	},
	chain_hit_settings = {
		chain_delay = 0.5,
		chain_distance = 5,
		damage_profile = "death_staff_curse",
		max_chain_count = 2,
		target_selection_delay = 0.15,
	},
}

weapon_template.actions = {
	action_one = {
		default = table.merge({
			anim_event = "chain_attack",
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_one",
					hold_allowed = true,
					input = "action_one",
					start_time = 0.7,
					sub_action = "default_02",
				},
				{
					action = "action_two",
					hold_allowed = true,
					input = "action_two",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			start_offset = {
				min = {
					0,
					0,
					0,
				},
				max = {
					0,
					0,
					0,
				},
			},
			curve_offset = {
				min = {
					0.5,
					0,
					0,
				},
				max = {
					0,
					0,
					0,
				},
			},
			fire_pos_rot = function (action, first_person_unit, weapon_unit, owner_unit, world)
				local node = Unit.node(first_person_unit, "j_leftweaponattach")
				local from_pos = Unit.world_position(first_person_unit, node)
				local ray_pos = Unit.local_position(first_person_unit, 0)
				local physics_world = World.physics_world(world)
				local dir = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
				local side = Managers.state.side.side_by_unit[owner_unit]
				local target_pos = WeaponHelper:look_at_enemy_or_static_position(physics_world, ray_pos, dir, side, 0.15, 100)
				local target_rot = Quaternion.look(target_pos - from_pos, Vector3.up())

				return from_pos, target_rot
			end,
		}, common_default_action_settings),
		default_02 = table.merge({
			anim_event = "chain_attack_02",
			weapon_action_hand = "right",
			allowed_chain_actions = {
				{
					action = "action_one",
					hold_allowed = true,
					input = "action_one",
					start_time = 0.7,
					sub_action = "default",
				},
				{
					action = "action_two",
					hold_allowed = true,
					input = "action_two",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			start_offset = {
				min = {
					0,
					0,
					0,
				},
				max = {
					0,
					0,
					0,
				},
			},
			curve_offset = {
				min = {
					-0.5,
					0,
					0,
				},
				max = {
					0,
					0,
					0,
				},
			},
			fire_pos_rot = function (action, first_person_unit, weapon_unit, owner_unit, world)
				local physics_world = World.physics_world(world)
				local from_pos = Unit.world_position(weapon_unit, 0)
				local ray_pos = Unit.local_position(first_person_unit, 0)
				local dir = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
				local side = Managers.state.side.side_by_unit[owner_unit]
				local target_pos = WeaponHelper:look_at_enemy_or_static_position(physics_world, ray_pos, dir, side, 0.15, 100)
				local target_rot = Quaternion.look(target_pos - from_pos, Vector3.up())

				return from_pos, target_rot
			end,
		}, common_default_action_settings),
		soul_rip = {
			anim_end_event = "soul_rip_exit",
			anim_event = "soul_rip_attack",
			charge_fx_name = "fx/wpnfx_staff_death/rip_channel",
			charge_sound_name = "Play_weapon_necro_staff_suck",
			charge_sound_stop_event = "Stop_weapon_necro_staff_suck",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			head_fx_name = "fx/wpnfx_staff_death/rip_temp_directional",
			hold_input = "action_one_hold",
			is_spell = true,
			kind = "damage_target",
			last_damage_step_fx_name = "fx/wpnfx_staff_death/rip_burst",
			last_damage_step_sound_event = "Play_weapon_necro_staff_suck_pop",
			lethal_fx_name = "fx/wpnfx_staff_death/rip_soul",
			target_node = "torso",
			weapon_action_hand = "left",
			weapon_fx_name = "fx/wpnfx_staff_death/rip_temp_directional",
			total_time = math.huge,
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
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.6,
					start_time = 0,
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			damage_steps = {
				{
					damage_profile = "staff_suck_damage",
					overcharge_amount = 1,
					repeat_count = 4,
					repeat_delay = 0.2,
					start_delay = 0.25,
				},
				{
					can_crit = true,
					damage_profile = "soul_rip",
					overcharge_amount = 10,
					proc_buffs = true,
					repeat_count = 1,
					repeat_delay = 0,
					start_delay = 0.5,
				},
			},
			force_action_on_complete = {
				action_name = "action_one",
				sub_action_name = "soul_rip_cooldown",
			},
			chain_condition_func = function (player_unit, input_extension, ammo_extension, weapon_extension)
				if weapon_extension then
					local action = weapon_extension:get_current_action()

					return action and ALIVE[action.target]
				end

				return false
			end,
		},
		soul_rip_cooldown = {
			anim_end_event = "soul_rip_exit",
			anim_event = "soul_rip_pop",
			kind = "dummy",
			total_time = 1.5,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_one",
					hold_allowed = true,
					input = "action_one",
					start_time = 0.52,
					sub_action = "default",
				},
				{
					action = "action_two",
					hold_allowed = true,
					input = "action_two",
					start_time = 0.48,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	action_two = {
		default = {
			aim_obstructed_by_walls = true,
			aim_sticky_target_size = 1,
			aim_sticky_time = 0,
			aim_time = 0,
			allow_hold_toggle = true,
			anim_end_event = "soul_rip_exit",
			anim_event = "soul_rip_start",
			charge_sound_name = "Play_weapon_necro_staff_target",
			default_zoom = "zoom_in_trueflight",
			hold_input = "action_two_hold",
			ignore_bosses = false,
			kind = "true_flight_bow_aim",
			minimum_hold_time = 0.2,
			not_wield_previous = true,
			num_projectiles = 1,
			overcharge_interval = 0.3,
			overcharge_type = "charging",
			target_break_size = 5,
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.7,
					start_time = 0,
				},
			},
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
			},
			zoom_condition_function = function ()
				return true
			end,
			prioritized_breeds = {
				beastmen_bestigor = 1,
				beastmen_standard_bearer = 1,
				chaos_berzerker = 1,
				chaos_corruptor_sorcerer = 1,
				chaos_raider = 1,
				chaos_tether_sorcerer = 1,
				chaos_vortex_sorcerer = 1,
				chaos_warrior = 1,
				skaven_gutter_runner = 1,
				skaven_pack_master = 1,
				skaven_plague_monk = 1,
				skaven_poison_wind_globadier = 1,
				skaven_ratling_gunner = 1,
				skaven_storm_vermin = 1,
				skaven_storm_vermin_commander = 1,
				skaven_storm_vermin_with_shield = 1,
				skaven_warpfire_thrower = 1,
			},
			allowed_chain_actions = {
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
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.2,
					sub_action = "soul_rip",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.2,
					sub_action = "soul_rip",
				},
			},
		},
	},
	weapon_reload = {
		default = {
			anim_end_event = "cooldown_end",
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
weapon_template.left_hand_unit = "units/weapons/player/wpn_invisible_weapon"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.necro_skull
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_necro_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/necro_staff"
weapon_template.crosshair_style = "arrows"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.destroy_indexed_projectiles = true
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
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 2,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 7,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 7,
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
	"wwise/flamethrower",
}

local staff_death_vs = table.clone(weapon_template)

staff_death_vs.actions.action_one.soul_rip.damage_steps = {
	{
		damage_profile = "staff_suck_damage_vs",
		overcharge_amount = 1,
		repeat_count = 4,
		repeat_delay = 0.2,
		start_delay = 0.25,
	},
	{
		can_crit = true,
		damage_profile = "soul_rip_vs",
		overcharge_amount = 10,
		overcharge_amount_player_target = 35,
		proc_buffs = true,
		repeat_count = 1,
		repeat_delay = 0,
		start_delay = 0.5,
	},
}

return {
	staff_death = table.clone(weapon_template),
	staff_death_vs = table.clone(staff_death_vs),
}
