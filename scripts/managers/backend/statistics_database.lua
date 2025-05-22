-- chunkname: @scripts/managers/backend/statistics_database.lua

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

				value[new_value_n] = hex_value ~= hex_temp and true or false
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

			for j = 0, 3 do
				dec_value = dec_value * 2 + (value[i + j] == true and 1 or 0)
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

local CATEGORY = "player"

StatisticsDatabase = class(StatisticsDatabase)

StatisticsDatabase.init = function (self)
	self.statistics = {}
	self.local_statistics = {}
end

StatisticsDatabase.destroy = function (self)
	local stat_id = next(self.statistics)

	fassert(stat_id == nil, "Destroying stats manager without properly cleaning up first. Stat id %s not unregistered.", tostring(stat_id))
end

local RPCS = {
	"rpc_sync_statistics_number",
	"rpc_increment_stat",
	"rpc_increment_stat_group",
	"rpc_set_local_player_stat",
	"rpc_modify_stat",
	"rpc_increment_stat_party",
}

StatisticsDatabase.register_network_event_delegate = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

StatisticsDatabase.unregister_network_event_delegate = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

StatisticsDatabase._init_backend_stat = function (self, definition, backend_stats)
	local initiated_stat
	local name = definition.name

	if name then
		local database_name = definition.database_name

		if database_name then
			local backend_raw_value = backend_stats[database_name]

			if backend_raw_value then
				initiated_stat = self:_init_stat(definition, convert_from_backend(backend_raw_value, definition.database_type))
			end
		end
	else
		for stat_name, stat_data in pairs(definition) do
			local child_stat = self:_init_backend_stat(definition[stat_name], backend_stats)

			if child_stat then
				initiated_stat = initiated_stat or {}
				initiated_stat[stat_name] = child_stat
			end
		end
	end

	return initiated_stat
end

StatisticsDatabase._init_stat = function (self, definition, persistent_value)
	local stat = table.clone(definition)

	stat.default_value = stat.value

	if definition.database_name then
		stat.persistent_value = persistent_value or stat.value or 0
		stat.persistent_value_mirror = stat.persistent_value
	end

	return stat
end

StatisticsDatabase.register = function (self, id, category, backend_stats)
	dbprintf("StatisticsDatabase: Registering id=%s as %s", tostring(id), category)
	assert(self.statistics[id] == nil, "There were statistics for %s already.", tostring(id))

	local definitions = StatisticsDefinitions[category]
	local stats

	if backend_stats then
		stats = self:_init_backend_stat(definitions, backend_stats)
	end

	self.statistics[id] = stats or {}
end

StatisticsDatabase.unregister = function (self, id)
	dbprintf("StatisticsDatabase: Unregistering id=%s", tostring(id))

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("statistics_database_unregister_player", id)
	end

	self.statistics[id] = nil
end

StatisticsDatabase.is_registered = function (self, id)
	return self.statistics[id]
end

local path_scratch = {}

local function unnetworkified_path(networkified_path)
	local path_n = #networkified_path

	for i = 1, path_n do
		local name_id = networkified_path[i]

		path_scratch[i] = NetworkLookup.statistics_path_names[name_id]
	end

	for i = path_n + 1, #path_scratch do
		path_scratch[i] = nil
	end

	return path_scratch
end

local function networkified_path(path)
	local out = {}

	for i = 1, #path do
		local name = path[i]

		out[i] = NetworkLookup.statistics_path_names[name]
	end

	return out
end

local function cap_sync_value(value)
	local max_size = 65535

	if max_size < value then
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

			if stat.value ~= default_value or stat.persistent_value and stat.persistent_value ~= default_value then
				local net_path = networkified_path(path)
				local channel_id = PEER_ID_TO_CHANNEL[peer_id]

				RPC.rpc_sync_statistics_number(channel_id, stat_peer_id, stat_local_player_id, net_path, cap_sync_value(stat.value), cap_sync_value(stat.persistent_value or 0))
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

			if stat.value ~= default_value or stat.persistent_value and stat.persistent_value ~= default_value then
				local net_path = networkified_path(path)

				network_transmit:send_rpc_server("rpc_sync_statistics_number", stat_peer_id, stat_local_player_id, net_path, cap_sync_value(stat.value), cap_sync_value(stat.persistent_value))
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
	for stat_id, stats in pairs(self.statistics) do
		local player = Managers.player:player_from_stats_id(stat_id)

		sync_stat(peer_id, player:network_id(), player:local_player_id(), {}, 1, stats)
	end
end

StatisticsDatabase._create_stat = function (self, stats, arg_n, ...)
	local stat = stats
	local definition = StatisticsDefinitions[CATEGORY]

	for i = 1, arg_n - 1 do
		local arg_value = select(i, ...)

		definition = definition[arg_value]

		local next_stat = stat[arg_value] or {}

		stat[arg_value] = next_stat
		stat = next_stat
	end

	local last_arg = select(arg_n, ...)

	definition = definition[last_arg]

	local initiated_stat = self:_init_stat(definition)

	stat[last_arg] = initiated_stat

	return initiated_stat
end

StatisticsDatabase._get_or_create_stat = function (self, id, offset, ...)
	local stats = self.statistics[id]
	local stat = stats
	local arg_n = select("#", ...) - (offset or 0)

	for i = 1, arg_n do
		local arg_value = select(i, ...)

		stat = stat[arg_value]

		if not stat then
			return self:_create_stat(stats, arg_n, ...), arg_n
		end
	end

	return stat, arg_n
end

local function reset_stat(stat)
	if stat.value then
		if stat.database_type == "hexarray" then
			for i = 1, #stat.value do
				stat.value[i] = false
			end
		else
			stat.value = stat.persistent_value or stat.default_value or 0
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			reset_stat(stat_definition)
		end
	end
end

StatisticsDatabase.reset_session_stats = function (self)
	dbprintf("StatisticsDatabase: Resetting all session stats")

	for _, stats in pairs(self.statistics) do
		reset_stat(stats)
	end

	table.clear(self.local_statistics)
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

	assert(table.is_empty(backend_stats), "Got non-empty table")
	generate_backend_stats(stats, backend_stats)

	return backend_stats
end

StatisticsDatabase.increment_stat = function (self, id, ...)
	local stat = self:_get_or_create_stat(id, 0, ...)

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
	local stat = self:_get_or_create_stat(id, 0, ...)

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
	local stat, arg_n = self:_get_or_create_stat(id, 1, ...)
	local increment_value = select(arg_n + 1, ...)
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

StatisticsDatabase.get_persistent_array_stat = function (self, id, ...)
	local array_stat, last_idx = self:_get_or_create_stat(id, 1, ...)
	local array_index = select(last_idx + 1, ...)

	if array_stat.persistent_value then
		return array_stat.persistent_value[array_index]
	end

	return false
end

StatisticsDatabase.set_array_stat = function (self, id, ...)
	local array_stat, last_idx = self:_get_or_create_stat(id, 2, ...)
	local array_index = select(last_idx + 1, ...)
	local new_stat_value = select(last_idx + 2, ...)

	array_stat.value[array_index] = new_stat_value

	if array_stat.persistent_value then
		array_stat.persistent_value[array_index] = new_stat_value
	end

	dbprintf("StatisticsDatabase: Set array stat %s[%s] for id=%s to %s", array_stat.name, tostring(array_index), tostring(id), tostring(new_stat_value))
end

StatisticsDatabase.set_stat = function (self, id, ...)
	local stat, arg_n = self:_get_or_create_stat(id, 1, ...)
	local new_value = select(arg_n + 1, ...)

	stat.dirty = stat.value ~= new_value
	stat.value = new_value
	stat.persistent_value = new_value
end

StatisticsDatabase.set_non_persistent_stat = function (self, id, ...)
	local stat, arg_n = self:_get_or_create_stat(id, 1, ...)
	local new_value = select(arg_n + 1, ...)

	stat.dirty = stat.value ~= new_value
	stat.value = new_value
end

StatisticsDatabase._get_stat = function (self, stat, ...)
	local arg_n = select("#", ...)

	for i = 1, arg_n do
		local arg_value = select(i, ...)

		stat = stat[arg_value]

		if not stat then
			return nil
		end
	end

	return stat
end

StatisticsDatabase.get_stat = function (self, id, ...)
	local stat = self:_get_or_create_stat(id, 0, ...)

	return stat and stat.value or 0
end

StatisticsDatabase.has_stat = function (self, ...)
	local definition = StatisticsDefinitions[CATEGORY]

	return not not self:_get_stat(definition, ...)
end

StatisticsDatabase.get_persistent_stat = function (self, id, ...)
	local stat = self.statistics[id]

	stat = self:_get_stat(stat, ...)

	if stat then
		return stat.persistent_value
	else
		local definition = self:_get_stat(StatisticsDefinitions[CATEGORY], ...)

		if not definition then
			ferror("[StatisticsDatabase] Failed fetching statistic using parameters: %s", table.concat({
				...,
			}, ", "))
		end

		if definition.database_name then
			return definition.value
		end
	end

	return nil
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

StatisticsDatabase.rpc_increment_stat = function (self, channel_id, stat_id)
	local stat = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	self:increment_stat(stats_id, stat)
end

StatisticsDatabase.rpc_increment_stat_group = function (self, channel_id, group_id, stat_id)
	local stat_group_name = NetworkLookup.statistics_group_name[group_id]
	local stat_name = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	self:increment_stat(stats_id, stat_group_name, stat_name)
end

StatisticsDatabase.rpc_increment_stat_party = function (self, channel_id, stat_id)
	if Managers.state.network.is_server then
		local network_transmit = Managers.state.network.network_transmit
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		network_transmit:send_rpc_clients_except("rpc_increment_stat_party", peer_id, stat_id)
	end

	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()
	local stat_name = NetworkLookup.statistics[stat_id]

	self:increment_stat(stats_id, stat_name)
end

StatisticsDatabase.rpc_set_local_player_stat = function (self, channel_id, stat_id, amount)
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

StatisticsDatabase.rpc_sync_statistics_number = function (self, channel_id, peer_id, local_player_id, statistics_path_names, value, persistent_value)
	local player = Managers.player:player(peer_id, local_player_id)
	local stats_id = player:stats_id()
	local path = unnetworkified_path(statistics_path_names)
	local stat = self:_get_or_create_stat(stats_id, 0, unpack(path))

	stat.value = value

	if stat.database_name then
		stat.persistent_value = persistent_value

		dbprintf("StatisticsDatabase: Synced peer %q stat %30q to %d, persistent_value to %d", peer_id, stat.name, value, persistent_value)
	else
		fassert(persistent_value == 0, "Got non-zero persistent_value for stat %q that didn't have database_name", stat.name)
		dbprintf("StatisticsDatabase: Synced peer %q stat %30q to %d, persistent_value not present", peer_id, stat.name, value)
	end
end

StatisticsDatabase.rpc_modify_stat = function (self, channel_id, stat_id, amount)
	local stat = NetworkLookup.statistics[stat_id]
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local stats_id = player:stats_id()

	self:modify_stat_by_amount(stats_id, stat, amount)
end

StatisticsDatabase.get_all_stats = function (self, id)
	return self.statistics[id]
end

StatisticsDatabase.get_local_stat = function (self, stat_name)
	return self.local_statistics[stat_name]
end

StatisticsDatabase.set_local_stat = function (self, stat_name, value)
	self.local_statistics[stat_name] = value
end

StatisticsDatabase.increment_local_stat = function (self, stat_name)
	if not self.local_statistics[stat_name] then
		self.local_statistics[stat_name] = 0
	end

	self.local_statistics[stat_name] = self.local_statistics[stat_name] + 1
end

local function apply_persistant_stat(stat)
	if stat.value then
		if stat.persistent_value and stat.dirty then
			if stat.database_type == "hexarray" then
				for i = 1, #stat.persistent_value do
					stat.persistent_value_mirror[i] = stat.persistent_value[i]
				end
			else
				stat.persistent_value_mirror = stat.persistent_value
			end
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			apply_persistant_stat(stat_definition)
		end
	end
end

StatisticsDatabase.apply_persistant_stats = function (self)
	dbprintf("StatisticsDatabase: Applying all session stats")

	for _, stats in pairs(self.statistics) do
		apply_persistant_stat(stats)
	end
end

local function reset_persistant_stat(stat)
	if stat.value then
		if stat.persistent_value and stat.dirty then
			if stat.database_type == "hexarray" then
				for i = 1, #stat.persistent_value do
					stat.persistent_value[i] = stat.persistent_value_mirror[i]
					stat.value[i] = stat.persistent_value[i] or false
				end
			else
				stat.persistent_value = stat.persistent_value_mirror
				stat.value = stat.persistent_value or stat.default_value or 0
			end

			stat.dirty = false
		end
	else
		for stat_name, stat_definition in pairs(stat) do
			reset_persistant_stat(stat_definition)
		end
	end
end

StatisticsDatabase.reset_persistant_stats = function (self)
	dbprintf("StatisticsDatabase: Reseting all session stats")

	for id, category in pairs(self.statistics) do
		local stats = self.statistics[id]

		reset_persistant_stat(stats)
	end
end

local DB_UNIT_TEST = false

if DB_UNIT_TEST then
	local real_category = CATEGORY

	CATEGORY = "unit_test"

	local old_debug = script_data.statistics_debug

	script_data.statistics_debug = true

	dbprintf("Running statistics unit test")

	local backend_stats = {
		kills_total = 10,
		lorebook_unlocks = "6F",
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
	sdb:reset_session_stats()
	assert(sdb:get_stat("player1", "kills_total") == 0)
	assert(sdb:get_stat("player1", "profiles", "witch_hunter", "kills_total") == 0)

	local backend_stats_temp = {}

	sdb:generate_backend_stats("player1", backend_stats_temp)
	assert(backend_stats_temp.kills_total == tostring(15))
	assert(backend_stats_temp.lorebook_unlocks == "EF")
	sdb:unregister("player1")
	sdb:destroy()

	script_data.statistics_debug = old_debug
	CATEGORY = real_category
end
