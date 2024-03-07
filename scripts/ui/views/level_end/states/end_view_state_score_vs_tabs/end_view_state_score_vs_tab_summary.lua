-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_summary.lua

require("scripts/settings/dlcs/carousel/end_screen_award_settings")

local DO_RELOAD = false

EndViewStateScoreVSTabSummary = class(EndViewStateScoreVSTabSummary)
EndViewStateScoreVSTabSummary.NAME = "EndViewStateScoreVSTabSummary"

EndViewStateScoreVSTabSummary.on_enter = function (self, params)
	print("[EndViewStateVS] Enter Substate EndViewStateScoreVSTabSummary")

	self._params = params

	local context = params.context

	self._context = context
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self.input_manager = context.input_manager
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params)
	self:_calculate_awards()
	self:_start_transition_animation("on_enter", "on_enter")

	local parent = self._params.parent

	parent:show_team()
end

EndViewStateScoreVSTabSummary._calculate_awards = function (self)
	self._awards = {}

	local players_session_scores = self._context.players_session_score

	for i = 1, #EndScreenAwardSettings do
		local award_settings = EndScreenAwardSettings[i]
		local winner_peer_id = award_settings.evaluate(players_session_scores)

		if winner_peer_id then
			self._awards[winner_peer_id] = self._awards[winner_peer_id] or {}
			self._awards[winner_peer_id][#self._awards[winner_peer_id] + 1] = award_settings.name
		end
	end

	local max_awards = 0
	local mvp_peer_id

	for peer_id, awards in pairs(self._awards) do
		local num_awards = #awards

		if max_awards < num_awards then
			mvp_peer_id = peer_id
			max_awards = num_awards
		end
	end

	if mvp_peer_id then
		table.insert(self._awards[mvp_peer_id], 1, "mvp")
	end

	table.dump(self._awards, "AWARDS", 2)
end

EndViewStateScoreVSTabSummary.on_exit = function (self, params)
	print("[EndViewStateVS] Exit Substate EndViewStateScoreVSTabSummary")

	self._ui_scenegraph = nil
	self._widgets = nil
	self._widgets_by_name = nil
	self._ui_animator = nil

	local parent = self._params.parent

	parent:hide_team()
end

EndViewStateScoreVSTabSummary.create_ui_elements = function (self, params)
	local definitions = self:_get_definitions()
	local widget_definitions = definitions.widget_definitions
	local summary_entry_widget_definitions = definitions.summary_entry_widgets
	local scenegraph_definition = definitions.scenegraph_definition
	local animation_definitions = definitions.animation_definitions

	DO_RELOAD = false
	self._scenegraph_definition = scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

EndViewStateScoreVSTabSummary._get_definitions = function (self)
	return local_require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_summary_definitions")
end

EndViewStateScoreVSTabSummary.update = function (self, dt, t)
	if DO_RELOAD then
		self:on_enter(self._params)
	end

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	self:draw(input_service, dt)
	self._ui_animator:update(dt)
	self:_update_animations(dt)
end

EndViewStateScoreVSTabSummary.post_update = function (self, dt, t)
	return
end

EndViewStateScoreVSTabSummary._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

EndViewStateScoreVSTabSummary.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateScoreVSTabSummary._start_transition_animation = function (self, key, animation_name)
	local params = {
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, self._scenegraph_definition, params)

	self._animations[key] = anim_id
end
