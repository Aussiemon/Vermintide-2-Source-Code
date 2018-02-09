ScriptExtendedReplay = class(ScriptExtendedReplay)
ScriptExtendedReplay.reload = function ()
	Managers.replay:reload()

	return 
end
ScriptExtendedReplay.play = function (enable)
	Managers.replay:play(enable)

	return 
end
ScriptExtendedReplay.set_frame = function (frame)
	Managers.replay:set_frame(frame)

	return 
end
ScriptExtendedReplay.set_level = function (level)
	Managers.replay:set_level(level)

	return 
end
ScriptExtendedReplay.set_stories = function (stories)
	Managers.replay:set_stories(stories)

	return 
end
ScriptExtendedReplay.request_moving_units = function ()
	local cmd = {
		message = "moving_units",
		type = "replay",
		units = ExtendedReplay.moving_units()
	}

	Application.console_send(cmd)

	return 
end

return 
