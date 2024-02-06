﻿-- chunkname: @scripts/managers/backend/statistics_definitions_morris.lua

local player = StatisticsDefinitions.player

JourneyDifficultyDBNames = JourneyDifficultyDBNames or {}
player.completed_journeys_difficulty = {}

for _, name in ipairs(AvailableJourneyOrder) do
	local journey_difficulty_name = name .. "_difficulty_completed"

	JourneyDifficultyDBNames[name] = journey_difficulty_name

	local completed_journeys_difficulty_definition = {
		source = "player_data",
		sync_to_host = true,
		value = 0,
		database_name = journey_difficulty_name,
	}

	player.completed_journeys_difficulty[journey_difficulty_name] = completed_journeys_difficulty_definition
end

JourneyDominantGodDifficultyDBNames = JourneyDominantGodDifficultyDBNames or {}
player.completed_journey_dominant_god_difficulty = {}

for _, name in pairs(DEUS_GOD_TYPES) do
	local god_difficulty_name = name .. "_deus_god_difficulty_completed"

	JourneyDominantGodDifficultyDBNames[name] = god_difficulty_name

	local completed_journey_dominant_god_difficulty_definition = {
		source = "player_data",
		sync_to_host = true,
		value = 0,
		database_name = god_difficulty_name,
	}

	player.completed_journey_dominant_god_difficulty[god_difficulty_name] = completed_journey_dominant_god_difficulty_definition
end

player.completed_hero_journey_difficulty = {}

for _, hero in ipairs(SPProfilesAbbreviation) do
	player.completed_hero_journey_difficulty[hero] = {}

	for _, name in ipairs(AvailableJourneyOrder) do
		local journey_difficulty_name = name .. "_difficulty_completed"
		local database_name = hero .. "_" .. journey_difficulty_name
		local completed_hero_journey_difficulty_definition = {
			source = "player_data",
			sync_to_host = true,
			value = 0,
			database_name = database_name,
		}

		player.completed_hero_journey_difficulty[hero][journey_difficulty_name] = completed_hero_journey_difficulty_definition
	end
end

player.opened_shrines = {}

for _, chest_type in pairs(DEUS_CHEST_TYPES) do
	local database_name = chest_type .. "_shrine_opened"

	player.opened_shrines[chest_type] = {
		source = "player_data",
		value = 0,
		database_name = database_name,
	}
end
