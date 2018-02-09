local definitions = local_require("scripts/ui/hud_ui/ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
AbilityUI = class(AbilityUI)
AbilityUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	self.render_settings = {
		snap_pixel_positions = true
	}
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.is_in_inn = ingame_ui_context.is_in_inn

	self._create_ui_elements(self)

	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "input_changed", "event_input_changed")
	rawset(_G, "ability_ui", self)

	return 
end
AbilityUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(definition)
		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	local gui = self.ui_renderer.gui_retained
	local ability_widget = self._widgets_by_name.ability

	self.event_input_changed(self)

	return 
end
AbilityUI._setup_activated_ability = function (self)
	local player_manager = self.player_manager
	local player = player_manager.local_player(player_manager, 1)
	local player_unit = player.player_unit

	if not player_unit then
		return 
	end

	local peer_id = player.network_id(player)
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_data = career_extension.get_activated_ability_data(career_extension)
	local career_index = career_extension.career_index(career_extension)

	if not ability_data or not career_index then
		return 
	end

	self._career_index = career_index
	local cooldown_fraction = 0
	local icon = ability_data.icon
	local widget = self._widgets_by_name.ability
	self._initialized = true

	return 
end
AbilityUI._sync_ability_cooldown = function (self)
	local player_manager = self.player_manager
	local player = player_manager.local_player(player_manager, 1)
	local player_unit = player.player_unit

	if not player_unit then
		return 
	end

	local peer_id = player.network_id(player)
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_cooldown, max_cooldown = career_extension.current_ability_cooldown(career_extension)
	local ability_paused = career_extension.current_ability_paused(career_extension)
	local ability_duration = 10
	local career_index = career_extension.career_index(career_extension)

	if self._career_index ~= career_index then
		self._initialized = false

		return 
	end

	self._ability_duration = ability_duration

	if ability_cooldown then
		local cooldown_fraction = ability_cooldown/max_cooldown
		local input_pressed = self._is_ability_input_pressed(self)

		if not ability_paused and input_pressed and self._current_cooldown_fraction == 0 then
			self._activation_progress = 0
		end

		local update = cooldown_fraction ~= self._current_cooldown_fraction

		if update then
			self._set_ability_cooldown_state(self, cooldown_fraction, not self._current_cooldown_fraction)
		end
	end

	return 
end
AbilityUI._set_ability_activated = function (self, activated)
	local widget = self._widgets_by_name.ability
	local content = widget.content
	local style = widget.style
	widget.content.activated = activated
	self._ability_activated = activated

	return 
end
AbilityUI._set_ability_cooldown_state = function (self, cooldown_fraction, initialize)
	self._current_cooldown_fraction = cooldown_fraction
	local on_cooldown = cooldown_fraction ~= 0
	local widget = self._widgets_by_name.ability

	if widget.content.on_cooldown and not on_cooldown then
		local style = widget.style
		style.ability_effect_left.color[1] = 0
		style.ability_effect_top_left.color[1] = 0
		style.ability_effect_right.color[1] = 0
		style.ability_effect_top_right.color[1] = 0
		style.ability_bar_highlight.color[1] = 0
	end

	widget.content.on_cooldown = on_cooldown

	self._set_widget_dirty(self, widget)
	self.set_dirty(self)

	return 
end
AbilityUI._is_ability_input_pressed = function (self)
	local input_service = self.input_manager:get_service("Player")

	return input_service.get(input_service, "action_career_bw_1")
end
AbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager.unregister(event_manager, "input_changed", self)
	self.set_visible(self, false)
	rawset(_G, "ability_ui", nil)
	print("[AbilityUI] - Destroy")

	return 
end
AbilityUI.set_visible = function (self, visible)
	self._is_visible = visible
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self.set_dirty(self)

	return 
end
AbilityUI.update = function (self, dt, t)
	if not self._initialized then
		self._setup_activated_ability(self)
	else
		local dirty = false

		if self._current_cooldown_fraction == 0 then
			dirty = self._update_ability_animations(self, dt, t)
		end

		if dirty then
			self.set_dirty(self)
		end

		self._sync_ability_cooldown(self)
		self._handle_resolution_modified(self)
		self.draw(self, dt)
	end

	return 
end
AbilityUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self._on_resolution_modified(self)
	end

	return 
end
AbilityUI._on_resolution_modified = function (self)
	for _, widget in ipairs(self._widgets) do
		self._set_widget_dirty(self, widget)
	end

	self.set_dirty(self)

	return 
end
AbilityUI.draw = function (self, dt)
	if not self._is_visible then
		return 
	end

	if not self._dirty then
		return 
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false

	return 
end
AbilityUI.set_dirty = function (self)
	self._dirty = true

	return 
end
AbilityUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true

	return 
end
AbilityUI._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self.wwise_world, sound_event)

	return 
end
AbilityUI.event_input_changed = function (self)
	local inventory_slots = InventorySettings.slots
	local num_inventory_slots = #inventory_slots
	local input_action = "action_career_bw_1"
	local widget = self._widgets_by_name.ability

	self._set_input(self, widget, input_action)
	self._set_widget_dirty(self, widget)
	self.set_dirty(self)

	return 
end
AbilityUI._set_input = function (self, widget, input_action)
	local texture_data, input_text, prefix_text = self._get_input_texture_data(self, input_action)
	local text_length = (input_text and UTF8Utils.string_length(input_text)) or 0
	local max_length = 40
	local input_style = widget.style.input_text
	local ui_renderer = self.ui_renderer
	input_text = input_text and UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
	widget.content.input_text = input_text or ""
	widget.content.input_action = input_action

	return 
end
AbilityUI._get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "Player")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local platform = PLATFORM

	if platform == "win32" and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service.get_keymapping(input_service, input_action, platform)

	if not keymap_binding then
		Application.warning(string.format("[AbilityUI] There is no keymap for %q on %q", input_action, platform))

		return nil, ""
	end

	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text = nil

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	if device_type == "keyboard" then
		return nil, Keyboard.button_locale_name(key_index), prefix_text
	elseif device_type == "mouse" then
		return nil, Mouse.button_name(key_index), prefix_text
	elseif device_type == "gamepad" then
		local button_name = Pad1.button_name(key_index)
		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, ""
end
AbilityUI._update_ability_animations = function (self, dt)
	if not self._is_visible then
		return false
	end

	local widget = self._widgets_by_name.ability
	local style = widget.style
	local speed_multiplier = 5
	local time_since_launch = Application.time_since_launch()
	local pulse_progress = math.sin(time_since_launch*speed_multiplier)*0.5 + 0.5
	local effect_alpha = math.min(style.ability_effect_left.color[1] + dt*200, 255)
	style.ability_effect_left.color[1] = effect_alpha
	style.ability_effect_top_left.color[1] = effect_alpha
	style.ability_effect_right.color[1] = effect_alpha
	style.ability_effect_top_right.color[1] = effect_alpha
	style.ability_bar_highlight.color[1] = pulse_progress*155 + 100

	self._set_widget_dirty(self, widget)

	return true
end
AbilityUI.set_alpha = function (self, alpha)
	for widget_index, widget in pairs(self._widgets) do
		self._set_widget_dirty(self, widget)
	end

	self.render_settings.alpha_multiplier = alpha

	self.set_dirty(self)

	return 
end

return 
