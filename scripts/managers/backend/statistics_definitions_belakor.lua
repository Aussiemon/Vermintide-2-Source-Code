-- chunkname: @scripts/managers/backend/statistics_definitions_belakor.lua

local player = StatisticsDefinitions.player
local database_names = {
	"blk_three_champions",
	"blk_fast_arena",
	"blk_fast_kill_totems",
	"blk_synced_destruction",
	"blk_white_run",
	"blk_clutch_skull",
	"blk_no_totem",
	"blk_hitless_skull",
}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end
