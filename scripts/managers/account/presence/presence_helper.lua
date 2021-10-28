PresenceHelper = PresenceHelper or {}

PresenceHelper.lobby_level = function ()
	local level_key = Managers.level_transition_handler:get_current_level_key()

	return level_key
end

PresenceHelper.lobby_difficulty = function ()
	local diff = Managers.level_transition_handler:get_current_difficulty()

	return diff
end

PresenceHelper.get_hub_presence = function ()
	local mechanism = Managers.mechanism:current_mechanism_name()

	if mechanism == "deus" then
		return "deus_hub"
	end

	return "adventure_hub"
end

PresenceHelper.lobby_gamemode = function (lobby_data)
	local mechanism = Managers.mechanism:game_mechanism()
	local is_in_prologue = lobby_data.mission_id == "prologue"
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
	elseif is_twitch_enabled then
		return "gamemode_twitch"
	elseif is_quick_game then
		return "gamemode_quick_play"
	elseif is_playing_deed then
		return "gamemode_deed"
	elseif is_weekly_event then
		return "gamemode_event"
	elseif is_custom_game then
		return "gamemode_custom"
	end

	return "gamemode_none"
end

PresenceHelper.has_eac = function ()
	return not IS_WINDOWS or lobby_data.eac_authorized
end

PresenceHelper.lobby_num_players = function ()
	return Managers.player:num_human_players()
end

return
