StatisticsUtil.register_open_shrine = function (shrine_type)
	local player_manager = Managers.player
	local player = player_manager:local_player()
	local statistics_db = player_manager:statistics_db()
	local stats_id = player:stats_id()

	statistics_db:increment_stat(stats_id, "opened_shrines", shrine_type)
end
