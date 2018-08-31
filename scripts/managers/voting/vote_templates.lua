VoteTemplates = {
	retry_level = {
		priority = 100,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "vote_retry_level_title",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 20,
		vote_options = {
			{
				text = "vote_retry_level_yes",
				vote = 1
			},
			{
				text = "vote_retry_level_no",
				vote = 2
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if level_transition_handler:transition_in_progress() then
				return
			end

			if vote_result == 1 then
				level_transition_handler:reload_level()
			else
				level_transition_handler:set_next_level("inn_level")
				level_transition_handler:level_completed()
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	return_to_inn = {
		priority = 1000,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "n/a",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 90,
		vote_options = {
			{
				text = "n/a",
				vote = 1
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if level_transition_handler:transition_in_progress() then
				return
			end

			Managers.matchmaking:set_quick_game(false)
			Managers.state.game_mode:start_specific_level("inn_level", 0)
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	continue_level = {
		priority = 100,
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		text = "vote_retry_level_title",
		minimum_voter_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 20,
		vote_options = {
			{
				text = "vote_retry_level_continue",
				vote = 1
			},
			{
				text = "vote_retry_level_restart",
				vote = 2
			},
			{
				text = "vote_retry_level_cancel",
				vote = 3
			}
		},
		on_complete = function (vote_result, ingame_context)
			local level_transition_handler = ingame_context.level_transition_handler

			if vote_result == 1 then
				local checkpoint_data = Managers.state.spawn:checkpoint_data()

				level_transition_handler:reload_level(checkpoint_data)
			elseif vote_result == 2 then
				level_transition_handler:reload_level()
			else
				Managers.state.event:trigger("checkpoint_vote_cancelled")
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local data = {}

			return data
		end
	},
	kick_player = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 10,
		ingame_vote = true,
		min_required_voters = 3,
		text = "input_description_vote_kick_player",
		minimum_voter_percent = 1,
		success_percent = 0.51,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 30,
		vote_options = {
			{
				text = "vote_kick_player_option_yes",
				vote = 1,
				input_hold_time = 1,
				gamepad_input = "ingame_vote_yes",
				input = "ingame_vote_yes"
			},
			{
				text = "vote_kick_player_option_no",
				input_hold_time = 1,
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local network_server = ingame_context.network_server

				network_server:kick_peer(data.kick_peer_id)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				data.kick_peer_id
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local kick_peer_id = sync_data[2]
			local data = {
				voter_peer_id = voter_peer_id,
				kick_peer_id = kick_peer_id
			}

			return data
		end,
		modify_title_text = function (text, data)
			local player = Managers.player:player_from_peer_id(data.kick_peer_id)
			local name = (player and player:name()) or "n/a"

			return sprintf("%s\n%s", text, tostring(name))
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1,
				[data.kick_peer_id] = 2
			}

			return votes
		end,
		can_start_vote = function (data)
			if data then
				local player = Managers.player:player_from_peer_id(data.kick_peer_id)

				if player then
					return true
				end
			end

			return false
		end
	},
	afk_kick = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 10,
		ingame_vote = true,
		min_required_voters = 2,
		text = "afk_vote_kick_player",
		minimum_voter_percent = 1,
		success_percent = 0.51,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 30,
		vote_options = {
			{
				text = "vote_kick_player_yes",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "vote_kick_player_no",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local network_server = ingame_context.network_server

				network_server:kick_peer(data.kick_peer_id)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				data.kick_peer_id
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local kick_peer_id = sync_data[2]
			local data = {
				voter_peer_id = voter_peer_id,
				kick_peer_id = kick_peer_id
			}

			return data
		end,
		modify_title_text = function (text, data)
			local player = Managers.player:player_from_peer_id(data.kick_peer_id)
			local name = player:name()

			return sprintf("%s\n%s", text, tostring(name))
		end
	},
	vote_for_level = {
		client_start_vote_rpc = "rpc_server_request_start_vote_peer_id",
		priority = 110,
		ingame_vote = false,
		min_required_voters = 1,
		text = "vote_for_next_level",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_peer_id",
		duration = 300,
		start_sound_event = "hud_dice_game_reward_sound",
		vote_options = {
			{
				text = "popup_choice_accept",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_complete = function (vote_result, ingame_context, data)
			local level_transition_handler = ingame_context.level_transition_handler

			if vote_result == 1 then
				local level_key = data.level_key

				Managers.state.game_mode:start_specific_level(level_key)
			end
		end,
		pack_sync_data = function (data)
			local sync_data = {
				data.voter_peer_id,
				NetworkLookup.level_keys[data.level_key]
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local voter_peer_id = sync_data[1]
			local level_key = NetworkLookup.level_keys[tonumber(sync_data[2])]
			local data = {
				voter_peer_id = voter_peer_id,
				level_key = level_key
			}

			return data
		end
	},
	game_settings_vote = {
		ingame_vote = false,
		client_start_vote_rpc = "rpc_server_request_start_vote_lookup",
		gamepad_support = true,
		text = "game_settings_vote",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_lookup",
		duration = 30,
		priority = 110,
		min_required_voters = 1,
		gamepad_input_desc = "default_voting",
		timeout_vote_option = 2,
		vote_options = {
			{
				text = "popup_choice_accept",
				gamepad_input = "confirm",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				gamepad_input = "back",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_start = function (ingame_context, data)
			Managers.matchmaking:cancel_matchmaking()
		end,
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key
				local difficulty = data.difficulty
				local quick_game = data.quick_game
				local private_game = data.private_game
				local always_host = data.always_host
				local strict_matchmaking = data.strict_matchmaking
				local search_config = {
					level_key = level_key,
					difficulty = difficulty,
					quick_game = quick_game,
					private_game = private_game,
					always_host = always_host,
					strict_matchmaking = strict_matchmaking
				}

				Managers.matchmaking:find_game(search_config)
			end
		end,
		pack_sync_data = function (data)
			local level_key = data.level_key or "n/a"
			local act_key = data.act_key or "n/a"
			local difficulty = data.difficulty
			local quick_game = data.quick_game
			local private_game = data.private_game
			local always_host = data.always_host
			local strict_matchmaking = data.strict_matchmaking
			local sync_data = {
				NetworkLookup.level_keys[level_key],
				NetworkLookup.act_keys[act_key],
				NetworkLookup.difficulties[difficulty],
				(quick_game and 1) or 2,
				(private_game and 1) or 2,
				(always_host and 1) or 2,
				(strict_matchmaking and 1) or 2
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local level_key_id = sync_data[1]
			local act_key_id = sync_data[2]
			local difficulty_id = sync_data[3]
			local quick_game_id = sync_data[4]
			local private_game_id = sync_data[5]
			local always_host_id = sync_data[6]
			local strict_matchmaking_id = sync_data[7]
			local data = {
				level_key = NetworkLookup.level_keys[level_key_id],
				act_key = NetworkLookup.act_keys[act_key_id],
				difficulty = NetworkLookup.difficulties[difficulty_id],
				quick_game = (quick_game_id == 1 and true) or false,
				private_game = (private_game_id == 1 and true) or false,
				always_host = (always_host_id == 1 and true) or false,
				strict_matchmaking = (strict_matchmaking_id == 1 and true) or false
			}

			return data
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1
			}

			return votes
		end
	},
	game_settings_deed_vote = {
		ingame_vote = false,
		client_start_vote_rpc = "rpc_server_request_start_vote_deed",
		gamepad_support = true,
		text = "game_settings_deed_vote",
		minimum_voter_percent = 1,
		success_percent = 1,
		server_start_vote_rpc = "rpc_client_start_vote_deed",
		duration = 30,
		priority = 110,
		min_required_voters = 1,
		gamepad_input_desc = "default_voting",
		timeout_vote_option = 2,
		vote_options = {
			{
				text = "popup_choice_accept",
				gamepad_input = "confirm",
				vote = 1,
				input = "ingame_vote_yes"
			},
			{
				text = "dlc1_3_1_decline",
				gamepad_input = "back",
				vote = 2,
				input = "ingame_vote_no"
			}
		},
		on_start = function (ingame_context, data)
			Managers.matchmaking:cancel_matchmaking()
		end,
		on_complete = function (vote_result, ingame_context, data)
			if vote_result == 1 then
				local level_key = data.level_key
				local difficulty = data.difficulty
				local private_game = true
				local quick_game = false
				local search_config = {
					level_key = level_key,
					difficulty = difficulty,
					private_game = private_game,
					quick_game = quick_game
				}

				Managers.matchmaking:find_game(search_config)
			else
				Managers.deed:reset()
			end
		end,
		pack_sync_data = function (data)
			local item_name = data.item_name
			local level_key = data.level_key
			local difficulty = data.difficulty
			local sync_data = {
				NetworkLookup.item_names[item_name],
				NetworkLookup.level_keys[level_key],
				NetworkLookup.difficulties[difficulty]
			}

			return sync_data
		end,
		extract_sync_data = function (sync_data)
			local item_name_id = sync_data[1]
			local level_key_id = sync_data[2]
			local difficulty_id = sync_data[3]
			local data = {
				item_name = NetworkLookup.item_names[item_name_id],
				level_key = NetworkLookup.level_keys[level_key_id],
				difficulty = NetworkLookup.difficulties[difficulty_id]
			}

			return data
		end,
		initial_vote_func = function (data)
			local votes = {
				[data.voter_peer_id] = 1
			}

			return votes
		end
	}
}

for name, template in pairs(VoteTemplates) do
	template.name = name
end

return
