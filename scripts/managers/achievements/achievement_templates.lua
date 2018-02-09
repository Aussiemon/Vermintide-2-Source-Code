ACHIEVEMENT_VERSION_NUMBER = 1

local function check_level_list(statistics_db, stats_id, levels_to_complete)
	if Development.parameter("beta_level_progression") then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		slot7 = levels_to_complete[i]
	end

	return true
end

local function check_level_list_difficulty(statistics_db, stats_id, levels_to_complete, difficulty)
	if Development.parameter("beta_level_progression") then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		slot9 = LevelDifficultyDBNames[level_id]
	end

	return true
end

local function check_unlock(unlock_name)
	local backend_manager = Managers.backend

	return false
end

AchievementTemplates = {
	complete_one_mission_on_hard = {
		ID_XB1 = "Gauntlet",
		ID_PS4 = "009",
		evaluate = function (statistics_db, stats_id)
			local level_list = nil

			if PLATFORM == "win32" then
				level_list = LevelSettingsCampaign.level_list
			else
				level_list = LevelSettingsCampaign.console_level_list
			end

			for i = 1, #level_list, 1 do
				local level_id = level_list[i]

				if 3 <= LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id) then
					return true
				end
			end

			return false
		end
	},
	complete_one_mission_on_nightmare = {
		ID_XB1 = "TrialByFire",
		ID_PS4 = "010",
		evaluate = function (statistics_db, stats_id)
			local level_list = nil

			if PLATFORM == "win32" then
				level_list = LevelSettingsCampaign.level_list
			else
				level_list = LevelSettingsCampaign.console_level_list
			end

			for i = 1, #level_list, 1 do
				local level_id = level_list[i]

				if 4 <= LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id) then
					return true
				end
			end

			return false
		end
	},
	complete_one_mission_on_cataclysm = {
		ID_XB1 = "EndTimesExcursion",
		ID_PS4 = "011",
		evaluate = function (statistics_db, stats_id)
			local level_list = nil

			if PLATFORM == "win32" then
				level_list = LevelSettingsCampaign.level_list
			else
				level_list = LevelSettingsCampaign.console_level_list
			end

			for i = 1, #level_list, 1 do
				local level_id = level_list[i]

				if 5 <= LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id) then
					return true
				end
			end

			return false
		end
	},
	destroy_five_hundred_dynamic_objects = {
		ID_XB1 = "DomesticDisturbance",
		ID_PS4 = "012",
		evaluate = function (statistics_db, stats_id)
			return 500 <= statistics_db.get_persistent_stat(statistics_db, stats_id, "dynamic_objects_destroyed")
		end
	},
	carry_a_grimoire_to_the_end_of_a_level = {
		ID_XB1 = "Dissident",
		ID_PS4 = "013",
		evaluate = function (statistics_db, stats_id)
			local level_list = nil

			if PLATFORM == "win32" then
				level_list = LevelSettingsCampaign.level_list
			else
				level_list = LevelSettingsCampaign.console_level_list
			end

			for slot6, slot7 in pairs(level_list) do
			end

			return false
		end
	},
	get_the_killing_blow_on_a_rat_ogre = {
		ID_XB1 = "Moulderbane",
		ID_PS4 = "014",
		evaluate = function (statistics_db, stats_id)
			return 0 < statistics_db.get_stat(statistics_db, stats_id, "kills_per_breed", "skaven_rat_ogre")
		end
	},
	be_part_of_killing_a_rat_ogre = {
		ID_XB1 = "Rakogridrengi",
		ID_PS4 = "015",
		evaluate = function (statistics_db, stats_id)
			local has_damaged_ogre = 0 < statistics_db.get_stat(statistics_db, stats_id, "damage_dealt_per_breed", "skaven_rat_ogre")

			if has_damaged_ogre then
				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local stats_id = player.stats_id(player)

					if 0 < statistics_db.get_stat(statistics_db, stats_id, "kills_per_breed", "skaven_rat_ogre") then
						return true
					end
				end
			end

			return false
		end
	},
	use_ten_medical_supplies_on_your_allies = {
		ID_XB1 = "Shallya",
		ID_PS4 = "017",
		evaluate = function (statistics_db, stats_id)
			return 10 <= statistics_db.get_persistent_stat(statistics_db, stats_id, "times_friend_healed")
		end
	},
	acquire_an_item_with_exotic_quality = {
		ID_XB1 = "ForceOfNature",
		ID_PS4 = "019",
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				local backend_items = backend_manager.get_interface(backend_manager, "items")
				local items = backend_items.get_all_backend_items(backend_items)

				for _, backend_item_data in pairs(items) do
					local item_data = ItemMasterList[backend_item_data.key]

					if item_data.rarity == "exotic" then
						return true
					end
				end
			end

			return false
		end
	},
	reach_rank_one_hundred = {
		ID_XB1 = "KarlFranz",
		ID_PS4 = "020",
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			return false
		end
	},
	unlock_the_forge = {
		ID_XB1 = "HammerAndAnvil",
		ID_PS4 = "021",
		evaluate = function (statistics_db, stats_id)
			return check_unlock("forge")
		end
	},
	unlock_the_third_trinket_slot = {
		ID_XB1 = "Trinkaholic",
		ID_PS4 = "028",
		evaluate = function (statistics_db, stats_id)
			return check_unlock("slot_trinket_3")
		end
	},
	collect_one_tome = {
		ID_XB1 = "Scholar",
		ID_PS4 = "030",
		evaluate = function (statistics_db, stats_id)
			local level_list = nil

			if PLATFORM == "win32" then
				level_list = LevelSettingsCampaign.level_list
			else
				level_list = LevelSettingsCampaign.console_level_list
			end

			for slot6, slot7 in pairs(LevelSettingsCampaign.level_list) do
			end

			return false
		end
	},
	collect_all_tomes = {
		ID_XB1 = "BalthasarGelt",
		ID_PS4 = "031",
		evaluate = function (statistics_db, stats_id)
			local levels_with_tomes = nil

			if PLATFORM == "win32" then
				levels_with_tomes = LevelSettingsCampaign.levels_with_tomes
			else
				levels_with_tomes = LevelSettingsCampaign.console_levels_with_tomes
			end

			for _, level_id in pairs(levels_with_tomes) do
				slot8 = LevelSettingsCampaign.tome_amount_exceptions[level_id] or 3
			end

			return true
		end
	},
	complete_a_mission_as_every_hero = {
		ID_XB1 = "FuriousFive",
		ID_PS4 = "032",
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				for slot6, slot7 in pairs(SPProfiles) do
				end

				return false
			end

			return false
		end
	},
	complete_a_mission_as_the_bright_wizard = {
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				return 0 < statistics_db.get_persistent_stat(statistics_db, stats_id, "complete_level_bright_wizard")
			end

			return false
		end
	},
	complete_a_mission_as_the_way_watcher = {
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				return 0 < statistics_db.get_persistent_stat(statistics_db, stats_id, "complete_level_wood_elf")
			end

			return false
		end
	},
	complete_a_mission_as_the_empire_soldier = {
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				return 0 < statistics_db.get_persistent_stat(statistics_db, stats_id, "complete_level_empire_soldier")
			end

			return false
		end
	},
	complete_a_mission_as_the_witch_hunter = {
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				return 0 < statistics_db.get_persistent_stat(statistics_db, stats_id, "complete_level_witch_hunter")
			end

			return false
		end
	},
	complete_a_mission_as_the_dwarf_ranger = {
		evaluate = function (statistics_db, stats_id)
			local backend_manager = Managers.backend

			if backend_manager.available(backend_manager) and backend_manager.profiles_loaded(backend_manager) then
				return 0 < statistics_db.get_persistent_stat(statistics_db, stats_id, "complete_level_dwarf_ranger")
			end

			return false
		end
	},
	collect_both_grimoires_on_magnus = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_both_grimoires_on_merchant = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_both_grimoires_on_wizard = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_both_grimoires_on_forest_ambush = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_both_grimoires_on_cemetery = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_both_grimoires_on_tunnels = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_magnus = {
		ID_XB1 = "ThePious",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_merchant = {
		ID_XB1 = "Marktplatz",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_wizard = {
		ID_XB1 = "WindsOfUlgu",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_forest_ambush = {
		ID_XB1 = "Reikwald",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_cemetery = {
		ID_XB1 = "BlackGuard",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	collect_all_tomes_on_tunnels = {
		ID_XB1 = "Mandred",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_drachenfels_portals = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_drachenfels_castle = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_drachenfels_castle_dungeon = {
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_dwarf_exterior = {
		ID_XB1 = "WendigoAlert",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_dwarf_interior = {
		ID_XB1 = "BreweryOrBalrog",
		evaluate = function (statistics_db, stats_id)
			return 
		end
	},
	complete_dwarf_beacons = {
		ID_XB1 = "GondorCallsForAid",
		evaluate = function (statistics_db, stats_id)
			return 
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
	local tome_mission_data = mission_system.get_level_end_mission_data(mission_system, "tome_bonus_mission")

	if not tome_mission_data then
		return 0
	end

	return tome_mission_data.current_amount
end

local function collected_grimoires(statistics_db, stats_id)
	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system.get_level_end_mission_data(mission_system, "grimoire_hidden_mission")

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
			return statistics_db.get_stat(statistics_db, stats_id, "kills_total")
		end
	},
	rat_ogres_killed = {
		persistent = false,
		stat_name = "HeroOgresKilled",
		evaluate = function (statistics_db, stats_id)
			return statistics_db.get_stat(statistics_db, stats_id, "kills_per_breed", "skaven_rat_ogre")
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
