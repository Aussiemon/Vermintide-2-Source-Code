-- chunkname: @scripts/unit_extensions/weapons/spread/spread_templates.lua

SpreadTemplates = {}
SpreadTemplates.default = {
	continuous = {
		still = {
			max_pitch = 1,
			max_yaw = 1,
		},
		moving = {
			max_pitch = 3,
			max_yaw = 3,
		},
		crouch_still = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 4,
			immediate_yaw = 4,
		},
	},
}
SpreadTemplates.repeating_pistol = {
	continuous = {
		still = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
		moving = {
			max_pitch = 1.05,
			max_yaw = 1.05,
		},
		crouch_still = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.35,
			immediate_yaw = 0.35,
		},
	},
}
SpreadTemplates.repeating_crossbow_burst = {
	continuous = {
		still = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		crouch_still = {
			max_pitch = 0.3,
			max_yaw = 0.3,
		},
		crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_still = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.2,
			immediate_yaw = 0.2,
		},
	},
}
SpreadTemplates.sparks = {
	continuous = {
		still = {
			max_pitch = 0.75,
			max_yaw = 1.5,
		},
		moving = {
			max_pitch = 0.9,
			max_yaw = 1.75,
		},
		crouch_still = {
			max_pitch = 0.7,
			max_yaw = 1.4,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 4,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.25,
			immediate_yaw = 0.5,
		},
	},
}
SpreadTemplates.spear = {
	continuous = {
		still = {
			max_pitch = 0.25,
			max_yaw = 0.25,
		},
		moving = {
			max_pitch = 0.35,
			max_yaw = 0.35,
		},
		crouch_still = {
			max_pitch = 0.2,
			max_yaw = 0.2,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 6,
			immediate_yaw = 6,
		},
	},
}
SpreadTemplates.crossbow = {
	continuous = {
		still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		moving = {
			max_pitch = 1.25,
			max_yaw = 1.25,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		zoomed_still = {
			max_pitch = 0.15,
			max_yaw = 0.15,
		},
		zoomed_moving = {
			max_pitch = 0.25,
			max_yaw = 0.25,
		},
		zoomed_crouch_still = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 100.4,
			immediate_yaw = 100.4,
		},
		shooting = {
			immediate_pitch = 6,
			immediate_yaw = 6,
		},
	},
}
SpreadTemplates.repeating_crossbow_3bolt = {
	continuous = {
		still = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		moving = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		crouch_moving = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		zoomed_still = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		zoomed_moving = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		zoomed_crouch_still = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.5,
			max_yaw = 3.5,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 100.4,
			immediate_yaw = 100.4,
		},
		shooting = {
			immediate_pitch = 6,
			immediate_yaw = 6,
		},
	},
}
SpreadTemplates.bounty_hunter_handgun = {
	continuous = {
		still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		crouch_moving = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
		zoomed_still = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
		zoomed_moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		zoomed_crouch_still = {
			max_pitch = 0.6,
			max_yaw = 0.6,
		},
		zoomed_crouch_moving = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0,
			immediate_yaw = 0,
		},
	},
}
SpreadTemplates.handgun = {
	continuous = {
		still = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		moving = {
			max_pitch = 2.25,
			max_yaw = 2.25,
		},
		crouch_still = {
			max_pitch = 1.75,
			max_yaw = 1.75,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0.05,
			max_yaw = 0.05,
		},
		zoomed_moving = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_crouch_still = {
			max_pitch = 0.05,
			max_yaw = 0.05,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.8,
			max_yaw = 0.8,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 6,
			immediate_yaw = 6,
		},
	},
}
SpreadTemplates.repeating_handgun = {
	continuous = {
		still = {
			max_pitch = 0.6,
			max_yaw = 0.6,
		},
		moving = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_still = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0.1,
			max_yaw = 0.1,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
	},
}
SpreadTemplates.longbow = {
	continuous = {
		still = {
			max_pitch = 0.65,
			max_yaw = 0.65,
		},
		moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		crouch_still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.5,
			immediate_yaw = 0.5,
		},
	},
}
SpreadTemplates.empire_longbow = {
	continuous = {
		still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		crouch_still = {
			max_pitch = 1.25,
			max_yaw = 1.25,
		},
		crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
		zoomed_still = {
			max_pitch = 0.25,
			max_yaw = 0.25,
		},
		zoomed_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_crouch_still = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		zoomed_crouch_moving = {
			max_pitch = 2,
			max_yaw = 2,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.5,
			immediate_yaw = 0.5,
		},
	},
}
SpreadTemplates.bow = {
	continuous = {
		still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.5,
			immediate_yaw = 0.5,
		},
	},
}
SpreadTemplates.bounty_hunter_shotgun = {
	continuous = {
		still = {
			max_pitch = 6,
			max_yaw = 20,
		},
		moving = {
			max_pitch = 6,
			max_yaw = 20,
		},
		crouch_still = {
			max_pitch = 6,
			max_yaw = 20,
		},
		crouch_moving = {
			max_pitch = 6,
			max_yaw = 20,
		},
		zoomed_still = {
			max_pitch = 6,
			max_yaw = 20,
		},
		zoomed_moving = {
			max_pitch = 6,
			max_yaw = 20,
		},
		zoomed_crouch_still = {
			max_pitch = 6,
			max_yaw = 20,
		},
		zoomed_crouch_moving = {
			max_pitch = 6,
			max_yaw = 20,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 0.2,
			immediate_yaw = 0.2,
		},
		shooting = {
			immediate_pitch = 10,
			immediate_yaw = 10,
		},
	},
}
SpreadTemplates.blunderbuss = {
	continuous = {
		still = {
			max_pitch = 6,
			max_yaw = 9,
		},
		moving = {
			max_pitch = 6,
			max_yaw = 9,
		},
		crouch_still = {
			max_pitch = 6,
			max_yaw = 9,
		},
		crouch_moving = {
			max_pitch = 6,
			max_yaw = 9,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 0.2,
			immediate_yaw = 0.2,
		},
		shooting = {
			immediate_pitch = 10,
			immediate_yaw = 10,
		},
	},
}
SpreadTemplates.repeating_handgun_special = {
	continuous = {
		still = {
			max_pitch = 4,
			max_yaw = 6,
		},
		moving = {
			max_pitch = 4,
			max_yaw = 6,
		},
		crouch_still = {
			max_pitch = 4,
			max_yaw = 6,
		},
		crouch_moving = {
			max_pitch = 4,
			max_yaw = 6,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 2.4,
			max_yaw = 4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 2.4,
			max_yaw = 4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 2,
			immediate_yaw = 2,
		},
	},
}
SpreadTemplates.heavy_steam_pistol_special = {
	continuous = {
		still = {
			max_pitch = 7,
			max_yaw = 9,
		},
		moving = {
			max_pitch = 8,
			max_yaw = 11,
		},
		crouch_still = {
			max_pitch = 6,
			max_yaw = 8,
		},
		crouch_moving = {
			max_pitch = 7,
			max_yaw = 9,
		},
		zoomed_still = {
			max_pitch = 8,
			max_yaw = 11,
		},
		zoomed_moving = {
			max_pitch = 8,
			max_yaw = 11,
		},
		zoomed_crouch_still = {
			max_pitch = 8,
			max_yaw = 11,
		},
		zoomed_crouch_moving = {
			max_pitch = 8,
			max_yaw = 11,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 3,
			immediate_yaw = 3,
		},
		shooting = {
			immediate_pitch = 5,
			immediate_yaw = 5,
		},
	},
}
SpreadTemplates.rake_shot = {
	continuous = {
		still = {
			max_pitch = 4.5,
			max_yaw = 6,
		},
		moving = {
			max_pitch = 4.5,
			max_yaw = 6,
		},
		crouch_still = {
			max_pitch = 4.5,
			max_yaw = 6,
		},
		crouch_moving = {
			max_pitch = 4.5,
			max_yaw = 6,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 5,
			immediate_yaw = 5,
		},
	},
}
SpreadTemplates.rake_twin_shot = {
	continuous = {
		still = {
			max_pitch = 10,
			max_yaw = 12,
		},
		moving = {
			max_pitch = 10,
			max_yaw = 12,
		},
		crouch_still = {
			max_pitch = 10,
			max_yaw = 12,
		},
		crouch_moving = {
			max_pitch = 10,
			max_yaw = 12,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 10,
			immediate_yaw = 10,
		},
	},
}
SpreadTemplates.brace_of_pistols = {
	continuous = {
		still = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		moving = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 0.4,
			immediate_yaw = 0.4,
		},
		shooting = {
			immediate_pitch = 0.25,
			immediate_yaw = 0.25,
		},
	},
}
SpreadTemplates.pistol_special = {
	continuous = {
		still = {
			max_pitch = 1,
			max_yaw = 1,
		},
		moving = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 1,
			max_yaw = 1,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 0.25,
			immediate_yaw = 0.25,
		},
	},
}
SpreadTemplates.brace_of_drake_pistols = {
	continuous = {
		still = {
			max_pitch = 2,
			max_yaw = 2,
		},
		moving = {
			max_pitch = 3,
			max_yaw = 3,
		},
		crouch_still = {
			max_pitch = 2,
			max_yaw = 2,
		},
		crouch_moving = {
			max_pitch = 2.5,
			max_yaw = 2.5,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 3,
			immediate_yaw = 3,
		},
	},
}
SpreadTemplates.drakegun = {
	continuous = {
		still = {
			max_pitch = 1.75,
			max_yaw = 1.75,
		},
		moving = {
			max_pitch = 3,
			max_yaw = 3,
		},
		crouch_still = {
			max_pitch = 3,
			max_yaw = 3,
		},
		crouch_moving = {
			max_pitch = 3.5,
			max_yaw = 3.5,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 10,
			immediate_yaw = 10,
		},
	},
}
SpreadTemplates.drake_pistol_charged = {
	continuous = {
		still = {
			max_pitch = 6,
			max_yaw = 15,
		},
		moving = {
			max_pitch = 6,
			max_yaw = 15,
		},
		crouch_still = {
			max_pitch = 6,
			max_yaw = 15,
		},
		crouch_moving = {
			max_pitch = 6,
			max_yaw = 15,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 10,
			immediate_yaw = 10,
		},
	},
}
SpreadTemplates.fireball = {
	continuous = {
		still = {
			max_pitch = 1,
			max_yaw = 1,
		},
		moving = {
			max_pitch = 1.5,
			max_yaw = 1.5,
		},
		crouch_still = {
			max_pitch = 2.25,
			max_yaw = 2.5,
		},
		crouch_moving = {
			max_pitch = 2.5,
			max_yaw = 2.5,
		},
		zoomed_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
		zoomed_crouch_still = {
			max_pitch = 0,
			max_yaw = 0,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.4,
			max_yaw = 0.4,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1.4,
			immediate_yaw = 1.4,
		},
		shooting = {
			immediate_pitch = 4,
			immediate_yaw = 4,
		},
	},
}
SpreadTemplates.vs_warpfire_thrower_gun = {
	continuous = {
		still = {
			max_pitch = 7,
			max_yaw = 7,
		},
		moving = {
			max_pitch = 8,
			max_yaw = 8,
		},
		crouch_still = {
			max_pitch = 7,
			max_yaw = 7,
		},
		crouch_moving = {
			max_pitch = 8,
			max_yaw = 8,
		},
		zoomed_still = {
			max_pitch = 7,
			max_yaw = 7,
		},
		zoomed_moving = {
			max_pitch = 8,
			max_yaw = 8,
		},
		zoomed_crouch_still = {
			max_pitch = 7,
			max_yaw = 7,
		},
		zoomed_crouch_moving = {
			max_pitch = 8,
			max_yaw = 8,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
		shooting = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
	},
}
SpreadTemplates.vs_ratling_gunner_gun = {
	continuous = {
		still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		zoomed_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_crouch_still = {
			max_pitch = 0.5,
			max_yaw = 0.5,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
		shooting = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
	},
}
SpreadTemplates.vs_ratling_gunner_gun_shooting = {
	continuous = {
		still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		crouch_still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_crouch_still = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
		zoomed_crouch_moving = {
			max_pitch = 0.75,
			max_yaw = 0.75,
		},
	},
	immediate = {
		being_hit = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
		shooting = {
			immediate_pitch = 1,
			immediate_yaw = 1,
		},
	},
}
SpreadTemplates.maximum_pitch = 15
SpreadTemplates.maximum_yaw = 15
SpreadTemplates.fireball = SpreadTemplates.fireball or table.clone(SpreadTemplates.default)
SpreadTemplates.beam_staff_basic = SpreadTemplates.beam_staff_basic or table.clone(SpreadTemplates.default)
SpreadTemplates.repeating_pistol = SpreadTemplates.repeating_pistol or table.clone(SpreadTemplates.default)
SpreadTemplates.repeating_handgun = SpreadTemplates.repeating_handgun or table.clone(SpreadTemplates.default)
SpreadTemplates.repeating_handgun_special = SpreadTemplates.repeating_handgun_special or table.clone(SpreadTemplates.default)
SpreadTemplates.heavy_steam_pistol_special = SpreadTemplates.heavy_steam_pistol_special or table.clone(SpreadTemplates.default)
SpreadTemplates.repeating_crossbow_burst = SpreadTemplates.repeating_crossbow_burst or table.clone(SpreadTemplates.default)
SpreadTemplates.sparks = SpreadTemplates.sparks or table.clone(SpreadTemplates.default)
SpreadTemplates.spear = SpreadTemplates.spear or table.clone(SpreadTemplates.default)
SpreadTemplates.longbow = SpreadTemplates.longbow or table.clone(SpreadTemplates.default)
SpreadTemplates.empire_longbow = SpreadTemplates.empire_longbow or table.clone(SpreadTemplates.default)
SpreadTemplates.handgun = table.create_copy(SpreadTemplates.handgun, SpreadTemplates.handgun) or table.clone(SpreadTemplates.default)
SpreadTemplates.crossbow = SpreadTemplates.crossbow or table.clone(SpreadTemplates.default)
SpreadTemplates.brace_of_pistols = SpreadTemplates.brace_of_pistols or table.clone(SpreadTemplates.default)
SpreadTemplates.pistol_special = SpreadTemplates.pistol_special or table.clone(SpreadTemplates.default)
SpreadTemplates.brace_of_drake_pistols = SpreadTemplates.brace_of_drake_pistols or table.clone(SpreadTemplates.default)
SpreadTemplates.drakegun = SpreadTemplates.drakegun or table.clone(SpreadTemplates.default)
SpreadTemplates.bow = table.create_copy(SpreadTemplates.bow, SpreadTemplates.bow) or table.clone(SpreadTemplates.default)
SpreadTemplates.blunderbuss = table.create_copy(SpreadTemplates.blunderbuss, SpreadTemplates.blunderbuss) or table.clone(SpreadTemplates.default)
SpreadTemplates.bounty_hunter_shotgun = table.create_copy(SpreadTemplates.bounty_hunter_shotgun, SpreadTemplates.bounty_hunter_shotgun) or table.clone(SpreadTemplates.default)
SpreadTemplates.drake_pistol_charged = SpreadTemplates.drake_pistol_charged or table.clone(SpreadTemplates.default)
SpreadTemplates.rake_shot = table.create_copy(SpreadTemplates.rake_shot, SpreadTemplates.rake_shot) or table.clone(SpreadTemplates.default)
SpreadTemplates.rake_twin_shot = table.create_copy(SpreadTemplates.rake_twin_shot, SpreadTemplates.rake_twin_shot) or table.clone(SpreadTemplates.default)
SpreadTemplates.rake_twin_shot = SpreadTemplates.rake_twin_shot or table.clone(SpreadTemplates.default)
SpreadTemplates.vs_warpfire_thrower_gun = SpreadTemplates.vs_warpfire_thrower_gun or table.clone(SpreadTemplates.default)
SpreadTemplates.vs_ratling_gunner_gun = SpreadTemplates.vs_ratling_gunner_gun or table.clone(SpreadTemplates.default)
SpreadTemplates.vs_ratling_gunner_gun_shooting = SpreadTemplates.vs_ratling_gunner_gun_shooting or table.clone(SpreadTemplates.default)

DLCUtils.merge("spread_templates", SpreadTemplates)
