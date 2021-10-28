local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			total_time_secondary = 2,
			speed = 16000,
			kind = "handgun",
			charge_value = "bullet_hit",
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			apply_recoil = true,
			reload_when_out_of_ammo = true,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_ramp_decay_delay = 0.2,
			range = 100,
			ammo_usage = 1,
			fire_time = 0,
			anim_event_secondary = "reload",
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_shoot",
			reload_time = 0.1,
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "auto_reload",
					start_time = 0.8,
					action = "weapon_reload",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine"
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		fast_shot = {
			reload_when_out_of_ammo = true,
			alert_sound_range_fire = 12,
			kind = "handgun",
			alert_sound_range_hit = 2,
			apply_recoil = true,
			spread_template_override = "pistol_special",
			charge_value = "bullet_hit",
			headshot_multiplier = 2,
			aim_assist_ramp_multiplier = 0.05,
			hit_effect = "bullet_impact",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.75,
			minimum_hold_time = 0.2,
			range = 100,
			ammo_usage = 1,
			fire_time = 0,
			aim_assist_ramp_decay_delay = 0.1,
			speed = 16000,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot_fast",
			reload_time = 0.1,
			total_time = 1,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.2,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.2,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					start_time = 0,
					blocker = true,
					input = "action_two_hold"
				},
				{
					sub_action = "auto_reload",
					action = "weapon_reload",
					auto_chain = true,
					release_required = "action_two_hold",
					start_time = 0
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine"
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		special_action_shoot = {
			total_time_secondary = 2,
			speed = 16000,
			kind = "handgun",
			charge_value = "bullet_hit",
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			apply_recoil = true,
			reload_when_out_of_ammo = true,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_ramp_decay_delay = 0.2,
			range = 100,
			ammo_usage = 1,
			fire_time = 0,
			anim_event_secondary = "reload",
			aim_assist_ramp_multiplier = 0.1,
			anim_event = "attack_shoot",
			reload_time = 0.1,
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					sound_time_offset = -0.05,
					chain_ready_sound = "weapon_gun_ready",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.6,
					action = "action_three",
					input = "action_three"
				},
				{
					sub_action = "auto_reload",
					start_time = 0.8,
					action = "weapon_reload",
					auto_chain = true
				}
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine"
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			anim_event = "lock_target",
			can_abort_reload = true,
			allow_hold_toggle = true,
			anim_end_event = "attack_finished",
			kind = "dummy",
			minimum_hold_time = 0.2,
			spread_template_override = "pistol_special",
			hold_input = "action_two_hold",
			ammo_requirement = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.85,
					buff_name = "planted_fast_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "fast_shot",
					start_time = 0,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "fast_shot",
					start_time = 0.25,
					action = "action_one",
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					start_time = 0,
					blocker = true,
					input = "action_two_hold"
				},
				{
					sub_action = "auto_reload",
					action = "weapon_reload",
					auto_chain = true,
					release_required = "action_two_hold",
					start_time = 0
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end
		}
	},
	action_three = {
		default = {
			anim_end_event = "attack_finished",
			ammo_requirement = 1,
			can_abort_reload = true,
			kind = "dummy",
			anim_event = "special_action",
			total_time = 1.71,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "special_action_shoot",
					start_time = 0.75,
					action = "action_one",
					release_required = "action_one_hold",
					end_time = 1.68,
					input = "action_one"
				},
				{
					sub_action = "special_action_shoot",
					start_time = 0.75,
					action = "action_one",
					end_time = 1.68,
					input = "action_one_hold"
				},
				{
					sub_action = "default",
					start_time = 1.7,
					action = "action_one",
					release_required = "action_one_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_two",
					input = "action_two_hold"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "weapon_reload",
					input = "weapon_reload"
				},
				{
					sub_action = "default",
					start_time = 0.8,
					action = "action_three",
					input = "action_three"
				}
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end
		}
	},
	weapon_reload = {
		default = {
			weapon_action_hand = "either",
			kind = "reload",
			total_time = 0,
			condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension = nil
				local zooming = status_extension:is_zooming()

				if zooming then
					return false
				end

				local equipment = inventory_extension:equipment()

				if equipment.right_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")
				elseif equipment.left_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")
				end

				return ammo_extension and ammo_extension:can_reload()
			end,
			chain_condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension = nil
				local zooming = status_extension:is_zooming()

				if zooming then
					return false
				end

				local equipment = inventory_extension:equipment()

				if equipment.right_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")
				elseif equipment.left_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")
				end

				return ammo_extension and ammo_extension:can_reload()
			end,
			allowed_chain_actions = {}
		},
		auto_reload = {
			weapon_action_hand = "either",
			kind = "reload",
			total_time = 0,
			condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension = nil
				local zooming = status_extension:is_zooming()

				if zooming then
					return false
				end

				local equipment = inventory_extension:equipment()

				if equipment.right_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")
				elseif equipment.left_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")
				end

				return ammo_extension and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload()
			end,
			chain_condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension = nil
				local zooming = status_extension:is_zooming()

				if zooming then
					return false
				end

				local equipment = inventory_extension:equipment()

				if equipment.right_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.right_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.right_hand_wielded_unit, "ammo_system")
				elseif equipment.left_hand_wielded_unit ~= nil and ScriptUnit.has_extension(equipment.left_hand_wielded_unit, "ammo_system") then
					ammo_extension = ScriptUnit.extension(equipment.left_hand_wielded_unit, "ammo_system")
				end

				return ammo_extension and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload()
			end,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield
}
weapon_template.action_on_wield = {
	action = "weapon_reload",
	sub_action = "default"
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_reload = 2,
	max_ammo = 30,
	ammo_per_clip = 12,
	reload_on_ammo_pickup = true,
	reload_time = 1,
	play_reload_anim_on_wield_reload = true
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored)
}
weapon_template.default_spread_template = "brace_of_pistols"
weapon_template.spread_lerp_speed = 5
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.pistol.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_dual_pistol"
weapon_template.reload_event = "reload"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "BRACE_OF_PISTOLS"
weapon_template.dodge_count = 100
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25
	}
}
weapon_template.aim_assist_settings = {
	max_range = 22,
	no_aim_input_multiplier = 0,
	aim_at_node = "j_spine",
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	breed_scalars = {
		skaven_storm_vermin = 0.25,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/pistol"
}
weapon_template.wwise_dep_left_hand = {
	"wwise/pistol"
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_rapid_fire",
	"weapon_keyword_versatile"
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "fast_shot"
	}
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default"
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "fast_shot"
	}
}

return {
	brace_of_pistols_template_1 = table.clone(weapon_template)
}
