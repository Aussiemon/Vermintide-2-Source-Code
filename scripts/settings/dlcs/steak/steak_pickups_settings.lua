local settings = DLCSettings.steak
settings.pickups = {
	crater_painting = {
		crater_painting = {
			only_once = true,
			individual_pickup = true,
			hide_on_pickup = true,
			type = "crater_painting",
			pickup_sound_event = "hud_pickup_painting_piece",
			debug_pickup_category = "special",
			spawn_weighting = 1,
			unit_name = "units/weapons/player/pup_crater_painting/pup_crater_painting",
			local_pickup_sound = true,
			hud_description = "interaction_crater_painting",
			can_spawn_func = function (params, is_debug_spawn)
				return true
			end
		}
	},
	crater_pendant = {
		crater_pendant = {
			only_once = true,
			individual_pickup = true,
			hide_on_pickup = true,
			type = "crater_pendant",
			pickup_sound_event = "hud_pickup_painting_piece",
			debug_pickup_category = "special",
			spawn_weighting = 1,
			unit_name = "units/weapons/player/pup_cameo_pendant/pup_crater_cameo_pendant",
			local_pickup_sound = true,
			hud_description = "crater_pendant",
			can_spawn_func = function (params, is_debug_spawn)
				return true
			end
		}
	}
}

return
