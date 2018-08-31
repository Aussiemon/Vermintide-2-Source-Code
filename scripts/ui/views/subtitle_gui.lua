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
	subtitle_background = {
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
	}
}
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
			font_size = 20,
			font_type = "hell_shark",
			draw_text_rect = true,
			text_color = Colors.get_table("white"),
			rect_color = Colors.get_color_table_with_alpha("black", 50)
		}
	}
}
SubtitleGui = class(SubtitleGui)

SubtitleGui.init = function (self, ingame_ui_context)
	self.dialogue_system = ingame_ui_context.dialogue_system
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.playing_dialogues = {}
	self.subtitles_to_display = {}
	self.subtitle_list = {}
	self._subtitle_text = ""
	local level_key, _ = ingame_ui_context.level_transition_handler:get_current_level_keys()
	local dialogue_filename = "dialogues/generated/" .. level_key
	local auto_load_files = DialogueSettings.auto_load_files
	local level_specific_load_files = DialogueSettings.level_specific_load_files[level_key]
	local blocked_auto_load = DialogueSettings.blocked_auto_load_files[level_key]

	self:create_ui_elements()

	local use_subtitles = Application.user_setting("use_subtitles")

	if use_subtitles ~= nil then
		UISettings.use_subtitles = use_subtitles
	end

	if LAUNCH_MODE == "attract_benchmark" then
		UISettings.use_subtitles = false
	end
end

SubtitleGui.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.subtitle_widget = UIWidget.init(subtitle_widget_definition)
end

SubtitleGui.destroy = function (self)
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
	local num_subtitles = #self.subtitle_list

	for i = 1, num_subtitles, 1 do
		if unit == subtitle_list[i].unit then
			table.remove(subtitle_list, i)

			break
		end
	end
end

SubtitleGui._has_subtitle_for_unit = function (self, unit)
	local subtitle_list = self.subtitle_list
	local num_subtitles = #self.subtitle_list

	for i = 1, num_subtitles, 1 do
		if unit == subtitle_list[i].unit then
			return true
		end
	end
end

SubtitleGui.update = function (self, dt)
	if not UISettings.use_subtitles then
		return
	end

	local remake_text = false
	local dialogue_system = self.dialogue_system
	local playing_dialogues = self.playing_dialogues

	for unit, dialogue in pairs(playing_dialogues) do
		if not Unit.alive(unit) then
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

						local speaker_name = Localize("subtitle_name_" .. currently_playing_dialogue.speaker_name)

						self:_add_subtitle(unit, speaker_name, dialogue_text)
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

		for i = 1, num_subtitles, 1 do
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

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if self._subtitle_text ~= "" then
		self.subtitle_widget.content.text_field = self._subtitle_text

		UIRenderer.draw_widget(ui_renderer, self.subtitle_widget)
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

return
