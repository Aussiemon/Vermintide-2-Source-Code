require("scripts/utils/keystroke_helper")

local definitions = local_require("scripts/ui/views/rcon_ui_definitions")
RconUI = class(RconUI)
RconUI.ECHO_MSG = 0
RconUI.META_MSG = 1
RconUI.OUTPUT_MSG = 1
local RELOAD_UI = true
local MAX_CHARS = 512

RconUI.init = function (self, ui_context, callback_object)
	self._input_manager = ui_context.input_manager
	self._ui_renderer = ui_context.ui_top_renderer
	self._visible = false
	self._callback_object = callback_object
	self._input_message = ""
	self._input_index = 1
	self._input_mode = "insert"
	self._header = ""
	self._ui_animations = {}

	self:_create_ui_elements()
end

RconUI.update = function (self, dt, menu_active, menu_input_service, no_unblock)
	if RELOAD_UI then
		self:_create_ui_elements()
	end

	if self._input_manager ~= nil then
		local input_service = self._input_manager:get_service("rcon_input")

		self:_update_input(dt, input_service, menu_active, menu_input_service, no_unblock)
		self:_draw_widgets(dt, input_service)
	end
end

RconUI.set_header = function (self, text)
	self._header = text
end

RconUI.set_input_manager = function (self, input_manager)
	if input_manager then
		local block_reasons = {
			twitch = true,
			debug_screen = true,
			free_flight = true
		}

		input_manager:create_input_service("rcon_input", "RconControllerSettings", "RconControllerFilters", block_reasons)
		input_manager:map_device_to_service("rcon_input", "keyboard")
		input_manager:map_device_to_service("rcon_input", "mouse")
	end

	self._input_manager = input_manager
end

RconUI.add_output = function (self, text, text_type)
	local history_max_size = 500
	local message_tables = self._output_widget.content.message_tables

	while history_max_size <= #message_tables do
		table.remove(message_tables, 1)
	end

	local font_material, font_size, font_name = unpack(Fonts.arial)
	local irc_type, sender = nil

	if text_type == RconUI.ECHO_MSG then
		irc_type = Irc.SYSTEM_MSG
		sender = "> "
	elseif text_type == RconUI.META_MSG then
		irc_type = Irc.META_MSG
		sender = ""
	else
		irc_type = Irc.PARTY_MSG
		sender = "# "
	end

	local new_message_table = {
		is_dev = false,
		is_system = false,
		sender = sender,
		message = tostring(text),
		type = irc_type
	}
	message_tables[#message_tables + 1] = new_message_table
end

RconUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._window_widget = UIWidget.init(definitions.window_widget)
	self._output_widget = UIWidget.init(definitions.output_widget)
	self._input_widget = UIWidget.init(definitions.input_widget)
	self._scrollbar_widget = UIWidget.init(definitions.scrollbar_widget)
	self._ui_animations.caret_pulse = self:_animate_element_pulse(self._input_widget.style.text.caret_color, 1, 60, 255, 2)
	RELOAD_UI = false
end

RconUI._animate_element_pulse = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, time)

	return new_animation
end

RconUI._update_input = function (self, dt, input_service, menu_active, menu_input_service, no_unblock)
	local activate_menu_was_pressed = input_service:get("activate_menu")

	if activate_menu_was_pressed then
		if self._visible then
			self:_unblock_input()

			self._visible = false
		else
			self:_block_input()

			self._visible = true
		end
	end

	if self._visible then
		local steal_input = true
		local send_pressed = input_service:get("send_input", steal_input)
		local exit_pressed = input_service:get("deactivate_menu")

		if exit_pressed then
			self:_unblock_input()

			self._visible = false
		elseif send_pressed then
			self._callback_object:send_command(self._input_message)

			self._input_message = ""
			self._input_index = 1
			self._input_mode = "insert"
		elseif self._input_index <= MAX_CHARS then
			local keystrokes = Keyboard.keystrokes()
			local ctrl_button_index = Keyboard.button_index("left ctrl")
			local ctrl_held = Keyboard.pressed(ctrl_button_index) or Keyboard.button(ctrl_button_index) > 0
			self._input_message, self._input_index, self._input_mode = KeystrokeHelper.parse_strokes(self._input_message, self._input_index, self._input_mode, keystrokes, ctrl_held)
		end
	end
end

RconUI._draw_widgets = function (self, dt, input_service)
	if not self._visible then
		return
	end

	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self._ui_renderer
	local ui_animations = self._ui_animations
	local window_widget = self._window_widget
	local input_widget = self._input_widget
	local output_widget = self._output_widget
	local scrollbar_widget = self._scrollbar_widget
	input_widget.content.text_field = self._input_message
	input_widget.content.header_field = self._header
	input_widget.content.caret_index = self._input_index
	output_widget.content.text_start_offset = 1 - scrollbar_widget.content.scroll_value

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIAnimation.update(ui_animations.caret_pulse, dt)
	UIRenderer.draw_widget(ui_renderer, window_widget)
	UIRenderer.draw_widget(ui_renderer, input_widget)
	UIRenderer.draw_widget(ui_renderer, output_widget)
	UIRenderer.draw_widget(ui_renderer, scrollbar_widget)
	UIRenderer.end_pass(ui_renderer)
end

RconUI._block_input = function (self)
	self._input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "rcon_input", "RconUI")
	Window.set_show_cursor(true)
end

RconUI._unblock_input = function (self)
	self._input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "rcon_input", "RconUI")
	Window.set_show_cursor(false)
end

return
