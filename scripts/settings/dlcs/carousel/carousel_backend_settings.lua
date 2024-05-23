-- chunkname: @scripts/settings/dlcs/carousel/carousel_backend_settings.lua

local settings = DLCSettings.carousel

settings.backend_interfaces = {
	versus = {
		playfab_class = "BackendInterfaceVersusPlayFab",
		playfab_file = "scripts/managers/backend_playfab/backend_interface_versus_playfab",
	},
}
