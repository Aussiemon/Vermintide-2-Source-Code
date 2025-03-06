-- chunkname: @scripts/settings/equipment/weapon_templates/grimoire.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			weapon_action_hand = "left",
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "dummy_action",
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.5,
					sub_action = "action_throw",
				},
			},
		},
		dummy_action = {
			kind = "dummy",
			total_time = 0,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
		},
		action_throw = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			kind = "throw_grimoire",
			total_time = 0.7,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_grimoire_01/wpn_grimoire_01"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_first_aid"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.gui_texture = "icons_placeholder_melee_01"
weapon_template.is_grimoire = true
weapon_template.max_fatigue_points = 1
weapon_template.dodge_count = 3
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1.2,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1.2,
	},
}
weapon_template.attack_meta_data = {
	tap_attack = {
		arc = 0,
		max_range = math.huge,
	},
	hold_attack = {
		arc = 0,
		max_range = math.huge,
		attack_chain = {
			start_action_name = "action_one",
			start_sub_action_name = "default",
			transitions = {
				action_one = {
					default = {
						bot_wait_input = "hold_attack",
						bot_wanted_input = "hold_attack",
						wanted_action_name = "action_one",
						wanted_sub_action_name = "action_throw",
					},
				},
			},
		},
	},
}

WeaponUtils.add_bot_meta_data_chain_actions(weapon_template.actions, weapon_template.attack_meta_data.hold_attack.attack_chain.transitions)

local wpn_side_objective_tome_01 = table.clone(weapon_template)

wpn_side_objective_tome_01.left_hand_unit = "units/weapons/player/wpn_side_objective_tome/wpn_side_objective_tome_01"
wpn_side_objective_tome_01.actions = {
	action_one = {
		default = {
			kind = "dummy",
			total_time = 0,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
		},
	},
	action_two = {
		default = {
			kind = "dummy",
			total_time = 0,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
		},
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
}
wpn_side_objective_tome_01.pickup_data = {
	pickup_name = "tome",
}

local wpn_grimoire_01 = table.clone(weapon_template)
local wpn_tome_01 = table.clone(wpn_side_objective_tome_01)
local inspect_table = table.clone(ActionTemplates.action_inspect)

inspect_table.action_inspect_hold.anim_event = "inspect_start_2"
wpn_grimoire_01.actions.action_inspect = inspect_table
wpn_tome_01.actions.action_inspect = inspect_table

local geheimnisnacht_2021_side_objective = table.clone(weapon_template)

geheimnisnacht_2021_side_objective.is_grimoire = false
geheimnisnacht_2021_side_objective.is_not_droppable = true
geheimnisnacht_2021_side_objective.left_hand_unit = "units/weapons/player/pup_ritual_site_01/wpn_ritual_site_01"
geheimnisnacht_2021_side_objective.actions = {
	action_one = {
		default = {
			kind = "melee_start",
			weapon_action_hand = "left",
			total_time = math.huge,
			allowed_chain_actions = {
				{
					action = "action_one",
					end_time = 0.4,
					input = "action_one_release",
					start_time = 0,
					sub_action = "dummy_action",
				},
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.5,
					sub_action = "action_throw",
				},
			},
		},
		dummy_action = {
			kind = "dummy",
			total_time = 0,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
		},
		action_throw = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_throw",
			kind = "throw_geheimnisnacht_2021",
			total_time = 1.6,
			weapon_action_hand = "left",
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
			end,
			allowed_chain_actions = {},
		},
	},
	action_two = {
		default = {
			anim_end_event = "inspect_end",
			anim_event = "inspect_start",
			can_abort_reload = false,
			cooldown = 0.15,
			hold_input = "action_two_hold",
			kind = "inspect_geheimnisnacht_2021",
			minimum_hold_time = 0.3,
			weapon_action_hand = "either",
			condition_func = function (action_user, input_extension)
				return Managers.input:is_device_active("gamepad")
			end,
			anim_end_event_condition_func = function (unit, end_reason)
				return end_reason ~= "new_interupting_action"
			end,
			total_time = math.huge,
			allowed_chain_actions = {},
			weapon_sway_settings = {
				camera_look_sensitivity = 1,
				lerp_speed = 10,
				look_sensitivity = 1.5,
				recentering_lerp_speed = 0,
				sway_range = 1,
			},
		},
	},
	action_inspect = table.clone(ActionTemplates.action_inspect),
	action_wield = ActionTemplates.wield_left,
}
geheimnisnacht_2021_side_objective.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
geheimnisnacht_2021_side_objective.wield_anim = "to_ritual_skull"
geheimnisnacht_2021_side_objective.wield_anim_3p = "to_ritual_skull"
geheimnisnacht_2021_side_objective.state_machine = "units/beings/player/first_person_base/state_machines/misc/ritual_skull"
geheimnisnacht_2021_side_objective.load_state_machine = false
geheimnisnacht_2021_side_objective.wield_anim_career = {
	bw_necromancer = "to_ritual_skull_immune",
	dr_slayer = "to_ritual_skull_immune",
	es_questingknight = "to_ritual_skull_immune",
	we_thornsister = "to_ritual_skull_immune",
	wh_priest = "to_ritual_skull_immune",
}
geheimnisnacht_2021_side_objective.wield_anim_career_3p = {
	bw_necromancer = "to_ritual_skull",
	dr_slayer = "to_ritual_skull",
	es_questingknight = "to_ritual_skull",
	we_thornsister = "to_ritual_skull",
	wh_priest = "to_ritual_skull",
}
geheimnisnacht_2021_side_objective.actions.action_inspect.action_inspect_hold.kind = "inspect_geheimnisnacht_2021"

return {
	wpn_grimoire_01 = table.clone(wpn_grimoire_01),
	wpn_side_objective_tome_01 = table.clone(wpn_tome_01),
	wpn_geheimnisnacht_2021_side_objective = table.clone(geheimnisnacht_2021_side_objective),
}
