require("scripts/settings/profiles/career_settings")

ActionTemplates = ActionTemplates or {}
ActionTemplates.wield = {
	default = {
		wield_cooldown = 0.35,
		weapon_action_hand = "either",
		kind = "wield",
		keep_buffer = true,
		uninterruptible = true,
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			return inventory_extension:can_wield()
		end,
		chain_condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			return inventory_extension:can_wield()
		end,
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_and_heal_self = {
	default = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 1,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local heal_item_equipped = equipment.slots.slot_healthkit
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()
			local has_max_health = health_extension:current_permanent_health_percent() == 1
			local can_use_heal_item = is_alive and not has_max_health

			return heal_item_equipped and can_use_heal_item
		end,
		action_on_wield = {
			action = "action_instant_heal_self",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_and_drink_potion = {
	default = {
		slot_to_wield = "slot_potion",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 1,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local potion_equipped = equipment.slots.slot_potion

			if potion_equipped and potion_equipped.item_data.name == "wpn_grimoire_01" then
				return false
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()
			local can_use_heal_item = is_alive

			return potion_equipped and can_use_heal_item
		end,
		action_on_wield = {
			action = "action_instant_drink_potion",
			sub_action = "instant_drink"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_and_heal_other = {
	default = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 1,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local heal_item_equipped = equipment.slots.slot_healthkit
			local interactor_extension = ScriptUnit.extension(action_user, "interactor_system")
			local can_heal = interactor_extension and interactor_extension:can_interact(nil, "heal")
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return heal_item_equipped and can_heal and is_alive
		end,
		action_on_wield = {
			action = "action_instant_heal_other",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_grenade = {
	default = {
		slot_to_wield = "slot_grenade",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local grenade_equipped = equipment.slots.slot_grenade
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return grenade_equipped and is_alive
		end,
		action_on_wield = {
			action = "action_instant_grenade_throw",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_grenade_only = {
	default = {
		slot_to_wield = "slot_grenade",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local grenade_equipped = equipment.slots.slot_grenade
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return grenade_equipped and is_alive
		end,
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_and_drink_healing_draught = {
	default = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local slot_healthkit_data = equipment.slots.slot_healthkit
			local has_healing_draught = false

			if slot_healthkit_data and slot_healthkit_data.item_data.name == "potion_healing_draught_01" then
				has_healing_draught = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()
			local has_max_health = health_extension:current_permanent_health_percent() == 1
			local can_use_heal_item = is_alive and not has_max_health

			return has_healing_draught and can_use_heal_item
		end,
		action_on_wield = {
			action = "action_instant_drink_healing_draught",
			sub_action = "instant_drink"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_tome = {
	default = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local wielded_slot = inventory_extension:get_wielded_slot_name()

			if wielded_slot == "slot_healthkit" then
				return
			end

			local has_tome = false
			local equipment = inventory_extension:equipment()
			local slot_healthkit_data = equipment.slots.slot_healthkit

			if slot_healthkit_data and slot_healthkit_data.item_data.name == "wpn_side_objective_tome_01" then
				has_tome = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return has_tome and is_alive
		end,
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_equip_grimoire = {
	default = {
		slot_to_wield = "slot_potion",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local wielded_slot = inventory_extension:get_wielded_slot_name()

			if wielded_slot == "slot_potion" then
				return
			end

			local has_grimoire = false
			local equipment = inventory_extension:equipment()
			local slot_potion_data = equipment.slots.slot_potion

			if slot_potion_data and slot_potion_data.item_data.name == "wpn_grimoire_01" then
				has_grimoire = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return has_grimoire and is_alive
		end,
		allowed_chain_actions = {}
	}
}
ActionTemplates.instant_grenade_throw = {
	default = {
		slot_to_wield = "slot_grenade",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")
			local equipment = inventory_extension._equipment
			local grenade_equipped = equipment.slots.slot_grenade
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return grenade_equipped and is_alive
		end,
		action_on_wield = {
			action = "action_instant_throw_grenade",
			sub_action = "instant_throw"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_inspect = {
	default = {
		weapon_action_hand = "either",
		kind = "dummy",
		total_time = 1,
		condition_func = function (action_user, input_extension)
			if Managers.input:is_device_active("gamepad") then
				if Managers.state.game_mode:level_key() == "inn_level" then
					return true
				else
					return false
				end
			else
				return true
			end
		end,
		allowed_chain_actions = {
			{
				start_time = 0,
				end_time = 0,
				input = "action_inspect_hold"
			},
			{
				sub_action = "action_inspect_hold",
				start_time = 0,
				action = "action_inspect",
				auto_chain = true
			}
		}
	},
	action_inspect_release = {
		minimum_hold_time = 0.3,
		uninterruptible = true,
		kind = "dummy",
		anim_end_event = "inspect_end",
		cooldown = 0.15,
		weapon_action_hand = "either",
		can_abort_reload = false,
		hold_input = "action_inspect_hold",
		anim_event = "flourish",
		total_time = 0,
		anim_end_event_condition_func = function (unit, end_reason)
			return end_reason ~= "new_interupting_action"
		end,
		allowed_chain_actions = {}
	},
	action_inspect_hold = {
		cooldown = 0.15,
		minimum_hold_time = 0.3,
		weapon_action_hand = "either",
		anim_end_event = "inspect_end",
		kind = "dummy",
		can_abort_reload = false,
		hold_input = "action_inspect_hold",
		anim_event = "inspect_start",
		anim_end_event_condition_func = function (unit, end_reason)
			return end_reason ~= "new_interupting_action"
		end,
		total_time = math.huge,
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_use_consumable = {
	default = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 1,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if inventory_extension:get_selected_consumable_slot_name() ~= "slot_healthkit" then
				return false
			end

			local equipment = inventory_extension._equipment
			local slot_healthkit_data = equipment.slots.slot_healthkit
			local has_health_kit = false

			if slot_healthkit_data and slot_healthkit_data.item_data.name == "healthkit_first_aid_kit_01" then
				has_health_kit = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()
			local has_max_health = health_extension:current_permanent_health_percent() == 1
			local can_use_heal_item = is_alive and not has_max_health

			return has_health_kit and can_use_heal_item
		end,
		action_on_wield = {
			action = "action_instant_heal_self",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	},
	healing_draught = {
		slot_to_wield = "slot_healthkit",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if inventory_extension:get_selected_consumable_slot_name() ~= "slot_healthkit" then
				return false
			end

			local equipment = inventory_extension._equipment
			local slot_healthkit_data = equipment.slots.slot_healthkit
			local has_healing_draught = false

			if slot_healthkit_data and slot_healthkit_data.item_data.name == "potion_healing_draught_01" then
				has_healing_draught = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()
			local has_max_health = health_extension:current_permanent_health_percent() == 1
			local can_use_heal_item = is_alive and not has_max_health

			return has_healing_draught and can_use_heal_item
		end,
		action_on_wield = {
			action = "action_instant_drink_healing_draught",
			sub_action = "instant_drink"
		},
		allowed_chain_actions = {}
	},
	potion = {
		slot_to_wield = "slot_potion",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if inventory_extension:get_selected_consumable_slot_name() ~= "slot_potion" then
				return false
			end

			local equipment = inventory_extension._equipment
			local potion_equipped = equipment.slots.slot_potion

			if potion_equipped and potion_equipped.item_data.name == "wpn_grimoire_01" then
				return false
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return potion_equipped and is_alive
		end,
		action_on_wield = {
			action = "action_instant_drink_potion",
			sub_action = "instant_drink"
		},
		allowed_chain_actions = {}
	},
	grenade = {
		slot_to_wield = "slot_grenade",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if inventory_extension:get_selected_consumable_slot_name() ~= "slot_grenade" then
				return false
			end

			local equipment = inventory_extension._equipment
			local grenade_equipped = equipment.slots.slot_grenade
			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return grenade_equipped and is_alive
		end,
		action_on_wield = {
			action = "action_instant_throw_grenade",
			sub_action = "instant_throw"
		},
		allowed_chain_actions = {}
	},
	grimoire = {
		slot_to_wield = "slot_potion",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if inventory_extension:get_selected_consumable_slot_name() ~= "slot_potion" then
				return false
			end

			local has_grimoire = false
			local equipment = inventory_extension:equipment()
			local slot_potion_data = equipment.slots.slot_potion

			if slot_potion_data and slot_potion_data.item_data.name == "wpn_grimoire_01" then
				has_grimoire = true
			end

			local health_extension = ScriptUnit.extension(action_user, "health_system")
			local status_extension = ScriptUnit.extension(action_user, "status_system")
			local is_alive = health_extension:is_alive() and not status_extension:is_disabled()

			return has_grimoire and is_alive
		end,
		action_on_wield = {
			action = "action_instant_throw_grimoire",
			sub_action = "instant_throw"
		},
		allowed_chain_actions = {}
	}
}

for sub_action_name, data in pairs(ActionTemplates.action_use_consumable) do
	data.chain_condition_func = data.condition_func
end

ActionTemplates.give_item_on_defend = {
	interaction_priority = 5,
	ammo_usage = 1,
	anim_end_event = "attack_finished",
	kind = "interaction",
	interaction_type = "give_item",
	weapon_action_hand = "left",
	uninterruptible = true,
	do_not_validate_with_hold = true,
	hold_input = "action_two_hold",
	anim_event = "parry_pose",
	total_time = 0,
	anim_end_event_condition_func = function (unit, end_reason)
		return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
	end,
	allowed_chain_actions = {},
	condition_func = function (attacker_unit)
		local interactor_extension = ScriptUnit.extension(attacker_unit, "interactor_system")

		return interactor_extension and interactor_extension:can_interact(nil, "give_item") and Application.user_setting("give_on_defend")
	end
}
ActionTemplates.instant_give_item = {
	default = {
		kind = "dummy",
		weapon_action_hand = "left",
		total_time = 0,
		allowed_chain_actions = {}
	},
	instant_give = {
		interaction_priority = 4,
		ammo_usage = 1,
		anim_end_event = "attack_finished",
		kind = "interaction",
		interaction_type = "give_item",
		weapon_action_hand = "left",
		uninterruptible = true,
		hold_input = "interact",
		anim_event = "parry_pose",
		total_time = 0,
		anim_end_event_condition_func = function (unit, end_reason)
			return end_reason ~= "new_interupting_action" and end_reason ~= "action_complete"
		end,
		allowed_chain_actions = {},
		condition_func = function (attacker_unit)
			local interactor_extension = ScriptUnit.extension(attacker_unit, "interactor_system")

			return interactor_extension and interactor_extension:can_interact(nil, "give_item")
		end
	}
}
ActionTemplates.wield_left = table.clone(ActionTemplates.wield)
ActionTemplates.wield_left.default.weapon_action_hand = "left"
ActionTemplates.action_inspect_left = table.clone(ActionTemplates.action_inspect)
ActionTemplates.action_inspect_left.default.weapon_action_hand = "left"
ActionTemplates.action_inspect_left.action_inspect_hold.weapon_action_hand = "left"
ActionTemplates.career_skill_dummy = {
	default = {
		kind = "dummy",
		weapon_action_hand = "either",
		total_time = 0,
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_career_bw_1 = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		input_override = "action_career",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_bw_1" and career_extension:can_use_activated_ability()
		end,
		action_on_wield = {
			action = "action_career",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_career_dr_3 = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		input_override = "action_career",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_dr_3" and career_extension:can_use_activated_ability()
		end,
		action_on_wield = {
			action = "action_career",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_career_wh_2 = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		input_override = "action_career",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_wh_2" and career_extension:can_use_activated_ability()
		end,
		action_on_wield = {
			action = "action_career",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
ActionTemplates.action_career_we_3 = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		input_override = "action_career",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_we_3" and career_extension:can_use_activated_ability()
		end,
		action_on_wield = {
			action = "action_career",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}

for hero_name, action_names in pairs(CareerActionNames) do
	for i = 1, #action_names, 1 do
		local action_name = action_names[i]
		local template = ActionTemplates[action_name]
		local default_data = template.default
		local condition_func = default_data.condition_func
		default_data.chain_condition_func = condition_func
	end
end

return
