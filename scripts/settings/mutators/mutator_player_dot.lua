return {
	description = "description_mutator_player_dot",
	display_name = "display_name_mutator_player_dot",
	icon = "mutator_icon_player_dot",
	server_start_function = function (context, data)
		data.player_units = {}
	end,
	server_update_function = function (context, data, dt, t)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "mutator_player_dot")
	end
}
