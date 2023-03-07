require("scripts/managers/challenges/boon_reactivation_rules")
require("scripts/managers/challenges/pickup_spawn_type")

local dlc_settings = DLCSettings.morris

local function only_on_travel_and_signature_levels()
	local mechanism = Managers.mechanism:game_mechanism()
	local run_controller = mechanism:get_deus_run_controller()

	if not run_controller then
		return false
	end

	local current_node = run_controller:get_current_node()

	return current_node.level_type == "TRAVEL" or current_node.level_type == "SIGNATURE"
end

dlc_settings.questing_knight_challenges = {
	deus = {
		always_reset_quest_pool = true,
		possible_challenges = {
			{
				reward = "deus_markus_questing_knight_passive_power_level",
				type = "kill_elites",
				amount = {
					1,
					7,
					7,
					10,
					10,
					15,
					15,
					15
				}
			},
			{
				reward = "deus_markus_questing_knight_passive_attack_speed",
				type = "kill_specials",
				amount = {
					1,
					5,
					5,
					7,
					7,
					10,
					10,
					10
				}
			},
			{
				reward = "deus_markus_questing_knight_passive_cooldown_reduction",
				type = "kill_monsters",
				amount = {
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				}
			},
			{
				reward = "deus_markus_questing_knight_passive_damage_taken",
				type = "find_deus_soft_currency",
				amount = {
					1,
					5,
					5,
					5,
					5,
					5,
					5,
					5
				},
				condition = only_on_travel_and_signature_levels
			},
			{
				reward = "deus_markus_questing_knight_passive_health_regen",
				type = "cleanse_cursed_chest",
				amount = {
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				},
				condition = only_on_travel_and_signature_levels
			}
		},
		side_quest_challenge = {
			reward = "markus_questing_knight_passive_strength_potion",
			type = "kill_enemies",
			amount = {
				1,
				50,
				60,
				75,
				85,
				100,
				100,
				100
			}
		}
	}
}
dlc_settings.ingame_challenge_templates = {
	find_deus_soft_currency = {
		default_target = 1,
		description = "challenge_description_find_deus_soft_currency_01",
		events = {
			player_pickup_deus_soft_currency = function (t, data, player)
				return 1
			end
		}
	},
	find_deus_weapon_chest = {
		default_target = 1,
		description = "challenge_description_find_deus_weapon_chest_01",
		events = {
			player_pickup_deus_weapon_chest = function (t, data, player)
				return 1
			end
		}
	},
	cleanse_cursed_chest = {
		default_target = 1,
		description = "challenge_description_cleansed_deus_curse_chest_01",
		events = {
			player_cleansed_deus_cursed_chest = function (t, data, player)
				return 1
			end
		}
	}
}
dlc_settings.ingame_challenge_rewards = {
	deus_markus_questing_knight_passive_cooldown_reduction = {
		reward_id = "markus_questing_knight_passive_cooldown_reduction_buff",
		sound = "Play_hud_grail_knight_stamina",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_cdr",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_cooldown_reduction_improved = {
		reward_id = "markus_questing_knight_passive_cooldown_reduction_buff_improved",
		sound = "Play_hud_grail_knight_stamina",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_cdr",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_attack_speed = {
		reward_id = "markus_questing_knight_passive_attack_speed_buff",
		sound = "Play_hud_grail_knight_attack",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_attack_speed",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_attack_speed_improved = {
		reward_id = "markus_questing_knight_passive_attack_speed_buff_improved",
		sound = "Play_hud_grail_knight_attack",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_attack_speed",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_power_level = {
		reward_id = "markus_questing_knight_passive_power_level_buff",
		sound = "Play_hud_grail_knight_power",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_power_level",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_power_level_improved = {
		reward_id = "markus_questing_knight_passive_power_level_buff_improved",
		sound = "Play_hud_grail_knight_power",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_power_level",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_damage_taken = {
		reward_id = "markus_questing_knight_passive_damage_taken_buff",
		sound = "Play_hud_grail_knight_tank",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_damage_taken",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_damage_taken_improved = {
		reward_id = "markus_questing_knight_passive_damage_taken_buff_improved",
		sound = "Play_hud_grail_knight_tank",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_damage_taken",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_health_regen = {
		reward_id = "markus_questing_knight_passive_health_regen_buff",
		sound = "Play_hud_grail_knight_heal",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_health_regen",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	},
	deus_markus_questing_knight_passive_health_regen_improved = {
		reward_id = "markus_questing_knight_passive_health_regen_buff_improved",
		sound = "Play_hud_grail_knight_heal",
		type = "boon",
		consume_type = "round",
		icon = "icon_objective_health_regen",
		target = "party",
		consume_value = 1,
		reactivation_rule = BoonReactivationRules.questing_knight
	}
}
dlc_settings.ingame_challenge_rewards_description = {
	deus_markus_questing_knight_passive_attack_speed = "markus_questing_knight_passive_attack_speed",
	deus_markus_questing_knight_passive_damage_taken = "markus_questing_knight_passive_damage_taken",
	deus_markus_questing_knight_passive_power_level = "markus_questing_knight_passive_power_level",
	deus_markus_questing_knight_passive_cooldown_reduction = "markus_questing_knight_passive_cooldown_reduction"
}
