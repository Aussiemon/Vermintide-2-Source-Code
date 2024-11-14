﻿-- chunkname: @scripts/ui/hud_ui/gamepad_equipment_ui.lua

local definitions = local_require("scripts/ui/hud_ui/gamepad_equipment_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local inventory_slot_backgrounds = definitions.inventory_slot_backgrounds
local animation_definitions = definitions.animations_definitions

GamePadEquipmentUI = class(GamePadEquipmentUI)

local AMMO_PRESENTATION_DURATION = 2
local slot_size = definitions.slot_size
local NUM_SLOTS = definitions.NUM_SLOTS
local input_actions_by_slot = {
	slot_grenade = "wield_5",
	slot_healthkit = "wield_3",
	slot_melee = "wield_1",
	slot_potion = "wield_4",
	slot_ranged = "wield_2",
}
local ammo_colors = {
	normal = Colors.get_color_table_with_alpha("white", 255),
	empty = Colors.get_color_table_with_alpha("red", 255),
	focus = Colors.get_color_table_with_alpha("font_default", 150),
	unfocused = Colors.get_color_table_with_alpha("font_default", 150),
}

local function sort_by_console_hud_index(a, b)
	local a_console_hud_index = a.console_hud_index or 0
	local b_console_hud_index = b.console_hud_index or 0

	return a_console_hud_index < b_console_hud_index
end

local function is_dark_pact()
	local local_player_party = Managers.party:get_local_player_party()
	local side = Managers.state.side.side_by_party[local_player_party]

	return side and side:name() == "dark_pact"
end

GamePadEquipmentUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	self._animations = {}
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = false,
	}
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.cleanui = ingame_ui_context.cleanui
	self._retained_elements_visible = false

	local player = ingame_ui_context.player

	self.player = player
	self._game_options_dirty = true
	self._reload_attempts = 0

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "input_changed", "event_input_changed")
	event_manager:register(self, "swap_equipment_from_storage", "event_swap_equipment_from_storage")
	event_manager:register(self, "on_game_options_changed", "_set_game_options_dirty")
	self:_update_game_options()
end

GamePadEquipmentUI._create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local frame_widgets = {}
	local frame_widgets_by_name = {}
	local ammo_widgets = {}
	local ammo_widgets_by_name = {}
	local unused_widgets = {}
	local slot_widgets = {}
	local career_widgets = {}
	local static_widgets = {}

	for name, definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		static_widgets[#static_widgets + 1] = widget
	end

	for name, definition in pairs(definitions.career_widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		career_widgets[name] = widget
		static_widgets[#static_widgets + 1] = widget
	end

	for i, definition in ipairs(definitions.slot_widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets[i] = widget
		unused_widgets[i] = widget
		slot_widgets[i] = widget
	end

	for name, definition in pairs(definitions.ammo_widget_definitions) do
		local widget = UIWidget.init(definition)

		ammo_widgets[#ammo_widgets + 1] = widget
		ammo_widgets_by_name[name] = widget
		widgets_by_name[name] = widget
	end

	for name, definition in pairs(definitions.frame_definitions) do
		local widget = UIWidget.init(definition)

		frame_widgets[#frame_widgets + 1] = widget
		frame_widgets_by_name[name] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._ammo_widgets = ammo_widgets
	self._ammo_widgets_by_name = ammo_widgets_by_name
	self._frame_widgets = frame_widgets
	self._frame_widgets_by_name = frame_widgets_by_name
	self._static_widgets = static_widgets
	self._unused_widgets = unused_widgets
	self._slot_widgets = slot_widgets
	self._career_widgets = career_widgets
	self._ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	local extra_storage_icon_widgets = {}

	for i, widget_def in ipairs(definitions.extra_storage_icon_definitions) do
		extra_storage_icon_widgets[i] = UIWidget.init(widget_def)
	end

	self._extra_storage_icon_widgets = extra_storage_icon_widgets
	widgets_by_name.overcharge_background.style.texture_id.color = {
		100,
		150,
		150,
		150,
	}
	widgets_by_name.overcharge.style.texture_id.color = Colors.get_color_table_with_alpha("font_title", 255)
	self._added_items = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self:event_input_changed()
	self:_set_widget_visibility(self._ammo_widgets_by_name.reload_tip_text, false)
	self:set_visible(true)
	self:set_dirty()

	self._num_added_items = 0
end

GamePadEquipmentUI.event_swap_equipment_from_storage = function (self, slot_name, additional_items)
	if slot_name ~= "slot_grenade" then
		return
	end

	self._widgets_by_name.extra_storage_bg.style.texture.color[1] = 163
	self._time_fade_storage_slots = Managers.time:time("ui") + 2

	local widgets = self._extra_storage_icon_widgets

	for i = 1, #widgets do
		local widget = widgets[i]
		local item = additional_items[i]

		if item then
			local hud_icon = item.gamepad_hud_icon
			local style = widget.style
			local content = widget.content

			content.visible = true
			content.texture_icon = hud_icon
			content.texture_glow = hud_icon .. "_glow"
			style.texture_icon.color[1] = 255

			local color_src = Colors.color_definitions[item.key] or Colors.color_definitions.black
			local color_dst = style.texture_glow.color

			color_dst[1] = 255
			color_dst[2] = color_src[2]
			color_dst[3] = color_src[3]
			color_dst[4] = color_src[4]
		else
			widget.content.visible = false
		end
	end
end

GamePadEquipmentUI.event_input_changed = function (self)
	local input_action = "wield_switch_1"
	local widget = self._widgets_by_name.weapon_slot

	self:_set_switch_input(widget, input_action)
	self:_set_widget_dirty(widget)

	local prefix = "wield_"

	for idx, widget in pairs(self._slot_widgets) do
		local input_action = prefix .. idx + 2

		self:_set_slot_input(widget, input_action)
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI._set_switch_input = function (self, widget, input_action)
	local texture_data, input_text, prefix_text = self:_get_input_texture_data(input_action)
	local text_length = input_text and UTF8Utils.string_length(input_text) or 0
	local max_length = 40
	local style = widget.style
	local content = widget.content
	local input_style = style.input_text
	local ui_renderer = self.ui_renderer

	content.input_action = input_action

	if texture_data then
		input_text = nil

		local texture = texture_data.texture
		local size = texture_data.size

		content.wield_switch_id = texture
		content.input_text = ""

		local wield_switch_style = style.wield_switch
		local texture_size = wield_switch_style.texture_size

		texture_size[1] = size[1]
		texture_size[2] = size[2]
	elseif input_text then
		content.input_text = UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
		content.wield_switch_id = nil
	end
end

GamePadEquipmentUI._set_slot_input = function (self, widget, input_action)
	local texture_data, input_text, prefix_text = self:_get_input_texture_data(input_action)
	local text_length = input_text and UTF8Utils.string_length(input_text) or 0
	local max_length = 40
	local style = widget.style
	local content = widget.content
	local input_style = style.input_text
	local ui_renderer = self.ui_renderer

	if input_text then
		content.input_text = UIRenderer.crop_text_width(ui_renderer, input_text, max_length, input_style)
	end
end

GamePadEquipmentUI._get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if IS_WINDOWS and gamepad_active then
		platform = "xb1"
	elseif IS_XB1 and not gamepad_active then
		platform = "win32"
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)

	if not keymap_binding then
		Application.warning(string.format("[GamePadEquipmentUI] There is no keymap for %q on %q", input_action, platform))

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
		button_name = is_button_unassigned and "" or Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index)

		if IS_XB1 then
			button_name = string.upper(button_name)
		end

		return nil, button_name, prefix_text
	elseif device_type == "mouse" then
		button_name = is_button_unassigned and "" or Mouse.button_name(key_index)

		return nil, button_name, prefix_text
	elseif device_type == "gamepad" then
		button_name = is_button_unassigned and "" or Pad1.button_name(key_index)

		if UISettings.use_ps4_input_icons and IS_WINDOWS then
			platform = "win32_ps4"
		end

		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, ""
end

GamePadEquipmentUI._update_widgets = function (self)
	local slot_widgets = self._slot_widgets

	for index, widget in ipairs(slot_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI._get_wield_scroll_input = function (self)
	local player = self.player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local peer_id = player:network_id()
	local input_extension = ScriptUnit.extension(player_unit, "input_system")

	return input_extension:get_last_scroll_value()
end

GamePadEquipmentUI._set_wielded_item = function (self, item_name, force_select)
	local scroll_dir = self:_get_wield_scroll_input()
	local added_items = self._added_items

	for _, data in ipairs(added_items) do
		local was_wielded = data.item_name == self._wielded_item_name
		local is_wielded = data.item_name == item_name
		local widget = data.widget

		widget.content.selected = is_wielded

		local slot_name = data.slot_name

		if is_wielded then
			local ammo_focus = slot_name == "slot_ranged"

			self:_set_ammo_text_focus(ammo_focus)
			self:_add_animation(slot_name .. "_wield_anim", widget, widget, "_animate_slot_wield")
		elseif was_wielded then
			self:_add_animation(slot_name .. "_wield_anim", widget, widget, "_animate_slot_unwield")
		end

		data.is_wielded = is_wielded
	end

	self._wielded_item_name = item_name
end

local allowed_equipment_slots = {
	slot_grenade = true,
	slot_healthkit = true,
	slot_melee = false,
	slot_potion = true,
	slot_ranged = false,
}
local sorted_buffs = {}
local widgets_to_remove = {}
local verified_widgets = {}

GamePadEquipmentUI._update_equipment_lookup = function (self, equipment, inventory_extension)
	self._equipment_lookup = self._equipment_lookup or {}
	self._equipment_lookup.additional_items_lookup = self._equipment_lookup.additional_items_lookup or {}

	local equipment_lookup = self._equipment_lookup

	equipment_lookup.wielded_slot = equipment.wielded_slot

	local additional_items_lookup = equipment_lookup.additional_items_lookup
	local additional_items_table = inventory_extension:get_additional_items_table()
	local item_template
	local equipment_slots = equipment.slots

	for slot_name, _ in pairs(allowed_equipment_slots) do
		item_template = equipment_slots[slot_name] and inventory_extension:get_item_template(equipment_slots[slot_name])
		equipment_lookup[slot_name] = item_template and item_template.name

		local slot_additional_items = additional_items_table and additional_items_table[slot_name]

		if slot_additional_items then
			local additional_items = slot_additional_items.items
			local item_data = additional_items[1]

			additional_items_lookup[slot_name] = item_data and item_data.key
		else
			additional_items_lookup[slot_name] = nil
		end
	end

	local ranged_slot_data = equipment_slots.slot_ranged

	if ranged_slot_data and ranged_slot_data.item_data then
		local item_template = BackendUtils.get_item_template(ranged_slot_data.item_data)
		local ammo_count, remaining_ammo, using_single_clip = self:_get_ammunition_count(ranged_slot_data.left_unit_1p, ranged_slot_data.right_unit_1p, item_template)

		equipment_lookup.ammo_count = ammo_count
		equipment_lookup.remaining_ammo = remaining_ammo
	end

	local grenade_slot_data = equipment_slots.slot_grenade

	if grenade_slot_data and grenade_slot_data.item_data then
		local item_count = inventory_extension:get_total_item_count("slot_grenade")

		equipment_lookup.grenade_count = item_count
	end
end

GamePadEquipmentUI._check_equipment_changed = function (self, equipment, inventory_extension)
	if not self._equipment_lookup then
		self:_update_equipment_lookup(equipment, inventory_extension)

		return true
	end

	if self._equipment_lookup.wielded_slot ~= equipment.wielded_slot then
		self:_update_equipment_lookup(equipment, inventory_extension)

		return true
	end

	local item_template, item_name, saved_item_name
	local equipment_slots = equipment.slots
	local additional_items_table = inventory_extension:get_additional_items_table()
	local equipment_lookup = self._equipment_lookup
	local additional_items_lookup = equipment_lookup.additional_items_lookup

	for slot_name, _ in pairs(allowed_equipment_slots) do
		local slot_data = equipment_slots[slot_name]

		item_template = slot_data and inventory_extension:get_item_template(slot_data)
		item_name = item_template and item_template.name
		saved_item_name = equipment_lookup[slot_name]

		if item_name ~= saved_item_name then
			self:_update_equipment_lookup(equipment, inventory_extension)

			return true
		end

		local slot_additional_items = additional_items_table[slot_name]

		if slot_additional_items then
			local additional_items = slot_additional_items.items
			local additional_item = additional_items[1]
			local additional_item_name = additional_item and additional_item.key

			if additional_items_lookup[slot_name] ~= additional_item_name then
				self:_update_equipment_lookup(equipment, inventory_extension)

				return true
			end
		end
	end

	local ranged_slot_data = equipment_slots.slot_ranged

	if ranged_slot_data and ranged_slot_data.item_data then
		local item_template = BackendUtils.get_item_template(ranged_slot_data.item_data)
		local ammo_count, remaining_ammo, using_single_clip = self:_get_ammunition_count(ranged_slot_data.left_unit_1p, ranged_slot_data.right_unit_1p, item_template)

		if equipment_lookup.ammo_count ~= ammo_count then
			self:_update_equipment_lookup(equipment, inventory_extension)

			return true
		end

		if equipment_lookup.remaining_ammo ~= remaining_ammo then
			self:_update_equipment_lookup(equipment, inventory_extension)

			return true
		end
	end

	local grenade_slot_data = equipment_slots.slot_grenade

	if grenade_slot_data and grenade_slot_data.item_data and inventory_extension:has_additional_item_slots("slot_grenade") then
		local item_count = inventory_extension:get_total_item_count("slot_grenade")

		if equipment_lookup.grenade_count ~= item_count then
			self:_update_equipment_lookup(equipment, inventory_extension)

			return true
		end
	end

	return false
end

GamePadEquipmentUI._sync_player_equipment = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local use_gamepad_hud_layout = UISettings.use_gamepad_hud_layout

	if use_gamepad_hud_layout == "never" or use_gamepad_hud_layout == "auto" and not gamepad_active then
		return
	end

	local player = self.player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local peer_id = player:network_id()
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()

	if not equipment then
		return
	end

	if not self:_check_equipment_changed(equipment, inventory_extension) then
		return
	end

	table.clear(verified_widgets)

	local inventory_modified = false
	local wielded_item_name
	local equipment_slots = equipment.slots
	local wielded = equipment.wielded
	local inventory_slots = InventorySettings.slots
	local num_inventory_slots = #inventory_slots
	local added_items = self._added_items

	for i = 1, num_inventory_slots do
		local slot = inventory_slots[i]
		local slot_name = slot.name
		local slot_data = equipment_slots[slot_name]
		local slot_visible = slot_data and true or false
		local item_data = slot_data and slot_data.item_data
		local item_name = item_data and item_data.name
		local is_wielded = item_name and wielded == item_data or false

		if is_wielded then
			local master_item = item_data
			local slot_type = master_item.slot_type
			local widget = self._widgets_by_name.weapon_slot
			local content = widget.content
			local style = widget.style

			content.wielded_slot = slot_type

			if self._wielded_slot_name ~= slot_name then
				if slot_type == "melee" or slot_type == "ranged" then
					self._weapon_was_wielded = true

					self:_add_animation("weapon_slot", widget, widget, "_animate_weapon_wield", 1)
				elseif self._weapon_was_wielded then
					self._weapon_was_wielded = false

					self:_add_animation("weapon_slot", widget, widget, "_animate_weapon_unwield", 4)
				end
			end

			self._wielded_slot_name = slot_name
		end

		if allowed_equipment_slots[slot_name] then
			local widget_id = 0
			local verified = false

			for j = 1, #added_items do
				local data = added_items[j]
				local same_item = data.item_name == item_name
				local same_slot = data.slot_name == slot_name

				if same_slot then
					widget_id = j
				end

				if same_item then
					if not verified_widgets[j] then
						verified = true
						verified_widgets[j] = true

						break
					end
				elseif item_name and same_slot then
					verified = true
					verified_widgets[j] = true

					self:_add_item(slot_data, data)

					widget_id = j
					inventory_modified = true

					break
				end
			end

			if not verified and slot_data ~= nil then
				self:_add_item(slot_data)

				widget_id = #added_items
				verified_widgets[#added_items] = true
				inventory_modified = true
			end

			if is_wielded then
				wielded_item_name = item_name
			end

			if slot_name == "slot_grenade" and item_data and widget_id > 0 then
				local has_additional_slots = inventory_extension:has_additional_item_slots(slot_name)
				local item_count = inventory_extension:get_total_item_count(slot_name)
				local hud_slot = added_items[widget_id]
				local widget = hud_slot and hud_slot.widget

				if widget then
					local content = widget.content
					local item_count = inventory_extension:get_total_item_count(slot_name)

					if content.item_count ~= item_count then
						content.item_count = item_count
						content.use_count_text = "x" .. item_count
						content.has_additional_slots = has_additional_slots

						self:_set_widget_dirty(widget)
					end

					local can_swap = inventory_extension:can_swap_from_storage(slot_name, SwapFromStorageType.Unique)

					if content.can_swap ~= can_swap then
						content.can_swap = can_swap

						self:_set_widget_dirty(widget)
					end
				end
			elseif slot_name == "slot_potion" and item_data and widget_id > 0 then
				local hud_slot = added_items[widget_id]
				local widget = hud_slot and hud_slot.widget

				if widget then
					local content = widget.content
					local style = widget.style
					local additional_items = inventory_extension:get_additional_items(slot_name)

					if additional_items then
						local next_additional_item = additional_items[1]

						if next_additional_item then
							local hud_icon = next_additional_item.gamepad_hud_icon

							content.secondary_texture_icon = hud_icon
							content.secondary_texture_icon_glow = hud_icon .. "_glow"

							local inventory_consumable_slot_colors = UISettings.inventory_consumable_slot_colors
							local default_background_color = {
								255,
								0,
								0,
								0,
							}
							local default_glow_color = {
								255,
								255,
								255,
								255,
							}
							local slot_background_color = inventory_consumable_slot_colors[next_additional_item.key]

							if slot_background_color then
								style.secondary_texture_icon.color = slot_background_color
								style.secondary_texture_icon_glow.color = {
									255,
									0,
									0,
									0,
								}
							else
								style.secondary_texture_icon.color = default_background_color
								style.secondary_texture_icon_glow.color = default_glow_color
							end

							self:_set_widget_dirty(widget)
						else
							content.secondary_texture_icon = nil
							content.secondary_texture_icon_glow = nil

							self:_set_widget_dirty(widget)
						end
					else
						content.secondary_texture_icon = nil
						content.secondary_texture_icon_glow = nil

						self:_set_widget_dirty(widget)
					end
				end
			end
		else
			if slot_name == "slot_ranged" and item_data then
				self:_update_ammo_count(item_data, slot_data, player_unit)
				self:_set_ammo_text_focus(is_wielded)
			end

			if is_wielded then
				wielded_item_name = item_name
			end
		end
	end

	table.clear(widgets_to_remove)

	for i = 1, #added_items do
		if not verified_widgets[i] then
			widgets_to_remove[#widgets_to_remove + 1] = i
		end
	end

	local index_mod = 0

	for i = 1, #widgets_to_remove do
		local index = widgets_to_remove[i] - index_mod

		self:_remove_item(index)

		index_mod = index_mod + 1
		inventory_modified = true
	end

	if inventory_modified then
		self:_update_widgets()
		table.sort(added_items, sort_by_console_hud_index)
	end

	if wielded_item_name and self._wielded_item_name ~= wielded_item_name or inventory_modified then
		wielded_item_name = wielded_item_name or self._wielded_item_name

		self:_set_wielded_item(wielded_item_name, inventory_modified)
	end
end

GamePadEquipmentUI._update_ammo_count = function (self, item_data, slot_data, player_unit)
	local item_template = BackendUtils.get_item_template(item_data)
	local ammo_widgets_by_name = self._ammo_widgets_by_name
	local draw_overheat = false

	if item_template.ammo_data then
		local ammo_count, remaining_ammo, using_single_clip = self:_get_ammunition_count(slot_data.left_unit_1p, slot_data.right_unit_1p, item_template)
		local ammo_text_clip_widget = ammo_widgets_by_name.ammo_text_clip
		local content = ammo_text_clip_widget.content
		local ammo_empty = ammo_count + remaining_ammo == 0
		local ammo_changed = false

		if self._ammo_count ~= ammo_count then
			self._ammo_count = ammo_count

			local widget = ammo_widgets_by_name.ammo_text_clip
			local content = widget.content

			content.text = tostring(ammo_count)

			self:_set_widget_dirty(widget)

			ammo_changed = true
		end

		if self._remaining_ammo ~= remaining_ammo then
			self._remaining_ammo = remaining_ammo

			local widget = ammo_widgets_by_name.ammo_text_remaining
			local content = widget.content

			content.text = tostring(remaining_ammo)

			self:_set_widget_dirty(widget)

			ammo_changed = true
		end

		if ammo_changed then
			self._ammo_counter_fade_delay = AMMO_PRESENTATION_DURATION
			self._ammo_counter_fade_progress = 1

			self:_set_ammo_counter_alpha(255)

			local ammo_text_color = ammo_empty and ammo_colors.empty or ammo_colors.normal

			self:_set_ammo_counter_color(ammo_text_color)
			self:set_dirty()
		end
	else
		local has_overcharge, overcharge_fraction, threshold_fraction = self:_get_overcharge_amount(player_unit)

		if self._overcharge_fraction ~= overcharge_fraction then
			self._overcharge_fraction = overcharge_fraction

			self:_set_overheat_fraction(overcharge_fraction)
		end

		draw_overheat = true
	end

	if self._draw_overheat ~= draw_overheat then
		self._draw_overheat = draw_overheat

		self:_show_overheat_meter(draw_overheat)
	end
end

GamePadEquipmentUI._animate_ammo_counter = function (self, dt)
	local ammo_counter_fade_delay = self._ammo_counter_fade_delay

	if ammo_counter_fade_delay then
		ammo_counter_fade_delay = math.max(ammo_counter_fade_delay - dt, 0)

		if ammo_counter_fade_delay == 0 then
			self._ammo_counter_fade_delay = nil
		else
			self._ammo_counter_fade_delay = ammo_counter_fade_delay
		end

		return
	end

	local ammo_counter_fade_progress = self._ammo_counter_fade_progress

	if not ammo_counter_fade_progress then
		return
	end

	ammo_counter_fade_progress = math.max(ammo_counter_fade_progress - 0.01, 0)

	local alpha = 100 + 155 * ammo_counter_fade_progress

	self:_set_ammo_counter_alpha(alpha)

	if ammo_counter_fade_progress == 0 then
		self._ammo_counter_fade_progress = nil
	else
		self._ammo_counter_fade_progress = ammo_counter_fade_progress
	end

	return true
end

GamePadEquipmentUI._set_ammo_counter_alpha = function (self, alpha)
	local ammo_widgets_by_name = self._ammo_widgets_by_name
	local ammo_clip_widget = ammo_widgets_by_name.ammo_text_clip
	local ammo_clip_widget_style = ammo_clip_widget.style.text
	local clip_text_color = ammo_clip_widget_style.text_color

	clip_text_color[1] = alpha

	self:_set_widget_dirty(ammo_clip_widget)

	local ammo_remaining_widget = ammo_widgets_by_name.ammo_text_remaining
	local ammo_remaining_widget_style = ammo_remaining_widget.style.text
	local remaining_text_color = ammo_remaining_widget_style.text_color

	remaining_text_color[1] = alpha

	self:_set_widget_dirty(ammo_remaining_widget)

	local ammo_center_widget = ammo_widgets_by_name.ammo_text_center
	local ammo_center_widget_style = ammo_center_widget.style.text
	local center_text_color = ammo_center_widget_style.text_color

	center_text_color[1] = alpha

	self:_set_widget_dirty(ammo_center_widget)
	self:set_dirty()
end

GamePadEquipmentUI._set_ammo_counter_color = function (self, color)
	local ammo_clip_widget = self._ammo_widgets_by_name.ammo_text_clip
	local ammo_clip_widget_style = ammo_clip_widget.style.text
	local clip_text_color = ammo_clip_widget_style.text_color

	clip_text_color[2] = color[2]
	clip_text_color[3] = color[3]
	clip_text_color[4] = color[4]

	self:_set_widget_dirty(ammo_clip_widget)

	local ammo_remaining_widget = self._ammo_widgets_by_name.ammo_text_remaining
	local ammo_remaining_widget_style = ammo_remaining_widget.style.text
	local remaining_text_color = ammo_remaining_widget_style.text_color

	remaining_text_color[2] = color[2]
	remaining_text_color[3] = color[3]
	remaining_text_color[4] = color[4]

	self:_set_widget_dirty(ammo_remaining_widget)

	local ammo_center_widget = self._ammo_widgets_by_name.ammo_text_center
	local ammo_center_widget_style = ammo_center_widget.style.text
	local center_text_color = ammo_center_widget_style.text_color

	center_text_color[2] = color[2]
	center_text_color[3] = color[3]
	center_text_color[4] = color[4]

	self:_set_widget_dirty(ammo_center_widget)
	self:set_dirty()
end

GamePadEquipmentUI._set_ammo_text_focus = function (self, focus)
	if self._draw_overheat and self._overcharge_fraction ~= nil then
		local multiplier = 1
		local color = focus and ammo_colors.focus or ammo_colors.unfocused
		local widgets_by_name = self._widgets_by_name
		local fg_widget = widgets_by_name.overcharge
		local bg_widget = widgets_by_name.overcharge_background
		local fg_color = fg_widget.style.texture_id.color
		local bg_color = bg_widget.style.texture_id.color

		fg_color[2] = color[2] * multiplier
		fg_color[3] = color[3] * multiplier
		fg_color[4] = color[4] * multiplier

		self:_set_widget_dirty(fg_widget)
		self:_set_widget_dirty(bg_widget)
		self:set_dirty()
	end

	self._ammo_dirty = true
end

GamePadEquipmentUI._get_ammunition_count = function (self, left_hand_wielded_unit, right_hand_wielded_unit, item_template)
	local ammo_extension

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
	local single_clip = ammo_extension:using_single_clip()

	return ammo_count, remaining_ammo, single_clip
end

GamePadEquipmentUI._get_overcharge_amount = function (self, player_unit)
	local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")
	local overcharge_fraction = overcharge_extension:overcharge_fraction()
	local threshold_fraction = overcharge_extension:threshold_fraction()
	local anim_blend_overcharge = overcharge_extension:get_anim_blend_overcharge()

	return true, overcharge_fraction, threshold_fraction, anim_blend_overcharge
end

GamePadEquipmentUI._add_animation = function (self, name, widget, style, func_name, animation_duration)
	local animations = self._animations
	local inventory_hud_settings = UISettings.inventory_hud
	local total_time = animation_duration or inventory_hud_settings.equip_animation_duration
	local animation = animations[name]

	if animation then
		animation.total_time = total_time
		animation.time = 0
		animation.func = func_name
	else
		animations[name] = {
			time = 0,
			total_time = total_time,
			style = style,
			widget = widget,
			func = func_name,
		}
	end
end

GamePadEquipmentUI._update_animations = function (self, dt, t)
	local t_until_fade = self._time_fade_storage_slots

	if t_until_fade then
		local progress = math.clamp(t_until_fade - t, 0, 1)
		local widgets = self._extra_storage_icon_widgets

		for i = 1, #widgets do
			local widget = widgets[i]
			local style = widget.style

			style.texture_icon.color[1] = 255 * progress
			style.texture_glow.color[1] = 128 * progress
		end

		local bg_widget = self._widgets_by_name.extra_storage_bg

		bg_widget.style.texture.color[1] = 189 * progress

		self:_set_widget_dirty(bg_widget)

		if progress == 0 then
			self._time_fade_storage_slots = nil
		end
	end

	local animations = self._animations
	local dirty = false

	for name, animation_data in pairs(animations) do
		local anim_func_name = animation_data.func

		animations[name] = self[anim_func_name](self, animation_data, dt)

		local widget = animation_data.widget

		self:_set_widget_dirty(widget)

		dirty = true
	end

	return dirty
end

GamePadEquipmentUI._animate_weapon_wield = function (self, animation_data, dt)
	local widget = animation_data.widget
	local total_time = animation_data.total_time
	local time = animation_data.time

	time = time + dt

	local progress = math.min(time / total_time, 1)
	local anim_progress_input = math.easeInCubic(progress)
	local anim_progress_glow = math.easeOutCubic(progress)

	widget.style.melee_weapon_texture.color[2] = 255 - 192 * anim_progress_input
	widget.style.melee_weapon_texture.color[3] = 255 - 192 * anim_progress_input
	widget.style.melee_weapon_texture.color[4] = 255 - 192 * anim_progress_input
	widget.style.ranged_weapon_texture.color[2] = 255 - 192 * anim_progress_input
	widget.style.ranged_weapon_texture.color[3] = 255 - 192 * anim_progress_input
	widget.style.ranged_weapon_texture.color[4] = 255 - 192 * anim_progress_input
	widget.style.melee_weapon_texture_glow.color[1] = 255 - 255 * anim_progress_glow
	widget.style.ranged_weapon_texture_glow.color[1] = 255 - 255 * anim_progress_glow
	animation_data.time = time

	return progress < 1 and animation_data or nil
end

GamePadEquipmentUI._animate_weapon_unwield = function (self, animation_data, dt)
	local widget = animation_data.widget
	local total_time = animation_data.total_time
	local time = animation_data.time

	time = time + dt

	local progress = math.min(time / total_time, 1)
	local anim_progress = math.easeInCubic(1 - progress)
	local anim_progress_input = math.easeOutCubic(progress)

	widget.style.highlight_weapon_texture.color[1] = 255 * anim_progress
	animation_data.time = time

	return progress < 1 and animation_data or nil
end

GamePadEquipmentUI._animate_slot_wield = function (self, animation_data, dt)
	local widget = animation_data.widget
	local total_time = animation_data.total_time
	local time = animation_data.time

	time = time + dt

	local progress = math.min(time / total_time, 1)
	local anim_progress = math.easeOutCubic(progress)
	local anim_progress_input = math.easeInCubic(1 - progress)

	widget.style.texture_icon.color[2] = 128 + 127 * anim_progress
	widget.style.texture_icon.color[3] = 128 + 127 * anim_progress
	widget.style.texture_icon.color[4] = 128 + 127 * anim_progress
	widget.style.texture_selected.color[1] = 255 * anim_progress
	widget.style.texture_selected_left_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_up_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_right_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_left_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_left_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_left_arrow.color[4] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[4] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[4] = 128 + 127 * anim_progress
	animation_data.time = time

	return progress < 1 and animation_data or nil
end

GamePadEquipmentUI._animate_slot_unwield = function (self, animation_data, dt)
	local widget = animation_data.widget
	local total_time = animation_data.total_time
	local time = animation_data.time

	time = time + dt

	local progress = math.min(time / total_time, 1)
	local anim_progress = math.easeInCubic(1 - progress)
	local anim_progress_input = math.easeOutCubic(progress)

	if widget.content.is_filled then
		widget.style.texture_icon.color[2] = 128 + 127 * anim_progress
		widget.style.texture_icon.color[3] = 128 + 127 * anim_progress
		widget.style.texture_icon.color[4] = 128 + 127 * anim_progress
	else
		widget.style.texture_icon.color[1] = 255 * anim_progress
		widget.style.texture_icon.color[2] = 128 + 127 * anim_progress
		widget.style.texture_icon.color[3] = 128 + 127 * anim_progress
		widget.style.texture_icon.color[4] = 128 + 127 * anim_progress
	end

	widget.style.texture_selected.color[1] = 255 * anim_progress
	widget.style.texture_selected_left_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_up_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_right_arrow_glow.color[1] = 255 * anim_progress
	widget.style.texture_selected_left_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_left_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_left_arrow.color[4] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_up_arrow.color[4] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[2] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[3] = 128 + 127 * anim_progress
	widget.style.texture_selected_right_arrow.color[4] = 128 + 127 * anim_progress
	animation_data.time = time

	return progress < 1 and animation_data or nil
end

GamePadEquipmentUI._add_item = function (self, slot_data, data)
	local num_added_items = self._num_added_items or 0
	local use_exsiting_data = data ~= nil

	if not use_exsiting_data and num_added_items >= NUM_SLOTS then
		return
	end

	local slot_name = slot_data.id
	local slots_by_name = InventorySettings.slots_by_name
	local slot_settings = slots_by_name[slot_name]
	local console_hud_index = slot_settings.console_hud_index
	local widget

	if use_exsiting_data then
		widget = data.widget
	else
		for i, slot_widget in ipairs(self._slot_widgets) do
			if slot_widget.content.console_hud_index == console_hud_index then
				widget = slot_widget

				break
			end
		end

		UIRenderer.set_element_visible(self.ui_renderer, widget.element, true)
	end

	local widget_content = widget.content
	local widget_style = widget.style
	local color = widget_content.normal_color

	widget_content.is_filled = true

	local item_data = slot_data.item_data
	local item_name = item_data.name
	local hud_icon = item_data.gamepad_hud_icon
	local hud_icon_glow

	if slot_name == "slot_melee" then
		hud_icon = "hud_icon_melee"
	elseif slot_name == "slot_ranged" then
		hud_icon = "hud_icon_ranged"
	elseif hud_icon then
		hud_icon_glow = hud_icon .. "_glow"
	end

	local inventory_consumable_slot_colors = UISettings.inventory_consumable_slot_colors
	local default_background_color = inventory_consumable_slot_colors.default
	local slot_background_color = inventory_consumable_slot_colors[item_name] or default_background_color
	local background_color = widget_style.texture_selected.color

	background_color[2] = slot_background_color[2]
	background_color[3] = slot_background_color[3]
	background_color[4] = slot_background_color[4]

	local left_arrow_glow = widget_style.texture_selected_left_arrow_glow.color

	left_arrow_glow[2] = slot_background_color[2]
	left_arrow_glow[3] = slot_background_color[3]
	left_arrow_glow[4] = slot_background_color[4]

	local up_arrow_glow = widget_style.texture_selected_up_arrow_glow.color

	up_arrow_glow[2] = slot_background_color[2]
	up_arrow_glow[3] = slot_background_color[3]
	up_arrow_glow[4] = slot_background_color[4]

	local right_arrow_glow = widget_style.texture_selected_right_arrow_glow.color

	right_arrow_glow[2] = slot_background_color[2]
	right_arrow_glow[3] = slot_background_color[3]
	right_arrow_glow[4] = slot_background_color[4]
	widget_content.texture_icon = hud_icon or "icons_placeholder"
	widget_content.texture_selected = hud_icon_glow or "icons_placeholder"
	widget_style.texture_icon.color[1] = 255
	widget_style.texture_selected_left_arrow.color[1] = 255
	widget_style.texture_selected_up_arrow.color[1] = 255
	widget_style.texture_selected_right_arrow.color[1] = 255
	widget_style.texture_empty_slot.color[1] = 0
	data = data or {}
	data.console_hud_index = console_hud_index
	data.slot_name = slot_name
	data.item_name = item_name
	data.widget = widget
	data.wielded = false
	data.icon = hud_icon

	if not use_exsiting_data then
		local added_items = self._added_items

		table.insert(added_items, #added_items + 1, data)

		self._num_added_items = num_added_items + 1
	end
end

GamePadEquipmentUI._remove_item = function (self, index)
	local num_added_items = self._num_added_items or 0

	if num_added_items <= 0 then
		return
	end

	local added_items = self._added_items
	local data = table.remove(added_items, index)
	local slot_name = data.slot_name
	local widget = data.widget
	local widget_content = widget.content
	local widget_style = widget.style

	widget_content.is_filled = false
	widget_style.texture_icon.color[1] = 0
	widget_style.texture_arrow_left.color[1] = 0
	widget_style.texture_arrow_up.color[1] = 0
	widget_style.texture_arrow_right.color[1] = 0
	widget_style.texture_empty_slot.color[1] = 128

	local was_selected = widget_content.selected

	widget_content.selected = false

	local inventory_consumable_slot_colors = UISettings.inventory_consumable_slot_colors
	local default_background_color = inventory_consumable_slot_colors.default
	local background_color = widget_style.texture_background.color

	background_color[1] = 0
	background_color[2] = default_background_color[2]
	background_color[3] = default_background_color[3]
	background_color[4] = default_background_color[4]
	self._num_added_items = num_added_items - 1

	if was_selected then
		self:_add_animation(slot_name .. "_wield_anim", widget, widget, "_animate_slot_unwield")
	else
		widget.style.texture_selected.color[1] = 0
	end
end

GamePadEquipmentUI.set_position = function (self, x, y)
	local position = self.ui_scenegraph.pivot.local_position

	position[1] = x
	position[2] = y

	for _, widget in ipairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	for _, widget in ipairs(self._static_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("input_changed", self)
	event_manager:unregister("swap_equipment_from_storage", self)
	event_manager:unregister("on_game_options_changed", self)

	self._ui_animator = nil

	self:set_visible(false)
	print("[GamePadEquipmentUI] - Destroy")
end

GamePadEquipmentUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

GamePadEquipmentUI._set_elements_visible = function (self, visible)
	local ui_renderer = self.ui_renderer

	for _, widget in ipairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	for _, widget in ipairs(self._static_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	for _, widget in ipairs(self._ammo_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	for _, widget in ipairs(self._frame_widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self._retained_elements_visible = visible

	self:set_dirty()
end

GamePadEquipmentUI.update = function (self, dt, t)
	local dirty = false

	self:_update_game_options()

	local parent = self._parent
	local crosshair_position_x, crosshair_position_y = parent:get_crosshair_position()

	if self:_apply_crosshair_position(crosshair_position_x, crosshair_position_y) then
		dirty = true
	end

	if self:_update_animations(dt, t) then
		dirty = true
	end

	if self:_animate_ammo_counter(dt) then
		dirty = true
	end

	if dirty then
		self:set_dirty()
	end

	self:_handle_resolution_modified()
	self:_sync_player_equipment()
	self:_show_hold_to_reload(t)
	self:_handle_gamepad_activity()
	self:draw(dt)
	self._ui_animator:update(dt)
end

GamePadEquipmentUI._handle_career_change = function (self)
	local old_career_name = self._career_name
	local player = Managers.player:local_player()
	local player_unit = player and player.player_unit

	if not ALIVE[player_unit] then
		return
	end

	local career_ext = ScriptUnit.extension(player_unit, "career_system")

	self._career_name = career_ext:career_name()

	if self._career_name ~= old_career_name then
		for name, widget in pairs(self._career_widgets) do
			widget.content.visible = true

			self:_set_widget_dirty(widget)
		end

		return true
	end
end

GamePadEquipmentUI._handle_resolution_modified = function (self)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_modified()
	end
end

GamePadEquipmentUI._on_resolution_modified = function (self)
	for _, widget in ipairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	for _, widget in ipairs(self._static_widgets) do
		self:_set_widget_dirty(widget)
	end

	for _, widget in pairs(self._frame_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local most_recent_device = Managers.input:get_most_recent_device()
	local force_update = self.gamepad_active_last_frame == nil or gamepad_active and most_recent_device ~= self._most_recent_device

	if gamepad_active or IS_PS4 then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			self:_update_gamepad_input_button()
			self:event_input_changed()
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		self:_update_gamepad_input_button()
		self:event_input_changed()
	end

	self._most_recent_device = most_recent_device
end

GamePadEquipmentUI._set_game_options_dirty = function (self)
	self._game_options_dirty = true
end

GamePadEquipmentUI._update_game_options = function (self)
	if not self._game_options_dirty then
		return
	end

	self:_update_gamepad_input_button()
	self:event_input_changed()

	self._game_options_dirty = false
end

GamePadEquipmentUI._update_gamepad_input_button = function (self)
	local input_service = Managers.input:get_service("Player")
	local input_action = "weapon_reload_input"
	local fake_gamepad_active = true
	local button_texture_data, button_name, gamepad_keymap_binding, unassigned = UISettings.get_gamepad_input_texture_data(input_service, input_action, fake_gamepad_active)
	local widget = self._widgets_by_name.engineer_base
	local style = widget.style
	local content = widget.content
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if button_texture_data and gamepad_active then
		local texture = button_texture_data.texture

		content.reload_button_id = texture
		content.input_text = ""

		local reload_button_style = style.reload_button
		local reload_button_texture_size = reload_button_style.texture_size
		local size = button_texture_data.size

		reload_button_texture_size[1] = size[1]
		reload_button_texture_size[2] = size[2]
	else
		local max_length = 40
		local input_action = "weapon_reload"
		local keymap_binding = input_service:get_keymapping(input_action, "win32")

		if not keymap_binding then
			content.input_text = UIRenderer.crop_text_width(self.ui_renderer, Localize("unassigned_keymap"), max_length, input_style)
		else
			local device_type = keymap_binding[1]
			local key_index = keymap_binding[2]
			local input_style = style.input_text
			local input_text = ""

			if key_index ~= UNASSIGNED_KEY then
				local device = device_type == "mouse" and Mouse or Keyboard

				input_text = device.button_locale_name(key_index) or device.button_name(key_index) or Localize("lb_unknown")
			end

			content.input_text = UIRenderer.crop_text_width(self.ui_renderer, input_text, max_length, input_style)
		end
	end
end

GamePadEquipmentUI._handle_gamepad = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad") or not IS_WINDOWS

	if (not gamepad_active or UISettings.use_gamepad_hud_layout == "never") and UISettings.use_gamepad_hud_layout ~= "always" then
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

GamePadEquipmentUI.draw = function (self, dt)
	if not self._is_visible then
		return
	end

	local should_render = self:_handle_gamepad()

	if not should_render then
		return
	end

	local should_render = self:_handle_career_change() or should_render

	if not should_render then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.snap_pixel_positions = true
	render_settings.alpha_multiplier = self.panel_alpha_multiplier or alpha_multiplier

	for _, widget in ipairs(self._slot_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._extra_storage_icon_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.snap_pixel_positions = true

	for _, widget in ipairs(self._static_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.snap_pixel_positions = true

	for _, widget in ipairs(self._ammo_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self.frame_alpha_multiplier or alpha_multiplier
	render_settings.snap_pixel_positions = true

	for _, widget in ipairs(self._frame_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
	self._ammo_dirty = false
end

GamePadEquipmentUI._set_color = function (self, color, new_color, ignore_alpha)
	if not ignore_alpha then
		color[1] = new_color[1]
	end

	color[2] = new_color[2]
	color[3] = new_color[3]
	color[4] = new_color[4]
end

GamePadEquipmentUI.set_dirty = function (self)
	self._dirty = true

	if self.cleanui then
		self.cleanui.dirty = true
	end
end

GamePadEquipmentUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true

	if self.cleanui then
		self.cleanui.dirty = true
	end
end

GamePadEquipmentUI._set_overheat_fraction = function (self, fraction)
	local widget = self._widgets_by_name.overcharge
	local content = widget.content
	local uvs = content.texture_id.uvs

	uvs[2][1] = fraction

	local scenegraph_id = widget.scenegraph_id
	local scenegraph = self.ui_scenegraph[scenegraph_id]
	local default_scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = default_scenegraph.size
	local size = scenegraph.size

	size[1] = default_size[1] * fraction

	self:_set_widget_dirty(widget)
	self:set_dirty()
end

GamePadEquipmentUI._show_overheat_meter = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local ammo_widgets_by_name = self._ammo_widgets_by_name

	self:_set_widget_visibility(widgets_by_name.overcharge, false)
	self:_set_widget_visibility(widgets_by_name.overcharge_background, false)
	self:_set_widget_visibility(ammo_widgets_by_name.ammo_text_clip, not visible)
	self:_set_widget_visibility(ammo_widgets_by_name.ammo_text_remaining, not visible)
	self:_set_widget_visibility(ammo_widgets_by_name.ammo_text_center, not visible)
	self:set_dirty()
end

GamePadEquipmentUI._set_widget_visibility = function (self, widget, visible)
	widget.content.visible = visible

	self:_set_widget_dirty(widget)
end

GamePadEquipmentUI.set_alpha = function (self, alpha)
	self.render_settings.alpha_multiplier = alpha

	for widget_index, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._slot_widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._static_widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._ammo_widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._frame_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI.set_ammo_alpha = function (self, alpha)
	self.ammo_alpha_multiplier = alpha

	for widget_index, widget in pairs(self._ammo_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI.set_frame_alpha = function (self, alpha)
	self.frame_alpha_multiplier = alpha

	for widget_index, widget in pairs(self._frame_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI.set_panel_alpha = function (self, alpha)
	self.panel_alpha_multiplier = alpha

	for widget_index, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._slot_widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._static_widgets) do
		self:_set_widget_dirty(widget)
	end

	for widget_index, widget in pairs(self._ammo_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

GamePadEquipmentUI._apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "screen_bottom_pivot"
	local position = self.ui_scenegraph[scenegraph_id].local_position
	local dirty = false

	if position[1] ~= x or position[2] ~= y then
		dirty = true
	end

	position[1] = x
	position[2] = y

	if dirty then
		local widgets_by_name = self._widgets_by_name
		local ammo_widgets_by_name = self._ammo_widgets_by_name

		self:_set_widget_dirty(ammo_widgets_by_name.ammo_text_clip)
		self:_set_widget_dirty(ammo_widgets_by_name.ammo_text_remaining)
		self:_set_widget_dirty(ammo_widgets_by_name.ammo_text_center)
		self:_set_widget_dirty(widgets_by_name.overcharge)
		self:_set_widget_dirty(widgets_by_name.overcharge_background)
	end

	return dirty
end

GamePadEquipmentUI._show_hold_to_reload = function (self, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if (not gamepad_active or UISettings.use_gamepad_hud_layout == "never") and UISettings.use_gamepad_hud_layout ~= "always" then
		return
	end

	local player = self._is_spectator and self._spectated_player or self.player
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()
	local wielded_slot = equipment.wielded_slot
	local is_wielding_special_weapon = false
	local slot_data, item_data, item_template

	for _, temp_slot_data in pairs(equipment.slots) do
		local temp_item_data = temp_slot_data.item_data
		local temp_item_template = BackendUtils.get_item_template(temp_item_data)

		if temp_slot_data.id == wielded_slot then
			local unique_ammo_type = temp_item_template.ammo_data and temp_item_template.ammo_data.unique_ammo_type

			if unique_ammo_type then
				slot_data = temp_slot_data
				item_data = temp_item_data
				item_template = temp_item_template
				is_wielding_special_weapon = true
			end
		end
	end

	if not item_data or not slot_data or not item_template then
		return
	end

	local ammo_count, remaining_ammo, using_single_clip = self:_get_ammunition_count(slot_data.left_unit_1p, slot_data.right_unit_1p, item_template)
	local input_action = gamepad_active and "weapon_reload_hold_input" or "weapon_reload_hold"
	local reload_tip_widget = self._ammo_widgets_by_name.reload_tip_text
	local texture_data, input_text, prefix_text = self:_get_input_texture_data(input_action)
	local alpha = reload_tip_widget.style.text.text_color[1]
	local format_color = string.format("{#color(193,91,36, %d)}", alpha)
	local key_text = gamepad_active and string.format("$KEY;Player__%s:", input_action) or input_text

	reload_tip_widget.content.text = string.format(Localize("reload_tip"), format_color, key_text, "{#reset()}")

	local full_clip = ammo_count + remaining_ammo == item_template.ammo_data.max_ammo

	if is_wielding_special_weapon and not full_clip then
		if self._reload_attempts >= 3 then
			self._reload_tip_text_shown = true

			if not self._reload_tip_anim or self._ui_animator:is_animation_completed(self._reload_tip_anim) then
				self._reload_tip_anim = self._ui_animator:start_animation("show_reload_tip", reload_tip_widget, scenegraph_definition)
			end
		end

		self:_update_reload_ui_state(t, item_template)
	end

	self:_set_widget_dirty(reload_tip_widget)
end

GamePadEquipmentUI._update_reload_ui_state = function (self, t, item_template)
	local reload_tip_widget = self._ammo_widgets_by_name.reload_tip_text

	if not reload_tip_widget then
		return
	end

	local input_service = Managers.input:get_service("Player")
	local listening_duration = 5
	local gamepad_active = Managers.input:is_device_active("gamepad") or not IS_WINDOWS
	local input_action = gamepad_active and "weapon_reload_hold_input" or "weapon_reload_hold"

	if input_service:get(input_action) then
		if not self._ui_animator:is_animation_completed(self._reload_tip_anim) then
			return
		end

		if not self._listening_timer_start then
			self._listening_timer_start = t
		end

		if not self._reload_start_time then
			self._reload_start_time = t
		end
	else
		local reload_time = item_template.actions.weapon_reload.default.anim_time_scale
		local failed_reload = self._reload_start_time and reload_time > t - self._reload_start_time

		if failed_reload then
			self._reload_attempts = self._reload_attempts + 1
		end

		if self._reload_start_time then
			self._reload_start_time = nil
		end
	end

	local end_time = 0

	if self._listening_timer_start then
		end_time = self._listening_timer_start + listening_duration
	end

	if end_time ~= 0 and end_time < t or self._reload_tip_text_shown then
		self._listening_timer_start = nil
		self._reload_attempts = 0
		self._reload_tip_text_shown = false
	end
end
