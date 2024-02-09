-- chunkname: @foundation/scripts/util/user_setting.lua

Development = Development or {}
PATCHED_USER_SETTINGS = PATCHED_USER_SETTINGS or false

if IS_CONSOLE and not PATCHED_USER_SETTINGS then
	UserSettings = UserSettings or {}

	Application.set_user_setting = function (...)
		local t = UserSettings
		local num_args = select("#", ...)

		for i = 1, num_args - 2 do
			local key = select(i, ...)

			t[key] = type(t[key]) == "table" and t[key] or {}
			t = t[key]
		end

		local set_key = select(num_args - 1, ...)
		local set_value = select(num_args, ...)

		t[set_key] = set_value
	end

	Application.user_setting = function (...)
		local t = UserSettings
		local num_args = select("#", ...)

		for i = 1, num_args - 1 do
			local key = select(i, ...)

			t = t[key]

			if type(t) ~= "table" then
				return
			end
		end

		return t[select(num_args, ...)]
	end

	Application.save_user_settings = function ()
		return
	end

	PATCHED_USER_SETTINGS = true
end

Development.user_setting_disable = function ()
	local function nop()
		return
	end

	Development.set_setting, Development.setting = nop, nop
end

Development.init_user_settings = function ()
	local enabled_platforms = {
		macosx = true,
		ps4 = true,
		win32 = true,
		xb1 = true,
	}
	local current_platform = PLATFORM

	if not enabled_platforms[current_platform] then
		Development.user_setting_disable()

		return
	end

	if BUILD == "release" then
		Development.user_setting_disable()

		return
	end

	Development.set_setting = function (...)
		Application.set_user_setting("development_settings", ...)
	end

	Development.setting = function (...)
		return Application.user_setting("development_settings", ...)
	end

	Development._patch_deprecated_development_settings()

	local development_settings = Application.user_setting("development_settings")

	if not development_settings then
		development_settings = {}

		Development.set_setting("dummy_field_to_spawn_development_settings_table", true)
	end

	print("VALUES:")

	for param, value in pairs(development_settings) do
		if value ~= false then
			script_data[param] = value

			print(param, script_data[param])
		end
	end

	print("VALUES END")
end

Application.test_user_setting = function (...)
	local t = UserSettings
	local num_args = select("#", ...)

	for i = 1, num_args - 1 do
		local key = select(i, ...)

		t = t[key]

		if type(t) ~= "table" then
			return
		end
	end

	return t[select(num_args, ...)]
end

Development._patch_deprecated_development_settings = function ()
	Development.set_setting("use_lan_backend", nil)
	Development.set_setting("use_local_backend", nil)
end
