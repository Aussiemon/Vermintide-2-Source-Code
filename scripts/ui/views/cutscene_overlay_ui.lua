local definitions = local_require("scripts/ui/views/cutscene_overlay_ui_definitions")
CutsceneOverlayUI = class(CutsceneOverlayUI)

CutsceneOverlayUI.init = function (self, parent, context)
	self._parent = parent
	self._ui_renderer = context.ui_renderer
	local world_manager = Managers.world
	local has_world = world_manager and world_manager:has_world("level_world")

	if has_world then
		local world = world_manager:world("level_world")
		self._wwise_world = world_manager:wwise_world(world)
	end

	local event_manager = Managers.state.event

	if event_manager then
		self._registered_event = true

		event_manager:register(self, "event_start_cutscene_overlay", "event_start_function")
	end
end

CutsceneOverlayUI.force_unregister_event_listener = function (self)
	local event_manager = Managers.state.event

	if event_manager and self._registered_event then
		event_manager:unregister("event_start_cutscene_overlay", self)
	end

	self._registered_event = nil
end

CutsceneOverlayUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local active_template_lists = {}
	local widgets_by_template = {}

	for template_list_name, _ in pairs(self._templates) do
		local widgets = {
			text_widget = UIWidget.init(definitions.widget_definitions.text),
			image_widget = UIWidget.init(definitions.widget_definitions.image)
		}
		widgets_by_template[template_list_name] = widgets
		active_template_lists[template_list_name] = {}
	end

	self._active_template_lists = active_template_lists
	self._widgets_by_template = widgets_by_template
end

CutsceneOverlayUI.destroy = function (self)
	local event_manager = Managers.state.event

	if event_manager and self._registered_event then
		event_manager:unregister("event_start_cutscene_overlay", self)
	end
end

CutsceneOverlayUI.event_start_function = function (self, template_settings)
	self:start(template_settings)
end

CutsceneOverlayUI.start = function (self, template_settings)
	local templates = template_settings.templates
	self._templates = table.clone(templates)
	self._start_time = Managers.time:time("ui")
	self._complete = false

	self:_create_ui_elements()
end

CutsceneOverlayUI._present_template_entry = function (self, template_list_name, entry)
	local text = entry.text
	local image = entry.image
	local max_alpha = 255
	local duration = entry.duration
	local start_time = entry.start_time
	local end_time = entry.end_time
	local fade_in_duration = entry.fade_in_duration
	local fade_out_duration = entry.fade_out_duration
	local widgets = self._widgets_by_template[template_list_name]
	local widget = nil

	if text then
		widget = widgets.text_widget
		local localize = entry.localize
		widget.content.text = localize and Localize(text) or text
		local font_size = entry.font_size
		local font_type = entry.font_type
		local word_wrap = entry.word_wrap
		local font_upper_case = entry.font_upper_case
		local vertical_alignment = entry.vertical_alignment or "center"
		local horizontal_alignment = entry.horizontal_alignment or "center"
		local color = entry.color or Colors.get_color_table_with_alpha("white", 255)
		local offset = entry.offset
		local style = widget.style
		local text_style = style.text
		local text_shadow_style = style.text_shadow
		local text_color = text_style.text_color
		max_alpha = color[1]
		text_color[2] = color[2]
		text_color[3] = color[3]
		text_color[4] = color[4]
		text_style.font_size = font_size
		text_shadow_style.font_size = font_size
		text_style.font_type = font_type
		text_shadow_style.font_type = font_type
		text_style.word_wrap = word_wrap
		text_shadow_style.word_wrap = word_wrap
		text_style.upper_case = font_upper_case
		text_shadow_style.upper_case = font_upper_case
		text_style.vertical_alignment = vertical_alignment
		text_shadow_style.vertical_alignment = vertical_alignment
		local text_offset = text_style.offset
		local text_shadow_offset = text_shadow_style.offset
		text_offset[1] = offset[1]
		text_offset[2] = offset[2]
		text_offset[3] = offset[3]
		text_shadow_offset[1] = offset[1] + 2
		text_shadow_offset[2] = offset[2] - 2
		text_shadow_offset[3] = offset[3] - 1
	elseif image then
		widget = widgets.image_widget
		widget.content.texture_id = image
		local texture_style = widget.style.texture_id
		local texture_offset = texture_style.offset
		local offset = entry.offset
		texture_offset[1] = offset[1]
		texture_offset[2] = offset[2]
		texture_offset[3] = offset[3]
		local image_size = entry.image_size
		local texture_size = texture_style.texture_size
		texture_size[1] = image_size[1]
		texture_size[2] = image_size[2]
	end

	return {
		initialized = false,
		text = text,
		image = image,
		duration = duration,
		widget = widget,
		max_alpha = max_alpha,
		start_time = start_time,
		end_time = end_time,
		fade_in_duration = fade_in_duration and fade_in_duration > 0 and fade_in_duration,
		fade_out_duration = fade_out_duration and fade_out_duration > 0 and fade_out_duration
	}
end

CutsceneOverlayUI._convert_string_timestamp_to_float = function (self, string_timestamp)
	local minutes, seconds, hundredths = string.match(string_timestamp, "(%d+)%:(%d+)%:(%d+)")
	local time_in_seconds = minutes * 60 + seconds + hundredths * 0.01
end

CutsceneOverlayUI._has_list_entries = function (self, template_list_name)
	local templates = self._templates
	local template_list = templates[template_list_name]

	return #template_list > 0
end

CutsceneOverlayUI._get_entry_by_time = function (self, template_list_name, time)
	local templates = self._templates
	local template_list = templates[template_list_name]
	local template = template_list[1]

	if not template then
		return
	end

	local start_time = template.start_time
	local end_time = template.end_time

	if end_time <= time then
		table.remove(template_list, 1)

		return self:_get_entry_by_time(template_list_name, time)
	end

	if start_time <= time then
		return table.remove(template_list, 1)
	end
end

CutsceneOverlayUI.update = function (self, dt)
	if not self._start_time or self._complete then
		return
	end

	local current_frame_time = Managers.time:time("ui")
	local current_time = current_frame_time - self._start_time
	local complete = true

	for name, template_list_data in pairs(self._active_template_lists) do
		local list_completed = false
		local active_entry_data = template_list_data.active_entry_data

		if active_entry_data then
			local start_time = active_entry_data.start_time
			local end_time = active_entry_data.end_time
			local duration = active_entry_data.duration

			if current_time > start_time + duration then
				template_list_data.active_entry_data = nil
			else
				local widget = active_entry_data.widget
				local fade_out_duration = active_entry_data.fade_out_duration
				local fade_in_duration = active_entry_data.fade_in_duration
				local max_alpha = active_entry_data.max_alpha
				local alpha_progress = 1

				if fade_in_duration and current_time <= start_time + fade_in_duration then
					alpha_progress = math.min((current_time - start_time) / fade_in_duration, 1)
				elseif fade_out_duration and current_time >= start_time + duration - fade_out_duration then
					alpha_progress = 1 - math.min((current_time - (end_time - fade_out_duration)) / fade_out_duration, 1)
				end

				self:_fade(widget, max_alpha, alpha_progress)
				self:_draw(widget, dt)
			end
		elseif not self:_has_list_entries(name) then
			self._active_template_lists[name] = nil
			list_completed = true
		else
			local current_entry = self:_get_entry_by_time(name, current_time)
			local entry_data = current_entry and self:_present_template_entry(name, current_entry)
			template_list_data.active_entry_data = entry_data

			if entry_data and not entry_data.initialized then
				entry_data.initialized = true
				local sound_event = entry_data.sound_event

				if sound_event and self._wwise_world then
					WwiseWorld.trigger_event(self._wwise_world, sound_event)
				end
			end
		end

		if not list_completed then
			complete = false
		end
	end

	self._complete = complete
end

CutsceneOverlayUI._fade = function (self, widget, max_alpha, progress)
	local alpha = progress * max_alpha
	local style = widget.style

	if style.text then
		local color = style.text.text_color
		local shadow_color = style.text_shadow.text_color
		color[1] = alpha
		shadow_color[1] = alpha
	else
		local color = style.texture_id.color
		color[1] = alpha
	end
end

CutsceneOverlayUI._draw = function (self, widget, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = FAKE_INPUT_SERVICE

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, widget)
	UIRenderer.end_pass(ui_renderer)
end
