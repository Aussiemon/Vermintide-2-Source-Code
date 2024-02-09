-- chunkname: @scripts/ui/hud_ui/dark_pact_ability_ui.lua

local definitions = local_require("scripts/ui/hud_ui/dark_pact_ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local create_ability_widget = definitions.create_ability_widget
local profile_ability_templates = definitions.profile_ability_templates

DarkPactAbilityUI = class(DarkPactAbilityUI)

DarkPactAbilityUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._peer_id = ingame_ui_context.peer_id
	self._player_manager = ingame_ui_context.player_manager
	self._ui_animations = {}
	self._render_settings = {
		snap_pixel_positions = true,
	}

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)
	self._is_in_inn = ingame_ui_context.is_in_inn

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "input_changed", "event_input_changed")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

DarkPactAbilityUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._widgets_by_ability_name = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

DarkPactAbilityUI._setup_abilities = function (self)
	if self._ability_widgets then
		for _, widget in ipairs(self._ability_widgets) do
			UIRenderer.set_element_visible(self._ui_renderer, widget.element, false)
		end
	end

	local definition = create_ability_widget()
	local widget_width = 138
	local spacing = 30
	local total_width = 0
	local career_extension = self:_get_extension("career_system")
	local ability_amount = career_extension:ability_amount()
	local default_icon = "dark_pact_ability_suicide"
	local ability_widgets = {}

	for index = 1, ability_amount do
		local ability_data = career_extension:get_activated_ability_data(index)

		if ability_data.show_in_hud then
			local widget = UIWidget.init(definition)
			local content = widget.content
			local style = widget.style

			ability_widgets[#ability_widgets + 1] = widget
			widget.offset[1] = -total_width
			total_width = total_width + widget_width + spacing

			local input_action = ability_data.input_action
			local hud_icon = ability_data.hud_icon or default_icon
			local hud_icon_glow = hud_icon .. "_glow"
			local hud_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(hud_icon)
			local hud_icon_glow_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(hud_icon_glow)
			local hud_icon_size = hud_icon_settings.size
			local hud_icon_glow_size = hud_icon_glow_settings.size

			style.icon.texture_size[1] = hud_icon_glow_size[1]
			style.icon.texture_size[2] = hud_icon_glow_size[2]
			style.icon_disabled.texture_size[1] = hud_icon_glow_size[1]
			style.icon_disabled.texture_size[2] = hud_icon_glow_size[2]
			style.icon_cooldown.texture_size[1] = hud_icon_size[1]
			style.icon_cooldown.texture_size[2] = hud_icon_size[2]
			content.input_action = input_action
			content.icon = hud_icon_glow
			content.icon_cooldown = hud_icon
			content.ability_id = index
		end
	end

	self._ability_widgets = ability_widgets

	self:event_input_changed()
end

DarkPactAbilityUI._setup_activated_ability = function (self)
	local player, player_unit = self:_get_player_unit()

	if not player_unit then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_data = career_extension:get_activated_ability_data()
	local career_name = career_extension:career_name()

	if not ability_data or not career_name then
		return
	end

	self._career_name = career_name

	self:_setup_abilities()

	self._initialized = true
end

DarkPactAbilityUI._get_extension = function (self, name)
	local player, player_unit = self:_get_player_unit()

	if player_unit and Unit.alive(player_unit) then
		return ScriptUnit.extension(player_unit, name)
	end
end

DarkPactAbilityUI._update_abilities = function (self, dt, t)
	local career_extension = self:_get_extension("career_system")
	local career_name = career_extension and career_extension:career_name()
	local ui_renderer = self._ui_renderer

	if self._career_name ~= career_name then
		self._initialized = false

		return
	end

	local widgets_by_ability_name = self._widgets_by_ability_name
	local ability_amount = career_extension:ability_amount()
	local ability_templates = profile_ability_templates[career_name]

	if not ability_templates then
		return
	end

	local status_extension = self:_get_extension("status_system")
	local is_dead = true

	if status_extension and not status_extension:is_dead() then
		is_dead = false
	end

	for ability_id = 1, ability_amount do
		local ability_name = career_extension:ability_name_by_id(ability_id)
		local ability_template = ability_templates[ability_name]

		if ability_template then
			local widgets = widgets_by_ability_name[ability_name]

			if not widgets then
				widgets = {}
				widgets_by_ability_name[ability_name] = widgets

				local widget_definitions = ability_template.widget_definitions

				for widget_name, definition in pairs(widget_definitions) do
					local widget = UIWidget.init(definition)

					widgets[widget_name] = widget
				end
			end

			local update_functions = ability_template.update_functions

			for widget_name, widget in pairs(widgets) do
				local update_function = update_functions[widget_name]

				if update_function then
					update_function(dt, t, ui_renderer, career_extension, ability_id, widget, is_dead)
				end
			end
		end
	end
end

DarkPactAbilityUI._sync_ability_cooldowns = function (self)
	local career_extension = self:_get_extension("career_system")
	local career_name = career_extension and career_extension:career_name()

	if self._career_name ~= career_name then
		self._initialized = false

		return
	end

	local ability_widgets = self._ability_widgets

	for _, widget in ipairs(ability_widgets) do
		local content = widget.content
		local ability_id = content.ability_id
		local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown(ability_id)
		local ability_available = career_extension:can_use_activated_ability(ability_id)
		local uses_cooldown = career_extension:uses_cooldown(ability_id)

		if ability_cooldown then
			local cooldown_fraction

			if uses_cooldown then
				cooldown_fraction = ability_cooldown / max_cooldown
			else
				cooldown_fraction = ability_available and 0 or 1
			end

			local update = cooldown_fraction ~= content.current_cooldown_fraction

			if update then
				self:_set_ability_cooldown_state(widget, cooldown_fraction, not content.current_cooldown_fraction)
			end
		end
	end
end

DarkPactAbilityUI._set_ability_cooldown_state = function (self, widget, cooldown_fraction, initialize)
	local content = widget.content
	local style = widget.style

	content.current_cooldown_fraction = cooldown_fraction

	local on_cooldown = cooldown_fraction ~= 0

	if widget.content.on_cooldown and not on_cooldown then
		style.icon.color[1] = 0
		style.icon_cooldown.color[2] = 255
	elseif on_cooldown and not widget.content.on_cooldown then
		style.icon_cooldown.color[1] = 255
		style.icon_cooldown.color[2] = 0
	end

	style.cooldown_mask.color[1] = 255 * cooldown_fraction
	widget.content.on_cooldown = on_cooldown

	self:_set_widget_dirty(widget)
	self:set_dirty()
end

DarkPactAbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	event_manager:unregister("on_spectator_target_changed", self)
	self:set_visible(false)
	print("[DarkPactAbilityUI] - Destroy")
end

DarkPactAbilityUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

DarkPactAbilityUI._set_elements_visible = function (self, visible)
	local ui_renderer = self._ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	local ability_widgets = self._ability_widgets

	if ability_widgets then
		for _, widget in ipairs(ability_widgets) do
			UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
		end
	end

	self._retained_elements_visible = visible

	self:set_dirty()
end

DarkPactAbilityUI._handle_gamepad = function (self)
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

DarkPactAbilityUI.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local player, player_unit = self:_get_player_unit()
	local ghost_mode_extension = ScriptUnit.has_extension(player_unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode()

	if not self._initialized then
		self:_setup_activated_ability()

		return
	end

	if not self:_handle_gamepad() then
		return
	end

	local dirty = false
	local ability_widgets = self._ability_widgets

	for _, widget in ipairs(ability_widgets) do
		local content = widget.content
		local current_cooldown_fraction = content.current_cooldown_fraction

		if current_cooldown_fraction == 0 and self:_update_ability_animations(widget, dt) then
			dirty = true
		end
	end

	if dirty then
		self:set_dirty()
	end

	self:_sync_ability_cooldowns()
	self:_handle_resolution_modified()
	self:draw(dt, t)
end

DarkPactAbilityUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()
	end
end

DarkPactAbilityUI._on_resolution_modified = function (self)
	for _, widget in ipairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

DarkPactAbilityUI.draw = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
	self:_update_abilities(dt, t)

	local ability_widgets = self._ability_widgets

	if ability_widgets then
		for _, widget in ipairs(ability_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

DarkPactAbilityUI.set_dirty = function (self)
	self._dirty = true
end

DarkPactAbilityUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

DarkPactAbilityUI._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self._wwise_world, sound_event)
end

DarkPactAbilityUI.event_input_changed = function (self)
	local default_input_action = "action_career"
	local ability_widgets = self._ability_widgets

	if ability_widgets then
		for _, widget in ipairs(ability_widgets) do
			local content = widget.content
			local input_action = content.input_action or default_input_action

			self:_set_input(widget, input_action)
			self:_set_widget_dirty(widget)
		end
	end

	self:set_dirty()
end

DarkPactAbilityUI._set_input = function (self, widget, input_action)
	local _, input_text, _ = self:_get_input_texture_data(input_action)
	local max_length = 100
	local input_style = widget.style.input_text
	local ui_renderer = self._ui_renderer

	input_text = input_text and UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
	widget.content.input_text = input_text or ""
	widget.content.input_action = input_action
end

DarkPactAbilityUI._get_input_texture_data = function (self, input_action)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if IS_WINDOWS and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)

	if not keymap_binding then
		Application.warning(string.format("[DarkPactAbilityUI] There is no keymap for %q on %q", input_action, platform))

		return nil, ""
	end

	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	local is_button_unassigned = key_index == UNASSIGNED_KEY
	local button_name = ""

	if device_type == "keyboard" then
		button_name = is_button_unassigned and "" or Keyboard.button_locale_name(key_index)

		return nil, button_name, prefix_text
	elseif device_type == "mouse" then
		button_name = is_button_unassigned and "" or Mouse.button_name(key_index)

		return nil, button_name, prefix_text
	elseif device_type == "gamepad" then
		button_name = is_button_unassigned and "" or Pad1.button_name(key_index)

		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, button_name
end

DarkPactAbilityUI._update_ability_animations = function (self, widget, dt)
	if not self._is_visible then
		return false
	end

	local style = widget.style
	local pulse_progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

	style.icon_cooldown.color[1] = math.max(style.icon_cooldown.color[1] - dt * 400, 0)
	style.icon.color[1] = 155 + pulse_progress * 100

	self:_set_widget_dirty(widget)

	return true
end

DarkPactAbilityUI.set_alpha = function (self, alpha)
	for widget_index, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self._render_settings.alpha_multiplier = alpha

	self:set_dirty()
end

DarkPactAbilityUI._get_player_unit = function (self)
	if self._is_spectator then
		return self._spectated_player, self._spectated_player_unit
	end

	if self._player then
		return self._player, self._player.player_unit
	end

	self._player = self._player_manager:local_player(1)

	return self._player, self._player.player_unit
end

DarkPactAbilityUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true

	local observed_side = Managers.state.side:get_side_from_player_unique_id(self._spectated_player:unique_id())

	if observed_side:name() == "dark_pact" then
		self:set_visible(true)
	else
		self:set_visible(false)
	end
end
