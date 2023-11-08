OutlineSettings = OutlineSettings or {}
OutlineSettings.colors = {
	ally = {
		variable = "outline_color_alpha",
		outline_multiplier = 7,
		pulse_multiplier = 50,
		pulsate = false,
		outline_multiplier_variable = "outline_multiplier_alpha",
		channel = {
			255,
			0,
			0,
			0
		},
		color = {
			255,
			118,
			186,
			0
		}
	},
	knocked_down = {
		variable = "outline_color_red",
		outline_multiplier = 7,
		pulse_multiplier = 50,
		pulsate = false,
		outline_multiplier_variable = "outline_multiplier_red",
		channel = {
			0,
			255,
			0,
			0
		},
		color = {
			255,
			227,
			4,
			4
		}
	},
	interactable = {
		variable = "outline_color_green",
		outline_multiplier = 4,
		pulse_multiplier = 50,
		pulsate = false,
		outline_multiplier_variable = "outline_multiplier_green",
		channel = {
			0,
			0,
			255,
			0
		},
		color = {
			255,
			255,
			255,
			255
		}
	},
	player_attention = {
		variable = "outline_color_blue",
		outline_multiplier = 6,
		pulse_multiplier = 15,
		pulsate = true,
		outline_multiplier_variable = "outline_multiplier_blue",
		channel = {
			0,
			0,
			0,
			255
		},
		color = {
			255,
			30,
			150,
			255
		}
	},
	necromancer_command = {
		variable = "outline_color_green",
		outline_multiplier = 0,
		pulse_multiplier = 0,
		pulsate = false,
		outline_multiplier_variable = "outline_multiplier_alpha",
		channel = {
			255,
			0,
			0,
			187
		},
		color = {
			255,
			0,
			0,
			0
		}
	}
}
OutlineSettings.ranges = {
	small_doors = 4,
	pickup = 10,
	elevators = 10,
	objective_light = 20,
	interactable = 15,
	revive = 50,
	doors = 12.5,
	objective = 35,
	player_husk = 40,
	small_pickup = 2
}
OutlineSettings.flags = {
	non_wall_occluded = "outline_unit",
	wall_occluded = "outline_unit_z"
}
OutlineSettings.templates = {
	ready_for_assisted_respawn_husk = {
		priority = 1,
		method = "within_distance",
		outline_color = OutlineSettings.colors.ally,
		distance = OutlineSettings.ranges.revive,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	ready_for_assisted_respawn = {
		method = "never",
		priority = 1
	},
	dead = {
		method = "never",
		priority = 100
	},
	incapacitated = {
		priority = 1,
		method = "within_distance",
		outline_color = OutlineSettings.colors.knocked_down,
		distance = OutlineSettings.ranges.revive,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	invisible = {
		method = "never",
		priority = 10
	},
	target_enemy = {
		priority = 9,
		method = "ai_alive",
		outline_color = OutlineSettings.colors.knocked_down,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	target_ally = {
		priority = 15,
		method = "ai_alive",
		outline_color = OutlineSettings.colors.player_attention,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	ping_unit = {
		priority = 8,
		method = "ai_alive",
		outline_color = OutlineSettings.colors.player_attention,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	tutorial_highlight = {
		priority = 99,
		method = "always",
		outline_color = OutlineSettings.colors.interactable,
		flag = OutlineSettings.flags.non_wall_occluded
	},
	necromancer_command = {
		priority = 20,
		method = "always",
		outline_color = OutlineSettings.colors.necromancer_command,
		flag = OutlineSettings.flags.non_wall_occluded
	}
}

DLCUtils.require_list("outline_settings")

for name, settings in pairs(OutlineSettings.colors) do
	settings.name = name
end
