-- chunkname: @scripts/settings/dlcs/carousel/carousel_vote_templates.lua

VoteTemplates.carousel_settings_vote = {
	client_start_vote_rpc = "rpc_server_request_start_vote_lookup",
	duration = 30,
	gamepad_input_desc = "default_voting",
	gamepad_support = true,
	ingame_vote = false,
	min_required_voters = 1,
	minimum_voter_percent = 1,
	mission_vote = true,
	priority = 110,
	server_start_vote_rpc = "rpc_client_start_vote_lookup",
	success_percent = 1,
	text = "carousel_settings_vote",
	timeout_vote_option = 2,
	vote_options = {
		{
			gamepad_input = "confirm",
			input = "ingame_vote_yes",
			text = "popup_choice_accept",
			vote = 1,
		},
		{
			gamepad_input = "back",
			input = "ingame_vote_no",
			text = "dlc1_3_1_decline",
			vote = 2,
		},
	},
	on_start = function (ingame_context, data)
		Managers.matchmaking:cancel_matchmaking()
	end,
	on_complete = function (vote_result, ingame_context, data)
		if vote_result == 1 then
			local vote_type = data.vote_type

			if Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) and not Managers.twitch:game_mode_supported(vote_type, difficulty) then
				Managers.twitch:disconnect()
			end

			local lobby = Managers.state.network:lobby()
			local use_dedicated_servers = data.use_dedicated_win_servers or data.use_dedicated_aws_servers
			local search_config = {
				wait_for_join_message = true,
				mission_id = data.mission_id,
				preferred_level_keys = data.preferred_level_keys,
				difficulty = data.difficulty,
				quick_game = data.quick_game or false,
				join_method = data.join_method,
				private_game = data.private_game or false,
				party_lobby_host = use_dedicated_servers and lobby,
				max_num_players = GameModeSettings.versus.max_num_players,
				player_hosted = data.player_hosted,
				dedicated_server = use_dedicated_servers,
				aws = data.use_dedicated_aws_servers,
				linux = data.use_dedicated_aws_servers,
				mechanism = data.mechanism,
				matchmaking_type = data.matchmaking_type,
			}

			Managers.matchmaking:find_game(search_config)
		end
	end,
	pack_sync_data = function (data)
		local mission_id = data.mission_id or "n/a"
		local difficulty = data.difficulty or "n/a"
		local player_hosted = data.player_hosted
		local use_dedicated_win_servers = data.use_dedicated_win_servers
		local use_dedicated_aws_servers = data.use_dedicated_aws_servers
		local matchmaking_type = data.matchmaking_type
		local mechanism = data.mechanism
		local quick_game = data.quick_game
		local sync_data = {
			NetworkLookup.mission_ids[mission_id],
			NetworkLookup.difficulties[difficulty],
			NetworkLookup.join_methods[data.join_method],
			player_hosted and 1 or 2,
			use_dedicated_win_servers and 1 or 2,
			use_dedicated_aws_servers and 1 or 2,
			NetworkLookup.matchmaking_types[matchmaking_type],
			NetworkLookup.mechanisms[mechanism],
			quick_game and 1 or 2,
		}

		return sync_data
	end,
	extract_sync_data = function (sync_data)
		local mission_id = sync_data[1]
		local difficulty_id = sync_data[2]
		local join_method_id = sync_data[3]
		local player_hosted = sync_data[4]
		local use_dedicated_win_servers = sync_data[5]
		local use_dedicated_aws_servers = sync_data[6]
		local matchmaking_type_id = sync_data[7]
		local mechanism_id = sync_data[8]
		local quick_game = sync_data[9]

		mission_id = NetworkLookup.mission_ids[mission_id]

		if mission_id == "n/a" then
			mission_id = nil
		end

		local difficulty = NetworkLookup.difficulties[difficulty_id]
		local join_method = NetworkLookup.join_methods[join_method_id]
		local matchmaking_type = NetworkLookup.matchmaking_types[matchmaking_type_id]
		local mechanism = NetworkLookup.mechanisms[mechanism_id]
		local data = {
			mission_id = mission_id,
			difficulty = difficulty,
			join_method = join_method,
			player_hosted = player_hosted == 1,
			use_dedicated_win_servers = use_dedicated_win_servers == 1,
			use_dedicated_aws_servers = use_dedicated_aws_servers == 1,
			matchmaking_type = matchmaking_type,
			mechanism = mechanism,
			quick_game = quick_game == 1,
		}

		return data
	end,
	initial_vote_func = function (data)
		local votes = {
			[data.voter_peer_id] = 1,
		}

		return votes
	end,
}
VoteTemplates.carousel_player_hosted_settings_vote = {
	client_start_vote_rpc = "rpc_server_request_start_vote_lookup",
	duration = 30,
	gamepad_input_desc = "default_voting",
	gamepad_support = true,
	ingame_vote = false,
	min_required_voters = 1,
	minimum_voter_percent = 1,
	mission_vote = true,
	priority = 110,
	server_start_vote_rpc = "rpc_client_start_vote_lookup",
	success_percent = 1,
	text = "carousel_player_host_settings_vote",
	timeout_vote_option = 2,
	vote_options = {
		{
			gamepad_input = "confirm",
			input = "ingame_vote_yes",
			text = "popup_choice_accept",
			vote = 1,
		},
		{
			gamepad_input = "back",
			input = "ingame_vote_no",
			text = "dlc1_3_1_decline",
			vote = 2,
		},
	},
	on_start = function (ingame_context, data)
		Managers.matchmaking:cancel_matchmaking()
	end,
	on_complete = function (vote_result, ingame_context, data)
		if vote_result == 1 then
			local vote_type = data.vote_type

			if Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) and not Managers.twitch:game_mode_supported(vote_type, difficulty) then
				Managers.twitch:disconnect()
			end

			local lobby = Managers.state.network:lobby()
			local use_dedicated_servers = data.use_dedicated_win_servers or data.use_dedicated_aws_servers
			local search_config = {
				dedicated_server = false,
				matchmaking_start_state = "MatchmakingStatePlayerHostedGame",
				player_hosted = true,
				quick_game = false,
				mission_id = data.mission_id,
				any_level = data.any_level,
				difficulty = data.difficulty,
				private_game = data.private_game or false,
				party_lobby_host = lobby,
				max_num_players = GameModeSettings.versus.max_num_players,
				mechanism = data.mechanism,
				matchmaking_type = data.matchmaking_type,
			}

			Managers.matchmaking:find_game(search_config)
		end
	end,
	pack_sync_data = function (data)
		local mission_id = data.mission_id or "n/a"
		local difficulty = data.difficulty or "n/a"
		local player_hosted = data.player_hosted
		local matchmaking_type = data.matchmaking_type
		local mechanism = data.mechanism
		local sync_data = {
			NetworkLookup.mission_ids[mission_id],
			NetworkLookup.difficulties[difficulty],
			player_hosted and 1 or 2,
			NetworkLookup.matchmaking_types[matchmaking_type],
			NetworkLookup.mechanisms[mechanism],
		}

		return sync_data
	end,
	extract_sync_data = function (sync_data)
		local mission_id = sync_data[1]
		local difficulty_id = sync_data[2]
		local player_hosted = sync_data[3]
		local matchmaking_type_id = sync_data[4]
		local mechanism_id = sync_data[5]
		local mission_id = NetworkLookup.mission_ids[mission_id]

		if mission_id == "n/a" then
			mission_id = nil
		end

		local difficulty = NetworkLookup.difficulties[difficulty_id]
		local matchmaking_type = NetworkLookup.matchmaking_types[matchmaking_type_id]
		local mechanism = NetworkLookup.mechanisms[mechanism_id]
		local data = {
			mission_id = mission_id,
			difficulty = difficulty,
			player_hosted = player_hosted == 1,
			matchmaking_type = matchmaking_type,
			mechanism = mechanism,
		}

		return data
	end,
	initial_vote_func = function (data)
		local votes = {
			[data.voter_peer_id] = 1,
		}

		return votes
	end,
}
