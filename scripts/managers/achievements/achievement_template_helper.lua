AchievementTemplateHelper = AchievementTemplateHelper or {}
AchievementTemplateHelper.rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}
AchievementTemplateHelper.PLACEHOLDER_ICON = "icons_placeholder"

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

AchievementTemplateHelper.check_level_completed_difficulty = function (statistics_db, stats_id, level_to_complete, difficulty_rank, career)
	assert(type(level_to_complete) == "table", "level_to_complete needs to be a table")

	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	local level_id = level_to_complete.level_id
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

	return difficulty_rank <= completed_rank
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

AchievementTemplateHelper.add_stat_count_challenge = function (achievements, id, stat_name, count, icon, dlc, id_xb1, id_ps4)
	achievements[id] = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return count <= statistics_db:get_persistent_stat(stats_id, stat_name)
		end,
		progress = function (statistics_db, stats_id)
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name)

			return {
				completed,
				count
			}
		end
	}
end

AchievementTemplateHelper.add_multi_stat_count_challenge = function (achievements, id, stat_names, count, icon, dlc, id_xb1, id_ps4)
	achievements[id] = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			local completed = 0
			local num_stats = #stat_names

			for i = 1, num_stats, 1 do
				if count <= statistics_db:get_persistent_stat(stats_id, stat_names[i]) then
					completed = completed + 1
				end
			end

			return count <= completed
		end,
		progress = function (statistics_db, stats_id)
			local completed = 0
			local num_stats = #stat_names

			for i = 1, num_stats, 1 do
				if count <= statistics_db:get_persistent_stat(stats_id, stat_names[i]) then
					completed = completed + 1
				end
			end

			return {
				completed,
				num_stats
			}
		end
	}
end

AchievementTemplateHelper.add_weapon_kill_challenge = function (achievements, id, weapon, count, icon, dlc, id_xb1, id_ps4)
	local stat_name = (dlc or "") .. "_kills_" .. weapon

	AchievementTemplateHelper.add_stat_count_challenge(achievements, id, stat_name, count, icon, dlc, id_xb1, id_ps4)
end

AchievementTemplateHelper.add_weapon_levels_challenge = function (achievements, id, weapon, levels, difficuty, icon, dlc, id_xb1, id_ps4)
	local stat_names = {}
	local num_levels = #levels

	for i = 1, num_levels, 1 do
		local level_name = levels[i]
		local stat_name = (dlc or "") .. "_" .. level_name .. "_" .. weapon
		stat_names[i] = stat_name
	end

	local rank = DifficultySettings[difficuty].rank
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			for i = 1, num_levels, 1 do
				if statistics_db:get_persistent_stat(stats_id, stat_names[i]) < rank then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id)
			local completed = 0

			for i = 1, num_levels, 1 do
				local name = stat_names[i]
				local stat = statistics_db:get_persistent_stat(stats_id, name)

				if rank <= stat then
					completed = completed + 1
				end
			end

			return {
				completed,
				num_levels
			}
		end,
		requirements = function (statistics_db, stats_id)
			local out_table = {}

			for i = 1, num_levels, 1 do
				local level_name = levels[i]
				local level_display_name = LevelSettings[level_name].display_name
				local entry = {
					name = level_display_name,
					completed = rank <= statistics_db:get_persistent_stat(stats_id, stat_names[i])
				}

				table.insert(out_table, entry)
			end

			return out_table
		end
	}
	achievements[id] = template
end

AchievementTemplateHelper.add_event_challenge = function (achievements, id, icon, description_args, dlc, id_xb1, id_ps4)
	local template = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, id) > 0
		end
	}
	local desc_id = "achv_" .. id .. "_desc"

	if description_args then
		template.desc = function ()
			return string.format(Localize(desc_id), unpack(description_args))
		end
	else
		template.desc = desc_id
	end

	achievements[id] = template
end

AchievementTemplateHelper.add_levels_complete_challenge = function (achievements, id, levels, difficulty_rank, icon, dlc, id_xb1, id_ps4)
	local num_levels = #levels
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			local count = 0

			for i = 1, num_levels, 1 do
				if AchievementTemplateHelper.check_level_completed_difficulty(statistics_db, stats_id, levels[i], difficulty_rank) then
					count = count + 1
				end
			end

			return num_levels <= count
		end
	}

	if num_levels > 1 then
		template.progress = function (statistics_db, stats_id)
			local count = 0

			for i = 1, num_levels, 1 do
				if AchievementTemplateHelper.check_level_completed_difficulty(statistics_db, stats_id, levels[i], difficulty_rank) then
					count = count + 1
				end
			end

			return {
				count,
				num_levels
			}
		end

		template.requirements = function (statistics_db, stats_id)
			local out_table = {}

			for i = 1, num_levels, 1 do
				local entry = {
					name = levels[i].display_name,
					completed = AchievementTemplateHelper.check_level_completed_difficulty(statistics_db, stats_id, levels[i], difficulty_rank)
				}

				table.insert(out_table, entry)
			end

			return out_table
		end
	end

	achievements[id] = template
end

AchievementTemplateHelper.add_meta_challenge = function (achievements, id, achievement_ids, icon, dlc, id_xb1, id_ps4)
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			for i = 1, #achievement_ids, 1 do
				local achievement_id = achievement_ids[i]
				local completed = achievements[achievement_id].completed(statistics_db, stats_id)

				if not completed then
					return false
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local num_achievements = #achievement_ids

			for i = 1, num_achievements, 1 do
				local achievement_id = achievement_ids[i]
				local completed = achievements[achievement_id].completed(statistics_db, stats_id)

				if completed then
					count = count + 1
				end
			end

			return {
				count,
				num_achievements
			}
		end,
		requirements = function (statistics_db, stats_id)
			local reqs = {}

			for i = 1, #achievement_ids, 1 do
				local achievement_id = achievement_ids[i]
				local achv_name = achievements[achievement_id].name
				local completed = achievements[achievement_id].completed(statistics_db, stats_id)

				table.insert(reqs, {
					name = achv_name,
					completed = completed
				})
			end

			return reqs
		end
	}
	achievements[id] = template
end

return
