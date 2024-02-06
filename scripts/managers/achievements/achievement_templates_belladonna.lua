-- chunkname: @scripts/managers/achievements/achievement_templates_belladonna.lua

AchievementTemplates.achievements.scorpion_bestigor_charge_chaos_warrior = {
	desc = "achv_scorpion_bestigor_charge_chaos_warrior_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_bestigor_charge_chaos_warrior",
	name = "achv_scorpion_bestigor_charge_chaos_warrior_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_bestigor_charge_chaos_warrior") > 0
	end,
}
AchievementTemplates.achievements.scorpion_kill_minotaur_farmlands_oak = {
	desc = "achv_scorpion_kill_minotaur_farmlands_oak_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_kill_minotaur_farmlands_oak",
	name = "achv_scorpion_kill_minotaur_farmlands_oak_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_kill_minotaur_farmlands_oak") > 0
	end,
}
AchievementTemplates.achievements.scorpion_kill_archers_kill_minotaur = {
	desc = "achv_scorpion_kill_archers_kill_minotaur_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_kill_archers_kill_minotaur",
	name = "achv_scorpion_kill_archers_kill_minotaur_name",
	required_dlc = "scorpion",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_kill_archers_kill_minotaur") > 0
	end,
}
AchievementTemplates.achievements.scorpion_keep_standard_bearer_alive = {
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_keep_standard_bearer_alive",
	name = "achv_scorpion_keep_standard_bearer_alive_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_scorpion_keep_standard_bearer_alive_desc"), QuestSettings.standard_bearer_alive_seconds)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_keep_standard_bearer_alive") > 0
	end,
}
AchievementTemplates.achievements.scorpion_slay_gors_warpfire_damage = {
	display_completion_ui = true,
	icon = "achievement_trophy_scorpion_slay_gors_warpfire_damage",
	name = "achv_scorpion_slay_gors_warpfire_damage_name",
	required_dlc = "scorpion",
	desc = function ()
		return string.format(Localize("achv_scorpion_slay_gors_warpfire_damage_desc"), QuestSettings.num_gors_killed_by_warpfire)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "scorpion_slay_gors_warpfire_damage") > 0
	end,
}
