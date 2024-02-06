﻿-- chunkname: @scripts/settings/equipment/weapon_templates/potions.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_heal",
			block_pickup = true,
			buff_template = "damage_boost_potion",
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			kind = "buff",
			total_time = 1.3,
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
		},
	},
	action_two = {
		default = ActionTemplates.give_item_on_defend,
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
	action_instant_give_item = ActionTemplates.instant_give_item,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	ignore_ammo_pickup = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_potion/wpn_potion"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.potion
weapon_template.wield_anim = "to_potion"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.max_fatigue_points = 4
weapon_template.can_give_other = true
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

local damage_boost_potion = table.clone(weapon_template)

damage_boost_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
damage_boost_potion.actions.action_one.default.buff_template = "damage_boost_potion"
damage_boost_potion.gui_texture = "hud_consumable_icon_potion"
damage_boost_potion.pickup_data = {
	pickup_name = "damage_boost_potion",
}

local speed_boost_potion = table.clone(weapon_template)

speed_boost_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
speed_boost_potion.actions.action_one.default.buff_template = "speed_boost_potion"
speed_boost_potion.gui_texture = "hud_consumable_icon_potion"
speed_boost_potion.pickup_data = {
	pickup_name = "speed_boost_potion",
}

local invulnerability_potion = table.clone(weapon_template)

invulnerability_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
invulnerability_potion.actions.action_one.default.buff_template = "invulnerability_potion"
invulnerability_potion.gui_texture = "hud_consumable_icon_potion"
invulnerability_potion.pickup_data = {
	pickup_name = "invulnerability_potion",
}

local cooldown_reduction_potion = table.clone(weapon_template)

cooldown_reduction_potion.left_hand_unit = "units/weapons/player/wpn_potion_buff/wpn_potion_buff"
cooldown_reduction_potion.actions.action_one.default.buff_template = "cooldown_reduction_potion"
cooldown_reduction_potion.gui_texture = "hud_consumable_icon_potion"
cooldown_reduction_potion.pickup_data = {
	pickup_name = "cooldown_reduction_potion",
}

return {
	damage_boost_potion = damage_boost_potion,
	speed_boost_potion = speed_boost_potion,
	invulnerability_potion = invulnerability_potion,
	cooldown_reduction_potion = cooldown_reduction_potion,
}
