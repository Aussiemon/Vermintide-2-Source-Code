local meta = {
	__newindex = function (t, k, v)
		if rawget(t, k) == nil then
			local info = debug.getinfo(2, "S")

			if k ~= "to_console_line" and info and info.what ~= "main" and info.what ~= "C" then
				error(string.format("Cannot assign undeclared global %q", k), 2)
			end
		end

		rawset(t, k, v)

		return 
	end,
	__index = function (t, k)
		local info = debug.getinfo(2, "S")

		if k ~= "to_console_line" and info and info.what ~= "main" and info.what ~= "C" then
			error(string.format("Cannot access undeclared global %q", k), 2)
		end

		return 
	end
}

setmetatable(_G, meta)

if PLATFORM == "ps4" or PLATFORM == "xb1" then
	if rawget(_G, "FREEN_LOLS") then
		return 
	end

	rawset(_G, "FREEN_LOLS", true)

	local P = PLATFORM

	if not Wwise then
		local NilMeta = {
			__index = function (...)
				return function (...)
					return nil
				end
			end
		}
		Wwise = setmetatable({}, NilMeta)
	end

	if not WwiseWorld then
		local NilMeta = {
			__index = function (...)
				return function (...)
					return nil
				end
			end
		}
		WwiseWorld = setmetatable({}, NilMeta)
	end

	if P ~= "win32" and P ~= "osx" then
		print("PATCHING FUNCTIONS")

		local NilMeta = {
			__index = function (...)
				return function (...)
					return nil
				end
			end
		}
		TerrainDecoration = setmetatable({}, NilMeta)
		LandscapeDecoration = setmetatable({}, NilMeta)
		Application.apply_user_settings = function ()
			return 
		end
		Application.user_settings_load_error = function ()
			return 
		end
		Application.enum_display_modes = function ()
			return {}
		end
		Application.open_url_in_browser = function ()
			return 
		end
		Application.process_id = function ()
			return 4919
		end
		Application.restart_file_log = function ()
			return 
		end
		Window = Window or {}
		Window.set_title = function ()
			return 
		end
		Window.mouse_focus = function ()
			return 
		end
		Window.set_mouse_focus = function ()
			return 
		end
		Window.set_focus = function ()
			return 
		end
		Window.has_focus = function ()
			return 
		end
		Window.set_title = function ()
			return 
		end
		Window.show_cursor = function ()
			return 
		end
		Window.set_show_cursor = function ()
			return 
		end
		Window.clip_cursor = function ()
			return 
		end
		Window.set_clip_cursor = function ()
			return 
		end
		Window.set_cursor = function ()
			return 
		end
		Window.set_resizable = function ()
			return 
		end
		Window.is_resizable = function ()
			return 
		end
		DisplayAdapter = DisplayAdapter or {}
		DisplayAdapter.num_adapters = function ()
			return 0
		end
		DisplayAdapter.name = function ()
			return "fml"
		end
		DisplayAdapter.num_outputs = function ()
			return 0
		end
		DisplayAdapter.num_modes = function ()
			return 0
		end
		DisplayAdapter.mode = function ()
			return 1, 1
		end
		CommandWindow = CommandWindow or {}
		CommandWindow.print = function ()
			return 
		end
		CommandWindow.open = function ()
			return 
		end
		CommandWindow.title = function ()
			return "fml"
		end
		CommandWindow.close = function ()
			return 
		end
		CommandWindow.read_line = function ()
			return 
		end
		CommandWindow.update = function ()
			return 
		end
	end

	if P ~= "win32" then
		Application.set_max_frame_stacking = function ()
			return 
		end
		Application.save_render_target = function ()
			return 
		end
		Window = Window or {}
		Window.open = function ()
			return 
		end
		Window.close = function ()
			return 
		end
		Window.is_closing = function ()
			return 
		end
		Window.minimize = function ()
			return 
		end
		Window.set_keystroke_enabled = function ()
			return 
		end
		Window.KEYSTROKE_WINDOWS = 0
		Window.KEYSTROKE_ALT_TAB = 0
		Window.KEYSTROKE_ALT_ENTER = 0
		Window.KEYSTROKE_ALT_F4 = 0
		Window.set_ime_enabled = function ()
			return 
		end
	end
end

return 
