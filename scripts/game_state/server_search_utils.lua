-- chunkname: @scripts/game_state/server_search_utils.lua

ServerSearchUtils = {}

ServerSearchUtils.trigger_game_server_finder_search = function (search_type, network_options, num_players, filters)
	print("Attempting " .. search_type .. " search for game server")

	local finder = GameServerFinder:new(network_options)

	finder:set_search_type(search_type)

	local game_server_requirements = {
		free_slots = num_players,
		server_browser_filters = {
			dedicated = "valuenotused",
			full = "valuenotused",
			gamedir = Managers.mechanism:server_universe(),
		},
		matchmaking_filters = {},
	}

	table.merge_recursive(game_server_requirements, filters)

	local skip_verify_lobby_data = true

	finder:add_filter_requirements(game_server_requirements, skip_verify_lobby_data)
	finder:refresh()

	return finder
end

ServerSearchUtils.trigger_lobby_finder_search = function (network_options, num_players, filters)
	local requirements = {
		distance_filter = "world",
		free_slots = num_players,
		filters = {},
		near_filters = {},
	}

	table.merge_recursive(requirements, filters)

	local skip_verify_lobby_data = true
	local finder = LobbyFinder:new(network_options, nil, true)

	finder:add_filter_requirements(requirements, skip_verify_lobby_data)
	finder:refresh()

	return finder
end

ServerSearchUtils.filter_game_server_search = function (servers, network_options, soft_filters, network_hash, black_listed_servers, search_time)
	table.array_remove_if(servers, function (server)
		local wrong_version = server.network_hash ~= network_hash

		if wrong_version then
			printf("Removing server %s with wrong version %s", server.server_info.ip_port, server.network_hash)

			server.matching_fail = "wrong network hash"
		end

		return wrong_version
	end)
	table.array_remove_if(servers, function (server)
		if not script_data.blacklisting_disabled_vs then
			local blacklisted = black_listed_servers[server.server_info.ip_port] ~= nil

			if blacklisted then
				printf("Removing black listed server %s", server.server_info.ip_port)

				server.matching_fail = "blacklisted"
			end

			return blacklisted
		end
	end)
	table.array_remove_if(servers, function (server)
		local has_password = server.server_info.password

		if has_password then
			printf("Removing password protected server %s", server.ip_port)

			server.matching_fail = "password protected"
		end

		return has_password
	end)
	table.array_remove_if(servers, function (server)
		return not server.game_state
	end)
	table.array_remove_if(servers, function (server)
		return server.game_state == "dedicated_server_abort_game"
	end)

	if soft_filters.hotjoin_disabled_game_states then
		table.array_remove_if(servers, function (server)
			local allowed_states = Managers.state.game_mode:setting("allowed_hotjoin_states")

			if table.contains(allowed_states, server.game_state) then
				return false
			end

			return true
		end)
	end

	if soft_filters.filter_fully_reserved_servers then
		table.array_remove_if(servers, function (server)
			local server_info = server.server_info

			if not server_info then
				return false
			end

			local match_started = server.match_started

			if match_started ~= "true" then
				return false
			end

			local num_players = server_info.num_players or 0
			local max_players = server_info.max_players or 1

			return max_players <= num_players
		end)
	end

	table.array_remove_if(servers, function (server)
		local ping = server.server_info.ping or math.huge

		if search_time >= 300 then
			return false
		end

		if search_time >= 240 then
			return ping >= 250
		end

		if search_time >= 180 then
			return ping >= 200
		end

		if search_time >= 120 then
			return ping >= 160
		end

		if search_time >= 60 then
			return ping >= 120
		end

		return ping >= 100
	end)

	return servers
end
