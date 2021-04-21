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

	Imgui.begin_window("ImguiDeusChestPreloadDebug", "always_auto_resize")
	Imgui.end_window()
end

return
