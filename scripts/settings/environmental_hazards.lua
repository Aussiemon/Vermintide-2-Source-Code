EnvironmentalHazards = {
	spike_trap = {
		enemy = {
			damage_profile = "spike_trap",
			can_damage = true,
			can_stagger = true,
			difficulty_power_level = {
				500,
				500,
				500,
				500,
				500,
				500,
				500,
				500
			}
		},
		player = {
			action_data = {
				player_push_speed = 1,
				damage_type = "cutting"
			},
			difficulty_damage = {
				harder = 18,
				hard = 15,
				normal = 12,
				hardest = 23,
				cataclysm = 30,
				cataclysm_3 = 50,
				cataclysm_2 = 40,
				easy = 7
			}
		}
	},
	thorn_trap = {
		enemy = {
			damage_profile = "spike_trap",
			can_damage = true,
			can_stagger = false,
			difficulty_power_level = {
				500,
				500,
				500,
				500,
				500,
				500,
				500,
				500
			}
		},
		player = {
			action_data = {
				player_push_speed = 1,
				damage_type = "cutting"
			},
			difficulty_damage = {
				harder = 6,
				hard = 5,
				normal = 4,
				hardest = 7,
				cataclysm = 8,
				cataclysm_3 = 10,
				cataclysm_2 = 9,
				easy = 3
			}
		}
	},
	fire = {
		enemy = {
			damage_profile = "environment_fire",
			can_damage = true,
			can_stagger = false,
			difficulty_power_level = {
				500,
				500,
				500,
				500,
				500,
				500,
				500,
				500
			}
		},
		player = {
			action_data = {
				player_push_speed = 0,
				damage_type = "burn"
			},
			difficulty_damage = {
				harder = 6,
				hard = 5,
				normal = 4,
				hardest = 7,
				cataclysm = 8,
				cataclysm_3 = 10,
				cataclysm_2 = 9,
				easy = 3
			}
		}
	},
	payload = {
		enemy = {
			damage_profile = "payload_wagon",
			can_damage = false,
			can_stagger = true,
			difficulty_power_level = {
				200,
				200,
				300,
				400,
				600,
				700,
				700,
				700
			}
		}
	},
	sled = {
		enemy = {
			damage_profile = "sled",
			can_damage = true,
			can_stagger = true,
			difficulty_power_level = {
				300,
				300,
				400,
				500,
				600,
				700,
				800,
				900
			}
		}
	},
	trail_cog = {
		enemy = {
			damage_profile = "trail_cog",
			can_damage = true,
			can_stagger = true,
			difficulty_power_level = {
				200,
				200,
				300,
				400,
				600,
				700,
				700,
				700
			}
		}
	},
	sawblade = {
		enemy = {
			can_damage = true,
			can_stagger = true,
			damage_profile = "sawblade",
			difficulty_power_level = {
				200,
				200,
				300,
				400,
				600,
				700,
				700,
				700
			},
			difficulty_damage = {
				60,
				90,
				100,
				125,
				150,
				190,
				220,
				250
			}
		}
	},
	sawblade_instant_kill = {
		enemy = {
			damage_profile = "sawblade_instant_kill",
			can_damage = true,
			can_stagger = true,
			difficulty_power_level = {
				1000,
				1000,
				300,
				400,
				600,
				700,
				1000,
				1500
			}
		}
	}
}

return
