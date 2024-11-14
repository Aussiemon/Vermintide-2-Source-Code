-- chunkname: @scripts/settings/equipment/weapon_templates/sienna_scholar_career_skill.lua

local NUM_PROJECTILES = 1
local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			aim_obstructed_by_walls = true,
			aim_time = 0,
			anim_end_event = "ability_finished",
			anim_event = "scholar_burning_head_ability_charge",
			charge_sound_husk_name = "Play_weapon_ability_pyromancer_skull_spawn_husk",
			charge_sound_husk_stop_event = "Stop_weapon_ability_pyromancer_skull_spawn_husk",
			charge_sound_name = "Play_weapon_ability_pyromancer_skull_spawn",
			charge_sound_stop_event = "Stop_weapon_ability_pyromancer_skull_spawn",
			default_zoom = "zoom_in_trueflight",
			init_flow_event = "burning_head_init",
			kind = "career_true_flight_aim",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			num_projectiles = NUM_PROJECTILES,
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
			},
			zoom_condition_function = function ()
				return true
			end,
			allowed_chain_actions = {
				{
					action = "action_two",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "weapon_reload",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_release",
					start_time = 0.1,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
					start_time = 0.1,
					sub_action = "default",
				},
			},
		},
	},
	action_career_release = {
		default = {
			alert_sound_range_fire = 12,
			alert_sound_range_hit = 20,
			ammo_usage = 0,
			anim_end_event = "ability_finished",
			anim_event = "scholar_burning_head_ability_shoot",
			apply_recoil = true,
			charge_value = "light_attack",
			damage_window_end = 0,
			damage_window_start = 0.1,
			default_zoom = "zoom_in_trueflight",
			fire_sound_event = "Play_weapon_ability_pyromancer_skull_shoot",
			fire_sound_on_husk = true,
			fire_time = 0.2,
			hit_effect = "sienna_scholar_career_ability",
			ignore_shield_hit = true,
			kind = "career_bw_one",
			no_headshot_sound = true,
			reload_time = 2.5,
			reset_aim_on_attack = true,
			speed = 3500,
			sphere_sweep_dot_threshold = 0.5,
			sphere_sweep_length = 50,
			sphere_sweep_max_nr_of_results = 100,
			sphere_sweep_radius = 2,
			spread_template_override = "spear",
			total_time = 1,
			true_flight_template = "active_ability_sienna_scholar",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			num_projectiles = NUM_PROJECTILES,
			zoom_thresholds = {
				"zoom_in_trueflight",
				"zoom_in",
			},
			zoom_condition_function = function ()
				return true
			end,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
			projectile_info = Projectiles.burning_head,
			impact_data = {
				bounce_on_level_units = true,
				damage_profile = "fire_spear_trueflight",
				max_bounces = 8,
			},
			recoil_settings = {
				climb_duration = 0.1,
				horizontal_climb = 0,
				restore_duration = 0.2,
				vertical_climb = -1,
				climb_function = math.easeInCubic,
				restore_function = math.ease_out_quad,
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "scholar_burning_head_ability_cancel",
			kind = "career_dummy",
			total_time = 0.65,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect,
	action_wield = ActionTemplates.wield,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_immediately_available = true,
	ammo_per_clip = 1,
	ammo_per_reload = 1,
	reload_time = 0,
	max_ammo = math.huge,
	ammo_unit_attachment_node_linking = AttachmentNodeLinking.burning_head,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine1",
	aim_at_node_charged = "j_head",
	always_charge_before_firing = true,
	base_action_name = "action_career_release",
	can_charge_shot = true,
	charge_shot_delay = 0.1,
	charge_when_obstructed = true,
	charged_attack_action_name = "default",
	ignore_allies_for_obstruction = true,
	ignore_allies_for_obstruction_charged = true,
	ignore_enemies_for_obstruction = false,
	ignore_enemies_for_obstruction_charged = false,
	minimum_charge_time = 0.55,
}
weapon_template.default_spread_template = "sparks"
weapon_template.left_hand_unit = "units/weapons/player/wpn_invisible_weapon"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
weapon_template.wield_anim = "to_staff"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_scholar"
weapon_template.load_state_machine = false
weapon_template.crosshair_style = "default"
weapon_template.buff_type = "RANGED_ABILITY"
weapon_template.weapon_type = "FIRE_STAFF"
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.aim_assist_settings = {
	aim_at_node = "j_neck",
	aim_at_node_charged = "j_spine",
	base_multiplier = 0.15,
	can_charge_shot = true,
	effective_max_range = 10,
	max_range = 22,
	no_aim_input_multiplier = 0,
	breed_scalars = {
		skaven_clan_rat = 1,
		skaven_slave = 1,
		skaven_storm_vermin = 1,
	},
}

return {
	sienna_scholar_career_skill_weapon = table.clone(weapon_template),
}
