MusicSettings = {
	combat_music = {
		ingame_only = true,
		start_event = "start_music_manager",
		stop = {
			group = "combat_intensity",
			event = "stop_music_defensive_combat",
			state = "battle_end"
		},
		default_group_states = {
			player_state = "normal",
			boss_state = "no_boss",
			game_state = "explore",
			combat_intensity = "low_battle"
		},
		parameters = {},
		game_state_voice_thresholds = {
			default = -55,
			horde = -40
		},
		set_flags = {
			"in_level",
			"combat_music_enabled"
		},
		unset_flags = {}
	}
}
CombatMusic = {
	minimum_intensity = 40,
	minimum_enemies = 5
}
IntensityThresholds = {
	{
		threshold = 0,
		state = "low_battle"
	},
	{
		threshold = 10,
		state = "med_battle"
	},
	{
		threshold = 40,
		state = "high_battle"
	}
}
SyncedMusicFlags = {}
SyncedMusicGroupFlags = {
	game_state = true,
	override = true,
	boss_state = true,
	combat_intensity = true
}
BossFightMusicIntensity = {
	{
		state = "close",
		max_distance = 6
	},
	{
		state = "medium",
		max_distance = 10
	},
	{
		state = "far",
		max_distance = math.huge
	},
	group_name = "boss_fight",
	default_state = "default",
	additional_contributing_units = {
		"chaos_warrior"
	}
}
