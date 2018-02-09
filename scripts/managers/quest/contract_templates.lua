LocalContractTemplates = {
	{
		complete = false,
		active = false,
		requirements = {
			difficulty = "hard",
			levels = {
				"magnus",
				"tunnels"
			},
			task = {
				type = "tome",
				amount = {
					required = 2,
					acquired = 0
				}
			}
		},
		rewards = {
			quest = {
				amount_sigils = 2
			},
			tokens = {
				amount = 30,
				type = "iron_tokens"
			}
		},
		tags = {
			giver = "nobleman_otto"
		}
	},
	{
		complete = false,
		active = false,
		requirements = {
			difficulty = "normal",
			levels = {
				"merchant",
				"cemetary",
				"bridge"
			},
			task = {
				type = "ogre",
				amount = {
					required = 3,
					acquired = 0
				}
			}
		},
		rewards = {
			quest = {
				amount_sigils = 5
			},
			tokens = {
				amount = 30,
				type = "iron_tokens"
			}
		},
		tags = {
			giver = "innkeeper_franz"
		}
	},
	{
		complete = false,
		active = false,
		requirements = {
			difficulty = "hardest",
			levels = {
				"wizard"
			},
			task = {
				type = "level",
				amount = {
					required = 1,
					acquired = 0
				}
			}
		},
		rewards = {
			boons = "increased_damage",
			quest = {
				amount_sigils = 1
			}
		},
		tags = {
			giver = "nobleman_otto"
		}
	},
	{
		complete = false,
		active = false,
		requirements = {
			difficulty = "hard",
			levels = {
				"any"
			},
			task = {
				type = "grimoire",
				amount = {
					required = 2,
					acquired = 0
				}
			}
		},
		rewards = {
			boons = "reduced_damage",
			quest = {
				amount_sigils = 0
			}
		},
		tags = {
			giver = "innkeeper_franz"
		}
	}
}

return 
