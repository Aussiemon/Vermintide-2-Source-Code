-- chunkname: @scripts/managers/achievements/achievement_templates_gecko.lua

local LevelSettings = rawget(_G, "LevelSettings")

for level_name, _ in pairs(LevelSettings) do
	if table.contains(UnlockableLevels, level_name) then
		local scrap_count_level_num = #QuestSettings.scrap_count_level

		for j = 1, scrap_count_level_num do
			local id = "gecko_scraps_" .. level_name .. "_" .. j
			local statistics_id = "collected_painting_scraps"

			AchievementTemplates.achievements[id] = {
				name = "achv_" .. id .. "_name",
				icon = "achievement_trophy_gecko_scraps_" .. level_name,
				desc = function ()
					return string.format(Localize("achv_" .. id .. "_desc"), QuestSettings.scrap_count_level[j])
				end,
				completed = function (statistics_db, stats_id)
					return statistics_db:get_persistent_stat(stats_id, statistics_id, level_name) >= QuestSettings.scrap_count_level[j]
				end,
				progress = function (statistics_db, stats_id)
					local scrap_progression = statistics_db:get_persistent_stat(stats_id, statistics_id, level_name)
					local progression_comparison = math.min(scrap_progression, QuestSettings.scrap_count_level[j])

					return {
						progression_comparison,
						QuestSettings.scrap_count_level[j],
					}
				end,
			}
		end
	end
end

local scrap_count_generic_num = #QuestSettings.scrap_count_generic

for i = 1, scrap_count_generic_num do
	local id = "gecko_scraps_generic_" .. i

	AchievementTemplates.achievements[id] = {
		icon = "achievement_trophy_gecko_scraps_generic",
		name = "achv_" .. id .. "_name",
		desc = function ()
			return string.format(Localize("achv_" .. id .. "_desc"), QuestSettings.scrap_count_generic[i])
		end,
		completed = function (statistics_db, stats_id)
			local total_scrap_amount
			local statistics_id = "collected_painting_scraps_generic"

			total_scrap_amount = statistics_db:get_persistent_stat(stats_id, statistics_id)

			return total_scrap_amount and total_scrap_amount >= QuestSettings.scrap_count_generic[i]
		end,
		progress = function (statistics_db, stats_id)
			local total_scrap_amount
			local statistics_id = "collected_painting_scraps_generic"

			total_scrap_amount = statistics_db:get_persistent_stat(stats_id, statistics_id)

			local progression_comparison = math.min(total_scrap_amount, QuestSettings.scrap_count_generic[i])

			return {
				progression_comparison,
				QuestSettings.scrap_count_generic[i],
			}
		end,
	}
end
