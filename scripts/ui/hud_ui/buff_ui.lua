local definitions = local_require("scripts/ui/hud_ui/buff_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local MAX_BUFF_ROWS = definitions.MAX_BUFF_ROWS
local MAX_BUFF_COLUMNS = definitions.MAX_BUFF_COLUMNS
local MAX_NUMBER_OF_BUFFS = definitions.MAX_NUMBER_OF_BUFFS
local BUFF_SIZE = definitions.BUFF_SIZE
local BUFF_SPACING = definitions.BUFF_SPACING

local function BUFF_COMPARATOR_FUNC(a, b)
	local a_content = a.content
	local b_content = b.content

	if a_content.is_infinite ~= b_content.is_infinite then
		return b_content.is_infinite
	end

	return b_content.start_time < a_content.start_time
end

BuffUI = class(BuffUI)

BuffUI.init = function (self, parent, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._player = ingame_ui_context.player
	self._is_spectator = false
	self._spectated_player_unit = nil
	self._render_settings = {
		alpha_multiplier = 1
	}

	self:_create_ui_elements()
	Managers.state.event:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

BuffUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local buff_widgets = {}

	for i = 1, MAX_NUMBER_OF_BUFFS do
		buff_widgets[i] = UIWidget.init(definitions.buff_widget_definition)
	end

	self._unused_buff_widgets = buff_widgets
	self._active_buff_widgets = {}
	self._buff_name_to_widget = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	self:set_visible(true)

	self._dirty = true
	self._current_career_index = -1
end

BuffUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._is_spectator = true

	self:set_visible(false)
	self:set_visible(true)

	self._dirty = true
	local career_extension = ScriptUnit.extension(spectated_player_unit, "career_system")
	self._current_career_index = career_extension:career_index()
end

BuffUI._sync_buffs = function (self)
	local active_buff_widgets = self._active_buff_widgets
	local align_widgets = false

	for i = 1, #active_buff_widgets do
		local widget_content = active_buff_widgets[i].content
		widget_content.stack_count = 0
		widget_content.end_time = math.huge
	end

	local player_unit = self._is_spectator and self._spectated_player_unit or self._player.player_unit
	local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

	if buff_extension then
		local buffs, num_buffs = buff_extension:active_buffs()

		for i = 1, #buffs do
			local buff = buffs[i]
			local icon = not buff.removed and buff.template.icon

			if icon then
				local new_widget = self:_add_buff(buff, icon)

				if new_widget then
					align_widgets = true
				end
			end
		end
	end

	if align_widgets then
		table.sort(active_buff_widgets, BUFF_COMPARATOR_FUNC)
	end

	local horizontal_spacing = BUFF_SIZE[1] + BUFF_SPACING
	local vertical_spacing = BUFF_SIZE[2] + BUFF_SPACING
	local t = Managers.time:time("game")
	local buff_index = -1

	for i = #active_buff_widgets, 1, -1 do
		local widget = active_buff_widgets[i]
		local widget_content = widget.content

		if widget_content.stack_count == 0 then
			self:_remove_buff(i)

			align_widgets = true
			widget.element.dirty = true
			self._dirty = true
		else
			if not widget_content.is_infinite then
				if widget_content.duration == 0 then
					widget_content.progress = 0
				else
					widget_content.progress = 1 - math.clamp((widget_content.end_time - t) / widget_content.duration, 0, 1)
				end

				widget.element.dirty = true
				self._dirty = true
			elseif widget_content.stack_count ~= widget_content.last_stack_count then
				widget_content.last_stack_count = widget_content.stack_count
				widget.element.dirty = true
				self._dirty = true
			end

			buff_index = buff_index + 1

			if align_widgets then
				local widget_offset = widget.offset
				local x = buff_index % MAX_BUFF_COLUMNS
				local y = math.floor(buff_index / MAX_BUFF_COLUMNS)
				widget_offset[1] = horizontal_spacing * x
				widget_offset[2] = vertical_spacing * y
				widget.element.dirty = true
				self._dirty = true
			end
		end
	end
end

local COLOR_BUFF = {
	255,
	48,
	255,
	0
}
local COLOR_DEBUFF = {
	255,
	255,
	30,
	0
}

BuffUI._add_buff = function (self, buff, icon)
	local buff_template = buff.template
	local start_time = buff.start_time
	local duration = buff.duration or math.huge
	local is_infinite = duration == math.huge
	local end_time = start_time + duration
	local buff_name_to_widget = self._buff_name_to_widget
	local widget = buff_name_to_widget[buff_template.name]

	if widget then
		local widget_content = widget.content
		local stack_count = widget_content.stack_count + 1
		widget_content.stack_count = stack_count

		if end_time < widget_content.end_time then
			widget_content.end_time = end_time
			widget_content.duration = duration
		end

		return false
	end

	local active_buff_widgets = self._active_buff_widgets
	local num_active_buffs = #active_buff_widgets

	if MAX_NUMBER_OF_BUFFS <= num_active_buffs then
		return false
	end

	local is_cooldown = buff_template.is_cooldown
	local widget = table.remove(self._unused_buff_widgets)
	local widget_content = widget.content
	widget_content.texture_icon = icon
	widget_content.is_cooldown = is_cooldown
	widget_content.is_infinite = is_infinite
	widget_content.name = buff_template.name
	widget_content.start_time = start_time
	widget_content.end_time = end_time
	widget_content.duration = duration
	widget_content.stack_count = 1
	widget_content.progress = is_cooldown and 1 or 0

	UIRenderer.set_element_visible(self._ui_renderer, widget.element, true)

	local widget_style = widget.style
	local duration_color = buff_template.debuff and COLOR_DEBUFF or COLOR_BUFF

	Colors.copy_to(widget_style.texture_duration.color, duration_color)

	widget_style.texture_icon.saturated = is_cooldown
	widget_style.texture_icon_bg.saturated = is_cooldown and is_infinite
	self._buff_name_to_widget[buff_template.name] = widget
	active_buff_widgets[num_active_buffs + 1] = widget

	return true
end

BuffUI._remove_buff = function (self, index)
	local widget = table.remove(self._active_buff_widgets, index)
	local unused_buff_widgets = self._unused_buff_widgets
	unused_buff_widgets[#unused_buff_widgets + 1] = widget
	self._buff_name_to_widget[widget.content.name] = nil

	UIRenderer.set_element_visible(self._ui_renderer, widget.element, false)
end

BuffUI.destroy = function (self)
	self:set_visible(false)
	Managers.state.event:unregister("on_spectator_target_changed", self)
end

BuffUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self._ui_renderer
	local active_buff_widgets = self._active_buff_widgets

	for i = 1, #active_buff_widgets do
		local widget = active_buff_widgets[i]

		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._dirty = true
end

local customizer_data = {
	root_scenegraph_id = "pivot",
	label = "Buff bar",
	registry_key = "buff_ui",
	drag_scenegraph_id = "pivot_dragger"
}

BuffUI.update = function (self, dt, t)
	if HudCustomizer.run(self._ui_renderer, self._ui_scenegraph, customizer_data) then
		UIUtils.mark_dirty(self._active_buff_widgets)

		self._dirty = true
	end

	self:_sync_buffs()

	if RESOLUTION_LOOKUP.modified then
		UIUtils.mark_dirty(self._active_buff_widgets)

		self._dirty = true
	end

	self:draw(dt)
end

BuffUI.draw = function (self, dt)
	if not self._is_visible or not self._dirty then
		return
	end

	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)

	local active_buff_widgets = self._active_buff_widgets

	for i = #active_buff_widgets, 1, -1 do
		UIRenderer.draw_widget(ui_renderer, active_buff_widgets[i])
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

BuffUI.set_panel_alpha = function (self, alpha)
	local render_settings = self._render_settings

	if render_settings.alpha_multiplier ~= alpha then
		render_settings.alpha_multiplier = alpha

		UIUtils.mark_dirty(self._active_buff_widgets)

		self._dirty = true
	end
end
