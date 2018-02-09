BotBehaviors = {
	default = {
		"BTSelector",
		{
			"BTNilAction",
			condition = "is_disabled",
			name = "disabled"
		},
		{
			"BTSelector",
			{
				"BTBotTransportedIdleAction",
				name = "transported_idle"
			},
			condition = "is_transported",
			name = "transported"
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
				action_data = BotActions.default.switch_melee
			},
			{
				"BTBotInteractAction",
				name = "do_revive",
				action_data = BotActions.default.revive
			},
			condition = "can_revive",
			name = "revive"
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
				action_data = BotActions.default.switch_melee
			},
			{
				"BTBotInteractAction",
				name = "do_rescue_hanging_from_hook",
				action_data = BotActions.default.rescue_hanging_from_hook
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
				action_data = BotActions.default.switch_melee
			},
			{
				"BTBotInteractAction",
				name = "do_rescue_leadge_hanging",
				action_data = BotActions.default.rescue_ledge_hanging
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
				action_data = BotActions.default.switch_heal
			},
			{
				"BTBotInteractAction",
				name = "use_other_heal",
				action_data = BotActions.default.use_heal_on_player
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
				action_data = BotActions.default.switch_heal
			},
			{
				"BTBotInteractAction",
				name = "do_give_heal_item",
				action_data = BotActions.default.do_give_heal_item
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
				action_data = BotActions.default.switch_grenade
			},
			{
				"BTBotInteractAction",
				name = "do_give_grenade",
				action_data = BotActions.default.do_give_grenade
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
				action_data = BotActions.default.switch_potion
			},
			{
				"BTBotInteractAction",
				name = "do_give_potion",
				action_data = BotActions.default.do_give_potion
			},
			name = "give_potion",
			condition = "can_help_in_need_player",
			condition_args = {
				"can_accept_potion"
			}
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
				action_data = BotActions.default.switch_heal
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
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					name = "switch_melee_priority_target",
					condition = "is_slot_not_wielded",
					condition_args = {
						"slot_melee"
					},
					action_data = BotActions.default.switch_melee
				},
				{
					"BTBotMeleeAction",
					name = "fight_melee_priority_target",
					action_data = BotActions.default.fight_melee_priority_target
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
					action_data = BotActions.default.switch_ranged
				},
				{
					"BTBotShootAction",
					name = "shoot_priority_target",
					action_data = BotActions.default.shoot
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
			"BTUtilityNode",
			{
				"BTSelector",
				{
					"BTSelector",
					{
						"BTBotInventorySwitchAction",
						name = "switch_melee",
						condition = "is_slot_not_wielded",
						condition_args = {
							"slot_melee"
						},
						action_data = BotActions.default.switch_melee
					},
					{
						"BTBotMeleeAction",
						name = "fight_melee",
						action_data = BotActions.default.fight_melee
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
						action_data = BotActions.default.switch_ranged
					},
					{
						"BTBotShootAction",
						name = "shoot",
						action_data = BotActions.default.shoot
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
				action_data = BotActions.default.combat
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
						action_data = BotActions.default.switch_melee
					},
					{
						"BTBotMeleeAction",
						name = "destroying_object",
						action_data = BotActions.default.destroy_object_melee
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
					"BTBotFollowAction",
					name = "successful_follow",
					action_data = BotActions.default.successful_follow
				},
				name = "follow",
				action_data = BotActions.default.follow
			},
			condition = "can_see_ally",
			name = "in_combat"
		},
		{
			"BTBotTeleportToAllyAction",
			condition = "can_teleport",
			name = "teleport_out_of_range"
		},
		{
			"BTNilAction",
			name = "idle"
		},
		name = "default"
	},
	dead = {
		"BTNilAction",
		name = "dead"
	}
}

return 
