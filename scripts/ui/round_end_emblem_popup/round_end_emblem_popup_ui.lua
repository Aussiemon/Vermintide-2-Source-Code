-- chunkname: @scripts/ui/round_end_emblem_popup/round_end_emblem_popup_ui.lua

local definitions = local_require("scripts/ui/round_end_emblem_popup/round_end_emblem_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local create_emblem_widget = definitions.create_emblem_widget
local animation_definitions = definitions.animations

RoundEndEmblemPopupUI = class(RoundEndEmblemPopupUI)

local DO_RELOAD = false

RoundEndEmblemPopupUI.init = function (self, ui_context, viewport_world, title_text, sub_title_text)
	self._ui_renderer = ui_context.ui_renderer
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._world = ui_context.world

	local wwise_world = ui_context.wwise_world

	self._wwise_world = wwise_world or Managers.world:wwise_world(self._world)
	self._render_settings = {
		alpha_multiplier = 0,
		blur_progress = 0,
		snap_pixel_positions = true,
	}
	self._viewport_world = viewport_world

	self:_create_ui_elements()
	self:_set_title_text(title_text or "")
	self:_set_sub_title_text(sub_title_text or "")
end

RoundEndEmblemPopupUI._set_title_text = function (self, text)
	self._title_title_widget.content.text = text
end

RoundEndEmblemPopupUI._set_sub_title_text = function (self, text)
	self._sub_title_text_widget.content.text = text
end

RoundEndEmblemPopupUI._create_ui_elements = function (self)
	local emblem_tier = "silver"

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widget_definitions = definitions.widget_definitions

	self._title_title_widget = UIWidget.init(widget_definitions.title_title)
	self._sub_title_text_widget = UIWidget.init(widget_definitions.sub_title_text)
	self._emblem_widget = UIWidget.init(create_emblem_widget(emblem_tier))

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}

	local animation_name = "present_entry"

	self._animation_key = self:start_presentation_animation(animation_name)
end

RoundEndEmblemPopupUI.set_input_manager = function (self, input_manager)
	self._input_manager = input_manager
end

RoundEndEmblemPopupUI.destroy = function (self)
	self._ui_animator = nil

	if self._viewport_world and self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false, 0, self._viewport_world)
	end
end

RoundEndEmblemPopupUI.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self._animations_running = self:_update_animations(dt)

	self:_draw(dt)
end

RoundEndEmblemPopupUI._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	if self._animation_key and animations[self._animation_key] and self._viewport_world then
		local render_settings = self._render_settings
		local blur_progress = render_settings.blur_progress or 0

		self:set_fullscreen_effect_enable_state(true, blur_progress, self._viewport_world)
	end

	local animations_running = false

	for animation_key, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_key] = nil

			if self._viewport_world and self._fullscreen_effect_enabled then
				self:set_fullscreen_effect_enable_state(false, 0, self._viewport_world)
			end
		end

		animations_running = true
	end

	return animations_running
end

RoundEndEmblemPopupUI._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("end_of_level")
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.alpha_multiplier = self._emblem_widget.alpha_multiplier or alpha_multiplier

	UIRenderer.draw_widget(ui_top_renderer, self._emblem_widget)

	render_settings.alpha_multiplier = self._title_title_widget.alpha_multiplier or alpha_multiplier

	UIRenderer.draw_widget(ui_top_renderer, self._title_title_widget)

	render_settings.alpha_multiplier = self._sub_title_text_widget.alpha_multiplier or alpha_multiplier

	UIRenderer.draw_widget(ui_top_renderer, self._sub_title_text_widget)
	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
	render_settings.alpha_multiplier = alpha_multiplier
end

RoundEndEmblemPopupUI.is_presentation_complete = function (self)
	return not self._animations_running
end

RoundEndEmblemPopupUI.start_presentation_animation = function (self, animation_name, widgets)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local widgets = widgets or {
		title_title = self._title_title_widget,
		sub_title_text = self._sub_title_text_widget,
		emblem = self._emblem_widget,
	}
	local animation_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	local animation_key = animation_name .. animation_id

	self._animations[animation_key] = animation_id
	self._animation_params = params

	return animation_key
end

RoundEndEmblemPopupUI.set_fullscreen_effect_enable_state = function (self, enabled, progress, world)
	local shading_env = World.get_data(world, "shading_environment")

	progress = progress or enabled and 1 or 0

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", enabled and 1 or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", enabled and progress * 0.75 or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end
