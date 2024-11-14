-- chunkname: @scripts/ui/views/demo_end_ui.lua

local definitions = local_require("scripts/ui/views/demo_end_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local background_widget_definitions = definitions.background_widget_definitions
local widget_definitions = definitions.widget_definitions
local demo_video = definitions.demo_video
local DO_RELOAD = false
local VIDEO_REFERENCE_NAME = "DemoEndUI"

DemoEndUI = class(DemoEndUI)

DemoEndUI.init = function (self, world)
	self._world = world

	local platform = PLATFORM

	self.platform = platform
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self._ui_renderer = UIRenderer.create(world, "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_versus_available_common", "material", demo_video.video_name)

	UISetupFontHeights(self._ui_renderer.gui)

	self.input_manager = Managers.input

	self.input_manager:create_input_service("demo", "DemoUIKeyMaps", "DemoUIFilters")
	self.input_manager:map_device_to_service("demo", "gamepad")
	self.input_manager:map_device_to_service("demo", "keyboard")
	self.input_manager:map_device_to_service("demo", "mouse")
	self:_create_ui_elements()
end

DemoEndUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._demo_video = UIWidget.init(UIWidgets.create_splash_video(demo_video, VIDEO_REFERENCE_NAME))
	self._widgets = {}

	for widget_name, widget_definition in pairs(widget_definitions) do
		self._widgets[widget_name] = UIWidget.init(widget_definition)
	end

	self._background_widgets = {}

	for widget_name, widget_definition in pairs(background_widget_definitions) do
		self._background_widgets[widget_name] = UIWidget.init(widget_definition)
	end
end

DemoEndUI.update = function (self, dt, t)
	self:_draw(dt, t)
end

DemoEndUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self.input_manager:get_service("demo")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	if not self._demo_video.content.video_content.video_completed then
		if not ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
			UIRenderer.create_video_player(ui_renderer, VIDEO_REFERENCE_NAME, self._world, demo_video.video_name, demo_video.loop)
		else
			if not self._sound_started then
				if demo_video.sound_start then
					Managers.music:trigger_event(demo_video.sound_start)
				end

				self._sound_started = true
			end

			UIRenderer.draw_widget(ui_renderer, self._demo_video)
		end
	elseif ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
		UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)

		self._sound_started = false

		if demo_video.sound_stop then
			Managers.music:trigger_event(demo_video.sound_stop)
		end
	end

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in pairs(self._background_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

DemoEndUI.completed = function (self)
	return self._demo_video.content.video_content.video_completed
end

DemoEndUI.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end
