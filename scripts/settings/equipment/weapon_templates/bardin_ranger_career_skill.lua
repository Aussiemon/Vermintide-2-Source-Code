-- chunkname: @scripts/settings/equipment/weapon_templates/bardin_ranger_career_skill.lua

local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "veteran_ranger_ability_grenade",
			block_pickup = true,
			kind = "career_dummy",
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
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
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
					start_time = 0.3,
					sub_action = "default",
				},
				{
					action = "action_career_hold",
					auto_chain = true,
					start_time = 0.72,
					sub_action = "hold",
				},
			},
		},
		hold = {
			anim_end_event = "ability_finished",
			anim_event = "veteran_ranger_ability_grenade_hold",
			block_pickup = true,
			kind = "career_dummy",
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
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
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
	},
	action_career_release = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "veteran_ranger_ability_grenade_throw",
			block_pickup = true,
			kind = "career_dr_three",
			throw_time = 0.16,
			total_time = 0.25,
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "veteran_ranger_ability_grenade_cancel",
			kind = "career_dummy",
			total_time = 0.67,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect_right,
	action_wield = ActionTemplates.wield_right,
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_emp_grenade_02_t2/wpn_emp_grenade_02_t2"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.right
weapon_template.left_hand_unit = "units/weapons/player/wpn_emp_grenade_01_t1/wpn_emp_grenade_lighter_01_t1"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_grenade"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_ranger"
weapon_template.load_state_machine = false
weapon_template.gui_texture = "hud_consumable_icon_grenade"
weapon_template.crosshair_style = "default"
weapon_template.max_fatigue_points = 4
weapon_template.dodge_count = 3
weapon_template.can_give_other = true
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

return {
	bardin_ranger_career_skill_weapon = table.clone(weapon_template),
}
