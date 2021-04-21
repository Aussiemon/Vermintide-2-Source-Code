PresenceHelper = PresenceHelper or {}

PresenceHelper.lobby_level = function (lobby_data)
	local mission_id = lobby_data.mission_id
	local weave_template = WeaveSettings.templates[mission_id]

	if weave_template then
		local weave_display_name = weave_template and weave_template.display_name

		return weave_display_name or "inn_level"
	end

	local lvl = lobby_data.selected_mission_id or lobby_data.mission_id

	return lvl or "inn_level"
end

PresenceHelper.lobby_difficulty = function (lobby_data)
	local diff = lobby_data.difficulty

	return diff or "normal"
end

PresenceHelper.lobby_gamemode = function (lobby_data)
	local mission_id = lobby_data.mission_id
	local weave_template = WeaveSettings.templates[mission_id]

	if weave_template then
		if to_boolean(lobby_data.quick_game) then
			return "gamemode_weave_quick_play"
		else
			return "gamemode_weave"
		end
	elseif to_boolean(lobby_data.twitch_enabled) then
		return "gamemode_twitch"
	elseif to_boolean(lobby_data.quick_game) then
		return "gamemode_quick_play"
	end

	return "gamemode_custom"
end

PresenceHelper.has_eac = function ()
	return not IS_WINDOWS or lobby_data.eac_authorized
end

PresenceHelper.lobby_num_players = function (lobby_data)
	return tonumber(lobby_data.num_players) or Managers.player:num_human_players()
end

return
