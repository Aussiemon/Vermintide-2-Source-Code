﻿-- chunkname: @scripts/settings/dlcs/belladonna/belladonna_achievements_settings.lua

local settings = DLCSettings.belladonna

settings.achievement_outline = {
	enemies = {
		entries = {
			"scorpion_slay_gors_warpfire_damage",
			"scorpion_kill_archers_kill_minotaur",
			"scorpion_bestigor_charge_chaos_warrior",
			"scorpion_kill_minotaur_farmlands_oak",
			"scorpion_keep_standard_bearer_alive",
		},
	},
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_belladonna",
}
