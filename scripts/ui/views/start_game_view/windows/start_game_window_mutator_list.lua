-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_list_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false

local function get_text_height(ui_renderer, size, ui_style, ui_content, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = ui_content.text_start_index or 1
	local max_texts = ui_content.max_texts or #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale * num_texts

	return full_font_height
end

StartGameWindowMutatorList = class(StartGameWindowMutatorList)
StartGameWindowMutatorList.NAME = "StartGameWindowMutatorList"

StartGameWindowMutatorList.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorList")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)

	self._active_mutator_widgets = {}
end

StartGameWindowMutatorList.create_ui_elements = function (self, params, offset)

	-- Decompilation error in this vicinity:
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.play_button.content.button_hotspot.disable_button = true
	local overlay_button = widgets_by_name.overlay_button
	local anim = self:_animate_pulse(overlay_button.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(overlay_button, anim)

	if self:_has_deed_items() then
		overlay_button.content.button_hotspot.disable_button = false
	else
		overlay_button.content.button_hotspot.disable_button = true
	end
end

StartGameWindowMutatorList._has_deed_items = function (self)
	local item_interface = Managers.backend:get_interface("items")
	local item_filter = "item_type == deed"
	local items = item_interface:get_filtered_items(item_filter)

	return items and #items > 0
end

StartGameWindowMutatorList.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorList")

	self.ui_animator = nil
end

StartGameWindowMutatorList.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_selected_item_backend_id()
	self:draw(dt)
end

StartGameWindowMutatorList.post_update = function (self, dt, t)
	return
end

StartGameWindowMutatorList._update_animations = function (self, dt)
	self:_update_game_options_hover_effect()

	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowMutatorList._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowMutatorList._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowMutatorList._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartGameWindowMutatorList._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowMutatorList._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.parent:window_input_service()

	if self:_is_button_hover_enter(widgets_by_name.overlay_button) or self:_is_button_hover_enter(widgets_by_name.play_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	local play_pressed = gamepad_active and input_service:get("refresh_press")

	if self:_is_button_pressed(widgets_by_name.overlay_button) then
		self.parent:set_layout(7)
	elseif (self:_is_button_pressed(widgets_by_name.play_button) or play_pressed) and self._selected_backend_id then
		self.parent:play(t)
	end
end

StartGameWindowMutatorList._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self:_present_item_by_backend_id(backend_id)
	end

	if self._selected_backend_id then
		self.parent.parent:set_input_description("play_available")
	else
		self.parent.parent:set_input_description(nil)
	end
end

StartGameWindowMutatorList._present_item_by_backend_id = function (self, backend_id)
	if not backend_id then
		return
	end

	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(backend_id)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.item_presentation.content.item = item
	widgets_by_name.play_button.content.button_hotspot.disable_button = false
	widgets_by_name.overlay_button.content.has_item = true
end

StartGameWindowMutatorList._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowMutatorList.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowMutatorList._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowMutatorList._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local overlay_button_widget = widgets_by_name.overlay_button

	if self:_is_button_hover_enter(overlay_button_widget) then
		self:_on_option_button_hover_enter(overlay_button_widget, 2)
	elseif self:_is_button_hover_exit(overlay_button_widget) then
		self:_on_option_button_hover_exit(overlay_button_widget, 2)
	end
end

StartGameWindowMutatorList._on_option_button_hover_enter = function (self, widget, index, instant)
	self:_create_style_animation_enter(widget, 255, "glow", index, instant)
	self:_create_style_animation_exit(widget, 0, "button_hover_rect", index, instant)
end

StartGameWindowMutatorList._on_option_button_hover_exit = function (self, widget, index, instant)
	self:_create_style_animation_exit(widget, 0, "glow", index, instant)
	self:_create_style_animation_enter(widget, 30, "button_hover_rect", index, instant)
end

StartGameWindowMutatorList._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowMutatorList._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = current_color_value / 255 * total_time

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

StartGameWindowMutatorList._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowMutatorList._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowMutatorList._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return
