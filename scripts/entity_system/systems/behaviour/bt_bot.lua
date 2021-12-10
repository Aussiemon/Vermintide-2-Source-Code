BotBehaviors = BotBehaviors or {}
local ACTIONS_DEFAULT = BotActions.default
BotBehaviors.default = {
	"BTSelector",
	{
		"BTNilAction",
		condition = "is_disabled",
		name = "disabled"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_melee",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_melee"
			},
			action_data = ACTIONS_DEFAULT.switch_melee
		},
		{
			"BTBotInteractAction",
			name = "do_revive",
			action_data = ACTIONS_DEFAULT.revive
		},
		condition = "can_revive",
		name = "revive"
	},
	{
		"BTNilAction",
		condition = "is_transported",
		name = "transported_idle"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_melee",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_melee"
			},
			action_data = ACTIONS_DEFAULT.switch_melee
		},
		{
			"BTBotInteractAction",
			name = "do_rescue_hanging_from_hook",
			action_data = ACTIONS_DEFAULT.rescue_hanging_from_hook
		},
		condition = "can_rescue_hanging_from_hook",
		name = "rescue_hanging_from_hook"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_melee",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_melee"
			},
			action_data = ACTIONS_DEFAULT.switch_melee
		},
		{
			"BTBotInteractAction",
			name = "do_rescue_leadge_hanging",
			action_data = ACTIONS_DEFAULT.rescue_ledge_hanging
		},
		condition = "can_rescue_ledge_hanging",
		name = "rescue_leadge_hanging"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_healing_kit",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_healthkit"
			},
			action_data = ACTIONS_DEFAULT.switch_heal
		},
		{
			"BTBotInteractAction",
			name = "use_other_heal",
			action_data = ACTIONS_DEFAULT.use_heal_on_player
		},
		condition = "can_heal_player",
		name = "heal_other"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_healing_draught",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_healthkit"
			},
			action_data = ACTIONS_DEFAULT.switch_heal
		},
		{
			"BTBotInteractAction",
			name = "do_give_heal_item",
			action_data = ACTIONS_DEFAULT.do_give_heal_item
		},
		name = "give_heal_item",
		condition = "can_help_in_need_player",
		condition_args = {
			"can_accept_heal_item"
		}
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_grenade",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_grenade"
			},
			action_data = ACTIONS_DEFAULT.switch_grenade
		},
		{
			"BTBotInteractAction",
			name = "do_give_grenade",
			action_data = ACTIONS_DEFAULT.do_give_grenade
		},
		name = "give_grenade",
		condition = "can_help_in_need_player",
		condition_args = {
			"can_accept_grenade"
		}
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_potion",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_potion"
			},
			action_data = ACTIONS_DEFAULT.switch_potion
		},
		{
			"BTBotInteractAction",
			name = "do_give_potion",
			action_data = ACTIONS_DEFAULT.do_give_potion
		},
		name = "give_potion",
		condition = "can_help_in_need_player",
		condition_args = {
			"can_accept_potion"
		}
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_grimoire",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_potion"
			},
			action_data = ACTIONS_DEFAULT.switch_potion
		},
		{
			"BTBotDropPickupAction",
			name = "do_drop_grimoire"
		},
		condition = "should_drop_grimoire",
		name = "drop_grimoire"
	},
	{
		"BTBotInteractAction",
		condition = "can_loot",
		name = "loot"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_healing_kit",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_healthkit"
			},
			action_data = ACTIONS_DEFAULT.switch_heal
		},
		{
			"BTBotHealAction",
			name = "use_heal"
		},
		condition = "bot_should_heal",
		name = "heal_self"
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			name = "switch_melee",
			condition = "is_slot_not_wielded",
			condition_args = {
				"slot_melee",
				"slot_career_skill_weapon"
			},
			action_data = ACTIONS_DEFAULT.switch_melee
		},
		{
			"BTBotActivateAbilityAction",
			name = "use_ability",
			action_data = ACTIONS_DEFAULT.use_ability
		},
		name = "activate_normal_ability",
		condition = "can_activate_ability",
		condition_args = {
			"activate_ability"
		}
	},
	{
		"BTSelector",
		{
			"BTBotShootAction",
			name = "shoot_ability",
			action_data = ACTIONS_DEFAULT.shoot_ability
		},
		name = "activate_ranged_shot_ability",
		condition = "can_activate_ability",
		condition_args = {
			"shoot_ability"
		}
	},
	{
		"BTSelector",
		{
			"BTSelector",
			{
				"BTBotActivateAbilityAction",
				name = "switch_ability_priority_target",
				condition = "is_slot_not_wielded",
				condition_args = {
					"slot_career_skill_weapon"
				},
				action_data = ACTIONS_DEFAULT.use_ability
			},
			{
				"BTBotShootAction",
				name = "ability_shoot_priority_target",
				action_data = ACTIONS_DEFAULT.shoot
			},
			name = "ability_weapon",
			condition = "can_activate_ability",
			condition_args = {
				"ranged_weapon"
			}
		},
		{
			"BTSelector",
			{
				"BTBotInventorySwitchAction",
				name = "switch_melee_priority_target",
				condition = "is_slot_not_wielded",
				condition_args = {
					"slot_melee"
				},
				action_data = ACTIONS_DEFAULT.switch_melee
			},
			{
				"BTBotMeleeAction",
				name = "fight_melee_priority_target",
				action_data = ACTIONS_DEFAULT.fight_melee_priority_target
			},
			condition = "bot_in_melee_range",
			name = "melee_priority_target"
		},
		{
			"BTSelector",
			{
				"BTBotInventorySwitchAction",
				name = "switch_ranged_priority_target",
				condition = "is_slot_not_wielded",
				condition_args = {
					"slot_ranged"
				},
				action_data = ACTIONS_DEFAULT.switch_ranged
			},
			{
				"BTBotShootAction",
				name = "shoot_priority_target",
				action_data = ACTIONS_DEFAULT.shoot
			},
			name = "ranged_priority_target",
			condition = "has_target_and_ammo_greater_than",
			condition_args = {
				overcharge_limit_type = "maximum",
				overcharge_limit = 0.9,
				ammo_percentage = 0
			}
		},
		condition = "has_priority_or_opportunity_target",
		name = "attack_priority_target"
	},
	{
		"BTBotTeleportToAllyAction",
		condition = "should_teleport",
		name = "teleport_out_of_range"
	},
	{
		"BTUtilityNode",
		{
			"BTSelector",
			{
				"BTSelector",
				{
					"BTBotActivateAbilityAction",
					name = "switch_ability",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_career_skill_weapon"
					},
					action_data = ACTIONS_DEFAULT.use_ability
				},
				{
					"BTBotShootAction",
					name = "ability_shoot",
					action_data = ACTIONS_DEFAULT.shoot
				},
				name = "ability_weapon",
				condition = "can_activate_ability",
				condition_args = {
					"ranged_weapon"
				}
			},
			{
				"BTSelector",
				{
					"BTSelector",
					{
						"BTBotInventorySwitchAction",
						name = "switch_alt_melee",
						condition = "has_better_alt_weapon",
						condition_args = {
							"slot_melee",
							"slot_ranged"
						},
						action_data = ACTIONS_DEFAULT.switch_ranged
					},
					{
						"BTBotInventorySwitchAction",
						name = "switch_melee",
						condition = "is_slot_not_wielded",
						condition_args = {
							"slot_melee"
						},
						action_data = ACTIONS_DEFAULT.switch_melee
					},
					name = "pick_weapon_slot",
					condition = "needs_weapon_swap",
					condition_args = {
						"slot_melee",
						"slot_ranged"
					}
				},
				{
					"BTBotMeleeAction",
					name = "fight_melee",
					action_data = ACTIONS_DEFAULT.fight_melee
				},
				condition = "bot_in_melee_range",
				name = "melee"
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_ranged",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_ranged"
					},
					action_data = ACTIONS_DEFAULT.switch_ranged
				},
				{
					"BTBotShootAction",
					name = "shoot",
					action_data = ACTIONS_DEFAULT.shoot
				},
				name = "ranged",
				condition = "has_target_and_ammo_greater_than",
				condition_args = {
					overcharge_limit_type = "threshold",
					overcharge_limit = 0.9,
					ammo_percentage = 0.5
				}
			},
			name = "combat",
			action_data = ACTIONS_DEFAULT.combat
		},
		{
			"BTSelector",
			{
				"BTBotInteractAction",
				condition = "can_open_door",
				name = "open_door"
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_melee_breakable",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_melee"
					},
					action_data = ACTIONS_DEFAULT.switch_melee
				},
				{
					"BTBotMeleeAction",
					name = "destroying_object",
					action_data = ACTIONS_DEFAULT.destroy_object_melee
				},
				condition = "bot_at_breakable",
				name = "melee_break_object"
			},
			{
				"BTBotTeleportToAllyAction",
				condition = "cant_reach_ally",
				name = "teleport_no_path"
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_ranged_reload",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_ranged"
					},
					action_data = ACTIONS_DEFAULT.switch_ranged
				},
				{
					"BTBotReloadAction",
					name = "reload"
				},
				condition = "should_reload_weapon",
				name = "reload_weapon"
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_ranged_vent",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_ranged"
					},
					action_data = ACTIONS_DEFAULT.switch_ranged
				},
				{
					"BTBotReloadAction",
					name = "vent"
				},
				name = "vent_overcharge",
				condition = "should_vent_overcharge",
				condition_args = {
					start_min_percentage = 0.5,
					start_max_percentage = 0.99,
					stop_percentage = 0.1,
					overcharge_limit_type = "threshold"
				}
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_ranged_unique_ammo_recall",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_ranged"
					},
					action_data = ACTIONS_DEFAULT.switch_ranged
				},
				{
					"BTBotReloadAction",
					name = "recall"
				},
				name = "recall_unique_ammo",
				condition = "should_recall_unique_ammo",
				condition_args = {
					ammo_percentage_threshold = 0.2
				}
			},
			{
				"BTSelector",
				{
					"BTBotActivateAbilityAction",
					name = "switch_ability_charge",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_career_skill_weapon"
					},
					action_data = ACTIONS_DEFAULT.use_ability
				},
				{
					"BTBotReloadAction",
					name = "reload_ability"
				},
				name = "reload_ability_weapon",
				condition = "should_reload_ability_weapon",
				condition_args = {
					ability_cooldown_theshold = 0
				}
			},
			{
				"BTBotFollowAction",
				name = "successful_follow",
				action_data = ACTIONS_DEFAULT.successful_follow
			},
			name = "follow",
			action_data = ACTIONS_DEFAULT.follow
		},
		name = "in_combat"
	},
	{
		"BTNilAction",
		name = "idle"
	},
	name = "default"
}
BotBehaviors.dead = {
	"BTNilAction",
	name = "dead"
}

return
