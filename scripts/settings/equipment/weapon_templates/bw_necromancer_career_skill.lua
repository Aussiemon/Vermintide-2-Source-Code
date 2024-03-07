-- chunkname: @scripts/settings/equipment/weapon_templates/bw_necromancer_career_skill.lua

local weapon_template = {}

weapon_template.actions = {
	action_career_hold = {
		default = {
			anim_event = "necro_ability_start",
			breed_to_spawn = "pet_skeleton",
			controlled_unit_template = "necromancer_pet_ability",
			faster_breed_to_spawn = "pet_skeleton",
			hold_input = "action_career_hold",
			kind = "career_bw_necromancer_raise_dead_targeting",
			uninterruptible = true,
			weapon_action_hand = "left",
			chain_condition_func = function (action_user, input_extension)
				local career_extension = ScriptUnit.extension(action_user, "career_system")
				local can_do = career_extension:current_ability_cooldown() <= 0

				return can_do
			end,
			total_time = math.huge,
			radius = DLCSettings.shovel.buff_templates.raise_dead_ability.buffs[1].area_radius,
			allowed_chain_actions = {
				{
					action = "action_career_hold",
					input = "action_one",
					start_time = 0,
					sub_action = "spawn_summon_area",
				},
				{
					action = "action_career_hold",
					input = "action_career_release",
					start_time = 0,
					sub_action = "spawn_summon_area",
				},
				{
					action = "action_wield",
					input = "action_wield",
					start_time = 0,
					sub_action = "default",
				},
				{
					action = "action_two",
					input = "action_two",
					start_time = 0,
					sub_action = "default",
				},
			},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
		},
		spawn_summon_area = {
			anim_event = "necro_ability_cast",
			kind = "dummy",
			total_time = 0.51,
			uninterruptible = true,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
			enter_function = function (attacker_unit, input_extension)
				input_extension:clear_input_buffer()

				return input_extension:reset_release_input()
			end,
			finish_function = function (owner_unit, reason)
				local input_extension = ScriptUnit.extension(owner_unit, "input_system")

				input_extension:clear_input_buffer()
				input_extension:reset_release_input()

				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

				inventory_extension:wield_previous_non_level_slot()
			end,
		},
	},
	action_two = {
		default = {
			anim_end_event = "ability_finished",
			anim_event = "necro_ability_cancel",
			kind = "career_dummy",
			total_time = 0.2,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_bw_necromancer_ability/wpn_bw_necromancer_ability"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_necro_command_item"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/career/skill_necromancer"
weapon_template.load_state_machine = false
weapon_template.display_unit = "units/weapons/weapon_display/display_staff"
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
weapon_template.wwise_dep_left_hand = {
	"wwise/two_handed_swords",
}

return {
	bw_necromancer_career_skill_weapon = table.clone(weapon_template),
}
