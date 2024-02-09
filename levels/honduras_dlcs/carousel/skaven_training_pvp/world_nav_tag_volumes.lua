-- chunkname: @levels/honduras_dlcs/carousel/skaven_training_pvp/world_nav_tag_volumes.lua

local nav_tag_volumes = {
	volume_001 = {
		alt_max = 15.097179412841797,
		alt_min = -51.06070327758789,
		delay_nav_tag_volume_creation = true,
		layer_name = "NO_SPAWN",
		color = {
			255,
			30,
			230,
			50,
		},
		bottom_points = {
			{
				30.002296447753906,
				48.35248565673828,
				-51.06070327758789,
			},
			{
				163.6904296875,
				48.35248565673828,
				-51.06070327758789,
			},
			{
				163.6904296875,
				265.93731689453125,
				-51.06070327758789,
			},
			{
				30.002296447753906,
				265.93731689453125,
				-51.06070327758789,
			},
			{
				-37.47826385498047,
				166.40029907226562,
				-51.06070327758789,
			},
		},
	},
}
local version = "1"

return {
	version = version,
	nav_tag_volumes = nav_tag_volumes,
}
