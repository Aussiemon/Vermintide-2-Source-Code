EacManager = class(EacManager)

local function means_true(value)
	return value == true or value == "true"
end

EacManager.init = function (self)
	local is_steam_build = means_true(script_data.packaged_build)
	self._suppress_message = means_true(script_data["eac-untrusted"]) or not is_steam_build
	self._file_related_violations = {
		hash_catalogue_error = true,
		hash_catalogue_file_not_found = true,
		unknown_game_file_version = true,
		required_game_file_not_found = true
	}
	self._popup_id = nil
	self._indicator_offset = 0

	return 
end
EacManager.update = function (self, dt, t)
	local popup_manager = Managers.popup

	if self._popup_id ~= nil and popup_manager.query_result(popup_manager, self._popup_id) == "quit" then
		self._popup_id = nil

		Application.quit()
	end

	if self._suppress_message then
		return 
	end

	local state, reason, cause, violation = EAC.state()

	if (state == "untrusted" or state == "banned") and self._file_related_violations[violation] then
		local text = Localize("eac_file_corruption_detected")

		if cause ~= "" then
			text = text .. "\n\n" .. cause
		end

		local topic = Localize("eac_file_corruption_topic")
		local quit_button_text = Localize("menu_quit")
		self._popup_id = popup_manager.queue_popup(popup_manager, text, topic, "quit", quit_button_text)
		self._suppress_message = true
	end

	return 
end
EacManager.draw_panel = function (self, gui, dt)
	if self._suppress_message then
		return 
	end

	local state, reason, cause, violation = EAC.state()

	if state == "untrusted" or state == "banned" then
		local state_text = Localize("eac_state") .. ": " .. Localize("eac_state_" .. state)
		local violation_text = Localize("eac_violation_type") .. ": " .. violation
		local cause_text = ""

		if cause ~= "" then
			cause_text = Localize("eac_cause") .. ": " .. cause
		end

		local explanation = nil

		if state == "banned" then
			explanation = Localize("eac_banned_explanation")
		else
			explanation = Localize("eac_untrusted_explanation")
		end

		self._draw_indicator(self, gui, dt, state_text, violation_text, cause_text, explanation, reason)
	end

	return 
end
EacManager._draw_indicator = function (self, gui, dt, state_text, violation_text, cause_text, explanation_text, reason_text)
	local margin = 8
	local w, h = Application.resolution()
	local font = "core/editor_slave/gui/arial"
	local font_material = "core/editor_slave/gui/arial"
	local font_size = 16
	local row_margin = 2
	local text_adjustment = -10
	local border_thickness = 2
	local border_color = Color(255, 192, 91, 36)
	local background_color = Color(128, 0, 0, 0)
	local text_color = Color(255, 255, 255, 255)
	local max_width = math.ceil(w / 4)
	local depth = 999
	local panel_w = 0
	local row_height = 0
	local min, max = Gui.text_extents(gui, state_text, font, font_size)
	panel_w = math.max(panel_w, max.x - min.x)
	row_height = math.max(row_height, max.y - min.y)
	min, max = Gui.text_extents(gui, violation_text, font, font_size)
	panel_w = math.max(panel_w, max.x - min.x)
	row_height = math.max(row_height, max.y - min.y)
	min, max = Gui.text_extents(gui, cause_text, font, font_size)
	panel_w = math.max(panel_w, max.x - min.x)
	row_height = math.max(row_height, max.y - min.y)
	min, max = Gui.text_extents(gui, explanation_text, font, font_size)
	panel_w = math.max(panel_w, max.x - min.x)
	row_height = math.max(row_height, max.y - min.y)
	min, max = Gui.text_extents(gui, reason_text, font, font_size)
	panel_w = math.max(panel_w, max.x - min.x)
	row_height = math.max(row_height, max.y - min.y)
	row_height = row_height + row_margin
	panel_w = math.ceil(panel_w + 2 * margin)
	panel_w = math.min(max_width, panel_w)
	local move_speed = max_width

	if self._indicator_offset ~= -panel_w then
		if self._indicator_offset < -panel_w then
			self._indicator_offset = self._indicator_offset + move_speed * dt

			if -panel_w < self._indicator_offset then
				self._indicator_offset = -panel_w
			end
		else
			self._indicator_offset = self._indicator_offset - move_speed * dt

			if self._indicator_offset < -panel_w then
				self._indicator_offset = -panel_w
			end
		end
	end

	local lines = {}
	local use_global_table = true
	local text_lines = Gui.word_wrap(gui, state_text, font, font_size, panel_w - 2 * margin, " ", "_-+&/", "\n", use_global_table)

	table.append(lines, text_lines)

	local text_lines = Gui.word_wrap(gui, reason_text, font, font_size, panel_w - 2 * margin, " ", "_-+&/", "\n", use_global_table)

	table.append(lines, text_lines)

	local text_lines = Gui.word_wrap(gui, explanation_text, font, font_size, panel_w - 2 * margin, " ", "_-+&/", "\n", use_global_table)

	table.append(lines, text_lines)

	local text_lines = Gui.word_wrap(gui, violation_text, font, font_size, panel_w - 2 * margin, " ", "_-+&/", "\n", use_global_table)

	table.append(lines, text_lines)

	if cause_text ~= "" then
		local text_lines = Gui.word_wrap(gui, cause_text, font, font_size, panel_w - 2 * margin, " ", "_-+&/", "\n", use_global_table)

		table.append(lines, text_lines)
	end

	local panel_h = 2 * margin + #lines * row_height
	local panel_x = w + self._indicator_offset
	local panel_y = h - margin - panel_h

	Gui.rect(gui, Vector3(panel_x, panel_y, depth), Vector2(panel_w + margin * 2, panel_h), background_color)
	Gui.rect(gui, Vector3(panel_x, panel_y, depth + 1), Vector2(panel_w + margin * 2, border_thickness), border_color)
	Gui.rect(gui, Vector3(panel_x, (panel_y + panel_h) - border_thickness, depth + 1), Vector2(panel_w + margin * 2, border_thickness), border_color)
	Gui.rect(gui, Vector3(panel_x, panel_y, depth + 1), Vector2(border_thickness, panel_h), border_color)

	local y = (panel_y + panel_h) - margin + text_adjustment

	for _, text in ipairs(lines) do
		Gui.text(gui, text, font, font_size, font_material, Vector3(panel_x + margin, y, depth + 1), text_color)

		y = y - row_height
	end

	return 
end

return 
