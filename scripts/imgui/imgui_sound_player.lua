ImguiSoundPlayer = class(ImguiSoundPlayer)

ImguiSoundPlayer.init = function (self)
	self._event = "pwe_activate_ability_handmaiden_03"
end

ImguiSoundPlayer.update = function (self)
	return
end

ImguiSoundPlayer.draw = function (self)
	Imgui.begin_window("Sound player")

	self._event = Imgui.input_text("Event", self._event)

	if Imgui.small_button("Play") then
		local world = Managers.world:world("level_world")
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, self._event)
	end

	Imgui.end_window()
end

ImguiSoundPlayer.is_persistent = function (self)
	return false
end

return
