-- chunkname: @scripts/settings/equipment/weapon_templates/shortbows_hagbane.lua

local weapon_template = {}
local ARROW_HIT_EFFECT = "poison_arrow_impact"
local ALERT_SOUND_RANGE_FIRE = 4
local ALERT_SOUND_RANGE_HIT = 2

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_max_ramp_multiplier = 0.5,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.2,
			ammo_usage = 1,
			anim_event = "attack_shoot_fast",
			anim_event_last_ammo = "attack_shoot_fast_last",
			apply_recoil = true,
			charge_value = "arrow_hit",
			fire_sound_event = "player_combat_weapon_shortbow_fire_light_poison",
			hit_effect = "poison_arrow_impact_small",
			kind = "bow",
			speed = 5000,
			total_time = 0.83,
			weapon_action_hand = "left",
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					end_time = 0.3,
					external_multiplier = 0.75,
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
					blocking_input = "action_two_hold",
					input = "action_one",
					release_required = "action_one_hold",
					start_time = 0.4,
					sub_action = "default",
					end_time = math.huge,
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
					start_time = 0.4,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			cleave_distribution = {
				attack = 0,
				impact = 0,
			},
			projectile_info = Projectiles.machinegun_poison_arrow,
			impact_data = {
				damage_profile = "shortbow_hagbane",
				targets = 1,
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -0.5,
				restore_duration = 0.15,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		shoot_charged = {
			allow_hold_toggle = true,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			charge_value = "zoomed_arrow_hit",
			fire_sound_event = "player_combat_weapon_shortbow_fire_heavy_poison",
			hold_input = "action_two_hold",
			keep_zoom = true,
			kind = "bow",
			minimum_hold_time = 0.3,
			reset_aim_on_attack = true,
			speed = 8000,
			total_time = 0.66,
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.6,
					sub_action = "default",
					end_time = math.huge,
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.66,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.6,
					sub_action = "default",
				},
			},
			hit_effect = ARROW_HIT_EFFECT,
			cleave_distribution = {
				attack = 0,
				impact = 0,
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.carbine_poison_arrow,
			impact_data = {
				aoe_on_bounce = true,
				damage_profile = "shortbow_hagbane_charged",
				aoe = ExplosionTemplates.carbine_poison_arrow,
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = -0.5,
				restore_duration = 0.15,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_decay_delay = 0.3,
			aim_assist_ramp_multiplier = 0.4,
			aim_at_gaze_setting = "tobii_aim_at_gaze_hagbane",
			aim_sound_delay = 0.3,
			aim_sound_event = "player_combat_weapon_bow_tighten_grip_loop",
			aim_zoom_delay = 0.25,
			allow_hold_toggle = true,
			ammo_usage = 1,
			anim_end_event = "draw_cancel",
			anim_event = "draw_bow",
			charge_time = 0.5,
			default_zoom = "zoom_in_trueflight",
			hold_input = "action_two_hold",
			kind = "aim",
			minimum_hold_time = 0.2,
			reload_when_out_of_ammo = true,
			unaim_sound_event = "stop_player_combat_weapon_bow_tighten_grip_loop",
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					buff_name = "planted_charging_decrease_movement",
					external_multiplier = 0.8,
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
					input = "action_one",
					start_time = 0.3,
					sub_action = "shoot_charged",
					end_time = math.huge,
				},
				{
					action = "action_one",
					input = "action_one_softbutton_gamepad",
					softbutton_threshold = 0.75,
					start_time = 0.3,
					sub_action = "shoot_charged",
					end_time = math.huge,
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.3,
					sub_action = "default",
				},
			},
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
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
	max_ammo = 17,
	reload_on_ammo_pickup = true,
	reload_time = 0.2,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	aim_at_node_charged = "j_spine",
	can_charge_shot = true,
	charge_above_range = 20,
	charge_when_obstructed = false,
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction = true,
	minimum_charge_time = 0.35,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special),
	effective_against_charged = bit.bor(BreedCategory.Infantry, BreedCategory.Berserker, BreedCategory.Armored, BreedCategory.Shielded),
}

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.03,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
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
weapon_template.default_spread_template = "bow"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.shortbow
weapon_template.wield_anim = "to_shortbow"
weapon_template.wield_anim_no_ammo = "to_shortbow_noammo"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/shortbow"
weapon_template.crosshair_style = "projectile"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "SHORTBOW_HAGBANE"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_count = 6
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25,
	},
}
weapon_template.server_buffs = {
	we_deus_01_kerillian_critical_bleed_dot_disable = {},
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 2,
		[DamageTypes.CLEAVE] = 0,
		[DamageTypes.SPEED] = 5,
		[DamageTypes.STAGGER] = 0,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 5,
		[DamageTypes.CLEAVE] = 6,
		[DamageTypes.SPEED] = 2,
		[DamageTypes.STAGGER] = 5,
		[DamageTypes.DAMAGE] = 6,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_damage_over_time",
	"weapon_keyword_rapid_fire",
	"weapon_keyword_crowd_control",
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
		action_name = "action_two",
		sub_action_name = "default",
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/bow",
}

return {
	shortbow_hagbane_template_1 = table.clone(weapon_template),
}
