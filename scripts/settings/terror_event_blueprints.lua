-- chunkname: @scripts/settings/terror_event_blueprints.lua

require("scripts/settings/terror_events/terror_event_utils")
require("scripts/settings/terror_events/terror_events_generic")

WeightedRandomTerrorEvents = {}
TerrorEventBlueprints = {}

local function fetch_terror_events(key, override_file_ending)
	local file_ending = override_file_ending or key
	local file_path = "scripts/settings/terror_events/terror_events_" .. file_ending

	fassert(Application.can_get("lua", file_path), "Failed to load terror events for level %s with path %s NOTE: Make sure the terror events file is in scripts/settings/terror_events/ with the name terror_events_%s.", key, file_path, file_ending)

	local terror_events, weighted_random_terror_events = unpack(local_require(file_path))

	TerrorEventBlueprints[key] = terror_events

	if weighted_random_terror_events then
		WeightedRandomTerrorEvents[key] = weighted_random_terror_events
	end
end

for level_key, level_data in pairs(LevelSettings) do
	local has_terror_events = not level_data.no_terror_events

	if type(level_data) == "table" and has_terror_events then
		local override_file_ending = level_data.override_file_ending

		fetch_terror_events(level_key, override_file_ending)
	end
end

fetch_terror_events("weaves")

for level_key, weighted_terror_events in pairs(WeightedRandomTerrorEvents) do
	for chunk_name, chunk in pairs(weighted_terror_events) do
		for i = 1, #chunk, 2 do
			local event_name = chunk[i]

			fassert(TerrorEventBlueprints[level_key][event_name], "TerrorEventChunk %s has a bad event: '%s'.", chunk_name, tostring(event_name))
		end

		chunk.loaded_probability_table = LoadedDice.create_from_mixed(chunk)
	end
end
