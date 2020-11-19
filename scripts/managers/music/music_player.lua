require("scripts/managers/music/music")

local function dprint(...)
	if script_data.debug_music then
		print("[MusicPlayer] ", ...)
	end
end

MusicPlayer = class(MusicPlayer)

MusicPlayer.init = function (self, wwise_world, start_event, stop_switch, name, set_flags, unset_flags, parameters, group_states, game_state_voice_thresholds)
	self._wwise_world = wwise_world
	self._start_event = start_event
	self._stop_switch = stop_switch
	self._name = name
	self._set_flags = set_flags
	self._unset_flags = unset_flags
	self._parameters = parameters
	self._enabled = true
	self._init_group_states = group_states
	self._game_state_voice_thresholds = game_state_voice_thresholds
	self._old_music = {}

	dprint(self._name, "init")
end

MusicPlayer.name = function (self)
	return self._name
end

MusicPlayer.set_events = function (self, start_event, stop_event)
	self._start_event = start_event
	self._stop_event = stop_event
end

MusicPlayer._should_play = function (self, flags)
	if not self._enabled then
		return false
	end

	for _, flag in pairs(self._set_flags) do
		if not flags[flag] then
			return false
		end
	end

	for _, flag in pairs(self._unset_flags) do
		if flags[flag] then
			return false
		end
	end

	return true
end

MusicPlayer.set_enabled = function (self, enabled)
	dprint(self._name, "set_enabled", enabled)

	self._enabled = enabled
end

MusicPlayer.is_playing = function (self)
	return self._playing and not table.is_empty(self._old_music)
end

MusicPlayer.set_group_state = function (self, group, state)
	if self._playing then
		self._playing:set_group_state(group, state)
	end
end

MusicPlayer.post_trigger = function (self, event)
	if self._playing then
		dprint(self._name, "post_trigger", event)
		self._playing:post_trigger(event)
	end
end

MusicPlayer.update = function (self, flags, game_object_id)
	local should_play = self:_should_play(flags)

	if not self._playing and should_play then
		self._playing = Music:new(self._wwise_world, self._start_event, self._stop_switch, self._name, self._init_group_states, self._game_state_voice_thresholds)
	elseif self._playing and not should_play then
		self._old_music[self._playing] = true

		self._playing:stop()

		self._playing = false
	end

	if self._playing and game_object_id and not DEDICATED_SERVER then
		local session = Managers.state.network:game()

		for group, _ in pairs(SyncedMusicGroupFlags) do
			local state_id = GameSession.game_object_field(session, game_object_id, group)

			if type(state_id) == "table" then
				local local_party_id = Managers.player:local_player():get_party().party_id
				state_id = state_id[local_party_id]
			end

			if state_id then
				local state = NetworkLookup.music_group_states[state_id]

				self._playing:set_group_state(group, state)
			end
		end
	end

	for music, _ in pairs(self._old_music) do
		if not music:is_playing() then
			self._old_music[music] = nil

			music:destroy()
		end
	end

	if script_data.debug_music and self._playing then
		Debug.text(self._playing:name())

		for state, value in pairs(self._playing._group_states) do
			Debug.text("\t %s: %s", state, value)
		end
	end
end

MusicPlayer.destroy = function (self)
	dprint(self._name, "destroy")

	if self._playing then
		self._playing:destroy()

		self._playing = nil
	end

	for music, _ in pairs(self._old_music) do
		self._old_music[music] = nil

		music:destroy()
	end

	self._old_music = nil
end

MusicPlayer.event_match = function (self, start_event, stop_event)
	return self._start_event == start_event and self._stop_event == stop_event
end

return
