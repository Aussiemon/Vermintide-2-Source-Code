require("scripts/settings/dlcs/morris/deus_blessing_settings")

return {
	display_name = DeusBlessingSettings.blessing_of_shallya.display_name,
	description = DeusBlessingSettings.blessing_of_shallya.description,
	icon = DeusBlessingSettings.blessing_of_shallya.icon,
	server_update_function = function (context, data, dt, t)
		MutatorUtils.apply_buff_to_alive_player_units(context, data, "blessing_of_shallya_buff")
	end
}
