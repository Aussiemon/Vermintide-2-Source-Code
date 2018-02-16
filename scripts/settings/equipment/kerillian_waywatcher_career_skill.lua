local NUM_PROJECTILES = 3
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_career = {
		default = {
			aim_time = 0,
			default_zoom = "zoom_in_trueflight",
			anim_end_event = "ability_finished",
			kind = "true_flight_bow_aim",
			hold_input = "action_career_hold",
			weapon_action_hand = "left",
			aim_sound_event = "Play_career_ability_waywatcher_start",
			minimum_hold_time = 0.83,
			uninterruptible = true,
			anim_event = "waywatcher_trueflight_ability_charge",
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
					start_time = 0.83,
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
			anim_event = "waywatcher_trueflight_ability_hold",
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
			weapon_action_hand = "left",
			kind = "chain_action_passthrough",
			uninterruptible = true,
			anim_event = "waywatcher_trueflight_ability_charge",
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
					sub_action = "default",
					start_time = 0.83,
					action = "action_career_release",
					auto_chain = true
				}
			}
		},
		default = {
			speed = 6000,
			ammo_usage = 0,
			fire_sound_event = "player_combat_weapon_bow_fire_light_homing",
			sphere_sweep_length = 50,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_dot_threshold = 0.75,
			true_flight_template = "active_ability_kerillian_way_watcher",
			weapon_action_hand = "left",
			multi_projectile_spread = 0.1,
			kind = "career_we_three",
			charge_value = "light_attack",
			aim_assist_ramp_decay_delay = 0.3,
			anim_end_event = "ability_finished",
			fire_time = 0.1,
			single_target = true,
			aim_assist_max_ramp_multiplier = 0.8,
			aim_assist_ramp_multiplier = 0.4,
			anim_event = "waywatcher_trueflight_ability_shoot",
			apply_recoil = true,
			extra_fire_sound_event = "Play_career_ability_waywatcher_shot ",
			hit_effect = "kerillian_ability_trueflight_arrow_impact",
			sphere_sweep_radius = 2,
			uninterruptible = true,
			ignore_shield_hit = true,
			total_time = 0.28,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			num_projectiles = NUM_PROJECTILES,
			projectile_info = Projectiles.kerillian_ability_true_flight,
			impact_data = {
				max_bounces = 2,
				depth = 0.1,
				bounce_on_level_units = true,
				targets = 1,
				damage_profile = "arrow_sniper_trueflight",
				wall_nail = true,
				link = true,
				depth_offset = -0.6
			},
			alert_sound_range_fire = ALERT_SOUND_RANGE_FIRE,
			alert_sound_range_hit = ALERT_SOUND_RANGE_HIT,
			recoil_settings = {
				horizontal_climb = -0.5,
				restore_duration = 0.2,
				vertical_climb = -1.5,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		}
	},
	action_two = {
		default = {
			weapon_action_hand = "left",
			anim_end_event = "ability_finished",
			kind = "career_cancel",
			total_time = 0,
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
	ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1",
	ammo_per_reload = 1,
	ammo_per_clip = 1,
	ammo_hand = "left",
	ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_tripple_arrow_t1_3p",
	reload_time = 0.4,
	max_ammo = math.huge,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.arrow_tripple
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false
}
weapon_template.default_spread_template = "longbow"
weapon_template.slot_to_use = "slot_ranged"
weapon_template.left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1"
weapon_template.display_unit = "units/weapons/weapon_display/display_bow"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.bow
weapon_template.wield_anim = "to_longbow"
weapon_template.wield_anim_no_ammo = "to_longbow_noammo"
weapon_template.crosshair_style = "default"
weapon_template.no_ammo_reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "LONGBOW_TRUEFLIGHT"
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0,
	always_auto_aim = true,
	base_multiplier = 0,
	target_node = "j_neck",
	effective_max_range = 30,
	breed_scalars = {
		skaven_storm_vermin = 1,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
weapon_template.wwise_dep_left_hand = {
	"wwise/bow"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.6,
			range = 0.6,
			damage = 0.5,
			targets = 0.2,
			stagger = 0.4
		},
		heavy_attack = {
			speed = 0.4,
			range = 0.8,
			damage = 0.75,
			targets = 0.4,
			stagger = 0.6
		}
	},
	perks = {
		light_attack = {
			"head_shot",
			"armor_penetration"
		},
		heavy_attack = {
			"head_shot",
			"armor_penetration"
		}
	}
}
local quality_settings = {
	damage = {
		1,
		2,
		3,
		4
	},
	targets = {
		1,
		2,
		3,
		4
	}
}
Weapons = Weapons or {}
Weapons.kerillian_waywatcher_career_skill_weapon = table.create_copy(Weapons.kerillian_waywatcher_career_skill_weapon, weapon_template)

return 
