require("backend/local_backend/local_backend_available")

local local_backend_available = not not rawget(_G, "LOCAL_BACKEND_AVAILABLE")
BackendSettings = BackendSettings or {}
BackendSettings.prod_steam_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "5107",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.stage_steam_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "6FA3",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.dev_steam_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "6599",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.stage_xbone = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "6599",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}

return 
