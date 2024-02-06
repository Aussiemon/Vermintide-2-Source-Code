-- chunkname: @scripts/settings/equipment/weapon_templates/bardin_survival_ale.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "drink",
			block_pickup = true,
			buff_template = "bardin_survival_ale_buff",
			kind = "one_time_consumable",
			total_time = 1.9,
			uninterruptible = true,
			weapon_action_hand = "right",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
		},
	},
	action_dropped = {
		default = {
			alert_sound_range_hit = 10,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			block_pickup = true,
			kind = "throw",
			speed = 5,
			throw_time = 0.35,
			total_time = 0.7,
			uninterruptible = true,
			velocity_multiplier = 1,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
			angular_velocity = {
				0,
				-5,
				0,
			},
			throw_offset = {
				0.25,
				1.2,
				0,
			},
			projectile_info = {
				drop_on_player_destroyed = true,
				pickup_name = "bardin_survival_ale",
				projectile_unit_name = "units/weapons/player/pup_ale/pup_ale",
				projectile_unit_template_name = "pickup_unit",
			},
		},
	},
	action_wield = ActionTemplates.wield_and_use,
}
weapon_template.ammo_data = {
	ammo_hand = "right",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	ignore_ammo_pickup = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_ale/wpn_ale"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.potion_right
weapon_template.wield_anim = "to_potion"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.pickup_data = {
	pickup_name = "bardin_survival_ale",
}
weapon_template.max_fatigue_points = 4
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

return {
	bardin_survival_ale = table.clone(weapon_template),
}
