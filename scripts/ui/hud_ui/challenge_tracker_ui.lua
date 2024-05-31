-- chunkname: @scripts/ui/hud_ui/challenge_tracker_ui.lua

local definitions = local_require("scripts/ui/hud_ui/challenge_tracker_ui_definitions")

ChallengeTrackerUI = class(ChallengeTrackerUI)

local RESTACK_SPEED = 500
local RETAINED_MODE_ENABLED = definitions.RETAINED_MODE_ENABLED

ChallengeTrackerUI.init = function (self, parent, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._wwise_world = ingame_ui_context.wwise_world

	self:_create_ui_elements()
end

ChallengeTrackerUI.destroy = function (self)
	if RETAINED_MODE_ENABLED then
		local widgets = self._data and self._data.widgets

		if widgets then
			UIUtils.destroy_widgets(self._ui_renderer, widgets)
		end
	end
end

ChallengeTrackerUI._play_sound = function (self, sound_event)
	return WwiseWorld.trigger_event(self._wwise_world, sound_event)
end

ChallengeTrackerUI._create_ui_elements = function (self)
	self:destroy()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._render_settings = {
		alpha_multiplier = 1,
	}
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	self._data = {
		offset = {
			0,
			0,
			0,
		},
		widgets = {},
		widget_by_challenge = {},
		challenges = {},
	}
	self._animation_queue = MakeTableWeakKeys({})
	self._restack_targets = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._dirty = true
end

local function sort_by_category(a, b)
	return a:get_category() < b:get_category()
end

ChallengeTrackerUI._refresh_challenge_data = function (self, data)
	table.clear(data.challenges)

	local challenges, n = Managers.venture.challenge:get_challenges_filtered(data.challenges)

	table.sort(challenges, sort_by_category)

	local active_widgets = data.widgets
	local num_active_widgets = #active_widgets
	local gui = RETAINED_MODE_ENABLED and self._ui_renderer.gui_retained or self._ui_renderer.gui

	for i = 1, n do
		local challenge = challenges[i]
		local challenge_status = challenge:get_status()
		local widget = data.widget_by_challenge[challenge]

		if not widget and challenge_status == InGameChallengeStatus.InProgress then
			num_active_widgets = num_active_widgets + 1
			widget = definitions.create_objective(challenge, gui, data.offset, num_active_widgets)
			data.widgets[num_active_widgets] = widget
			data.widget_by_challenge[challenge] = widget

			self:_play_animation_queued("on_enter", widget)
		end
	end

	for i = 1, num_active_widgets do
		local widget = active_widgets[i]
		local content = widget.content
		local challenge = content.challenge
		local challenge_status = challenge:get_status()

		if challenge_status == InGameChallengeStatus.InProgress then
			content.progress, content.max_progress = challenge:get_progress()

			if content.last_progress ~= content.progress then
				self:_play_animation_queued("on_progress", widget)

				content.last_progress = content.progress
			end
		elseif not content.is_done and not content.canceled then
			if challenge_status == InGameChallengeStatus.Finished then
				local challenge_result = challenge:get_result()

				if challenge_result == InGameChallengeResult.Completed then
					content.is_done = true
					content.progress, content.max_progress = challenge:get_progress()

					self:_play_animation_queued("on_progress", widget)
					self:_play_animation_queued("on_done", widget)
				else
					content.canceled = true

					self:_play_animation_queued("on_cancel", widget)
				end
			elseif challenge_status == InGameChallengeStatus.Paused then
				content.canceled = true

				self:_play_animation_queued("on_cancel", widget)
			end
		end
	end
end

ChallengeTrackerUI._cb_on_done = function (self, widget, challenge)
	local data = self._data
	local index = table.index_of(data.widgets, widget)
	local num_widgets = #data.widgets

	data.widgets[index] = nil
	data.widget_by_challenge[challenge] = nil
	self._animation_queue[widget] = nil
	self._restack_targets[widget] = nil

	if RETAINED_MODE_ENABLED then
		UIWidget.destroy(self._ui_renderer, widget)
	end

	local offset = data.offset
	local restack_targets = self._restack_targets

	for i = index + 1, num_widgets do
		restack_targets[data.widgets[i]] = definitions.get_widget_position(offset, i - 1)[2]
		data.widgets[i - 1] = data.widgets[i]
		data.widgets[i] = nil
	end
end

ChallengeTrackerUI._play_animation = function (self, name, widget, initial_delay)
	local animator = self._ui_animator

	animator:stop_animation(widget.content.animation_id or false)

	widget.content.animation_id = animator:start_animation(name, widget, definitions.scenegraph_definition, {
		view = self,
		ui_renderer = self._ui_renderer,
	}, initial_delay)
end

ChallengeTrackerUI._play_animation_queued = function (self, name, widget, initial_delay)
	local animator = self._ui_animator
	local current_animation_id = widget.content.animation_id

	if animator:is_animation_completed(current_animation_id) then
		self:_play_animation(name, widget, initial_delay)
	else
		local queue = self._animation_queue[widget] or {}

		queue[#queue + 1] = {
			name = name,
			initial_delay = initial_delay,
		}
		self._animation_queue[widget] = queue
	end
end

ChallengeTrackerUI._update_animation_queue = function (self)
	local animator = self._ui_animator

	for widget, anim_queue in pairs(self._animation_queue) do
		local anim_data = anim_queue[1]

		if anim_data then
			local current_animation_id = widget.content.animation_id

			if animator:is_animation_completed(current_animation_id) then
				self:_play_animation(anim_data.name, widget, anim_data.initial_delay)
				table.remove(anim_queue, 1)
			end
		else
			self._animation_queue[widget] = nil
		end
	end
end

ChallengeTrackerUI._update_restacking = function (self, dt)
	local restack_targets = self._restack_targets
	local speed = RESTACK_SPEED * dt

	for widget, target in pairs(restack_targets) do
		local current = widget.offset[2]
		local step = target - current
		local step_dist = math.abs(step)

		if step_dist <= speed then
			widget.offset[2] = target
			restack_targets[widget] = nil
		else
			local step_size = math.min(math.abs(step), speed)

			widget.offset[2] = current + math.clamp(step, -step_size, step_size)
		end

		self:_set_widget_dirty(widget)
	end
end

ChallengeTrackerUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
	self._dirty = true
end

ChallengeTrackerUI._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local active_widgets = self._data.widgets
	local num_active_widgets = #active_widgets

	for i = 1, num_active_widgets do
		local widget = active_widgets[i]
		local anim_id = widget.content.animation_id

		if not ui_animator:is_animation_completed(anim_id) then
			self:_set_widget_dirty(widget)
		end
	end
end

ChallengeTrackerUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		UIUtils.mark_dirty(self._data.widgets)

		self._dirty = true
	end
end

local customizer_data = {
	drag_scenegraph_id = "quest",
	label = "Duties",
	lock_x = false,
	lock_y = false,
	registry_key = "questingknight",
	root_scenegraph_id = "quest",
}

ChallengeTrackerUI.update = function (self, dt, t)
	HudCustomizer.run(self._ui_renderer, self._ui_scenegraph, customizer_data)
	self:_handle_resolution_modified()
	self:_update_restacking(dt)
	self:_update_animation_queue()
	self:_refresh_challenge_data(self._data)
	self:_update_animations(dt, t)
	self:_draw(dt)
end

ChallengeTrackerUI._draw = function (self, dt)
	if not self._dirty and RETAINED_MODE_ENABLED or not self._is_visible then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service
	local UIRenderer = UIRenderer

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._data.widgets) do
		render_settings.alpha_multiplier = widget.content.alpha_multiplier or 1

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

ChallengeTrackerUI.set_visible = function (self, visible)
	self._is_visible = visible

	local ui_renderer = self._ui_renderer

	for _, widget in pairs(self._data.widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._dirty = true
end
