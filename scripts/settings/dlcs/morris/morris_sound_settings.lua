require("levels/honduras_dlcs/morris/deus_level_settings")

local settings = DLCSettings.morris
settings.blocked_auto_load_files = {
	morris_hub = true
}
settings.dialogue_lookup = {
	"dialogues/generated/lookup_hero_conversations_dlc_morris_introspect",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_level_banter",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_level_banter_branched",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_level_banter_themed",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_ingame",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_map",
	"dialogues/generated/lookup_hero_conversations_dlc_morris_extras",
	"dialogues/generated/lookup_hub_conversations_morris"
}
settings.network_sound_events = {
	"Play_curse_egg_of_tzeentch_alert_low",
	"Play_curse_egg_of_tzeentch_alert_medium",
	"Play_curse_egg_of_tzeentch_alert_high",
	"Play_curse_egg_of_tzeentch_alert_egg_destroyed",
	"Play_blessing_challenge_of_grimnir_activate",
	"Play_blessing_of_isha_activate",
	"morris_bolt_of_change_laughter",
	"hud_morris_currency_added",
	"hud_morris_world_map_token_move",
	"hud_morris_world_map_level_chosen",
	"hud_morris_map_shrine_open",
	"player_combat_weapon_bw_deus_01_fireball_fire",
	"player_combat_weapon_bw_deus_01_magma_fire",
	"player_combat_weapon_bw_deus_01_charge_husk",
	"stop_player_combat_weapon_bw_deus_01_charge_husk",
	"morris_power_ups_lightning_strike",
	"morris_power_ups_clone_medkit",
	"morris_power_ups_clone_potion",
	"morris_power_ups_clone_grenade",
	"morris_power_ups_ammo_explosion",
	"morris_power_ups_extra_damage",
	"Play_potion_morris_drink_addon",
	"Play_potion_morris_effect_end",
	"morris_power_ups_drop_coins",
	"morris_power_ups_exploding_enemy",
	"hud_player_buff_regen_health",
	"Play_magic_shield_activate",
	"magic_shield_activate_fast",
	"hud_gameplay_stance_ninjafencer_buff",
	"hud_gameplay_stance_linesman_buff"
}
settings.dialogue_events = {
	"blessing_rally_flag_placed",
	"on_holy_grenade",
	"curse_positive_effect_happened",
	"curse_damage_taken"
}
settings.dialogue_event_data_lookup = {}
settings.dialogue_settings = {
	dlc_morris_map = {
		"dialogues/generated/hero_conversations_dlc_morris_map"
	},
	morris_hub = {
		"dialogues/generated/hub_conversations",
		"dialogues/generated/dlc_cog",
		"dialogues/generated/fleur_conversations",
		"dialogues/generated/hub_conversations_morris"
	}
}
local dialogue_lookup_file_name_prefix = "dialogues/generated/lookup_hero_conversations_dlc_morris_"
local dialogue_settings_file_name_prefix = "dialogues/generated/hero_conversations_dlc_morris_"

for level_key, level_settings in pairs(DEUS_LEVEL_SETTINGS) do
	local base_level_name = level_settings.base_level_name
	local dialogue_lookup_file_name = string.format("%s%s", dialogue_lookup_file_name_prefix, base_level_name)

	if not table.contains(settings.dialogue_lookup, dialogue_lookup_file_name) then
		settings.dialogue_lookup[#settings.dialogue_lookup + 1] = dialogue_lookup_file_name
	end

	for _, theme_name in ipairs(level_settings.themes) do
		for _, path in ipairs(level_settings.paths) do
			local permutation_key = string.format("%s_%s_path%s", level_key, theme_name, path)
			local dialogue_settings_file_name = string.format("%s%s", dialogue_settings_file_name_prefix, base_level_name)
			settings.dialogue_settings[permutation_key] = {
				"dialogues/generated/hero_conversations_dlc_morris_introspect",
				"dialogues/generated/hero_conversations_dlc_morris_level_banter",
				"dialogues/generated/hero_conversations_dlc_morris_level_banter_branched",
				"dialogues/generated/hero_conversations_dlc_morris_level_banter_themed",
				"dialogues/generated/hero_conversations_dlc_morris_ingame",
				"dialogues/generated/hero_conversations_dlc_morris_extras",
				dialogue_settings_file_name
			}
		end
	end
end

return
