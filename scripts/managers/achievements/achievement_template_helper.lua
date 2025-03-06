-- chunkname: @scripts/managers/achievements/achievement_template_helper.lua

AchievementTemplateHelper = AchievementTemplateHelper or {}
AchievementTemplateHelper.rarity_index = {
	common = 2,
	exotic = 4,
	plentiful = 1,
	rare = 3,
	unique = 5,
}
AchievementTemplateHelper.PLACEHOLDER_ICON = "icons_placeholder"

AchievementTemplateHelper.check_level = function (statistics_db, stats_id, level_id)
	local level_stat = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_id)
	local not_completed = not level_stat or level_stat == 0

	return not not_completed
end

AchievementTemplateHelper.check_level_list = function (statistics_db, stats_id, levels_to_complete)
	assert(type(levels_to_complete) == "table" and #levels_to_complete > 0, "levels_to_complete needs to be a list of levels with at least 1 element")

	for i = 1, #levels_to_complete do
		local level_id = levels_to_complete[i]
		local level_stat = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_id)

		if not level_stat or level_stat == 0 then
			return false
		end
	end

	return true
end

AchievementTemplateHelper.rpc_increment_stat = function (unit, stat_name)
	local player = Managers.player:unit_owner(unit)

	if player and not player.bot_player then
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

AchievementTemplateHelper.rpc_modify_stat = function (unit, stat_name, amount)
	local player = Managers.player:unit_owner(unit)

	if player and not player.bot_player then
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_modify_stat", peer_id, stat_id, amount)
	end
end

AchievementTemplateHelper.check_level_difficulty = function (statistics_db, stats_id, level_id, difficulty_rank, career)
	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	local difficulties = difficulty_manager:get_default_difficulties()
	local difficulty_index

	if not career then
		difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
	else
		for i = #difficulties, 1, -1 do
			local wins = statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level_id, difficulties[i])

			if wins > 0 then
				difficulty_index = i

				break
			end
		end
	end

	local difficulty_key = difficulties[difficulty_index]

	if not difficulty_key then
		return false
	end

	if not DefaultDifficultyLookup[difficulty_key] then
		return false
	end

	local completed_rank = DifficultySettings[difficulty_key].rank

	return difficulty_rank <= completed_rank
end

AchievementTemplateHelper.check_level_table_difficulty = function (statistics_db, stats_id, level_to_complete, difficulty_rank, career)
	assert(type(level_to_complete) == "table" and level_to_complete.level_id, "level_to_complete needs to be a table with a level_id field")

	local level_id = level_to_complete.level_id

	return AchievementTemplateHelper.check_level_difficulty(statistics_db, stats_id, level_id, difficulty_rank, career)
end

AchievementTemplateHelper.check_level_list_difficulty = function (statistics_db, stats_id, levels_to_complete, difficulty_rank, career)
	assert(type(levels_to_complete) == "table" and #levels_to_complete > 0, "levels_to_complete needs to be a list of levels with at least 1 element")

	local check_level_difficulty = AchievementTemplateHelper.check_level_difficulty

	for i = 1, #levels_to_complete do
		local level_id = levels_to_complete[i]
		local completed = check_level_difficulty(statistics_db, stats_id, level_id, difficulty_rank, career)

		if not completed then
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
	"trinket",
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

AchievementTemplateHelper.add_stat_count_challenge = function (achievements, id, stat_name, count, career, icon, dlc, id_xb1, id_ps4)
	achievements[id] = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		desc = function ()
			local description = "achv_" .. id .. "_desc"

			return string.format(Localize(description), count)
		end,
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			if career then
				return statistics_db:get_persistent_stat(stats_id, stat_name, career) >= count
			else
				return statistics_db:get_persistent_stat(stats_id, stat_name) >= count
			end
		end,
		progress = function (statistics_db, stats_id)
			if career then
				local completed = statistics_db:get_persistent_stat(stats_id, stat_name, career)

				return {
					completed,
					count,
				}
			else
				local completed = statistics_db:get_persistent_stat(stats_id, stat_name)

				return {
					completed,
					count,
				}
			end
		end,
	}
end

AchievementTemplateHelper.add_health_challenge = function (achievements, id, career, threshold, icon, dlc, id_xb1, id_ps4)
	achievements[id] = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "min_health_completed", career) >= threshold
		end,
	}
end

AchievementTemplateHelper.add_weapon_kills_per_breeds_challenge = function (achievements, id, weapons, breeds_to_kill, count, icon, dlc, show_complete, id_xb1, id_ps4)
	assert(type(breeds_to_kill) == "table", "breeds_to_kill needs to be a list of breeds")

	achievements[id] = {
		name = "achv_" .. id .. "_name",
		desc = function ()
			local description = "achv_" .. id .. "_desc"

			return string.format(Localize(description), count)
		end,
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		display_completion_ui = show_complete,
		completed = function (statistics_db, stats_id)
			local stat_name = "weapon_kills_per_breed"
			local max_count = 0

			for i = 1, #breeds_to_kill do
				for j = 1, #weapons do
					local test = statistics_db:get_persistent_stat(stats_id, stat_name, weapons[j], breeds_to_kill[i])

					max_count = max_count + test
				end
			end

			return max_count >= count
		end,
		progress = function (statistics_db, stats_id)
			local stat_name = "weapon_kills_per_breed"
			local max_count = 0

			for i = 1, #breeds_to_kill do
				for j = 1, #weapons do
					max_count = max_count + statistics_db:get_persistent_stat(stats_id, stat_name, weapons[j], breeds_to_kill[i])
				end
			end

			if max_count > count then
				max_count = count
			end

			return {
				max_count,
				count,
			}
		end,
	}
end

AchievementTemplateHelper.add_career_mission_count_challenge = function (achievements, id, stat_name, career_name, difficulty_ranks, count, min_health, icon, dlc, id_xb1, id_ps4)
	achievements[id .. "_" .. career_name] = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_" .. career_name .. "_name",
		desc = "achv_" .. id .. "_" .. career_name .. "_desc",
		icon = icon or "achievement_trophy_" .. id .. "_" .. career_name,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			local max_count = 0

			for i = 1, #difficulty_ranks do
				for j = 1, #UnlockableLevels do
					max_count = max_count + statistics_db:get_persistent_stat(stats_id, stat_name, career_name, UnlockableLevels[j], difficulty_ranks[i])
				end
			end

			return max_count >= count
		end,
		progress = function (statistics_db, stats_id)
			local max_count = 0

			for i = 1, #difficulty_ranks do
				for j = 1, #UnlockableLevels do
					max_count = max_count + statistics_db:get_persistent_stat(stats_id, stat_name, career_name, UnlockableLevels[j], difficulty_ranks[i])
				end
			end

			if max_count > count then
				max_count = count
			end

			return {
				max_count,
				count,
			}
		end,
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
			local max_count = 0
			local num_stats = #stat_names

			for i = 1, num_stats do
				max_count = max_count + statistics_db:get_persistent_stat(stats_id, stat_names[i])
			end

			return max_count >= count
		end,
		progress = function (statistics_db, stats_id)
			local max_count = 0
			local num_stats = #stat_names

			for i = 1, num_stats do
				max_count = max_count + statistics_db:get_persistent_stat(stats_id, stat_names[i])
			end

			if max_count > count then
				max_count = count
			end

			return {
				max_count,
				count,
			}
		end,
	}
end

AchievementTemplateHelper.add_weapon_kill_challenge = function (achievements, id, weapon, count, icon, dlc, id_xb1, id_ps4)
	local stat_name = (dlc or "") .. "_kills_" .. weapon

	AchievementTemplateHelper.add_stat_count_challenge(achievements, id, stat_name, count, nil, icon, dlc, id_xb1, id_ps4)
end

AchievementTemplateHelper.add_weapon_levels_challenge = function (achievements, id, weapon, levels, difficuty, icon, dlc, id_xb1, id_ps4)
	local stat_names = {}
	local num_levels = levels and #levels or 0

	for i = 1, num_levels do
		local level_name = levels[i]
		local stat_name = (dlc or "") .. "_" .. level_name .. "_" .. weapon

		stat_names[i] = stat_name
	end

	local difficulty_setting = DifficultySettings[difficuty]
	local rank = DifficultySettings[difficuty].rank
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		required_dlc_extra = difficulty_setting.dlc_requirement,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
	}

	template.completed = function (statistics_db, stats_id)
		for i = 1, num_levels do
			if statistics_db:get_persistent_stat(stats_id, stat_names[i]) < rank then
				return false
			end
		end

		return true
	end

	template.progress = function (statistics_db, stats_id)
		local completed = 0

		for i = 1, num_levels do
			local name = stat_names[i]
			local stat = statistics_db:get_persistent_stat(stats_id, name)

			if stat >= rank then
				completed = completed + 1
			end
		end

		return {
			completed,
			num_levels,
		}
	end

	template.requirements = function (statistics_db, stats_id)
		local out_table = {}

		for i = 1, num_levels do
			local level_name = levels[i]
			local level_display_name = LevelSettings[level_name].display_name
			local entry = {
				name = level_display_name,
				completed = statistics_db:get_persistent_stat(stats_id, stat_names[i]) >= rank,
			}

			table.insert(out_table, entry)
		end

		return out_table
	end

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
		end,
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
	local num_levels = levels and #levels or 0
	local difficulty_key = DifficultyRankLookup[difficulty_rank]
	local difficulty_settings = DifficultySettings[difficulty_key]
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		required_dlc_extra = difficulty_settings.dlc_requirement,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			local count = 0

			for i = 1, num_levels do
				if AchievementTemplateHelper.check_level_table_difficulty(statistics_db, stats_id, levels[i], difficulty_rank) then
					count = count + 1
				end
			end

			return count >= num_levels
		end,
	}

	if num_levels > 1 then
		template.progress = function (statistics_db, stats_id)
			local count = 0

			for i = 1, num_levels do
				if AchievementTemplateHelper.check_level_table_difficulty(statistics_db, stats_id, levels[i], difficulty_rank) then
					count = count + 1
				end
			end

			return {
				count,
				num_levels,
			}
		end

		template.requirements = function (statistics_db, stats_id)
			local out_table = {}

			for i = 1, num_levels do
				local entry = {
					name = levels[i].display_name,
					completed = AchievementTemplateHelper.check_level_table_difficulty(statistics_db, stats_id, levels[i], difficulty_rank),
				}

				table.insert(out_table, entry)
			end

			return out_table
		end
	end

	achievements[id] = template
end

AchievementTemplateHelper.add_levels_complete_per_hero_challenge = function (achievements, id, levels, difficulty_rank, career_name, streak, icon, dlc, id_xb1, id_ps4)
	fassert(CareerSettings[career_name] ~= nil, "No career with such name (%s)", career_name)

	local num_levels = levels and #levels or 0
	local difficulty_key = DifficultyRankLookup[difficulty_rank]
	local difficulty_settings = DifficultySettings[difficulty_key]
	local template = {
		name = "achv_" .. id .. "_" .. career_name .. "_name",
		desc = "achv_" .. id .. "_" .. career_name .. "_desc",
		icon = icon or "achievement_trophy_" .. id .. "_" .. career_name,
		required_dlc = dlc,
		required_dlc_extra = difficulty_settings.dlc_requirement,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return AchievementTemplateHelper.check_level_list_difficulty(statistics_db, stats_id, levels, difficulty_rank, career_name, streak)
		end,
	}

	if num_levels > 1 then
		template.progress = function (statistics_db, stats_id)
			local num_completed = 0

			for i = 1, num_levels do
				if AchievementTemplateHelper.check_level_list_difficulty(statistics_db, stats_id, {
					levels[i],
				}, difficulty_rank, career_name, streak) then
					num_completed = num_completed + 1
				end
			end

			return {
				num_completed,
				num_levels,
			}
		end

		template.requirements = function (statistics_db, stats_id)
			local out_table = {}

			for i = 1, num_levels do
				local entry = {
					name = LevelSettings[levels[i]].display_name,
					completed = AchievementTemplateHelper.check_level_list_difficulty(statistics_db, stats_id, {
						levels[i],
					}, difficulty_rank, career_name, streak),
				}

				table.insert(out_table, entry)
			end

			return out_table
		end
	end

	achievements[id .. "_" .. career_name] = template
end

AchievementTemplateHelper.add_meta_challenge = function (achievements, id, achievement_ids, icon, dlc, id_xb1, id_ps4)
	local template = {
		display_completion_ui = true,
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
	}

	template.completed = function (statistics_db, stats_id)
		for i = 1, #achievement_ids do
			local achievement_id = achievement_ids[i]
			local completed = achievements[achievement_id].completed(statistics_db, stats_id)

			if not completed then
				return false
			end
		end

		return true
	end

	template.progress = function (statistics_db, stats_id)
		local count = 0
		local num_achievements = #achievement_ids

		for i = 1, num_achievements do
			local achievement_id = achievement_ids[i]
			local completed = achievements[achievement_id].completed(statistics_db, stats_id)

			if completed then
				count = count + 1
			end
		end

		return {
			count,
			num_achievements,
		}
	end

	template.requirements = function (statistics_db, stats_id)
		local reqs = {}

		for i = 1, #achievement_ids do
			local achievement_id = achievement_ids[i]
			local achv_name = achievements[achievement_id].name
			local completed = achievements[achievement_id].completed(statistics_db, stats_id)

			table.insert(reqs, {
				name = achv_name,
				completed = completed,
			})
		end

		return reqs
	end

	achievements[id] = template
end

AchievementTemplateHelper.add_console_achievements = function (xb1_achievements, ps4_achievements)
	local achievements = AchievementTemplates.achievements

	for name, id in pairs(xb1_achievements) do
		if achievements[name] then
			achievements[name].ID_XB1 = id
		else
			Application.error(string.format("Missing xbox achievement %q", name))
		end
	end

	for name, id in pairs(ps4_achievements) do
		if achievements[name] then
			achievements[name].ID_PS4 = id
		else
			Application.error(string.format("Missing xbox achievement %q", name))
		end
	end
end
