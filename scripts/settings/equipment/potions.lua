local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_start = 0.05,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "buff",
			buff_template = "damage_boost_potion",
			damage_window_end = 0.2,
			weapon_action_hand = "left",
			block_pickup = true,
			uninterruptible = true,
			anim_event = "attack_heal",
			total_time = 1.3,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = ActionTemplates.give_item_on_defend
	},
	action_instant_drink_potion = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		instant_drink = {
			damage_window_end = 0.2,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "buff",
			buff_template = "damage_boost_potion",
			damage_window_start = 0.05,
			weapon_action_hand = "left",
			interaction_priority = 2,
			block_pickup = true,
			uninterruptible = true,
			anim_event = "attack_heal",
			auto_validate_on_gamepad = true,
			total_time = 1.3,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
			condition_func = function (attacker_unit)
				return true
			end
		}
	},
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_inspect = ActionTemplates.action_inspect_left,
	action_career_skill = ActionTemplates.career_skill_dummy,
	action_wield = ActionTemplates.wield_left,
	action_instant_grenade_throw = ActionTemplates.instant_grenade_throw,
	action_instant_heal_self = ActionTemplates.instant_equip_and_heal_self
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0,
	ignore_ammo_pickup = true
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_potion/wpn_potion"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.potion
weapon_template.wield_anim = "to_potion"
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.max_fatigue_points = 4
weapon_template.can_give_other = true
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}
Weapons = Weapons or {}
Weapons.damage_boost_potion = Weapons.damage_boost_potion or table.clone(weapon_template)
Weapons.damage_boost_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
Weapons.damage_boost_potion.actions.action_one.default.buff_template = "damage_boost_potion"
Weapons.damage_boost_potion.actions.action_instant_drink_potion.instant_drink.buff_template = "damage_boost_potion"
Weapons.damage_boost_potion.gui_texture = "hud_consumable_icon_potion"
Weapons.damage_boost_potion.pickup_data = {
	pickup_name = "damage_boost_potion"
}
Weapons.speed_boost_potion = Weapons.speed_boost_potion or table.clone(weapon_template)
Weapons.speed_boost_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
Weapons.speed_boost_potion.actions.action_one.default.buff_template = "speed_boost_potion"
Weapons.speed_boost_potion.actions.action_instant_drink_potion.instant_drink.buff_template = "speed_boost_potion"
Weapons.speed_boost_potion.gui_texture = "hud_consumable_icon_potion"
Weapons.speed_boost_potion.pickup_data = {
	pickup_name = "speed_boost_potion"
}
Weapons.invulnerability_potion = Weapons.cooldown_reduction_potion or table.clone(weapon_template)
Weapons.invulnerability_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
Weapons.invulnerability_potion.actions.action_one.default.buff_template = "invulnerability_potion"
Weapons.invulnerability_potion.actions.action_instant_drink_potion.instant_drink.buff_template = "invulnerability_potion"
Weapons.invulnerability_potion.gui_texture = "hud_consumable_icon_potion"
Weapons.invulnerability_potion.pickup_data = {
	pickup_name = "invulnerability_potion"
}
Weapons.cooldown_reduction_potion = Weapons.invulnerability_potion or table.clone(weapon_template)
Weapons.cooldown_reduction_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
Weapons.cooldown_reduction_potion.actions.action_one.default.buff_template = "cooldown_reduction_potion"
Weapons.cooldown_reduction_potion.actions.action_instant_drink_potion.instant_drink.buff_template = "cooldown_reduction_potion"
Weapons.cooldown_reduction_potion.gui_texture = "hud_consumable_icon_potion"
Weapons.cooldown_reduction_potion.pickup_data = {
	pickup_name = "cooldown_reduction_potion"
}

return
