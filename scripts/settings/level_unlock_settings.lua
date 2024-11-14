-- chunkname: @scripts/settings/level_unlock_settings.lua

require("scripts/settings/act_settings")
require("scripts/settings/area_settings")

GameActs = {}
MainGameLevels = {}
HelmgartLevels = {}
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
	"act_4",
}
AdventureActStartId = 2
MapPresentationActs = {
	"act_1",
	"act_2",
	"act_3",
	"act_4",
}
GameActsDisplayNames = {
	act_1 = "act_1_display_name",
	act_2 = "act_2_display_name",
	act_3 = "act_3_display_name",
	act_4 = "act_4_display_name",
	prologue = "prologue_display_name",
}

DLCUtils.dofile("level_unlock_settings")
require("scripts/settings/packaged_levels")

local function is_level_available_on_disk(level_data)
	if rawget(_G, "PACKAGED_LEVEL_PACKAGE_NAMES") then
		local packages = level_data.packages

		for i = 1, #packages do
			local package = packages[i]

			if not PACKAGED_LEVEL_PACKAGE_NAMES[package] then
				return false
			end
		end
	end

	return true
end

local only_release = true

local function validate_level_data(level_key, level_data)
	if type(level_data) == "table" then
		local debug_level = false
		local packages = level_data.packages

		for i = 1, #packages do
			if string.find(packages[i], "^resource_packages/levels/debug/") then
				debug_level = true

				break
			end
		end

		if debug_level then
			DebugLevels[level_key] = true
		end

		local act = level_data.act

		if not act then
			return false
		end

		local level_settings = LevelSettings[level_key]

		if only_release then
			local unlockable = level_data.unlockable
			local available = is_level_available_on_disk(level_data)

			return not level_settings.hub_level and unlockable and available and not debug_level
		else
			local unlockable = level_data.unlockable

			return not level_settings.hub_level and unlockable
		end
	end
end

for level_key, level_data in pairs(LevelSettings) do
	local valid_level = validate_level_data(level_key, level_data)

	if valid_level then
		local game_mode = level_data.game_mode or level_data.mechanism

		if game_mode then
			if not LevelGameModeTypes[game_mode] then
				LevelGameModeTypes[game_mode] = true
			end

			if not UnlockableLevelsByGameMode[game_mode] then
				UnlockableLevelsByGameMode[game_mode] = {}
			end

			UnlockableLevelsByGameMode[game_mode][#UnlockableLevelsByGameMode[game_mode] + 1] = level_key
		end

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

local prologue_index

for i = 1, #MainGameLevels do
	if MainGameLevels[i] == "prologue" then
		prologue_index = i
	end
end

HelmgartLevels = table.clone(MainGameLevels)

if prologue_index then
	table.remove(HelmgartLevels, prologue_index)
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

for _, act_data in pairs(GameActs) do
	table.sort(act_data, function (a, b)
		return LevelSettings[a].act_unlock_order < LevelSettings[b].act_unlock_order
	end)
end

LevelUnlockUtils = {}

LevelUnlockUtils.unlocked_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local difficulties, starting_difficulty = Managers.state.difficulty:get_default_difficulties()
	local automatic_difficulty_unlock_index = table.find(difficulties, starting_difficulty)
	local highest_available_difficulty_index = #difficulties
	local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

	return math.max(math.min(completed_difficulty_index + 1, highest_available_difficulty_index), automatic_difficulty_unlock_index)
end

LevelUnlockUtils.completed_level_difficulty_index = function (statistics_db, player_stats_id, level_key)
	local level_difficulty_name = LevelDifficultyDBNames[level_key]

	if level_difficulty_name then
		return math.min(5, statistics_db:get_persistent_stat(player_stats_id, "completed_levels_difficulty", level_difficulty_name))
	else
		return 0
	end
end

LevelUnlockUtils.unlocked_journeys = function (statistics_db, player_stats_id)
	local journeys = {}

	for i = 1, #AvailableJourneyOrder do
		local journey_name = AvailableJourneyOrder[i]

		if i == 1 then
			journeys[#journeys + 1] = journey_name
		else
			local difficulty = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, player_stats_id, AvailableJourneyOrder[i - 1])

			if not script_data.unlock_all_levels and (not difficulty or difficulty == 0) then
				break
			else
				journeys[#journeys + 1] = journey_name
			end
		end
	end

	return journeys
end

LevelUnlockUtils.completed_journey_difficulty_index = function (statistics_db, player_stats_id, journey_name)
	local journey_difficulty_name = JourneyDifficultyDBNames[journey_name]

	if journey_difficulty_name then
		local difficulty_index = statistics_db:get_persistent_stat(player_stats_id, "completed_journeys_difficulty", journey_difficulty_name)

		return difficulty_index
	else
		return 0
	end
end

LevelUnlockUtils.completed_hero_journey_difficulty_index = function (statistics_db, player_stats_id, hero, journey_name)
	local journey_difficulty_name = JourneyDifficultyDBNames[journey_name]

	if journey_difficulty_name then
		local difficulty_index = statistics_db:get_persistent_stat(player_stats_id, "completed_hero_journey_difficulty", hero, journey_difficulty_name)

		return difficulty_index
	else
		return 0
	end
end

LevelUnlockUtils.completed_journey_dominant_god_difficulty_index = function (statistics_db, player_stats_id, dominant_god)
	local journey_dominant_god_difficulty_name = JourneyDominantGodDifficultyDBNames[dominant_god]

	if journey_dominant_god_difficulty_name then
		local difficulty_index = statistics_db:get_persistent_stat(player_stats_id, "completed_journey_dominant_god_difficulty", journey_dominant_god_difficulty_name)

		return difficulty_index
	else
		return 0
	end
end

LevelUnlockUtils.highest_completed_difficulty_index_by_act = function (statistics_db, player_stats_id, act_name)
	local act_levels = GameActs[act_name]

	if not act_levels then
		print(table.dump(GameActs, nil, 2))
		fassert(false, "act name is not included in GameActs: %s", tostring(act_name))

		return math.huge
	end

	local act_difficulty_completed_index = math.huge

	for _, level_key in ipairs(act_levels) do
		local difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key)

		if not difficulty_index or difficulty_index > 5 or difficulty_index < 0 then
			fassert(false, "highest completed difficulty index was incorrect: %s", difficulty_index and tostring(difficulty_index) or "n/a")
		end

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
	local dlc_area_settings

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
			local last_act_level_key
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
		local last_act_level_key
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

LevelUnlockUtils.current_weave = function (statistics_db, player_stats_id, ignore_dlc_check)
	if script_data.unlock_all_levels then
		local weave_data = WeaveSettings.templates_ordered[#WeaveSettings.templates_ordered]

		return weave_data.name
	end

	if not ignore_dlc_check then
		local weave_data = WeaveSettings.templates_ordered[1]
		local dlc_name = weave_data.dlc_name

		if dlc_name and not Managers.unlock:is_dlc_unlocked(dlc_name) then
			return weave_data.name
		end
	end

	local weave_templates = WeaveSettings.templates_ordered
	local num_entries = #weave_templates
	local highest_consecutive_unlocked_weave = 1
	local highest_consecutive_unlocked_weave_found = false

	for i = 1, num_entries do
		local template = weave_templates[i]
		local weave_completed = LevelUnlockUtils.weave_unlocked(statistics_db, player_stats_id, template.name, ignore_dlc_check)

		if weave_completed then
			local next_weave = i + 1

			if weave_templates[next_weave] then
				highest_consecutive_unlocked_weave = next_weave
			end
		else
			break
		end
	end

	local weave_template = weave_templates[highest_consecutive_unlocked_weave]

	return weave_template.name
end

LevelUnlockUtils.weave_unlocked = function (statistics_db, player_stats_id, weave_name, ignore_dlc_check, num_players)
	if script_data.unlock_all_levels then
		return true
	end

	local weave_data = WeaveSettings.templates[weave_name]

	if not ignore_dlc_check then
		local dlc_name = weave_data.dlc_name

		if dlc_name and not Managers.unlock:is_dlc_unlocked(dlc_name) then
			return false
		end
	end

	local weave_tier = weave_data.tier
	local completed_ever = weave_tier <= 40 and statistics_db:get_persistent_stat(player_stats_id, "completed_weaves", weave_name) > 0
	local completed_season = false

	if not completed_ever then
		local min_players = num_players and math.max(num_players, 1) or 1
		local max_players = num_players and math.max(num_players, 4) or 4

		for i = min_players, max_players do
			local stat_name = ScorpionSeasonalSettings.get_weave_score_stat(weave_tier, i)

			completed_season = statistics_db:get_persistent_stat(player_stats_id, ScorpionSeasonalSettings.current_season_name, stat_name) > 0

			if completed_season then
				break
			end
		end
	end

	return completed_ever or completed_season
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
	local dlc_area_seetings

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

LevelUnlockUtils.get_next_adventure_level = function (statistics_db, player_stats_id)
	for act_id = AdventureActStartId, #GameActsOrder do
		local act = GameActsOrder[act_id]

		if not LevelUnlockUtils.act_completed(statistics_db, player_stats_id, act) then
			local act_levels = GameActs[act]

			for act_level_id = 1, #act_levels do
				local act_level_key = act_levels[act_level_id]

				if LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, act_level_key) <= 0 then
					return act_level_key
				end
			end
		end
	end

	return nil
end

LevelUnlockUtils.debug_set_completed_game_difficulty = function (difficulty)
	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player:stats_id()

	for _, level_key in pairs(LevelDifficultyDBNames) do
		local difficulty = statistics_db:set_stat(stats_id, "completed_levels_difficulty", level_key, difficulty)
	end

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end

LevelUnlockUtils.debug_set_completed_journey_difficulty = function (journey_name, difficulty_id)
	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player:stats_id()
	local journey_difficulty_name = JourneyDifficultyDBNames[journey_name]

	statistics_db:set_stat(stats_id, "completed_journeys_difficulty", journey_difficulty_name, difficulty_id)

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end

LevelUnlockUtils.debug_set_completed_hero_journey_difficulty = function (hero, journey_name, difficulty_id)
	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player:stats_id()
	local journey_difficulty_name = JourneyDifficultyDBNames[journey_name]

	statistics_db:set_stat(stats_id, "completed_hero_journey_difficulty", hero, journey_difficulty_name, difficulty_id)

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

LevelUnlockUtils.debug_complete_level = function (level_key)
	local player_manager = Managers.player
	local statistics_db = player_manager:statistics_db()
	local player = player_manager:local_player()
	local stats_id = player:stats_id()

	statistics_db:set_stat(stats_id, "completed_levels", level_key, 1)

	local backend_stats = {}

	statistics_db:generate_backend_stats(stats_id, backend_stats)
	Managers.backend:set_stats(backend_stats)
	Managers.backend:commit()
end
