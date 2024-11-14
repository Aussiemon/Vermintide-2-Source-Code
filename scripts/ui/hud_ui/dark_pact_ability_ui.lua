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

	local world = Managers.world:world("level_world")

	self._world = world
	self._wwise_world = Managers.world:wwise_world(world)
	self._is_in_inn = ingame_ui_context.is_in_inn

	self:_create_ui_elements()

	self._ability_events = {}

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
	self._career_ability_widgets_by_name = {}
	self._ability_hud_widgets_by_name = {}

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
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
	local horde_ability_extension

	horde_ability_extension = self:_get_extension("versus_horde_ability_system")

	local career_name = career_extension and career_extension:career_name()
	local ui_renderer = self._ui_renderer

	if self._career_name ~= career_name then
		table.clear(self._ability_hud_widgets_by_name)

		self._initialized = false

		return
	end

	local player, unit = self:_get_player_unit()
	local ghost_mode_extension = ScriptUnit.has_extension(unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode()

	self:_handle_career_abilities(dt, t, career_name, career_extension, horde_ability_extension, ui_renderer, is_in_ghost_mode)
end

DarkPactAbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	event_manager:unregister("on_spectator_target_changed", self)

	for event_name, _ in pairs(self._ability_events) do
		event_manager:unregister(event_name, self)
	end

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
	return true
end

DarkPactAbilityUI.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	if not self._initialized then
		self:_setup_activated_ability()

		return
	end

	if not self:_handle_gamepad() then
		return
	end

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

	if self._career_ability_widgets_by_name then
		for _, widget in pairs(self._career_ability_widgets_by_name) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
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

DarkPactAbilityUI.event_on_dark_pact_ammo_changed = function (self, unit, current_ammo)
	local ability_widgets = self._ability_hud_widgets_by_name and self._ability_hud_widgets_by_name[2]

	if not ability_widgets then
		return
	end

	local widget = ability_widgets.ammo

	if not widget then
		return
	end

	if not current_ammo then
		local blackboard = BLACKBOARDS[unit]
		local data = blackboard.attack_pattern_data or {}

		if data.current_ammo then
			current_ammo = data.current_ammo
		else
			local breed = Unit.get_data(unit, "breed")

			current_ammo = breed.max_ammo
		end
	end

	local remaining_ammo = 0
	local content = widget.content
	local ammo_empty = current_ammo + remaining_ammo == 0
	local ammo_changed = false

	if self._ammo_count ~= current_ammo then
		self._ammo_count = current_ammo
		content.current_ammo = tostring(current_ammo)
		ammo_changed = true
	end

	if self._remaining_ammo ~= remaining_ammo then
		local breed = Unit.get_data(unit, "breed")

		remaining_ammo = breed.max_ammo
		self._remaining_ammo = remaining_ammo
		content.remaining_ammo = tostring(remaining_ammo)
		ammo_changed = true
	end
end

DarkPactAbilityUI._handle_career_abilities = function (self, dt, t, career_name, career_extension, horde_ability_extension, ui_renderer, is_in_ghost_mode)
	local player, player_unit = self:_get_player_unit()
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local career_info_settings = career_settings.career_info_settings
	local ability_amount = #career_info_settings
	local career_name = career_extension and career_extension:career_name()
	local widgets_by_ability_name = self._widgets_by_ability_name
	local ability_templates = profile_ability_templates[career_name]
	local status_extension = self:_get_extension("status_system")
	local is_dead = true

	if status_extension and not status_extension:is_dead() then
		is_dead = false
	end

	local base_offset = -(80 * ability_amount * 0.5)

	for i = 1, #ability_templates do
		if not self._ability_hud_widgets_by_name[i] then
			local ability_ui_data = ability_templates[i]
			local widget_definitions = ability_ui_data.widget_definitions
			local widgets = {}

			for widget_name, widget_definition in pairs(widget_definitions) do
				local widget = UIWidget.init(widget_definition)

				if widget_name == "ability_icon" then
					widget.content.settings = career_info_settings[i]
					widget.offset[1] = base_offset + 80 * (i - 1)
				end

				widgets[widget_name] = widget
			end

			if ability_ui_data.events then
				local ability_events = ability_ui_data.events

				for event_name, call_back in pairs(ability_events) do
					self._ability_events[#self._ability_events + 1] = {
						event_name,
						call_back,
					}

					Managers.state.event:register(self, event_name, call_back)
				end
			end

			self._ability_hud_widgets_by_name[#self._ability_hud_widgets_by_name + 1] = widgets
		end
	end

	local left_detail = self._widgets_by_name.abilities_detail_left
	local right_detail = self._widgets_by_name.abilities_detail_right

	left_detail.offset[1] = base_offset - 88 + 20
	right_detail.offset[1] = base_offset + 80 * ability_amount - 20
	left_detail.content.visible = not is_in_ghost_mode
	right_detail.content.visible = not is_in_ghost_mode

	for i = 1, #ability_templates do
		local ability_ui_data = ability_templates[i]
		local update_functions = ability_ui_data.update_functions
		local ability_widgets = self._ability_hud_widgets_by_name[i]

		for widget_name, widget in pairs(ability_widgets) do
			local update_function = update_functions and update_functions[widget_name]

			if update_function then
				if ability_ui_data.ability_name then
					local ability, ability_id = career_extension:ability_by_name(ability_ui_data.ability_name)
					local should_draw_in_ghost_mode = is_in_ghost_mode and ability.draw_ui_in_ghost_mode

					if should_draw_in_ghost_mode or not is_in_ghost_mode then
						update_function(dt, t, ui_renderer, career_extension, ability_id, widget, is_dead, player_unit, horde_ability_extension)
					end
				end
			elseif not is_dead and not is_in_ghost_mode then
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end
end
