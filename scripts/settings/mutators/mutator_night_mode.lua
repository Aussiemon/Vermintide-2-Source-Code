-- chunkname: @scripts/settings/mutators/mutator_night_mode.lua

return {
	description = "description_mutator_night_mode",
	disable_environment_variations = true,
	display_name = "display_name_mutator_night_mode",
	icon = "mutator_icon_darkness",
	client_start_function = function (context, data)
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "mutator_night")
	end,
}
