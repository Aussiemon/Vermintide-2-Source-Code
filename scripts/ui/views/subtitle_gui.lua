local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			1920,
			1080
		}
	},
	subtitle_background_parent = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			120,
			1
		},
		size = {
			850,
			140
		}
	},
	subtitle_background = {
		vertical_alignment = "bottom",
		parent = "subtitle_background_parent",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			0
		},
		size = {
			850,
			140
		}
	}
}

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

local subtitle_widget_definition = {
	scenegraph_id = "subtitle_background",
	element = UIElements.StaticText,
	content = {
		text_field = ""
	},
	style = {
		text = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark",
			draw_text_rect = true,
			text_color = Colors.get_table("white"),
			font_size = UISettings.subtitles_font_size,
			rect_color = Colors.get_color_table_with_alpha("black", UISettings.subtitles_background_alpha)
		}
	}
}
SubtitleGui = class(SubtitleGui)

SubtitleGui.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._dialogue_system = ingame_ui_context.dialogue_system
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self.playing_dialogues = {}
	self.subtitles_to_display = {}
	self.subtitle_list = {}
	self._subtitle_text = ""

	self:_create_ui_elements()

	local use_subtitles = Application.user_setting("use_subtitles")

	if use_subtitles ~= nil then
		UISettings.use_subtitles = use_subtitles
	end

	if LAUNCH_MODE == "attract_benchmark" then
		UISettings.use_subtitles = false
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "ui_event_start_subtitle", "start_subtitle")
		event_manager:register(self, "ui_event_stop_subtitle", "stop_subtitle")
	end
end

SubtitleGui._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._subtitle_widget = UIWidget.init(subtitle_widget_definition)
end

SubtitleGui.destroy = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("ui_event_start_subtitle", self)
		event_manager:unregister("ui_event_stop_subtitle", self)
	end

	self.playing_dialogues = nil

	GarbageLeakDetector.register_object(self, "subtitle_gui")
end

SubtitleGui._add_subtitle = function (self, unit, speaker, text)
	local new_entry = {
		unit = unit,
		speaker = speaker,
		text = text
	}
	self.subtitle_list[#self.subtitle_list + 1] = new_entry
end

SubtitleGui._remove_subtitle = function (self, unit)
	local subtitle_list = self.subtitle_list
	local num_subtitles = #subtitle_list

	for i = 1, num_subtitles do
		if unit == subtitle_list[i].unit then
			table.remove(subtitle_list, i)

			break
		end
	end
end

SubtitleGui._has_subtitle_for_unit = function (self, unit)
	local subtitle_list = self.subtitle_list
	local num_subtitles = #subtitle_list

	for i = 1, num_subtitles do
		if unit == subtitle_list[i].unit then
			return true
		end
	end
end

local customizer_data = {
	root_scenegraph_id = "subtitle_background",
	label = "Subtitles",
	registry_key = "subtitle",
	drag_scenegraph_id = "subtitle_background"
}

SubtitleGui.update = function (self, dt)
	if not UISettings.use_subtitles then
		return
	end

	HudCustomizer.run(self._ui_renderer, self._ui_scenegraph, customizer_data)

	local remake_text = false
	local dialogue_system = self._dialogue_system
	local playing_dialogues = self.playing_dialogues

	for unit, dialogue in pairs(playing_dialogues) do
		if not HEALTH_ALIVE[unit] then
			playing_dialogues[unit] = nil

			self:_remove_subtitle(unit)

			remake_text = true
		end
	end

	for unit, extension in pairs(dialogue_system.unit_extension_data) do
		local currently_playing_dialogue = extension.currently_playing_dialogue
		local dialogue_changed = playing_dialogues[unit] ~= currently_playing_dialogue

		if currently_playing_dialogue then
			if dialogue_changed then
				remake_text = true
				local text_id = currently_playing_dialogue.currently_playing_subtitle

				if Managers.localizer:exists(text_id) then
					local dialogue_text = Localize(text_id)

					if dialogue_text ~= "" then
						if self:_has_subtitle_for_unit(unit) then
							self:_remove_subtitle(unit)
						end

						local speaker_name = currently_playing_dialogue.speaker_name
						local localized_speaker_name = Localize("subtitle_name_" .. speaker_name)
						local color = DialogueSettings.speaker_color_lookup[speaker_name] or DialogueSettings.speaker_color_lookup.default

						if color then
							localized_speaker_name = string.format("{#color(%d,%d,%d)}%s{#reset()}", color[2], color[3], color[4], localized_speaker_name)
						end

						self:_add_subtitle(unit, localized_speaker_name, dialogue_text)
					end
				end
			end

			playing_dialogues[unit] = currently_playing_dialogue
		else
			if dialogue_changed then
				self:_remove_subtitle(unit)

				remake_text = true
			end

			if playing_dialogues[unit] then
				playing_dialogues[unit] = nil
			end
		end
	end

	if remake_text or self._force_text_remake then
		self._force_text_remake = nil
		local text = ""
		local subtitle_list = self.subtitle_list
		local num_subtitles = #subtitle_list

		for i = 1, num_subtitles do
			local entry = subtitle_list[i]
			local entry_speaker = entry.speaker
			local entry_text = entry.text

			if entry_speaker == "" then
				text = text .. entry_text .. "\n"
			else
				text = text .. entry_speaker .. ": " .. entry_text .. "\n"
			end
		end

		for speaker_name, subtitle in pairs(self.subtitles_to_display) do
			local localized_speaker_name = Localize(speaker_name)

			if localized_speaker_name == "" then
				text = text .. Localize(subtitle) .. "\n"
			else
				text = text .. localized_speaker_name .. ": " .. Localize(subtitle) .. "\n"
			end
		end

		self._subtitle_text = text
	end

	local input_manager = self._input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if self._subtitle_text ~= "" then
		local subtitle_widget = self._subtitle_widget
		subtitle_widget.content.text_field = self._subtitle_text
		subtitle_widget.style.text.font_size = UISettings.subtitles_font_size
		subtitle_widget.style.text.rect_color[1] = UISettings.subtitles_background_alpha

		UIRenderer.draw_widget(ui_renderer, subtitle_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

SubtitleGui.start_subtitle = function (self, speaker_name, subtitle)
	self.subtitles_to_display[speaker_name] = subtitle
	self._force_text_remake = true
end

SubtitleGui.stop_subtitle = function (self, speaker_name)
	self.subtitles_to_display[speaker_name] = nil
	self._force_text_remake = true
end
