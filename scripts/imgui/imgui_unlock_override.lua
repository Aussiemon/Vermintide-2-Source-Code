ImguiUnlockOverride = class(ImguiUnlockOverride)

ImguiUnlockOverride.init = function (self)
	return
end

ImguiUnlockOverride.update = function (self)
	return
end

ImguiUnlockOverride.draw = function (self)
	Imgui.begin_window("Unlock Override")

	for i, settings in ipairs(UnlockSettings) do
		for unlock_name, unlock_config in pairs(settings.unlocks) do
			Imgui.text(unlock_name)
			Imgui.same_line(360 - Imgui.calculate_text_size(unlock_name))

			local val = UnlockManager._unlock_overrides[unlock_name]

			if Imgui.radio_button("false##" .. unlock_name, val == false) then
				val = false
			end

			Imgui.same_line()

			if Imgui.radio_button("true##" .. unlock_name, val == true) then
				val = true
			end

			Imgui.same_line(30)

			if Imgui.small_button("Clear##" .. unlock_name) then
				val = nil
			end

			UnlockManager._unlock_overrides[unlock_name] = val
		end
	end

	Imgui.end_window()
end

ImguiUnlockOverride.is_persistent = function (self)
	return false
end

return
