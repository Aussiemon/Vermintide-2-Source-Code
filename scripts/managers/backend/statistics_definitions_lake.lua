local player = StatisticsDefinitions.player
local database_names = {
	"complete_all_helmgart_levels_recruit_es_questingknight",
	"complete_all_helmgart_levels_veteran_es_questingknight",
	"complete_all_helmgart_levels_champion_es_questingknight",
	"complete_all_helmgart_levels_legend_es_questingknight",
	"lake_complete_100_missions_es_questingknight",
	"lake_boss_killblow",
	"lake_untouchable",
	"lake_charge_stagger",
	"lake_bastard_block",
	"lake_speed_quest",
	"lake_timing_quest",
	"complete_all_grailknight_challenges"
}
player.weapon_kills_per_breed.markus_questingknight_career_skill_weapon = {}

for breed_name, breed in pairs(Breeds) do
	player.weapon_kills_per_breed.markus_questingknight_career_skill_weapon[breed_name] = {
		value = 0,
		source = "player_data",
		database_name = breed_name
	}
end

for i = 1, #database_names, 1 do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end

local relevant_careers = {
	es_questingknight = true
}

for career, _ in pairs(CareerSettings) do
	if relevant_careers[career] then
		player.mission_streak[career] = {}

		for level_key, _ in pairs(LevelSettings) do
			if table.contains(UnlockableLevels, level_key) then
				local database_name = "mission_streak_" .. career .. "_" .. level_key
				player.mission_streak[career][level_key] = {
					value = 0,
					source = "player_data",
					database_name = database_name
				}
			end
		end
	end
end

return
