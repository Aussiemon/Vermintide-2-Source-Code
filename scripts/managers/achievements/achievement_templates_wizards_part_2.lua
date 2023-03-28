local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local XB1_ACHIEVEMENT_ID = {
	tower_hardest = 111,
	tower_wall_illusions = 108,
	tower_note_puzzle = 110,
	tower_skulls = 107,
	tower_created_all_potions = 109
}
local PS4_ACHIEVEMENT_ID = {
	tower_skulls = "088",
	tower_wall_illusions = "089"
}
local all_difficulties = {}
local bastion = {
	LevelSettings.dlc_wizards_tower
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
local player_facing_diff_names = {
	hardest = "legend",
	hard = "veteran",
	harder = "champion",
	cataclysm = "cataclysm",
	normal = "recruit"
}

for i = 1, #difficulties do
	local difficulty_name = Difficulties[i]
	local name = "tower_" .. difficulty_name
	local icon = "achievement_wizards_tower_" .. player_facing_diff_names[difficulty_name]
	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, bastion, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

achievements.tower_skulls = {
	name = "achv_tower_skulls_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_skulls",
	desc = "achv_tower_skulls_desc",
	events = {
		"on_tower_skull_found"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_skulls") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if template_data.num_skulls then
			template_data.num_skulls = template_data.num_skulls + 1
		else
			template_data.num_skulls = 1
		end

		if template_data.num_skulls == 10 then
			statistics_db:increment_stat(stats_id, "tower_skulls")
		end
	end
}
achievements.tower_wall_illusions = {
	name = "achv_tower_wall_illusions_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_wall_illusions",
	desc = "achv_tower_wall_illusions_desc",
	events = {
		"tower_wall_illusion_found"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_wall_illusions") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local index = event_data[1]

		if template_data[index] then
			return
		end

		template_data[index] = true

		if not template_data.num_illusions_found then
			template_data.num_illusions_found = 1
		else
			template_data.num_illusions_found = template_data.num_illusions_found + 1
		end

		if template_data.num_illusions_found == 4 then
			statistics_db:increment_stat(stats_id, "tower_wall_illusions")
		end

		print("wall illusion found " .. index)
	end
}
achievements.tower_invisible_bridge = {
	name = "achv_tower_invisible_bridge_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_invisible_bridge",
	desc = "achv_tower_invisible_bridge_desc",
	events = {
		"update_tower_invisible_bridge_challenge"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_invisible_bridge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if template_data.done then
			return
		end

		local succeeded = event_data[1]

		if succeeded == true then
			statistics_db:increment_stat(stats_id, "tower_invisible_bridge")
		end

		template_data.done = true
	end
}
achievements.tower_enable_guardian_of_lustria = {
	name = "achv_tower_guardian_of_lustria_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_guardian_of_lustria",
	desc = "achv_tower_guardian_of_lustria_desc",
	events = {
		"tower_enable_guardian_of_lustria"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_enable_guardian_of_lustria") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "tower_enable_guardian_of_lustria")
	end
}
achievements.tower_note_puzzle = {
	name = "achv_tower_note_puzzle_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_note_puzzle",
	desc = "achv_tower_note_puzzle_desc",
	events = {
		"tower_note_puzzle"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_note_puzzle") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "tower_note_puzzle")
	end
}
achievements.tower_created_all_potions = {
	name = "achv_tower_created_all_potions_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_created_all_potions",
	desc = "achv_tower_created_all_potions_desc",
	events = {
		"tower_potion_created"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_created_all_potions") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if template_data.done then
			return
		end

		local potion_type = event_data[1]
		template_data[potion_type] = true

		if template_data.hp and template_data.sp and template_data.cr and template_data.db then
			statistics_db:increment_stat(stats_id, "tower_created_all_potions")

			template_data.done = true
		end
	end
}
local TOWER_TIME_CHALLENGE_LIMIT_IN_MINUTES = IS_WINDOWS and 12 or 13
achievements.tower_time_challenge = {
	name = "achv_tower_time_challenge_name",
	display_completion_ui = true,
	icon = "achievement_wizards_tower_time_challenge",
	desc = function ()
		return string.format(Localize("achv_tower_time_challenge_desc"), TOWER_TIME_CHALLENGE_LIMIT_IN_MINUTES)
	end,
	events = {
		"register_completed_level"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "tower_time_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local difficulty_name, level_id, career_name, local_player = unpack(event_data)

		if level_id == "dlc_wizards_tower" then
			local time_limit = TOWER_TIME_CHALLENGE_LIMIT_IN_MINUTES * 60
			local game_time = Managers.time:time("game")

			if game_time < time_limit then
				statistics_db:increment_stat(stats_id, "tower_time_challenge")
			end
		end
	end
}
all_wizards_challenges = table.clone(all_difficulties)

table.remove(all_wizards_challenges, #all_wizards_challenges)

all_wizards_challenges[#all_wizards_challenges + 1] = "tower_skulls"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_wall_illusions"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_invisible_bridge"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_enable_guardian_of_lustria"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_note_puzzle"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_created_all_potions"
all_wizards_challenges[#all_wizards_challenges + 1] = "tower_time_challenge"

add_meta_challenge(achievements, "tower_all_challenges", all_wizards_challenges, "achievement_wizards_tower_all_challenges", nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
