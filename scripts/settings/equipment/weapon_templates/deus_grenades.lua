-- chunkname: @scripts/settings/equipment/weapon_templates/deus_grenades.lua

local weapon_template_frag = {
	can_give_other = true,
	crosshair_style = "default",
	dodge_count = 3,
	dodge_distance = 1,
	dodge_speed = 1,
	gui_texture = "hud_consumable_icon_grenade",
	left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1",
	load_state_machine = false,
	max_fatigue_points = 4,
	right_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_01_t1",
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	wield_anim = "to_grenade",
	actions = {
		action_one = {
			default = {
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				anim_event = "grenade_charge",
				block_pickup = true,
				charge_sound_name = "player_combat_weapon_grenade_ignite_loop",
				charge_sound_stop_event = "stop_player_combat_weapon_grenade_ignite_loop",
				charge_time = 1,
				explode_time = 3.5,
				kind = "charge",
				minimum_hold_time = 1.1,
				uninterruptible = true,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				total_time = math.huge,
				allowed_chain_actions = {
					{
						action = "action_one",
						input = "action_one_release",
						start_time = 1,
						sub_action = "throw",
					},
					{
						action = "action_one",
						input = "action_two",
						start_time = 0.55,
						sub_action = "cancel",
					},
					{
						blocker = true,
						input = "action_one_hold",
						start_time = 0,
					},
					{
						action = "action_one",
						auto_chain = true,
						start_time = 1.1,
						sub_action = "throw",
					},
				},
			},
			cancel = {
				anim_event = "grenade_charge_cancel",
				block_pickup = true,
				kind = "dummy",
				total_time = 1.25,
				allowed_chain_actions = {},
			},
			throw = {
				alert_sound_range_hit = 10,
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				anim_event = "attack_throw",
				block_pickup = true,
				fire_time = 0.3,
				forced_charge_level = 1,
				hide_weapon_after_fire = true,
				is_impact_type = true,
				kind = "charged_projectile",
				speed = 1750,
				throw_offset_length_in_target_direction = 0.1,
				throw_time = 0.13,
				throw_up_this_much_in_target_direction = 0.15,
				total_time = 0.5,
				uninterruptible = true,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				throw_offset = Vector3Box(0, 0, 0.9),
				allowed_chain_actions = {},
				projectile_info = Projectiles.grenade,
				impact_data = {
					grenade = true,
					targets = 1,
					aoe = ExplosionTemplates.grenade,
				},
				timed_data = {
					life_time = 3,
					aoe = ExplosionTemplates.grenade,
				},
				angular_velocity = {
					10,
					0,
					0,
				},
			},
		},
		action_two = {
			default = {
				kind = "dummy",
				total_time = 0,
				weapon_action_hand = "left",
				allowed_chain_actions = {},
			},
			give_item = ActionTemplates.give_item_on_defend,
		},
		action_instant_throw_grenade = {
			default = {
				kind = "dummy",
				total_time = 0,
				weapon_action_hand = "left",
				allowed_chain_actions = {},
			},
			instant_throw = {
				alert_sound_range_hit = 10,
				ammo_usage = 1,
				anim_end_event = "attack_finished",
				anim_event = "attack_throw",
				auto_validate_on_gamepad = true,
				block_pickup = true,
				fire_time = 0,
				forced_charge_level = 1,
				hide_weapon_after_fire = true,
				is_impact_type = true,
				kind = "charged_projectile",
				speed = 1750,
				throw_offset_length_in_target_direction = 0.1,
				throw_time = 0.13,
				throw_up_this_much_in_target_direction = 0.15,
				total_time = 0.5,
				uninterruptible = true,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
				end,
				condition_func = function (user_unit)
					return true
				end,
				throw_offset = Vector3Box(0, 0, 0.9),
				allowed_chain_actions = {},
				projectile_info = Projectiles.grenade,
				impact_data = {
					grenade = true,
					targets = 1,
					aoe = ExplosionTemplates.grenade,
				},
				timed_data = {
					life_time = 3,
					aoe = ExplosionTemplates.grenade,
				},
				angular_velocity = {
					10,
					0,
					0,
				},
			},
		},
		action_instant_give_item = ActionTemplates.instant_give_item,
		action_inspect = ActionTemplates.action_inspect,
		action_wield = ActionTemplates.wield,
		action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
		action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self,
		action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
		action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
		action_instant_equip_tome = ActionTemplates.instant_equip_tome,
		action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
		action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
		action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught,
	},
	ammo_data = {
		ammo_hand = "right",
		ammo_per_clip = 1,
		destroy_when_out_of_ammo = true,
		ignore_ammo_pickup = true,
		max_ammo = 1,
		reload_time = 0,
	},
	pickup_data = {
		pickup_name = "impact_grenade",
	},
	right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right,
	left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1,
		},
		change_dodge_speed = {
			external_optional_multiplier = 1,
		},
	},
}
local holy_hand_grenade = table.clone(weapon_template_frag)

holy_hand_grenade.actions.action_one.throw = {
	alert_sound_range_hit = 40,
	ammo_usage = 1,
	anim_end_event = "attack_finished",
	anim_event = "attack_throw",
	block_pickup = true,
	fire_time = 0.3,
	forced_charge_level = 1,
	hide_weapon_after_fire = true,
	hit_effect = "grenade_bounce",
	is_impact_type = true,
	kind = "charged_projectile",
	speed = 1750,
	throw_offset_length_in_target_direction = 0.1,
	throw_time = 0.13,
	throw_up_this_much_in_target_direction = 0.15,
	total_time = 0.5,
	uninterruptible = true,
	anim_end_event_condition_func = function (unit, end_reason)
		return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
	end,
	enter_function = function (attacker_unit, input_extxension)
		local dialogue_input = ScriptUnit.extension_input(attacker_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("on_holy_grenade", event_data)
	end,
	throw_offset = Vector3Box(0, 0, 0.9),
	allowed_chain_actions = {},
	projectile_info = Projectiles.holy_hand_grenade,
	impact_data = {
		grenade = true,
		no_stop_on_friendly_fire = true,
	},
	timed_data = {
		activate_life_time_on_impact = true,
		grenade = true,
		life_time = 5,
		aoe = ExplosionTemplates.holy_hand_grenade,
	},
	angular_velocity = {
		10,
		0,
		0,
	},
}
holy_hand_grenade.left_hand_unit = weapon_template_frag.left_hand_unit
holy_hand_grenade.wield_anim = weapon_template_frag.wield_anim
holy_hand_grenade.right_hand_unit = "units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_01_t1"
holy_hand_grenade.left_hand_unit = "units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_lighter_01_t1"
holy_hand_grenade.pickup_data.pickup_name = "holy_hand_grenade"

return {
	holy_hand_grenade = holy_hand_grenade,
}
