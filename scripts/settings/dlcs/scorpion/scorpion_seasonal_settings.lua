-- chunkname: @scripts/settings/dlcs/scorpion/scorpion_seasonal_settings.lua

ScorpionSeasonalSettings = {}
ScorpionSeasonalSettings.current_season_id = 4

ScorpionSeasonalSettings.get_season_name = function (id)
	if id == 1 then
		return "season_" .. id
	end

	return "s" .. id
end

ScorpionSeasonalSettings.current_season_name = ScorpionSeasonalSettings.get_season_name(ScorpionSeasonalSettings.current_season_id)

ScorpionSeasonalSettings.get_leaderboard_stat_for_season = function (season_id, player_num)
	return ScorpionSeasonalSettings.get_season_name(season_id) .. "_weave_score_" .. player_num .. "_players"
end

ScorpionSeasonalSettings.get_leaderboard_stat = function (player_num)
	return ScorpionSeasonalSettings.get_leaderboard_stat_for_season(ScorpionSeasonalSettings.current_season_id, player_num)
end

ScorpionSeasonalSettings.get_weave_score_stat_for_season = function (season_id, weave_id, player_num)
	if season_id == 1 then
		return "weave_score_weave_" .. weave_id .. "_" .. player_num .. "_players"
	end

	return weave_id .. "_" .. player_num
end

ScorpionSeasonalSettings.get_weave_score_stat = function (weave_id, player_num)
	return ScorpionSeasonalSettings.get_weave_score_stat_for_season(ScorpionSeasonalSettings.current_season_id, weave_id, player_num)
end
