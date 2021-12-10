local definitions = local_require("scripts/settings/dlcs/bless/priest_resource_bar_ui_definition")
PriestResourceBarUI = class(PriestResourceBarUI)
local passive_ui_data = {
	material = "overcharge_bar_warrior_priest",
	color = {
		255,
		144,
		54,
		36
	}
}
local passive_feedback_values = {
	detail_bar_passive_active = 0.2,
	glow_brightness_min = 0.1,
	detail_bar_passive_inactive = -0.4,
	glow_brightness_max = 0.8
}

PriestResourceBarUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.platform = PLATFORM
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._gui = ingame_ui_context.ui_renderer.gui
	self.input_manager = ingame_ui_context.input_manager
	self._gui = ingame_ui_context.ui_renderer.gui

	self:create_ui_elements()

	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._previous_overcharge_fraction = 0
	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self._value = 0.1
	self._bar_feedback_state = "increase"
	self._active_passive = false
	self._animations = {}
	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
	event_manager:register(self, "glow_feedback", "glow_feedback")
	event_manager:register(self, "active_passive_feedback", "active_passive_feedback")
end

local function get_resource_amount(player_unit)
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local passive_ability = career_extension:get_passive_ability()
	local resource_fraction = passive_ability:get_resource_fraction()
	local threshold_fraction = 0.8
	local anim_blend_overcharge = 0.5

	return resource_fraction, threshold_fraction, 0.8, anim_blend_overcharge
end

PriestResourceBarUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
end

PriestResourceBarUI._set_player_extensions = function (self, player_unit)
	self.inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	self.initialize_charge_bar = true
end

PriestResourceBarUI._update_resource_bar = function (self, player, dt)
	if not player then
		return
	end

	local player_unit = player.player_unit

	if not ALIVE[player_unit] then
		return
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local passive_ability = career_extension:get_passive_ability()

	if not passive_ability or not passive_ability.uses_resource then
		return
	end

	local overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge = get_resource_amount(player_unit)

	if overcharge_fraction > 0 then
		self:set_charge_bar_fraction(player, overcharge_fraction, 0.3, max_threshold_fraction, anim_blend_overcharge, dt)

		return true
	end
end

PriestResourceBarUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.inventory_entry_definitions
	self.charge_bar = UIWidget.init(definitions.widget_definitions.charge_bar)
end

local customizer_data = {
	root_scenegraph_id = "screen_bottom_pivot_parent",
	label = "Overcharge",
	registry_key = "overcharge",
	drag_scenegraph_id = "charge_bar"
}

PriestResourceBarUI.update = function (self, dt, t, player)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local actual_player = (self._is_spectator and self._spectated_player) or player

	if HudCustomizer.run(ui_renderer, ui_scenegraph, customizer_data) then
		UISceneGraph.update_scenegraph(ui_scenegraph)
	end

	local is_dirty = self:_update_resource_bar(actual_player, dt)
	local has_twitch = Managers.twitch:is_activated()

	if has_twitch ~= self._has_twitch then
		self.charge_bar.offset[2] = (has_twitch and 140) or 0
		self._has_twitch = has_twitch
		is_dirty = true
	end

	for name, ui_animation in pairs(self._animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._animations[name] = nil
		end
	end

	if is_dirty then
		local parent = self._parent
		local crosshair_position_x, crosshair_position_y = parent:get_crosshair_position()

		self:_apply_crosshair_position(crosshair_position_x, crosshair_position_y)
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self.charge_bar)
		UIRenderer.end_pass(ui_renderer)
	end
end

PriestResourceBarUI.set_charge_bar_fraction = function (self, player, overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge, dt)
	local widget = self.charge_bar
	local style = widget.style
	local content = widget.content
	local bar_size = content.size
	overcharge_fraction = math.lerp(content.internal_gradient_threshold or 0, math.min(overcharge_fraction, 1), 0.3)
	content.internal_gradient_threshold = overcharge_fraction
	style.bar_1.gradient_threshold = overcharge_fraction
	local bar_color = style.bar_1.color
	local ui_data = passive_ui_data
	local color = ui_data.color
	content.bar_1 = ui_data.material
	local glow_style = style.glow
	local glow_size = glow_style.size
	local glow_offset = glow_style.offset
	glow_offset[1] = bar_size[1] * overcharge_fraction - glow_size[1] / 2 + 2

	self:handle_glow_feedback(widget, dt)

	local detail_style = style.bar_detail
	detail_style.gradient_threshold = overcharge_fraction
	local material_name = widget.content.bar_detail
	local material = Gui.material(self._gui, material_name)

	Material.set_scalar(material, "gradient_threshold", overcharge_fraction)

	if self._active_passive then
		local detail_value = 0 + 0.5 * math.sin(2.5 * Managers.time:time("ui"))
		local material_name = widget.content.bar_active
		local material = Gui.material(self._gui, material_name)

		Material.set_scalar(material, "detail_offset", detail_value)
		Material.set_scalar(material, "gradient_threshold", overcharge_fraction)

		glow_style.size = {
			150,
			150
		}
		glow_style.offset[2] = -75 + content.size[2] / 2

		self:handle_active_passive_feedback(passive_feedback_values.detail_bar_passive_active)
	else
		glow_style.size = {
			75,
			75
		}
		glow_style.offset[2] = -37.5 + content.size[2] / 2

		self:handle_active_passive_feedback(passive_feedback_values.detail_bar_passive_inactive)
	end

	bar_color[2] = color[2]
	bar_color[3] = color[3]
	bar_color[4] = color[4]
end

PriestResourceBarUI.destroy = function (self)
	Managers.state.event:unregister("on_spectator_target_changed", self)
	Managers.state.event:unregister("glow_feedback", self)
	Managers.state.event:unregister("activate_passive_feedback", self)
end

PriestResourceBarUI.set_alpha = function (self, alpha)
	self.render_settings.alpha_multiplier = alpha
end

PriestResourceBarUI._apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "screen_bottom_pivot"
	local position = self.ui_scenegraph[scenegraph_id].local_position
	position[1] = x
	position[2] = y
end

PriestResourceBarUI.glow_feedback = function (self)
	if not self._play_glow_feedback then
		self._play_glow_feedback = true
	end
end

PriestResourceBarUI.handle_glow_feedback = function (self, widget, dt)
	if not self._play_glow_feedback then
		return
	end

	local min_value = passive_feedback_values.glow_brightness_min
	local max_value = passive_feedback_values.glow_brightness_max
	local value = self._value

	if self._bar_feedback_state == "increase" then
		value = value + 5 * dt

		if max_value <= value then
			self._bar_feedback_state = "decrease"
		end
	elseif self._bar_feedback_state == "decrease" then
		value = value - 2.5 * dt

		if min_value >= value then
			self._bar_feedback_state = "done"
		end
	elseif self._bar_feedback_state == "done" then
		self._value = min_value
		self._play_glow_feedback = false
		self._bar_feedback_state = "increase"
	end

	self._value = value
	local material_name = widget.content.glow
	local material = Gui.material(self._gui, material_name)

	Material.set_scalar(material, "detail_offset", value)
end

PriestResourceBarUI.active_passive_feedback = function (self, active)
	self._active_passive = active

	if active then
		self._animations.fade_in = UIAnimation.init(UIAnimation.function_by_time, self.charge_bar.style.bar_active.color, 1, 0, 255, 0.3, math.ease_in_exp)
	else
		self._animations.fade_in = UIAnimation.init(UIAnimation.function_by_time, self.charge_bar.style.bar_active.color, 1, 255, 0, 0.3, math.ease_in_exp)
	end
end

PriestResourceBarUI.handle_active_passive_feedback = function (self, value)
	local widget = self.charge_bar
	local material_name = widget.content.bar_detail
	local material = Gui.material(self._gui, material_name)

	Material.set_scalar(material, "detail_offset", value)
end

return
