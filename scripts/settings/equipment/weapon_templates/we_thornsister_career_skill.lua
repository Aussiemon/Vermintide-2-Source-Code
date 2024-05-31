-- chunkname: @scripts/settings/equipment/weapon_templates/we_thornsister_career_skill.lua

local wall_sim_gravity = -9.82
local wall_sim_speed = 15
local wall_width = 4
local wall_thickness = 1
local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			anim_end_event = "thorn_ability_cancel",
			anim_event = "thorn_ability_start",
			kind = "career_we_thornsister_target_wall",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			target_sim_gravity = wall_sim_gravity,
			target_sim_speed = wall_sim_speed,
			target_width = wall_width,
			target_thickness = wall_thickness,
			allowed_chain_actions = {
				{
					action = "action_two",
					force_release_input = "action_two_hold",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
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
					action = "action_career_hold",
					input = "action_one",
					start_time = 0.1,
					sub_action = "thorn_wall_target_flip",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		thorn_wall_target_flip = {
			anim_end_event = "ability_finished",
			anim_event = "thorn_ability_flip",
			kind = "career_we_thornsister_target_wall",
			uninterruptible = true,
			vertical_rotation = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			target_sim_gravity = wall_sim_gravity,
			target_sim_speed = wall_sim_speed,
			target_width = wall_width,
			target_thickness = wall_thickness,
			target_bend_angle = wall_bend_angle,
			allowed_chain_actions = {
				{
					action = "action_two",
					force_release_input = "action_two_hold",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
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
					action = "action_career_hold",
					input = "action_one",
					start_time = 0.1,
					sub_action = "thorn_wall_target_flip_back",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		thorn_wall_target_flip_back = {
			anim_end_event = "thorn_ability_cancel",
			anim_event = "thorn_ability_flip_back",
			kind = "career_we_thornsister_target_wall",
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			target_sim_gravity = wall_sim_gravity,
			target_sim_speed = wall_sim_speed,
			target_width = wall_width,
			target_thickness = wall_thickness,
			target_bend_angle = wall_bend_angle,
			allowed_chain_actions = {
				{
					action = "action_two",
					force_release_input = "action_two_hold",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_career_release",
					input = "action_career_not_hold",
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
					action = "action_career_hold",
					input = "action_one",
					start_time = 0.1,
					sub_action = "thorn_wall_target_flip",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "thorn_ability_cancel",
			kind = "career_dummy",
			total_time = 0.21,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	action_career_release = {
		default = {
			kind = "action_selector",
			weapon_action_hand = "left",
			conditional_actions = {
				{
					action = "spells",
					sub_action = "thorn_wall",
					condition = function (talent_extension, buff_extension, weapon_extension)
						return weapon_extension and weapon_extension:get_mode()
					end,
				},
			},
			default_action = {
				action = "action_two",
				sub_action = "default",
			},
		},
	},
	spells = {
		thorn_wall = {
			anim_end_event = "ability_finished",
			anim_event = "thorn_ability_cast",
			kind = "career_we_thornsister_wall",
			total_time = 0.75,
			uninterruptible = true,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
	},
	action_inspect = ActionTemplates.action_inspect,
}
weapon_template.left_hand_unit = ""
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "thorn_ability_start"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_thornsister"
weapon_template.load_state_machine = false
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords_executioner"
weapon_template.crosshair_style = "default"
weapon_template.buff_type = "RANGED_ABILITY"
weapon_template.weapon_type = "RANGED_ABILITY"
weapon_template.dodge_count = 2
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}
weapon_template.particle_fx = {}
weapon_template.particle_fx_lookup = table.mirror_array_inplace(table.keys(weapon_template.particle_fx))

return {
	we_thornsister_career_skill_weapon = table.clone(weapon_template),
}
