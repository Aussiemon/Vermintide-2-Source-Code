local function sort_level_list(a, b)
	local level_settings = LevelSettings
	local a_map_settings = level_settings[a].map_settings
	local b_map_settings = level_settings[b].map_settings
	local a_sorting_index = (a_map_settings and (a_map_settings.sorting or 0)) or 0
	local b_sorting_index = (b_map_settings and (b_map_settings.sorting or 0)) or 0

	return a_sorting_index < b_sorting_index
end

local function setup_game_mode_data(statistics_db, player_stats_id)
	local game_mode_data = {}
	local game_modes = {}
	local only_release = GameSettingsDevelopment.release_levels_only

	for name, level_data in pairs(LevelSettings) do
		if type(level_data) == "table" then
			local debug_level = string.match(level_data.package_name, "resource_packages/levels/debug/")

			if not only_release or not debug_level then
				local game_mode = level_data.game_mode

				if game_mode and game_mode ~= "tutorial" and game_mode ~= "demo" then
					local unlockable = level_data.unlockable

					if unlockable and LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, name) then
						if not game_modes[game_mode] then
							local index = #game_mode_data + 1
							local game_mode_settings = GameModeSettings[game_mode]
							local game_mode_difficulties = game_mode_settings.difficulties
							local game_mode_display_name = game_mode_settings.display_name
							local difficulties = table.clone(game_mode_difficulties)
							difficulties[#difficulties + 1] = "any"
							game_modes[game_mode] = index
							game_mode_data[index] = {
								levels = {},
								difficulties = difficulties,
								game_mode_key = game_mode,
								game_mode_display_name = game_mode_display_name
							}
						end

						if not level_data.supported_game_modes or level_data.supported_game_modes[game_mode] then
							local data = game_mode_data[game_modes[game_mode]]
							local levels = data.levels
							levels[#levels + 1] = name
						end
					end
				end
			end
		end
	end

	for i = 1, #game_mode_data, 1 do
		local data = game_mode_data[i]
		local levels = data.levels

		table.sort(levels, sort_level_list)

		levels[#levels + 1] = "any"
	end

	return game_mode_data
end

local show_lobbies_array = {
	"lb_show_joinable",
	"lb_show_all"
}

if PLATFORM == "ps4" then
	table.insert(show_lobbies_array, 2, "lb_search_type_friends")
end

local distance_array = (PLATFORM == "ps4" and {
	"map_zone_options_2",
	"map_zone_options_3",
	"map_zone_options_5"
}) or {
	"map_zone_options_2",
	"map_zone_options_4",
	"map_zone_options_5"
}

return {
	show_lobbies_table = show_lobbies_array,
	distance_table = distance_array,
	setup_game_mode_data = setup_game_mode_data
}
