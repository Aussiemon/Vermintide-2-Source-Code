local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceStatisticsPlayFab = class(BackendInterfaceStatisticsPlayFab)

BackendInterfaceStatisticsPlayFab.update = function (self, dt)
	return
end

BackendInterfaceStatisticsPlayFab.init = function (self, mirror)
	self._mirror = mirror

	local function callback(result)
		if result.Error then
			table.dump(result, "PlayFabError", math.huge)
			fassert(false, "Error loading player statistics!")
		else
			print("Player statistics loaded!")

			local stats = result.FunctionResult

			self._mirror:set_stats(stats)
		end

		self._ready = true
	end

	local request = {
		FunctionName = "loadPlayerStatistics"
	}

	PlayFabClientApi.ExecuteCloudScript(request, callback, callback)
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

local function clear_dirty_flag(stats)
	for _, stat in pairs(stats) do
		stat.dirty = false
	end
end

BackendInterfaceStatisticsPlayFab.save = function (self)
	local player_manager = Managers.player

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
end

BackendInterfaceStatisticsPlayFab.get_stat_save_request = function (self, save_callback)
	local stats_to_save = self._stats_to_save

	if not stats_to_save or table.is_empty(stats_to_save) then
		print("[BackendInterfaceStatisticsPlayFab] No modified player statistics to save...")

		return false
	end

	return self:_create_save_request(stats_to_save, save_callback)
end

BackendInterfaceStatisticsPlayFab._create_save_request = function (self, stats, save_callback)
	local request = {
		FunctionName = "savePlayerStatistics3",
		FunctionParameter = {
			stats = stats
		}
	}

	local function request_callback(on_complete, result)
		if result.Error then
			Application.warning("[BackendInterfaceStatisticsPlayFab] Error saving player statistics!")
			table.dump(result, "PlayFabError", math.huge)
			save_callback(on_complete, false)
		else
			local function_result = result.FunctionResult

			if function_result and function_result.eac_failed_verification then
				Managers.backend:playfab_eac_error()

				return
			end

			clear_dirty_flag(stats)
			print("[BackendInterfaceStatisticsPlayFab] Player statistics saved!")
			save_callback(on_complete, true)
		end
	end

	return {
		payload = table.clone(request),
		callback = function (payload, on_complete)
			PlayFabClientApi.ExecuteCloudScript(payload, callback(request_callback, on_complete), callback(request_callback, on_complete))
		end
	}
end

return
