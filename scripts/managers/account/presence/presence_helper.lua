-- chunkname: @scripts/managers/account/presence/presence_helper.lua

PresenceHelper = PresenceHelper or {}

PresenceHelper.lobby_level = function ()
	local level_key = Managers.level_transition_handler:get_current_level_key()

	return level_key
end

PresenceHelper.lobby_difficulty = function ()
	local diff = Managers.level_transition_handler:get_current_difficulty()

	return diff
end

local hub_presence_lookup = {
	deus = "deus_hub",
	versus = "versus_hub",
}

PresenceHelper.get_hub_presence = function ()
	local mechanism = Managers.mechanism:current_mechanism_name()

	return hub_presence_lookup[mechanism] or "adventure_hub"
end

PresenceHelper.lobby_gamemode = function (lobby_data)
	local mechanism = Managers.mechanism:current_mechanism_name()
	local is_in_prologue = Managers.level_transition_handler:get_current_level_key() == "prologue"
	local is_in_plaza = Managers.level_transition_handler:get_current_level_key() == "plaza"
	local matchmakin_type = lobby_data.matchmaking_type
	local quick_game = to_boolean(lobby_data.quick_game)
	local is_weekly_event = tonumber(matchmakin_type) == NetworkLookup.matchmaking_types.event
	local is_custom_game = tonumber(matchmakin_type) == NetworkLookup.matchmaking_types.custom
	local is_playing_deed = Managers.deed:has_deed()
	local is_twitch_enabled = to_boolean(lobby_data.twitch_enabled)
	local has_match_started = to_boolean(lobby_data.match_started)
	local matchmaking_manager = Managers.matchmaking
	local local_quick_game = matchmaking_manager:is_local_quick_game()
	local is_in_inn_level = Managers.level_transition_handler:in_hub_level()
	local is_quick_game = (local_quick_game or quick_game) and not is_in_inn_level
	local match_state = Managers.mechanism:get_state()

	if is_in_prologue then
		return "gamemode_prologue"
	elseif mechanism == "weave" then
		if is_quick_game then
			return "gamemode_weave_quick_play"
		else
			return "gamemode_weave"
		end
	elseif mechanism == "deus" then
		if is_twitch_enabled then
			return "gamemode_deus_twitch"
		elseif is_quick_game then
			return "gamemode_deus_quick_play"
		elseif not is_quick_game and not is_twitch_enabled and not is_in_inn_level then
			return "gamemode_deus_custom"
		else
			return "gamemode_deus_none"
		end
	elseif mechanism == "versus" then
		if is_in_inn_level then
			return "versus_hub"
		end

		if match_state == "round_1" or match_state == "round_2" then
			return "gamemode_versus_quick_play"
		end

		return "gamemode_versus_none"
	elseif is_twitch_enabled then
		return "gamemode_twitch"
	elseif is_quick_game then
		return "gamemode_quick_play"
	elseif is_playing_deed then
		return "gamemode_deed"
	elseif is_custom_game or is_in_plaza then
		return "gamemode_custom"
	elseif is_weekly_event then
		return "gamemode_event"
	end

	return "gamemode_none"
end

PresenceHelper.has_eac = function ()
	return not IS_WINDOWS or lobby_data.eac_authorized
end

local function dangerous_num_players()
	return Managers.state.network:lobby():members():get_member_count()
end

PresenceHelper.lobby_num_players = function ()
	local ok, num = pcall(dangerous_num_players)

	return ok and num or 1
end

PresenceHelper.get_side = function ()
	local peer_id = Network.peer_id()
	local party_manager = Managers.party
	local party = party_manager and party_manager:get_party_from_player_id(peer_id, 1)
	local side_manager = Managers.state.side
	local side = side_manager and side_manager.side_by_party[party]

	return side and side:name() or "heroes"
end

PresenceHelper.get_game_score = function ()
	local peer_id = Network.peer_id()
	local game_mechanism = Managers.mechanism:game_mechanism()
	local win_conditions = game_mechanism and game_mechanism:win_conditions()
	local party_manager = Managers.party
	local _, party_id = party_manager and party_manager:get_party_from_player_id(peer_id, 1)
	local opponent_party_id = party_id == 1 and 2 or 1
	local local_player_team_score = win_conditions and win_conditions:get_total_score(party_id)
	local opponent_team_score = win_conditions and win_conditions:get_total_score(opponent_party_id)
	local score_string = "[%d]-[%d]"

	if opponent_team_score and local_player_team_score then
		return string.format(score_string, local_player_team_score, opponent_team_score)
	else
		return "[?]-[?]"
	end
end

PresenceHelper.get_current_set = function ()
	local game_mechanism = Managers.mechanism:game_mechanism()
	local win_conditions = game_mechanism and game_mechanism:win_conditions()
	local rounds_played = win_conditions and win_conditions:get_current_round()

	return rounds_played and math.round(rounds_played / 2) or 0
end
