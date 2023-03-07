if false and IS_WINDOWS and BUILD == "release" then
	local loaded_plugins = Application.all_plugin_names()
	local plugin_check_list = {
		"fishtank",
		"navigation",
		"rule database",
		"wwise_plugin"
	}

	local function find_in_array(t, element)
		for key, value in pairs(t) do
			if value == element then
				return key
			end
		end

		return false
	end

	local missing_plugins = ""
	local num_missing = 0

	for i = 1, #plugin_check_list do
		local plugin_name = plugin_check_list[i]

		if find_in_array(loaded_plugins, plugin_name) then
			print("-> " .. plugin_name .. " plugin has been loaded.")
		else
			missing_plugins = num_missing == 0 and plugin_name or missing_plugins .. ", " .. plugin_name
			num_missing = num_missing + 1
		end
	end

	if num_missing > 0 then
		local error_string = nil

		if num_missing > 1 then
			error_string = string.format("Game could not load the following plugins: %s. Missing files. Please verify game integrity of game cache in steam, or delete local content and download game again.", missing_plugins)
		else
			error_string = string.format("Game could not load %s plugin. Missing files. Please verify game integrity of game cache in steam, or delete local content and download game again.", missing_plugins)
		end

		if rawget(_G, "jit") then
			local ffi = require("ffi")

			ffi.cdef("\t\t\t\n\t\t\tint MessageBoxA(void *w, const char *txt, const char *cap, int type);\n\t\t\t")

			local MB_OK = 0
			local result = ffi.C.MessageBoxA(nil, error_string, "Missing Plugin/Files Error", MB_OK)
		end

		error(error_string)
	end
end
