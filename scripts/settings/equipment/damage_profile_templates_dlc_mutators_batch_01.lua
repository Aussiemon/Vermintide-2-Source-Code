local damage_templates = {
	ticking_bomb_explosion = {
		charge_value = "grenade",
		is_explosion = true,
		armor_modifier = {
			attack = {
				0.5,
				0.25,
				0.25,
				1.75,
				0.25
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1
			}
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "ticking_bomb_explosion",
			power_distribution = {
				attack = 6,
				impact = 1
			}
		}
	},
	ticking_bomb_explosion_bot = {
		charge_value = "grenade",
		is_explosion = true,
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				1
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1
			}
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "ticking_bomb_explosion_bot",
			power_distribution = {
				attack = 1,
				impact = 1
			}
		}
	}
}

return damage_templates
