-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2025/geheimnisnacht_utils.lua

local map_settings = require("scripts/settings/dlcs/geheimnisnacht_2025/geheimnisnacht_map_settings")
local GeheimnisnachtUtils = {}
local maps_by_year = {
	[2021] = {
		"dlc_portals",
		"bell",
		"military",
		"dlc_castle",
		"ussingen",
	},
	[2022] = {
		"catacombs",
		"mines",
		"ground_zero",
		"elven_ruins",
		"farmlands",
	},
	[2023] = {
		"warcamp",
		"nurgle",
		"dlc_wizards_tower",
		"dlc_bastion",
		"dlc_dwarf_beacons",
	},
	[2024] = {
		"dlc_dwarf_whaling",
		"catacombs",
		"ground_zero",
		"elven_ruins",
		"farmlands",
	},
	[2025] = {
		"dlc_termite_1",
		"military",
		"mines",
		"warcamp",
		"dlc_portals",
	},
}

GeheimnisnachtUtils._cached_maps_by_event = {}

for year, maps in pairs(maps_by_year) do
	GeheimnisnachtUtils._cached_maps_by_event["geheimnisnacht_" .. year] = maps
end

GeheimnisnachtUtils.event_by_year = function (year)
	return "geheimnisnacht_" .. year
end

GeheimnisnachtUtils.maps_by_year = function (year, allow_fallback)
	local event = GeheimnisnachtUtils.event_by_year(year)

	return GeheimnisnachtUtils.maps_by_event(event, allow_fallback)
end

GeheimnisnachtUtils.maps_by_event = function (event_name, allow_fallback)
	if GeheimnisnachtUtils._cached_maps_by_event[event_name] then
		return GeheimnisnachtUtils._cached_maps_by_event[event_name]
	end

	if not allow_fallback then
		return
	end

	local seed = HashUtils.fnv32_hash(event_name)
	local level_names = table.keys(map_settings)
	local random_maps = {}

	for i = 1, 5 do
		local map_idx

		seed, map_idx = Math.next_random(seed, 1, #level_names)
		random_maps[i] = level_names[map_idx]

		table.remove(level_names, map_idx)
	end

	GeheimnisnachtUtils._cached_maps_by_event[event_name] = random_maps

	return random_maps
end

GeheimnisnachtUtils.maps_by_live_event = function (allow_fallback)
	local live_events_interface = Managers.backend:get_interface("live_events")
	local live_events = live_events_interface and live_events_interface:get_active_events()

	if live_events then
		for i = 1, #live_events do
			local live_event = live_events[i]

			if string.find(live_event, "geheimnisnacht_%d+") then
				return GeheimnisnachtUtils.maps_by_event(live_event, allow_fallback)
			end
		end
	end

	if allow_fallback then
		return {}
	end
end

return GeheimnisnachtUtils
