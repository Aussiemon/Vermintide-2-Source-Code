-- chunkname: @scripts/settings/equipment/weapon_templates/healing_draught.lua

local weapon_template = {}

weapon_template.actions = {
	action_one = {
		default = {
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			anim_event = "attack_heal",
			block_pickup = true,
			damage_window_end = 0.2,
			damage_window_start = 0.05,
			dialogue_event = "on_healing_draught",
			kind = "healing_draught",
			total_time = 1.2,
			weapon_action_hand = "left",
			allowed_chain_actions = {},
			condition_func = function (user_unit)
				local health_extension = ScriptUnit.extension(user_unit, "health_system")
				local status_extension = ScriptUnit.extension(user_unit, "status_system")
				local full_health = health_extension:current_permanent_health_percent() >= 1
				local is_wounded = status_extension:is_wounded()

				return is_wounded or not full_health
			end,
			chain_condition_func = function (user_unit)
				local health_extension = ScriptUnit.extension(user_unit, "health_system")
				local status_extension = ScriptUnit.extension(user_unit, "status_system")
				local full_health = health_extension:current_permanent_health_percent() >= 1
				local is_wounded = status_extension:is_wounded()

				return is_wounded or not full_health
			end,
		},
	},
	action_two = {
		default = ActionTemplates.give_item_on_defend,
	},
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_instant_heal_self = {
		default = {
			kind = "dummy",
			total_time = 1,
			weapon_action_hand = "left",
			allowed_chain_actions = {
				{
					action = "action_one",
					auto_chain = true,
					start_time = 0.5,
					sub_action = "default",
				},
			},
		},
	},
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	ammo_per_clip = 1,
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	reload_time = 0,
}
weapon_template.pickup_data = {
	pickup_name = "healing_draught",
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_potion/wpn_potion"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.potion
weapon_template.wield_anim = "to_potion"
weapon_template.state_machine = "units/beings/player/first_person_base/state_machines/common"
weapon_template.load_state_machine = false
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.max_fatigue_points = 1
weapon_template.can_heal_self = true
weapon_template.fast_heal = true
weapon_template.can_give_other = true
weapon_template.bot_heal_threshold = 0.4
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1,
	},
	change_dodge_speed = {
		external_optional_multiplier = 1,
	},
}

return {
	healing_draught = table.clone(weapon_template),
}
