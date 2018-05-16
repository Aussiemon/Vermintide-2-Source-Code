local definitions = local_require("scripts/ui/hud_ui/gamepad_consumable_ui_definitions")
local animation_definitions = definitions.animations
local scenegraph_definition = definitions.scenegraph_definition
local SLOTS_LIST = InventorySettings.weapon_slots
local widget_index_by_consumable_slots = {
	slot_healthkit = 4,
	slot_grenade = 1,
	slot_potion = 2
}
local temp_slot_texture_mapping = {
	slot_healthkit = "consumables_medpack",
	slot_grenade = "consumables_frag",
	slot_potion = "consumables_potion_01"
}
local default_slot_textures = {
	slot_grenade = {
		"default_grenade_icon",
		"default_grenade_icon_lit"
	},
	slot_potion = {
		"default_potion_icon",
		"default_potion_icon_lit"
	},
	slot_healthkit = {
		"default_heal_icon",
		"default_heal_icon_lit"
	}
}
local SWITCH_ANIMATION_DURATION = 5
hud_icon_texture_lit_lookup_table = {}
GamepadConsumableUI = class(GamepadConsumableUI)

GamepadConsumableUI.init = function (self, ingame_ui_context)
	self.platform = PLATFORM
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.ui_animations = {}

	self:_create_ui_elements()
	rawset(_G, "gamepad_consumable_ui", self)
end

GamepadConsumableUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.selection_widget = UIWidget.init(definitions.widget_definitions.selection)
	self.background_widget = UIWidget.init(definitions.widget_definitions.background)
	local slot_widgets = {}
	local slot_widgets_by_name = {}

	for slot_name, slot_textures in pairs(default_slot_textures) do
		local widget = UIWidget.init(definitions.widget_definitions[slot_name])
		widget.content.texture_icon = slot_textures[1]
		slot_widgets[#slot_widgets + 1] = widget
		slot_widgets_by_name[slot_name] = widget
	end

	self.slot_widgets = slot_widgets
	self.slot_widgets_by_name = slot_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self:_align_widgets()
	self:_set_dirty()
end

GamepadConsumableUI.destroy = function (self)
	self.ui_animator = nil

	self:set_visible(false)
	rawset(_G, "gamepad_consumable_ui", nil)
end

GamepadConsumableUI.set_visible = function (self, visible)
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	if visible and not gamepad_active then
		return
	end

	self._is_visible = visible
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self.slot_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	UIRenderer.set_element_visible(ui_renderer, self.selection_widget.element, visible)
end

GamepadConsumableUI.update = function (self, dt, t, inventory_extension)
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	if gamepad_active then
		if not self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = true

			self:on_gamepad_activated()
		end
	elseif self.gamepad_active_last_frame then
		self.gamepad_active_last_frame = false

		self:on_gamepad_deactivated()
	end

	if RESOLUTION_LOOKUP.modified then
		for _, widget in ipairs(self.slot_widgets) do
			self:_set_widget_dirty(widget)
		end

		self:_set_dirty()
	end

	self:_update_extension_changes(dt, inventory_extension)

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local ui_animations = self.ui_animations

	for index, animation_id in ipairs(ui_animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			ui_animations[index] = nil
		end

		self:_set_dirty()
	end

	self:_draw(dt)

	self._dirty = nil
end

local function get_ammunition_count(left_hand_wielded_unit, right_hand_wielded_unit, item_template)
	local ammo_extension = nil

	if not item_template.ammo_data then
		return
	end

	local ammo_unit_hand = item_template.ammo_data.ammo_hand

	if ammo_unit_hand == "right" then
		ammo_extension = ScriptUnit.extension(right_hand_wielded_unit, "ammo_system")
	elseif ammo_unit_hand == "left" then
		ammo_extension = ScriptUnit.extension(left_hand_wielded_unit, "ammo_system")
	else
		return
	end

	local ammo_count = ammo_extension:ammo_count()
	local remaining_ammo = ammo_extension:remaining_ammo()

	return ammo_count, remaining_ammo
end

GamepadConsumableUI._draw = function (self, dt)
	if not self._is_visible then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self.slot_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._draw_selection then
		UIRenderer.draw_widget(ui_renderer, self.selection_widget)
	end

	UIRenderer.draw_widget(ui_renderer, self.background_widget)
	UIRenderer.end_pass(ui_renderer)
end

GamepadConsumableUI._set_dirty = function (self)
	self._dirty = true
end

GamepadConsumableUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

GamepadConsumableUI._update_extension_changes = function (self, dt, inventory_extension)
	if not inventory_extension then
		return
	end

	local dirty = false
	local slot_widgets_by_name = self.slot_widgets_by_name
	local selected_consumable_slot_name = inventory_extension:get_selected_consumable_slot_name()
	local equipment = inventory_extension:equipment()

	for i, slot in ipairs(SLOTS_LIST) do
		local widget_dirty = false
		local slot_name = slot.name
		local slot_data = equipment.slots[slot_name]
		local widget = slot_widgets_by_name[slot_name]

		if widget then
			local widget_content = widget.content

			if not slot_data then
				local dirty_reset = self:_reset_slot_widget(widget, slot_name, i)

				if dirty_reset then
					widget_dirty = true
				end
			else
				if not widget_content.has_data then
					widget_content.has_data = true
					widget_dirty = true
				end

				local item_data = slot_data.item_data
				local is_selected = selected_consumable_slot_name == slot_name
				local dirty_icon = self:_update_slot_icon(widget, item_data, is_selected)
				local dirty_ammo = self:_update_slot_ammo(widget, slot_data, item_data, is_selected)

				if widget_content.wielded ~= is_selected then
					widget_content.wielded = is_selected
					widget_dirty = true

					if is_selected then
						self:_on_slot_selected(widget)
					end
				end

				if dirty_ammo or dirty_icon then
					widget_dirty = true
				end
			end

			if widget_dirty then
				dirty = true

				self:_set_widget_dirty(widget)
			end
		end
	end

	if not selected_consumable_slot_name then
		self:_clear_selection()
	end

	if dirty then
		self:_set_dirty()
	end
end

GamepadConsumableUI._on_slot_selected = function (self, widget)
	local ui_renderer = self.ui_renderer
	local widget_offset = widget.offset
	local selection_widget = self.selection_widget
	local selection_offset = selection_widget.offset
	selection_offset[1] = widget_offset[1]
	selection_offset[2] = widget_offset[2]

	self:_set_widget_dirty(selection_widget)

	self._draw_selection = true

	UIRenderer.set_element_visible(ui_renderer, selection_widget.element, true)
end

GamepadConsumableUI._clear_selection = function (self)
	local ui_renderer = self.ui_renderer
	local selection_widget = self.selection_widget

	UIRenderer.set_element_visible(ui_renderer, selection_widget.element, false)
	self:_set_widget_dirty(selection_widget)

	self._draw_selection = nil
end

GamepadConsumableUI._update_slot_icon = function (self, widget, item_data, wielded)
	local dirty = false
	local widget_style = widget.style
	local widget_content = widget.content
	local hud_icon_texture = (item_data and item_data.hud_icon) or temp_slot_texture_mapping[slot_name]

	if not hud_icon_texture_lit_lookup_table[hud_icon_texture] then
		hud_icon_texture_lit_lookup_table[hud_icon_texture] = hud_icon_texture .. "_lit"
	end

	if widget_content.texture_icon ~= hud_icon_texture then
		dirty = true
		widget_content.texture_icon = hud_icon_texture
		local master_item_name = (item_data and item_data.name) or "no_master_item_found"

		assert(widget_content.texture_icon, "No hud icon for weapon %s", master_item_name)

		widget_content.texture_icon_lit = hud_icon_texture_lit_lookup_table[hud_icon_texture]
		local texture_icon_color = widget_style.texture_icon.color
		local texture_icon_lit_color = widget_style.texture_icon_lit.color
		local texture_bg_color = widget_style.texture_bg.color
		texture_bg_color[1] = 150
		texture_icon_color[1] = 255
		texture_icon_lit_color[1] = 255
	end

	return dirty
end

GamepadConsumableUI._update_slot_ammo = function (self, widget, slot_data, item_data, wielded)
	local dirty = false
	local widget_content = widget.content
	local item_template = BackendUtils.get_item_template(item_data)
	local ammo_count, remaining_ammo = get_ammunition_count(slot_data.left_unit_1p, slot_data.right_unit_1p, item_template)
	local ammo_data = item_template and item_template.ammo_data

	if ammo_data and ammo_count then
		local total_ammo = ammo_count + remaining_ammo

		if total_ammo > 1 and widget_content.total_ammo ~= total_ammo then
			local ammo_text = "x" .. tostring(ammo_count + remaining_ammo)
			widget_content.text_ammo = ammo_text
			widget_content.total_ammo = total_ammo
			widget_content.show_ammo = true
			dirty = true
		end
	elseif widget_content.show_ammo then
		widget_content.show_ammo = false
		dirty = true
	end

	return dirty
end

GamepadConsumableUI._reset_slot_widget = function (self, widget, slot_name, index)
	local dirty = false
	local widget_content = widget.content

	if widget_content.has_data then
		widget_content.has_data = nil
		dirty = true

		if slot_name == "slot_healthkit" then
		end

		if widget_content.show_ammo then
			widget_content.show_ammo = false
			widget_content.ammo_text_1 = ""
			widget_content.ammo_text_2 = ""
		end

		local default_textures = default_slot_textures[slot_name]

		if widget_content.texture_icon ~= default_textures[1] then
			local alpha = 50
			local widget_style = widget.style
			widget_content.texture_icon = default_textures[1]
			widget_content.texture_icon_lit = default_textures[2]
			widget_content.wielded = false
			local texture_icon_color = widget_style.texture_icon.color
			local texture_icon_lit_color = widget_style.texture_icon_lit.color
			local texture_bg_color = widget_style.texture_bg.color
			texture_bg_color[1] = 100
			texture_icon_color[1] = alpha
			texture_icon_lit_color[1] = alpha
		end
	end

	return dirty
end

GamepadConsumableUI._change_heal_other_slot_state = function (self, state)
	local slot_widgets = self.slot_widgets

	if state == "active" then
		local heal_other_slot_widget = slot_widgets[3]
		local heal_other_slot_widget_content = heal_other_slot_widget.content

		if not heal_other_slot_widget_content.has_data or heal_other_slot_widget_content.wielded then
			heal_other_slot_widget_content.wielded = false
			heal_other_slot_widget_content.has_data = true
			heal_other_slot_widget.style.texture_icon.color[1] = 255
			heal_other_slot_widget.style.texture_icon_lit.color[1] = 255
			heal_other_slot_widget.element.dirty = true
		end
	elseif state == "wielded" then
		local heal_other_slot_widget = slot_widgets[3]
		local heal_other_slot_widget_content = heal_other_slot_widget.content

		if not heal_other_slot_widget_content.wielded then
			heal_other_slot_widget_content.wielded = true
			heal_other_slot_widget_content.has_data = true
			heal_other_slot_widget.style.texture_icon.color[1] = 255
			heal_other_slot_widget.style.texture_icon_lit.color[1] = 255
			heal_other_slot_widget.element.dirty = true
		end
	elseif state == "reset" then
		local heal_other_slot_widget = slot_widgets[3]
		local heal_other_slot_widget_content = heal_other_slot_widget.content

		if heal_other_slot_widget_content.has_data then
			heal_other_slot_widget_content.wielded = false
			heal_other_slot_widget_content.has_data = false
			heal_other_slot_widget.style.texture_icon.color[1] = 50
			heal_other_slot_widget.style.texture_icon_lit.color[1] = 50
			heal_other_slot_widget.element.dirty = true
		end
	end
end

GamepadConsumableUI._animate_slot_fill = function (self, widget, widget_index)
	local params = {}
	local widgets = {
		widget
	}
	local ui_animations = self.ui_animations
	ui_animations[#ui_animations + 1] = self.ui_animator:start_animation("pickup", widgets, scenegraph_definition, params)
end

GamepadConsumableUI._align_widgets = function (self)
	local slot_widgets = self.slot_widgets
	local default_size = 63
	local spacing = 0
	local width_offset = 0

	for index, widget in ipairs(slot_widgets) do
		local widget_style = widget.style
		local offset = widget.offset
		offset[1] = width_offset
		width_offset = width_offset + default_size + spacing
	end
end

GamepadConsumableUI._update_slot_positions = function (self)
	local ui_scenegraph = self.ui_scenegraph
	local slot_spacing = UISettings.inventory_hud.slot_spacing
	local size_multiplier = 0.9
	local slot_widgets = self.slot_widgets
	local num_slots = #slot_widgets
	local width_offset = 0

	for i = num_slots, 1, -1 do
		local widget = slot_widgets[i]
		local widget_style = widget.style
		local background_style = widget_style.texture_bg
		local background_offset = background_style.offset
		local background_size = background_style.size
		local offset = widget.offset
		local widget_width = background_size[1] * size_multiplier
		offset[1] = width_offset + widget_width * 0.5
		width_offset = width_offset + widget_width + slot_spacing
		widget.element.dirty = true
	end

	self:_set_dirty()
end

GamepadConsumableUI.on_gamepad_activated = function (self)
	self:set_visible(true)
	self:_set_dirty()
end

GamepadConsumableUI.on_gamepad_deactivated = function (self)
	self:set_visible(false)
	self:_set_dirty()
end

return
