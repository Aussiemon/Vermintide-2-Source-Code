﻿-- chunkname: @scripts/settings/dlcs/carousel/carousel_equipment_settings.lua

local settings = DLCSettings.carousel

settings.cosmetics_files = {
	"scripts/settings/equipment/cosmetics_vs",
}
settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_carousel",
}
settings.action_template_file_names = {
	"scripts/unit_extensions/weapons/actions/action_warpfire_thrower",
}
settings.action_classes_lookup = {
	warpfire_thrower = "ActionWarpfireThrower",
}
