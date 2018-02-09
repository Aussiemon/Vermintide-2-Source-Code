local definitions = local_require("scripts/ui/views/unlock_key_view_definitions")
UnlockKeyView = class(UnlockKeyView)
UnlockKeyView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.world = ingame_ui_context.world
	self.statistics_db = ingame_ui_context.statistics_db
	self.wwise_world = ingame_ui_context.dialogue_system.wwise_world
	local input_manager = self.input_manager

	input_manager.create_input_service(input_manager, "unlock_key_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "unlock_key_menu", "keyboard")
	input_manager.map_device_to_service(input_manager, "unlock_key_menu", "mouse")
	input_manager.map_device_to_service(input_manager, "unlock_key_menu", "gamepad")
	rawset(_G, "global_unlock_key_view", self)

	self.ui_animations = {}

	self.create_ui_elements(self)

	self.controller_cooldown = 0

	return 
end
UnlockKeyView.input_service = function (self)
	return self.input_manager:get_service("unlock_key_menu")
end
UnlockKeyView.destroy = function (self)
	rawset(_G, "global_unlock_key_view", nil)
	GarbageLeakDetector.register_object(self, "UnlockKeyView")

	return 
end
local widget_definitions = definitions.widget_definitions
local create_simple_texture_widget = definitions.create_simple_texture_widget
local index = 0
UnlockKeyView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.background_widgets = {
		create_simple_texture_widget("unlock_key_bg", "key_entry_background"),
		create_simple_texture_widget("title_bar", "unlock_key_title_background")
	}
	self.confirm_gamepad_button_widget = UIWidget.init(widget_definitions.confirm_gamepad_button_widget)
	self.back_gamepad_button_widget = UIWidget.init(widget_definitions.back_gamepad_button_widget)
	self.processing_icon_widget = UIWidget.init(widget_definitions.processing_icon)
	self.text_input_widget = UIWidget.init(widget_definitions.text_input)
	self.accept_button_widget = UIWidget.init(widget_definitions.accept_button)
	self.cancel_button_widget = UIWidget.init(widget_definitions.cancel_button)
	self.title_widget = UIWidget.init(widget_definitions.title)
	self.confirm_gamepad_button_widget.content.text_field = "Select"
	self.back_gamepad_button_widget.content.text_field = "Exit"

	return 
end
UnlockKeyView.on_enter = function (self)
	self.input_manager:block_device_except_service("unlock_key_menu", "keyboard", 1)
	self.input_manager:block_device_except_service("unlock_key_menu", "mouse", 1)
	self.input_manager:block_device_except_service("unlock_key_menu", "gamepad", 1)

	self.fade_in_done = false

	Managers.transition:fade_in(10, function ()
		self.fade_in_done = true

		return 
	end)

	self.ui_animations.entry_animation = UIAnimation.init(UIAnimation.function_by_time, self.ui_scenegraph.root.local_position, 2, 1080, 1080, 0.01, math.easeInCubic, UIAnimation.wait, 0.1, UIAnimation.function_by_time, self.ui_scenegraph.root.local_position, 2, 1080, 0, 0.01, math.easeInCubic)
	self.key_text = ""
	self.key_text_index = 1
	self.text_mode = "insert"
	self.text_input_widget.content.caret_index = 1
	self.text_input_widget.content.text_index = 1
	self.transition_on_completed_animation = nil

	return 
end
UnlockKeyView.on_exit = function (self)
	return 
end
UnlockKeyView.suspend = function (self)
	self.suspended = true

	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	return 
end
UnlockKeyView.unsuspend = function (self)
	self.input_manager:block_device_except_service("unlock_key_menu", "keyboard", 1)
	self.input_manager:block_device_except_service("unlock_key_menu", "mouse", 1)
	self.input_manager:block_device_except_service("unlock_key_menu", "gamepad", 1)

	self.suspended = nil

	return 
end
UnlockKeyView.update = function (self, dt, t)
	if self.suspended then
		return 
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("unlock_key_menu")
	local menu_animation_active = self.ui_animations.entry_animation or self.ui_animations.exit_animation

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if name ~= "exit_animation" and UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil

			if name == "entry_animation" then
				Managers.transition:fade_out(10)
			end
		end
	end

	if self.ui_animations.exit_animation and UIAnimation.completed(self.ui_animations.exit_animation) then
		Managers.transition:fade_out(10, nil)

		self.ui_animations.exit_animation = nil
		local transition_on_completed_animation = self.transition_on_completed_animation

		if transition_on_completed_animation then
			self.ingame_ui:handle_transition(transition_on_completed_animation)

			self.transition_on_completed_animation = nil
		end
	end

	if self.fade_in_done then
		self.draw_widgets(self, dt, t)
	end

	if not menu_animation_active then
		self.handle_input(self, input_service)
		self.handle_controller_input(self, input_service, dt)
	end

	if not menu_animation_active and (input_service.get(input_service, "toggle_menu") or self.cancel_button_widget.content.button_hotspot.on_release) then
		self.exit(self)
	end

	return 
end
UnlockKeyView.exit = function (self)
	self.on_menu_close(self)
	Managers.transition:fade_in(10)

	self.ui_animations.exit_animation = UIAnimation.init(UIAnimation.wait, 0.2)
	self.transition_on_completed_animation = "exit_menu"

	return 
end
UnlockKeyView.draw_widgets = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("unlock_key_menu")
	local gamepad_active = Managers.input:get_device("gamepad").active()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	for _, widget in ipairs(self.background_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_renderer, self.confirm_gamepad_button_widget)
		UIRenderer.draw_widget(ui_renderer, self.back_gamepad_button_widget)
	end

	local text_input_widget = self.text_input_widget
	text_input_widget.content.text_field = self.key_text
	text_input_widget.content.caret_index = self.key_text_index
	local value = (math.sin((t*3)%math.pi) + 1)/2
	text_input_widget.style.text.caret_color[1] = value*255

	UIRenderer.draw_widget(ui_renderer, text_input_widget)
	UIRenderer.draw_widget(ui_renderer, self.processing_icon_widget)
	UIRenderer.draw_widget(ui_renderer, self.accept_button_widget)
	UIRenderer.draw_widget(ui_renderer, self.cancel_button_widget)
	UIRenderer.draw_widget(ui_renderer, self.title_widget)
	UIRenderer.end_pass(ui_renderer)

	return 
end
UnlockKeyView.handle_input = function (self, input_service)
	local keystrokes = Keyboard.keystrokes()
	self.key_text, self.key_text_index, self.text_mode = KeystrokeHelper.parse_strokes(self.key_text, self.key_text_index, self.text_mode, keystrokes)
	self.key_text = string.upper(self.key_text)

	if self.accept_button_widget.content.button_hotspot.on_release then
		local available_unlock_keys = self.available_unlock_keys
		local num_available_unlock_keys = #available_unlock_keys

		for i = 1, num_available_unlock_keys, 1 do
			local key = available_unlock_keys[i]
			local text = self.key_text

			if text == key then
				print("HAIL TO THE KING BABY")
			else
				print("INVALID KEY YOU INVALID")
			end
		end
	end

	return 
end
UnlockKeyView.handle_controller_input = function (self, input_service, dt)
	if 0 < self.controller_cooldown then
		self.controller_cooldown = self.controller_cooldown - dt
	elseif self.confirm_gamepad_button_widget.content.gamepad_button.is_clicked ~= 0 then
		if self.confirm_gamepad_button_widget.content.button_hotspot.is_clicked == 0 then
		elseif self.back_gamepad_button_widget.content.gamepad_button.is_clicked == 0 or self.back_gamepad_button_widget.content.button_hotspot.is_clicked == 0 then
			self.controller_cooldown = GamepadSettings.menu_cooldown
		end
	end

	return 
end
UnlockKeyView.on_reset = function (self)
	return 
end
UnlockKeyView.on_apply = function (self)
	return 
end
UnlockKeyView.on_menu_close = function (self)
	return 
end

if rawget(_G, "my_global_ass_pointer") then
	my_global_ass_pointer:create_ui_elements()
end

return 
