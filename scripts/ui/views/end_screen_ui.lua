require("scripts/ui/act_presentation/act_presentation_ui")

local definitions = local_require("scripts/ui/views/end_screen_ui_definitions")
local victory_widgets_definitions = definitions.victory_widgets
local defeat_widgets_definitions = definitions.defeat_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local DO_RELOAD = false
EndScreenUI = class(EndScreenUI)
EndScreenUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.world_manager = ingame_ui_context.world_manager
	self.camera_manager = ingame_ui_context.camera_manager
	self.voting_manager = Managers.state.voting
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self.timers = {}
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager.create_input_service(input_manager, "end_screen_ui", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "end_screen_ui", "keyboard")
	input_manager.map_device_to_service(input_manager, "end_screen_ui", "mouse")
	input_manager.map_device_to_service(input_manager, "end_screen_ui", "gamepad")

	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	rawset(_G, "EndScreenUI_pointer", self)
	self.create_ui_elements(self)

	self.act_presentation_ui = ActPresentationUI:new(ingame_ui_context)

	return 
end
EndScreenUI.destroy = function (self)
	if self.voting_data then
		self.voting_data = nil

		ShowCursorStack.pop()
	end

	self.act_presentation_ui:destroy()

	self.act_presentation_ui = nil
	self.ui_animator = nil

	rawset(_G, "EndScreenUI_pointer", nil)
	GarbageLeakDetector.register_object(self, "EndScreenUI")

	return 
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
	local victory_widgets = {}
	local victory_widgets_by_name = {}

	for name, definition in pairs(victory_widgets_definitions) do
		local widget = UIWidget.init(definition)
		victory_widgets_by_name[name] = widget
		victory_widgets[#victory_widgets + 1] = widget
	end

	self._victory_widgets = victory_widgets
	self._victory_widgets_by_name = victory_widgets_by_name
	local defeat_widgets = {}
	local defeat_widgets_by_name = {}

	for name, definition in pairs(defeat_widgets_definitions) do
		local widget = UIWidget.init(definition)
		defeat_widgets_by_name[name] = widget
		defeat_widgets[#defeat_widgets + 1] = widget
	end

	self._defeat_widgets = defeat_widgets
	self._defeat_widgets_by_name = defeat_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	return 
end
EndScreenUI.input_service = function (self)
	return self.input_manager:get_service("end_screen_ui")
end
EndScreenUI.on_enter = function (self, game_won, checkpoint_available, level_key, previous_completed_difficulty_index)
	self.is_active = true
	local input_manager = self.input_manager

	if not Managers.chat:chat_is_focused() then
		input_manager.block_device_except_service(input_manager, "end_screen_ui", "mouse")
		input_manager.block_device_except_service(input_manager, "end_screen_ui", "keyboard")
		input_manager.block_device_except_service(input_manager, "end_screen_ui", "gamepad", 1)
	end

	self.fade_in_background(self)

	self._game_won = game_won
	self._level_key = level_key
	self._previous_completed_difficulty_index = previous_completed_difficulty_index

	self.play_sound(self, "mute_all_world_sounds")

	if game_won then
		self.play_sound(self, "play_gui_splash_victory")
	else
		self.play_sound(self, "play_gui_splash_defeat")
	end

	Wwise.set_state("override", "false")

	return 
end
EndScreenUI.on_exit = function (self)
	local draw_flags = self.draw_flags
	self.is_active = false

	if not Managers.chat:chat_is_focused() then
		local input_manager = self.input_manager

		input_manager.device_unblock_all_services(input_manager, "mouse", 1)
		input_manager.device_unblock_all_services(input_manager, "keyboard", 1)
		input_manager.device_unblock_all_services(input_manager, "gamepad", 1)
	end

	WwiseWorld.trigger_event(self.wwise_world, "hud_in_inventory_state_off")

	return 
end
EndScreenUI.on_complete = function (self)
	self.is_complete = true

	return 
end
EndScreenUI.fade_in_complete = function (self)
	return self._fade_in_completed
end
EndScreenUI.fade_in_background = function (self)
	self.background_in_anim_id = self.ui_animator:start_animation("fade_in_background", {
		self.background_rect_widget
	}, scenegraph_definition, self.draw_flags)

	return 
end
EndScreenUI.fade_out_background = function (self)
	self.background_out_anim_id = self.ui_animator:start_animation("fade_out_background", {
		self.background_rect_widget
	}, scenegraph_definition, self.draw_flags)

	return 
end
EndScreenUI.show_text_screen = function (self)
	local game_won = self._game_won
	local params = {
		draw_flags = self.draw_flags,
		wwise_world = self.wwise_world
	}
	self.draw_flags.banner_alpha_multiplier = 0

	if game_won then
		self.banner_anim_id = self.ui_animator:start_animation("victory", self._victory_widgets_by_name, scenegraph_definition, params)
		local level_key = self._level_key
		local previous_completed_difficulty_index = self._previous_completed_difficulty_index

		self.act_presentation_ui:start(level_key, previous_completed_difficulty_index)
	else
		self.banner_anim_id = self.ui_animator:start_animation("defeat", self._defeat_widgets_by_name, scenegraph_definition, params)
	end

	return 
end
EndScreenUI.update = function (self, dt)
	if DO_RELOAD then
		self.create_ui_elements(self)
	end

	if not self.is_active then
		return 
	end

	local ui_animator = self.ui_animator

	ui_animator.update(ui_animator, dt)

	if not self.banner_anim_id and self.background_in_anim_id and ui_animator.is_animation_completed(ui_animator, self.background_in_anim_id) then
		self.background_in_anim_id = nil

		self.show_text_screen(self)

		self._fade_in_completed = true
	elseif self.banner_anim_id and ui_animator.is_animation_completed(ui_animator, self.banner_anim_id) then
		self.banner_anim_id = nil

		if not self._game_won then
			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, callback(self, "on_complete"))
		end
	elseif self.background_out_anim_id and ui_animator.is_animation_completed(ui_animator, self.background_out_anim_id) then
		self.background_out_anim_id = nil

		self.on_complete(self)
	end

	local act_presentation_ui = self.act_presentation_ui

	if act_presentation_ui.active then
		act_presentation_ui.update(act_presentation_ui, dt)

		if act_presentation_ui.presentation_completed(act_presentation_ui) then
			Managers.transition:fade_in(GameSettings.transition_fade_in_speed, callback(self, "on_complete"))
		end
	end

	self.draw(self, dt)

	return 
end
EndScreenUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("end_screen_ui")
	local draw_flags = self.draw_flags
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.alpha_multiplier = draw_flags.banner_alpha_multiplier or 0

	if self._game_won then
		local victory_widgets = self._victory_widgets

		for _, widget in ipairs(victory_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	else
		local defeat_widgets = self._defeat_widgets

		for _, widget in ipairs(defeat_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = 1

	UIRenderer.draw_widget(ui_renderer, self.background_rect_widget)

	if draw_flags.draw_background then
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
EndScreenUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)

	return 
end

return 
