-- chunkname: @scripts/managers/backend/statistics_definitions_grudge_marks.lua

local player = StatisticsDefinitions.player

player.grudge_mark_kills = {}
player.grudge_marks_kills_per_career_per_monster = {}
player.grudge_marks_kills_per_career_per_expedition = {}

local database_names = {}

for i = 1, #database_names do
	local name = database_names[i]

	player[name] = {
		source = "player_data",
		value = 0,
		database_name = name,
	}
end

local relevant_bosses = {
	"skaven_rat_ogre",
	"skaven_stormfiend",
	"chaos_spawn",
	"beastmen_minotaur",
	"chaos_troll",
}
local expeditions = {
	"journey_ruin",
	"journey_ice",
	"journey_cave",
	"journey_citadel",
}

for career, _ in pairs(CareerSettings) do
	if career ~= "empire_soldier_tutorial" then
		local career_breed = CareerSettings[career].breed

		if career_breed and career_breed.is_hero then
			local database_name = "grudge_mark_kills_" .. career

			player.grudge_mark_kills[career] = {
				source = "player_data",
				value = 0,
				database_name = database_name,
			}
			player.grudge_marks_kills_per_career_per_monster[career] = {}

			for i = 1, #relevant_bosses do
				local breed_name = relevant_bosses[i]

				database_name = "grudge_marks_kills_per_" .. career .. "_per_" .. breed_name
				player.grudge_marks_kills_per_career_per_monster[career][breed_name] = {
					source = "player_data",
					value = 0,
					database_name = database_name,
				}
			end

			player.grudge_marks_kills_per_career_per_expedition[career] = {}

			for i = 1, #expeditions do
				local expedition_name = expeditions[i]

				database_name = "grudge_marks_kills_per_" .. career .. "_per_" .. expedition_name
				player.grudge_marks_kills_per_career_per_expedition[career][expedition_name] = {
					source = "player_data",
					value = 0,
					database_name = database_name,
				}
			end
		end
	end
end
