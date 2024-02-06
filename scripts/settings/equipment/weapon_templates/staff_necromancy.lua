-- chunkname: @scripts/settings/equipment/weapon_templates/staff_necromancy.lua

local weapon_template = {}
local MAX_ACTIVE_PROJECTILES = 5

weapon_template.actions = {
	action_one = {
		default = {
			anim_end_event = "attack_finished",
			anim_event = "attack_charge",
			anim_time_scale = 1,
			charge_flow_event_left_weapon = "charged",
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_name = "player_combat_weapon_staff_charge_fireball",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			hold_input = "action_one_hold",
			kind = "charge",
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			scale_anim_by_charge_time_buff = true,
			scale_chain_window_by_charge_time_buff = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_one",
					end_time = 1.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "shoot_fast",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 1.4,
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
		default_counterclockwise = {
			anim_end_event = "attack_finished",
			anim_event = "attack_charge",
			anim_time_scale = 1,
			charge_ready_sound_event = "hud_gameplay_stance_deactivate",
			charge_sound_husk_name = "player_combat_weapon_staff_charge_husk",
			charge_sound_husk_stop_event = "stop_player_combat_weapon_staff_charge_husk",
			charge_sound_name = "player_combat_weapon_staff_charge_fireball",
			charge_sound_parameter_name = "drakegun_charge_fire",
			charge_sound_stop_event = "player_combat_weapon_staff_charge_down",
			charge_sound_switch = "projectile_charge_sound",
			charge_time = 2,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			hold_input = "action_one_hold",
			kind = "charge",
			overcharge_interval = 0.3,
			overcharge_type = "drakegun_charging",
			scale_anim_by_charge_time_buff = true,
			scale_chain_window_by_charge_time_buff = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_one",
					end_time = 1.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "shoot_fast_counterclockwise",
				},
				{
					action = "action_one",
					input = "action_one_release",
					start_time = 1.4,
					sub_action = "shoot_charged_counterclockwise",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
		},
		shoot_fast = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_rapid_left",
			apply_recoil = true,
			charge_value = "light_attack",
			charged_speed = 16,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "weapon_sienna_necro_staff_cast_projectile",
			fire_sound_on_husk = true,
			fire_time = 0,
			flatten_target_vector = false,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_charged",
			scale_overcharge = true,
			scale_projectile = false,
			speed = 8,
			total_time = 1,
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
					start_time = 0.6,
					sub_action = "default_counterclockwise",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				local projectile_system = Managers.state.entity:system("projectile_system")
				local active_skull_count = projectile_system:get_indexed_projectile_count(attacker_unit)

				if active_skull_count >= MAX_ACTIVE_PROJECTILES then
					local projectile = projectile_system:get_and_delete_indexed_projectile(attacker_unit, 1, true)
					local projectile_extension = ScriptUnit.has_extension(projectile, "projectile_system")

					if projectile_extension then
						projectile_extension:trigger_external_event("detonate", true)
					end
				end

				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			generate_seed = function ()
				return math.random(0, 127)
			end,
			projectile_info = Projectiles.skull,
			impact_data = {
				damage_profile = "skull_impact",
				targets = 50,
			},
			timed_data = {
				activate_life_time_on_impact = true,
				charge_time = 2,
				charged_flow_event = "charged",
				life_time = math.huge,
			},
			charge_data = {
				aoe = ExplosionTemplates.skull_detonation,
				charged_aoe = ExplosionTemplates.skull_detonation_charged,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.6,
				vertical_climb = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_charged",
			apply_recoil = true,
			charge_value = "light_attack",
			charged_speed = 16,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "weapon_sienna_necro_staff_cast_projectile",
			fire_sound_on_husk = true,
			fire_time = 0,
			flatten_target_vector = false,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_charged",
			scale_overcharge = true,
			scale_projectile = false,
			speed = 8,
			total_time = 1,
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
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.3,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				local projectile_system = Managers.state.entity:system("projectile_system")
				local active_skull_count = projectile_system:get_indexed_projectile_count(attacker_unit)

				if active_skull_count >= MAX_ACTIVE_PROJECTILES then
					local projectile = projectile_system:get_and_delete_indexed_projectile(attacker_unit, 1, true)
					local projectile_extension = ScriptUnit.has_extension(projectile, "projectile_system")

					if projectile_extension then
						projectile_extension:trigger_external_event("detonate", true)
					end
				end

				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			generate_seed = function ()
				return math.random(128, 255)
			end,
			projectile_info = Projectiles.skull,
			impact_data = {
				damage_profile = "skull_impact",
				targets = 50,
			},
			timed_data = {
				activate_life_time_on_impact = true,
				charge_time = 2,
				charged_flow_event = "charged",
				life_time = math.huge,
			},
			charge_data = {
				aoe = ExplosionTemplates.skull_detonation,
				charged_aoe = ExplosionTemplates.skull_detonation_charged,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_fast_counterclockwise = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_rapid_right",
			apply_recoil = true,
			charge_value = "light_attack",
			charged_speed = 16,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "weapon_sienna_necro_staff_cast_projectile",
			fire_sound_on_husk = true,
			fire_time = 0,
			flatten_target_vector = false,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_charged",
			scale_overcharge = true,
			scale_projectile = false,
			speed = 8,
			total_time = 1,
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
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				local projectile_system = Managers.state.entity:system("projectile_system")
				local active_skull_count = projectile_system:get_indexed_projectile_count(attacker_unit)

				if active_skull_count >= MAX_ACTIVE_PROJECTILES then
					local projectile = projectile_system:get_and_delete_indexed_projectile(attacker_unit, 1, true)
					local projectile_extension = ScriptUnit.has_extension(projectile, "projectile_system")

					if projectile_extension then
						projectile_extension:trigger_external_event("detonate", true)
					end
				end

				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			generate_seed = function ()
				return math.random(128, 255)
			end,
			projectile_info = Projectiles.skull,
			impact_data = {
				damage_profile = "skull_impact",
				targets = 50,
			},
			timed_data = {
				activate_life_time_on_impact = true,
				charge_time = 2,
				charged_flow_event = "charged",
				life_time = math.huge,
			},
			charge_data = {
				aoe = ExplosionTemplates.skull_detonation,
				charged_aoe = ExplosionTemplates.skull_detonation_charged,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.5,
				vertical_climb = 0.2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged_counterclockwise = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			anim_event = "attack_shoot_charged",
			apply_recoil = true,
			charge_value = "light_attack",
			charged_speed = 16,
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			fire_sound_event = "weapon_sienna_necro_staff_cast_projectile",
			fire_sound_on_husk = true,
			fire_time = 0,
			flatten_target_vector = false,
			hit_effect = "fireball_impact",
			is_spell = true,
			kind = "charged_projectile",
			overcharge_type = "fireball_charged",
			scale_overcharge = true,
			scale_projectile = false,
			speed = 8,
			total_time = 1,
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
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.3,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				local projectile_system = Managers.state.entity:system("projectile_system")
				local active_skull_count = projectile_system:get_indexed_projectile_count(attacker_unit)

				if active_skull_count >= MAX_ACTIVE_PROJECTILES then
					local projectile = projectile_system:get_and_delete_indexed_projectile(attacker_unit, 1, true)
					local projectile_extension = ScriptUnit.has_extension(projectile, "projectile_system")

					if projectile_extension then
						projectile_extension:trigger_external_event("detonate", true)
					end
				end

				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			generate_seed = function ()
				return math.random(128, 255)
			end,
			projectile_info = Projectiles.skull,
			impact_data = {
				damage_profile = "skull_impact",
				targets = 50,
			},
			timed_data = {
				activate_life_time_on_impact = true,
				charge_time = 2,
				charged_flow_event = "charged",
				life_time = math.huge,
			},
			charge_data = {
				aoe = ExplosionTemplates.skull_detonation,
				charged_aoe = ExplosionTemplates.skull_detonation_charged,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 0,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			kind = "action_selector",
			conditional_actions = {
				{
					sub_action = "dummy",
					condition = function (talent_extension, buff_extension, weapon_extension)
						if weapon_extension then
							local projectile_system = Managers.state.entity:system("projectile_system")
							local active_skull_count = projectile_system:get_indexed_projectile_count(weapon_extension.owner_unit)

							return active_skull_count <= 0
						end

						return true
					end,
				},
				{
					sub_action = "detonate_one",
					condition = function (talent_extension, buff_extension, weapon_extension)
						if weapon_extension then
							local projectile_system = Managers.state.entity:system("projectile_system")
							local active_skull_count = projectile_system:get_indexed_projectile_count(weapon_extension.owner_unit)

							return active_skull_count == 1
						end

						return false
					end,
				},
			},
			default_action = {
				sub_action = "detonate_all",
			},
		},
		detonate_all = {
			anim_event = "attack_detonate_all",
			detonate_delay_increment = 0.075,
			detonate_delay_start = 0,
			detonation_order = "front_first",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			kind = "detonate",
			total_time = 0.2,
			num_to_detonate = math.huge,
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
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
					end_time = math.huge,
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
		detonate_one = {
			anim_event = "attack_detonate_one_02",
			detonate_delay_increment = 0.15,
			detonate_delay_start = 0,
			detonation_order = "back_first",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			kind = "detonate",
			num_to_detonate = 1,
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
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		dummy = {
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			kind = "dummy",
			total_time = 0,
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
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
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
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
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
	action_three = {
		default = {
			kind = "action_selector",
			conditional_actions = {
				{
					sub_action = "dummy",
					condition = function (talent_extension, buff_extension, weapon_extension)
						if weapon_extension then
							local projectile_system = Managers.state.entity:system("projectile_system")
							local active_skull_count = projectile_system:get_indexed_projectile_count(weapon_extension.owner_unit)

							return active_skull_count <= 0
						end

						return true
					end,
				},
			},
			default_action = {
				sub_action = "default_base",
			},
		},
		default_base = {
			anim_event = "attack_detonate_one",
			detonate_delay_increment = 0.15,
			detonate_delay_start = 0,
			detonation_order = "back_first",
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			kind = "detonate",
			num_to_detonate = 1,
			total_time = 1,
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
					release_required = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		dummy = {
			fire_at_gaze_setting = "tobii_fire_at_gaze_fireball",
			kind = "dummy",
			total_time = 0,
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
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0,
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
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
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
weapon_template.left_hand_unit = "units/weapons/player/wpn_necromancy_skull/wpn_necromancy_skull"
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
	"weapon_keyword_high_damage",
	"weapon_keyword_charged_attack",
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

return {
	staff_necromancy = weapon_template,
}
