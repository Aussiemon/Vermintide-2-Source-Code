EnvironmentalHazards = {
	spike_trap = {
		enemy = {
			damage_profile = "spike_trap",
			power_level = 500,
			can_damage = true,
			can_stagger = true
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
			power_level = 500,
			can_damage = true,
			can_stagger = false
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
			power_level = 500,
			can_damage = true,
			can_stagger = false
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
			power_level = 100,
			can_damage = false,
			can_stagger = true
		}
	}
}

return
