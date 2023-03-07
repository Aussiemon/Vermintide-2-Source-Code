local weapon_template = {
	actions = {
		action_career_hold = {
			default = {
				max_range = 20,
				aim_time = 0,
				target_other_anim_event = "bless_target_other",
				anim_end_event = "ability_finished",
				kind = "career_wh_priest_target",
				target_self_anim_event = "bless_target_self",
				uninterruptible = true,
				target_sticky_time = 0.2,
				target_cone_angle = 50,
				hold_input = "action_career_hold",
				anim_event = "bless_start",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				total_time = math.huge,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "weapon_reload"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "target_other_check",
						input = "action_one"
					},
					{
						sub_action = "self_target",
						start_time = 0,
						action = "spells",
						input = "action_career_release"
					},
					{
						sub_action = "self_target",
						start_time = 0,
						action = "spells",
						input = "action_career_not_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_fake_inspect",
						input = "action_inspect_hold"
					}
				}
			},
			re_chain = {
				max_range = 20,
				anim_end_event = "ability_finished",
				aim_time = 0,
				target_other_anim_event = "bless_target_other",
				kind = "career_wh_priest_target",
				target_self_anim_event = "bless_target_self",
				hold_input = "action_career_hold",
				target_sticky_time = 0.2,
				target_cone_angle = 50,
				uninterruptible = true,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				total_time = math.huge,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_two",
						input = "weapon_reload"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "target_other_check",
						input = "action_one"
					},
					{
						sub_action = "self_target",
						start_time = 0,
						action = "spells",
						input = "action_career_release"
					},
					{
						sub_action = "self_target",
						start_time = 0,
						action = "spells",
						input = "action_career_not_hold"
					},
					{
						sub_action = "default",
						start_time = 0,
						action = "action_fake_inspect",
						input = "action_inspect_hold"
					}
				}
			}
		},
		spells = {
			self_target = {
				anim_end_event = "ability_finished",
				kind = "career_wh_priest",
				target_self = true,
				uninterruptible = true,
				anim_event = "bless_self",
				total_time = 0.9,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {}
			},
			other_target = {
				anim_end_event = "ability_finished",
				kind = "career_wh_priest",
				uninterruptible = true,
				anim_event = "bless_other",
				total_time = 0.9,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {}
			}
		},
		action_career_release = {
			default = {
				kind = "action_selector",
				conditional_actions = {
					{
						sub_action = "other_target",
						action = "spells",
						condition = function (talent_extension, buff_extension, weapon_extension)
							return weapon_extension and weapon_extension:get_mode()
						end
					}
				},
				default_action = {
					action = "spells",
					sub_action = "self_target"
				}
			}
		},
		target_other_check = {
			default = {
				kind = "action_selector",
				conditional_actions = {
					{
						sub_action = "other_target",
						action = "spells",
						condition = function (talent_extension, buff_extension, weapon_extension)
							return weapon_extension and weapon_extension:get_mode()
						end
					}
				},
				default_action = {
					action = "action_career_hold",
					sub_action = "re_chain"
				}
			}
		},
		action_two = {
			default = {
				kind = "career_dummy",
				anim_end_event = "ability_finished",
				anim_event = "bless_cancel",
				total_time = 0.5,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {}
			}
		},
		action_fake_inspect = {
			default = {
				anim_end_event = "inspect_end",
				minimum_hold_time = 0.3,
				weapon_action_hand = "either",
				kind = "dummy",
				can_abort_reload = false,
				hold_input = "action_inspect_hold",
				anim_event = "inspect_start",
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				total_time = math.huge,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_fake_inspect_end",
						input = "action_inspect_release"
					}
				},
				finish_function = function (owner_unit, reason)
					local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

					if first_person_extension then
						first_person_extension:play_hud_sound_event("priest_book_loop_stop")
					end

					if reason ~= "new_interupting_action" then
						local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

						if inventory_extension then
							inventory_extension:wield_previous_non_level_slot()
						end
					end
				end,
				weapon_sway_settings = {
					recentering_lerp_speed = 0,
					lerp_speed = 10,
					sway_range = 1,
					camera_look_sensitivity = 1,
					look_sensitivity = 1.5
				}
			}
		},
		action_fake_inspect_end = {
			default = {
				kind = "career_dummy",
				anim_end_event = "ability_finished",
				anim_event = "inspect_end",
				total_time = 0.7,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				allowed_chain_actions = {}
			}
		},
		action_wield = ActionTemplates.wield
	},
	right_hand_unit = "units/weapons/player/wpn_wh_book_01/wpn_wh_book_01",
	right_hand_attachment_node_linking = AttachmentNodeLinking.book.left,
	wield_anim = "bless_start",
	display_unit = "units/weapons/weapon_display/display_2h_swords_executioner",
	crosshair_style = "wh_priest",
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
	particle_fx = {}
}
weapon_template.particle_fx_lookup = table.mirror_array_inplace(table.keys(weapon_template.particle_fx))
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_swords"
}

return {
	wh_priest_career_skill_weapon = table.clone(weapon_template)
}
