local settings = DLCSettings.morris
settings.backend_interfaces = {
	deus = {
		ignore_on_dedicated_server = true,
		playfab_file = "scripts/managers/backend_playfab/backend_interface_deus_playfab",
		playfab_class = "BackendInterfaceDeusPlayFab"
	}
}
settings.offline_backend_title_data = {
	"scripts/settings/offline_backend_playfab/title_internal_data/deus_player_setup",
	"scripts/settings/offline_backend_playfab/title_internal_data/deus_roll_over_settings",
	"scripts/settings/offline_backend_playfab/title_internal_data/earn_chests_on_defeat_data"
}

return
