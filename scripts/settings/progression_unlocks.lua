local progression_unlocks = {}

for key, level_requirement in pairs(TalentUnlockLevels) do
	if Development.parameter("debug_unlock_talents") then
		level_requirement = 0
	end

	progression_unlocks[key] = {
		value = "options_button_icon_talents_glow",
		description = "reward_talent_point",
		unlock_type = "icon",
		level_requirement = level_requirement
	}
end

progression_unlocks.es_mercenary = {
	description = "end_screen_career_unlocked",
	profile = "empire_soldier",
	value = "es_mercenary",
	title = "es_mercenary",
	level_requirement = 0,
	unlock_type = "career"
}
progression_unlocks.es_huntsman = {
	description = "end_screen_career_unlocked",
	profile = "empire_soldier",
	value = "es_huntsman",
	title = "es_huntsman",
	level_requirement = 7,
	unlock_type = "career"
}
progression_unlocks.es_knight = {
	description = "end_screen_career_unlocked",
	profile = "empire_soldier",
	value = "es_knight",
	title = "es_knight",
	level_requirement = 12,
	unlock_type = "career"
}
progression_unlocks.dr_ranger = {
	description = "n/a",
	profile = "dwarf_ranger",
	value = "dr_ranger",
	title = "dr_ranger",
	level_requirement = 0,
	unlock_type = "career"
}
progression_unlocks.dr_ironbreaker = {
	description = "end_screen_career_unlocked",
	profile = "dwarf_ranger",
	value = "dr_ironbreaker",
	title = "dr_ironbreaker",
	level_requirement = 7,
	unlock_type = "career"
}
progression_unlocks.dr_slayer = {
	description = "end_screen_career_unlocked",
	profile = "dwarf_ranger",
	value = "dr_slayer",
	title = "dr_slayer",
	level_requirement = 12,
	unlock_type = "career"
}
progression_unlocks.wh_captain = {
	description = "end_screen_career_unlocked",
	profile = "witch_hunter",
	value = "wh_captain",
	title = "wh_captain",
	level_requirement = 0,
	unlock_type = "career"
}
progression_unlocks.wh_bountyhunter = {
	description = "end_screen_career_unlocked",
	profile = "witch_hunter",
	value = "wh_bountyhunter",
	title = "wh_bountyhunter",
	level_requirement = 7,
	unlock_type = "career"
}
progression_unlocks.wh_zealot = {
	description = "end_screen_career_unlocked",
	profile = "witch_hunter",
	value = "wh_zealot",
	title = "wh_zealot",
	level_requirement = 12,
	unlock_type = "career"
}
progression_unlocks.we_waywatcher = {
	description = "end_screen_career_unlocked",
	profile = "wood_elf",
	value = "we_waywatcher",
	title = "we_waywatcher",
	level_requirement = 0,
	unlock_type = "career"
}
progression_unlocks.we_maidenguard = {
	description = "end_screen_career_unlocked",
	profile = "wood_elf",
	value = "we_maidenguard",
	title = "we_maidenguard",
	level_requirement = 7,
	unlock_type = "career"
}
progression_unlocks.we_shade = {
	description = "end_screen_career_unlocked",
	profile = "wood_elf",
	value = "we_shade",
	title = "we_shade",
	level_requirement = 12,
	unlock_type = "career"
}
progression_unlocks.bw_adept = {
	description = "end_screen_career_unlocked",
	profile = "bright_wizard",
	value = "bw_adept",
	title = "bw_adept",
	level_requirement = 0,
	unlock_type = "career"
}
progression_unlocks.bw_scholar = {
	description = "end_screen_career_unlocked",
	profile = "bright_wizard",
	value = "bw_scholar",
	title = "bw_scholar",
	level_requirement = 7,
	unlock_type = "career"
}
progression_unlocks.bw_unchained = {
	description = "end_screen_career_unlocked",
	profile = "bright_wizard",
	value = "bw_unchained",
	title = "bw_unchained",
	level_requirement = 12,
	unlock_type = "career"
}

DLCUtils.merge("progression_unlocks", progression_unlocks)

for unlock_name, template in pairs(progression_unlocks) do
	template.name = unlock_name
end

local profile_unlocks = {}

for unlock_name, template in pairs(progression_unlocks) do
	local profile = template.profile

	if profile ~= nil then
		if profile_unlocks[profile] == nil then
			profile_unlocks[profile] = {}
		end

		profile_unlocks[profile][template.name] = template
	end
end

ProgressionUnlocks = {
	all_unlocks_for_debug = progression_unlocks,
	get_unlock = function (unlock_name, profile)
		local template = progression_unlocks[unlock_name]

		return template
	end,
	get_profile_unlock = function (unlock_name, profile)
		local template = profile_unlocks[profile][unlock_name]

		return template
	end,
	is_unlocked = function (unlock_name, level)
		local template = progression_unlocks[unlock_name]

		fassert(template, "[ProgressionUnlocks] no template named %q", tostring(unlock_name))

		if not template.disabled and template.level_requirement <= level then
			return true
		end
	end,
	get_level_unlocks = function (level, profile)
		local templates = {}

		for unlock_name, template in pairs(progression_unlocks) do
			if (not template.profile or template.profile == profile) and template.level_requirement == level then
				templates[#templates + 1] = template
			end
		end

		return templates
	end,
	is_unlocked_for_profile = function (unlock_name, profile, level)
		if Development.parameter("unlock_all_careers") then
			return true
		end

		local profile_templates = profile_unlocks[profile]

		fassert(profile_templates, "No unlocks found for profile %s", profile)

		local template = profile_templates[unlock_name]

		if template == nil then
			return true
		end

		if level < template.level_requirement then
			local localized = true
			local dlc_name = nil

			return false, Localize("career_locked_info") .. " " .. tostring(template.level_requirement), dlc_name, localized
		end

		return true
	end,
	get_quests_unlocked = function (level_key)
		local level_settings = LevelSettings[level_key]

		if level_settings.dlc_name or not table.contains(MainGameLevels, level_key) then
			return
		end

		local statistics_db = Managers.player:statistics_db()
		local player = Managers.player:local_player()
		local stats_id = player:stats_id()
		local quests_unlocked = true

		for _, act_levels in pairs(GameActs) do
			local num_act_levels = #act_levels

			for i = 1, num_act_levels do
				local act_level_key = act_levels[i]
				local completed_times = statistics_db:get_persistent_stat(stats_id, "completed_levels", act_level_key)

				if completed_times == 0 or level_key == act_level_key and completed_times > 1 then
					quests_unlocked = false

					break
				end
			end

			if not quests_unlocked then
				break
			end
		end

		if quests_unlocked then
			return progression_unlocks.quests
		end
	end
}
local prestige_unlocks = {
	witch_hunter = {
		"frame_0001",
		"frame_0002",
		"frame_0003",
		"frame_0004",
		"frame_0005",
		"frame_0006"
	},
	bright_wizard = {
		"frame_0001",
		"frame_0002",
		"frame_0003",
		"frame_0004",
		"frame_0005",
		"frame_0006"
	},
	dwarf_ranger = {
		"frame_0001",
		"frame_0002",
		"frame_0003",
		"frame_0004",
		"frame_0005",
		"frame_0006"
	},
	wood_elf = {
		"frame_0001",
		"frame_0002",
		"frame_0003",
		"frame_0004",
		"frame_0005",
		"frame_0006"
	},
	empire_soldier = {
		"frame_0001",
		"frame_0002",
		"frame_0003",
		"frame_0004",
		"frame_0005",
		"frame_0006"
	}
}

ProgressionUnlocks.prestige_reward_by_level = function (prestige_level, profile_name)
	return prestige_unlocks[profile_name][prestige_level]
end

ProgressionUnlocks.get_max_prestige_levels = function ()
	return 5
end

ProgressionUnlocks.can_upgrade_prestige = function (hero_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local prestige = hero_attributes:get(hero_name, "prestige")
	local experience = ExperienceSettings.get_experience(hero_name)
	local level = ExperienceSettings.get_level(experience)
	local can_unlock = ProgressionUnlocks.is_unlocked("prestige", level)

	return can_unlock
end

ProgressionUnlocks.upgrade_prestige = function (hero_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local can_unlock = ProgressionUnlocks.can_upgrade_prestige(hero_name)

	if not can_unlock then
		print("Trying to upgrade prestige although requirements are not met")

		return
	end

	local hero_attributes = Managers.backend:get_interface("hero_attributes")

	hero_attributes:set(hero_name, "experience", 0)

	local prestige = hero_attributes:get(hero_name, "prestige")
	local new_prestige = prestige + 1

	hero_attributes:set(hero_name, "prestige", new_prestige)

	local reward = ProgressionUnlocks.prestige_reward_by_level(new_prestige, hero_name)
	local item_interface = Managers.backend:get_interface("items")

	item_interface:award_item(reward)
end

ProgressionUnlocks.get_prestige_level = function (hero_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")

	return hero_attributes:get(hero_name, "prestige") or 0
end

ProgressionUnlocks.get_num_talent_points = function (hero_name)
	local experience = ExperienceSettings.get_experience(hero_name)
	local level = ExperienceSettings.get_level(experience)
	local num_talent_points = 0

	for unlock_name, _ in pairs(TalentUnlockLevels) do
		if ProgressionUnlocks.is_unlocked(unlock_name, level) then
			num_talent_points = num_talent_points + 1
		end
	end

	return num_talent_points
end

local debug_current_hero_template = ""

ProgressionUnlocks.debug_use_hero_template = function (hero_template)
	if debug_current_hero_template ~= hero_template.name then
		local item_interface = Managers.backend:get_interface("items")
		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local player_manager = Managers.player
		local player = player_manager:local_player(1)
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]
		local profile_name = profile.display_name

		BackendUtils.remove_items_for_prestige()

		local level = hero_template.level
		local prestige_level = hero_template.prestige_level
		local items = hero_template.items
		local experience = ExperienceSettings.get_total_experience_required_for_level(level)

		hero_attributes:set(profile_name, "experience", experience)
		hero_attributes:set(profile_name, "prestige", prestige_level)

		for _, item in ipairs(items) do
			item_interface:award_item(item)
		end

		debug_current_hero_template = hero_template.name

		print(debug_current_hero_template)
	else
		print("ERROR: You are already using hero template " .. hero_template.name)
	end
end

ProgressionUnlocks.debug_get_current_hero_template = function ()
	return debug_current_hero_template
end

ProgressionUnlocks.debug_reset_current_hero_template = function ()
	debug_current_hero_template = ""
end

local level_up_rewards = {
	dwarf_ranger = {
		{},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		}
	},
	witch_hunter = {
		{},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		}
	},
	wood_elf = {
		{},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		}
	},
	bright_wizard = {
		{},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		}
	},
	empire_soldier = {
		{},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		},
		{
			{
				item_name = "loot_chest_01_03"
			}
		}
	}
}
