local definitions = local_require("scripts/ui/hud_ui/gamepad_ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
GamePadAbilityUI = class(GamePadAbilityUI)

GamePadAbilityUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._player = ingame_ui_context.player
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "input_changed", "event_input_changed")
end

GamePadAbilityUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	self:event_input_changed()
end

GamePadAbilityUI._setup_activated_ability = function (self)
	local player = self._player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_data = career_extension:get_activated_ability_data()
	local career_index = career_extension:career_index()

	if not ability_data or not career_index then
		return
	end

	self._career_index = career_index
	self._initialized = true
end

GamePadAbilityUI._sync_ability_cooldown = function (self)
	local player = self._player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown()
	local ability_paused = career_extension:current_ability_paused()
	local career_index = career_extension:career_index()

	if self._career_index ~= career_index then
		self._initialized = false

		return
	end

	self._ability_usable = career_extension:can_use_activated_ability()

	if ability_cooldown then
		local cooldown_fraction = ability_cooldown / max_cooldown
		local update = cooldown_fraction ~= self._current_cooldown_fraction

		if update then
			self:_set_ability_cooldown_state(cooldown_fraction, not self._current_cooldown_fraction)
		end
	end
end

GamePadAbilityUI._update_thornsister_passive = function (self)
	local player = self._player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local widgets_by_name = self._widgets_by_name
	local thornsister_widget = widgets_by_name.thornsister_passive
	local thornsister_content = thornsister_widget.content
	local current_extra_uses, max_extra_uses = career_extension:get_extra_ability_uses()
	local has_thornsister_passive = current_extra_uses > 0

	if thornsister_content.is_active ~= has_thornsister_passive then
		thornsister_content.is_active = has_thornsister_passive

		self:_set_widget_dirty(thornsister_widget)

		local ability_widget = widgets_by_name.ability
		local ability_content = ability_widget.content
		ability_content.hide_effect = has_thornsister_passive

		self:_set_widget_dirty(ability_widget)

		return true
	end
end

GamePadAbilityUI._set_ability_activated = function (self, activated)
	local widget = self._widgets_by_name.ability
	local content = widget.content
	local style = widget.style
	widget.content.activated = activated
	self._ability_activated = activated
end

GamePadAbilityUI._set_ability_cooldown_state = function (self, cooldown_fraction, initialize)
	self._current_cooldown_fraction = cooldown_fraction
	local on_cooldown = cooldown_fraction ~= 0
	local usable = self._ability_usable
	local widget = self._widgets_by_name.ability

	if widget.content.on_cooldown and not on_cooldown and not usable then
		local style = widget.style
		style.input_text.text_color[1] = 0
		style.input_text_shadow.text_color[1] = 0
	end

	widget.content.on_cooldown = on_cooldown
	widget.content.usable = usable

	self:_set_widget_dirty(widget)
	self:set_dirty()
end

GamePadAbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	self:set_visible(false)
	print("[GamePadAbilityUI] - Destroy")
end

GamePadAbilityUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

GamePadAbilityUI._set_elements_visible = function (self, visible)
	local ui_renderer = self._ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._retained_elements_visible = visible

	self:set_dirty()
end

GamePadAbilityUI._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local most_recent_device = Managers.input:get_most_recent_device()
	local force_update = self.gamepad_active_last_frame == nil or gamepad_active and most_recent_device ~= self._most_recent_device

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			self:event_input_changed()
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		self:event_input_changed()
	end

	self._most_recent_device = most_recent_device
end

GamePadAbilityUI._handle_gamepad = function (self)
	local active_career_skill = self:_handle_active_ability()
	local gamepad_active = Managers.input:is_device_active("gamepad") or IS_XB1

	if (not gamepad_active or UISettings.use_gamepad_hud_layout == "never") and UISettings.use_gamepad_hud_layout ~= "always" or active_career_skill then
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

GamePadAbilityUI.update = function (self, dt, t)
	local should_render = self:_handle_gamepad()

	if not should_render then
		return
	end

	self:_handle_gamepad_activity()

	if not self._initialized then
		self:_setup_activated_ability()
	else
		local dirty = false

		if self:_update_thornsister_passive() then
			dirty = true
		end

		if self._current_cooldown_fraction == 0 or self._ability_usable then
			dirty = self:_update_ability_animations(dt, t)
		end

		if dirty then
			self:set_dirty()
		end

		self:_sync_ability_cooldown()
		self:_handle_resolution_modified()
		self:_update_muneric_ui_ability_cooldown()
		self:draw(dt)
	end
end

GamePadAbilityUI._handle_active_ability = function (self)
	local player = Managers.player:local_player()

	if not player then
		return false
	end

	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return false
	end

	local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")

	return inventory_ext and inventory_ext:get_wielded_slot_name() == "slot_career_skill_weapon"
end

GamePadAbilityUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		UIUtils.mark_dirty(self._widgets)
		self:set_dirty()
	end
end

GamePadAbilityUI.draw = function (self, dt)
	if not self._is_visible then
		return
	end

	if not self._dirty then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

GamePadAbilityUI.set_dirty = function (self)
	self._dirty = true
end

GamePadAbilityUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

GamePadAbilityUI.event_input_changed = function (self)
	local inventory_slots = InventorySettings.slots
	local num_inventory_slots = #inventory_slots
	local input_manager = self._input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")
	local input_action = gamepad_active and "ability" or "action_career"
	local widget = self._widgets_by_name.ability

	self:_set_input(widget, input_action)
	self:_set_widget_dirty(widget)
	self:set_dirty()
end

GamePadAbilityUI._set_input = function (self, widget, input_action)
	local texture_data, input_text, prefix_text = self:_get_input_texture_data(input_action)
	local text_length = input_text and UTF8Utils.string_length(input_text) or 0
	local max_length = 40
	local style = widget.style
	local content = widget.content
	local input_style = style.input_text
	local ui_renderer = self._ui_renderer
	content.input_action = input_action
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if texture_data and gamepad_active then
		local texture = texture_data.texture
		content.activate_ability_id = texture
		content.input_text = ""
		local activate_ability_style = style.activate_ability
		local texture_size = activate_ability_style.texture_size
		local size = texture_data.size
		texture_size[1] = size[1]
		texture_size[2] = size[2]
	elseif input_text then
		content.input_text = UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
		content.activate_ability_id = nil
	end
end

GamePadAbilityUI._get_input_texture_data = function (self, input_action)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not gamepad_active then
		platform = "win32"
	elseif IS_WINDOWS and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)
	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text = nil

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	if key_index ~= UNASSIGNED_KEY then
		if device_type == "keyboard" then
			if type(key_index) == "number" then
				return nil, Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index), prefix_text
			else
				return nil, Localize(key_index), prefix_text
			end
		elseif device_type == "mouse" then
			local button_texture_data = ButtonTextureByName(device_type .. "_" .. key_index, platform)

			return button_texture_data, Mouse.button_name(key_index), prefix_text
		elseif device_type == "gamepad" then
			local button_name = Pad1.button_name(key_index)
			local button_texture_data = ButtonTextureByName(button_name, platform)

			return button_texture_data, button_name, prefix_text
		end
	end

	return nil, ""
end

GamePadAbilityUI._update_ability_animations = function (self, dt, t)
	if not self._is_visible then
		return false
	end

	local widget = self._widgets_by_name.ability
	local style = widget.style
	local pulse_progress = 0.5 + 0.5 * math.sin(t * 5)
	style.input_text.text_color[1] = 100 + pulse_progress * 155
	style.input_text_shadow.text_color[1] = 100 + pulse_progress * 155

	self:_set_widget_dirty(widget)

	return true
end

GamePadAbilityUI.set_alpha = function (self, alpha)
	for widget_index, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self._render_settings.alpha_multiplier = alpha

	self:set_dirty()
end

GamePadAbilityUI._update_muneric_ui_ability_cooldown = function (self)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local player_unit = player.player_unit

	if not ALIVE[player_unit] then
		return
	end

	local widget = self._widgets_by_name.ability

	if not widget then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local can_use_ability = career_extension:can_use_activated_ability(1)
	widget.content.can_use_ability = can_use_ability

	if can_use_ability then
		return
	end

	local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown()
	widget.content.ability_cooldown = UIUtils.format_time(ability_cooldown)

	self:_set_widget_dirty(widget)
end
