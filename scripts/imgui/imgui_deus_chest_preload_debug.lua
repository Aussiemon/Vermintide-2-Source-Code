ImguiDeusChestPreloadDebug = class(ImguiDeusChestPreload)

ImguiDeusChestPreloadDebug.init = function (self)
	return
end

ImguiDeusChestPreloadDebug.update = function (self)
	return
end

ImguiDeusChestPreloadDebug.is_persistent = function (self)
	return true
end

ImguiDeusChestPreloadDebug.draw = function (self, is_open)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local do_close = Imgui.begin_window("ImguiDeusChestPreloadDebug", "always_auto_resize")

	Imgui.end_window()

	return do_close
end
