-- chunkname: @scripts/settings/equipment/weapon_templates/heavy_steam_pistol.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_charge",
			anim_event_secondary = "reload",
			can_abort_reload = false,
			charge_time = 0.7,
			fire_time = 0,
			headshot_multiplier = 2,
			hold_input = "action_one_hold",
			kind = "charge",
			minimum_hold_time = 0.2,
			range = 100,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			total_time = 1,
			total_time_secondary = 2,
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
					input = "action_one",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.7,
					sub_action = "shoot",
					hold_required = {
						"action_one_hold",
					},
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
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_sniper_pistol",
			},
		},
		shoot = {
			aim_assist_auto_hit_chance = 0.5,
			aim_assist_max_ramp_multiplier = 0.3,
			aim_assist_ramp_decay_delay = 0.2,
			aim_assist_ramp_multiplier = 0.1,
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 2,
			ammo_usage = 1,
			anim_event = "attack_shoot",
			anim_event_last_ammo = "attack_shoot_last",
			anim_event_secondary = "reload",
			apply_recoil = true,
			charge_value = "bullet_hit",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "handgun",
			range = 100,
			ranged_attack = true,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			total_time = 0.5,
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
					input = "action_one_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.55,
					sub_action = "default",
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
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_sniper_pistol",
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
			anim_event_last_ammo = "attack_shoot_fast_last",
			apply_recoil = true,
			charge_value = "bullet_hit",
			crosshair_style = "shotgun",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			hold_input = "action_two_hold",
			kind = "handgun",
			minimum_hold_time = 0.2,
			range = 100,
			ranged_attack = true,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
			speed = 16000,
			spread_template_override = "heavy_steam_pistol_special",
			total_time = 1,
			buff_data = {
				{
					buff_name = "planted_fast_decrease_movement",
					external_multiplier = 0.85,
					start_time = 0,
				},
			},
			on_chain_keep_audio_loops = {
				"aim",
			},
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.3,
					sub_action = "fast_shot",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.3,
					sub_action = "fast_shot",
					hold_required = {
						"action_two_hold",
					},
				},
				{
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.3,
					sub_action = "default",
				},
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
					action = "action_two",
					input = "action_two_hold",
					start_time = 0.4,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()
				Managers.state.achievement:trigger_event("steam_alt_fire", attacker_unit)

				return input_extension:reset_release_input()
			end,
			projectile_info = Projectiles.pistol_shot,
			impact_data = {
				damage_profile = "shot_sniper_pistol",
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
			aim_sound_delay = 0.4,
			aim_sound_event = "Play_wpn_engineer_pistol_spinning_loop",
			allow_hold_toggle = true,
			ammo_requirement = 1,
			anim_end_event = "attack_finished",
			anim_event = "lock_target",
			can_abort_reload = false,
			crosshair_style = "shotgun",
			hold_input = "action_two_hold",
			kind = "aim",
			looping_aim_sound = true,
			minimum_hold_time = 0.1,
			spread_template_override = "heavy_steam_pistol_special",
			unaim_sound_event = "Stop_wpn_engineer_pistol_spinning_loop",
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
					start_time = 0.5,
					sub_action = "fast_shot",
				},
				{
					action = "action_one",
					input = "action_one_hold",
					start_time = 0.5,
					sub_action = "fast_shot",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
			},
			condition_func = function (unit, input_extension, ammo_extension)
				if ammo_extension and ammo_extension:total_remaining_ammo() <= 0 then
					return false
				end

				return true
			end,
			zoom_condition_function = function ()
				return false
			end,
		},
	},
	weapon_reload = ActionTemplates.reload,
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 6,
	ammo_per_reload = 6,
	max_ammo = 24,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = false,
	reload_time = 1.55,
	should_update_anim_ammo = true,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_head",
	can_charge_shot = false,
}
weapon_template.jump_anim_enabled_1p = true
weapon_template.spread_lerp_speed = 5
weapon_template.default_spread_template = "pistol_special"
weapon_template.right_hand_unit = ""
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.steam_pistol
weapon_template.display_unit = "units/weapons/weapon_display/display_1h_grudge_raker"
weapon_template.wield_anim = "to_steam_pistol"
weapon_template.wield_anim_career = {
	dr_engineer = "to_steam_pistol_engi",
	dr_ironbreaker = "to_steam_pistol_ib",
}
weapon_template.wield_anim_no_ammo = "to_steam_pistol_noammo"
weapon_template.wield_anim_no_ammo_career = {
	dr_engineer = "to_steam_pistol_noammo_engi",
	dr_ironbreaker = "to_steam_pistol_noammo_ib",
}
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/steam_pistol"
weapon_template.no_ammo_reload_event = "reload"
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
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	fire_input = "fire_hold",
	ignore_enemies_for_obstruction = true,
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
	hold_fire_condition = function (t, blackboard)
		if blackboard then
			local inventory_extension = blackboard.inventory_extension
			local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
			local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

			if current_action_settings then
				local action_lookup = current_action_settings.lookup_data

				return action_lookup and action_lookup.action_name == "action_one" and action_lookup.sub_action_name == "default"
			end
		end

		return false
	end,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.wwise_dep_right_hand = {
	"wwise/steampistol",
}
weapon_template.wwise_dep_left_hand = {
	"wwise/steampistol",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 6,
		[DamageTypes.CLEAVE] = 2,
		[DamageTypes.SPEED] = 0,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 7,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 6,
		[DamageTypes.CLEAVE] = 3,
		[DamageTypes.SPEED] = 6,
		[DamageTypes.STAGGER] = 4,
		[DamageTypes.DAMAGE] = 7,
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

local heavy_steam_pistol_template_vs = table.clone(weapon_template)

heavy_steam_pistol_template_vs.actions.action_one.default.impact_data.damage_profile = "shot_sniper_pistol_vs"
heavy_steam_pistol_template_vs.actions.action_one.shoot.impact_data.damage_profile = "shot_sniper_pistol_vs"
heavy_steam_pistol_template_vs.actions.action_one.fast_shot.impact_data.damage_profile = "shot_sniper_pistol_vs"

return {
	heavy_steam_pistol_template_1 = table.clone(weapon_template),
	heavy_steam_pistol_template_1_vs = table.clone(heavy_steam_pistol_template_vs),
}
