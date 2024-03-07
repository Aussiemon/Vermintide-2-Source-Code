-- chunkname: @levels/honduras_dlcs/carousel/carousel_hub/world_nav_tag_volumes.lua

local nav_tag_volumes = {
	dz_volume_001 = {
		alt_max = -6.363857269287109,
		alt_min = -8.36385726928711,
		delay_nav_tag_volume_creation = true,
		layer_name = "undefined",
		color = {
			255,
			255,
			0,
			0,
		},
		bottom_points = {
			{
				-43.211700439453125,
				98.92838287353516,
				-8.36385726928711,
			},
			{
				22.908340454101562,
				163.23690795898438,
				-8.36385726928711,
			},
			{
				-2.6338958740234375,
				189.4986572265625,
				-8.36385726928711,
			},
			{
				-68.75393676757812,
				125.19011688232422,
				-8.36385726928711,
			},
		},
	},
}
local version = "1"

return {
	version = version,
	nav_tag_volumes = nav_tag_volumes,
}
