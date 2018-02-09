MockInputService = class(MockInputService)
MockInputService.init = function (self)
	self._cursor_position = {
		-100000,
		-100000,
		-100000
	}

	return 
end
local KEYS = {
	left_hold = true,
	left_press = true
}
MockInputService.get = function (self, key)
	if key == "debug_pixeldistance" then
		return false
	elseif key == "cursor" then
		return self._cursor_position
	elseif KEYS[key] then
		return false
	end

	error(string.format("Wrong parameter %q", tostring(key)))

	return 
end
MockInputService.is_blocked = function (self)
	return true
end
MockInputManager = class(MockInputManager)
MockInputManager.init = function (self)
	self._mock_input_service = MockInputService:new()

	return 
end
MockInputManager.get_service = function (self)
	return self._mock_input_service
end

return 
