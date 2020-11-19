local push_radius = 2
local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_end = 0.35,
			anim_event = "interaction_bandage_self",
			ammo_usage = 1,
			kind = "self_interaction",
			interaction_type = "heal",
			damage_window_start = 0.1,
			weapon_action_hand = "left",
			uninterruptible = true,
			hold_input = "action_one_hold",
			interaction_priority = 4,
			total_time = InteractionDefinitions.heal.config.duration,
			allowed_chain_actions = {},
			condition_func = function (attacker_unit)
				local interactor_extension = ScriptUnit.extension(attacker_unit, "interactor_system")
				local can_interact = interactor_extension:can_interact(attacker_unit, "heal")

				return can_interact
			end
		}
	},
	action_two = {
		default = {
			damage_window_end = 0.35,
			anim_event = "interaction_bandage_team",
			ammo_usage = 1,
			kind = "interaction",
			interaction_type = "heal",
			damage_window_start = 0.1,
			weapon_action_hand = "left",
			uninterruptible = true,
			hold_input = "action_two_hold",
			interaction_priority = 5,
			total_time = InteractionDefinitions.heal.config.duration,
			allowed_chain_actions = {},
			condition_func = function (attacker_unit)
				local interactor_extension = ScriptUnit.extension(attacker_unit, "interactor_system")

				return interactor_extension and interactor_extension:can_interact(nil, "heal")
			end
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
	reload_time = 0,
	ignore_ammo_pickup = true
}
weapon_template.pickup_data = {
	pickup_name = "first_aid_kit"
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_first_aid_kit/wpn_first_aid_kit"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left
weapon_template.wield_anim = "to_first_aid"
weapon_template.gui_texture = "hud_teammate_consumable_icon_medkit"
weapon_template.can_heal_other = true
weapon_template.can_heal_self = true
weapon_template.bot_heal_threshold = 0.2
weapon_template.fast_heal = false
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
local first_aid_kit = table.clone(weapon_template)
first_aid_kit.left_hand_unit = "units/weapons/player/wpn_first_aid_kit/wpn_first_aid_kit"
first_aid_kit.gui_texture = "hud_teammate_consumable_icon_medkit"
local first_aid_kit_02 = table.clone(weapon_template)
first_aid_kit_02.left_hand_unit = "units/weapons/player/wpn_first_aid_kit_02/wpn_first_aid_kit_02"
first_aid_kit_02.gui_texture = "hud_teammate_consumable_icon_medkit"
Weapons.healthkit = weapon_template

return {
	healthkit = table.clone(weapon_template),
	first_aid_kit = first_aid_kit,
	first_aid_kit_02 = first_aid_kit_02
}
