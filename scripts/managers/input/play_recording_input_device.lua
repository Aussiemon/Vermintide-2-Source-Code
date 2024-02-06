-- chunkname: @scripts/managers/input/play_recording_input_device.lua

PlayRecordingInputDevice = {}

PlayRecordingInputDevice.name = function ()
	return "PlayRecordingInputDevice"
end

PlayRecordingInputDevice.category = function ()
	return "recording"
end

PlayRecordingInputDevice.active = function ()
	return true
end
