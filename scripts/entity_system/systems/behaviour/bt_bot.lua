-- chunkname: @scripts/entity_system/systems/behaviour/bt_bot.lua

BotBehaviors = BotBehaviors or {}

local ACTIONS_DEFAULT = BotActions.default

BotBehaviors.default = {
	"BTSelector",
	{
		"BTNilAction",
		condition = "is_disabled",
		name = "disabled",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_melee",
			condition_args = {
				"slot_melee",
			},
			action_data = ACTIONS_DEFAULT.switch_melee,
		},
		{
			"BTBotInteractAction",
			name = "do_revive",
			action_data = ACTIONS_DEFAULT.revive,
		},
		condition = "can_revive",
		name = "revive",
	},
	{
		"BTNilAction",
		condition = "is_transported",
		name = "transported_idle",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_melee",
			condition_args = {
				"slot_melee",
			},
			action_data = ACTIONS_DEFAULT.switch_melee,
		},
		{
			"BTBotInteractAction",
			name = "do_rescue_hanging_from_hook",
			action_data = ACTIONS_DEFAULT.rescue_hanging_from_hook,
		},
		condition = "can_rescue_hanging_from_hook",
		name = "rescue_hanging_from_hook",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_melee",
			condition_args = {
				"slot_melee",
			},
			action_data = ACTIONS_DEFAULT.switch_melee,
		},
		{
			"BTBotInteractAction",
			name = "do_rescue_leadge_hanging",
			action_data = ACTIONS_DEFAULT.rescue_ledge_hanging,
		},
		condition = "can_rescue_ledge_hanging",
		name = "rescue_leadge_hanging",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_healing_kit",
			condition_args = {
				"slot_healthkit",
			},
			action_data = ACTIONS_DEFAULT.switch_heal,
		},
		{
			"BTBotInteractAction",
			name = "use_other_heal",
			action_data = ACTIONS_DEFAULT.use_heal_on_player,
		},
		condition = "can_heal_player",
		name = "heal_other",
	},
	{
		"BTSelector",
		condition_args = {
			"can_accept_heal_item",
		},
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_healing_draught",
			condition_args = {
				"slot_healthkit",
			},
			action_data = ACTIONS_DEFAULT.switch_heal,
		},
		{
			"BTBotInteractAction",
			name = "do_give_heal_item",
			action_data = ACTIONS_DEFAULT.do_give_heal_item,
		},
		condition = "can_help_in_need_player",
		name = "give_heal_item",
	},
	{
		"BTSelector",
		condition_args = {
			"can_accept_grenade",
		},
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_grenade",
			condition_args = {
				"slot_grenade",
			},
			action_data = ACTIONS_DEFAULT.switch_grenade,
		},
		{
			"BTBotInteractAction",
			name = "do_give_grenade",
			action_data = ACTIONS_DEFAULT.do_give_grenade,
		},
		condition = "can_help_in_need_player",
		name = "give_grenade",
	},
	{
		"BTSelector",
		condition_args = {
			"can_accept_potion",
		},
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_potion",
			condition_args = {
				"slot_potion",
			},
			action_data = ACTIONS_DEFAULT.switch_potion,
		},
		{
			"BTBotInteractAction",
			name = "do_give_potion",
			action_data = ACTIONS_DEFAULT.do_give_potion,
		},
		condition = "can_help_in_need_player",
		name = "give_potion",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_grimoire",
			condition_args = {
				"slot_potion",
			},
			action_data = ACTIONS_DEFAULT.switch_potion,
		},
		{
			"BTBotDropPickupAction",
			name = "do_drop_grimoire",
		},
		condition = "should_drop_grimoire",
		name = "drop_grimoire",
	},
	{
		"BTBotInteractAction",
		condition = "can_loot",
		name = "loot",
	},
	{
		"BTSelector",
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_healing_kit",
			condition_args = {
				"slot_healthkit",
			},
			action_data = ACTIONS_DEFAULT.switch_heal,
		},
		{
			"BTBotHealAction",
			name = "use_heal",
		},
		condition = "bot_should_heal",
		name = "heal_self",
	},
	{
		"BTSelector",
		condition_args = {
			"activate_ability",
		},
		{
			"BTBotInventorySwitchAction",
			condition = "is_slot_not_wielded",
			name = "switch_melee",
			condition_args = {
				"slot_melee",
				"slot_career_skill_weapon",
			},
			action_data = ACTIONS_DEFAULT.switch_melee,
		},
		{
			"BTBotActivateAbilityAction",
			name = "use_ability",
			action_data = ACTIONS_DEFAULT.use_ability,
		},
		condition = "can_activate_ability",
		name = "activate_normal_ability",
	},
	{
		"BTSelector",
		condition_args = {
			"shoot_ability",
		},
		{
			"BTBotShootAction",
			name = "shoot_ability",
			action_data = ACTIONS_DEFAULT.shoot_ability,
		},
		condition = "can_activate_ability",
		name = "activate_ranged_shot_ability",
	},
	{
		"BTSelector",
		{
			"BTSelector",
			condition_args = {
				"ranged_weapon",
			},
			{
				"BTBotActivateAbilityAction",
				condition = "is_slot_not_wielded",
				name = "switch_ability_priority_target",
				condition_args = {
					"slot_career_skill_weapon",
				},
				action_data = ACTIONS_DEFAULT.use_ability,
			},
			{
				"BTBotShootAction",
				name = "ability_shoot_priority_target",
				action_data = ACTIONS_DEFAULT.shoot,
			},
			condition = "can_activate_ability",
			name = "ability_weapon",
		},
		{
			"BTSelector",
			{
				"BTBotInventorySwitchAction",
				condition = "is_slot_not_wielded",
				name = "switch_melee_priority_target",
				condition_args = {
					"slot_melee",
				},
				action_data = ACTIONS_DEFAULT.switch_melee,
			},
			{
				"BTBotMeleeAction",
				name = "fight_melee_priority_target",
				action_data = ACTIONS_DEFAULT.fight_melee_priority_target,
			},
			condition = "bot_in_melee_range",
			name = "melee_priority_target",
		},
		{
			"BTSelector",
			condition_args = {
				ammo_percentage = 0,
				overcharge_limit = 0.9,
				overcharge_limit_type = "maximum",
			},
			{
				"BTBotInventorySwitchAction",
				condition = "is_slot_not_wielded",
				name = "switch_ranged_priority_target",
				condition_args = {
					"slot_ranged",
				},
				action_data = ACTIONS_DEFAULT.switch_ranged,
			},
			{
				"BTBotShootAction",
				name = "shoot_priority_target",
				action_data = ACTIONS_DEFAULT.shoot,
			},
			condition = "has_target_and_ammo_greater_than",
			name = "ranged_priority_target",
		},
		condition = "has_priority_or_opportunity_target",
		name = "attack_priority_target",
	},
	{
		"BTBotTeleportToAllyAction",
		condition = "should_teleport",
		name = "teleport_out_of_range",
	},
	{
		"BTUtilityNode",
		{
			"BTSelector",
			action_data = ACTIONS_DEFAULT.combat,
			{
				"BTSelector",
				condition_args = {
					"ranged_weapon",
				},
				{
					"BTBotActivateAbilityAction",
					condition = "is_slot_not_wielded",
					name = "switch_ability",
					condition_args = {
						"slot_career_skill_weapon",
					},
					action_data = ACTIONS_DEFAULT.use_ability,
				},
				{
					"BTBotShootAction",
					name = "ability_shoot",
					action_data = ACTIONS_DEFAULT.shoot,
				},
				condition = "can_activate_ability",
				name = "ability_weapon",
			},
			{
				"BTSelector",
				{
					"BTSelector",
					condition_args = {
						"slot_melee",
						"slot_ranged",
					},
					{
						"BTBotInventorySwitchAction",
						condition = "has_better_alt_weapon",
						name = "switch_alt_melee",
						condition_args = {
							"slot_melee",
							"slot_ranged",
						},
						action_data = ACTIONS_DEFAULT.switch_ranged,
					},
					{
						"BTBotInventorySwitchAction",
						condition = "is_slot_not_wielded",
						name = "switch_melee",
						condition_args = {
							"slot_melee",
						},
						action_data = ACTIONS_DEFAULT.switch_melee,
					},
					condition = "needs_weapon_swap",
					name = "pick_weapon_slot",
				},
				{
					"BTBotMeleeAction",
					name = "fight_melee",
					action_data = ACTIONS_DEFAULT.fight_melee,
				},
				condition = "bot_in_melee_range",
				name = "melee",
			},
			{
				"BTSelector",
				condition_args = {
					ammo_percentage = 0.5,
					overcharge_limit = 0.9,
					overcharge_limit_type = "threshold",
				},
				{
					"BTBotInventorySwitchAction",
					condition = "is_slot_not_wielded",
					name = "switch_ranged",
					condition_args = {
						"slot_ranged",
					},
					action_data = ACTIONS_DEFAULT.switch_ranged,
				},
				{
					"BTBotShootAction",
					name = "shoot",
					action_data = ACTIONS_DEFAULT.shoot,
				},
				condition = "has_target_and_ammo_greater_than",
				name = "ranged",
			},
			name = "combat",
		},
		{
			"BTSelector",
			action_data = ACTIONS_DEFAULT.follow,
			{
				"BTBotInteractAction",
				condition = "can_open_door",
				name = "open_door",
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					condition = "is_slot_not_wielded",
					name = "switch_melee_breakable",
					condition_args = {
						"slot_melee",
					},
					action_data = ACTIONS_DEFAULT.switch_melee,
				},
				{
					"BTBotMeleeAction",
					name = "destroying_object",
					action_data = ACTIONS_DEFAULT.destroy_object_melee,
				},
				condition = "bot_at_breakable",
				name = "melee_break_object",
			},
			{
				"BTBotTeleportToAllyAction",
				condition = "cant_reach_ally",
				name = "teleport_no_path",
			},
			{
				"BTSelector",
				{
					"BTBotInventorySwitchAction",
					condition = "is_wanted_slot_not_wielded",
					name = "switch_reload",
					condition_args = {
						"wanted_slot_to_reload",
						"slot_ranged",
					},
					action_data = ACTIONS_DEFAULT.switch_reload_slot,
				},
				{
					"BTBotActivateAbilityAction",
					condition = "is_wanted_slot_not_wielded",
					name = "switch_ability",
					condition_args = {
						"wanted_slot_to_reload",
						"slot_career_skill_weapon",
					},
					action_data = ACTIONS_DEFAULT.use_ability,
				},
				{
					"BTBotReloadAction",
					name = "reload",
				},
				condition = "wants_to_reload_weapon",
				name = "reload_weapon",
			},
			{
				"BTSelector",
				condition_args = {
					overcharge_limit_type = "threshold",
					start_max_percentage = 0.99,
					start_min_percentage = 0.5,
					stop_percentage = 0.1,
				},
				{
					"BTBotInventorySwitchAction",
					condition = "is_slot_not_wielded",
					name = "switch_ranged_vent",
					condition_args = {
						"slot_ranged",
					},
					action_data = ACTIONS_DEFAULT.switch_ranged,
				},
				{
					"BTBotReloadAction",
					name = "vent",
				},
				condition = "should_vent_overcharge",
				name = "vent_overcharge",
			},
			{
				"BTBotFollowAction",
				name = "successful_follow",
				action_data = ACTIONS_DEFAULT.successful_follow,
			},
			name = "follow",
		},
		name = "in_combat",
	},
	{
		"BTNilAction",
		name = "idle",
	},
	name = "default",
}
BotBehaviors.dead = {
	"BTNilAction",
	name = "dead",
}
