return {
	description = "description_mutator_powerful_elites",
	health_modifier = 2,
	display_name = "display_name_mutator_powerful_elites",
	icon = "mutator_icon_powerful_elites",
	modify_health_breeds = {
		"skaven_storm_vermin",
		"skaven_storm_vermin_commander",
		"skaven_storm_vermin_with_shield",
		"skaven_plague_monk",
		"chaos_raider",
		"chaos_warrior",
		"chaos_berzerker",
		"beastmen_bestigor"
	},
	server_start_function = function (context, data)
		data.player_units = {}
	end,
	server_update_function = function (context, data)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "damage_taken_powerful_elites")
	end
}
