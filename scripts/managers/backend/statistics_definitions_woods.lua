local player = StatisticsDefinitions.player
local database_names = {
	"complete_all_helmgart_levels_recruit_we_thornsister",
	"complete_all_helmgart_levels_veteran_we_thornsister",
	"complete_all_helmgart_levels_champion_we_thornsister",
	"complete_all_helmgart_levels_legend_we_thornsister",
	"woods_complete_100_missions_we_thornsister",
	"woods_javelin_melee_kills",
	"woods_lift_kills",
	"woods_javelin_combo",
	"woods_triple_lift",
	"woods_heal_grind",
	"woods_amount_healed",
	"woods_wall_kill_grind",
	"woods_wall_kill",
	"woods_bleed_grind",
	"woods_bleed_tics",
	"woods_chaos_pinata",
	"woods_bleed_boss",
	"woods_wall_kill_gutter",
	"woods_ability_combo",
	"woods_wall_tank",
	"woods_wall_hits_soaked",
	"woods_wall_block_ratling",
	"woods_ratling_shots_soaked",
	"woods_wall_dual_save",
	"woods_free_ability_grind",
	"woods_free_abilities_used"
}

for i = 1, #database_names do
	local name = database_names[i]
	player[name] = {
		value = 0,
		source = "player_data",
		database_name = name
	}
end

local relevant_careers = {
	we_thornsister = true
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
