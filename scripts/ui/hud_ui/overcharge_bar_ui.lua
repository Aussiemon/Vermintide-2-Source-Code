﻿-- chunkname: @scripts/ui/hud_ui/overcharge_bar_ui.lua

local definitions = local_require("scripts/ui/hud_ui/overcharge_bar_ui_definitions")

OverchargeBarUI = class(OverchargeBarUI)

local accepted_slots = {
	slot_melee = true,
	slot_ranged = true,
}
local DEFAULT_UI_DATA = {
	material = "overcharge_bar",
	color_normal = {
		255,
		255,
		255,
		255,
	},
	color_medium = {
		255,
		255,
		165,
		0,
	},
	color_high = {
		255,
		255,
		0,
		0,
	},
}
local KEEP_AT_0_DURATION = 0.5

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
		snap_pixel_positions = true,
	}
	self._previous_overcharge_fraction = 0
	self._keep_at_0_t = 0
	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil

	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

local function get_overcharge_amount(player_unit)
	local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")
	local overcharge_fraction = overcharge_extension:lerped_overcharge_fraction()
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

OverchargeBarUI._update_overcharge = function (self, player, t)
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

				if has_overcharge or t < self._keep_at_0_t then
					if not self.wielded_item_name or self.wielded_item_name ~= item_name then
						self.wielded_item_name = item_name
					end

					local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")
					local max_overcharge_value = overcharge_extension:get_max_value()

					self:update_bar_size(max_overcharge_value, min_threshold_fraction, max_threshold_fraction)
					self:set_charge_bar_fraction(player, overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge)

					if has_overcharge then
						self._keep_at_0_t = t + KEEP_AT_0_DURATION
					end

					return true
				end
			end
		end
	end
end

OverchargeBarUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widget_definition = UIWidgets.create_overcharge_bar_widget("charge_bar", nil, nil, nil, nil, definitions.DEFAULT_BAR_SIZE)

	self.charge_bar = UIWidget.init(widget_definition)
end

local customizer_data = {
	drag_scenegraph_id = "charge_bar",
	label = "Overcharge",
	registry_key = "overcharge",
	root_scenegraph_id = "screen_bottom_pivot_parent",
}

OverchargeBarUI.update = function (self, dt, t, player)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local actual_player = self._is_spectator and self._spectated_player or player

	if HudCustomizer.run(ui_renderer, ui_scenegraph, customizer_data) then
		UISceneGraph.update_scenegraph(ui_scenegraph)
	end

	local is_dirty = self:_update_overcharge(actual_player, t)
	local has_twitch = Managers.twitch:is_activated()

	if has_twitch ~= self._has_twitch then
		self.charge_bar.offset[2] = has_twitch and 140 or 0
		self._has_twitch = has_twitch
		is_dirty = true
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

OverchargeBarUI.update_bar_size = function (self, max_overcharge_value, min_threshold_fraction, max_threshold_fraction)
	local new_width = math.remap(0, 40, 0, definitions.DEFAULT_BAR_SIZE[1], max_overcharge_value)
	local widget = self.charge_bar
	local content = widget.content

	content.size[1] = new_width - 6

	local style = widget.style

	if style.frame then
		style.frame.size[1] = new_width
	end

	style.bar_1.size[1] = new_width - 6
	style.icon.offset[1] = new_width
	style.icon_shadow.offset[1] = new_width + 2

	if style.bar_bg then
		style.bar_bg.size[1] = new_width - 6
	end

	style.bar_fg.size[1] = new_width

	if style.min_threshold or style.max_threshold then
		style.min_threshold.offset[1] = 3 + min_threshold_fraction * new_width
		style.max_threshold.offset[1] = 3 + max_threshold_fraction * new_width
	end

	local scene_graph = self.ui_scenegraph

	scene_graph.charge_bar.size[1] = new_width
end

OverchargeBarUI.set_charge_bar_fraction = function (self, player, overcharge_fraction, min_threshold_fraction, max_threshold_fraction, anim_blend_overcharge)
	local widget = self.charge_bar
	local style = widget.style
	local content = widget.content

	overcharge_fraction = math.lerp(content.internal_gradient_threshold or 0, math.min(overcharge_fraction, 1), 0.3)
	content.internal_gradient_threshold = overcharge_fraction
	style.bar_1.gradient_threshold = overcharge_fraction

	local alpha_multiplier = 1
	local color
	local icon_color = style.icon.color
	local bar_color = style.bar_1.color
	local career_name = player:career_name()
	local overcharge_data = OverchargeData[career_name]
	local ui_data = overcharge_data and overcharge_data.overcharge_ui or DEFAULT_UI_DATA

	content.bar_1 = ui_data.material

	if overcharge_fraction <= min_threshold_fraction then
		color = ui_data.color_normal
		alpha_multiplier = 0.6
	elseif overcharge_fraction <= max_threshold_fraction then
		alpha_multiplier = 0.8
		color = ui_data.color_medium
	else
		color = ui_data.color_high
	end

	bar_color[1] = color[1] * alpha_multiplier
	bar_color[2] = color[2]
	bar_color[3] = color[3]
	bar_color[4] = color[4]

	local pulse_speed = 10
	local pulse_global_fraction = math.min(math.max(overcharge_fraction - max_threshold_fraction, 0) / (1 - max_threshold_fraction) * 1.3, 1)
	local pulse_fraction = 0.5 + math.sin(Managers.time:time("ui") * pulse_speed) * 0.5
	local pulse_alpha = (100 + pulse_fraction * 155) * pulse_global_fraction

	if style.frame then
		style.frame.color[1] = pulse_alpha
	end

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
