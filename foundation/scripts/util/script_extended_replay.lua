ScriptExtendedReplay = class(ScriptExtendedReplay)

ScriptExtendedReplay.reload = function ()
	Managers.replay:reload()
end

ScriptExtendedReplay.play = function (enable)
	Managers.replay:play(enable)
end

ScriptExtendedReplay.set_frame = function (frame)
	Managers.replay:set_frame(frame)
end

ScriptExtendedReplay.set_level = function (level)
	Managers.replay:set_level(level)
end

ScriptExtendedReplay.set_stories = function (stories)
	Managers.replay:set_stories(stories)
end

ScriptExtendedReplay.request_moving_units = function ()
	local cmd = {
		message = "moving_units",
		type = "replay",
		units = ExtendedReplay.moving_units()
	}

	Application.console_send(cmd)
end
