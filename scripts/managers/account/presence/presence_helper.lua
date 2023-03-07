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
	versus = "versus_hub",
	deus = "deus_hub"
}

PresenceHelper.get_hub_presence = function ()
	local mechanism = Managers.mechanism:current_mechanism_name()

	return hub_presence_lookup[mechanism] or "adventure_hub"
end

PresenceHelper.lobby_gamemode = function (lobby_data)
	local mechanism = lobby_data.mechanism
	local is_in_prologue = lobby_data.mission_id == "prologue"
	local is_in_plaza = lobby_data.mission_id == "plaza"
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
		local state = Managers.mechanism:get_state()

		if state == "round_1" then
			return "gamemode_versus_round_1"
		elseif state == "round_2" then
			return "gamemode_versus_round_2"
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
