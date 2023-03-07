local definitions = local_require("scripts/ui/hud_ui/energy_bar_ui_definitions")
EnergyBarUI = class(EnergyBarUI)

EnergyBarUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}

	self:create_ui_elements()
end

EnergyBarUI._update_energy = function (self, player, dt)
	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local energy_extension = ScriptUnit.has_extension(player_unit, "energy_system")

	if not energy_extension then
		return
	end

	local energy_fraction = energy_extension:get_fraction()
	local energy_full = energy_fraction >= 1

	if not energy_full then
		local is_drainable = energy_extension:is_drainable()

		self:_set_charge_bar_fraction(energy_fraction, is_drainable)

		return true
	end

	return false
end

EnergyBarUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.charge_bar = UIWidget.init(definitions.widget_definitions.charge_bar)
end

EnergyBarUI.update = function (self, dt, t, player)
	local is_dirty = self:_update_energy(player, dt)
	local has_twitch = Managers.twitch:is_activated()

	if has_twitch ~= self._has_twitch then
		self.charge_bar.offset[2] = has_twitch and 140 or 0
		self._has_twitch = has_twitch
		is_dirty = true
	end

	if is_dirty then
		local ui_scenegraph = self.ui_scenegraph
		local input_manager = self.input_manager
		local input_service = input_manager:get_service("ingame_menu")
		local parent = self._parent
		local crosshair_position_x, crosshair_position_y = parent:get_crosshair_position()

		self:_apply_crosshair_position(crosshair_position_x, crosshair_position_y)

		local ui_renderer = self.ui_renderer

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self.charge_bar)
		UIRenderer.end_pass(ui_renderer)
	end
end

local colors = {
	normal = {
		255,
		0,
		255,
		255
	}
}

EnergyBarUI._set_charge_bar_fraction = function (self, energy_fraction, is_drainable)
	local widget = self.charge_bar
	local style = widget.style
	local content = widget.content
	energy_fraction = math.lerp(content.internal_gradient_threshold or 1, math.min(energy_fraction, 1), 0.3)
	content.internal_gradient_threshold = energy_fraction
	style.bar_1.gradient_threshold = energy_fraction
	local color = nil
	local icon_color = style.icon.color
	local bar_color = style.bar_1.color
	color = colors.normal
	bar_color[1] = color[1]
	bar_color[2] = color[2]
	bar_color[3] = color[3]
	bar_color[4] = color[4]
	local pulse_speed = 10
	local pulse_alpha = 0

	if not is_drainable then
		local pulse_global_fraction = math.min(math.max(energy_fraction, 0.95) / 0.050000000000000044 * 1.3, 1)
		local pulse_fraction = 0.5 + math.sin(Managers.time:time("ui") * pulse_speed) * 0.5
		pulse_alpha = (100 + pulse_fraction * 155) * pulse_global_fraction
	end

	style.frame.color[1] = pulse_alpha
	icon_color[1] = 0
	icon_color[2] = color[2]
	icon_color[3] = color[3]
	icon_color[4] = color[4]
end

EnergyBarUI.destroy = function (self)
	return
end

EnergyBarUI.set_alpha = function (self, alpha)
	self.render_settings.alpha_multiplier = alpha
end

EnergyBarUI._apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "screen_bottom_pivot"
	local position = self.ui_scenegraph[scenegraph_id].local_position
	position[1] = x
	position[2] = y
end
