require("scripts/ui/hud_ui/rewards_popup_ui")

BaseEndScreenUI = class(BaseEndScreenUI)

BaseEndScreenUI.init = function (self, ingame_ui_context, input_service, definitions, params)
	self._ui_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui_context = ingame_ui_context
	self._params = params
	local world_manager = ingame_ui_context.world_manager
	local world = world_manager:world("level_world")
	self._wwise_world = world_manager:wwise_world(world)
	self._input_service = input_service
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._draw_flags = {
		alpha_multiplier = 0
	}
	self._started = false
	self._completed = false
	self._rewards_popup = RewardsPopupUI:new(nil, ingame_ui_context)

	self:_setup_rewards(params)
	self:_create_ui_elements(definitions)
end

BaseEndScreenUI._setup_rewards = function (self, params)
	local rewards = params and params.rewards

	if rewards then
		self._rewards_popup:present_rewards(rewards)
	end
end

BaseEndScreenUI.destroy = function (self)
	self._rewards_popup:destroy()
	self:_destroy()
end

BaseEndScreenUI.on_fade_in = function (self)
	self:_on_fade_in()
end

BaseEndScreenUI._on_fade_in = function (self)
	return
end

BaseEndScreenUI._start = function (self)
	return
end

BaseEndScreenUI._update = function (self, dt)
	return
end

BaseEndScreenUI._destroy = function (self)
	return
end

BaseEndScreenUI._draw_widgets = function (self, render_settings)
	return
end

BaseEndScreenUI._on_completed = function (self)
	self._completed = true
end

BaseEndScreenUI.completed = function (self)
	return self._completed and self._rewards_popup:all_presentations_done()
end

BaseEndScreenUI._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

BaseEndScreenUI._create_ui_elements = function (self, definitions)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
end

BaseEndScreenUI.start = function (self)
	self._started = true

	self:_start()
end

BaseEndScreenUI.started = function (self)
	return self._started
end

BaseEndScreenUI.update = function (self, dt, t)
	if not self._started then
		return
	end

	self._ui_animator:update(dt, t)
	self._rewards_popup:update(dt, t)
	self:_update(dt)
end

BaseEndScreenUI.draw = function (self, dt)
	if not self._started then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_service
	local render_settings = self._render_settings
	local draw_flags = self._draw_flags
	render_settings.alpha_multiplier = draw_flags.alpha_multiplier or 0

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	self:_draw_widgets(ui_renderer, render_settings)
	UIRenderer.end_pass(ui_renderer)
end
