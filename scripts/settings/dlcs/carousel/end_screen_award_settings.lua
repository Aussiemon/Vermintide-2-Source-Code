-- chunkname: @scripts/settings/dlcs/carousel/end_screen_award_settings.lua

local TEMP_TABLE = {}

local function max_value(session_scores, key)
	table.clear(TEMP_TABLE)

	for _, session_score in pairs(session_scores) do
		TEMP_TABLE[#TEMP_TABLE + 1] = session_score
	end

	local function sort_func(a, b)
		return a.scores[key] > b.scores[key]
	end

	table.sort(TEMP_TABLE, sort_func)

	local no_winner
	local winner = TEMP_TABLE[1]

	return winner and winner.scores[key] > 0 and winner.peer_id or no_winner
end

EndScreenAwardSettings = {}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "hero_killer",
	evaluate = function (session_scores)
		return max_value(session_scores, "kills_heroes")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "pactsworn_slayer",
	evaluate = function (session_scores)
		return max_value(session_scores, "kills_specials")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "hero_napper",
	evaluate = function (session_scores)
		return max_value(session_scores, "disables")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "rescuer",
	evaluate = function (session_scores)
		return max_value(session_scores, "disables")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "hero_damager",
	evaluate = function (session_scores)
		return max_value(session_scores, "damage_dealt_heroes")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "pactsworn_damager",
	evaluate = function (session_scores)
		return max_value(session_scores, "vs_damage_dealt_to_pactsworn")
	end,
}
EndScreenAwardSettings[#EndScreenAwardSettings + 1] = {
	name = "saviour",
	evaluate = function (session_scores)
		return max_value(session_scores, "saves")
	end,
}
