local components = {
	{
		use_hud_scale = true,
		class_name = "WorldMarkerUI",
		filename = "scripts/ui/hud_ui/world_marker_ui",
		visibility_groups = {
			"alive",
			"dead",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "LootObjectiveUI",
		filename = "scripts/ui/hud_ui/loot_objective_ui",
		visibility_groups = {
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "WaitForRescueUI",
		filename = "scripts/ui/hud_ui/wait_for_rescue_ui",
		visibility_groups = {
			"dead"
		}
	},
	{
		use_hud_scale = true,
		class_name = "ItemReceivedFeedbackUI",
		filename = "scripts/ui/hud_ui/item_received_feedback_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "OverchargeBarUI",
		filename = "scripts/ui/hud_ui/overcharge_bar_ui",
		visibility_groups = {
			"alive",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "CareerAbilityBarUI",
		filename = "scripts/ui/hud_ui/career_ability_bar_ui",
		visibility_groups = {
			"alive",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "BossHealthUI",
		filename = "scripts/ui/hud_ui/boss_health_ui",
		visibility_groups = {
			"dead",
			"alive",
			"spectator"
		}
	},
	{
		class_name = "RewardsPopupUI",
		filename = "scripts/ui/hud_ui/rewards_popup_ui",
		visibility_groups = {
			"deus_run_stats",
			"game_mode_disable_hud",
			"entering_mission",
			"hero_selection_popup",
			"mission_vote",
			"game_mode_disable_hud",
			"cutscene",
			"realism",
			"dead",
			"alive"
		},
		validation_function = function (context, is_in_inn)
			return is_in_inn or Managers.mechanism:current_mechanism_name() == "deus"
		end
	},
	{
		class_name = "IngameNewsTickerUI",
		filename = "scripts/ui/hud_ui/ingame_news_ticker_ui",
		visibility_groups = {
			"entering_mission",
			"hero_selection_popup",
			"mission_vote",
			"game_mode_disable_hud",
			"cutscene",
			"realism",
			"dead",
			"alive"
		},
		validation_function = function (context, is_in_inn)
			local disable_news_ticker = script_data.disable_news_ticker

			return not disable_news_ticker
		end
	},
	{
		class_name = "MissionVotingUI",
		filename = "scripts/ui/mission_vote_ui/mission_voting_ui",
		visibility_groups = {
			"entering_mission",
			"mission_vote",
			"game_mode_disable_hud",
			"cutscene",
			"realism",
			"dead",
			"alive"
		},
		validation_function = function (context, is_in_inn)
			return is_in_inn
		end
	},
	{
		use_hud_scale = true,
		class_name = "LevelCountdownUI",
		filename = "scripts/ui/hud_ui/level_countdown_ui",
		visibility_groups = {
			"entering_mission",
			"mission_vote",
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "UnitFramesHandler",
		filename = "scripts/ui/hud_ui/unit_frames_handler",
		visibility_groups = {
			"dead",
			"alive",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "BuffUI",
		filename = "scripts/ui/hud_ui/buff_ui",
		visibility_groups = {
			"alive",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "BuffPresentationUI",
		filename = "scripts/ui/hud_ui/buff_presentation_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "EquipmentUI",
		filename = "scripts/ui/hud_ui/equipment_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "GamePadEquipmentUI",
		filename = "scripts/ui/hud_ui/gamepad_equipment_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "AbilityUI",
		filename = "scripts/ui/hud_ui/ability_ui",
		visibility_groups = {
			"alive",
			"spectator"
		}
	},
	{
		use_hud_scale = true,
		class_name = "GamePadAbilityUI",
		filename = "scripts/ui/hud_ui/gamepad_ability_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "ContractLogUI",
		filename = "scripts/ui/hud_ui/contract_log_ui",
		visibility_groups = {
			"alive"
		},
		validation_function = function (context, is_in_inn)
			local backend_settings = GameSettingsDevelopment.backend_settings
			local quests_enabled = backend_settings.quests_enabled

			return quests_enabled and not is_in_inn
		end
	},
	{
		use_hud_scale = true,
		class_name = "DamageNumbersUI",
		filename = "scripts/ui/hud_ui/damage_numbers_ui",
		visibility_groups = {
			"alive"
		},
		validation_function = function (context, is_in_inn)
			local debug_show_damage_numbers = script_data.debug_show_damage_numbers
			local debug_ai_attack_pattern = script_data.debug_ai_attack_pattern
			local activate = is_in_inn or debug_show_damage_numbers or debug_ai_attack_pattern

			return activate
		end
	},
	{
		use_hud_scale = true,
		class_name = "NewsFeedUI",
		filename = "scripts/ui/hud_ui/news_feed_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "TwitchVoteUI",
		filename = "scripts/ui/hud_ui/twitch_vote_ui",
		visibility_groups = {
			"realism",
			"alive",
			"dead"
		},
		validation_function = function (context, is_in_inn)
			local use_twitch_ui = true

			return use_twitch_ui
		end
	},
	{
		use_hud_scale = true,
		class_name = "GameTimerUI",
		filename = "scripts/ui/hud_ui/game_timer_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive",
			"in_endscreen"
		}
	},
	{
		use_hud_scale = true,
		class_name = "DifficultyUnlockUI",
		filename = "scripts/ui/hud_ui/difficulty_unlock_ui",
		visibility_groups = {
			"alive"
		},
		validation_function = function (context, is_in_inn)
			local game_mode_key = Managers.state.game_mode:game_mode_key()

			return game_mode_key == "survival"
		end
	},
	{
		use_hud_scale = true,
		class_name = "InteractionUI",
		filename = "scripts/ui/views/interaction_ui",
		visibility_groups = {
			"realism",
			"game_mode_disable_hud",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "DamageIndicatorGui",
		filename = "scripts/ui/views/damage_indicator_gui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "TutorialUI",
		filename = "scripts/ui/views/tutorial_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "AreaIndicatorUI",
		filename = "scripts/ui/views/area_indicator_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "MissionObjectiveUI",
		filename = "scripts/ui/views/mission_objective_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "CrosshairUI",
		filename = "scripts/ui/views/crosshair_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "BadgeUI",
		filename = "scripts/ui/hud_ui/badge_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "FatigueUI",
		filename = "scripts/ui/views/fatigue_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "BonusDiceUI",
		filename = "scripts/ui/views/bonus_dice_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		class_name = "IngamePlayerListUI",
		filename = GameSettingsDevelopment.use_new_tab_menu and "scripts/ui/views/ingame_player_list_ui_v2" or "scripts/ui/views/ingame_player_list_ui",
		visibility_groups = {
			"tab_menu",
			"realism",
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "PositiveReinforcementUI",
		filename = "scripts/ui/views/positive_reinforcement_ui",
		visibility_groups = {
			"dead",
			"alive"
		}
	}
}
components[36] = {
	use_hud_scale = true,
	class_name = "TutorialInputUI",
	filename = "scripts/ui/views/tutorial_input_ui",
	visibility_groups = {
		"game_mode_disable_hud",
		"alive"
	},
	validation_function = function ()
		local level_settings = LevelHelper.current_level_settings()

		return level_settings.tutorial_level
	end
}
components[37] = {
	class_name = "CutsceneOverlayUI",
	filename = "scripts/ui/views/cutscene_overlay_ui",
	visibility_groups = {
		"cutscene",
		"alive"
	}
}
components[38] = {
	class_name = "CutsceneUI",
	filename = "scripts/ui/views/cutscene_ui",
	visibility_groups = {
		"entering_mission",
		"mission_vote",
		"hero_selection_popup",
		"in_endscreen",
		"in_menu",
		"tab_menu",
		"game_mode_disable_hud",
		"cutscene",
		"realism",
		"dead",
		"alive"
	}
}
components[39] = {
	use_hud_scale = true,
	class_name = "PlayerInventoryUI",
	filename = "scripts/ui/views/player_inventory_ui",
	visibility_groups = {
		"alive"
	},
	validation_function = function (context, is_in_inn)
		local use_player_inventory = false

		return use_player_inventory
	end
}
components[40] = {
	use_hud_scale = true,
	class_name = "SubtitleGui",
	filename = "scripts/ui/views/subtitle_gui",
	visibility_groups = {
		"cutscene",
		"realism",
		"dead",
		"alive"
	}
}
components[41] = {
	use_hud_scale = true,
	class_name = "GiftPopupUI",
	filename = "scripts/ui/gift_popup/gift_popup_ui",
	visibility_groups = {
		"alive",
		"gift_popup"
	}
}
components[42] = {
	use_hud_scale = true,
	class_name = "IngameVotingUI",
	filename = "scripts/ui/views/ingame_voting_ui",
	visibility_groups = {
		"realism",
		"game_mode_disable_hud",
		"dead",
		"alive"
	}
}
components[43] = {
	use_hud_scale = true,
	class_name = "MatchmakingUI",
	filename = "scripts/ui/views/matchmaking_ui",
	visibility_groups = {
		"mission_vote",
		"hero_selection_popup",
		"in_endscreen",
		"in_menu",
		"tab_menu",
		"game_mode_disable_hud",
		"cutscene",
		"realism",
		"dead",
		"alive"
	}
}
components[44] = {
	class_name = "FloatingIconUI",
	filename = "scripts/ui/hud_ui/floating_icon_ui",
	visibility_groups = {
		"alive"
	}
}
components[45] = {
	class_name = "SocialWheelUI",
	filename = "scripts/ui/social_wheel/social_wheel_ui",
	visibility_groups = {
		"alive",
		"realism"
	},
	validation_function = function (context, is_in_inn)
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		return game_mode_key ~= "tutorial"
	end
}
components[46] = {
	use_hud_scale = true,
	class_name = "ChallengeTrackerUI",
	filename = "scripts/ui/hud_ui/challenge_tracker_ui",
	visibility_groups = {
		"game_mode_disable_hud",
		"dead",
		"alive"
	}
}
components[47] = {
	use_hud_scale = true,
	class_name = "EmotePhotomodeUI",
	filename = "scripts/ui/hud_ui/emote_photomode_ui",
	visibility_groups = {
		"dead",
		"alive"
	}
}
components[48] = {
	use_hud_scale = true,
	class_name = "PetUI",
	filename = "scripts/ui/hud_ui/pet_ui",
	visibility_groups = {
		"alive"
	}
}

DLCUtils.append("ingame_hud_components", components)

local visibility_groups = {}
visibility_groups[1] = {
	name = "disable_ingame_ui",
	validation_function = function (ingame_hud)
		local ingame_ui = ingame_hud:parent()
		local disable_ingame_ui = ingame_ui:disable_ingame_ui()

		return disable_ingame_ui
	end
}
visibility_groups[2] = {
	name = "entering_mission",
	validation_function = function (ingame_hud)
		local component = ingame_hud:component("LevelCountdownUI")
		local is_enter_game = component and component:is_enter_game()

		return is_enter_game
	end
}
visibility_groups[3] = {
	name = "hero_selection_popup",
	validation_function = function (ingame_hud)
		local ingame_ui = ingame_hud:parent()

		return ingame_ui:get_active_popup("profile_picker")
	end
}
visibility_groups[4] = {
	name = "mission_vote",
	validation_function = function (ingame_hud)
		local component = ingame_hud:component("MissionVotingUI")
		local is_active = component and component:is_active()

		return is_active
	end
}
visibility_groups[5] = {
	name = "in_endscreen",
	validation_function = function (ingame_hud)
		local ingame_ui = ingame_hud:parent()
		local end_screen_active = ingame_ui:end_screen_active()
		local in_score_screen = ingame_ui.end_of_level_ui ~= nil

		return in_score_screen or end_screen_active
	end
}
visibility_groups[6] = {
	name = "in_menu",
	validation_function = function (ingame_hud)
		local ingame_ui = ingame_hud:parent()
		local menu_active = ingame_ui.menu_active
		local current_view = ingame_ui.current_view
		local is_menu_active = menu_active or current_view ~= nil

		return is_menu_active
	end
}
visibility_groups[7] = {
	name = "gift_popup",
	validation_function = function (ingame_hud)
		local component = ingame_hud:component("GiftPopupUI")
		local is_active = component and component:active()

		return is_active
	end
}
visibility_groups[8] = {
	name = "cutscene",
	validation_function = function (ingame_hud)
		local cutscene_system = Managers.state.entity:system("cutscene_system")
		local cutscene_active = cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled

		return cutscene_active
	end
}
visibility_groups[9] = {
	name = "tab_menu",
	validation_function = function (ingame_hud)
		local component = ingame_hud:component("IngamePlayerListUI")
		local is_active = component and component:is_active()

		return is_active
	end
}
visibility_groups[10] = {
	name = "realism",
	validation_function = function (ingame_hud)
		local game_mode_manager = Managers.state.game_mode
		local has_realism = game_mode_manager and game_mode_manager:has_activated_mutator("realism")

		return has_realism
	end
}
visibility_groups[11] = {
	name = "game_mode_disable_hud",
	validation_function = function (ingame_hud)
		local game_mode_manager = Managers.state.game_mode
		local game_mode = game_mode_manager and game_mode_manager:game_mode()
		local game_mode_disable_hud = game_mode and game_mode.game_mode_hud_disabled and game_mode:game_mode_hud_disabled()

		return game_mode_disable_hud
	end
}
visibility_groups[12] = {
	name = "emote_photomode",
	validation_function = function (ingame_hud)
		local game_mode_manager = Managers.state.game_mode
		local game_mode = game_mode_manager and game_mode_manager:game_mode()
		local photomode_enabled = game_mode and game_mode:photomode_enabled()

		return photomode_enabled
	end
}
visibility_groups[13] = {
	name = "dead",
	validation_function = function (ingame_hud)
		return ingame_hud:is_own_player_dead()
	end
}
visibility_groups[14] = {
	name = "alive",
	validation_function = function (ingame_hud)
		local peer_id = Network.peer_id()
		local player_manager = Managers.player
		local my_player = player_manager:player_from_peer_id(peer_id)
		local player_unit = my_player.player_unit

		if player_unit and Unit.alive(player_unit) then
			return true
		end

		return false
	end
}

for _, settings in ipairs(components) do
	local filename = settings.filename

	require(filename)
end

return {
	components = components,
	visibility_groups = visibility_groups
}
