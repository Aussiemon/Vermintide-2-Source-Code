-- chunkname: @scripts/settings/dlcs/scorpion/scorpion_backend_settings.lua

local settings = DLCSettings.scorpion

settings.backend_interfaces = {
	weaves = {
		ignore_on_dedicated_server = true,
		playfab_class = "BackendInterfaceWeavesPlayFab",
		playfab_file = "scripts/managers/backend_playfab/backend_interface_weaves_playfab",
	},
}
