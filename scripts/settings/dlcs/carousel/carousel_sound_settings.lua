-- chunkname: @scripts/settings/dlcs/carousel/carousel_sound_settings.lua

local settings = DLCSettings.carousel

settings.dialogue_lookup = {
	"dialogues/generated/lookup_pactsworn_player_vo",
	"dialogues/generated/lookup_vs_player_vo",
	"dialogues/generated/lookup_vs_npc_vo",
}
settings.auto_load_files = {
	"dialogues/generated/pactsworn_player_vo",
	"dialogues/generated/vs_player_vo",
	"dialogues/generated/vs_npc_vo",
}
settings.network_sound_events = {
	"menu_wind_countdown_warning",
	"Play_hud_versus_objective_start",
}
settings.blocked_auto_load_files = {
	carousel_hub = true,
}
