-- chunkname: @scripts/settings/dlcs/morris/morris_vote_templates.lua

VoteTemplates.deus_settings_vote = {
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
	text = "deus_settings_vote",
	timeout_vote_option = 2,
	requirement_failed_message_func = function (requirement_check_data)
		local text = Localize("vote_requirement_failed")
		local player_manager = Managers.player

		for peer_id, success in pairs(requirement_check_data.results) do
			if not success then
				local player = player_manager:player_from_peer_id(peer_id)
				local name = player:name()

				text = text .. name .. "\n"
			end
		end

		return text
	end,
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
			local mission_id = data.mission_id
			local difficulty = data.difficulty
			local quick_game = data.quick_game
			local private_game = data.private_game
			local always_host = data.always_host
			local strict_matchmaking = data.strict_matchmaking
			local matchmaking_type = data.matchmaking_type
			local excluded_level_keys = data.excluded_level_keys
			local vote_type = data.vote_type
			local search_config = {
				any_level = true,
				dedicated_server = false,
				dedicated_servers = false,
				join_method = "solo",
				mechanism = "deus",
				mission_id = mission_id,
				difficulty = difficulty,
				quick_game = quick_game,
				private_game = private_game,
				always_host = always_host,
				strict_matchmaking = strict_matchmaking,
				matchmaking_type = matchmaking_type,
				excluded_level_keys = excluded_level_keys,
			}

			if Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) and not Managers.twitch:game_mode_supported(vote_type, difficulty) then
				Managers.twitch:disconnect()
			end

			Managers.mechanism:set_vote_data(data)
			Managers.mechanism:reset_choose_next_state()

			local matchmaking_manager = Managers.matchmaking

			matchmaking_manager:find_game(search_config)

			if matchmaking_type == "event" then
				local event_data = data.event_data

				matchmaking_manager:set_game_mode_event_data(event_data)
			end
		end
	end,
	pack_sync_data = function (data)
		local mission_id = data.mission_id or "n/a"
		local act_key = data.act_key or "n/a"
		local difficulty = data.difficulty
		local quick_game = data.quick_game
		local private_game = data.private_game
		local always_host = data.always_host
		local strict_matchmaking = data.strict_matchmaking
		local matchmaking_type = data.matchmaking_type
		local twitch_enabled = Managers.twitch and Managers.twitch:is_connected()
		local dominant_god = data.dominant_god
		local mechanism = data.mechanism

		if not data.mission_id then
			mission_id = "n/a"
			dominant_god = nil
		end

		local sync_data = {
			NetworkLookup.mission_ids[mission_id],
			NetworkLookup.act_keys[act_key],
			NetworkLookup.difficulties[difficulty],
			quick_game and 1 or 2,
			private_game and 1 or 2,
			always_host and 1 or 2,
			strict_matchmaking and 1 or 2,
			NetworkLookup.matchmaking_types[matchmaking_type],
			twitch_enabled and 1 or 2,
			NetworkLookup.mechanisms[mechanism],
			dominant_god and NetworkLookup.deus_themes[dominant_god],
		}

		if matchmaking_type == "event" then
			local event_data = data.event_data
			local mutators = event_data.mutators or {}

			sync_data[#sync_data + 1] = #mutators

			for i = 1, #mutators do
				local mutator_name = mutators[i]
				local mutator_id = NetworkLookup.mutator_templates[mutator_name]

				sync_data[#sync_data + 1] = mutator_id
			end

			local boons = event_data.boons or {}

			sync_data[#sync_data + 1] = #boons

			for i = 1, #boons do
				local boon_name = boons[i]
				local boon = DeusPowerUpsLookup[boon_name]

				sync_data[#sync_data + 1] = boon.lookup_id
			end
		end

		return sync_data
	end,
	extract_sync_data = function (sync_data)
		local mission_id = sync_data[1]
		local act_key_id = sync_data[2]
		local difficulty_id = sync_data[3]
		local quick_game_id = sync_data[4]
		local private_game_id = sync_data[5]
		local always_host_id = sync_data[6]
		local strict_matchmaking_id = sync_data[7]
		local matchmaking_type_id = sync_data[8]
		local twitch_enabled_id = sync_data[9]
		local mechanism_id = sync_data[10]
		local dominant_god_id = sync_data[11]
		local mission_id = NetworkLookup.mission_ids[mission_id]

		if mission_id == "n/a" then
			mission_id = nil
		end

		local act_key = NetworkLookup.act_keys[act_key_id]

		if act_key == "n/a" then
			act_key = nil
		end

		local difficulty = NetworkLookup.difficulties[difficulty_id]
		local matchmaking_type = NetworkLookup.matchmaking_types[matchmaking_type_id]
		local dominant_god = dominant_god_id and NetworkLookup.deus_themes[dominant_god_id]
		local mechanism = NetworkLookup.mechanisms[mechanism_id]
		local mutators, boons

		if matchmaking_type == "event" then
			mutators = {}

			local num_mutator_index = 12
			local mutator_start_index = num_mutator_index + 1
			local num_mutators = sync_data[num_mutator_index]

			for i = mutator_start_index, mutator_start_index + num_mutators - 1 do
				local mutator_id = sync_data[i]

				mutators[#mutators + 1] = NetworkLookup.mutator_templates[mutator_id]
			end

			boons = {}

			local num_boon_index = mutator_start_index + num_mutators
			local boon_start_index = num_boon_index + 1
			local num_boons = sync_data[num_boon_index]

			for i = boon_start_index, boon_start_index + num_boons - 1 do
				local boon_id = sync_data[i]
				local boon = DeusPowerUpsLookup[boon_id]

				boons[#boons + 1] = boon.name
			end
		end

		local data = {
			mission_id = mission_id,
			act_key = act_key,
			difficulty = difficulty,
			event_data = (mutators or boons) and {
				mutators = mutators,
				boons = boons,
			},
			dominant_god = dominant_god,
			quick_game = quick_game_id == 1,
			private_game = private_game_id == 1,
			always_host = always_host_id == 1,
			strict_matchmaking = strict_matchmaking_id == 1,
			matchmaking_type = matchmaking_type,
			twitch_enabled = twitch_enabled_id == 1,
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
