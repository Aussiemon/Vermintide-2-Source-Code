-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions.lua

local function sort_level_list(a, b)
	local level_settings = LevelSettings
	local a_map_settings = level_settings[a].map_settings
	local b_map_settings = level_settings[b].map_settings
	local a_sorting_index = a_map_settings and a_map_settings.sorting or 0
	local b_sorting_index = b_map_settings and b_map_settings.sorting or 0

	return a_sorting_index < b_sorting_index
end

local function setup_game_mode_data(statistics_db, player_stats_id)
	local game_mode_data = {}
	local game_mode_index = {}
	local only_release = GameSettingsDevelopment.release_levels_only

	for name, level_data in pairs(LevelSettings) do
		if type(level_data) == "table" and (not only_release or not DebugLevels[name]) then
			local game_mode = level_data.game_mode or level_data.mechanism

			if game_mode and game_mode ~= "tutorial" and game_mode ~= "demo" then
				local unlockable = level_data.unlockable and not level_data.default

				if unlockable and LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, name) then
					if not game_mode_index[game_mode] then
						local game_mode_settings = GameModeSettings[game_mode]
						local game_mode_difficulties = game_mode_settings.difficulties
						local game_mode_display_name = game_mode_settings.display_name
						local difficulties = table.clone(game_mode_difficulties)

						difficulties[#difficulties + 1] = "any"
						game_mode_data[#game_mode_data + 1] = {
							levels = {},
							difficulties = difficulties,
							game_mode_key = game_mode,
							game_mode_display_name = game_mode_display_name,
						}
						game_mode_index[game_mode] = #game_mode_data
					end

					if (not level_data.supported_game_modes or level_data.supported_game_modes[game_mode]) and not level_data.ommit_from_lobby_browser then
						local data = game_mode_data[game_mode_index[game_mode]]
						local levels = data.levels

						levels[#levels + 1] = name
					end
				end
			end
		end
	end

	for i = 1, #game_mode_data do
		local data = game_mode_data[i]
		local levels = data.levels

		table.sort(levels, sort_level_list)

		levels[#levels + 1] = "any"
	end

	local function game_mode_sort_func(game_mode_data_a, game_mode_data_b)
		local game_mode_a_name = Localize(game_mode_data_a.game_mode_display_name)
		local game_mode_b_name = Localize(game_mode_data_b.game_mode_display_name)

		return game_mode_a_name < game_mode_b_name
	end

	table.sort(game_mode_data, game_mode_sort_func)

	local game_modes = {}

	for i = 1, #game_mode_data do
		local game_mode_key = game_mode_data[i].game_mode_key
		local game_mode_index = #game_modes + 1

		game_modes[game_mode_index] = game_mode_key
		game_modes[game_mode_key] = game_mode_index
	end

	local game_mode = "weave"
	local game_mode_settings = GameModeSettings[game_mode]
	local game_mode_display_name = game_mode_settings.display_name
	local index = #game_mode_data + 1

	game_mode_data[index] = {
		levels = {
			"any",
		},
		difficulties = {
			"any",
		},
		game_mode_key = game_mode,
		game_mode_display_name = game_mode_display_name,
	}
	game_modes[game_mode] = #game_modes + 1
	game_modes[#game_modes + 1] = game_mode
	game_mode_data.game_modes = game_modes

	return game_mode_data
end

local show_lobbies_array = {
	"lb_show_joinable",
	"lb_show_all",
}

if IS_PS4 then
	table.insert(show_lobbies_array, 2, "lb_search_type_friends")
end

local distance_array = IS_PS4 and {
	"map_zone_options_2",
	"map_zone_options_3",
	"map_zone_options_5",
} or {
	"map_zone_options_2",
	"map_zone_options_4",
	"map_zone_options_5",
}

return {
	show_lobbies_table = show_lobbies_array,
	distance_table = distance_array,
	setup_game_mode_data = setup_game_mode_data,
}
