require("scripts/unit_extensions/human/ai_player_unit/ai_utils")

PlayerBots = PlayerBots or {}
BotActions = BotActions or {}
BotConstants = BotConstants or {}
BotActions.default = {
	follow = {
		action_weight = 1
	},
	successful_follow = {
		action_weight = 1
	},
	goto_transport = {
		name = "goto_transport",
		move_anim = "move_start_fwd",
		goal_selection = "new_goal_in_transport",
		action_weight = 1,
		considerations = UtilityConsiderations.follow
	},
	shoot = {
		evaluation_duration = 2,
		maximum_obstruction_reevaluation_time = 0.3,
		evaluation_duration_without_firing = 3,
		minimum_obstruction_reevaluation_time = 0.2,
		action_weight = 1
	},
	shoot_ability = {
		abort_input = "defend",
		evaluation_duration = 2,
		charge_input = "activate_ability",
		action_weight = 1,
		slot_name = "slot_career_skill_weapon",
		maximum_obstruction_reevaluation_time = 0.3,
		evaluation_duration_without_firing = 4,
		fire_input = "none",
		minimum_obstruction_reevaluation_time = 0.2
	},
	switch_melee = {
		wanted_slot = "slot_melee",
		action_weight = 1
	},
	switch_ranged = {
		wanted_slot = "slot_ranged",
		action_weight = 1
	},
	switch_heal = {
		wanted_slot = "slot_healthkit",
		action_weight = 1
	},
	switch_potion = {
		wanted_slot = "slot_potion"
	},
	switch_grenade = {
		wanted_slot = "slot_grenade"
	},
	fight_melee_priority_target = {
		engage_range = math.huge,
		engage_range_near_follow_pos = math.huge,
		override_engage_range_to_follow_pos = math.huge,
		override_engage_range_to_follow_pos_horde = math.huge
	},
	fight_melee = {
		override_engage_range_to_follow_pos_horde = 6,
		override_engage_range_to_follow_pos = 12,
		engage_range_near_follow_pos = 10,
		engage_range = 6
	},
	destroy_object_melee = {
		destroy_object = true,
		do_not_update_engage_position = true,
		engage_range = math.huge,
		engage_range_near_follow_pos = math.huge,
		override_engage_range_to_follow_pos = math.huge,
		override_engage_range_to_follow_pos_horde = math.huge
	},
	combat = {
		action_weight = 1
	},
	revive = {
		aim_node = "j_head",
		use_block_interaction = true
	},
	use_heal_on_player = {
		aim_node = "j_head",
		input = "charge_shot"
	},
	do_give_grenade = {
		aim_node = "j_head"
	},
	do_give_potion = {
		aim_node = "j_head"
	},
	do_give_heal_item = {
		aim_node = "j_head"
	},
	rescue_hanging_from_hook = {
		aim_node = "j_hips",
		use_block_interaction = true
	},
	rescue_ledge_hanging = {
		aim_node = "j_head",
		use_block_interaction = true
	},
	use_ability = {
		dr_ironbreaker = {
			activation = {},
			wait_action = {
				input = "defend"
			},
			end_condition = {
				buffs = {
					"bardin_ironbreaker_activated_ability",
					"bardin_ironbreaker_activated_ability_duration"
				}
			}
		},
		dr_slayer = {
			activation = {
				action = "aim_at_target"
			}
		},
		dr_ranger = {
			activation = {
				wait_on_career_weapon_done = true
			}
		},
		es_mercenary = {
			activation = {}
		},
		es_huntsman = {
			activation = {},
			end_condition = {
				done_when_arriving_at_destination = true,
				buffs = {
					"markus_huntsman_activated_ability"
				}
			}
		},
		es_knight = {
			activation = {
				action = "aim_at_target"
			}
		},
		we_waywatcher = {},
		we_maidenguard = {
			activation = {
				action = "aim_at_target"
			}
		},
		wh_captain = {
			activation = {}
		},
		wh_bountyhunter = {},
		wh_zealot = {
			activation = {
				action = "aim_at_target"
			}
		},
		we_shade = {
			activation = {},
			end_condition = {
				done_when_arriving_at_destination = true,
				buffs = {
					"kerillian_shade_activated_ability",
					"kerillian_shade_activated_ability_duration"
				}
			}
		},
		bw_adept = {
			activation = {
				action = "aim_at_target",
				min_hold_time = 0.2
			}
		},
		bw_scholar = {},
		bw_unchained = {
			activation = {}
		}
	}
}

for category_name, category_table in pairs(BotActions) do
	for action_name, action_table in pairs(category_table) do
		action_table.name = action_name
		action_table.considerations = UtilityConsiderations["player_bot_" .. category_name .. "_" .. action_name] or nil
	end
end

PlayerBots.default = {
	walk_speed = 1.9,
	radius = 1,
	behavior = "default",
	run_speed = 4,
	perception = "regular",
	blackboard_allocation_size = 128
}
BotConstants.default = {
	Z_MOVE_TO_EPSILON = 0.3,
	FLAT_MOVE_TO_PREVIOUS_POS_EPSILON = 0.25,
	FLAT_MOVE_TO_EPSILON = 0.05
}
local PerceptionTypes = {
	regular = true,
	no_seeing = true,
	all_seeing = true
}
local TargetSelectionTypes = {
	pick_pounce_down_target = true,
	pick_closest_target = true
}

for name, bot in pairs(PlayerBots) do
	bot.name = name

	if bot.perception and not PerceptionTypes[bot.perception] then
		error("Bad perception type '" .. bot.perception .. "' specified in bot .. '" .. bot.name .. "'.")
	end

	if bot.target_selection and not TargetSelectionTypes[bot.target_selection] then
		error("Bad 'target_selection' type '" .. bot.target_selection .. "' specified in bot .. '" .. bot.name .. "'.")
	end
end

return 
