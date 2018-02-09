LeaderboardSystem = class(LeaderboardSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_client_leaderboard_register_score"
}

if Leaderboard then
	local EXTRA_DATA_TEMPLATE = {
		Leaderboard.UINT(32),
		Leaderboard.UINT(32),
		Leaderboard.UINT(32),
		Leaderboard.UINT(4),
		Leaderboard.UINT(4),
		Leaderboard.UINT(4),
		Leaderboard.UINT(4)
	}
end

local NO_PLAYER_ID = 0
local MY_PROFILE_INDEX = 4
local STEAM_AVAILABLE = rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam"
local SCORE_UPDATE_METHOD = Leaderboard and Leaderboard.KEEP_BEST

local function get_board_name(level_key, difficulty_name)
	return string.format("%s_%s", level_key, difficulty_name)
end

local function close_and_clear_token(token, token_data, tokens)
	Leaderboard.close(token)
	table.clear(token_data)

	tokens[token] = nil

	return 
end

local PRECISION = 10000000

local function calculate_wave_score(nr_waves_completed, completion_time)
	assert(nr_waves_completed <= 200 and completion_time <= 10800, "Leaderboard error: Too many waves or too long playtime!")

	local wave_score = PRECISION*nr_waves_completed
	local time_score = math.floor(PRECISION/completion_time) - 1
	local final_score = wave_score + time_score

	return final_score
end

function get_wave_and_time_from_score(score)
	local nr_waves_completed = math.floor(score/PRECISION)
	local rest = score%PRECISION
	local completion_time = math.floor(PRECISION/(rest + 1))

	return nr_waves_completed, completion_time
end

local function debug_steam_wave_print_entries(status, total_scores, scores)
	for i = 1, total_scores, 1 do
		local entry = scores[i]
		local global_rank = entry.global_rank
		local player_name = entry.name
		local score = entry.score
		local nr_waves_completed, completion_time = get_wave_and_time_from_score(score)
		local extra_data = entry.data
		local my_profile_index = extra_data[MY_PROFILE_INDEX]
		local my_profile = SPProfiles[my_profile_index]
		local my_hero_name = Localize(my_profile.display_name)
		local accompanying_players_string = ""

		for j = 1, 3, 1 do
			local steamid_32 = extra_data[j]

			if steamid_32 ~= NO_PLAYER_ID then
				local profile_index = extra_data[MY_PROFILE_INDEX + j]
				local profile = SPProfiles[profile_index]
				local steamid_64 = Steam.id_32bit_to_id(steamid_32)
				local user_name = Steam.user_name(steamid_64)
				local hero_name = Localize(profile.display_name)
				accompanying_players_string = accompanying_players_string .. user_name .. " " .. hero_name .. " : "
			else
				break
			end
		end

		local debug_string = string.format("%d. %s, %s: %d, %d || %s", global_rank, player_name, my_hero_name, nr_waves_completed, completion_time, accompanying_players_string)

		print(debug_string)
	end

	return 
end

local function debug_simply_print(status, total_scores, scores)
	for i = 1, total_scores, 1 do
		local entry = scores[i]
		local global_rank = entry.global_rank
		local player_name = entry.name
		local score = entry.score
		local nr_waves_completed, completion_time = get_wave_and_time_from_score(score)
		local extra_data = entry.data
		local test1 = extra_data[0]
		local test2 = extra_data[1]
		local test3 = extra_data[2]
		local accompanying_players_string = (test1 or "Nothing here, Good") .. " " .. test2 .. " " .. (test3 or "")
		local debug_string = string.format("%d. %s, %d, %d || %s", global_rank, player_name, nr_waves_completed, completion_time, accompanying_players_string)

		print(debug_string)
	end

	return 
end

LeaderboardSystem.init = function (self, entity_system_creation_context, system_name)
	LeaderboardSystem.super.init(self, entity_system_creation_context, system_name, {})

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.world = entity_system_creation_context.world
	self.is_server = entity_system_creation_context.is_server
	self.network_transmit = entity_system_creation_context.network_transmit
	self.transaction_tokens = {}
	self.round_start_time = nil

	if script_data.debug_leaderboard then
		local debug_string = string.format("[LeaderboardSystem] %s", (STEAM_AVAILABLE and "Steam detected, using leaderboards") or "Leaderboards are disabled")

		print(debug_string)
	end

	return 
end
LeaderboardSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	local tokens = self.transaction_tokens

	for token, data in pairs(tokens) do
		close_and_clear_token(token, data, tokens)
	end

	if script_data.debug_leaderboard then
		local debug_string = "[LeaderboardSystem] DESTROYED"

		print(debug_string)
	end

	return 
end
LeaderboardSystem.update = function (self, context, t)
	local tokens = self.transaction_tokens

	for token, data in pairs(tokens) do
		local progress = Leaderboard.progress(token)

		if script_data.debug_leaderboard then
			local debug_string = string.format("[LeaderboardSystem] %s - transaction_status = %s : work_status = %s", data.name, progress.transaction_status, progress.work_status)

			print(debug_string)
		end

		if progress.work_status == "succeeded" or progress.work_status == "failed" then
			local callback = data.callback

			if callback ~= nil then
				callback(progress.work_status, progress.total_scores, progress.scores)
			end

			close_and_clear_token(token, data, tokens)
		end
	end

	return 
end
LeaderboardSystem.round_started = function (self, score_type, data)
	if not self.is_server or not STEAM_AVAILABLE then
		return 
	end

	self.round_start_time = data.start_time

	if script_data.debug_leaderboard then
		local debug_string = string.format("[LeaderboardSystem] round_started at %.2f, level score_type = %s", data.start_time, score_type or "?")

		print(debug_string)
	end

	return 
end
LeaderboardSystem.debug_simulate_wave_score_enty = function (self, wave, time, nr_players)
	local wave_score = calculate_wave_score(wave, time)
	local human_players = {}
	local net_ids = {
		"1",
		"2",
		"3",
		"4"
	}
	local hero_ids = {
		1,
		2,
		3,
		4
	}

	for i = 1, nr_players, 1 do
		local network_id_64_bit = net_ids[i]
		local network_id_32_bit = Steam.id_to_id_32bit(network_id_64_bit)
		human_players[#human_players + 1] = network_id_32_bit
		human_players[#human_players + 1] = hero_ids[i]
	end

	self.register_score(self, "whitebox_ai", "normal", wave_score, human_players)

	return 
end
LeaderboardSystem.round_completed = function (self)
	if not self.is_server or not STEAM_AVAILABLE then
		return 
	end

	local level_key = Managers.state.game_mode:level_key()
	local level_settings = LevelSettings[level_key]
	local score_type = level_settings.score_type

	if not score_type then
		return 
	end

	local time_manager = Managers.time
	local end_t = time_manager.time(time_manager, "game")
	local nr_waves_completed = 1
	local data = {
		completed_time = end_t,
		nr_waves_completed = nr_waves_completed
	}
	local completion_time = math.floor(data.completed_time - self.round_start_time)

	if completion_time <= 0 then
		print("[LeaderboardSystem] Invalid completion time, score will not be recorded!")

		return 
	end

	local score = nil
	local level_key_id = NetworkLookup.level_keys[level_key]
	local difficulty_name = Managers.state.difficulty:get_difficulty()
	local difficulty_id = NetworkLookup.difficulties[difficulty_name]
	local player_data = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	local player_index = 1
	local player_manager = Managers.player
	local human_players = player_manager.human_players(player_manager)
	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer

	for _, player in pairs(human_players) do
		local network_id_64_bit = player.network_id(player)
		local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id_64_bit, player.local_player_id(player))
		local network_id_32_bit = Steam.id_to_id_32bit(network_id_64_bit)
		player_data[player_index] = network_id_32_bit
		player_data[player_index + 1] = profile_index
		player_index = player_index + 2
	end

	if score_type == "time" then
		score = completion_time
	elseif score_type == "wave_and_time" then
		local nr_waves_completed = data.nr_waves_completed
		score = calculate_wave_score(nr_waves_completed, completion_time)
	end

	if score then
		self.network_transmit:send_rpc_clients("rpc_client_leaderboard_register_score", level_key_id, difficulty_id, score, unpack(player_data))
		self.register_score(self, level_key, difficulty_name, score, player_data)
	end

	if script_data.debug_leaderboard then
		local debug_string = string.format("[LeaderboardSystem] start_time = %.2f, end_time = %.2f, completion_time = %d, level score_type = %s", self.round_start_time, data.completed_time, completion_time, score_type or "?")

		print(debug_string)
	end

	return 
end
LeaderboardSystem.register_score = function (self, level_key, difficulty_name, score, human_players)
	local board_name = get_board_name(level_key, difficulty_name)
	local player_manager = Managers.player
	local my_player = player_manager.local_player(player_manager)
	local my_peer_id_64 = my_player.network_id(my_player)
	local my_peer_id_32 = Steam.id_to_id_32bit(my_peer_id_64)
	local extra_data = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	local curr_extra_index = 1
	local human_players_size = #human_players

	for i = 1, human_players_size, 2 do
		local peer_id = human_players[i]
		local profile_index = human_players[i + 1]

		if peer_id == my_peer_id_32 then
			extra_data[MY_PROFILE_INDEX] = profile_index
		else
			extra_data[curr_extra_index] = peer_id
			extra_data[curr_extra_index + MY_PROFILE_INDEX] = profile_index
			curr_extra_index = curr_extra_index + 1
		end
	end

	local token = Leaderboard.register_score(board_name, score, SCORE_UPDATE_METHOD, EXTRA_DATA_TEMPLATE, extra_data)
	self.transaction_tokens[token] = {
		name = "register_token"
	}

	if script_data.debug_leaderboard then
		local debug_string = string.format("[LeaderboardSystem] register_score -> score = %s, board = %s", tostring(score), board_name)

		print(debug_string)
	end

	return 
end
LeaderboardSystem.get_ranking_range = function (self, level_key, difficulty_name, callback, start_range, num_ranks)
	if not STEAM_AVAILABLE then
		return 
	end

	local board_name = get_board_name(level_key, difficulty_name)
	local token = Leaderboard.ranking_range(board_name, start_range, num_ranks, EXTRA_DATA_TEMPLATE)
	self.transaction_tokens[token] = {
		name = "ranking_range_token",
		callback = callback
	}

	return 
end
LeaderboardSystem.get_ranking_around_self = function (self, level_key, difficulty_name, callback, ranks_before, ranks_after)
	if not STEAM_AVAILABLE then
		return 
	end

	local board_name = get_board_name(level_key, difficulty_name)
	local token = Leaderboard.ranking_around_self(board_name, ranks_before, ranks_after, EXTRA_DATA_TEMPLATE)
	self.transaction_tokens[token] = {
		name = "ranking_around_self_token",
		callback = callback
	}

	return 
end
LeaderboardSystem.get_ranking_for_friends = function (self, level_key, difficulty_name, callback)
	if not STEAM_AVAILABLE then
		return 
	end

	local board_name = get_board_name(level_key, difficulty_name)
	local token = Leaderboard.ranking_for_friends(board_name, EXTRA_DATA_TEMPLATE)
	self.transaction_tokens[token] = {
		name = "ranking_for_friends",
		callback = callback
	}

	return 
end
LeaderboardSystem.rpc_client_leaderboard_register_score = function (self, sender, level_key_id, difficulty_id, score, ...)
	local level_key = NetworkLookup.level_keys[level_key_id]
	local difficulty_name = NetworkLookup.difficulties[difficulty_id]
	local human_players = {
		...
	}

	self.register_score(self, level_key, difficulty_name, score, human_players)

	return 
end

return 
