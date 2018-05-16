MoodPriority = {
	"menu",
	"knocked_down",
	"bleeding_out",
	"heal_medikit",
	"heal_trait",
	"skill_shade",
	"skill_maiden_guard",
	"skill_slayer",
	"skill_zealot",
	"skill_ranger",
	"skill_huntsman_stealth",
	"skill_huntsman_surge",
	"wounded"
}
HealingMoods = {
	bandage = "heal_medikit",
	bandage_trinket = "heal_trait",
	proc = "heal_trait",
	potion = "heal_medikit",
	healing_draught = "heal_medikit"
}
MoodSettings = {
	knocked_down = {
		environment_setting = "knocked_down",
		blend_in_time = 0.1,
		blend_out_time = 2,
		particle_effects_on_enter = {
			"fx/screenspace_knocked_down"
		},
		no_particles_on_enter_from = {
			"menu"
		},
		particle_effects_on_exit = {}
	},
	heal_medikit = {
		hold_time = 1,
		blend_in_time = 0.5,
		environment_setting = "heal_medikit",
		blend_out_time = 2,
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed"
		},
		particle_effects_on_exit = {}
	},
	heal_trait = {
		hold_time = 1,
		blend_in_time = 0.5,
		environment_setting = "heal_trait",
		blend_out_time = 2,
		particle_effects_on_enter = {
			"fx/screenspace_trait_healed"
		},
		particle_effects_on_exit = {}
	},
	bleeding_out = {
		environment_setting = "bleeding_out",
		blend_in_time = 0.5,
		blend_out_time = 2,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	wounded = {
		environment_setting = "wounded",
		blend_in_time = 0.5,
		blend_out_time = 2,
		particle_effects_on_enter = {
			"fx/screenspace_wounded"
		},
		particle_effects_on_exit = {
			"fx/screenspace_fak_healed"
		}
	},
	menu = {
		environment_setting = "menu",
		blend_in_time = 0,
		blend_out_time = 0,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	skill_shade = {
		environment_setting = "skill_shade",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	skill_maiden_guard = {
		environment_setting = "skill_shade",
		blend_in_time = 0.1,
		blend_out_time = 0.25,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	skill_ranger = {
		environment_setting = "skill_ranger",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	skill_slayer = {
		environment_setting = "skill_slayer",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed"
		},
		particle_effects_on_exit = {
			"fx/screenspace_slayer_01"
		}
	},
	skill_zealot = {
		environment_setting = "skill_slayer",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed"
		},
		particle_effects_on_exit = {
			"fx/screenspace_slayer_01"
		}
	},
	skill_huntsman_stealth = {
		environment_setting = "skill_huntsman_stealth",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	},
	skill_huntsman_surge = {
		environment_setting = "skill_huntsman_surge",
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		particle_effects_on_enter = {},
		particle_effects_on_exit = {}
	}
}

return
