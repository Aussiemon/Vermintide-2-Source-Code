﻿-- chunkname: @scripts/settings/equipment/weapon_templates/deus_rally_flag.lua

local deus_rally_flag_template = {
	can_give_other = true,
	gui_texture = "hud_consumable_icon_potion",
	left_hand_unit = "units/weapons/player/wpn_deus_folded_rally_flag_01/wpn_deus_folded_rally_flag_01",
	load_state_machine = false,
	max_fatigue_points = 4,
	state_machine = "units/beings/player/first_person_base/state_machines/common",
	wield_anim = "to_first_aid",
	actions = {
		action_one = {
			default = {
				ammo_usage = 1,
				damage_window_end = 0.35,
				damage_window_start = 0.1,
				hold_input = "action_one_hold",
				interaction_priority = 4,
				interaction_type = "deus_setup_rally_flag",
				kind = "self_interaction",
				uninterruptible = true,
				weapon_action_hand = "left",
				total_time = InteractionDefinitions.deus_setup_rally_flag.config.duration,
				allowed_chain_actions = {},
				condition_func = function (attacker_unit)
					local interactor_extension = ScriptUnit.extension(attacker_unit, "interactor_system")
					local can_interact = interactor_extension:can_interact(attacker_unit, "deus_setup_rally_flag")

					return can_interact
				end,
				finish_function = function (owner_unit, reason)
					if reason == "action_complete" then
						local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
						local event_data = FrameTable.alloc_table()

						dialogue_input:trigger_networked_dialogue_event("blessing_rally_flag_placed", event_data)
					end
				end,
			},
		},
		action_two = {
			default = ActionTemplates.give_item_on_defend,
		},
		action_instant_give_item = ActionTemplates.instant_give_item,
		action_inspect = ActionTemplates.action_inspect_left,
		action_career_skill = ActionTemplates.career_skill_dummy,
		action_wield = ActionTemplates.wield_left,
	},
	ammo_data = {
		ammo_hand = "left",
		ammo_per_clip = 1,
		destroy_when_out_of_ammo = true,
		ignore_ammo_pickup = true,
		max_ammo = 1,
		reload_time = 0,
	},
	left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1,
		},
		change_dodge_speed = {
			external_optional_multiplier = 1,
		},
	},
	pickup_data = {
		pickup_name = "deus_rally_flag",
	},
}

return {
	deus_rally_flag = deus_rally_flag_template,
}
