local function check_journey_completed_difficulty(statistics_db, stats_id, journey_name, difficulty_rank)
	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	local difficulties = difficulty_manager:get_level_difficulties()
	local difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name)

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

local function check_journey_dominant_god_completed_difficulty(statistics_db, stats_id, dominant_god, difficulty_rank)
	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	local difficulties = difficulty_manager:get_level_difficulties()
	local difficulty_index = LevelUnlockUtils.completed_journey_dominant_god_difficulty_index(statistics_db, stats_id, dominant_god)

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

local function check_hero_journey_completed_difficulty(statistics_db, stats_id, hero, journey_name, difficulty_rank)
	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	local difficulties = difficulty_manager:get_level_difficulties()
	local difficulty_index = LevelUnlockUtils.completed_hero_journey_difficulty_index(statistics_db, stats_id, hero, journey_name)

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

local function add_journey_complete_challenge(achievements, id, journey_name, difficulty_rank, icon, dlc, id_xb1, id_ps4)
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return check_journey_completed_difficulty(statistics_db, stats_id, journey_name, difficulty_rank)
		end
	}
	achievements[id] = template
end

local function add_opened_shrine_challenge(achievements, id, shrine_types, num_shrines_required, icon, dlc, id_xb1, id_ps4)
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		progress = function (statistics_db, stats_id)
			local count = 0

			for i = 1, #shrine_types, 1 do
				local shrine_type = shrine_types[i]
				count = count + statistics_db:get_persistent_stat(stats_id, "opened_shrines", shrine_type)
			end

			return {
				count,
				num_shrines_required
			}
		end,
		completed = function (statistics_db, stats_id)
			local count = 0

			for i = 1, #shrine_types, 1 do
				local shrine_type = shrine_types[i]
				count = count + statistics_db:get_persistent_stat(stats_id, "opened_shrines", shrine_type)
			end

			return num_shrines_required <= count
		end
	}
	achievements[id] = template
end

local function add_journey_dominant_god_complete_challenge(achievements, id, dominant_god, difficulty_rank, icon, dlc, id_xb1, id_ps4)
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return check_journey_dominant_god_completed_difficulty(statistics_db, stats_id, dominant_god, difficulty_rank)
		end
	}
	achievements[id] = template
end

local function add_hero_journey_complete_challenge(achievements, id, hero, journey_name, difficulty_rank, icon, dlc, id_xb1, id_ps4)
	local template = {
		name = "achv_" .. id .. "_name",
		desc = "achv_" .. id .. "_desc",
		icon = icon or "achievement_trophy_" .. id,
		required_dlc = dlc,
		ID_XB1 = id_xb1,
		ID_PS4 = id_ps4,
		completed = function (statistics_db, stats_id)
			return check_hero_journey_completed_difficulty(statistics_db, stats_id, hero, journey_name, difficulty_rank)
		end
	}
	achievements[id] = template
end

local achievements = AchievementTemplates.achievements

add_journey_complete_challenge(achievements, "morris_complete_journey_citadel", "journey_citadel", DifficultySettings.normal.rank, "achievement_morris_citadel", "morris", 92, "084")

if IS_CONSOLE then
	add_journey_complete_challenge(achievements, "morris_complete_journey_citadel_champion", "journey_citadel", DifficultySettings.harder.rank, "achievement_morris_citadel", "morris", 93, "085")
	add_journey_complete_challenge(achievements, "morris_complete_journey_citadel_legend", "journey_citadel", DifficultySettings.hardest.rank, "achievement_morris_citadel", "morris", 94, "086")
	add_opened_shrine_challenge(achievements, "morris_opened_shrines_swap_weapon", {
		DEUS_CHEST_TYPES.swap_melee,
		DEUS_CHEST_TYPES.swap_ranged
	}, 30, nil, nil, 99, nil)
	add_opened_shrine_challenge(achievements, "morris_opened_shrines_upgrade", {
		DEUS_CHEST_TYPES.upgrade
	}, 20, nil, nil, 100, nil)
	add_opened_shrine_challenge(achievements, "morris_opened_shrines_power_up", {
		DEUS_CHEST_TYPES.power_up
	}, 30, nil, nil, 101, nil)
end

add_journey_dominant_god_complete_challenge(achievements, "morris_complete_journey_dominant_god_nurgle", DEUS_GOD_TYPES.NURGLE, DifficultySettings.normal.rank, "achievement_morris_nurgle", "morris", 95, nil)
add_journey_dominant_god_complete_challenge(achievements, "morris_complete_journey_dominant_god_khorne", DEUS_GOD_TYPES.KHORNE, DifficultySettings.normal.rank, "achievement_morris_khorne", "morris", 96, nil)
add_journey_dominant_god_complete_challenge(achievements, "morris_complete_journey_dominant_god_slaanesh", DEUS_GOD_TYPES.SLAANESH, DifficultySettings.normal.rank, "achievement_morris_slaanesh", "morris", 97, nil)
add_journey_dominant_god_complete_challenge(achievements, "morris_complete_journey_dominant_god_tzeentch", DEUS_GOD_TYPES.TZEENTCH, DifficultySettings.normal.rank, "achievement_morris_tzeentch", "morris", 98, nil)

local difficulties = {
	"harder",
	"hardest",
	"cataclysm"
}
local icon_by_hero = {
	we = "achievement_morris_kerillian_",
	bw = "achievement_morris_sienna_",
	wh = "achievement_morris_victor_",
	dr = "achievement_morris_bardin_",
	es = "achievement_morris_markus_"
}

for _, hero in ipairs(SPProfilesAbbreviation) do
	for _, journey_name in ipairs(AvailableJourneyOrder) do
		for difficulty_index, difficulty in ipairs(difficulties) do
			local difficulty_name = DifficultyMapping[difficulty]
			local difficulty_rank = DifficultySettings[difficulty].rank
			local id = string.format("morris_complete_%s_%s_%s", journey_name, hero, difficulty_name)
			local icon = icon_by_hero[hero] .. difficulty_index

			add_hero_journey_complete_challenge(achievements, id, hero, journey_name, difficulty_rank, icon, "morris", nil, nil)
		end
	end
end

return
