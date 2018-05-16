PerfhudManager = class(PerfhudManager)
PerfhudSettings = PerfhudSettings or {}
PerfhudSettings.artist = {
	key = "f1",
	custom_parameters = {}
}
PerfhudSettings.network = {
	key = "f2",
	custom_parameters = {}
}
PerfhudSettings.network_peers = {
	key = "f3",
	custom_parameters = {}
}
PerfhudSettings.network_messages = {
	key = "f4",
	custom_parameters = {}
}
PerfhudSettings.network_qos = {
	key = "f5",
	custom_parameters = {}
}
PerfhudSettings.network_ping = {
	key = "f6",
	custom_parameters = {}
}
PerfhudSettings.lua = {
	key = "f7",
	custom_parameters = {}
}

PerfhudManager.init = function (self)
	self._active_huds = {}
	self._accumulated_index = nil
end

PerfhudManager.update = function (self, dt, t)
	if not script_data.perfhud then
		return
	end

	local shift_held = Keyboard.button(Keyboard.button_index("left shift")) > 0.5 or Keyboard.button(Keyboard.button_index("right shift")) > 0.5

	for hud_name, settings in pairs(PerfhudSettings) do
		if Keyboard.pressed(Keyboard.button_index(settings.key)) then
			self:_toggle_hud(hud_name, shift_held)
		end
	end

	self:_update_peer_index(dt, t)
end

PerfhudManager._update_peer_index = function (self, dt, t)
	local ctrl_pressed = Keyboard.pressed(Keyboard.button_index("left ctrl")) or Keyboard.pressed(Keyboard.button_index("right ctrl"))

	if ctrl_pressed and not self._accumulated_index then
		self._accumulated_index = ""
	elseif ctrl_pressed then
		self:_set_peer_index(self._accumulated_index)

		self._accumulated_index = nil
	end

	if self._accumulated_index then
		self:_parse_keystrokes(Keyboard.keystrokes())
	end
end

PerfhudManager._parse_keystrokes = function (self, strokes)
	for _, stroke in ipairs(strokes) do
		if stroke == "1" or stroke == "2" or stroke == "3" or stroke == "4" or stroke == "5" or stroke == "6" or stroke == "7" or stroke == "8" or stroke == "9" or stroke == "0" then
			self._accumulated_index = self._accumulated_index .. stroke
		end
	end
end

PerfhudManager._set_peer_index = function (self, accumulated_index)
	Application.console_command("perfhud", "network_peer", accumulated_index)
end

PerfhudManager._toggle_hud = function (self, hud_name, shift_held)
	local active = self._active_huds[hud_name]

	if not shift_held then
		self:_close_all_huds()
	end

	if shift_held and active then
		self:_close_hud(hud_name)
	elseif not active then
		self:_open_hud(hud_name)
	end
end

PerfhudManager._close_all_huds = function (self)
	for hud_name, _ in pairs(self._active_huds) do
		self:_close_hud(hud_name)
	end
end

PerfhudManager._open_hud = function (self, hud_name)
	self._active_huds[hud_name] = true

	Application.console_command("perfhud", hud_name, unpack(PerfhudSettings[hud_name].custom_parameters))
end

PerfhudManager._close_hud = function (self, hud_name)
	self._active_huds[hud_name] = nil

	Application.console_command("perfhud", hud_name)
end

PerfhudManager.destroy = function (self, dt, t)
	self:_close_all_huds()
end

return
