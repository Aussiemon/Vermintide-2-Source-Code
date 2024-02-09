-- chunkname: @scripts/entity_system/systems/dialogues/dialogue_flow_events.lua

DialogueSystemFlow = class(DialogueSystemFlow)

DialogueSystemFlow.init = function (self, wwise_world, hud_system)
	self._current_sound_event_subtitles = {}
	self._hud_system = hud_system
	self._wwise_world = wwise_world
end

DialogueSystemFlow.trigger_sound_event_with_subtitles = function (self, sound_event, subtitle_event, speaker_name, source_unit, unit_node)
	local playing_event_with_subtitle = {}

	playing_event_with_subtitle.subtitle_event = subtitle_event
	playing_event_with_subtitle.speaker_name = speaker_name
	playing_event_with_subtitle.sound_event = sound_event
	playing_event_with_subtitle.source_unit = source_unit

	if source_unit and unit_node and Unit.has_node(source_unit, unit_node) then
		local unit_node_index = Unit.node(source_unit, unit_node)

		playing_event_with_subtitle.unit_node_index = unit_node_index
	else
		playing_event_with_subtitle.unit_node_index = 0
	end

	self._current_sound_event_subtitles[#self._current_sound_event_subtitles + 1] = playing_event_with_subtitle
end

DialogueSystemFlow.update_sound_event_subtitles = function (self)
	if table.is_empty(self._current_sound_event_subtitles) then
		return
	end

	local event = self._current_sound_event_subtitles[1]
	local current_speaker = event.speaker_name
	local subtitle_event = event.subtitle_event
	local sound_event = event.sound_event
	local source_unit = event.source_unit
	local unit_node = event.unit_node

	if not event.has_started_playing then
		self._hud_system:add_subtitle(current_speaker, subtitle_event)

		local id

		if source_unit then
			id = WwiseWorld.trigger_event(self._wwise_world, sound_event, source_unit, unit_node)
		else
			id = WwiseWorld.trigger_event(self._wwise_world, sound_event)
		end

		event.id = id
		event.has_started_playing = true
	elseif event.id and not WwiseWorld.is_playing(self._wwise_world, event.id) then
		self._hud_system:remove_subtitle(current_speaker)
		table.remove(self._current_sound_event_subtitles, 1)
	end
end
