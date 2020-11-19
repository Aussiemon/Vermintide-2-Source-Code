local definitions = local_require("scripts/ui/hud_ui/buff_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local ALIGNMENT_DURATION_TIME = 0.3
local MAX_BUFF_ROWS = definitions.MAX_BUFF_ROWS
local MAX_BUFF_COLUMNS = definitions.MAX_BUFF_COLUMNS
local MAX_NUMBER_OF_BUFFS = definitions.MAX_NUMBER_OF_BUFFS
local BUFF_SIZE = definitions.BUFF_SIZE
local BUFF_SPACING = definitions.BUFF_SPACING
BuffUI = class(BuffUI)

BuffUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	self.is_in_inn = ingame_ui_context.is_in_inn
	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self.render_settings = {
		alpha_multiplier = 1
	}

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

BuffUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local buff_widgets = {}
	local unused_buff_widgets = {}
	local buff_widget_definitions = definitions.buff_widget_definitions

	for i = 1, #buff_widget_definitions, 1 do
		local definition = buff_widget_definitions[i]
		buff_widgets[i] = UIWidget.init(definition)
		unused_buff_widgets[i] = buff_widgets[i]
	end

	self._buff_widgets = buff_widgets
	self._unused_buff_widgets = unused_buff_widgets
	self._active_buffs = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self:set_visible(true)
	self:set_dirty()

	local player = (self._is_spectator and self._spectated_player) or Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit then
		local career_extension = ScriptUnit.extension(player_unit, "career_system")
		local career_index = career_extension:career_index()
		self._current_career_index = career_index
	end
end

BuffUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true

	self:set_visible(false)
	self:set_visible(true)
	self:set_dirty()

	local career_extension = ScriptUnit.extension(spectated_player_unit, "career_system")
	local career_index = career_extension:career_index()
	self._current_career_index = career_index
end

local widgets_to_remove = {}
local buffs_to_add = {}

BuffUI._sync_buffs = function (self)
	local debug_buffs = Development.parameter("debug_player_buffs")
	local t = Managers.time:time("game")
	local active_buffs = self._active_buffs
	local align_widgets = false
	local player = (self._is_spectator and self._spectated_player) or Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit then
		table.clear(buffs_to_add)

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local buffs = buff_extension:active_buffs()
		local num_buffs = #buffs

		for i = 1, #active_buffs, 1 do
			local data = active_buffs[i]
			local last_stack_count = data.widget.content.stack_count
			data.widget.content.last_stack_count = last_stack_count or 1
			data.widget.content.stack_count = 1
			data.verified = false
		end

		for i = 1, num_buffs, 1 do
			repeat
				local buff = buffs[i]
				local duration = buff.duration
				local start_time = buff.start_time
				local buff_template = buff.template
				local handle_buff = debug_buffs or buff_template.icon ~= nil

				if handle_buff then
					local buff_id = buff.id
					local infinite = not duration
					local end_time = duration and start_time + duration
					local remaining_duration = end_time and math.max(end_time - t, 0)
					local verified = false

					for j = 1, #active_buffs, 1 do
						local data = active_buffs[j]

						if data.id == buff_id then
							if not end_time or end_time == data.end_time then
								data.verified = true
								verified = true
							end

							break
						end
					end

					if not verified and (infinite or remaining_duration > 0) then
						buffs_to_add[#buffs_to_add + 1] = buff_id
					end
				end
			until true
		end

		table.clear(widgets_to_remove)

		for i, data in ripairs(active_buffs) do
			if not data.verified then
				widgets_to_remove[#widgets_to_remove + 1] = i
			end
		end

		for i = 1, #widgets_to_remove, 1 do
			local index = widgets_to_remove[i]

			self:_remove_buff(index)

			align_widgets = true
		end

		for i = 1, #buffs, 1 do
			local buff = buffs[i]
			local duration = buff.duration
			local start_time = buff.start_time
			local buff_template = buff.template
			local handle_buff = debug_buffs or buff_template.icon ~= nil

			if handle_buff then
				for j = 1, #buffs_to_add, 1 do
					local id = buffs_to_add[j]

					if id == buff.id then
						local infinite = not duration
						local end_time = duration and start_time + duration
						local added = self:_add_buff(buff, infinite, end_time)

						if added then
							align_widgets = true
						end
					end
				end
			end
		end

		if align_widgets then
			self:_align_widgets()
		end
	end
end

BuffUI._add_buff = function (self, buff, infinite, end_time)
	local buff_template = buff.template
	local buff_id = buff.id
	local buff_name = buff_template.name
	local is_cooldown = buff_template.is_cooldown
	local debuff = buff_template.debuff
	local duration = buff.duration
	local already_exists = false
	local active_buffs = self._active_buffs

	for i = 1, #active_buffs, 1 do
		local data = active_buffs[i]

		if data.id == buff_id then
			data.end_time = end_time
			already_exists = true

			break
		elseif data.name == buff_name then
			local stack_count = data.widget.content.stack_count
			data.end_time = end_time and ((data.end_time < end_time and end_time) or data.end_time)
			data.widget.content.stack_count = stack_count + 1
			already_exists = true

			break
		end
	end

	local unused_buff_widgets = self._unused_buff_widgets
	local num_buffs = #self._active_buffs

	if already_exists or MAX_NUMBER_OF_BUFFS <= num_buffs then
		return false
	end

	local widget = table.remove(unused_buff_widgets, 1)
	local widget_content = widget.content
	local widget_style = widget.style

	UIRenderer.set_element_visible(self.ui_renderer, widget.element, true)

	widget_content.texture_icon = buff_template.icon or "icons_placeholder"
	widget_content.is_cooldown = is_cooldown
	widget_content.is_infinite = infinite
	widget_style.texture_duration.color = (debuff and {
		255,
		255,
		30,
		0
	}) or {
		255,
		48,
		255,
		0
	}
	local data = {
		id = buff_id,
		template = buff_template,
		name = buff_name,
		widget = widget,
		end_time = end_time,
		duration = duration
	}
	active_buffs[#active_buffs + 1] = data

	self:_set_widget_time_progress(widget, 1, duration, is_cooldown)

	local n = #self._active_buffs
	local i = (n - 1) % MAX_BUFF_COLUMNS
	local j = math.floor((n - 1) / MAX_BUFF_COLUMNS)
	local horizontal_spacing = BUFF_SIZE[1] + BUFF_SPACING
	local vertical_spacing = BUFF_SIZE[2] + BUFF_SPACING
	local total_length = n * horizontal_spacing - BUFF_SPACING
	local start_position_x = total_length - horizontal_spacing
	local widget_offset = widget.offset

	if n > 1 then
		local closest_buff_widget = data.widget
		local closest_buff_offset = closest_buff_widget.offset
		widget_offset[1] = closest_buff_offset[1] + horizontal_spacing
		widget_offset[2] = j * vertical_spacing
		data.target_position = start_position_x
		data.target_distance = math.abs(widget_offset[1] - start_position_x)
	else
		widget_offset[1] = start_position_x
		widget_offset[2] = j * vertical_spacing
	end

	return true
end

BuffUI._remove_buff = function (self, index)
	local active_buffs = self._active_buffs
	local data = table.remove(active_buffs, index)
	local widget = data.widget
	local unused_buff_widgets = self._unused_buff_widgets
	local content = widget.content
	content.stack_count = 1
	content.last_stack_count = 1

	table.insert(unused_buff_widgets, #unused_buff_widgets + 1, widget)
	UIRenderer.set_element_visible(self.ui_renderer, widget.element, false)
end

BuffUI._update_pivot_alignment = function (self, dt)
	local alignment_duration = self._alignment_duration

	if not alignment_duration then
		return
	end

	alignment_duration = math.min(alignment_duration + dt, ALIGNMENT_DURATION_TIME)
	local progress = alignment_duration / ALIGNMENT_DURATION_TIME
	local anim_progress = math.easeOutCubic(progress, 0, 1)

	if progress == 1 then
		self._alignment_duration = nil
	else
		self._alignment_duration = alignment_duration
	end

	local active_buffs = self._active_buffs

	for i = 1, #active_buffs, 1 do
		local data = active_buffs[i]
		local widget = data.widget
		local widget_offset = widget.offset
		local widget_target_position = data.target_position
		local widget_target_distance = data.target_distance

		if widget_target_distance then
			widget_offset[1] = widget_target_position + widget_target_distance * (1 - anim_progress)
		end

		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

BuffUI._align_widgets = function (self)
	local horizontal_spacing = BUFF_SIZE[1] + BUFF_SPACING
	local vertical_spacing = BUFF_SIZE[2] + BUFF_SPACING
	local active_buffs = self._active_buffs

	for n = 1, #active_buffs, 1 do
		local i = (n - 1) % MAX_BUFF_COLUMNS
		local j = math.floor((n - 1) / MAX_BUFF_COLUMNS)
		local data = active_buffs[n]
		local widget = data.widget
		local widget_offset = widget.offset
		local target_position = i * horizontal_spacing
		data.target_position = target_position
		data.target_distance = math.abs(widget_offset[1] - target_position)
		widget_offset[2] = j * vertical_spacing

		self:_set_widget_dirty(widget)
	end

	self:set_dirty()

	self._alignment_duration = 0
end

BuffUI.set_position = function (self, x, y)
	local position = self.ui_scenegraph.pivot.local_position
	position[1] = x
	position[2] = y
	local active_buffs = self._active_buffs

	for i = 1, #active_buffs, 1 do
		local widget = active_buffs[i]

		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

BuffUI.destroy = function (self)
	self:set_visible(false)
	Managers.state.event:unregister("on_spectator_target_changed", self)
end

BuffUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self.ui_renderer
	local buff_widgets = self._buff_widgets

	for i = 1, #buff_widgets, 1 do
		local widget = buff_widgets[i]

		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self:set_dirty()
end

BuffUI.update = function (self, dt, t)
	local dirty = false
	local gamepad_active = self.input_manager:is_device_active("gamepad")

	if gamepad_active then
		if not self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = true

			self:on_gamepad_activated()

			dirty = true
		end
	elseif self.gamepad_active_last_frame then
		self.gamepad_active_last_frame = false

		self:on_gamepad_deactivated()

		dirty = true
	end

	if dirty then
		self:set_dirty()
	end

	self:_handle_career_change()
	self:_sync_buffs()
	self:_update_pivot_alignment(dt)
	self:_handle_resolution_modified()
	self:_update_buffs(dt)
	self:draw(dt)
end

BuffUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()
	end
end

BuffUI._on_resolution_modified = function (self)
	local buff_widgets = self._buff_widgets

	for i = 1, #buff_widgets, 1 do
		local widget = buff_widgets[i]

		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

BuffUI.draw = function (self, dt)
	if not self._is_visible then
		return
	end

	if not self._dirty then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local active_buffs = self._active_buffs

	for i = 1, #active_buffs, 1 do
		local data = active_buffs[i]
		local widget = data.widget

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

BuffUI._update_buffs = function (self, dt)
	local dirty = false
	local t = Managers.time:time("game")
	local active_buffs = self._active_buffs

	for i = 1, #active_buffs, 1 do
		local data = active_buffs[i]
		local widget = data.widget
		local end_time = data.end_time

		if end_time then
			local duration = data.duration
			local infinite = widget.content.is_infinite
			local is_cooldown = widget.content.is_cooldown

			if not infinite then
				if t < end_time then
					local time_left = math.max(end_time - t, 0)
					local progress = 1 - math.min(time_left / duration, 1)

					self:_set_widget_time_progress(widget, progress, time_left, is_cooldown)
				end

				dirty = true
			end
		end

		if not widget.element.dirty and widget.content.stack_count ~= widget.content.last_stack_count then
			self:_set_widget_dirty(widget)

			dirty = true
		end
	end

	if dirty then
		self:set_dirty()
	end
end

BuffUI._handle_career_change = function (self)
	local player = (self._is_spectator and self._spectated_player) or Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit then
		local career_extension = ScriptUnit.extension(player_unit, "career_system")
		local career_index = career_extension:career_index()

		if career_index ~= self._current_career_index then
			while #self._active_buffs > 0 do
				self:_remove_buff(1)
			end

			self._current_career_index = career_index

			self:set_dirty()
		end
	end
end

BuffUI._set_widget_time_progress = function (self, widget, progress, time_left, is_cooldown)
	local style = widget.style
	local content = widget.content

	if time_left and time_left > 0 then
		content.is_expired = false

		if is_cooldown then
			style.texture_cooldown.color[1] = 255 * (1 - progress)
			style.icon_mask.color[1] = 255 * (1 - progress)
			style.texture_duration.color[1] = 0
			style.texture_icon.saturated = true
		else
			style.texture_duration.color[1] = 255 * (1 - progress)
		end
	else
		content.is_expired = true

		if is_cooldown then
			style.texture_cooldown.color[1] = 0
			style.icon_mask.color[1] = 0
		else
			style.texture_duration.color[1] = 255
		end

		style.texture_icon.saturated = false
	end

	self:_set_widget_dirty(widget)
end

BuffUI.set_dirty = function (self)
	self._dirty = true
end

BuffUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

BuffUI.on_gamepad_activated = function (self)
	self:_align_widgets()
end

BuffUI.on_gamepad_deactivated = function (self)
	self:_align_widgets()
end

BuffUI.set_panel_alpha = function (self, alpha)
	if self.render_settings.alpha_multiplier ~= alpha then
		self.render_settings.alpha_multiplier = alpha

		self:set_dirty()

		local active_buffs = self._active_buffs

		for i = 1, #active_buffs, 1 do
			local data = active_buffs[i]
			local widget = data.widget

			self:_set_widget_dirty(widget)
		end
	end
end

return
