local weapon_template = weapon_template or {}
weapon_template.actions = {
	action_one = {
		default = {
			damage_window_end = 0.2,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "healing_draught",
			damage_window_start = 0.05,
			weapon_action_hand = "left",
			block_pickup = true,
			dialogue_event = "on_healing_draught",
			anim_event = "attack_heal",
			total_time = 1.2,
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
			end
		}
	},
	action_two = {
		default = ActionTemplates.give_item_on_defend
	},
	action_instant_drink_healing_draught = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 0,
			allowed_chain_actions = {}
		},
		instant_drink = {
			damage_window_end = 0.2,
			ammo_usage = 1,
			anim_end_event = "attack_finished",
			kind = "healing_draught",
			damage_window_start = 0.05,
			weapon_action_hand = "left",
			block_pickup = true,
			uninterruptible = true,
			dialogue_event = "on_healing_draught",
			anim_event = "attack_heal",
			auto_validate_on_gamepad = true,
			total_time = 1.2,
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
			end
		}
	},
	action_instant_give_item = ActionTemplates.instant_give_item,
	action_inspect = ActionTemplates.action_inspect_left,
	action_wield = ActionTemplates.wield_left,
	action_career_skill = ActionTemplates.career_skill_dummy,
	action_instant_grenade_throw = ActionTemplates.instant_equip_grenade,
	action_instant_heal_other = ActionTemplates.instant_equip_and_heal_other,
	action_instant_drink_potion = ActionTemplates.instant_equip_and_drink_potion,
	action_instant_equip_tome = ActionTemplates.instant_equip_tome,
	action_instant_equip_grimoire = ActionTemplates.instant_equip_grimoire,
	action_instant_equip_grenade = ActionTemplates.instant_equip_grenade_only,
	action_instant_equip_healing_draught = ActionTemplates.instant_equip_and_drink_healing_draught,
	action_instant_heal_self = {
		default = {
			kind = "dummy",
			weapon_action_hand = "left",
			total_time = 1,
			allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0.5,
					action = "action_one",
					auto_chain = true
				}
			}
		}
	}
}
weapon_template.ammo_data = {
	ammo_hand = "left",
	destroy_when_out_of_ammo = true,
	max_ammo = 1,
	ammo_per_clip = 1,
	reload_time = 0
}
weapon_template.pickup_data = {
	pickup_name = "healing_draught"
}
weapon_template.left_hand_unit = "units/weapons/player/wpn_potion/wpn_potion"
weapon_template.left_hand_attachment_node_linking = AttachmentNodeLinking.potion
weapon_template.wield_anim = "to_potion"
weapon_template.gui_texture = "hud_consumable_icon_potion"
weapon_template.max_fatigue_points = 1
weapon_template.can_heal_self = true
weapon_template.fast_heal = true
weapon_template.can_give_other = true
weapon_template.bot_heal_threshold = 0.5
weapon_template.buffs = {
	change_dodge_distance = {
		external_optional_multiplier = 1
	},
	change_dodge_speed = {
		external_optional_multiplier = 1
	}
}

return {
	healing_draught = table.clone(weapon_template)
}
