-- chunkname: @scripts/settings/equipment/weapon_templates/brace_of_pistols.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "handgun",
			range = 100,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			total_time = 1,
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
					chain_ready_sound = "weapon_gun_ready",
					input = "action_one",
					release_required = "action_one_hold",
					sound_time_offset = -0.05,
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					start_time = 0.8,
					sub_action = "auto_reload",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		fast_shot = {
			aim_assist_auto_hit_chance = 0.75,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.05,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot_fast",
			apply_recoil = true,
			charge_value = "bullet_hit",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			hold_input = "action_two_hold",
			kind = "handgun",
			minimum_hold_time = 0.2,
			range = 100,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			spread_template_override = "pistol_special",
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.85,
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
					action = "action_one",
					chain_ready_sound = "weapon_gun_ready",
					input = "action_one",
					release_required = "action_one_hold",
					sound_time_offset = -0.05,
					start_time = 0.25,
					sub_action = "fast_shot",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.25,
					sub_action = "fast_shot",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					blocker = true,
					input = "action_two_hold",
					start_time = 0,
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "auto_reload",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		special_action_shoot = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "handgun",
			range = 100,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			total_time = 1,
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
					chain_ready_sound = "weapon_gun_ready",
					input = "action_one",
					release_required = "action_one_hold",
					sound_time_offset = -0.05,
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					start_time = 0.8,
					sub_action = "auto_reload",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_carbine",
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.25,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			allow_hold_toggle = true,
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "lock_target",
			can_abort_reload = true,
			hold_input = "action_two_hold",
			kind = "dummy",
			minimum_hold_time = 0.2,
			spread_template_override = "pistol_special",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.85,
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
					start_time = 0,
					sub_action = "fast_shot",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.25,
					sub_action = "fast_shot",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
				{
					blocker = true,
					input = "action_two_hold",
					start_time = 0,
				},
				{
					action = "weapon_reload",
					auto_chain = true,
					release_required = "action_two_hold",
					start_time = 0,
					sub_action = "auto_reload",
				},
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end,
		},
	},
	action_three = {
		default = {
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "special_action",
			can_abort_reload = true,
			kind = "dummy",
			total_time = 1.71,
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
					end_time = 1.68,
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.75,
					sub_action = "special_action_shoot",
				},
				{
					action = "action_one",
					end_time = 1.68,
					input = "action_one_hold",
					start_time = 0.75,
					sub_action = "special_action_shoot",
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 1.7,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.75,
					sub_action = "default",
				},
				{
					action = "action_three",
					input = "action_three",
					start_time = 0.8,
					sub_action = "default",
				},
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end,
		},
	},
	weapon_reload = {
		default = {
			kind = "reload",
			total_time = 0,
			weapon_action_hand = "either",
			condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension
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
				local ammo_extension
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
			allowed_chain_actions = {},
		},
		auto_reload = {
			kind = "reload",
			total_time = 0,
			weapon_action_hand = "either",
			condition_func = function (action_user, input_extension)
				local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
				local status_extension = ScriptUnit.extension(action_user, "status_system")
				local ammo_extension
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
				local ammo_extension
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
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.action_on_wield = {
	action = "weapon_reload",
	sub_action = "default",
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 12,
	ammo_per_reload = 2,
	max_ammo = 30,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.default_spread_template = "brace_of_pistols"
weapon_template.spread_lerp_speed = 5
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.pistol.right
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_dual_pistol"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/dual_pistol"
weapon_template.reload_event = "reload"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "BRACE_OF_PISTOLS"
weapon_template.dodge_count = 100
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25,
	},
}
weapon_template.aim_assist_settings = {
	aim_at_node = "j_spine",
	always_auto_aim = true,
	base_multiplier = 0.15,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 0.25,
	},
}
weapon_template.wwise_dep_right_hand = {
	"wwise/pistol",
}
weapon_template.wwise_dep_left_hand = {
	"wwise/pistol",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 5,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 1,
		[DamageTypes.SPEED] = 6,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 6,
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
		sub_action_name = "fast_shot",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	heavy = {
		action_name = "action_one",
		sub_action_name = "fast_shot",
	},
}
weapon_template.tooltip_special_action_description = "special_action_brace_of_pistols"

return {
	brace_of_pistols_template_1 = table.clone(weapon_template),
}
