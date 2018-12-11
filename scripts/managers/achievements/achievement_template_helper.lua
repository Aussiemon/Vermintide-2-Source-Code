AchievementTemplateHelper = AchievementTemplateHelper or {}
AchievementTemplateHelper.rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}

AchievementTemplateHelper.check_level_list = function (statistics_db, stats_id, levels_to_complete)
	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local level_stat = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_id)

		if not level_stat or level_stat == 0 then
			return false
		end
	end

	return true
end

AchievementTemplateHelper.check_level_list_difficulty = function (statistics_db, stats_id, levels_to_complete, difficulty_rank, career)
	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local difficulties = difficulty_manager:get_level_difficulties(level_id)
		local difficulty_index = nil

		if career then
			for i, r in ipairs(difficulties) do
				local wins = statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level_id, r)

				if wins > 0 then
					difficulty_index = i
				end
			end
		else
			difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
		end

		if not difficulty_index then
			return false
		end

		local difficulty_key = difficulties[difficulty_index]

		if not difficulty_key then
			return false
		end

		local completed_rank = DifficultySettings[difficulty_key].rank

		if completed_rank < difficulty_rank then
			return false
		end
	end

	return true
end

AchievementTemplateHelper.hero_level = function (hero_name)
	local experience = ExperienceSettings.get_experience(hero_name)

	return ExperienceSettings.get_level(experience)
end

local equipment_slots = {
	"melee",
	"ranged",
	"necklace",
	"ring",
	"trinket"
}

AchievementTemplateHelper.equipped_items_of_rarity = function (statistics_db, stats_id, required_rarity)
	local required_rarity_index = AchievementTemplateHelper.rarity_index[required_rarity]

	assert(required_rarity_index, "Invalid rarity %s", required_rarity)

	local count = 0

	for _, slot in ipairs(equipment_slots) do
		local slot_rarity = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", slot)

		if required_rarity_index <= slot_rarity then
			count = count + 1
		end
	end

	return count
end

return
