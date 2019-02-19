require("scripts/settings/act_settings")
require("scripts/settings/area_settings")

GameActs = {}
MainGameLevels = {}
UnlockableLevels = {}
UnlockableLevelsByGameMode = {}
DLCProgressionOrder = {}
LevelGameModeTypes = {}
RequiredLevelUnlocksByLevel = {}
NoneActLevels = {}
SurvivalLevels = {}
DebugLevels = {}
GameActsOrder = {
	"prologue",
	"act_1",
	"act_2",
	"act_3",
	"act_4"
}
MapPresentationActs = {
	"act_1",
	"act_2",
	"act_3",
	"act_4"
}
GameActsDisplayNames = {
	act_1 = "act_1_display_name",
	prologue = "prologue_display_name",
	act_4 = "act_4_display_name",
	act_3 = "act_3_display_name",
	act_2 = "act_2_display_name"
}

for _, dlc in pairs(DLCSettings) do
	local unlock_settings = dlc.level_unlock_settings

	if unlock_settings then
		dofile(unlock_settings)
	end
end

require("scripts/settings/packaged_levels")

local function is_level_available_on_disk(level_data)
	if rawget(_G, "PACKAGED_LEVEL_PACKAGE_NAMES") then
		return PACKAGED_LEVEL_PACKAGE_NAMES[level_data.package_name]
	end

	return true
end

local only_release = true

local function validate_level_data(level_key, level_data)
	if type(level_data) == "table" then
		local debug_level = string.match(level_data.package_name, "resource_packages/levels/debug/") or string.match(level_data.package_name, "resource_packages/levels/honduras/debug/")

		if debug_level then
			DebugLevels[level_key] = true
		end

		local act = level_data.act

		if not act then
			return false
		end

		if only_release then
			local unlockable = level_data.unlockable
			local available = is_level_available_on_disk(level_data)

			return level_key ~= "inn_level" and unlockable and available and not debug_level
		else
			local unlockable = level_data.unlockable

			return level_key ~= "inn_level" and unlockable
		end
	end
end

for level_key, level_data in pairs(LevelSettings) do
	local valid_level = validate_level_data(level_key, level_data)

	if valid_level then
		local game_mode = level_data.game_mode

		if not LevelGameModeTypes[game_mode] then
			LevelGameModeTypes[game_mode] = true
		end

		if not UnlockableLevelsByGameMode[game_mode] then
			UnlockableLevelsByGameMode[game_mode] = {}
		end

		UnlockableLevelsByGameMode[game_mode][#UnlockableLevelsByGameMode[game_mode] + 1] = level_key
		local act = level_data.act

		if not GameActs[act] then
			GameActs[act] = {}
		end

		if not table.find(MapPresentationActs, act) then
			MapPresentationActs[#MapPresentationActs + 1] = act
		end

		GameActs[act][#GameActs[act] + 1] = level_key
		UnlockableLevels[#UnlockableLevels + 1] = level_key

		if level_data.main_game_level then
			MainGameLevels[#MainGameLevels + 1] = level_key
		end
	end
end

for _, level_key in ipairs(UnlockableLevels) do
	local level_data = LevelSettings[level_key]
	local act_unlock_order = level_data.act_unlock_order

	if act_unlock_order and act_unlock_order > 0 then
		local act = level_data.act
		local act_levels = GameActs[act]
		local required_levels = {}

		for _, act_level_key in ipairs(act_levels) do
			local act_level_unlock_order = LevelSettings[act_level_key].act_unlock_order

			if act_level_unlock_order and act_level_unlock_order < act_unlock_order then
				required_levels[#required_levels + 1] = act_level_key
			end
		end

		RequiredLevelUnlocksByLevel[level_key] = required_levels
	end
end

LevelUnlockUtils = {}

LevelUnlockUtils.unlocked_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local difficulties, starting_difficulty = Managers.state.difficulty:get_level_difficulties(level_key)
	local automatic_difficulty_unlock_index = table.find(difficulties, starting_difficulty)
	local highest_available_difficulty_index = #difficulties
	local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

	return math.max(math.min(completed_difficulty_index + 1, highest_available_difficulty_index), automatic_difficulty_unlock_index)
end

LevelUnlockUtils.completed_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local level_difficulty_name = LevelDifficultyDBNames[level_key]

	if level_difficulty_name then
		local difficulty_index = statistics_db:get_persistent_stat(player_stats_id, "completed_levels_difficulty", level_difficulty_name)

		return difficulty_index
	else
		return 0
	end
end

LevelUnlockUtils.highest_completed_difficulty_index_by_act = function (statistics_db, player_stats_id, act_name)
	local act_levels = GameActs[act_name]

	if not act_levels then
		return math.huge
	end

	local act_difficulty_completed_index = math.huge

	for _, level_key in ipairs(act_levels) do
		local difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

		if difficulty_index < act_difficulty_completed_index then
			act_difficulty_completed_index = difficulty_index
		end
	end

	return act_difficulty_completed_index
end

LevelUnlockUtils.completed_adventure_difficulty = function (statistics_db, player_stats_id)
	return 1
end

LevelUnlockUtils.completed_main_game_difficulty = function (statistics_db, player_stats_id)
	local main_game_difficulty_completed_index = math.huge

	for _, level_key in ipairs(MainGameLevels) do
		local difficulty_completed_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

		if difficulty_completed_index < main_game_difficulty_completed_index then
			main_game_difficulty_completed_index = difficulty_completed_index
		end
	end

	return main_game_difficulty_completed_index
end

LevelUnlockUtils.completed_dlc_difficulty = function (statistics_db, player_stats_id, dlc_name)
	local dlc_area_settings = nil

	for area_name, area_settings in pairs(AreaSettings) do
		if area_settings.dlc_name == dlc_name then
			dlc_area_settings = area_settings

			break
		end
	end

	fassert(dlc_area_settings, "Area settings for dlc: %s does not exist.", dlc_name)

	local acts = dlc_area_settings.acts

	fassert(acts, "Acts for dlc: %s does not exist.", dlc_name)

	local dlc_difficulty_completed_index = math.huge

	for _, act_key in ipairs(acts) do
		local difficulty_completed_index = LevelUnlockUtils.highest_completed_difficulty_index_by_act(statistics_db, player_stats_id, act_key)

		if difficulty_completed_index < dlc_difficulty_completed_index then
			dlc_difficulty_completed_index = difficulty_completed_index
		end
	end

	return dlc_difficulty_completed_index
end

local function sort_levels_by_order(a, b)
	local level_settings = LevelSettings
	local a_settings = level_settings[a].map_settings
	local b_settings = level_settings[b].map_settings
	local a_order = a_settings.sorting or 99
	local b_order = b_settings.sorting or 99

	return a_order < b_order
end

local required_completed_levels = {}

LevelUnlockUtils.get_required_completed_levels = function (statistics_db, player_stats_id, level_key)
	table.clear(required_completed_levels)

	local level_settings = LevelSettings[level_key]
	local required_acts = level_settings.required_acts

	if required_acts then
		for _, act_key in ipairs(required_acts) do
			local last_act_level_key = nil
			local highest_presentation_order = -1
			local act_levels = GameActs[act_key]

			for _, act_level_key in ipairs(act_levels) do
				local settings = LevelSettings[act_level_key]

				if highest_presentation_order < settings.act_presentation_order then
					highest_presentation_order = settings.act_presentation_order
					last_act_level_key = act_level_key
				end
			end

			if last_act_level_key then
				local level_stat = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", last_act_level_key)
				local level_completed = level_stat and level_stat ~= 0

				if not level_completed then
					required_completed_levels[last_act_level_key] = true
				end
			end
		end
	end

	local required_levels_unlocked_in_act = RequiredLevelUnlocksByLevel[level_key]

	if required_levels_unlocked_in_act then
		local last_act_level_key = nil
		local highest_presentation_order = -1

		for _, required_act_level_key in ipairs(required_levels_unlocked_in_act) do
			local settings = LevelSettings[required_act_level_key]

			if highest_presentation_order < settings.act_presentation_order then
				highest_presentation_order = settings.act_presentation_order
				last_act_level_key = required_act_level_key
			end
		end

		if last_act_level_key then
			local level_stat = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", last_act_level_key)
			local level_completed = level_stat and level_stat ~= 0

			if not level_completed then
				required_completed_levels[last_act_level_key] = true
			end
		end
	end

	return required_completed_levels
end

LevelUnlockUtils.level_unlocked = function (statistics_db, player_stats_id, level_key, ignore_dlc_check)
	if script_data.unlock_all_levels then
		return true
	end

	local act_key = LevelUnlockUtils.get_act_key_by_level(level_key)
	local settings = LevelSettings[level_key]

	if not ignore_dlc_check then
		local dlc_name = settings.dlc_name

		if dlc_name and not Managers.unlock:is_dlc_unlocked(dlc_name) then
			return false
		end
	end

	if not act_key then
		local required_act_completed = settings.required_act_completed

		if required_act_completed and not LevelUnlockUtils.act_completed(statistics_db, player_stats_id, required_act_completed) then
			return false
		end
	else
		local required_acts = settings.required_acts

		if required_acts then
			for _, act_key in ipairs(required_acts) do
				if not LevelUnlockUtils.act_unlocked(statistics_db, player_stats_id, act_key) then
					return false
				end
			end
		end

		local required_levels_unlocked_in_act = RequiredLevelUnlocksByLevel[level_key]

		if required_levels_unlocked_in_act then
			for _, required_act_level in ipairs(required_levels_unlocked_in_act) do
				local level_stat = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", required_act_level)
				local level_completed = level_stat and level_stat ~= 0

				if not level_completed then
					return false
				end
			end
		end
	end

	return true
end

LevelUnlockUtils.all_levels_completed = function (statistics_db, player_stats_id)
	local level_keys = UnlockableLevelsByGameMode.adventure

	for _, level_key in ipairs(level_keys) do
		local times_completed = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", level_key)

		if times_completed == 0 then
			return false
		end
	end

	return true
end

LevelUnlockUtils.get_act_key_by_level = function (level_key)
	for key, levels in pairs(GameActs) do
		for _, act_level_key in ipairs(levels) do
			if level_key == act_level_key then
				return key
			end
		end
	end
end

LevelUnlockUtils.act_unlocked = function (statistics_db, player_stats_id, act_key)
	assert(GameActs[act_key] ~= nil, "Act %s does not exist.", act_key)

	local act_levels = GameActs[act_key]

	for _, level_key in ipairs(act_levels) do
		local level_stat = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", level_key)
		local level_completed = level_stat and level_stat ~= 0

		if not level_completed then
			return false
		end
	end

	return true
end

LevelUnlockUtils.act_completed = function (statistics_db, player_stats_id, act_key)
	assert(GameActs[act_key] ~= nil, "Act %s does not exist.", act_key)

	local act_levels = GameActs[act_key]

	for _, level_key in ipairs(act_levels) do
		local level_stat = statistics_db:get_persistent_stat(player_stats_id, "completed_levels", level_key)
		local level_completed = level_stat and level_stat ~= 0

		if not level_completed then
			return false
		end
	end

	return true
end

LevelUnlockUtils.num_acts_completed = function (statistics_db, player_stats_id)
	local num = 0

	for act_key, _ in pairs(GameActs) do
		if LevelUnlockUtils.act_completed(statistics_db, player_stats_id, act_key) then
			num = num + 1
		end
	end

	return num
end

LevelUnlockUtils.all_dlc_levels_completed = function (statistics_db, player_stats_id, dlc_name)
	local dlc_area_seetings = nil

	for area_name, area_settings in pairs(AreaSettings) do
		if area_settings.dlc_name == dlc_name then
			dlc_area_seetings = area_settings

			break
		end
	end

	fassert(dlc_area_seetings, "Area settings for dlc: %s does not exist.", dlc_name)

	local acts = dlc_area_seetings.acts

	fassert(acts, "Acts for dlc: %s does not exist.", dlc_name)

	for _, act_key in ipairs(acts) do
		if not LevelUnlockUtils.act_completed(statistics_db, player_stats_id, act_key) then
			return false
		end
	end

	return true
end

LevelUnlockUtils.set_all_acts_incompleted = function ()
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()

	for act_index, key in ipairs(GameActsOrder) do
		local actual_act_index = math.min(act_index + 1, #GameActsOrder)
		local act_key = GameActsOrder[actual_act_index]

		fassert(act_key, "Could not find act for index %d.", actual_act_index)

		for index, key in ipairs(GameActsOrder) do
			local act_levels = GameActs[key]

			for _, level_key in ipairs(act_levels) do
				local completed_times = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key)

				while completed_times > 0 do
					statistics_db:decrement_stat(stats_id, "completed_levels", level_key)

					completed_times = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key)
				end
			end
		end
	end

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
end

LevelUnlockUtils.debug_set_completed_game_difficulty = function (difficulty)
	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player:stats_id()

	for _, level_key in pairs(LevelDifficultyDBNames) do
		slot9 = statistics_db:set_stat(stats_id, "completed_levels_difficulty", level_key, difficulty)
	end

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end

LevelUnlockUtils.debug_unlock_act = function (act_index)
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()
	local actual_act_index = math.min(act_index + 1, #GameActsOrder)
	local act_key = GameActsOrder[actual_act_index]

	assert(act_key, "Could not find act for index %d.", actual_act_index)

	local debug_act_passed = false

	for index, key in ipairs(GameActsOrder) do
		if key == act_key then
			debug_act_passed = true
		end

		local act_levels = GameActs[key]

		for _, level_key in ipairs(act_levels) do
			if not debug_act_passed then
				statistics_db:increment_stat(stats_id, "completed_levels", level_key)
			else
				local completed_times = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key)

				while completed_times > 0 do
					statistics_db:decrement_stat(stats_id, "completed_levels", level_key)

					completed_times = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key)
				end
			end
		end
	end

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end

LevelUnlockUtils.debug_completed_act_levels = function (act_key, complete)
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()
	local act_levels = GameActs[act_key]

	if not act_levels then
		print("Could not find any levels for act", act_key)

		return
	end

	for _, level_key in ipairs(act_levels) do
		if complete then
			statistics_db:increment_stat(stats_id, "completed_levels", level_key)
		else
			statistics_db:set_stat(stats_id, "completed_levels", level_key, 0)
		end
	end

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end

return
