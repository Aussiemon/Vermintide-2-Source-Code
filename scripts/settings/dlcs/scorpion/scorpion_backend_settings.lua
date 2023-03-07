local settings = DLCSettings.scorpion
settings.backend_interfaces = {
	weaves = {
		ignore_on_dedicated_server = true,
		playfab_file = "scripts/managers/backend_playfab/backend_interface_weaves_playfab",
		playfab_class = "BackendInterfaceWeavesPlayFab"
	}
}
