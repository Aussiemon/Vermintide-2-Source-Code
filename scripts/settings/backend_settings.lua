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
	title_id = "9928",
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
BackendSettings.stage_xbone_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "4d1e",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.prod_xbone_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "f844",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.stage_ps4_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "9050",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}
BackendSettings.prod_ps4_playfab = {
	enable_sessions = false,
	allow_tutorial = true,
	implementation = "playfab",
	title_id = "60f3",
	environment = rawget(_G, "Backend") and Backend.ENV_STAGE,
	allow_local = local_backend_available
}

return
