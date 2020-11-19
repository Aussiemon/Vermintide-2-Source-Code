local definitions = local_require("scripts/ui/hud_ui/overcharge_bar_ui_definitions")
OverchargeBarUI = class(OverchargeBarUI)
local accepted_slots = {
	slot_ranged = true,
	slot_melee = true
}

OverchargeBarUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.platform = PLATFORM
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.slot_equip_animations = {}
	self.slot_animations = {}
	self.ui_animations = {}

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
	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

local function get_overcharge_amount(player_unit)
	local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")
	local overcharge_fraction = overcharge_extension:overcharge_fraction()
	local threshold_fraction = overcharge_extension:threshold_fraction()
	local anim_blend_overcharge = overcharge_extension:get_anim_blend_overcharge()

	return overcharge_fraction, threshold_fraction, 0.8, anim_blend_overcharge
end

OverchargeBarUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
end

OverchargeBarUI._set_player_extensions = function (self, player_unit)
	self.inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	self.initialize_charge_bar = true
end

OverchargeBarUI._update_overcharge = function (self, player, dt)
	if not player then
		return
	end

	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	if not ScriptUnit.has_extension(player_unit, "overcharge_system") then
		return
	end

	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()

	if not equipment then
		return
	end

	local wielded = equipment.wielded
	local inventory_slots = InventorySettings.slots

	for _, slot in ipairs(inventory_slots) do
		local slot_name = slot.name

		if accepted_slots[slot_name] then
			local slot_data = equipment.slots[slot_name]

			if slot_data then
				local item_data = slot_data.item_data
				local item_name = item_data.name
				local is_wielded = wielded == item_data
				local overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge = get_overcharge_amount(player_unit)
				local has_overcharge = overcharge_fraction and overcharge_fraction > 0

				if has_overcharge then
					if not self.wielded_item_name or self.wielded_item_name ~= item_name then
						self.wielded_item_name = item_name
					end

					self:set_charge_bar_fraction(overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge)

					return true
				end
			end
		end
	end
end

OverchargeBarUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.inventory_entry_definitions
	self.charge_bar = UIWidget.init(definitions.widget_definitions.charge_bar)
end

OverchargeBarUI.update = function (self, dt, t, player)
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local actual_player = (self._is_spectator and self._spectated_player) or player

	if self:_update_overcharge(actual_player, dt) then
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
		255,
		255,
		255
	},
	medium = {
		255,
		255,
		165,
		0
	},
	high = {
		255,
		255,
		0,
		0
	}
}

OverchargeBarUI.set_charge_bar_fraction = function (self, overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge)
	local widget = self.charge_bar
	local style = widget.style
	local content = widget.content
	local bar_size = content.size
	overcharge_fraction = math.lerp(content.internal_gradient_threshold or 0, math.min(overcharge_fraction, 1), 0.3)
	content.internal_gradient_threshold = overcharge_fraction
	local start_fraction = 0
	local bar_total_fraction = 1
	local bar_1_fraction = math.min(overcharge_fraction, min_threshold_fraction) * bar_total_fraction
	local bar_2_fraction = math.min(overcharge_fraction, max_threshold_fraction) * bar_total_fraction
	local bar_3_fraction = overcharge_fraction * bar_total_fraction
	style.bar_1.gradient_threshold = bar_3_fraction
	local alpha_multiplier = 1
	local color = nil
	local icon_color = style.icon.color
	local bar_color = style.bar_1.color

	if overcharge_fraction <= min_threshold_fraction then
		color = colors.normal
		alpha_multiplier = 0.6
	elseif overcharge_fraction <= max_threshold_fraction then
		alpha_multiplier = 0.8
		color = colors.medium
	else
		color = colors.high
	end

	bar_color[1] = color[1] * alpha_multiplier
	bar_color[2] = color[2]
	bar_color[3] = color[3]
	bar_color[4] = color[4]
	style.min_threshold.offset[1] = 3 + min_threshold_fraction * bar_size[1]
	style.max_threshold.offset[1] = 3 + max_threshold_fraction * bar_size[1]
	local pulse_speed = 10
	local pulse_global_fraction = math.min(math.max(overcharge_fraction - max_threshold_fraction, 0) / (1 - max_threshold_fraction) * 1.3, 1)
	local pulse_fraction = 0.5 + math.sin(Managers.time:time("ui") * pulse_speed) * 0.5
	local pulse_alpha = (100 + pulse_fraction * 155) * pulse_global_fraction
	style.frame.color[1] = pulse_alpha
	icon_color[1] = pulse_alpha
	icon_color[2] = color[2]
	icon_color[3] = color[3]
	icon_color[4] = color[4]
end

OverchargeBarUI.destroy = function (self)
	Managers.state.event:unregister("on_spectator_target_changed", self)
end

OverchargeBarUI.set_alpha = function (self, alpha)
	self.render_settings.alpha_multiplier = alpha
end

OverchargeBarUI._apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "screen_bottom_pivot"
	local position = self.ui_scenegraph[scenegraph_id].local_position
	position[1] = x
	position[2] = y
end

return
