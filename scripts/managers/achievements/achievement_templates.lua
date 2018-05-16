ACHIEVEMENT_VERSION_NUMBER = 1

local function check_level_list(statistics_db, stats_id, levels_to_complete)
	if Development.parameter("beta_level_progression") then
		return false
	end

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

local function check_level_list_difficulty(statistics_db, stats_id, levels_to_complete, difficulty_rank)
	if Development.parameter("beta_level_progression") then
		return false
	end

	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local difficulties = difficulty_manager:get_level_difficulties(level_id)
		local difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
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

local function check_unlock(unlock_name)
	local backend_manager = Managers.backend

	return false
end

local function check_level_hero(hero_name, required_level)
	local experience = ExperienceSettings.get_experience(hero_name)

	return required_level <= ExperienceSettings.get_level(experience)
end

local rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}

local function equipped_items_of_rarity(required_rarity)
	local required_rarity_index = rarity_index[required_rarity]

	assert(required_rarity_index, "Invalid rarity %s", required_rarity)

	local backend = Managers.backend

	if not backend then
		return false
	end

	local backend_items = backend:get_interface("items")

	if not backend_items then
		return false
	end

	local filter = "equipped_by_current_career and is_equipment_slot"
	local items = backend_items:get_filtered_items(filter)
	local ret = {}

	for _, item in ipairs(items) do
		local item_rarity = rarity_index[item.rarity]

		if item_rarity and required_rarity_index <= item_rarity then
			table.insert(ret, item)
		end
	end

	return ret
end

AchievementTemplates = {
	complete_tutorial = {
		ID_XB1 = 2,
		ID_PS4 = "TROP001",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_list(statistics_db, stats_id, {
				LevelSettings.prologue.level_id
			})
		end
	},
	complete_act_one = {
		ID_XB1 = 3,
		ID_PS4 = "TROP002",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_1")
		end
	},
	complete_act_two = {
		ID_XB1 = 4,
		ID_PS4 = "TROP003",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_2")
		end
	},
	complete_act_three = {
		ID_XB1 = 5,
		ID_PS4 = "TROP004",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_3")
		end
	},
	complete_skittergate_recruit = {
		ID_XB1 = 6,
		ID_PS4 = "TROP005",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.normal.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_veteran = {
		ID_XB1 = 7,
		ID_PS4 = "TROP006",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_champion = {
		ID_XB1 = 8,
		ID_PS4 = "TROP007",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_legend = {
		ID_XB1 = 9,
		ID_PS4 = "TROP008",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	level_thirty_wood_elf = {
		ID_XB1 = 10,
		ID_PS4 = "TROP009",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("wood_elf", 30)
		end
	},
	level_thirty_witch_hunter = {
		ID_XB1 = 11,
		ID_PS4 = "TROP010",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("witch_hunter", 30)
		end
	},
	level_thirty_empire_soldier = {
		ID_XB1 = 12,
		ID_PS4 = "TROP011",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("empire_soldier", 30)
		end
	},
	level_thirty_bright_wizard = {
		ID_XB1 = 13,
		ID_PS4 = "TROP012",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("bright_wizard", 30)
		end
	},
	level_thirty_dwarf_ranger = {
		ID_XB1 = 14,
		ID_PS4 = "TROP013",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("dwarf_ranger", 30)
		end
	},
	level_thirty_all = {
		ID_XB1 = 15,
		ID_PS4 = "TROP014",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			return check_level_hero("wood_elf", 30) and check_level_hero("witch_hunter", 30) and check_level_hero("empire_soldier", 30) and check_level_hero("bright_wizard", 30) and check_level_hero("dwarf_ranger", 30)
		end
	},
	unlock_first_talent_point = {
		ID_XB1 = 16,
		ID_PS4 = "TROP015",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local heroes = {
				"wood_elf",
				"witch_hunter",
				"empire_soldier",
				"bright_wizard",
				"dwarf_ranger"
			}

			for _, hero in ipairs(heroes) do
				if ProgressionUnlocks.get_num_talent_points(hero) >= 1 then
					return true
				end
			end

			return false
		end
	},
	unlock_all_talent_points = {
		ID_XB1 = 17,
		ID_PS4 = "TROP016",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local heroes = {
				"wood_elf",
				"witch_hunter",
				"empire_soldier",
				"bright_wizard",
				"dwarf_ranger"
			}

			for _, hero in ipairs(heroes) do
				if ProgressionUnlocks.get_num_talent_points(hero) == 5 then
					return true
				end
			end

			return false
		end
	},
	craft_item = {
		ID_XB1 = 18,
		ID_PS4 = "TROP017",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local crafted_items = statistics_db:get_persistent_stat(stats_id, "crafted_items")

			return crafted_items >= 1
		end
	},
	craft_fifty_items = {
		ID_XB1 = 19,
		ID_PS4 = "TROP018",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local crafted_items = statistics_db:get_persistent_stat(stats_id, "crafted_items")

			return crafted_items >= 50
		end
	},
	salvage_item = {
		ID_XB1 = 20,
		ID_PS4 = "TROP019",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local crafted_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")

			return crafted_items >= 1
		end
	},
	salvage_hundred_items = {
		ID_XB1 = 21,
		ID_PS4 = "TROP020",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local crafted_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")

			return crafted_items >= 100
		end
	},
	equip_common_quality = {
		ID_XB1 = 22,
		ID_PS4 = "TROP021",
		context = "set_loadout",
		evaluate = function (statistics_db, stats_id)
			local items = equipped_items_of_rarity("common")

			return #items >= 1
		end
	},
	equip_rare_quality = {
		ID_XB1 = 23,
		ID_PS4 = "TROP022",
		context = "set_loadout",
		evaluate = function (statistics_db, stats_id)
			local items = equipped_items_of_rarity("rare")

			return #items >= 1
		end
	},
	equip_exotic_quality = {
		ID_XB1 = 24,
		ID_PS4 = "TROP023",
		context = "set_loadout",
		evaluate = function (statistics_db, stats_id)
			local items = equipped_items_of_rarity("exotic")

			return #items >= 1
		end
	},
	equip_all_exotic_quality = {
		ID_XB1 = 25,
		ID_PS4 = "TROP024",
		context = "set_loadout",
		evaluate = function (statistics_db, stats_id)
			local items = equipped_items_of_rarity("exotic")

			return #items == 5
		end
	},
	equip_veteran_quality = {
		ID_XB1 = 26,
		ID_PS4 = "TROP025",
		context = "set_loadout",
		evaluate = function (statistics_db, stats_id)
			local items = equipped_items_of_rarity("unique")

			return #items >= 1
		end
	},
	complete_level_all = {
		ID_XB1 = 27,
		ID_PS4 = "TROP026",
		context = "in_inn",
		evaluate = function (statistics_db, stats_id)
			local heroes = {
				"bright_wizard",
				"wood_elf",
				"empire_soldier",
				"dwarf_ranger",
				"witch_hunter"
			}

			for level_key, level in pairs(LevelSettings) do
				if table.contains(UnlockableLevels, level_key) then
					local all_completed = true

					for _, hero in ipairs(heroes) do
						local completed = statistics_db:get_persistent_stat(stats_id, "completed_levels_" .. hero, level_key)

						if completed == 0 then
							all_completed = false

							break
						end
					end

					if all_completed then
						return true
					end
				end
			end

			return false
		end
	}
}

local function completed_levels(statistics_db, stats_id)
	local levels_completed = 0

	for slot6, slot7 in ipairs(MainGameLevels) do
	end

	for slot6, slot7 in ipairs(NoneActLevels) do
	end

	return levels_completed
end

local function collected_tomes(statistics_db, stats_id)
	local mission_system = Managers.state.entity:system("mission_system")
	local tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission")

	if not tome_mission_data then
		return 0
	end

	return tome_mission_data.current_amount
end

local function collected_grimoires(statistics_db, stats_id)
	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission")

	if not grimoire_mission_data then
		return 0
	end

	return grimoire_mission_data.current_amount
end

HeroStats = {
	mission_completed = {
		persistent = true,
		stat_name = "HeroMissionCompleted",
		evaluate = function (statistics_db, stats_id)
			return completed_levels(statistics_db, stats_id)
		end
	},
	skaven_killed = {
		persistent = false,
		stat_name = "HeroSkavenKilled",
		evaluate = function (statistics_db, stats_id)
			return statistics_db:get_stat(stats_id, "kills_total")
		end
	},
	rat_ogres_killed = {
		persistent = false,
		stat_name = "HeroOgresKilled",
		evaluate = function (statistics_db, stats_id)
			return statistics_db:get_stat(stats_id, "kills_per_breed", "skaven_rat_ogre")
		end
	},
	tomes_collected = {
		persistent = false,
		stat_name = "HeroTomesCollected",
		evaluate = function (statistics_db, stats_id)
			return collected_tomes(statistics_db, stats_id)
		end
	},
	grimoires_collected = {
		persistent = false,
		stat_name = "HeroGrimoiresCollected",
		evaluate = function (statistics_db, stats_id)
			return collected_grimoires(statistics_db, stats_id)
		end
	}
}
AchievementTemplates_n = 0
local templates = {}

for name, template in pairs(AchievementTemplates) do
	template.name = name
	AchievementTemplates_n = AchievementTemplates_n + 1
	templates[AchievementTemplates_n] = template
	templates[name] = template
end

AchievementTemplates = templates

return
