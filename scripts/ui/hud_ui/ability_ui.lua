local definitions = local_require("scripts/ui/hud_ui/ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
AbilityUI = class(AbilityUI)

AbilityUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player = ingame_ui_context.player
	self.ui_animations = {}
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.wwise_world = ingame_ui_context.wwise_world
	self.is_in_inn = ingame_ui_context.is_in_inn

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "input_changed", "event_input_changed")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
	rawset(_G, "ability_ui", self)
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

	self:event_input_changed()
end

AbilityUI._get_player_unit = function (self)
	if self._is_spectator then
		return self._spectated_player, self._spectated_player_unit
	end

	local player = self.player

	return player, player.player_unit
end

AbilityUI._setup_activated_ability = function (self)
	local player, player_unit = self:_get_player_unit()

	if not player_unit then
		return
	end

	local peer_id = player:network_id()
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_data = career_extension:get_activated_ability_data()
	local career_index = career_extension:career_index()

	if not ability_data or not career_index then
		return
	end

	self._career_index = career_index
	local cooldown_fraction = 0
	local icon = ability_data.icon
	local widget = self._widgets_by_name.ability
	self._initialized = true
end

AbilityUI._sync_ability_cooldown = function (self)
	local player, player_unit = self:_get_player_unit()

	if not player_unit then
		return
	end

	local peer_id = player:network_id()
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown()
	local ability_paused = career_extension:current_ability_paused()
	local ability_duration = 10
	local career_index = career_extension:career_index()

	if self._career_index ~= career_index then
		self._initialized = false

		return
	end

	self._ability_duration = ability_duration

	if ability_cooldown then
		local cooldown_fraction = ability_cooldown / max_cooldown

		if self._is_spectator then
			cooldown_fraction = career_extension:current_ability_cooldown_percentage(1)
		end

		local input_pressed = self:_is_ability_input_pressed()

		if not ability_paused and input_pressed and self._current_cooldown_fraction == 0 then
			self._activation_progress = 0
		end

		local update = cooldown_fraction ~= self._current_cooldown_fraction

		if update then
			self:_set_ability_cooldown_state(cooldown_fraction, not self._current_cooldown_fraction)
		end
	end
end

AbilityUI._set_ability_activated = function (self, activated)
	local widget = self._widgets_by_name.ability
	local content = widget.content
	local style = widget.style
	widget.content.activated = activated
	self._ability_activated = activated
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
		style.input_text_gamepad.text_color[1] = 0
		style.input_text_shadow_gamepad.text_color[1] = 0
		style.input_texture_left_shoulder.color[1] = 0
		style.input_texture_right_shoulder.color[1] = 0
	end

	widget.content.on_cooldown = on_cooldown

	self:_set_widget_dirty(widget)
	self:set_dirty()
end

AbilityUI._is_ability_input_pressed = function (self)
	local input_service = self.input_manager:get_service("Player")

	return input_service:get("action_career_bw_1")
end

AbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	event_manager:unregister("on_spectator_target_changed", self)
	self:set_visible(false)
	rawset(_G, "ability_ui", nil)
	print("[AbilityUI] - Destroy")
end

AbilityUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

AbilityUI._set_elements_visible = function (self, visible)
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._retained_elements_visible = visible

	self:set_dirty()
end

AbilityUI._handle_gamepad = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad") or not IS_WINDOWS

	if (gamepad_active or UISettings.use_gamepad_hud_layout == "always") and UISettings.use_gamepad_hud_layout ~= "never" then
		if self._retained_elements_visible then
			self:_set_elements_visible(false)
		end

		return false
	else
		if not self._retained_elements_visible then
			self:_set_elements_visible(true)
			self:event_input_changed()
		end

		return true
	end
end

local customizer_data = {
	root_scenegraph_id = "ability_root",
	is_child = true,
	registry_key = "player_status"
}

AbilityUI.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local should_render = self:_handle_gamepad()

	if not should_render then
		return
	end

	if not self._initialized then
		self:_setup_activated_ability()
	else
		local dirty = false

		if HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data) then
			UIUtils.mark_dirty(self._widgets)
		end

		if self._current_cooldown_fraction == 0 then
			dirty = self:_update_ability_animations(dt, t)
		end

		if dirty then
			self:set_dirty()
		end

		self:_sync_ability_cooldown()
		self:_handle_resolution_modified()
		self:draw(dt)
	end
end

AbilityUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()
	end
end

AbilityUI._on_resolution_modified = function (self)
	for _, widget in ipairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
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
end

AbilityUI.set_dirty = function (self)
	self._dirty = true
end

AbilityUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

AbilityUI._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self.wwise_world, sound_event)
end

AbilityUI.event_input_changed = function (self)
	local inventory_slots = InventorySettings.slots
	local num_inventory_slots = #inventory_slots
	local input_action = (IS_CONSOLE and "ability") or "action_career"
	local widget = self._widgets_by_name.ability

	self:_set_input(widget, input_action)
	self:_set_widget_dirty(widget)
	self:set_dirty()
end

AbilityUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
	local observed_side = Managers.state.side:get_side_from_player_unique_id(self._spectated_player:unique_id())

	if observed_side:name() == "dark_pact" then
		self:set_visible(false)
	else
		self:set_visible(true)
	end
end

AbilityUI._set_input = function (self, widget, input_action)
	local texture_data, input_text, prefix_text = self:_get_input_texture_data(input_action)
	local text_length = (input_text and UTF8Utils.string_length(input_text)) or 0
	local max_length = 40
	local input_style = widget.style.input_text
	local ui_renderer = self.ui_renderer
	input_text = input_text and UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
	widget.content.input_text = input_text or ""
	widget.content.input_action = input_action
end

AbilityUI._get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if IS_WINDOWS and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)

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

	local is_button_unassigned = key_index == UNASSIGNED_KEY
	local button_name = ""

	if device_type == "keyboard" then
		if is_button_unassigned then
			button_name = ""
		else
			button_name = Keyboard.button_locale_name(key_index)
		end

		return nil, button_name, prefix_text
	elseif device_type == "mouse" then
		if is_button_unassigned then
			button_name = ""
		else
			button_name = Mouse.button_name(key_index)
		end

		return nil, button_name, prefix_text
	elseif device_type == "gamepad" then
		if is_button_unassigned then
			button_name = ""
		else
			button_name = Pad1.button_name(key_index)
		end

		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, ""
end

AbilityUI._update_ability_animations = function (self, dt, t)
	if not self._is_visible then
		return false
	end

	local widget = self._widgets_by_name.ability
	local style = widget.style
	local pulse_progress = 0.5 + math.sin(t * 5) * 0.5
	local effect_alpha = math.min(style.ability_effect_left.color[1] + dt * 200, 255)
	local is_cog = self:_get_player_unit():career_name() == "dr_engineer"

	if is_cog then
		effect_alpha = 0
		pulse_progress = 0.5
	end

	style.ability_effect_left.color[1] = effect_alpha
	style.ability_effect_top_left.color[1] = effect_alpha
	style.ability_effect_right.color[1] = effect_alpha
	style.ability_effect_top_right.color[1] = effect_alpha
	style.input_text_gamepad.text_color[1] = 100 + pulse_progress * 155
	style.input_text_shadow_gamepad.text_color[1] = 100 + pulse_progress * 155
	style.input_texture_left_shoulder.color[1] = 100 + pulse_progress * 155
	style.input_texture_left_shoulder.color[3] = math.lerp(255, 0, pulse_progress)
	style.input_texture_right_shoulder.color[1] = 100 + pulse_progress * 155
	style.input_texture_right_shoulder.color[3] = math.lerp(255, 0, pulse_progress)
	style.input_text_gamepad.text_color[3] = math.lerp(255, 0, pulse_progress)
	style.ability_bar_highlight.color[1] = 100 + pulse_progress * 155

	self:_set_widget_dirty(widget)

	return true
end

AbilityUI.set_alpha = function (self, alpha)
	for widget_index, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self.render_settings.alpha_multiplier = alpha

	self:set_dirty()
end

return
