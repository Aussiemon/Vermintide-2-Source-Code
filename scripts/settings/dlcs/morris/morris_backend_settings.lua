local settings = DLCSettings.morris
settings.backend_interfaces = {
	deus = {
		playfab_file = "scripts/managers/backend_playfab/backend_interface_deus_playfab",
		ignore_on_dedicated_server = true,
		local_class = "BackendInterfaceDeusLocal",
		playfab_class = "BackendInterfaceDeusPlayFab",
		local_file = "backend/local_backend/backend_interface_deus_local"
	}
}
settings.offline_backend_title_data = {
	"scripts/settings/offline_backend_playfab/title_internal_data/deus_player_setup",
	"scripts/settings/offline_backend_playfab/title_internal_data/deus_roll_over_settings",
	"scripts/settings/offline_backend_playfab/title_internal_data/earn_chests_on_defeat_data"
}

return
