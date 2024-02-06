-- chunkname: @scripts/managers/backend_playfab/backend_interface_statistics_playfab.lua

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

BackendInterfaceStatisticsPlayFab = class(BackendInterfaceStatisticsPlayFab)

BackendInterfaceStatisticsPlayFab.update = function (self, dt)
	return
end

BackendInterfaceStatisticsPlayFab.init = function (self, mirror)
	self._mirror = mirror
	self._request_queue = mirror:request_queue()

	local function success_callback(result)
		print("Player statistics loaded!")

		local stats = result.FunctionResult

		self._mirror:set_stats(stats)

		self._ready = true
	end

	local request = {
		FunctionName = "loadPlayerStatistics",
	}

	self._request_queue:enqueue(request, success_callback)
end

BackendInterfaceStatisticsPlayFab.ready = function (self)
	return self._ready
end

BackendInterfaceStatisticsPlayFab.get_stats = function (self)
	return self._mirror:get_stats()
end

local function flatten_stats(stats)
	local flattened_stats = {}

	for _, stat in pairs(stats) do
		if stat.value == nil then
			table.append(flattened_stats, flatten_stats(stat))
		else
			flattened_stats[#flattened_stats + 1] = stat
		end
	end

	return flattened_stats
end

local function filter_stats(stats)
	local filtered_stats = {}

	for _, stat in pairs(stats) do
		local d_name = stat.database_name
		local p_value = stat.persistent_value

		if d_name and type(p_value) == "number" and stat.dirty then
			filtered_stats[#filtered_stats + 1] = stat
		end
	end

	return filtered_stats
end

BackendInterfaceStatisticsPlayFab.clear_dirty_flags = function (self, stats)
	for _, stat in pairs(stats) do
		stat.dirty = false
	end
end

BackendInterfaceStatisticsPlayFab.save = function (self)
	local player_manager = Managers.player

	print("---------------------- BackendInterfaceStatisticsPlayFab:save ----------------------")

	if not player_manager then
		print("[BackendInterfaceStatisticsPlayFab] No player manager, skipping saving statistics...")

		return false
	end

	local player = player_manager:local_player()

	if not player then
		print("[BackendInterfaceStatisticsPlayFab] No player found, skipping saving statistics...")

		return false
	end

	local player_stats_id = player:stats_id()
	local player_stats = Managers.player:statistics_db():get_all_stats(player_stats_id)
	local stats_to_save = filter_stats(flatten_stats(player_stats))

	player_manager:set_stats_backend(player)

	self._stats_to_save = stats_to_save
end

BackendInterfaceStatisticsPlayFab.clear_saved_stats = function (self)
	self._stats_to_save = nil

	Managers.player:statistics_db():apply_persistant_stats()
end

BackendInterfaceStatisticsPlayFab.get_stat_save_request = function (self)
	local stats_to_save = self._stats_to_save

	if not stats_to_save or table.is_empty(stats_to_save) then
		print("[BackendInterfaceStatisticsPlayFab] No modified player statistics to save...")

		return false
	end

	local request = {
		FunctionName = "savePlayerStatistics3",
		FunctionParameter = {
			stats = stats_to_save,
		},
	}

	return request, stats_to_save
end

BackendInterfaceStatisticsPlayFab.reset = function (self)
	local player_manager = Managers.player

	if not player_manager then
		print("[BackendInterfaceStatisticsPlayFab] No player manager, skipping resetting statistics...")

		return false
	end

	local player = player_manager:local_player()

	if not player then
		print("[BackendInterfaceStatisticsPlayFab] No player found, skipping resetting statistics...")

		return false
	end

	local player_stats_id = player:stats_id()
	local stats_database = Managers.player:statistics_db()
	local player_stats = stats_database:get_all_stats(player_stats_id)
	local player_stats_flattened = flatten_stats(player_stats)
	local stats_to_reset = {}

	for name, properties in pairs(player_stats_flattened) do
		if properties.database_name and properties.source == nil then
			stats_to_reset[#stats_to_reset + 1] = properties.database_name
		end
	end

	local request = {
		FunctionName = "devResetPlayerStatistics",
		FunctionParameter = {
			stats = stats_to_reset,
		},
	}

	local function success_callback(result)
		print("[BackendInterfaceStatisticsPlayFab] Player statistics resetted!")
	end

	self._request_queue:enqueue(request, success_callback)
end
