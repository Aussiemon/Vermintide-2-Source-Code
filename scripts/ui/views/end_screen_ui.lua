local definitions = local_require("scripts/ui/views/end_screen_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local screens = definitions.screens

for _, definition in pairs(screens) do
	require(definition.file_name)
end

local DO_RELOAD = false
EndScreenUI = class(EndScreenUI)

EndScreenUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.world_manager = ingame_ui_context.world_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("end_screen_ui", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("end_screen_ui", "keyboard")
	input_manager:map_device_to_service("end_screen_ui", "mouse")
	input_manager:map_device_to_service("end_screen_ui", "gamepad")

	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()
end

EndScreenUI.destroy = function (self)
	self.ui_animator = nil

	GarbageLeakDetector.register_object(self, "EndScreenUI")
end

EndScreenUI.create_ui_elements = function (self)
	DO_RELOAD = false
	self.draw_flags = {
		draw_text = false,
		banner_alpha_multiplier = 0,
		draw_background = false
	}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.background_rect_widget = UIWidget.init(definitions.widgets.background_rect)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

EndScreenUI.input_service = function (self)
	return self.input_manager:get_service("end_screen_ui")
end

EndScreenUI.on_enter = function (self, screen_name, screen_context)
	local screen_definition = screens[screen_name]

	fassert(screen_definition, "Unknown screen name: %s", screen_name)

	self.is_active = true
	local input_manager = self.input_manager

	if not Managers.chat:chat_is_focused() then
		input_manager:block_device_except_service("end_screen_ui", "mouse")
		input_manager:block_device_except_service("end_screen_ui", "keyboard")
		input_manager:block_device_except_service("end_screen_ui", "gamepad", 1)
	end

	self:_fade_in_background()
	self:play_sound("mute_all_world_sounds")

	local input_service = self:input_service()
	local class_name = screen_definition.class_name
	local screen_class = rawget(_G, class_name)
	self._screen = screen_class:new(self._ingame_ui_context, input_service, screen_context)

	self._screen:on_fade_in()
	Wwise.set_state("override", "false")
end

EndScreenUI.on_exit = function (self)
	local draw_flags = self.draw_flags
	self.is_active = false

	if not Managers.chat:chat_is_focused() then
		local input_manager = self.input_manager

		input_manager:device_unblock_all_services("mouse", 1)
		input_manager:device_unblock_all_services("keyboard", 1)
		input_manager:device_unblock_all_services("gamepad", 1)
	end

	Managers.music:unduck_sounds()
end

EndScreenUI.on_complete = function (self)
	self.is_complete = true
end

EndScreenUI.fade_in_complete = function (self)
	return self._fade_in_completed
end

EndScreenUI._fade_in_background = function (self)
	self.background_in_anim_id = self.ui_animator:start_animation("fade_in_background", {
		self.background_rect_widget
	}, scenegraph_definition, self.draw_flags)
end

EndScreenUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	if not self.is_active then
		return
	end

	local screen = self._screen

	screen:update(dt)

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	if self.background_in_anim_id then
		if ui_animator:is_animation_completed(self.background_in_anim_id) then
			self.background_in_anim_id = nil
			self._fade_in_completed = true

			screen:start()
		end
	elseif screen:started() and screen:completed() and not Managers.backend:is_pending_request() then
		Managers.transition:fade_in(GameSettings.transition_fade_in_speed, callback(self, "on_complete"))
	end

	self:draw(dt)
end

EndScreenUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("end_screen_ui")
	local draw_flags = self.draw_flags
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if draw_flags.draw_background then
		UIRenderer.draw_widget(ui_renderer, self.background_rect_widget)
	end

	UIRenderer.end_pass(ui_renderer)
	self._screen:draw(dt)
end

EndScreenUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

return
