local definitions = local_require("scripts/ui/hud_ui/weave_timer_ui_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
WeaveTimerUI = class(WeaveTimerUI)
PROGRESS_CUTOFF = 0.9
BIG_SOUND_REMAINGING_TIME = 10
local DO_RELOAD = false

WeaveTimerUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui_context = ingame_ui_context
	self._wwise_world = ingame_ui_context.wwise_world
	self._render_settings = {}
	self._old_diff = 0
	self._old_time = 0

	self:_create_ui_elements()
end

WeaveTimerUI.destroy = function (self)
	return
end

WeaveTimerUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._render_settings = self._render_settings or {}
	self._widgets = {}

	for name, widget in pairs(widget_definitions) do
		local widget = UIWidget.init(widget)
		self._widgets[name] = widget
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

WeaveTimerUI.update = function (self, dt, t)
	self:_update_timer(dt, t)
	self:_draw(dt, t)
end

WeaveTimerUI._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self._wwise_world, sound_event)
end

WeaveTimerUI._update_timer = function (self, dt, t)
	local weave_manager = Managers.weave

	if weave_manager:get_active_weave() then
		local remaining_time_in_seconds = weave_manager:get_time_left()
		local seconds = math.max(remaining_time_in_seconds, 0)
		local minutes = math.floor(seconds / 60)
		local hours = math.floor(minutes / 60)
		local timer_text = string.format("%d:%02d", minutes - hours * 60, seconds % 60)
		local widget = self._widgets.timer
		local widget_content = widget.content
		local old_progress = widget_content.progress
		local max_time = WeaveSettings.max_time
		local progress = 1 - remaining_time_in_seconds / max_time
		local time = Managers.time:time("game")

		if old_progress < PROGRESS_CUTOFF and PROGRESS_CUTOFF <= progress then
			self:_play_sound("menu_wind_countdown_warning")
		elseif PROGRESS_CUTOFF < progress and progress < 1 then
			local old_time_progress = math.cos(self._old_time * math.pi * 2)
			local time_progress = math.cos(time * math.pi * 2)
			local diff = time_progress - old_time_progress

			if self._old_diff > 0 and diff <= 0 then
				if remaining_time_in_seconds < BIG_SOUND_REMAINGING_TIME + 1 then
					self:_play_sound("menu_wind_countdown_count_big")
				else
					self:_play_sound("menu_wind_countdown_count_small")
				end
			end

			self._old_diff = diff
		end

		widget_content.progress = progress
		widget_content.progress_cutoff = PROGRESS_CUTOFF
		widget_content.timer_text_id = timer_text
		self._old_time = time
	end
end

WeaveTimerUI._update_bar = function (self, dt, t)
	local weave_manager = Managers.weave

	if weave_manager:get_active_weave() then
		local remaining_time_in_seconds = weave_manager:get_time_left()
		local seconds = math.max(remaining_time_in_seconds, 0)
		local minutes = math.floor(seconds / 60)
		local hours = math.floor(minutes / 60)
		local timer_text = string.format("%02d:%02d:%02d", hours, minutes - hours * 60, seconds % 60)
		local max_time = WeaveSettings.max_time
		local progress = 1 - remaining_time_in_seconds / max_time
		local widget = self._widgets.timer_bar
		local widget_content = widget.content
		widget_content.progress = progress
		widget_content.timer_text_id = timer_text
	end
end

WeaveTimerUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = Managers.input:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

return
