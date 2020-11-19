local player = StatisticsDefinitions.player
player.cog_kills_bardin_engineer_career_skill_weapon = {
	value = 0,
	database_name = "cog_kills_bardin_engineer_career_skill_weapon",
	source = "player_data"
}
player.cog_kills_bardin_engineer_career_skill_weapon_heavy = {
	value = 0,
	database_name = "cog_kills_bardin_engineer_career_skill_weapon_heavy",
	source = "player_data"
}
player.cog_kills_dr_2h_cog_hammer = {
	value = 0,
	database_name = "cog_kills_dr_2h_cog_hammer",
	source = "player_data"
}
local database_names = {
	"complete_all_helmgart_levels_recruit_dr_engineer",
	"complete_all_helmgart_levels_veteran_dr_engineer",
	"complete_all_helmgart_levels_champion_dr_engineer",
	"complete_all_helmgart_levels_legend_dr_engineer",
	"cog_complete_100_missions_dr_engineer",
	"climbing_enemies_killed",
	"steam_pistol_headshots",
	"cog_bomb_kills",
	"clutch_pumps",
	"hammer_cliff_pushes",
	"cog_exploding_barrel_kills",
	"cog_hammer_kill_storm",
	"cog_hammer_kill_leech",
	"cog_hammer_kill_hale",
	"cog_penta_bomb",
	"cog_air_bomb",
	"cog_crank_kill",
	"cog_kill_barrage",
	"cog_all_kill_barrage",
	"cog_long_bomb",
	"cog_steam_elite_kill",
	"cog_hammer_axe_kills",
	"cog_wizard_hammer",
	"cog_steam_alt",
	"cog_bomb_grind",
	"cog_chain_headshot",
	"cog_crank_kill_ratling",
	"cog_pistol_headshot_grind",
	"cog_clutch_pump",
	"cog_hammer_cliff_push",
	"cog_only_crank",
	"cog_long_crank_fire",
	"cog_missing_cog",
	"complete_all_engineer_challenges"
}

for i = 1, #database_names, 1 do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end

player.weapon_kills_per_breed.dr_2h_cog_hammer = {}
player.weapon_kills_per_breed.dr_steam_pistol = {}
player.weapon_kills_per_breed.bardin_engineer_career_skill_weapon = {}
player.weapon_kills_per_breed.bardin_engineer_career_skill_weapon_heavy = {}

for breed_name, breed in pairs(Breeds) do
	local database_name = "dr_2h_cog_hammer_" .. breed_name
	player.weapon_kills_per_breed.dr_2h_cog_hammer[breed_name] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
	database_name = "dr_steam_pistol_" .. breed_name
	player.weapon_kills_per_breed.dr_steam_pistol[breed_name] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
	database_name = "bardin_engineer_career_skill_weapon_" .. breed_name
	player.weapon_kills_per_breed.bardin_engineer_career_skill_weapon[breed_name] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
	database_name = "bardin_engineer_career_skill_weapon_heavy_" .. breed_name
	player.weapon_kills_per_breed.bardin_engineer_career_skill_weapon_heavy[breed_name] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
end

local relevant_careers = {
	dr_engineer = true
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
