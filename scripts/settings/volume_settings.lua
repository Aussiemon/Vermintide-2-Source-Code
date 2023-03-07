require("scripts/unit_extensions/generic/generic_volume_templates")

local PLAYER = "PlayerVolumeExtension"
local BOT = "BotVolumeExtension"
local AI = "AIVolumeExtension"
local PICKUP_PROJECTILE = "PickupProjectileVolumeExtension"
local LOCAL_PLAYER = "LocalPlayerVolumeExtension"
VolumeSystemSettings = VolumeSystemSettings or {
	updates_per_frame = {
		[PLAYER] = 4,
		[LOCAL_PLAYER] = 1,
		[BOT] = 3,
		[AI] = 10,
		[PICKUP_PROJECTILE] = 1
	},
	traversal_costs = {
		high = 2,
		inferno = 100000,
		low = 1.2,
		insane = 4,
		medium = 1.5
	}
}
VolumeExtensionSettings = VolumeExtensionSettings or {
	damage_volume = {
		generic_dot = {
			[PLAYER] = {
				time_between_damage = 2,
				damage = {
					10,
					10,
					10,
					10,
					10
				}
			},
			[BOT] = {
				traversal_cost = "low",
				time_between_damage = 2,
				damage = {
					10,
					10,
					10,
					10,
					10
				}
			},
			[AI] = {
				traversal_cost = "low",
				time_between_damage = 2,
				damage = {
					1,
					1,
					1,
					1,
					1
				}
			}
		},
		warpstone_meteor = {
			[PLAYER] = {
				time_between_damage = 0.1,
				damage = {
					3,
					3,
					3,
					3,
					3
				}
			},
			[BOT] = {
				traversal_cost = "medium",
				time_between_damage = 0.1,
				damage = {
					3,
					3,
					3,
					3,
					3
				}
			},
			[AI] = {
				traversal_cost = "medium",
				time_between_damage = 0.1,
				damage = {
					4,
					4,
					4,
					4,
					4
				}
			}
		},
		ai_kill_dot = {
			[AI] = {
				traversal_cost = "insane",
				time_between_damage = 0.1,
				damage = {
					500,
					500,
					500,
					500,
					500
				}
			}
		},
		generic_insta_kill = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {
				traversal_cost = "high"
			},
			[AI] = {
				traversal_cost = "high"
			}
		},
		player_insta_kill = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {
				traversal_cost = "high"
			}
		},
		ai_insta_kill = {
			[AI] = {
				traversal_cost = "high"
			}
		},
		generic_insta_kill_no_cost = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {},
			[AI] = {}
		},
		player_insta_kill_no_cost = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {}
		},
		pactsworn_insta_kill_no_cost = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {}
		},
		heroes_insta_kill_no_cost = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {},
			[BOT] = {}
		},
		ai_insta_kill_no_cost = {
			[AI] = {}
		},
		ai_kill_dot_no_cost = {
			[AI] = {
				time_between_damage = 0.1,
				damage = {
					500,
					500,
					500,
					500,
					500
				}
			}
		},
		generic_fire = {
			[PLAYER] = {
				time_between_damage = 0.5,
				damage = {
					1,
					1,
					1,
					1,
					1
				}
			},
			[BOT] = {
				traversal_cost = "high",
				time_between_damage = 0.5,
				damage = {
					1,
					1,
					1,
					1,
					1
				}
			}
		},
		catacombs_corpse_pit = {
			[PLAYER] = {}
		},
		cemetery_plague_floor = {
			[PLAYER] = {},
			[BOT] = {
				traversal_cost = "insane"
			}
		},
		skaven_molten_steel = {
			[PLAYER] = {
				time_between_damage = 1,
				damage = {
					10,
					10,
					10,
					10,
					10
				}
			},
			[BOT] = {
				traversal_cost = "inferno",
				time_between_damage = 1,
				damage = {
					10,
					10,
					10,
					10,
					10
				}
			},
			[AI] = {
				traversal_cost = "inferno",
				time_between_damage = 1,
				damage = {
					3,
					3,
					3,
					3,
					3
				}
			}
		},
		bot_avoid_area = {
			[BOT] = {
				traversal_cost = "inferno"
			}
		}
	},
	movement_volume = {
		generic_slowdown = {
			[PLAYER] = {
				speed_multiplier = 0.75
			},
			[BOT] = {
				speed_multiplier = 0.75
			}
		},
		generic_slowdown_2 = {
			[PLAYER] = {
				speed_multiplier = 0.6
			},
			[BOT] = {
				speed_multiplier = 0.6
			}
		},
		generic_slowdown_3 = {
			[PLAYER] = {
				speed_multiplier = 0.8
			},
			[BOT] = {
				speed_multiplier = 0.8
			}
		}
	},
	location_volume = {
		area_indication = {
			[PLAYER] = {}
		}
	},
	trigger_volume = {
		all_alive_humans_outside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled
			}
		},
		all_alive_players_outside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled
			},
			[BOT] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled
			}
		},
		all_alive_players_outside_no_alive_inside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled_outside_or_disabled_inside_and_not_all_disabled_inside
			},
			[BOT] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled_outside_or_disabled_inside_and_not_all_disabled_inside
			}
		},
		all_alive_players_inside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.all_alive_players_inside
			}
		},
		all_non_disabled_players_inside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.all_non_disabled_players_inside
			}
		},
		non_disabled_players_inside = {
			[PLAYER] = {
				filter = GenericVolumeTemplates.filters.unit_not_disabled
			}
		},
		ai_inside = {
			[AI] = {}
		},
		players_and_bots_inside = {
			[PLAYER] = {},
			[BOT] = {}
		},
		players_inside = {
			[PLAYER] = {}
		},
		local_player_inside = {
			[PLAYER] = {},
			[LOCAL_PLAYER] = {}
		}
	},
	despawn_volume = {
		pickup_projectiles = {
			[PICKUP_PROJECTILE] = {}
		}
	}
}
local nav_tag_layer_costs = {}

for volume_type, volume_sub_types in pairs(VolumeExtensionSettings) do
	for volume_sub_type, extensions in pairs(volume_sub_types) do
		for extension_name, extension_data in pairs(extensions) do
			local traversal_cost = extension_data.traversal_cost

			if traversal_cost then
				nav_tag_layer_costs[volume_type] = nav_tag_layer_costs[volume_type] or {}
				nav_tag_layer_costs[volume_type][volume_sub_type] = nav_tag_layer_costs[volume_type][volume_sub_type] or {}
				nav_tag_layer_costs[volume_type][volume_sub_type][extension_name] = VolumeSystemSettings.traversal_costs[traversal_cost]
			end
		end
	end
end

VolumeSystemSettings.nav_tag_layer_costs = nav_tag_layer_costs
