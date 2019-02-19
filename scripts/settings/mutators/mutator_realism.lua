return {
	description = "description_mutator_realism",
	display_name = "display_name_mutator_realism",
	icon = "mutator_icon_realism",
	client_start_function = function (context, data)
		local outline_system = Managers.state.entity:system("outline_system")

		outline_system:set_disabled(true)
	end,
	client_stop_function = function (context, data)
		if not context.is_destroy then
			local outline_system = Managers.state.entity:system("outline_system")

			outline_system:set_disabled(false)
		end
	end
}
