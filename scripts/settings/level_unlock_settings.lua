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

		if only_release then
			local unlockable = level_data.unlockable
			local available = is_level_available_on_disk(level_data)

			return level_key ~= "inn_level" and unlockable and available and not debug_level
		else
			local unlockable = level_data.unlockable

			return level_key ~= "inn_level" and unlockable
		end
	end

	return 
end

for level_key, level_data in pairs(LevelSettings) do
	local valid_level = validate_level_data(level_key, level_data)

	if valid_level then
		print("valid level " .. level_key)

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

		GameActs[act][#GameActs[act] + 1] = level_key
		MainGameLevels[#MainGameLevels + 1] = level_key
		UnlockableLevels[#UnlockableLevels + 1] = level_key
	end
end

for id, act_name in pairs(GameActsOrder) do
	if not GameActs[act_name] then
		GameActsOrder[id] = nil
	end
end

for _, level_key in ipairs(UnlockableLevels) do
	local level_data = LevelSettings[level_key]
	local act_unlock_order = level_data.act_unlock_order

	if act_unlock_order and 0 < act_unlock_order then
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

LevelUnlockUtils = {
	current_act_progression_index = function (statistics_db, player_stats_id)
		for act_index, key in ipairs(GameActsOrder) do
			local act_levels = GameActs[key]

			for _, level_key in ipairs(act_levels) do
				local level_stat = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels", level_key)
				local level_completed = level_stat and level_stat ~= 0

				if not level_completed then
					return math.max(act_index - 1, 0)
				end
			end
		end

		return math.max(#GameActsOrder - 1, 0)
	end,
	current_act_progression_raw = function ()
		local stats = Managers.backend:get_stats()

		for act_index, key in ipairs(GameActsOrder) do
			local act_levels = GameActs[key]

			for _, level_key in ipairs(act_levels) do
				local level_stat = tonumber(stats[level_key])
				local level_completed = level_stat and 1 <= level_stat

				if not level_completed then
					return math.max(act_index - 1, 0)
				end
			end
		end

		return math.max(#GameActsOrder - 1, 0)
	end
}
LevelUnlockUtils.unlocked_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local level_settings = LevelSettings[level_key]
	local game_mode = level_settings.game_mode

	if game_mode == "adventure" and PLATFORM ~= "win32" then
		local difficulties, starting_difficulty = Managers.state.difficulty:get_level_difficulties(level_key)
		local automatic_difficulty_unlock_index = table.find(difficulties, starting_difficulty)
		local highest_available_difficulty_index = #difficulties
		local highest_completed_difficulty_index = highest_available_difficulty_index

		for _, level in ipairs(MainGameLevels) do
			local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level)

			if completed_difficulty_index < highest_completed_difficulty_index then
				highest_completed_difficulty_index = completed_difficulty_index
			end
		end

		return math.max(math.min(highest_completed_difficulty_index + 1, highest_available_difficulty_index), automatic_difficulty_unlock_index)
	else
		local difficulties, starting_difficulty = Managers.state.difficulty:get_level_difficulties(level_key)
		local automatic_difficulty_unlock_index = table.find(difficulties, starting_difficulty)
		local highest_available_difficulty_index = #difficulties
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

		return math.max(math.min(completed_difficulty_index + 1, highest_available_difficulty_index), automatic_difficulty_unlock_index)
	end

	return 
end
LevelUnlockUtils.completed_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local level_difficulty_name = LevelDifficultyDBNames[level_key]

	if level_difficulty_name then
		local difficulty_index = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels_difficulty", level_difficulty_name)

		return difficulty_index
	else
		return 0
	end

	return 
end
LevelUnlockUtils.completed_adventure_difficulty = function (statistics_db, player_stats_id)
	local lowest_completed = math.huge

	for _, act_key in ipairs(GameActsOrder) do
		for _, level_key in ipairs(GameActs[act_key]) do
			local level_difficulty_name = LevelDifficultyDBNames[level_key]

			if level_difficulty_name then
				local difficulty_index = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels_difficulty", level_difficulty_name)

				if difficulty_index < lowest_completed then
					lowest_completed = difficulty_index
				end
			end
		end
	end

	return lowest_completed
end

local function sort_levels_by_order(a, b)
	local level_settings = LevelSettings
	local a_settings = level_settings[a].map_settings
	local b_settings = level_settings[b].map_settings
	local a_order = a_settings.sorting or 99
	local b_order = b_settings.sorting or 99

	return a_order < b_order
end

LevelUnlockUtils.level_unlocked = function (statistics_db, player_stats_id, level_key)
	if script_data.unlock_all_levels then
		return true
	end

	local act_key = LevelUnlockUtils.get_act_key_by_level(level_key)
	local settings = LevelSettings[level_key]

	if not act_key then
		local level_game_mode = settings.game_mode
		local dlc_name = settings.dlc_name
		local required_act_completed = settings.required_act_completed

		if required_act_completed then
			if LevelUnlockUtils.act_completed(statistics_db, player_stats_id, required_act_completed) then
				if dlc_name then
					return Managers.unlock:is_dlc_unlocked(dlc_name)
				else
					return true
				end
			else
				return false
			end
		elseif dlc_name then
			return Managers.unlock:is_dlc_unlocked(dlc_name)
		else
			return true
		end

		return false
	end

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
			local level_stat = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels", required_act_level)
			local level_completed = level_stat and level_stat ~= 0

			if not level_completed then
				return false
			end
		end
	end

	return true
end
LevelUnlockUtils.all_levels_completed = function (statistics_db, player_stats_id)
	local level_keys = UnlockableLevelsByGameMode.adventure

	for _, level_key in ipairs(level_keys) do
		local times_completed = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels", level_key)

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

	return 
end
LevelUnlockUtils.act_unlocked = function (statistics_db, player_stats_id, act_key)
	assert(GameActs[act_key] ~= nil, "Act %s does not exist.", act_key)

	for _, key in ipairs(GameActsOrder) do
		if key == act_key then
			return true
		end

		local act_levels = GameActs[key]

		for _, level_key in ipairs(act_levels) do
			local level_stat = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels", level_key)
			local level_completed = level_stat and level_stat ~= 0

			if not level_completed then
				return false
			end
		end
	end

	return false
end
LevelUnlockUtils.act_completed = function (statistics_db, player_stats_id, act_key)
	assert(GameActs[act_key] ~= nil, "Act %s does not exist.", act_key)

	local act_levels = GameActs[act_key]

	for _, level_key in ipairs(act_levels) do
		local level_stat = statistics_db.get_persistent_stat(statistics_db, player_stats_id, "completed_levels", level_key)
		local level_completed = level_stat and level_stat ~= 0

		if not level_completed then
			return false
		end
	end

	return true
end
LevelUnlockUtils.num_acts_completed = function (statistics_db, player_stats_id)
	local num = 0

	for _, key in ipairs(GameActsOrder) do
		if LevelUnlockUtils.act_completed(statistics_db, player_stats_id, key) then
			num = num + 1
		end
	end

	return num
end
LevelUnlockUtils.all_acts_completed = function (statistics_db, player_stats_id)
	for _, key in ipairs(GameActsOrder) do
		if not LevelUnlockUtils.act_completed(statistics_db, player_stats_id, key) then
			return false
		end
	end

	return true
end
LevelUnlockUtils.set_all_acts_incompleted = function ()
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local player = player_manager.local_player(player_manager)
	local stats_id = player.stats_id(player)

	for act_index, key in ipairs(GameActsOrder) do
		local actual_act_index = math.min(act_index + 1, #GameActsOrder)
		local act_key = GameActsOrder[actual_act_index]

		assert(act_key, "Could not find act for index %d.", actual_act_index)

		for index, key in ipairs(GameActsOrder) do
			local act_levels = GameActs[key]

			for _, level_key in ipairs(act_levels) do
				local completed_times = statistics_db.get_persistent_stat(statistics_db, stats_id, "completed_levels", level_key)

				while 0 < completed_times do
					statistics_db.decrement_stat(statistics_db, stats_id, "completed_levels", level_key)

					completed_times = statistics_db.get_persistent_stat(statistics_db, stats_id, "completed_levels", level_key)
				end
			end
		end
	end

	local backend_stats = {}

	statistics_db.generate_backend_stats(statistics_db, stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)

	return 
end
LevelUnlockUtils.debug_set_completed_game_difficulty = function (difficulty)
	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player.stats_id(player)

	for _, level_key in pairs(LevelDifficultyDBNames) do
		slot9 = statistics_db.set_stat(statistics_db, stats_id, "completed_levels_difficulty", level_key, difficulty)
	end

	local backend_stats = {}

	statistics_db.generate_backend_stats(statistics_db, stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()

	return 
end
LevelUnlockUtils.debug_unlock_act = function (act_index)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local player = player_manager.local_player(player_manager)
	local stats_id = player.stats_id(player)
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
				statistics_db.increment_stat(statistics_db, stats_id, "completed_levels", level_key)
			else
				local completed_times = statistics_db.get_persistent_stat(statistics_db, stats_id, "completed_levels", level_key)

				while 0 < completed_times do
					statistics_db.decrement_stat(statistics_db, stats_id, "completed_levels", level_key)

					completed_times = statistics_db.get_persistent_stat(statistics_db, stats_id, "completed_levels", level_key)
				end
			end
		end
	end

	local backend_stats = {}

	statistics_db.generate_backend_stats(statistics_db, stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()

	return 
end
LevelUnlockUtils.debug_completed_act_levels = function (act_key, complete)
	local player_manager = Managers.player
	local statistics_db = player_manager.statistics_db(player_manager)
	local player = player_manager.local_player(player_manager)
	local stats_id = player.stats_id(player)
	local act_levels = GameActs[act_key]

	if not act_levels then
		print("Could not find any levels for act", act_key)

		return 
	end

	for _, level_key in ipairs(act_levels) do
		if complete then
			statistics_db.increment_stat(statistics_db, stats_id, "completed_levels", level_key)
		else
			statistics_db.set_stat(statistics_db, stats_id, "completed_levels", level_key, 0)
		end
	end

	local backend_stats = {}

	statistics_db.generate_backend_stats(statistics_db, stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()

	return 
end

return 
