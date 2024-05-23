-- chunkname: @scripts/ui/hud_ui/ability_ui.lua

local definitions = local_require("scripts/ui/hud_ui/ability_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition

AbilityUI = class(AbilityUI)

AbilityUI.init = function (self, parent, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._player = ingame_ui_context.player
	self._render_settings = {
		snap_pixel_positions = true,
	}

	self:_create_ui_elements()

	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self._hide_effects = false
	self._ability_charge_widgets = {}

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
		local profile_index = career_extension:profile_index()
		local career_index = career_extension:career_index()
		local ability_1 = CareerUtils.get_ability_data(profile_index, career_index, 1)

		hide_effects = ability_1.hide_ability_ui_effects
		self._hide_effects = hide_effects
		self._career_name = career_name
		self._ability_cooldowns = nil

		table.clear(self._ability_charge_widgets)
	end

	local career_data = UISettings.ability_ui_data[career_name] or UISettings.ability_ui_data.default
	local ability_widget = self._widgets_by_name.ability
	local content = ability_widget.content
	local style = ability_widget.style

	content.ability_effect.texture_id = career_data.ability_effect
	content.ability_effect_top.texture_id = career_data.ability_effect_top
	content.ability_bar_highlight = career_data.ability_bar_highlight

	local can_use_ability = career_extension:can_use_activated_ability()
	local current_extra_uses, max_extra_uses = career_extension:get_extra_ability_uses()
	local has_thornsister_passive = current_extra_uses > 0

	if has_thornsister_passive then
		content.ability_effect.texture_id = career_data.ability_effect_thorn
		content.ability_effect_top.texture_id = career_data.ability_effect_top_thorn
	else
		content.ability_effect.texture_id = career_data.ability_effect
		content.ability_effect_top.texture_id = career_data.ability_effect_top
	end

	if has_thornsister_passive then
		local pulse_progress = 0.5 + 0.5 * math.sin(t * 5)
		local effect_alpha = 220 + 35 * pulse_progress

		style.ability_effect_right.color[1] = effect_alpha
		style.ability_effect_top_right.color[1] = effect_alpha
		style.ability_effect_left.color[1] = effect_alpha
		style.ability_effect_top_left.color[1] = effect_alpha
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

	if self._ability_charge_widgets and not table.is_empty(self._ability_charge_widgets) then
		UIUtils.mark_dirty(self._ability_charge_widgets)
	end

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
	is_child = true,
	registry_key = "player_status",
	root_scenegraph_id = "ability_root",
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

	if self:_update_ability_charges_widgets(dt, t) then
		do_smudge = true
	end

	if do_smudge then
		self:_smudge()
	end

	self:_update_numeric_ui_ability_cooldown()
	self:draw(dt, t)
end

AbilityUI.draw = function (self, dt, t)
	if not self._is_visible or not self._dirty then
		return
	end

	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)

	if self._ability_charge_widgets and not table.is_empty(self._ability_charge_widgets) and self._ability_cooldowns > 1 then
		UIRenderer.draw_all_widgets(ui_renderer, self._ability_charge_widgets)
	end

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
	local input_action = gamepad_active and "ability" or "action_career"
	local widget = self._widgets_by_name.ability
	local _, input_text = self:_get_input_texture_data(input_action)
	local text_length = input_text and UTF8Utils.string_length(input_text) or 0

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

AbilityUI._update_numeric_ui_ability_cooldown = function (self)
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

	self:_smudge()
end

AbilityUI._update_ability_charges_widgets = function (self, dt, t)
	local do_smudge = false
	local player, player_unit = self:_get_player_unit()

	if not player_unit then
		return do_smudge
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_cooldowns = career_extension:get_number_of_ability_cooldowns()

	if self._ability_cooldowns ~= ability_cooldowns then
		if not self._ability_cooldowns then
			for i = 1, ability_cooldowns do
				if not self._ability_charge_widgets[i] then
					local offset = {
						0,
						(i - 1) * 22,
						1,
					}
					local widget_definition = UIWidgets.create_ability_charges_widget("ability_charges", nil, offset)
					local widget = UIWidget.init(widget_definition)

					self._ability_charge_widgets[#self._ability_charge_widgets + 1] = widget
				end
			end
		elseif self._ability_cooldowns and ability_cooldowns < self._ability_cooldowns then
			self._ability_charge_widgets[#self._ability_charge_widgets] = nil
		elseif self._ability_cooldowns and ability_cooldowns > self._ability_cooldowns then
			local difference = ability_cooldowns - self._ability_cooldowns

			for i = 1, difference do
				local offset = {
					0,
					(self._ability_cooldowns + (i - 1)) * 22,
					1,
				}
				local widget_definition = UIWidgets.create_ability_charges_widget("ability_charges", nil, offset)
				local widget = UIWidget.init(widget_definition)

				self._ability_charge_widgets[#self._ability_charge_widgets + 1] = widget
			end
		end

		self._ability_cooldowns = ability_cooldowns
		do_smudge = true
	end

	local charges_ready = career_extension:num_charges_ready()

	if self._charges_ready ~= charges_ready then
		for i = self._ability_cooldowns, 1, -1 do
			local w = self._ability_charge_widgets[i]

			w.content.ready = charges_ready ~= 0 and i <= charges_ready
		end

		self._charges_ready = charges_ready
		do_smudge = true
	end

	return do_smudge
end
