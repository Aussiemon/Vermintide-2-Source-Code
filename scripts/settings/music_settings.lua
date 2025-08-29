-- chunkname: @scripts/settings/music_settings.lua

MusicSettings = {
	combat_music = {
		ingame_only = true,
		start_event = "start_music_manager",
		stop = {
			event = "stop_music_defensive_combat",
			group = "combat_intensity",
			state = "battle_end",
		},
		default_group_states = {
			boss_state = "no_boss",
			combat_intensity = "low_battle",
			game_state = "explore",
			player_state = "normal",
		},
		parameters = {},
		game_state_voice_thresholds = {
			default = -55,
			horde = -40,
		},
		set_flags = {
			"in_level",
			"combat_music_enabled",
		},
		unset_flags = {},
	},
}
CombatMusic = {
	minimum_enemies = 5,
	minimum_intensity = 40,
}
IntensityThresholds = {
	{
		state = "low_battle",
		threshold = 0,
	},
	{
		state = "med_battle",
		threshold = 10,
	},
	{
		state = "high_battle",
		threshold = 40,
	},
}
SyncedMusicFlags = {}
SyncedMusicGroupFlags = table.mirror_array_inplace({
	"combat_intensity",
	"game_state",
	"boss_state",
	"override",
	"dlc_dwarf_fest",
})
BossFightMusicIntensity = {
	{
		max_distance = 6,
		state = "close",
	},
	{
		max_distance = 10,
		state = "medium",
	},
	{
		state = "far",
		max_distance = math.huge,
	},
	default_state = "default",
	group_name = "boss_fight",
	additional_contributing_units = {
		"chaos_warrior",
	},
}
