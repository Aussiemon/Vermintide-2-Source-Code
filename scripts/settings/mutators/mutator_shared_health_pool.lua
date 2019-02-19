return {
	description = "description_mutator_shared_health_pool",
	display_name = "display_name_mutator_shared_health_pool",
	icon = "icon_deed_normal_01",
	server_start_function = function (context, data)
		data.player_units = {}
	end,
	server_update_function = function (context, data)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "trinket_shared_damage")
	end
}
