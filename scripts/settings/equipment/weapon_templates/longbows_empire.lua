-- chunkname: @scripts/settings/equipment/weapon_templates/longbows_empire.lua

local ARROW_HIT_EFFECT = "arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2
local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			ammo_usage = 1,
			anim_event = "attack_shoot_fast",
			anim_event_last_ammo = "attack_shoot_fast_last",
			apply_recoil = true,
			charge_value = "arrow_hit",
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_light",
			kind = "bow",
			override_reload_time = 0.25,
			speed = 6500,
			total_time = 1,
			weapon_action_hand = "left",
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.5,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.6,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.6,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.6,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.carbine_arrow,
			impact_data = {
				damage_profile = "arrow_carbine",
				depth = 0.1,
				depth_offset = -0.6,
				link = true,
				targets = 1,
				wall_nail = true,
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			ammo_usage = 1,
			anim_end_event = "to_unzoom",
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			charge_value = "zoomed_arrow_hit",
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_heavy",
			hold_input = "action_two_hold",
			kind = "bow",
			minimum_hold_time = 0.55,
			override_reload_time = 0.5,
			play_reload_animation = true,
			reload_animation_override = "reload",
			reload_event_delay_time = 0.3,
			reset_aim_on_attack = true,
			speed = 10000,
			total_time = 2,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					send_buffer = true,
					start_time = 0.75,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.75,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.sniper_arrow,
			impact_data = {
				damage_profile = "longbow_empire",
				depth = 0.15,
				depth_offset = -0.6,
				link = true,
				targets = 1,
				wall_nail = true,
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged_heavy = {
			ammo_usage = 1,
			anim_end_event = "to_unzoom",
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			charge_value = "zoomed_arrow_hit",
			fire_sound_event = "player_combat_weapon_imperial_bow_fire_heavy",
			hold_input = "action_two_hold",
			kind = "bow",
			minimum_hold_time = 0.6,
			override_reload_time = 0.5,
			play_reload_animation = true,
			reload_animation_override = "reload",
			reload_event_delay_time = 0.3,
			reset_aim_on_attack = true,
			speed = 16000,
			total_time = 2,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.25,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.85,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.85,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			hit_effect = ARROW_HIT_EFFECT,
			projectile_info = Projectiles.sniper_arrow,
			impact_data = {
				damage_profile = "arrow_sniper_kruber",
				depth = 0.15,
				depth_offset = -0.6,
				link = true,
				targets = 1,
				wall_nail = true,
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.6,
			aim_at_gaze_setting = "tobii_aim_at_gaze_longbow_empire",
			aim_sound_delay = 0.1,
			aim_sound_event = "player_combat_weapon_bow_tighten_grip_loop",
			aim_zoom_delay = 2,
			allow_hold_toggle = true,
			ammo_usage = 1,
			anim_end_event = "draw_cancel",
			anim_event = "draw_bow",
			anim_time_scale = 2.2,
			charge_time = 0.5,
			cooldown = 0.2,
			heavy_aim_flow_delay = 0.9,
			heavy_aim_flow_event = "lua_heavy_zoom",
			hold_input = "action_two_hold",
			kind = "aim",
			minimum_hold_time = 0.2,
			reload_when_out_of_ammo = true,
			spread_template_override = "empire_longbow",
			unaim_sound_event = "stop_player_combat_weapon_bow_tighten_grip_loop",
			weapon_action_hand = "left",
			wield_blend_event = "equip_end",
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
					end_time = math.huge,
				},
				{
					action = "action_one",
					end_time = 1,
					input = "action_one",
					start_time = 0.5,
					sub_action = "shoot_charged",
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 1.25,
					sub_action = "shoot_charged_heavy",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.5,
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
	max_ammo = 20,
	reload_on_ammo_pickup = true,
	reload_time = 0.65,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_head",
	can_charge_shot = true,
	charge_above_range = 30,
	charge_when_obstructed = false,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = true,
	minimum_charge_time = 0.55,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special),
	effective_against_charged = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
}
weapon_template.default_spread_template = "bow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim_not_loaded = "to_es_longbow"
weapon_template.wield_anim = "to_es_longbow"
weapon_template.wield_anim_no_ammo = "to_es_longbow_noammo"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/longbow_es"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "LONGBOW"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/bow",
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0,
	effective_max_range = 30,
	max_range = 50,
	no_aim_input_multiplier = 0,
	target_node = "j_neck",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 3,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 3,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 6,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_sniper",
	"weapon_keyword_armour_piercing",
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
		{
			action_name = "action_one",
			chain_start_time = 0.5,
			sub_action_name = "shoot_charged",
		},
		{
			action_name = "action_one",
			chain_start_time = 1.25,
			sub_action_name = "shoot_charged_heavy",
		},
		custom_chain = true,
	},
}

local longbow_empire_template = table.clone(weapon_template)
local longbow_empire_tutorial_template = table.clone(weapon_template)

longbow_empire_tutorial_template.actions.action_one.default.impact_data.damage_profile = "tutorial_longbow"
longbow_empire_tutorial_template.actions.action_one.shoot_charged.impact_data.damage_profile = "tutorial_longbow_charged"
longbow_empire_tutorial_template.actions.action_one.shoot_charged_heavy.impact_data.damage_profile = "tutorial_longbow_charged"

return {
	longbow_empire_template = longbow_empire_template,
	longbow_empire_tutorial_template = longbow_empire_tutorial_template,
}
