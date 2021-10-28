local definitions = local_require("scripts/ui/hud_ui/ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
AbilityUI = class(AbilityUI)

AbilityUI.init = function (self, parent, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._player = ingame_ui_context.player
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements()

	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self._hide_effects = false
	local event_manager = Managers.state.event

	event_manager:register(self, "input_changed", "event_input_changed")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

AbilityUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	self:event_input_changed()
end

AbilityUI._get_player_unit = function (self)
	if self._is_spectator then
		return self._spectated_player, self._spectated_player_unit
	end

	local player = self._player

	return player, player.player_unit
end

AbilityUI._update_ability_widget = function (self, dt, t)
	local player, player_unit = self:_get_player_unit()

	if not player_unit then
		return false
	end

	local hide_effects = self._hide_effects
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local career_name = career_extension:career_name()

	if self._career_name ~= career_name then
		local career_settings = CareerSettings[career_name]
		local ability_1 = career_settings.activated_ability[1]
		hide_effects = ability_1.hide_ability_ui_effects
		self._hide_effects = hide_effects
		self._career_name = career_name
	end

	local ability_widget = self._widgets_by_name.ability
	local content = ability_widget.content
	local style = ability_widget.style
	local can_use_ability = career_extension:can_use_activated_ability()
	local thornsister_widget = self._widgets_by_name.thornsister_passive
	local thornsister_content = thornsister_widget.content
	local thornsister_style = thornsister_widget.style
	local current_extra_uses, max_extra_uses = career_extension:get_extra_ability_uses()
	local has_thornsister_passive = current_extra_uses > 0

	if thornsister_content.is_active ~= has_thornsister_passive then
		thornsister_content.is_active = has_thornsister_passive

		return true
	end

	if has_thornsister_passive then
		local pulse_progress = 0.5 + 0.5 * math.sin(t * 5)
		local effect_alpha = 220 + 35 * pulse_progress
		thornsister_style.ability_effect_right.color[1] = effect_alpha
		thornsister_style.ability_effect_top_right.color[1] = effect_alpha
		thornsister_style.ability_effect_left.color[1] = effect_alpha
		thornsister_style.ability_effect_top_left.color[1] = effect_alpha
		hide_effects = true
	end

	if can_use_ability then
		content.can_use = true
		content.on_cooldown = career_extension:current_ability_cooldown() > 0
		local pulse_progress = 0.5 + 0.5 * math.sin(t * 5)
		local effect_alpha = math.min(style.ability_effect_left.color[1] + dt * 200, 255)

		if hide_effects then
			effect_alpha = 0
			pulse_progress = 0.5
		end

		local input_alpha = 100 + pulse_progress * 155
		local input_green = 255 * pulse_progress

		if has_thornsister_passive then
			input_green = 255
		end

		style.ability_effect_right.color[1] = effect_alpha
		style.ability_effect_top_right.color[1] = effect_alpha
		style.ability_effect_left.color[1] = effect_alpha
		style.ability_effect_top_left.color[1] = effect_alpha
		style.ability_bar_highlight.color[1] = input_alpha

		return true
	elseif content.can_use then
		content.can_use = false
		content.on_cooldown = true
		style.ability_effect_right.color[1] = 0
		style.ability_effect_top_right.color[1] = 0
		style.ability_effect_left.color[1] = 0
		style.ability_effect_top_left.color[1] = 0
		style.ability_bar_highlight.color[1] = 0

		return true
	end
end

AbilityUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	event_manager:unregister("on_spectator_target_changed", self)
	UIUtils.destroy_widgets(self._ui_renderer, self._widgets)
	print("[AbilityUI] - Destroy")
end

AbilityUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

AbilityUI._set_elements_visible = function (self, visible)
	local ui_renderer = self._ui_renderer

	for _, widget in pairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._are_elements_visible = visible
	self._dirty = true
end

AbilityUI._smudge = function (self)
	UIUtils.mark_dirty(self._widgets)

	self._dirty = true
end

AbilityUI._handle_gamepad = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local should_render = (UISettings.use_gamepad_hud_layout ~= "auto" or not gamepad_active) and UISettings.use_gamepad_hud_layout ~= "always" and not IS_CONSOLE

	if should_render ~= self._are_elements_visible then
		self:_set_elements_visible(should_render)

		return should_render
	end

	return should_render
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

	local do_smudge = false

	if HudCustomizer.run(self._ui_renderer, self._ui_scenegraph, customizer_data) then
		do_smudge = true
	end

	if RESOLUTION_LOOKUP.modified then
		do_smudge = true
	end

	if self:_update_ability_widget(dt, t) then
		do_smudge = true
	end

	if do_smudge then
		self:_smudge()
	end

	self:draw(dt, t)
end

AbilityUI.draw = function (self, dt, t)
	if not self._is_visible or not self._dirty then
		return
	end

	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

AbilityUI.set_alpha = function (self, alpha)
	self._render_settings.alpha_multiplier = alpha

	self:_smudge()
end

AbilityUI._get_input_texture_data = function (self, input_action)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")

	return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
end

AbilityUI.event_input_changed = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local inventory_slots = InventorySettings.slots
	local num_inventory_slots = #inventory_slots
	local input_action = (gamepad_active and "ability") or "action_career"
	local widget = self._widgets_by_name.ability
	local _, input_text = self:_get_input_texture_data(input_action)
	local text_length = (input_text and UTF8Utils.string_length(input_text)) or 0

	if input_text then
		local ui_renderer = self._ui_renderer
		local max_length = 40
		local input_style = widget.style.input_text
		input_text = UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
	end

	widget.content.input_text = input_text or ""
	widget.content.input_action = input_action

	self:_smudge()
end

AbilityUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
	local observed_side = Managers.state.side:get_side_from_player_unique_id(self._spectated_player:unique_id())
	local is_hero = observed_side:name() == "heroes"

	self:set_visible(is_hero)
end

return
