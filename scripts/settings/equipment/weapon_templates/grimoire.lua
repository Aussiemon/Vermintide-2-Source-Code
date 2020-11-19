local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			weapon_action_hand = "left",
			total_time = math.huge,
			allowed_chain_actions = {
				{
					sub_action = "dummy_action",
					start_time = 0,
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release"
				},
				{
					sub_action = "action_throw",
					start_time = 0.5,
					action = "action_one",
					auto_chain = true
				}
			}
		},
		dummy_action = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		action_throw = {
			kind = "throw_grimoire",
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			weapon_action_hand = "left",
			total_time = 0.7,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_grimoire_01/wpn_grimoire_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_first_aid"
weapon_template.gui_texture = "icons_placeholder_melee_01"
weapon_template.is_grimoire = true
weapon_template.max_fatigue_points = 1
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2
	}
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
		penetrating = false,
		max_range = math.huge
	},
	hold_attack = {
		arc = 0,
		penetrating = false,
		max_range = math.huge,
		attack_chain = {
			start_sub_action_name = "default",
			start_action_name = "action_one",
			transitions = {
				action_one = {
					default = {
						wanted_sub_action_name = "action_throw",
						wanted_action_name = "action_one",
						bot_wait_input = "hold_attack",
						bot_wanted_input = "hold_attack"
					}
				}
			}
		}
	}
}

WeaponUtils.add_bot_meta_data_chain_actions(weapon_template.actions, weapon_template.attack_meta_data.hold_attack.attack_chain.transitions)

local wpn_side_objective_tome_01 = table.clone(weapon_template)
wpn_side_objective_tome_01.left_hand_unit = "units/weapons/player/wpn_side_objective_tome/wpn_side_objective_tome_01"
wpn_side_objective_tome_01.actions = {
	action_one = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_two = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		}
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left
}
wpn_side_objective_tome_01.pickup_data = {
	pickup_name = "tome"
}
local wpn_grimoire_01 = table.clone(weapon_template)
local wpn_tome_01 = table.clone(wpn_side_objective_tome_01)
local inspect_table = table.clone(ActionTemplates.action_inspect)
inspect_table.action_inspect_hold.anim_event = "inspect_start_2"
wpn_grimoire_01.actions.action_inspect = inspect_table
wpn_tome_01.actions.action_inspect = inspect_table

return {
	wpn_grimoire_01 = table.clone(wpn_grimoire_01),
	wpn_side_objective_tome_01 = table.clone(wpn_tome_01)
}
