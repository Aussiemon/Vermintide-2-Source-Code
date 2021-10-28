local wall_sim_gravity = -9.82
local wall_sim_speed = 15
local wall_width = 4
local wall_thickness = 1
local weapon_template = {
	actions = {
		action_career_hold = {
			default = {
				anim_end_event = "thorn_ability_cancel",
				kind = "career_we_thornsister_target_wall",
				weapon_action_hand = "left",
				uninterruptible = true,
				anim_event = "thorn_ability_start",
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
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						force_release_input = "action_two_hold",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_not_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_release"
					},
					{
						sub_action = "thorn_wall_target_flip",
						start_time = 0.1,
						action = "action_career_hold",
						input = "action_one"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			},
			thorn_wall_target_flip = {
				vertical_rotation = true,
				anim_end_event = "ability_finished",
				kind = "career_we_thornsister_target_wall",
				weapon_action_hand = "left",
				uninterruptible = true,
				anim_event = "thorn_ability_flip",
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
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						force_release_input = "action_two_hold",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_not_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_release"
					},
					{
						sub_action = "thorn_wall_target_flip_back",
						start_time = 0.1,
						action = "action_career_hold",
						input = "action_one"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			},
			thorn_wall_target_flip_back = {
				anim_end_event = "thorn_ability_cancel",
				kind = "career_we_thornsister_target_wall",
				weapon_action_hand = "left",
				uninterruptible = true,
				anim_event = "thorn_ability_flip_back",
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
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						force_release_input = "action_two_hold",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_not_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_career_release",
						input = "action_career_release"
					},
					{
						sub_action = "thorn_wall_target_flip",
						start_time = 0.1,
						action = "action_career_hold",
						input = "action_one"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			}
		},
		action_two = {
			default = {
				kind = "career_dummy",
				anim_end_event = "ability_finished",
				anim_event = "thorn_ability_cancel",
				weapon_action_hand = "left",
				total_time = 0.21,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			}
		},
		action_career_release = {
			default = {
				kind = "action_selector",
				weapon_action_hand = "left",
				conditional_actions = {
					{
						sub_action = "thorn_wall",
						action = "spells",
						condition = function (talent_extension, buff_extension, weapon_extension)
							return weapon_extension and weapon_extension:get_mode()
						end
					}
				},
				default_action = {
					action = "action_two",
					sub_action = "default"
				}
			}
		},
		spells = {
			thorn_wall = {
				anim_end_event = "ability_finished",
				weapon_action_hand = "left",
				kind = "career_we_thornsister_wall",
				uninterruptible = true,
				anim_event = "thorn_ability_cast",
				total_time = 0.75,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			}
		},
		action_inspect = ActionTemplates.action_inspect
	},
	left_hand_unit = "",
	left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left,
	wield_anim = "thorn_ability_start",
	display_unit = "units/weapons/weapon_display/display_2h_swords_executioner",
	crosshair_style = "default",
	buff_type = "RANGED_ABILITY",
	weapon_type = "RANGED_ABILITY",
	dodge_count = 2,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	particle_fx = {},
	particle_fx_lookup = table.mirror_array_inplace(table.keys(weapon_template.particle_fx)),
	wwise_dep_left_hand = {
		"wwise/two_handed_swords"
	}
}

return {
	we_thornsister_career_skill_weapon = table.clone(weapon_template)
}
