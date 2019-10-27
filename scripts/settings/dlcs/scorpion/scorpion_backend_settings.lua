local settings = DLCSettings.scorpion
settings.backend_interfaces = {
	weaves = {
		playfab_file = "scripts/managers/backend_playfab/backend_interface_weaves_playfab",
		ignore_on_dedicated_server = true,
		local_class = "BackendInterfaceWeavesLocal",
		playfab_class = "BackendInterfaceWeavesPlayFab"
	}
}

return
