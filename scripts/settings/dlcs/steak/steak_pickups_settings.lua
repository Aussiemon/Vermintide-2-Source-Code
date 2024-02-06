-- chunkname: @scripts/settings/dlcs/steak/steak_pickups_settings.lua

local settings = DLCSettings.steak

settings.pickups = {
	crater_painting = {
		crater_painting = {
			debug_pickup_category = "special",
			hide_on_pickup = true,
			hud_description = "interaction_crater_painting",
			individual_pickup = true,
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "hud_pickup_painting_piece",
			spawn_weighting = 1,
			type = "crater_painting",
			unit_name = "units/weapons/player/pup_crater_painting/pup_crater_painting",
			can_spawn_func = function (params, is_debug_spawn)
				return true
			end,
		},
	},
	crater_pendant = {
		crater_pendant = {
			debug_pickup_category = "special",
			hide_on_pickup = true,
			hud_description = "crater_pendant",
			individual_pickup = true,
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "hud_pickup_painting_piece",
			spawn_weighting = 1,
			type = "crater_pendant",
			unit_name = "units/weapons/player/pup_cameo_pendant/pup_crater_cameo_pendant",
			can_spawn_func = function (params, is_debug_spawn)
				return true
			end,
		},
	},
}
