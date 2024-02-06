-- chunkname: @levels/honduras_dlcs/morris/sig_mordrek/world_spawn_zones.lua

local path_markers = {
	{
		crossroads = "",
		kind = "good",
		main_path_index = 1,
		marker_type = "normal",
		order = 10,
		pos = {
			-11.079999923706055,
			-4.130000114440918,
			7.150999069213867,
		},
	},
	{
		crossroads = "",
		kind = "good",
		main_path_index = 1,
		marker_type = "normal",
		order = 20,
		pos = {
			-5.949999809265137,
			-3.0999999046325684,
			7.0920000076293945,
		},
	},
}
local main_paths = {
	{
		path_length = 5.232734203338623,
		travel_dist = {
			[1] = 0,
			[2] = 5.232734203338623,
		},
		nodes = {
			{
				-11.079999923706055,
				-4.130000114440918,
				7.229452610015869,
			},
			{
				-5.949999809265137,
				-3.0999999046325684,
				7.168576240539551,
			},
		},
	},
}
local crossroads = {}
local zones = {}
local cover_points = {}
local position_lookup = {}
local number_of_spawns = 0
local num_main_zones = 0
local total_main_path_length = 5.2327342033386
local spawner_version = "1"

return {
	version = spawner_version,
	number_of_spawns = number_of_spawns,
	path_markers = path_markers,
	zones = zones,
	cover_points = cover_points,
	num_main_zones = num_main_zones,
	position_lookup = position_lookup,
	main_paths = main_paths,
	crossroads = crossroads,
	total_main_path_length = total_main_path_length,
}
