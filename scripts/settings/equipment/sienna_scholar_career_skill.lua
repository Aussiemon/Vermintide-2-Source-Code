local NUM_PROJECTILES = 1
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_career = {
		default = {
			aim_time = 0,
			default_zoom = "zoom_in_trueflight",
			anim_end_event = "ability_finished",
			kind = "true_flight_bow_aim",
			hold_input = "action_career_hold",
			uninterruptible = true,
			anim_event = "scholar_burning_head_ability_charge",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			num_projectiles = NUM_PROJECTILES,
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
				"increased_zoom_in"
			},
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			zoom_condition_function = function ()
				return true
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "hold_charge",
					start_time = 0,
					action = "action_career_release",
					input = "action_career_release"
				},
				{
					sub_action = "default",
					start_time = 1,
					action = "action_career_hold",
					input = "action_career_hold",
					end_time = math.huge
				}
			}
		}
	},
	action_career_hold = {
		default = {
			default_zoom = "zoom_in_trueflight",
			anim_end_event = "ability_finished",
			kind = "true_flight_bow_aim",
			hold_input = "action_career_hold",
			aim_time = 0,
			uninterruptible = true,
			anim_event = "scholar_burning_head_ability_hold",
			weapon_action_hand = "left",
			minimum_hold_time = 0,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			num_projectiles = NUM_PROJECTILES,
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
				"increased_zoom_in"
			},
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			zoom_condition_function = function ()
				return true
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_release",
					input = "action_career_release",
					end_time = math.huge
				}
			}
		}
	},
	action_career_release = {
		hold_charge = {
			aim_time = 0,
			anim_end_event = "ability_finished",
			uninterruptible = true,
			kind = "chain_action_passthrough",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_two",
					input = "action_two"
				},
				{
					sub_action = "shoot_charged",
					start_time = 1,
					action = "action_career_release",
					auto_chain = true
				}
			}
		},
		shoot_charged = {
			damage_window_start = 0.1,
			alert_sound_range_hit = 20,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			ammo_usage = 1,
			kind = "career_bw_one",
			fire_sound_event_parameter = "drakegun_charge_fire",
			sphere_sweep_dot_threshold = 0.5,
			true_flight_template = "active_ability_sienna_scholar",
			alert_sound_range_fire = 12,
			sphere_sweep_length = 50,
			is_spell = true,
			damage_window_end = 0,
			anim_end_event = "ability_finished",
			fire_time = 0.35,
			speed = 1500,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "scholar_burning_head_ability_shoot",
			reload_time = 2.5,
			apply_recoil = true,
			reset_aim_on_attack = true,
			default_zoom = "zoom_in_trueflight",
			spread_template_override = "spear",
			hit_effect = "staff_spear",
			sphere_sweep_radius = 2,
			charge_value = "light_attack",
			fire_sound_on_husk = true,
			uninterruptible = true,
			ignore_shield_hit = true,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			num_projectiles = NUM_PROJECTILES,
			buffed_zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
				"increased_zoom_in"
			},
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in"
			},
			zoom_condition_function = function ()
				return true
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			projectile_info = Projectiles.burning_head,
			impact_data = {
				max_bounces = 8,
				damage_profile = "fire_spear_trueflight",
				bounce_on_level_units = true
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		default = {
			damage_window_start = 0.1,
			alert_sound_range_hit = 20,
			fire_sound_event = "weapon_staff_spark_spear_charged",
			kind = "career_bw_one",
			sphere_sweep_length = 50,
			fire_sound_event_parameter = "drakegun_charge_fire",
			sphere_sweep_dot_threshold = 0.5,
			true_flight_template = "active_ability_sienna_scholar",
			charge_value = "light_attack",
			alert_sound_range_fire = 12,
			damage_window_end = 0,
			anim_end_event = "ability_finished",
			fire_time = 0.35,
			speed = 1500,
			sphere_sweep_max_nr_of_results = 100,
			anim_event = "scholar_burning_head_ability_shoot",
			reload_time = 2.5,
			apply_recoil = true,
			reset_aim_on_attack = true,
			is_spell = true,
			spread_template_override = "spear",
			hit_effect = "staff_spear",
			sphere_sweep_radius = 2,
			ammo_usage = 1,
			fire_sound_on_husk = true,
			uninterruptible = true,
			ignore_shield_hit = true,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			num_projectiles = NUM_PROJECTILES,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			projectile_info = Projectiles.burning_head,
			impact_data = {
				max_bounces = 8,
				damage_profile = "fire_spear_trueflight",
				bounce_on_level_units = true
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			kind = "career_cancel",
			weapon_action_hand = "left",
			anim_end_event = "ability_finished",
			anim_event = "scholar_burning_head_ability_cancel",
			total_time = 0.65,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
	action_career_skill = ActionTemplates.career_skill_dummy,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught
}
weapon_template.ammo_data = {
	ammo_immediately_available = true,
	ammo_unit = "units/weapons/projectile/burning_head/burning_head",
	ammo_per_reload = 1,
	ammo_per_clip = 1,
	ammo_hand = "left",
	ammo_unit_3p = "units/weapons/projectile/burning_head/burning_head",
	reload_on_ammo_pickup = true,
	reload_time = 0,
	max_ammo = math.huge,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.burning_head
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	charged_attack_action_name = "shoot_charged",
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	aim_at_node_charged = "j_head",
	minimum_charge_time = 0.55,
	charge_when_obstructed = true,
	ignore_enemies_for_obstruction = true,
	charge_against_armoured_enemy = true
}
weapon_template.default_spread_template = "sparks"
weapon_template.right_hand_unit = "units/weapons/player/wpn_brw_skullstaff/wpn_brw_skullstaff"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.spear_staff
weapon_template.left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.crosshair_style = "default"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.aim_assist_settings = {
	max_range = 22,
	no_aim_input_multiplier = 0,
	aim_at_node = "j_neck",
	can_charge_shot = true,
	base_multiplier = 0.15,
	aim_at_node_charged = "j_spine",
	effective_max_range = 10,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_right_hand = {
	"wwise/staff"
}
Weapons = Weapons or {}
Weapons.sienna_scholar_career_skill_weapon = table.create_copy(Weapons.sienna_scholar_career_skill_weapon, weapon_template)

return 
