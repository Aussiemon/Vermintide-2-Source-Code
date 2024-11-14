-- chunkname: @scripts/settings/equipment/weapon_templates/dr_deus_01.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			active_reload_time = 0.25,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			aim_assist_ramp_multiplier = 0.3,
			alert_sound_range_fire = 4,
			alert_sound_range_hit = 10,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_infinite_ammo_1p = "attack_shoot_no_reload",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_no_ammo_left = "attack_shoot_last",
			apply_recoil = true,
			attack_template = "bolt_sniper",
			charge_value = "arrow_hit",
			fire_time = 0,
			hit_effect = "arrow_impact",
			kind = "grenade_thrower",
			ranged_attack = true,
			reload_when_out_of_ammo = true,
			speed = 2500,
			total_time = 1.2,
			unhide_ammo_on_infinite_ammo = true,
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 1,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
			angular_velocity = {
				10,
				0,
				0,
			},
			projectile_info = Projectiles.dr_deus_01,
			impact_data = {
				damage_profile = "dr_deus_01",
				targets = 1,
				aoe = ExplosionTemplates.dr_deus_01,
			},
			timed_data = {
				life_time = 3,
				aoe = ExplosionTemplates.dr_deus_01,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 2,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
		push = {
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			attack_template = "basic_sweep_push",
			charge_value = "action_push",
			damage_profile_inner = "medium_push",
			damage_profile_outer = "light_push",
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			dedicated_target_range = 2,
			hit_effect = "melee_hit_hammers_1h",
			impact_sound_event = "slashing_hit",
			kind = "push_stagger",
			no_damage_impact_sound_event = "slashing_hit_armour",
			outer_push_angle = 180,
			push_angle = 100,
			push_radius = 3,
			total_time = 0.5,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					end_time = 0.2,
					external_multiplier = 1.25,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.6,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 1,
					sub_action = "default",
				},
			},
			chain_condition_func = function (attacker_unit, input_extension)
				local status_extension = ScriptUnit.extension(attacker_unit, "status_system")

				return not status_extension:fatigued()
			end,
		},
	},
	action_two = {
		default = {
			anim_end_event = "parry_finished",
			anim_event = "parry_pose",
			cooldown = 0.15,
			hold_input = "action_two_hold",
			kind = "block",
			minimum_hold_time = 0.2,
			reload_when_out_of_ammo = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			enter_function = function (attacker_unit, input_extension, remaining_time)
				return input_extension:reset_release_input_with_delay(remaining_time)
			end,
			buff_data = {
				{
					buff_name = "planted_decrease_movement",
					external_multiplier = 0.8,
					start_time = 0,
				},
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					start_time = 0.2,
					sub_action = "push",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_one",
					doubleclick_window = 0,
					input = "action_one",
					release_required = "action_two_hold",
					start_time = 0.2,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			reload_when_out_of_ammo_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "stunned"
			end,
		},
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	ammo_per_reload = 1,
	destroy_when_out_of_ammo = false,
	has_wield_reload_anim = false,
	max_ammo = 7,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 3,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.dr_deus_01_projectile,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	can_charge_shot = false,
	ignore_enemies_for_obstruction = false,
	max_range = 20,
	aim_data = {
		max_radius_pseudo_random_c = 0.0557,
		min_radius_pseudo_random_c = 0.3021,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	aim_data_charged = {
		max_radius_pseudo_random_c = 0.01475,
		min_radius_pseudo_random_c = 0.0557,
		min_radius = math.pi / 72,
		max_radius = math.pi / 16,
	},
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Armored, BreedCategory.Special, BreedCategory.Shielded, BreedCategory.SuperArmor, BreedCategory.Boss),
}
weapon_template.aim_assist_settings = {
	always_auto_aim = true,
	base_multiplier = 0.1,
	effective_max_range = 40,
	max_range = 50,
	no_aim_input_multiplier = 0.3,
	target_node = "j_neck",
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1.2,
	},
}

local action = weapon_template.actions.action_one.default

weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.02,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings],
}
weapon_template.default_spread_template = "crossbow"
weapon_template.spread_lerp_speed = 6
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.dr_deus_01
weapon_template.display_unit = "units/weapons/weapon_display/display_drakegun"
weapon_template.wield_anim = "to_dr_deus_01_loaded"
weapon_template.wield_anim_no_ammo = "to_dr_deus_01_noammo"
weapon_template.wield_anim_not_loaded = "to_dr_deus_01"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/dr_deus_01"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "dr_deus_01"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.max_fatigue_points = 6
weapon_template.dodge_count = 1
weapon_template.block_angle = 90
weapon_template.outer_block_angle = 360
weapon_template.block_fatigue_point_multiplier = 0.5
weapon_template.outer_block_fatigue_point_multiplier = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.wwise_dep_left_hand = {
	"wwise/dr_deus_01",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 7,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 0,
		[DamageTypes.STAGGER] = 7,
		[DamageTypes.DAMAGE] = 7,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 1,
		[DamageTypes.STAGGER] = 2,
		[DamageTypes.DAMAGE] = 0,
	},
}
weapon_template.tooltip_keywords = {
	"weapon_keyword_high_damage",
	"weapon_keyword_crowd_control",
	"weapon_keyword_piercing_bolts",
}
weapon_template.tooltip_compare = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
}
weapon_template.tooltip_detail = {
	light = {
		action_name = "action_one",
		sub_action_name = "default",
	},
	push = {
		action_name = "action_one",
		sub_action_name = "push",
	},
}

local weapon_template_vs = table.clone(weapon_template)

weapon_template_vs.actions.action_one.default.impact_data.damage_profile = "dr_deus_01_vs"

return {
	dr_deus_01_template_1 = table.clone(weapon_template),
	dr_deus_01_template_1_vs = table.clone(weapon_template_vs),
}
