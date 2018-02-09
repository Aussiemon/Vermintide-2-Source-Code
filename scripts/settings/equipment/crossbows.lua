local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			anim_event = "attack_shoot",
			kind = "crossbow",
			anim_event_no_ammo_left = "attack_shoot_last",
			charge_value = "arrow_hit",
			attack_template = "bolt_sniper",
			reload_when_out_of_ammo = true,
			aim_assist_ramp_multiplier = 0.3,
			aim_assist_max_ramp_multiplier = 1,
			aim_assist_ramp_decay_delay = 0.1,
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			apply_recoil = true,
			ammo_usage = 1,
			alert_sound_range_fire = 4,
			weapon_action_hand = "left",
			speed = 12000,
			active_reload_time = 0.25,
			alert_sound_range_hit = 2,
			total_time = 0.42,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			cleave_distribution = {
				attack = 0.5,
				impact = 0.1
			},
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 3,
				damage_profile = "crossbow_bolt",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 2,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoomed_shot = {
			reset_aim_on_attack = true,
			anim_end_event = "to_unzoom",
			weapon_action_hand = "left",
			kind = "crossbow",
			anim_event_no_ammo_left = "attack_shoot_last",
			alert_sound_range_fire = 4,
			attack_template = "bolt_sniper",
			alert_sound_range_hit = 2,
			reload_when_out_of_ammo = true,
			charge_value = "zoomed_arrow_hit",
			hit_effect = "arrow_impact",
			anim_event_last_ammo = "attack_shoot_last",
			minimum_hold_time = 0.5,
			apply_recoil = true,
			ammo_usage = 1,
			speed = 12000,
			active_reload_time = 0.25,
			hold_input = "action_two_hold",
			anim_event = "attack_shoot",
			scale_total_time_on_mastercrafted = true,
			total_time = 0.8,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.55,
					action = "action_one",
					release_required = "action_two_hold",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.75,
					action = "action_two",
					input = "action_two_hold",
					end_time = math.huge
				},
				{
					sub_action = "default",
					start_time = 0.4,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			cleave_distribution = {
				attack = 0.5,
				impact = 0.1
			},
			projectile_info = Projectiles.crossbow_bolt,
			impact_data = {
				wall_nail = true,
				depth = 0.025,
				targets = 3,
				damage_profile = "crossbow_bolt",
				link = true,
				depth_offset = -0.2
			},
			recoil_settings = {
				horizontal_climb = 0,
				restore_duration = 0.1,
				vertical_climb = 1,
				climb_duration = 0.1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad
			}
		},
		zoom_cancel = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = {
			anim_end_event = "to_unzoom",
			can_abort_reload = false,
			kind = "aim",
			cooldown = 0.3,
			aim_assist_ramp_multiplier = 0.6,
			aim_assist_ramp_decay_delay = 0.3,
			aim_sound_delay = 0.2,
			ammo_requirement = 1,
			minimum_hold_time = 0.15,
			weapon_action_hand = "left",
			reset_aim_assist_on_exit = true,
			aim_at_gaze_setting = "tobii_aim_at_gaze_crossbow",
			aim_assist_max_ramp_multiplier = 1,
			hold_input = "action_two_hold",
			anim_event = "to_zoom",
			allow_hold_toggle = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			buff_data = {
				{
					start_time = 0,
					external_multiplier = 0.25,
					buff_name = "planted_charging_decrease_movement"
				}
			},
			allowed_chain_actions = {
				{
					sub_action = "zoomed_shot",
					start_time = 0.3,
					action = "action_one",
					input = "action_one"
				},
				{
					sub_action = "default",
					start_time = 0.3,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "default",
					start_time = 0,
					action = "action_career_skill",
					input = "action_career_skill"
				}
			},
			zoom_condition_function = function ()
				return true
			end,
			unzoom_condition_function = function (end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension.total_remaining_ammo(ammo_extension) <= 0 then
					return false
				end

				return true
			end
		}
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
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
	ammo_per_reload = 1,
	ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
	destroy_when_out_of_ammo = false,
	ammo_per_clip = 1,
	ammo_hand = "left",
	play_reload_anim_on_wield_reload = false,
	ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
	max_ammo = 15,
	reload_on_ammo_pickup = true,
	reload_time = 1,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.bolt
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	charged_attack_action_name = "zoomed_shot",
	ignore_enemies_for_obstruction_charged = true,
	can_charge_shot = true,
	aim_at_node_charged = "j_neck",
	minimum_charge_time = 0.45,
	charge_above_range = 10,
	charge_when_obstructed = false,
	ignore_enemies_for_obstruction = false
}
weapon_template.aim_assist_settings = {
	max_range = 50,
	no_aim_input_multiplier = 0.3,
	always_auto_aim = true,
	base_multiplier = 0.1,
	target_node = "j_neck",
	effective_max_range = 40,
	breed_scalars = {
		skaven_storm_vermin = 1.2,
		skaven_clan_rat = 1,
		skaven_slave = 1
	}
}
local action = weapon_template.actions.action_one.default
weapon_template.default_loaded_projectile_settings = {
	drop_multiplier = 0.02,
	speed = action.speed,
	gravity = ProjectileGravitySettings[action.projectile_info.gravity_settings]
}
weapon_template.default_spread_template = "crossbow"
weapon_template.spread_lerp_speed = 4
weapon_template.spread_lerp_speed_zoom = 2.5
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.crossbow
weapon_template.display_unit = "units/weapons/weapon_display/display_rifle"
weapon_template.wield_anim = "to_crossbow_loaded"
weapon_template.wield_anim_no_ammo = "to_crossbow_noammo"
weapon_template.wield_anim_not_loaded = "to_crossbow"
weapon_template.crosshair_style = "projectile"
weapon_template.reload_event = "reload"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "CROSSBOW"
weapon_template.default_projectile_action = weapon_template.actions.action_one.default
weapon_template.dodge_distance = 1
weapon_template.dodge_speed = 1
weapon_template.dodge_count = 1
weapon_template.wwise_dep_left_hand = {
	"wwise/crossbow"
}
weapon_template.tooltip_keywords = {
	"keyword_1",
	"keyword_2",
	"keyword_3"
}
weapon_template.compare_statistics = {
	attacks = {
		light_attack = {
			speed = 0.2,
			range = 0.8,
			damage = 0.75,
			targets = 0.4,
			stagger = 0.6
		},
		heavy_attack = {
			speed = 0.2,
			range = 0.9,
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
weapon_template.damage_property = function (template, quality)
	if quality then
		slot2 = quality_settings.damage[quality]
	end

	return 
end
weapon_template.targets_property = function (template, quality)
	if quality then
		local targets = quality_settings.targets[quality]
		template.actions.action_one.default.impact_data.targets = template.actions.action_one.default.impact_data.targets + targets
		template.actions.action_one.zoomed_shot.impact_data.targets = template.actions.action_one.zoomed_shot.impact_data.targets + targets
	end

	return 
end
weapon_template.ammo_property = function (template, quality)
	if quality then
		template.ammo_data.max_ammo = template.ammo_data.max_ammo + math.floor(template.ammo_data.max_ammo*quality*0.1)
	end

	return 
end
weapon_template.reload_property = function (template, quality)
	if quality then
		template.ammo_data.reload_time = template.ammo_data.reload_time - quality*0.1
	end

	return 
end
Weapons = Weapons or {}
Weapons.crossbow_template_1 = table.create_copy(Weapons.crossbow_template_1, weapon_template)
Weapons.dwarf_ranger_career_skill_weapon = table.create_copy(Weapons.dwarf_ranger_career_skill_weapon, weapon_template)
Weapons.dwarf_ranger_career_skill_weapon.ammo_data.max_ammo = 3
Weapons.dwarf_ranger_career_skill_weapon.ammo_data.unwield_when_out_of_ammo = true

return 
