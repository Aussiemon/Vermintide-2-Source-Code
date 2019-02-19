local settings = DLCSettings.store
settings.interactions = {
	"store_access"
}
settings.interactions_filenames = {
	"scripts/settings/store_interactions"
}
settings.backend_interfaces = {
	peddler = {
		playfab_file = "scripts/managers/backend_playfab/backend_interface_peddler_playfab",
		local_class = "BackendInterfacePeddlerLocal",
		playfab_class = "BackendInterfacePeddlerPlayFab"
	}
}

return
