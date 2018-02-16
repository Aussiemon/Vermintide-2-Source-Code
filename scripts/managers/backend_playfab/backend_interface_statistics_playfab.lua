local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceStatisticsPlayFab = class(BackendInterfaceStatisticsPlayFab)
BackendInterfaceStatisticsPlayFab.update = function (self, dt)
	return 
end

local function convert_to_script_stats(stats)
	local script_stats = {}

	for _, stat in pairs(stats) do
		script_stats[stat.StatisticName] = stat.Value
	end

	return script_stats
end

BackendInterfaceStatisticsPlayFab.init = function (self, mirror)
	self._mirror = mirror

	local function callback(result)
		if result.Error then
			table.dump(result, "PlayFabError", math.huge)
			fassert(false, "Error loading player statistics!")
		else
			print("Player statistics loaded!")

			local stats = convert_to_script_stats(result.Statistics)

			self._mirror:set_stats(stats)
		end

		self._ready = true

		return 
	end

	PlayFabClientApi.GetPlayerStatistics({}, callback, callback)

	return 
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

local function convert_to_playfab_stats(stats)
	local playfab_stats = {}

	for _, stat in pairs(stats) do
		playfab_stats[#playfab_stats + 1] = {
			StatisticName = stat.database_name,
			Value = stat.persistent_value
		}
	end

	return playfab_stats
end

local function clear_dirty_flag(stats)
	for _, stat in pairs(stats) do
		stat.dirty = false
	end

	return 
end

BackendInterfaceStatisticsPlayFab.save = function (self, save_callback)
	local player = Managers.player:local_player()

	if not player then
		print("No player found, skipping saving statistics...")

		return false
	end

	local player_stats_id = player.stats_id(player)
	local player_stats = Managers.player:statistics_db():get_all_stats(player_stats_id)
	local stats_to_save = filter_stats(flatten_stats(player_stats))

	self._mirror:set_stats(player_stats)

	if table.is_empty(stats_to_save) then
		print("No modified player statistics to save...")

		return false
	end

	local request = {
		FunctionName = "savePlayerStatistics",
		FunctionParameter = {
			stats = convert_to_playfab_stats(stats_to_save)
		}
	}

	local function request_callback(result)
		if result.Error then
			Application.warning("Error saving player statistics!")
			table.dump(result, "PlayFabError", math.huge)
			save_callback(false)
		else
			clear_dirty_flag(stats_to_save)
			print("Player statistics saved!")
			save_callback(true)
		end

		return 
	end

	PlayFabClientApi.ExecuteCloudScript(request, request_callback, request_callback)

	return true
end

return 
