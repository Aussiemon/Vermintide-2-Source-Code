local definitions = local_require("scripts/ui/hud_ui/career_ability_bar_ui_definitions")
CareerAbilityBarUI = class(CareerAbilityBarUI)
local DO_RELOAD = true

CareerAbilityBarUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._platform = PLATFORM
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._slot_equip_animations = {}
	self._slot_animations = {}
	self._ui_animations = {}

	self:_create_ui_elements()

	self._peer_id = ingame_ui_context.peer_id
	self._player_manager = ingame_ui_context.player_manager
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self._game_options_dirty = true
	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
	event_manager:register(self, "on_game_options_changed", "_set_game_options_dirty")
	self:_update_game_options()
end

CareerAbilityBarUI._get_ability_amount = function (self, player_unit)
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown()
	local ability_fraction = 1 - ability_cooldown / max_cooldown
	local threshold_fraction = 0.25
	local max_threshold_fraction = 0.8
	local icon_pulse_fraction = 0.3

	return ability_fraction, threshold_fraction, max_threshold_fraction, icon_pulse_fraction
end

CareerAbilityBarUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
end

CareerAbilityBarUI._set_player_extensions = function (self, player_unit)
	self._inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	self._initialize_ability_bar = true
end

CareerAbilityBarUI._update_career_ability = function (self, player, dt)
	if not player then
		return
	end

	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()

	if not equipment then
		return
	end

	local is_career_skill_active = inventory_extension:get_wielded_slot_name() == "slot_career_skill_weapon"

	if not is_career_skill_active then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local career_name = career_extension:career_name()
	local career_settings = CareerSettings[career_name]
	local activated_ability = career_settings.activated_ability[1]

	if activated_ability.show_gamepad_ability_bar then
		local ability_fraction, min_threshold_fraction, max_threshold_fraction, icon_pulse_fraction = self:_get_ability_amount(player_unit)

		self:_set_ability_bar_fraction(ability_fraction, min_threshold_fraction, max_threshold_fraction, icon_pulse_fraction)

		return true
	end
end

CareerAbilityBarUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.inventory_entry_definitions
	self._ability_bar = UIWidget.init(definitions.widget_definitions.ability_bar)
	DO_RELOAD = false
end

CareerAbilityBarUI.update = function (self, dt, t, player)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = (input_manager:is_device_active("gamepad") or UISettings.use_gamepad_hud_layout == "always") and UISettings.use_gamepad_hud_layout ~= "never"
	local actual_player = (self._is_spectator and self._spectated_player) or player

	if not gamepad_active then
		return
	end

	self:_update_game_options()

	if self:_update_career_ability(actual_player, dt) then
		local parent = self._parent
		local crosshair_position_x, crosshair_position_y = parent:get_crosshair_position()

		self:_apply_crosshair_position(crosshair_position_x, crosshair_position_y)

		local ui_renderer = self._ui_renderer

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
		UIRenderer.draw_widget(ui_renderer, self._ability_bar)
		UIRenderer.end_pass(ui_renderer)
	end
end

local colors = {
	normal = {
		255,
		223,
		133,
		228
	},
	medium = {
		255,
		223,
		133,
		228
	},
	high = {
		255,
		223,
		133,
		228
	}
}

CareerAbilityBarUI._set_ability_bar_fraction = function (self, ability_fraction, min_threshold_fraction, max_threshold_fraction, icon_pulse_fraction)
	local widget = self._ability_bar
	local style = widget.style
	local content = widget.content
	local bar_size = content.size
	ability_fraction = math.lerp(content.internal_gradient_threshold or 0, math.min(ability_fraction, 1), 0.3)
	content.internal_gradient_threshold = ability_fraction
	local start_fraction = 0
	local bar_total_fraction = 1
	local bar_1_fraction = math.min(ability_fraction, min_threshold_fraction) * bar_total_fraction
	local bar_2_fraction = math.min(ability_fraction, max_threshold_fraction) * bar_total_fraction
	local bar_3_fraction = ability_fraction * bar_total_fraction
	style.bar_1.gradient_threshold = bar_3_fraction
	local alpha_multiplier = 1
	local color = nil
	local icon_color = style.icon.color
	local bar_color = style.bar_1.color

	if ability_fraction <= min_threshold_fraction then
		color = colors.normal
	elseif ability_fraction <= max_threshold_fraction then
		color = colors.medium
	else
		color = colors.high
	end

	bar_color[1] = color[1]
	bar_color[2] = color[2]
	bar_color[3] = color[3]
	bar_color[4] = color[4]
	local pulse_speed = 10
	local pulse_value = 1 - ability_fraction
	local pulse_frame_fraction = math.min(math.max(pulse_value - max_threshold_fraction, 0) / (1 - max_threshold_fraction) * 1.3, 1)
	local pulse_icon_fraction = math.min(math.max(pulse_value - icon_pulse_fraction, 0) / (1 - icon_pulse_fraction) * 1.3, 1)
	local pulse_fraction = 0.5 + math.sin(Managers.time:time("ui") * pulse_speed) * 0.5
	local pulse_alpha = 100 + pulse_fraction * 155
	style.frame.color[1] = pulse_alpha * pulse_frame_fraction
	icon_color[1] = pulse_alpha * pulse_icon_fraction
	icon_color[2] = 255
	icon_color[3] = 255
	icon_color[4] = 255
	style.input_text.text_color[1] = pulse_alpha * pulse_icon_fraction
	style.input_text_shadow.text_color[1] = pulse_alpha * pulse_icon_fraction * pulse_icon_fraction
	style.ability_bar_highlight.texture_size[1] = 250 * ability_fraction
	local t = Managers.time:time("main") * 0.25
	content.ability_bar_highlight.uvs[1][1] = t % 1
	content.ability_bar_highlight.uvs[2][1] = (0.5 + t) % 1
end

CareerAbilityBarUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("on_spectator_target_changed", self)
	event_manager:unregister("on_game_options_changed", self)
end

CareerAbilityBarUI.set_alpha = function (self, alpha)
	self._render_settings.alpha_multiplier = alpha
end

CareerAbilityBarUI._apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "screen_bottom_pivot"
	local position = self._ui_scenegraph[scenegraph_id].local_position
	position[1] = x
	position[2] = y
end

CareerAbilityBarUI._set_game_options_dirty = function (self)
	self._game_options_dirty = true
end

CareerAbilityBarUI._update_game_options = function (self)
	if not self._game_options_dirty then
		return
	end

	self:_update_gamepad_input_button()

	self._game_options_dirty = false
end

CareerAbilityBarUI._update_gamepad_input_button = function (self)
	local input_service = Managers.input:get_service("Player")
	local input_action = "weapon_reload_input"
	local gamepad_active = true
	local button_texture_data, button_name, keymap_binding, unassigned = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
	local widget = self._ability_bar
	local style = widget.style
	local content = widget.content

	if button_texture_data then
		local texture = button_texture_data.texture
		content.icon = texture
		content.input_text = ""
		local icon_style = style.icon
		local icon_texture_size = icon_style.texture_size
		local icon_shadow_style = style.icon_shadow
		local icon_shadow_texture_size = icon_shadow_style.texture_size
		local size = button_texture_data.size
		icon_texture_size[1] = size[1]
		icon_texture_size[2] = size[2]
		icon_shadow_texture_size[1] = size[1]
		icon_shadow_texture_size[2] = size[2]
	end
end

return
