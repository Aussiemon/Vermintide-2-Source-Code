-- chunkname: @scripts/settings/equipment/weapon_templates/wh_deus_01.lua

local wh_deus_01_barrels = {
	{
		pitch = 0,
		shot_count = 3,
		yaw = -8,
	},
	{
		pitch = 0,
		shot_count = 3,
		yaw = -4,
	},
	{
		pitch = 0,
		shot_count = 6,
		yaw = 0,
	},
	{
		pitch = 0,
		shot_count = 3,
		yaw = 4,
	},
	{
		pitch = 0,
		shot_count = 3,
		yaw = 8,
	},
}
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
			bullseye = false,
			charge_value = "bullet_hit",
			damage_profile = "shot_duckfoot",
			fire_time = 0,
			headshot_multiplier = 2,
			hit_effect = "bullet_impact",
			kind = "multi_shoot",
			num_layers_spread = 12,
			range = 100,
			reload_time = 0.1,
			reload_when_out_of_ammo = true,
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
					input = "action_two",
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
			barrels = wh_deus_01_barrels,
			hit_mass_count = LINESMAN_HIT_MASS_COUNT,
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
			anim_end_event = "attack_finished",
			anim_event = "attack_push",
			anim_time_scale = 1.25,
			charge_value = "heavy_attack",
			damage_profile = "shield_slam_shotgun",
			damage_profile_aoe = "shield_slam_shotgun_aoe",
			damage_profile_target = "shield_slam_shotgun",
			damage_window_end = 0.3,
			damage_window_start = 0.2,
			dedicated_target_range = 3.5,
			forward_offset = 0.75,
			hit_effect = "melee_hit_slashing",
			hit_time = 0.25,
			impact_sound_event = "blunt_hit",
			kind = "shield_slam",
			no_damage_impact_sound_event = "blunt_hit_armour",
			push_dot = 0.75,
			push_radius = 2.5,
			reload_when_out_of_ammo = true,
			total_time = 1,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {
				{
					action = "action_one",
					input = "action_one",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 2,
					sub_action = "default",
				},
				{
					action = "weapon_reload",
					input = "weapon_reload",
					start_time = 0.5,
					sub_action = "default",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0.4,
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
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught,
}
weapon_template.action_on_wield = {
	action = "weapon_reload",
	sub_action = "default",
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 8,
	ammo_per_reload = 2,
	max_ammo = 26,
	play_reload_anim_on_wield_reload = true,
	reload_on_ammo_pickup = true,
	reload_time = 1,
}
weapon_template.attack_meta_data = {
	aim_at_node = "j_spine",
	can_charge_shot = false,
	ignore_enemies_for_obstruction = true,
	max_range = 10,
	effective_against = bit.bor(BreedCategory.Berserker, BreedCategory.Special, BreedCategory.Armored),
}
weapon_template.default_spread_template = "wh_deus_01"
weapon_template.spread_lerp_speed = 5
weapon_template.right_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.pistol.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_wh_deus_01/wpn_wh_deus_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.pistol.left
weapon_template.display_unit = "units/weapons/weapon_display/display_pistols"
weapon_template.wield_anim = "to_wh_deus_01"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/ranged/wh_deus_01"
weapon_template.reload_event = "reload"
weapon_template.crosshair_style = "default"
weapon_template.gui_texture = "hud_weapon_icon_repeating_handgun"
weapon_template.buff_type = "RANGED"
weapon_template.weapon_type = "wh_deus_01"
weapon_template.dodge_count = 100
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.25,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.25,
	},
	wh_deus_01_victor_witchhunter_bleed_on_critical_hit_disable = {},
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
	"wwise/wh_deus_01",
}
weapon_template.wwise_dep_left_hand = {
	"wwise/wh_deus_01",
}
weapon_template.weapon_diagram = {
	light_attack = {
		[DamageTypes.ARMOR_PIERCING] = 4,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 4,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 4,
	},
	heavy_attack = {
		[DamageTypes.ARMOR_PIERCING] = 0,
		[DamageTypes.CLEAVE] = 7,
		[DamageTypes.SPEED] = 3,
		[DamageTypes.STAGGER] = 1,
		[DamageTypes.DAMAGE] = 1,
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

return {
	wh_deus_01_template_1 = table.clone(weapon_template),
}
