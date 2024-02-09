-- chunkname: @scripts/managers/backend/statistics_database_vs.lua

local function dbprintf(...)
	if script_data.statistics_debug then
		printf(...)
	end
end

StatisticsDatabaseVS = class(StatisticsDatabaseVS)

StatisticsDatabaseVS.init = function (self)
	return
end

StatisticsDatabaseVS.destroy = function (self)
	return
end

StatisticsDatabaseVS.register_network_event_delegate = function (self, network_event_delegate)
	return
end

StatisticsDatabaseVS.unregister_network_event_delegate = function (self)
	return
end

StatisticsDatabaseVS.register = function (self, id, category, backend_stats)
	return
end

StatisticsDatabaseVS.unregister = function (self, id)
	return
end

StatisticsDatabaseVS.is_registered = function (self, id)
	return false
end

StatisticsDatabaseVS.hot_join_sync = function (self, peer_id)
	return
end

StatisticsDatabaseVS.reset_session_stats = function (self)
	return
end

StatisticsDatabaseVS.generate_backend_stats = function (self, id, backend_stats)
	return backend_stats
end

StatisticsDatabaseVS.has_stat = function (self, id, ...)
	return
end

StatisticsDatabaseVS.increment_stat = function (self, id, ...)
	return
end

StatisticsDatabaseVS.decrement_stat = function (self, id, ...)
	return
end

StatisticsDatabaseVS.increment_stat_and_sync_to_clients = function (self, stat_name)
	return
end

StatisticsDatabaseVS.modify_stat_by_amount = function (self, id, ...)
	return
end

StatisticsDatabaseVS.get_array_stat = function (self, id, ...)
	return nil
end

StatisticsDatabaseVS.get_persistent_array_stat = function (self, id, ...)
	return false
end

StatisticsDatabaseVS.set_array_stat = function (self, id, ...)
	return
end

StatisticsDatabaseVS.set_stat = function (self, id, ...)
	return
end

StatisticsDatabaseVS.get_stat = function (self, id, ...)
	return 1
end

StatisticsDatabaseVS.get_persistent_stat = function (self, id, ...)
	return 1
end

StatisticsDatabaseVS.sync_stats_to_server = function (self, stat_id, peer_id, local_player_id, network_transmit)
	return
end

StatisticsDatabaseVS.debug_draw = function (self)
	return
end

StatisticsDatabaseVS.rpc_increment_stat = function (self, channel_id, stat_id)
	return
end

StatisticsDatabaseVS.rpc_set_local_player_stat = function (self, channel_id, stat_id, amount)
	return
end

StatisticsDatabaseVS.rpc_sync_statistics_number = function (self, channel_id, peer_id, local_player_id, statistics_path_names, value, persistent_value)
	return
end

StatisticsDatabaseVS.get_all_stats = function (self, id)
	return {}
end

StatisticsDatabaseVS.get_local_stat = function (self, stat_name)
	return
end

StatisticsDatabaseVS.set_local_stat = function (self, stat_name, value)
	return
end

StatisticsDatabaseVS.increment_local_stat = function (self, stat_name)
	return
end

local DB_UNIT_TEST = false

if DB_UNIT_TEST then
	local old_debug = script_data.statistics_debug

	script_data.statistics_debug = true

	dbprintf("Running statistics unit test")

	local backend_stats = {
		kills_total = 10,
		lorebook_unlocks = "6F",
	}
	local sdb = StatisticsDatabaseVS:new()

	sdb:register("player1", "unit_test", backend_stats)
	assert(sdb:get_stat("player1", "kills_total") == 0)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 0)
	sdb:increment_stat("player1", "kills_total")
	sdb:increment_stat("player1", "profiles", "witch_hunter", "kills_total")
	assert(sdb:get_stat("player1", "kills_total") == 1)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 1)
	sdb:decrement_stat("player1", "kills_total")
	sdb:decrement_stat("player1", "profiles", "witch_hunter", "kills_total")
	assert(sdb:get_stat("player1", "kills_total") == 0)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 0)
	sdb:modify_stat_by_amount("player1", "kills_total", 5)
	sdb:modify_stat_by_amount("player1", "profiles", "witch_hunter", "kills_total", 5)
	assert(sdb:get_stat("player1", "kills_total") == 5)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 5)
	assert(sdb:get_array_stat("player1", "lorebook_unlocks", 1) == false)
	sdb:set_array_stat("player1", "lorebook_unlocks", 1, true)
	assert(sdb:get_array_stat("player1", "lorebook_unlocks", 1) == true)
	sdb:reset_session_stats()
	assert(sdb:get_stat("player1", "kills_total") == 0)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 0)
	assert(sdb:get_array_stat("player1", "lorebook_unlocks", 1) == false)

	local backend_stats_temp = {}

	sdb:generate_backend_stats("player1", backend_stats_temp)
	assert(backend_stats_temp.kills_total == tostring(15))
	assert(backend_stats_temp.lorebook_unlocks == "EF")
	sdb:unregister("player1")
	sdb:destroy()

	script_data.statistics_debug = old_debug
end
