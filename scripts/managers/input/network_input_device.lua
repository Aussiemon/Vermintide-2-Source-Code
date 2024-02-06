-- chunkname: @scripts/managers/input/network_input_device.lua

NetworkInputDevice = {}

NetworkInputDevice.name = function ()
	return "NetworkInputDevice"
end

NetworkInputDevice.category = function ()
	return "network"
end

NetworkInputDevice.active = function ()
	return true
end
