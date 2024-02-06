-- chunkname: @scripts/managers/backend/statistics_definitions_celebrate.lua

local player = StatisticsDefinitions.player

player.crawl_total_ales_drunk = {
	database_name = "crawl_total_ales_drunk",
	source = "player_data",
	value = 0,
}
