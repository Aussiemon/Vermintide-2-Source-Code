local definitions = local_require("scripts/ui/views/transition_video_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local background_widget_definitions = definitions.background_widget_definitions
local widget_definitions = definitions.widget_definitions
local demo_video = definitions.demo_video
TransitionVideo = class(TransitionVideo)
local fake_input_service = {
	get = function ()
		return 
	end,
	has = function ()
		return 
	end
}
TransitionVideo.init = function (self, world, video_data_table)
	self._world = world
	local platform = PLATFORM
	self._platform = platform
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._video_data_table = video_data_table or demo_video
	self._ui_renderer = UIRenderer.create(world, "material", self._video_data_table.video_name)

	self._create_ui_elements(self)

	return 
end
TransitionVideo._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._demo_video = UIWidget.init(UIWidgets.create_splash_video(self._video_data_table))
	self._widgets = {}

	for widget_name, widget_definition in pairs(widget_definitions) do
		self._widgets[widget_name] = UIWidget.init(widget_definition)
	end

	self._background_widgets = {}

	for widget_name, widget_definition in pairs(background_widget_definitions) do
		self._background_widgets[widget_name] = UIWidget.init(widget_definition)
	end

	return 
end
local DO_RELOAD = true
TransitionVideo.activate = function (self, activate)
	if DO_RELOAD then
		self._create_ui_elements(self)

		DO_RELOAD = false
	end

	self._active = activate

	if not activate then
		self._destroy_video(self)
	end

	return 
end
TransitionVideo._destroy_video = function (self)
	local ui_renderer = self._ui_renderer

	if ui_renderer.video_player then
		UIRenderer.destroy_video_player(ui_renderer)

		self._sound_started = false

		if self._video_data_table.sound_stop then
			Managers.music:trigger_event(self._video_data_table.sound_stop)
		end
	end

	return 
end
TransitionVideo.update = function (self, dt, t)
	if self._active then
		self._draw(self, dt, t)
	end

	return 
end
TransitionVideo._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt, nil, self.render_settings)

	if not self._demo_video.content.video_content.video_completed then
		if not ui_renderer.video_player then
			UIRenderer.create_video_player(ui_renderer, self._world, self._video_data_table.video_name, self._video_data_table.loop)
		else
			if not self._sound_started then
				if self._video_data_table.sound_start then
					Managers.music:trigger_event(self._video_data_table.sound_start)
				end

				self._sound_started = true
			end

			UIRenderer.draw_widget(ui_renderer, self._demo_video)
		end
	elseif ui_renderer.video_player then
		UIRenderer.destroy_video_player(ui_renderer)

		self._sound_started = false

		if self._video_data_table.sound_stop then
			Managers.music:trigger_event(self._video_data_table.sound_stop)
		end

		self._active = false
		self._demo_video.content.video_content.video_completed = false
	end

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in pairs(self._background_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
TransitionVideo.completed = function (self)
	return self._demo_video.content.video_content.video_completed
end
TransitionVideo.is_active = function (self)
	return self._active
end
TransitionVideo.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)

	return 
end

return 
