-- chunkname: @scripts/settings/player_bots_settings.lua

require("scripts/unit_extensions/human/ai_player_unit/ai_utils")

PlayerBots = PlayerBots or {}
BotActions = BotActions or {}
BotConstants = BotConstants or {}
BotActions.default = {
	follow = {
		action_weight = 1,
	},
	successful_follow = {
		action_weight = 1,
	},
	goto_transport = {
		action_weight = 1,
		goal_selection = "new_goal_in_transport",
		move_anim = "move_start_fwd",
		name = "goto_transport",
		considerations = UtilityConsiderations.follow,
	},
	shoot = {
		action_weight = 1,
		evaluation_duration = 2,
		evaluation_duration_without_firing = 3,
		maximum_obstruction_reevaluation_time = 0.3,
		minimum_obstruction_reevaluation_time = 0.2,
	},
	shoot_ability = {
		abort_input = "defend",
		action_weight = 1,
		charge_input = "activate_ability",
		evaluation_duration = 2,
		evaluation_duration_without_firing = 4,
		fire_input = "none",
		maximum_obstruction_reevaluation_time = 0.3,
		minimum_obstruction_reevaluation_time = 0.2,
		slot_name = "slot_career_skill_weapon",
	},
	switch_melee = {
		action_weight = 1,
		wanted_slot = "slot_melee",
	},
	switch_ranged = {
		action_weight = 1,
		wanted_slot = "slot_ranged",
	},
	switch_heal = {
		action_weight = 1,
		wanted_slot = "slot_healthkit",
	},
	switch_potion = {
		wanted_slot = "slot_potion",
	},
	switch_grenade = {
		wanted_slot = "slot_grenade",
	},
	switch_reload_slot = {
		wanted_slot_key = "wanted_slot_to_reload",
	},
	fight_melee_priority_target = {
		engage_range = math.huge,
		engage_range_threat = math.huge,
		engage_range_near_follow_pos = math.huge,
		engage_range_near_follow_pos_threat = math.huge,
		override_engage_range_to_follow_pos = math.huge,
		override_engage_range_to_follow_pos_threat = math.huge,
	},
	fight_melee = {
		engage_range = 6,
		engage_range_near_follow_pos = 10,
		engage_range_near_follow_pos_threat = 3,
		engage_range_threat = 2,
		override_engage_range_to_follow_pos = 10,
		override_engage_range_to_follow_pos_threat = 3,
	},
	destroy_object_melee = {
		destroy_object = true,
		do_not_update_engage_position = true,
		engage_range = math.huge,
		engage_range_threat = math.huge,
		engage_range_near_follow_pos = math.huge,
		engage_range_near_follow_pos_threat = math.huge,
		override_engage_range_to_follow_pos = math.huge,
		override_engage_range_to_follow_pos_threat = math.huge,
	},
	combat = {
		action_weight = 1,
	},
	revive = {
		aim_node = "j_head",
		use_block_interaction = true,
	},
	use_heal_on_player = {
		aim_node = "j_head",
		input = "charge_shot",
	},
	do_give_grenade = {
		aim_node = "j_head",
		input = "defend",
	},
	do_give_potion = {
		aim_node = "j_head",
		input = "defend",
	},
	do_give_heal_item = {
		aim_node = "j_head",
		input = "defend",
	},
	rescue_hanging_from_hook = {
		aim_node = "j_hips",
		use_block_interaction = true,
	},
	rescue_ledge_hanging = {
		aim_node = "j_head",
		use_block_interaction = true,
	},
	use_ability = {
		dr_ironbreaker = {
			activation = {},
			wait_action = {
				input = "defend",
			},
			end_condition = {
				buffs = {
					"bardin_ironbreaker_activated_ability",
					"bardin_ironbreaker_activated_ability_duration",
				},
			},
		},
		dr_slayer = {
			activation = {
				action = "aim_at_target",
			},
		},
		dr_ranger = {
			activation = {},
			end_condition = {
				is_slot_not_wielded = {
					"slot_career_skill_weapon",
				},
			},
		},
		dr_engineer = {
			activation = {},
			end_condition = {},
		},
		es_mercenary = {
			activation = {},
		},
		es_huntsman = {
			activation = {},
			end_condition = {
				done_when_arriving_at_destination = true,
				buffs = {
					"markus_huntsman_activated_ability",
				},
			},
		},
		es_knight = {
			activation = {
				action = "aim_at_target",
			},
		},
		es_questingknight = {
			activation = {
				action = "aim_at_target",
				dynamic_target_unit = true,
				max_distance_sq = 20,
				move_to_target_unit = true,
			},
			end_condition = {
				is_slot_not_wielded = {
					"slot_career_skill_weapon",
				},
			},
		},
		we_waywatcher = {},
		we_maidenguard = {
			activation = {
				action = "aim_at_target",
			},
		},
		we_thornsister = {
			activation = {
				action = "aim_at_target",
				fast_aim = true,
			},
		},
		wh_captain = {
			activation = {},
		},
		wh_bountyhunter = {},
		wh_zealot = {
			activation = {
				action = "aim_at_target",
			},
		},
		wh_priest = {
			activation = {
				action = "aim_at_target",
				min_hold_time = 0.2,
			},
			end_condition = {
				is_slot_not_wielded = {
					"slot_career_skill_weapon",
				},
			},
		},
		we_shade = {
			activation = {},
			end_condition = {
				done_when_arriving_at_destination = true,
				buffs = {
					"kerillian_shade_activated_ability",
					"kerillian_shade_activated_ability_duration",
				},
			},
		},
		bw_adept = {
			activation = {
				action = "aim_at_target",
				min_hold_time = 0.2,
			},
		},
		bw_scholar = {},
		bw_unchained = {
			activation = {},
		},
		bw_necromancer = {
			activation = {},
		},
	},
}

for category_name, category_table in pairs(BotActions) do
	for action_name, action_table in pairs(category_table) do
		action_table.name = action_name
		action_table.considerations = UtilityConsiderations["player_bot_" .. category_name .. "_" .. action_name] or nil
	end
end

PlayerBots.default = {
	behavior = "default",
}
BotConstants.default = {
	FLAT_MOVE_TO_EPSILON = 0.05,
	FLAT_MOVE_TO_PREVIOUS_POS_EPSILON = 0.25,
	Z_MOVE_TO_EPSILON = 0.3,
	DEFAULT_BOT_THREAT_DIFFICULTY_DATA = {
		normal = {
			max_start_delay = 0.35,
		},
		hard = {
			max_start_delay = 0,
		},
		harder = {
			max_start_delay = 0,
		},
		hardest = {
			max_start_delay = 0,
		},
		cataclysm = {
			max_start_delay = 0,
		},
		cataclysm_2 = {
			max_start_delay = 0,
		},
		cataclysm_3 = {
			max_start_delay = 0,
		},
		versus_base = {
			max_start_delay = 0,
		},
	},
	OPPORTUNITY_TARGET_REACTION_TIMES = {
		normal = {
			max = 20,
			min = 10,
		},
		hard = {
			max = 0.65,
			min = 0.2,
		},
		harder = {
			max = 0.65,
			min = 0.2,
		},
		hardest = {
			max = 0.65,
			min = 0.2,
		},
		cataclysm = {
			max = 0.65,
			min = 0.2,
		},
		cataclysm_2 = {
			max = 0.65,
			min = 0.2,
		},
		cataclysm_3 = {
			max = 0.65,
			min = 0.2,
		},
		versus_base = {
			max = 0.65,
			min = 0.2,
		},
	},
}
