-- chunkname: @scripts/network/lobby_aux.lua

LobbyAux = LobbyAux or {}

local function concatenate_dlcs()
	local concatenate_dlcs_str

	for name, _ in pairs(DLCSettings) do
		concatenate_dlcs_str = concatenate_dlcs_str and concatenate_dlcs_str .. "__" or ""
		concatenate_dlcs_str = concatenate_dlcs_str .. name
	end

	return concatenate_dlcs_str
end

LobbyAux.create_network_hash = function (config_file_name, project_hash, disable_print)
	local network_hash = Network.config_hash(config_file_name)
	local settings = Application.settings()
	local trunk_revision = settings and settings.content_revision
	local ignore_engine_revision = Development.parameter("ignore_engine_revision_in_network_hash") or Managers.mechanism:setting("ignore_engine_revision_in_network_hash")
	local engine_revision = ignore_engine_revision and 0 or Application.build_identifier()
	local combined_hash
	local use_trunk_revision = GameSettingsDevelopment.network_revision_check_enabled or trunk_revision ~= nil and trunk_revision ~= ""
	local concatenated_dlc_string = GameSettingsDevelopment.network_concatenated_dlc_check_enabled and concatenate_dlcs() or ""
	local lobby_data_version = DEDICATED_SERVER and GameServerInternal.lobby_data_version or LobbyInternal.lobby_data_version
	local num_levels = #NetworkLookup.level_keys

	if use_trunk_revision then
		fassert(trunk_revision, "No trunk_revision even though it needs to exist!")

		combined_hash = Application.make_hash(network_hash, trunk_revision, engine_revision, project_hash, concatenated_dlc_string, lobby_data_version, num_levels)

		if not disable_print then
			printf("[LobbyAux] Making combined_hash: %s from network_hash=%s, trunk_revision=%s, engine_revision=%s, project_hash=%s, lobby_data_version=%s, num_levels=%s", tostring(combined_hash), tostring(network_hash), tostring(trunk_revision), tostring(engine_revision), tostring(project_hash), tostring(lobby_data_version), tostring(num_levels))
		end
	else
		combined_hash = Application.make_hash(network_hash, engine_revision, project_hash, concatenated_dlc_string, lobby_data_version, num_levels)

		if not disable_print then
			printf("[LobbyAux] Making combined_hash: %s from network_hash=%s, engine_revision=%s, project_hash=%s, lobby_data_version=%s, num_levels=%s", tostring(combined_hash), tostring(network_hash), tostring(engine_revision), tostring(project_hash), tostring(lobby_data_version), tostring(num_levels))
		end
	end

	if not disable_print and not IS_CONSOLE then
		printf("GameServerAux.create_network_hash network_hash: %s, trunk_revision/content_revision: %s, ignore_engine_revision: %s, engine_revision: %s, , concatenated_dlc_string %s, use_trunk_revision %s, combined_hash %s, lobby_data_version=%s", network_hash, trunk_revision, ignore_engine_revision, engine_revision, concatenated_dlc_string, use_trunk_revision, combined_hash, tostring(lobby_data_version))
	end

	return combined_hash
end

LobbyFinderState = LobbyFinderState or {}
LobbyFinderState.SEARCHING = "searching"
LobbyFinderState.IDLE = "idle"
LobbyState = LobbyState or {}

if IS_XB1 then
	LobbyState.WORKING = "working"
	LobbyState.JOINED = "joined"
	LobbyState.FAILED = "failed"
	LobbyState.SHUTDOWN = "shutdown"
elseif IS_PS4 then
	LobbyState.WAITING_TO_CREATE = "waiting_to_create"
	LobbyState.CREATING = "creating"
	LobbyState.JOINING = "joining"
	LobbyState.JOINED = "joined"
	LobbyState.FAILED = "failed"
else
	LobbyState.CREATING = "creating"
	LobbyState.JOINING = "joining"
	LobbyState.JOINED = "joined"
	LobbyState.FAILED = "failed"
end

LobbyGameModes = {
	"adventure",
	"custom",
	"n/a",
	"tutorial",
	"event",
	"deed",
	"weave",
	"twitch",
}

local lookup = {}

for idx, game_mode in pairs(LobbyGameModes) do
	lookup[idx] = game_mode
	lookup[game_mode] = idx
end

LobbyGameModes = lookup
LobbyAux.map_lobby_distance_filter = IS_PS4 and {
	"close",
	"medium",
	"world",
} or {
	"close",
	"far",
	"world",
}

do
	local next_distance = {}

	for i = 1, #LobbyAux.map_lobby_distance_filter do
		local filter_name = LobbyAux.map_lobby_distance_filter[i]

		next_distance[filter_name] = LobbyAux.map_lobby_distance_filter[i + 1]
	end

	LobbyAux.next_distance_filter = next_distance
end

LobbyAux.get_next_lobby_distance_filter = function (current_filter, max_filter)
	if current_filter == max_filter then
		return
	end

	local next_filter_name = LobbyAux.next_distance_filter[current_filter]

	return next_filter_name
end

LobbyAux.get_unique_server_name = function ()
	local unique_name = Development.parameter("unique_server_name")

	if not unique_name or unique_name == "" then
		if rawget(_G, "Steam") then
			unique_name = Steam.user_name()
		elseif IS_XB1 then
			unique_name = LobbyInternal.SESSION_NAME
		else
			unique_name = Network.peer_id()
		end
	end

	return unique_name
end

LobbyAux.MAX_CUSTOM_SERVER_NAME_LENGTH = 32

local function level_exists_locally(lobby)
	local mission_id = lobby.selected_mission_id or lobby.mission_id
	local level_exists_locally = mission_id and rawget(NetworkLookup.mission_ids, mission_id)

	level_exists_locally = level_exists_locally or WeaveSettings.templates[mission_id] and true

	return level_exists_locally
end

local function difficulty_exists_locally(lobby)
	local difficulty = lobby.difficulty

	if not difficulty or not DifficultySettings[difficulty] then
		return false
	end

	return true
end

local function matchmaking_type_exists_locally(lobby)
	local matchmaking_type = tonumber(lobby.matchmaking_type)

	if not matchmaking_type or not NetworkLookup.matchmaking_types[matchmaking_type] then
		return false
	end

	return true
end

local function mechanism_exists_locally(lobby)
	local mechanism = lobby.mechanism

	if not mechanism or not MechanismSettings[mechanism] then
		return false
	end

	return true
end

LobbyAux.verify_lobby_data = function (lobby)
	if not level_exists_locally(lobby) then
		return false
	end

	if not difficulty_exists_locally(lobby) then
		return false
	end

	if not matchmaking_type_exists_locally(lobby) then
		return false
	end

	if not mechanism_exists_locally(lobby) then
		return false
	end

	return true
end

local LOBBY_SLOT_PARTY_SEPARATOR = ";"
local LOBBY_SLOT_PEER_SEPARATOR = ","
local LOBBY_SLOT_PEER_DATA_SEPARATOR = "="
local PEER_DATA_PEER_ID_INDEX = 1
local PEER_DATA_PROFILE_ID_INDEX = 2

LobbyAux.serialize_lobby_reservation_data = function (peer_data_by_party)
	local parties = {}

	for party_id = 1, #peer_data_by_party do
		local peer_datas = peer_data_by_party[party_id]

		for i = 1, #peer_datas do
			local peer_data = peer_datas[i]
			local peer_id = peer_data.peer_id
			local profile_index = peer_data.profile_index or -1

			peer_datas[i] = string.format("%s%s%d", peer_id, LOBBY_SLOT_PEER_DATA_SEPARATOR, profile_index)
		end

		parties[party_id] = table.concat(peer_datas, LOBBY_SLOT_PEER_SEPARATOR)
	end

	local packed_reservation_data = table.concat(parties, LOBBY_SLOT_PARTY_SEPARATOR)

	if packed_reservation_data == "" then
		packed_reservation_data = rawget(_G, "LobbyInternal") and LobbyInternal.default_lobby_data and LobbyInternal.default_lobby_data.reserved_profiles or ""
	end

	return packed_reservation_data
end

LobbyAux.deserialize_lobby_reservation_data = function (lobby_data, include_unreserved_peers)
	local reservation_data = {}
	local reserved_profiles = lobby_data.reserved_profiles

	reserved_profiles = reserved_profiles ~= "" and reserved_profiles or rawget(_G, "LobbyInternal") and LobbyInternal.default_lobby_data and LobbyInternal.default_lobby_data.reserved_profiles or ""

	local by_party = string.split(reserved_profiles, LOBBY_SLOT_PARTY_SEPARATOR)

	for party_id = 1, #by_party do
		local peer_datas = {}

		reservation_data[party_id] = peer_datas

		local by_peer = string.split(by_party[party_id], LOBBY_SLOT_PEER_SEPARATOR)

		for peer_i = 1, #by_peer do
			local peer_data = string.split(by_peer[peer_i], LOBBY_SLOT_PEER_DATA_SEPARATOR)
			local peer_id = peer_data[PEER_DATA_PEER_ID_INDEX]
			local profile_index = tonumber(peer_data[PEER_DATA_PROFILE_ID_INDEX])

			if profile_index == -1 then
				profile_index = nil
			end

			if profile_index or include_unreserved_peers then
				peer_datas[peer_i] = {
					peer_id = peer_id,
					profile_index = profile_index,
				}
			end
		end
	end

	return reservation_data
end
