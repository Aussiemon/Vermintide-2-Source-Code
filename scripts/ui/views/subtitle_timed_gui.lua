-- chunkname: @scripts/ui/views/subtitle_timed_gui.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			1,
		},
		size = {
			1920,
			1080,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	subtitle_row = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "bottom",
		size = {
			600,
			50,
		},
		position = {
			0,
			300,
			3,
		},
	},
}
local subtitle_row_widget = {
	scenegraph_id = "subtitle_row",
	start_offset_y = 0,
	element = {
		passes = {
			{
				pass_type = "text",
				style_id = "text",
				text_id = "text",
			},
			{
				pass_type = "text",
				style_id = "shadow_text",
				text_id = "text",
			},
		},
	},
	content = {
		text = "",
	},
	style = {
		text = {
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		shadow_text = {
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				2,
				-2,
				0,
			},
		},
	},
	offset = {
		0,
		0,
		0,
	},
}
local DO_RELOAD = false

SubtitleTimedGui = class(SubtitleTimedGui)

local function extract_lines(text)
	local language_id = Managers.localizer:language_id()
	local is_chinese = language_id == "zh"
	local lines = {}
	local text_length = UTF8Utils.string_length(text)
	local index = 1
	local latest_space_index
	local max_chars_per_line = 50

	for i = 1, text_length do
		local char = UTF8Utils.sub_string(text, i, i)

		if is_chinese then
			local is_space_char = char == " " or char == "。" or char == "，"

			if is_space_char and i >= max_chars_per_line / 2 then
				latest_space_index = i
			end

			if max_chars_per_line < i - index and i < text_length then
				if latest_space_index then
					lines[#lines + 1] = UTF8Utils.sub_string(text, index, latest_space_index)
					index = latest_space_index + 1
					i = latest_space_index
					latest_space_index = nil
				else
					lines[#lines + 1] = UTF8Utils.sub_string(text, index, i)
					index = i + 1
				end
			end
		else
			local is_space_char = char == " "

			if is_space_char and max_chars_per_line < i - index then
				lines[#lines + 1] = UTF8Utils.sub_string(text, index, i)
				index = i + 1
			end
		end
	end

	if index < text_length then
		lines[#lines + 1] = UTF8Utils.sub_string(text, index, text_length)
	end

	return lines
end

SubtitleTimedGui.is_complete = function (self)
	return self._complete
end

SubtitleTimedGui.init = function (self, subtitle_timing_name, num_rows)
	self._num_rows = num_rows or 5
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local localized_subtitle_timing_name = ""

	if type(subtitle_timing_name) == "table" then
		for _, subtitle_name in ipairs(subtitle_timing_name) do
			localized_subtitle_timing_name = localized_subtitle_timing_name .. Localize(subtitle_name) .. " "
		end
	else
		localized_subtitle_timing_name = subtitle_timing_name ~= "" and Localize(subtitle_timing_name) or subtitle_timing_name
	end

	self.texts = extract_lines(localized_subtitle_timing_name)
	self.next_text_index = 0
	self.text_speed = 20
	self.subtitle_timing_name = localized_subtitle_timing_name
	DO_RELOAD = false
end

SubtitleTimedGui._create_ui_elements = function (self, ui_renderer)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}

	for i = 1, self._num_rows do
		local widget = UIWidget.init(subtitle_row_widget)

		widgets[i] = widget

		local start_offset_y = -(i - 1) * 50

		widget.start_offset_y = start_offset_y
		widget.offset[2] = start_offset_y
	end

	self._widgets = widgets

	UIRenderer.clear_scenegraph_queue(ui_renderer)
end

SubtitleTimedGui.update = function (self, ui_renderer, dt)
	if not self._widgets_initialized then
		self._widgets_initialized = true

		self:_create_ui_elements(ui_renderer)
	end

	local widgets = self._widgets

	if DO_RELOAD then
		DO_RELOAD = false
		self.texts = extract_lines(self.subtitle_timing_name)
		self.next_text_index = 0

		for i = 1, #widgets do
			local widget = widgets[i]

			widget.offset[2] = widget.start_offset_y
		end
	end

	for i = 1, #widgets do
		local widget = widgets[i]
		local offset_y = widget.offset[2]
		local offset_y_old = offset_y

		offset_y = offset_y + dt * self.text_speed

		local style = widget.style
		local text_style = style.text
		local shadow_text_style = style.shadow_text

		if offset_y > 0 and offset_y_old <= 0 then
			local next_text_index = self.next_text_index + 1

			self.next_text_index = next_text_index

			local text = self.texts[next_text_index]

			widget.content.text = text or ""
			widget.content.text_index = next_text_index
		elseif offset_y > 200 then
			offset_y = offset_y - #widgets * 50
			text_style.text_color[1] = 0
			shadow_text_style.text_color[1] = 0

			if widget.content.text_index > #self.texts then
				self._complete = true
			end
		end

		widget.offset[2] = offset_y

		if offset_y >= 0 and offset_y < 50 then
			local alpha = math.lerp(0, 255, offset_y / 50)

			text_style.text_color[1] = alpha
			shadow_text_style.text_color[1] = alpha
		elseif offset_y >= 50 and offset_y < 150 then
			text_style.text_color[1] = 255
			shadow_text_style.text_color[1] = 255
		elseif offset_y >= 150 then
			local alpha = math.lerp(255, 0, (offset_y - 150) / 50)

			text_style.text_color[1] = alpha
			shadow_text_style.text_color[1] = alpha
		end
	end

	self:draw(ui_renderer, dt)
end

SubtitleTimedGui.draw = function (self, ui_renderer, dt)
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings
	local widgets = self._widgets

	if not widgets then
		return
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, render_settings)

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
