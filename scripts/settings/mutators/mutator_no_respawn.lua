return {
	description = "description_mutator_no_respawn",
	icon = "mutator_icon_no_respawn",
	display_name = "display_name_mutator_no_respawn",
	server_start_function = function (context, data)
		Managers.state.game_mode:set_respawning_enabled(false)
	end
}
