﻿-- chunkname: @scripts/managers/music/music.lua

local function dprint(...)
	if script_data.debug_music then
		print("[Music]", ...)
	end
end

Music = class(Music)

Music.init = function (self, wwise_world, start_event, stop, name, group_states, game_state_voice_thresholds)
	self._wwise_world = wwise_world
	self._stop = stop
	self._name = name
	self._game_state_voice_thresholds = game_state_voice_thresholds

	self:_init_group_states(group_states)

	self._id = self:_trigger_event(start_event)
end

Music._init_group_states = function (self, states)
	self._group_states = {}

	for group, state in pairs(states) do
		self:set_group_state(group, state)
	end
end

Music.name = function (self)
	return self._name
end

Music.stop = function (self)
	if self._stop then
		dprint("Stopping Music player", self._name, "with switch:", self._stop.switch, "and value", self._stop.value)
		self:set_group_state(self._stop.group, self._stop.state)
		self:_trigger_event(self._stop.event)
	else
		self:destroy()
	end

	self._stopped = true
end

Music.is_stopped = function (self)
	return self._stopped
end

Music.is_playing = function (self)
	return WwiseWorld.is_playing(self._wwise_world, self._id)
end

Music.destroy = function (self)
	if self:is_playing() then
		WwiseWorld.stop_event(self._wwise_world, self._id)
	end
end

Music.set_group_state = function (self, state, value)
	if self._group_states[state] ~= value then
		dprint("Player", self._name, "setting group state:", state, "to", value)
		Wwise.set_state(state, value)

		self._group_states[state] = value

		if state == "game_state" then
			local voice_threshold = self._game_state_voice_thresholds[value] or self._game_state_voice_thresholds.default

			Wwise.set_volume_threshold(voice_threshold)
		end
	end
end

Music._trigger_event = function (self, event)
	dprint("trigger event", event)

	return WwiseWorld.trigger_event(self._wwise_world, event)
end

Music.post_trigger = function (self, trigger)
	dprint("post trigger", trigger)
	WwiseWorld.trigger_event(self._wwise_world, trigger)
end
