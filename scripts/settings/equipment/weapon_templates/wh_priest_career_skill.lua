-- chunkname: @scripts/settings/equipment/weapon_templates/wh_priest_career_skill.lua

local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			aim_time = 0,
			anim_end_event = "ability_finished",
			anim_event = "bless_start",
			hold_input = "action_career_hold",
			kind = "career_wh_priest_target",
			max_range = 20,
			target_cone_angle = 50,
			target_other_anim_event = "bless_target_other",
			target_self_anim_event = "bless_target_self",
			target_sticky_time = 0.2,
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
					action = "target_other_check",
					input = "action_one",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "spells",
					input = "action_career_release",
					start_time = 0,
					sub_action = "self_target",
				},
				{
					action = "spells",
					input = "action_career_not_hold",
					start_time = 0,
					sub_action = "self_target",
				},
				{
					action = "action_fake_inspect",
					input = "action_inspect_hold",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
		re_chain = {
			aim_time = 0,
			anim_end_event = "ability_finished",
			hold_input = "action_career_hold",
			kind = "career_wh_priest_target",
			max_range = 20,
			target_cone_angle = 50,
			target_other_anim_event = "bless_target_other",
			target_self_anim_event = "bless_target_self",
			target_sticky_time = 0.2,
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
					action = "target_other_check",
					input = "action_one",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "spells",
					input = "action_career_release",
					start_time = 0,
					sub_action = "self_target",
				},
				{
					action = "spells",
					input = "action_career_not_hold",
					start_time = 0,
					sub_action = "self_target",
				},
				{
					action = "action_fake_inspect",
					input = "action_inspect_hold",
					start_time = 0,
					sub_action = "default",
				},
			},
		},
	},
	spells = {
		self_target = {
			anim_end_event = "ability_finished",
			anim_event = "bless_self",
			kind = "career_wh_priest",
			target_self = true,
			total_time = 0.9,
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
		other_target = {
			anim_end_event = "ability_finished",
			anim_event = "bless_other",
			kind = "career_wh_priest",
			total_time = 0.9,
			uninterruptible = true,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_career_release = {
		default = {
			kind = "action_selector",
			conditional_actions = {
				{
					action = "spells",
					sub_action = "other_target",
					condition = function (talent_extension, buff_extension, weapon_extension)
						return weapon_extension and weapon_extension:get_mode()
					end,
				},
			},
			default_action = {
				action = "spells",
				sub_action = "self_target",
			},
		},
	},
	target_other_check = {
		default = {
			kind = "action_selector",
			conditional_actions = {
				{
					action = "spells",
					sub_action = "other_target",
					condition = function (talent_extension, buff_extension, weapon_extension)
						return weapon_extension and weapon_extension:get_mode()
					end,
				},
			},
			default_action = {
				action = "action_career_hold",
				sub_action = "re_chain",
			},
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "bless_cancel",
			kind = "career_dummy",
			total_time = 0.5,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_fake_inspect = {
		default = {
			anim_end_event = "inspect_end",
			anim_event = "inspect_start",
			can_abort_reload = false,
			hold_input = "action_inspect_hold",
			kind = "dummy",
			minimum_hold_time = 0.3,
			weapon_action_hand = "either",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_fake_inspect_end",
					input = "action_inspect_release",
					start_time = 0,
					sub_action = "default",
				},
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
				camera_look_sensitivity = 1,
				lerp_speed = 10,
				look_sensitivity = 1.5,
				recentering_lerp_speed = 0,
				sway_range = 1,
			},
		},
	},
	action_fake_inspect_end = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "inspect_end",
			kind = "career_dummy",
			total_time = 0.7,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_wield = ActionTemplates.wield,
}
weapon_template.right_hand_unit = "units/weapons/player/wpn_wh_book_01/wpn_wh_book_01"
weapon_template.right_hand_attachment_node_linking = AttachmentNodeLinking.book.left
weapon_template.wield_anim = "bless_start"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_priest"
weapon_template.load_state_machine = false
weapon_template.display_unit = "units/weapons/weapon_display/display_2h_swords_executioner"
weapon_template.crosshair_style = "wh_priest"
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
	wh_priest_career_skill_weapon = table.clone(weapon_template),
}
