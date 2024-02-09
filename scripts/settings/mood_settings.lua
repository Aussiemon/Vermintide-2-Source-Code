-- chunkname: @scripts/settings/mood_settings.lua

MoodPriority = {
	"menu",
	"knocked_down",
	"bleeding_out",
	"heal_medikit",
	"heal_trait",
	"skill_shade",
	"skill_shade_restealth",
	"skill_shade_short",
	"shade_dash",
	"killer_in_the_shadows",
	"hidden_escape",
	"twitch_invis",
	"gutter_runner_f",
	"skill_maiden_guard",
	"skill_slayer",
	"skill_zealot",
	"skill_ranger",
	"skill_huntsman_stealth",
	"skill_huntsman_surge",
	"wounded",
	"drunk_01",
	"hangover_01",
	"staggered",
}
HealingMoods = {
	bandage = "heal_medikit",
	bandage_trinket = "heal_trait",
	healing_draught = "heal_medikit",
	potion = "heal_medikit",
	proc = "heal_trait",
}
MoodSettings = {
	knocked_down = {
		blend_in_time = 0.1,
		blend_out_time = 2,
		environment_setting = "knocked_down",
		particle_effects_on_enter = {
			"fx/screenspace_knocked_down",
		},
		no_particles_on_enter_from = {
			"menu",
		},
		particle_effects_on_exit = {},
	},
	heal_medikit = {
		blend_in_time = 0.5,
		blend_out_time = 2,
		environment_setting = "heal_medikit",
		hold_time = 1,
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed",
		},
		particle_effects_on_exit = {},
	},
	heal_trait = {
		blend_in_time = 0.5,
		blend_out_time = 2,
		environment_setting = "heal_trait",
		hold_time = 1,
		particle_effects_on_enter = {
			"fx/screenspace_trait_healed",
		},
		particle_effects_on_exit = {},
	},
	bleeding_out = {
		blend_in_time = 0.5,
		blend_out_time = 2,
		environment_setting = "bleeding_out",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	wounded = {
		blend_in_time = 0.5,
		blend_out_time = 2,
		environment_setting = "wounded",
		particle_effects_on_enter = {
			"fx/screenspace_wounded",
		},
		particle_effects_on_exit = {
			"fx/screenspace_fak_healed",
		},
	},
	menu = {
		blend_in_time = 0,
		blend_out_time = 0,
		environment_setting = "menu",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_shade = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_shade_restealth = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_shade_short = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	shade_dash = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	killer_in_the_shadows = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	hidden_escape = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	twitch_invis = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	gutter_runner_f = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_maiden_guard = {
		blend_in_time = 0.1,
		blend_out_time = 0.25,
		environment_setting = "skill_shade",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_ranger = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_ranger",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_slayer = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_slayer",
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed",
		},
		particle_effects_on_exit = {
			"fx/screenspace_slayer_01",
		},
	},
	skill_zealot = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_slayer",
		particle_effects_on_enter = {
			"fx/screenspace_fak_healed",
		},
		particle_effects_on_exit = {
			"fx/screenspace_slayer_01",
		},
	},
	skill_huntsman_stealth = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_huntsman_stealth",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	skill_huntsman_surge = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "skill_huntsman_surge",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	drunk_01 = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "drunk_01",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	hangover_01 = {
		blend_in_time = 0.5,
		blend_out_time = 0.25,
		environment_setting = "hangover_01",
		particle_effects_on_enter = {},
		particle_effects_on_exit = {},
	},
	staggered = {
		blend_in_time = 0.2,
		blend_out_time = 0.1,
		environment_setting = "skill_huntsman_stealth",
		particle_effects_on_enter = {
			"fx/screenspace_wounded",
		},
		particle_effects_on_exit = {
			"fx/screenspace_fak_healed",
		},
	},
}
MoodSettings.ghost_mode = {
	blend_in_time = 0.5,
	blend_out_time = 0.1,
	environment_setting = "ghost_mode",
	particle_effects_on_enter = {},
	particle_effects_on_exit = {},
}

table.insert(MoodPriority, 2, "ghost_mode")
