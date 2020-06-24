require("scripts/managers/backend/statistics_util")
require("scripts/managers/backend/statistics_definitions")

local function convert_from_backend(raw_value, database_type)
	if database_type == nil then
		return tonumber(raw_value)
	elseif database_type == "string" then
		return raw_value
	elseif database_type == "hexarray" then
		local value = {}
		local value_n = 0
		local floor = math.floor

		for hex_char in raw_value:gmatch(".") do
			local hex_value = tonumber(hex_char, 16)

			for i = 4, 1, -1 do
				local hex_temp = hex_value / 2
				hex_value = floor(hex_temp)
				local new_value_n = value_n + i
				value[new_value_n] = (hex_value ~= hex_temp and true) or false
			end

			value_n = value_n + 4
		end

		return value
	end

	assert(false, "Unknown database_type %s for value %s", tostring(database_type), tostring(raw_value))
end

local function convert_to_backend(value, database_type)
	if database_type == nil then
		return tostring(value)
	elseif database_type == "string" then
		return value
	elseif database_type == "hexarray" then
		local raw_value = ""
		local value_n = #value

		assert(value_n % 4 == 0, "Incorrectly stored statistic")

		for i = 1, value_n, 4 do
			local dec_value = 0

			for j = 0, 3, 1 do
				dec_value = dec_value * 2 + ((value[i + j] == true and 1) or 0)
			end

			local hex_value = string.format("%X", dec_value)
			raw_value = raw_value .. hex_value
		end

		return raw_value
	end

	assert(false, "Unknown database_type %s for value %s", tostring(database_type), tostring(value))
end

local function dbprintf(...)
	if script_data.statistics_debug then
		printf(...)
	end
end

StatisticsDatabase = class(StatisticsDatabase)

StatisticsDatabase.init = function (self)
	self.statistics = {}
	self.categories = {}
end

StatisticsDatabase.destroy = function (self)
	local stat_id = next(self.statistics)

	fassert(stat_id == nil, "Destroying stats manager without properly cleaning up first. Stat id %s not unregistered.", tostring(stat_id))
end

local RPCS = {
	"rpc_sync_statistics_number",
	"rpc_increment_stat",
	"rpc_increment_stat_group",
	"rpc_set_local_player_stat"
}

StatisticsDatabase.register_network_event_delegate = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

StatisticsDatabase.unregister_network_event_delegate = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

local function init_backend_stat(stat, backend_stats)
	local name = stat.name
	local database_name = stat.database_name

	if name then
		if database_name then
			local backend_raw_value = backend_stats[database_name]

			if backend_raw_value then
				stat.persistent_value = convert_from_backend(backend_raw_value, stat.database_type)
			else
				stat.persistent_value = 0
			end
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			init_backend_stat(stat_definition, backend_stats)
		end
	end
end

local function init_stat(stat)
	if stat.value then
		stat.default_value = stat.value
	else
		for stat_name, stat_definition in pairs(stat) do
			init_stat(stat_definition)
		end
	end
end

StatisticsDatabase.register = function (self, id, category, backend_stats)
	dbprintf("StatisticsDatabase: Registering id=%s as %s", tostring(id), category)
	assert(self.statistics[id] == nil, "There were statistics for %s already.", tostring(id))

	local definitions = StatisticsDefinitions[category]
	local stats = table.clone(definitions)

	init_stat(stats)

	if backend_stats then
		init_backend_stat(stats, backend_stats)
	end

	self.statistics[id] = stats
	self.categories[id] = category
end

StatisticsDatabase.unregister = function (self, id)
	dbprintf("StatisticsDatabase: Unregistering id=%s", tostring(id))

	self.statistics[id] = nil
	self.categories[id] = nil
end

StatisticsDatabase.is_registered = function (self, id)
	return self.statistics[id]
end

local function unnetworkified_path(networkified_path)
	local path = {}

	for i, id in ipairs(networkified_path) do
		path[i] = NetworkLookup.statistics_path_names[id]
	end

	return path
end

local function networkified_path(path)
	local networkified_path = {}

	for id, name in ipairs(path) do
		networkified_path[id] = NetworkLookup.statistics_path_names[name]
	end

	return networkified_path
end

local function cap_sync_value(value)
	local max_size = 65535

	if value > max_size then
		Application.warning(string.format("Trying to sync value exceeding maximum size %d > %d", value, max_size))
		print(Script.callstack())

		value = max_size
	end

	return value
end

local function sync_stat(peer_id, stat_peer_id, stat_local_player_id, path, path_step, stat)
	if stat.value then
		if stat.sync_on_hot_join then
			fassert(type(stat.value) == "number", "Not supporting hot join syncing of value %q", type(stat.value))
			fassert(path_step <= NetworkConstants.statistics_path_max_size, "statistics path is longer than max size, increase in global.networks_config")

			local default_value = stat.default_value

			if stat.value ~= default_value or (stat.persistent_value and stat.persistent_value ~= default_value) then
				local networkified_path = networkified_path(path)

				RPC.rpc_sync_statistics_number(peer_id, stat_peer_id, stat_local_player_id, networkified_path, cap_sync_value(stat.value), cap_sync_value(stat.persistent_value or 0))
			end
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			path[path_step] = stat_name

			sync_stat(peer_id, stat_peer_id, stat_local_player_id, path, path_step + 1, stat_definition)
		end
	end

	path[path_step] = nil
end

local function sync_stat_to_server(network_transmit, stat_peer_id, stat_local_player_id, path, path_step, stat)
	if stat.value then
		if stat.sync_to_host then
			fassert(type(stat.persistent_value) == "number", "Not supporting hot join syncing of value %q", type(stat.persistent_value))
			fassert(path_step <= NetworkConstants.statistics_path_max_size, "statistics path is longer than max size, increase in global.networks_config")

			local default_value = stat.default_value

			if stat.value ~= default_value or (stat.persistent_value and stat.persistent_value ~= default_value) then
				local networkified_path = networkified_path(path)

				network_transmit:send_rpc_server("rpc_sync_statistics_number", stat_peer_id, stat_local_player_id, networkified_path, cap_sync_value(stat.value), cap_sync_value(stat.persistent_value))
			end
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			path[path_step] = stat_name

			sync_stat_to_server(network_transmit, stat_peer_id, stat_local_player_id, path, path_step + 1, stat_definition)
		end
	end

	path[path_step] = nil
end

StatisticsDatabase.hot_join_sync = function (self, peer_id)
	for stat_id, category in pairs(self.categories) do
		if category == "player" then
			local player = Managers.player:player_from_stats_id(stat_id)
			local stats = self.statistics[stat_id]

			sync_stat(peer_id, player:network_id(), player:local_player_id(), {}, 1, stats)
		elseif category == "session" then
		end
	end
end

local function reset_stat(stat)
	if stat.value then
		if stat.database_type == nil then
			stat.value = 0
		elseif stat.database_type == "hexarray" then
			for i = 1, #stat.value, 1 do
				stat.value[i] = false
			end
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			reset_stat(stat_definition)
		end
	end
end

StatisticsDatabase.reset_session_stats = function (self)
	dbprintf("StatisticsDatabase: Resetting all session stats")

	for id, category in pairs(self.categories) do
		local stats = self.statistics[id]

		reset_stat(stats)
	end
end

local function generate_backend_stats(stat, backend_stats)
	if stat.value then
		local database_name = stat.database_name

		if database_name then
			backend_stats[database_name] = convert_to_backend(stat.persistent_value, stat.database_type)
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			generate_backend_stats(stat_definition, backend_stats)
		end
	end
end

StatisticsDatabase.generate_backend_stats = function (self, id, backend_stats)
	local stats = self.statistics[id]
	local category = self.categories[id]

	print("generate_backend_stats", id)
	assert(next(backend_stats) == nil, "Got non-empty table")
	generate_backend_stats(stats, backend_stats)

	return backend_stats
end

StatisticsDatabase.increment_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	stat.value = stat.value + 1

	if stat.persistent_value then
		stat.dirty = true
		stat.persistent_value = stat.persistent_value + 1
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("event_stat_incremented", id, ...)
	end

	dbprintf("StatisticsDatabase: Incremented stat %s for id=%s to %f", stat.name, tostring(id), stat.value)
end

StatisticsDatabase.decrement_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	stat.value = stat.value - 1

	if stat.persistent_value then
		stat.dirty = true
		stat.persistent_value = stat.persistent_value - 1
	end

	dbprintf("StatisticsDatabase: Decremented stat %s for id=%s to %f", stat.name, tostring(id), stat.value)
end

StatisticsDatabase.increment_stat_and_sync_to_clients = function (self, stat_name)
	local player_manager = Managers.player
	local player = player_manager:local_player()

	if player then
		local saved_stat = self:get_persistent_stat(player:stats_id(), stat_name)

		self:set_stat(player:stats_id(), stat_name, saved_stat + 1)
	end

	local network_manager = Managers.state.network
	local stat_id = NetworkLookup.statistics[stat_name]

	network_manager.network_transmit:send_rpc_clients("rpc_increment_stat", stat_id)
end

StatisticsDatabase.modify_stat_by_amount = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n - 1, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	local increment_value = select(arg_n, ...)
	local old_value = stat.value
	stat.value = old_value + increment_value

	if stat.persistent_value then
		stat.dirty = increment_value ~= 0
		stat.persistent_value = stat.persistent_value + increment_value
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("event_stat_modified_by", id, ...)
	end

	dbprintf("StatisticsDatabase: Modified stat %s for id=%s from %f to %f", stat.name, tostring(id), old_value, old_value + increment_value)
end

StatisticsDatabase.get_array_stat = function (self, id, ...)
	local array_stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n - 1, 1 do
		local arg_value = select(i, ...)
		array_stat = array_stat[arg_value]
	end

	local array_index = select(arg_n, ...)

	return array_stat.value[array_index]
end

StatisticsDatabase.get_persistent_array_stat = function (self, id, ...)
	local array_stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n - 1, 1 do
		local arg_value = select(i, ...)
		array_stat = array_stat[arg_value]
	end

	local array_index = select(arg_n, ...)

	if array_stat.persistent_value then
		return array_stat.persistent_value[array_index]
	end

	return false
end

StatisticsDatabase.set_array_stat = function (self, id, ...)
	local array_stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n - 2, 1 do
		local arg_value = select(i, ...)
		array_stat = array_stat[arg_value]
	end

	local array_index = select(arg_n - 1, ...)
	local new_stat_value = select(arg_n, ...)
	array_stat.value[array_index] = new_stat_value

	if array_stat.persistent_value then
		array_stat.persistent_value[array_index] = new_stat_value
	end

	dbprintf("StatisticsDatabase: Set array stat %s[%s] for id=%s to %s", array_stat.name, tostring(array_index), tostring(id), tostring(new_stat_value))
end

StatisticsDatabase.set_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n - 1, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	local new_value = select(arg_n, ...)
	stat.dirty = stat.value ~= new_value
	stat.value = new_value
	stat.persistent_value = new_value
end

StatisticsDatabase.get_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	return stat.value
end

StatisticsDatabase.has_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]

		if not stat then
			return false
		end
	end

	return true
end

StatisticsDatabase.get_persistent_stat = function (self, id, ...)
	local stat = self.statistics[id]
	local arg_n = select("#", ...)

	for i = 1, arg_n, 1 do
		local arg_value = select(i, ...)
		stat = stat[arg_value]
	end

	if stat then
		return stat.persistent_value
	end

	local error = "No persistent stat found for arguments \""

	for i = 1, arg_n, 1 do
		error = error .. "%s"

		if i < arg_n then
			error = error .. ","
		end

		if i ~= arg_n then
			error = error .. " "
		end
	end

	error = error .. "\""

	fassert(stat, error, unpack({
		...
	}))
end

StatisticsDatabase.sync_stats_to_server = function (self, stat_id, peer_id, local_player_id, network_transmit)
	local stats = self.statistics[stat_id]

	sync_stat_to_server(network_transmit, peer_id, local_player_id, {}, 1, stats)
end

local function debug_draw_stat(name, stat, indent_level)
	local stat_type = type(stat)

	if stat_type == "number" then
		if math.ceil(stat) == stat then
			Debug.text("%s%s = %d", string.rep(" ", indent_level * 2), name, stat)
		else
			Debug.text("%s%s = %.2f", string.rep(" ", indent_level * 2), name, stat)
		end
	elseif stat_type == "table" then
		Debug.text("%s%s", string.rep(" ", indent_level * 2), name, stat)

		for k, v in pairs(stat) do
			debug_draw_stat(k, v, indent_level + 1)
		end
	end
end

StatisticsDatabase.debug_draw = function (self)
	if not script_data.statistics_debug then
		return
	end

	for stats_id, stats in pairs(self.statistics) do
		Debug.text("Stats for %s", tostring(stats_id))

		for k, v in pairs(stats) do
			debug_draw_stat(k, v, 1)
		end
	end
end

StatisticsDatabase.rpc_increment_stat = function (self, sender, stat_id)
	local stat = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	self:increment_stat(stats_id, stat)
end

StatisticsDatabase.rpc_increment_stat_group = function (self, sender, group_id, stat_id)
	local stat_group_name = NetworkLookup.statistics_group_name[group_id]
	local stat_name = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	self:increment_stat(stats_id, stat_group_name, stat_name)
end

StatisticsDatabase.rpc_set_local_player_stat = function (self, sender, stat_id, amount)
	local stat = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()
	local old_amount = self:get_stat(stats_id, stat)

	if old_amount < amount then
		self:set_stat(stats_id, stat, amount)
	end
end

StatisticsDatabase.rpc_sync_statistics_number = function (self, sender, peer_id, local_player_id, statistics_path_names, value, persistent_value)
	local player = Managers.player:player(peer_id, local_player_id)
	local stats_id = player:stats_id()
	local path = unnetworkified_path(statistics_path_names)
	local stat = self.statistics[stats_id]

	for i = 1, #path, 1 do
		stat = stat[path[i]]
	end

	stat.value = value

	if stat.database_name then
		stat.persistent_value = persistent_value

		dbprintf("StatisticsDatabase: Synced peer %q stat %30q to %d, persistent_value to %d", peer_id, stat.name, value, persistent_value)
	else
		fassert(persistent_value == 0, "Got non-zero persistent_value for stat %q that didn't have database_name", stat.name)
		dbprintf("StatisticsDatabase: Synced peer %q stat %30q to %d, persistent_value not present", peer_id, stat.name, value)
	end
end

StatisticsDatabase.get_all_stats = function (self, id)
	return self.statistics[id]
end

local DB_UNIT_TEST = false

if DB_UNIT_TEST then
	local old_debug = script_data.statistics_debug
	script_data.statistics_debug = true

	dbprintf("Running statistics unit test")

	local backend_stats = {
		kills_total = 10,
		lorebook_unlocks = "6F"
	}
	local sdb = StatisticsDatabase:new()

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

return
