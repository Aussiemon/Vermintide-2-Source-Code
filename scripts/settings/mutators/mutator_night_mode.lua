return {
	description = "description_mutator_night_mode",
	icon = "mutator_icon_darkness",
	display_name = "display_name_mutator_night_mode",
	client_start_function = function (context, data)
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "mutator_night")
	end
}
