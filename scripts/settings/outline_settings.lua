-- chunkname: @scripts/settings/outline_settings.lua

OutlineSettings = OutlineSettings or {}
OutlineSettings.colors = {
	ally = {
		outline_multiplier = 7,
		outline_multiplier_variable = "outline_multiplier_alpha",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_alpha",
		channel = {
			255,
			0,
			0,
			0,
		},
		color = {
			255,
			118,
			186,
			0,
		},
	},
	knocked_down = {
		outline_multiplier = 7,
		outline_multiplier_variable = "outline_multiplier_red",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_red",
		channel = {
			0,
			255,
			0,
			0,
		},
		color = {
			255,
			227,
			4,
			4,
		},
	},
	interactable = {
		outline_multiplier = 4,
		outline_multiplier_variable = "outline_multiplier_green",
		pulsate = false,
		pulse_multiplier = 50,
		variable = "outline_color_green",
		channel = {
			0,
			0,
			255,
			0,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	},
	player_attention = {
		outline_multiplier = 6,
		outline_multiplier_variable = "outline_multiplier_blue",
		pulsate = true,
		pulse_multiplier = 15,
		variable = "outline_color_blue",
		channel = {
			0,
			0,
			0,
			255,
		},
		color = {
			255,
			30,
			150,
			255,
		},
	},
	necromancer_command = {
		outline_multiplier = 0,
		outline_multiplier_variable = "outline_multiplier_alpha",
		pulsate = false,
		pulse_multiplier = 0,
		variable = "outline_color_green",
		channel = {
			255,
			0,
			0,
			187,
		},
		color = {
			255,
			0,
			0,
			0,
		},
	},
}
OutlineSettings.ranges = {
	doors = 12.5,
	elevators = 10,
	interactable = 15,
	objective = 35,
	objective_light = 20,
	pickup = 10,
	player_husk = 40,
	revive = 50,
	small_doors = 4,
	small_pickup = 2,
}
OutlineSettings.flags = {
	non_wall_occluded = "outline_unit",
	wall_occluded = "outline_unit_z",
}
OutlineSettings.templates = {
	ready_for_assisted_respawn_husk = {
		method = "within_distance",
		priority = 1,
		outline_color = OutlineSettings.colors.ally,
		distance = OutlineSettings.ranges.revive,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	ready_for_assisted_respawn = {
		method = "never",
		priority = 1,
	},
	dead = {
		method = "never",
		priority = 100,
	},
	incapacitated = {
		method = "within_distance",
		priority = 1,
		outline_color = OutlineSettings.colors.knocked_down,
		distance = OutlineSettings.ranges.revive,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	invisible = {
		method = "never",
		priority = 10,
	},
	target_enemy = {
		method = "ai_alive",
		priority = 9,
		outline_color = OutlineSettings.colors.knocked_down,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	target_ally = {
		method = "ai_alive",
		priority = 15,
		outline_color = OutlineSettings.colors.player_attention,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	ping_unit = {
		method = "ai_alive",
		priority = 8,
		outline_color = OutlineSettings.colors.player_attention,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	tutorial_highlight = {
		method = "always",
		priority = 99,
		outline_color = OutlineSettings.colors.interactable,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
	necromancer_command = {
		method = "always",
		priority = 20,
		outline_color = OutlineSettings.colors.necromancer_command,
		flag = OutlineSettings.flags.non_wall_occluded,
	},
}

DLCUtils.require_list("outline_settings")

for name, settings in pairs(OutlineSettings.colors) do
	settings.name = name
end
