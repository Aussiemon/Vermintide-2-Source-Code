ItemGridUI = class(InventoryGridUI)

local function tablefind_item_key(tab, item_key)
	for index, item in pairs(tab) do
		local key = item.name

		if item_key == key then
			return index
		end
	end
end

ItemGridUI.init = function (self, category_settings, widget, hero_name, career_index)
	self._platform = PLATFORM
	self._category_settings = category_settings
	self._widget = widget

	if career_index > #PROFILES_BY_NAME[hero_name].careers then
		career_index = 1
	end

	self._hero_name = hero_name
	self._career_index = career_index
	self._locked_items = {}
end

ItemGridUI.change_category = function (self, category_name, keep_page_index)
	self:clear_item_grid()

	local hero_name = self._hero_name
	local career_index = self._career_index
	local profile = SPProfiles[FindProfileIndex(hero_name)]
	local career = profile.careers[career_index]
	local career_name = career.name
	local is_slayer = career_name == "dr_slayer"

	if is_slayer and category_name == "ranged" then
		category_name = "melee"
	end

	for index, category in ipairs(self._category_settings) do
		if category.name == category_name then
			self:_on_category_index_change(index, keep_page_index)

			return
		end
	end
end

ItemGridUI.set_item_page = function (self, page_index)
	local total_item_pages = self._total_item_pages

	if total_item_pages < page_index or page_index < 1 then
		return
	end

	local widget = self._widget
	local content = widget.content
	local item_slots = content.slots
	local start_read_index = (page_index - 1) * item_slots + 1
	local items = self._items

	self:_populate_inventory_page(items, start_read_index)

	widget.content.page_text = page_index .. "/" .. total_item_pages
	self._selected_page_index = page_index
end

ItemGridUI.items = function (self)
	return self._items
end

ItemGridUI.get_page_info = function (self)
	return self._selected_page_index, self._total_item_pages
end

ItemGridUI.get_equipped_items = function (self, hero_name, career_index)
	local slots = InventorySettings.slots
	local equipped_items = {}
	local profile = SPProfiles[FindProfileIndex(hero_name)]
	local career = profile.careers[career_index]
	local career_name = career.name

	for _, slot in pairs(slots) do
		local slot_name = slot.name
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			equipped_items[item.backend_id] = item
		end
	end

	return equipped_items
end

ItemGridUI.apply_item_sorting_function = function (self, item_sort_func)
	self._item_sort_func = item_sort_func
end

ItemGridUI.set_locked_items_icon = function (self, locked_item_icon)
	self._locked_item_icon = locked_item_icon

	self:update_items_status()
end

ItemGridUI.disable_locked_items = function (self, disable)
	self._disable_locked_items = disable

	self:mark_locked_items(self._mark_locked_items)
end

ItemGridUI.lock_item_by_id = function (self, backend_id, reserve)
	self._locked_items[backend_id] = reserve
end

ItemGridUI.clear_locked_items = function (self)
	self._locked_items = {}
end

ItemGridUI.hide_slots = function (self, hide)
	self._hide_slots = hide

	self:update_items_status()
end

ItemGridUI.mark_locked_items = function (self, mark)
	self._mark_locked_items = mark

	self:update_items_status()
end

ItemGridUI.disable_unwieldable_items = function (self, disable)
	self._disable_unwieldable_items = disable
end

ItemGridUI.disable_equipped_items = function (self, disable)
	self._disable_equipped_items = disable

	self:mark_equipped_items(self._mark_equipped_items)
end

ItemGridUI.mark_equipped_items = function (self, mark)
	self._mark_equipped_items = mark

	self:update_items_status()
end

ItemGridUI.disable_item_drag = function (self)
	self._item_drag_disabled = true

	self:update_items_status()
end

ItemGridUI.update_items_status = function (self)
	local hero_name = self._hero_name
	local profile_index = FindProfileIndex(hero_name)
	local career_index = self._career_index
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	local locked_item_icon = self._locked_item_icon
	local locked_items = self._mark_locked_items and self._locked_items
	local equipped_items = self._mark_equipped_items and self:get_equipped_items(hero_name, career_index)
	local item_drag_disabled = self._item_drag_disabled
	local hide_slots = self._hide_slots
	local disable_locked_items = self._disable_locked_items
	local disable_equipped_items = self._disable_equipped_items
	local disable_unwieldable_items = self._disable_unwieldable_items
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local item_icon_name = "item_icon" .. name_sufix
			local locked_icon_name = "locked_icon" .. name_sufix
			local hotspot_name = "hotspot" .. name_sufix
			local item_content = content[hotspot_name]
			local item_style = style[item_icon_name]
			local item = content["item" .. name_sufix]
			local item_data = item and item.data
			local backend_id = item and item.backend_id
			local is_equipped = backend_id and equipped_items and equipped_items[backend_id] ~= nil
			local is_locked = backend_id and locked_items and locked_items[backend_id] ~= nil
			local can_wield_table = item_data and item_data.can_wield
			local can_wield = can_wield_table and table.contains(can_wield_table, career_name)
			item_content[locked_icon_name] = locked_item_icon

			if equipped_items then
				item_content.equipped = is_equipped
			else
				item_content.equipped = false
			end

			if locked_items then
				item_content.reserved = is_locked
			else
				item_content.reserved = false
			end

			local disable_button = false
			local drag_disabled = item_drag_disabled
			local saturated = false

			if is_locked then
				saturated = true

				if disable_locked_items then
					drag_disabled = true
					disable_button = true
				end
			end

			if not can_wield and disable_unwieldable_items then
				saturated = true
				item_content.unwieldable = true
			else
				item_content.unwieldable = false
			end

			if equipped_items and is_equipped and disable_equipped_items then
				drag_disabled = true
				disable_button = true
			end

			if not item then
				disable_button = true
			end

			item_content.disable_button = disable_button
			item_content.drag_disabled = drag_disabled
			item_content.hide_slot = hide_slots
			item_style.saturated = saturated
		end
	end

	local item_interface = Managers.backend:get_interface("items")

	if self._selected_item and item_interface:get_item_from_id(self._selected_item.backend_id) then
		self:set_item_selected(self._selected_item)
	end
end

ItemGridUI.has_item = function (self, item)
	local items = self._items

	if items then
		for _, item_in_grid in ipairs(items) do
			local backend_id = item_in_grid.backend_id

			if item.backend_id == backend_id then
				return true
			end
		end
	end

	return false
end

ItemGridUI.set_item_selected = function (self, item)
	self._selected_item = item
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	self._selected_item_row = nil
	self._selected_item_column = nil
	self._selected_item_equipped = nil

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local hotspot = content[hotspot_name]
			local grid_item = content["item" .. name_sufix]
			local is_selected = item and grid_item and item.backend_id == grid_item.backend_id
			local is_equipped = hotspot.equipped
			hotspot.is_selected = is_selected

			if is_selected then
				self._selected_item_row = i
				self._selected_item_column = k
				self._selected_item_equipped = is_equipped
			end
		end
	end
end

ItemGridUI.is_item_wieldable = function (self, item)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local hotspot = content[hotspot_name]
			local grid_item = content["item" .. name_sufix]

			if item and grid_item and item.backend_id == grid_item.backend_id then
				local is_equipped = hotspot.equipped
				local disable_button = hotspot.disable_button
				local unwieldable = hotspot.unwieldable
				local reserved = hotspot.reserved

				if not is_equipped and not disable_button and not unwieldable and not reserved then
					return true
				end

				return false
			end
		end
	end

	return false
end

ItemGridUI.handle_favorite_marking = function (self, input_service)
	if input_service and input_service:has("hotkey_mark_favorite_item") then
		local input_pressed = input_service:get("hotkey_mark_favorite_item")

		if input_pressed then
			local item = nil
			local gamepad_active = Managers.input:is_device_active("gamepad")

			if gamepad_active then
				item = self:selected_item()
			else
				item = self:get_item_hovered()
			end

			local backend_id = item and item.backend_id

			print("item", item, backend_id)

			if backend_id then
				local is_favorited = ItemHelper.is_favorite_backend_id(backend_id)

				if is_favorited then
					ItemHelper.unmark_backend_id_as_favorite(backend_id)

					return true
				else
					ItemHelper.mark_backend_id_as_favorite(backend_id)

					return true
				end
			end
		end
	end
end

ItemGridUI.handle_gamepad_selection = function (self, input_service)
	if not self._selected_item then
		return
	end

	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local selected_row = self._selected_item_row
	local selected_column = self._selected_item_column

	if selected_row and selected_column then
		local modified = false

		if selected_column > 1 and input_service:get("move_left_hold_continuous") then
			selected_column = selected_column - 1
			modified = true
		elseif selected_column < columns and input_service:get("move_right_hold_continuous") then
			selected_column = selected_column + 1
			modified = true
		end

		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			selected_row = selected_row - 1
			modified = true
		elseif selected_row < rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			modified = true
		end

		if modified then
			local name_sufix = "_" .. tostring(selected_row) .. "_" .. tostring(selected_column)
			local hotspot_name = "hotspot" .. name_sufix
			local hotspot = content[hotspot_name]
			local grid_item = content["item" .. name_sufix]

			if grid_item then
				self:set_item_selected(grid_item)

				return true
			end
		end
	end
end

ItemGridUI.get_item_in_slot = function (self, row_number, column_number)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		if i == row_number then
			for k = 1, columns, 1 do
				if k == column_number then
					local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)

					return content["item" .. name_sufix]
				end
			end
		end
	end
end

ItemGridUI.set_backend_id_selected = function (self, backend_id)
	local item_interface = Managers.backend:get_interface("items")
	local item = backend_id and item_interface:get_item_from_id(backend_id)

	self:set_item_selected(item)
end

ItemGridUI.selected_item = function (self)
	return self._selected_item, self._selected_item_equipped
end

ItemGridUI.add_item_to_slot_index = function (self, slot_index, item, optional_amount)
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns
	local row_index = math.floor((slot_index - 1) / columns) + 1
	local column_index = (slot_index - 1) % columns + 1
	local name_sufix = "_" .. tostring(row_index) .. "_" .. tostring(column_index)
	local item_icon_name = "item_icon" .. name_sufix
	local item_amount_name = "amount_text" .. name_sufix
	local locked_icon_name = "locked_icon" .. name_sufix
	local hotspot_name = "hotspot" .. name_sufix
	local item_content = content[hotspot_name]
	local item_style = style[item_icon_name]
	local backend_id = item and item.backend_id
	content["item" .. name_sufix] = item

	if item then
		local item_data = item.data
		local backend_items = Managers.backend:get_interface("items")
		local rarity = item_data.rarity

		if backend_id then
			rarity = backend_items:get_item_rarity(backend_id)
		end

		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)
		local rarity_texture_name = "rarity_texture" .. name_sufix

		if style[rarity_texture_name] then
			content[rarity_texture_name] = UISettings.item_rarity_textures[rarity]
		end

		local amount = nil

		if backend_id then
			amount = optional_amount or backend_items:get_item_amount(backend_id)
		elseif item.amount then
			amount = item.amount
		end

		if amount then
			local color_value_1, color_value_2, color_value_3 = nil

			if item.insufficient_amount then
				color_value_1 = 255
				color_value_2 = 0
				color_value_3 = 0
			else
				local amount_default_color = style[item_amount_name].default_color
				color_value_1 = amount_default_color[2]
				color_value_2 = amount_default_color[3]
				color_value_3 = amount_default_color[4]
			end

			local amount_text_color = style[item_amount_name].text_color

			self:_set_color_values(amount_text_color, color_value_1, color_value_2, color_value_3)
		else
			amount = ""
		end

		local item_tooltip_name = "item_tooltip" .. name_sufix
		content[item_tooltip_name] = display_name
		item_content[item_icon_name] = inventory_icon
		item_content[item_amount_name] = (item_data.can_stack and amount) or ""
		item_content[locked_icon_name] = self._locked_item_icon

		if not backend_id then
			item_content.reserved = true
			item_content.equipped = false
			item_style.saturated = false
			item_content.disable_button = false
		else
			item_content.reserved = false
			item_style.saturated = false
			item_content.disable_button = false
		end

		item_content.fake_item = backend_id == nil
	else
		item_content.disable_button = true
		item_content[item_icon_name] = nil
		item_content[item_amount_name] = ""
	end

	if self._mark_locked_items then
		self:mark_locked_items(true)
	end
end

ItemGridUI._set_color_values = function (self, target_color, p1, p2, p3)
	target_color[2] = p1
	target_color[3] = p2
	target_color[4] = p3
end

ItemGridUI.repopulate_current_inventory_page = function (self)
	local widget = self._widget
	local content = widget.content
	local items = self._items
	local page_index = self._selected_page_index
	local total_item_pages = self._total_item_pages
	local item_slots = content.slots
	local start_read_index = (page_index - 1) * item_slots + 1

	self:_populate_inventory_page(items, start_read_index)

	widget.content.page_text = page_index .. "/" .. total_item_pages
	self._selected_page_index = page_index
end

ItemGridUI._populate_inventory_page = function (self, items, start_read_index)
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns
	local item_read_index = start_read_index

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local item_icon_name = "item_icon" .. name_sufix
			local item_amount_name = "amount_text" .. name_sufix
			local locked_icon_name = "locked_icon" .. name_sufix
			local hotspot_name = "hotspot" .. name_sufix
			local item_content = content[hotspot_name]
			local item_style = style[item_icon_name]
			local item = items[item_read_index]
			local backend_id = item and item.backend_id
			content["item" .. name_sufix] = backend_id and item

			if item then
				local item_data = item.data
				local rarity = item_data.rarity
				local backend_items = Managers.backend:get_interface("items")

				if backend_id then
					rarity = backend_items:get_item_rarity(backend_id)
				end

				local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)
				local rarity_texture_name = "rarity_texture" .. name_sufix

				if style[rarity_texture_name] then
					content[rarity_texture_name] = UISettings.item_rarity_textures[rarity]
				end

				local amount = nil

				if backend_id then
					amount = backend_items:get_item_amount(backend_id)
				elseif item.amount then
					amount = item.amount
				end

				if amount then
					local color_value_1, color_value_2, color_value_3 = nil

					if item.insufficient_amount then
						color_value_1 = 255
						color_value_2 = 0
						color_value_3 = 0
					else
						local amount_default_color = style[item_amount_name].default_color
						color_value_1 = amount_default_color[2]
						color_value_2 = amount_default_color[3]
						color_value_3 = amount_default_color[4]
					end

					local amount_text_color = style[item_amount_name].text_color

					self:_set_color_values(amount_text_color, color_value_1, color_value_2, color_value_3)
				else
					amount = ""
				end

				local item_tooltip_name = "item_tooltip" .. name_sufix
				content[item_tooltip_name] = display_name
				item_content[item_icon_name] = inventory_icon
				item_content[item_amount_name] = (item_data.can_stack and amount) or ""
				item_content[locked_icon_name] = self._locked_item_icon

				if not backend_id then
					item_content.reserved = true
					item_content.equipped = false
					item_style.saturated = true
					item_content.disable_button = true
				else
					item_content.reserved = false
					item_style.saturated = false
					item_content.disable_button = false
				end

				item_read_index = item_read_index + 1
			else
				item_content[item_icon_name] = nil
				item_content[item_amount_name] = ""
			end
		end
	end

	if self._mark_equipped_items then
		self:mark_equipped_items(true)
	end

	if self._mark_locked_items then
		self:mark_locked_items(true)
	end

	local item_interface = Managers.backend:get_interface("items")

	if self._selected_item and item_interface:get_item_from_id(self._selected_item.backend_id) then
		self:set_item_selected(self._selected_item)
	end
end

ItemGridUI.clear_item_grid = function (self)
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local item_icon_name = "item_icon" .. name_sufix
			local item_amount_name = "amount_text" .. name_sufix
			local hotspot_name = "hotspot" .. name_sufix
			local item_content = content[hotspot_name]
			local item_style = style[item_icon_name]
			content["item" .. name_sufix] = nil
			item_content[item_icon_name] = nil
			item_content[item_amount_name] = ""
			item_content.equipped = false
			item_content.drag_disabled = false
			item_content.disable_button = true
			item_style.saturated = false
		end
	end
end

ItemGridUI._on_category_index_change = function (self, index, keep_page_index)
	local settings = self._category_settings[index]
	local display_name = settings.display_name
	local item_filter = settings.item_filter
	local slot_type = settings.slot_type
	local hero_specific_filter = settings.hero_specific_filter
	local career_specific_filter = settings.career_specific_filter

	if hero_specific_filter then
		local temp_item_filter = (item_filter and "and " .. item_filter) or ""
		item_filter = "can_wield_by_current_hero " .. temp_item_filter
	end

	if settings.wield then
		self:disable_unwieldable_items(true)
	end

	local current_page_index = self._selected_page_index or 1

	self:change_item_filter(item_filter, not keep_page_index)

	local widget = self._widget
	local content = widget.content
	local title_text = display_name
	content.title_text = title_text

	if keep_page_index then
		local page_index = math.min(current_page_index, self._total_item_pages)

		self:set_item_page(page_index)
	end
end

ItemGridUI.change_item_filter = function (self, item_filter, change_page)
	item_filter = "available_in_current_mechanism and ( " .. item_filter .. " )"
	local items_1 = self:_get_items_by_filter("can_wield_by_current_career and ( " .. item_filter .. " )")
	local items_2 = self:_get_items_by_filter("not can_wield_by_current_career and ( " .. item_filter .. " )")
	local item_sort_func = self._item_sort_func

	if item_sort_func then
		self:_sort_items(items_1, item_sort_func)
		self:_sort_items(items_2, item_sort_func)
	end

	local items = items_1

	for _, value in pairs(items_2) do
		items[#items + 1] = value
	end

	self._items = items
	local widget = self._widget
	local content = widget.content
	local num_slots = content.slots
	local num_items = #items
	local total_pages = math.max(math.ceil(num_items / num_slots), 1)
	self._total_item_pages = total_pages

	if change_page then
		local page_index = 1

		self:set_item_page(page_index)
	end
end

ItemGridUI._sort_items = function (self, items, item_sort_func)
	if item_sort_func and #items > 1 then
		table.sort(items, item_sort_func)
	end
end

ItemGridUI._get_items_by_filter = function (self, item_filter)
	local backend_items = Managers.backend:get_interface("items")
	local items = backend_items:get_filtered_items(item_filter)

	return items
end

ItemGridUI._filter_career_specific_items = function (self, items, career_index, slot_type)
	local item_interface = Managers.backend:get_interface("items")

	if slot_type == "skin" then
		for _, item in pairs(items) do
			local item_key = item_interface:get_key(item.backend_id)
			local item_data = item.data

			if item_data.slot_type == "skin" and item_key then
				local cosmetic_data = Cosmetics[item_key]
				local cosmetic_career_index = cosmetic_data.career

				if cosmetic_career_index and career_index ~= cosmetic_career_index then
					table.remove(items, tablefind_item_key(items, item_key))
				end
			end
		end
	end
end

ItemGridUI._get_slot_by_ui_index = function (self, index)
	local slots = InventorySettings.slots

	for _, slot in pairs(slots) do
		if index == slot.ui_slot_index then
			return slot
		end
	end
end

ItemGridUI._handle_page_arrow_pressed = function (self)
	local selected_page_index = self._selected_page_index or 0
	local total_item_pages = self._total_item_pages
	local disable_page_selection = total_item_pages == 0
	local widget = self._widget
	local content = widget.content
	local page_hotspot_left = content.page_hotspot_left
	local page_hotspot_right = content.page_hotspot_right

	if not page_hotspot_left and not page_hotspot_right then
		return
	end

	page_hotspot_left.disable_button = disable_page_selection or selected_page_index <= 1
	page_hotspot_right.disable_button = disable_page_selection or selected_page_index == total_item_pages

	if not self._selected_page_index or not self._total_item_pages then
		return
	end

	local new_page_index = nil

	if page_hotspot_left and page_hotspot_left.on_release then
		new_page_index = math.max(selected_page_index - 1, 1)
	elseif page_hotspot_right and page_hotspot_right.on_release then
		new_page_index = math.min(selected_page_index + 1, total_item_pages)
	end

	if new_page_index and new_page_index ~= selected_page_index then
		self:set_item_page(new_page_index)

		return true
	end
end

ItemGridUI.is_item_pressed = function (self, allow_single_press)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local disable_locked_items = self._disable_locked_items
	local disable_unwieldable_items = self._disable_unwieldable_items

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]
			local locked = disable_locked_items and slot_hotspot.reserved
			local unwieldable_locked = disable_unwieldable_items and slot_hotspot.unwieldable

			if not locked and not unwieldable_locked and (slot_hotspot.on_double_click or slot_hotspot.on_right_click or (allow_single_press and slot_hotspot.on_pressed)) then
				local item = content["item" .. name_sufix]
				local is_equipped = slot_hotspot.equipped

				return item, is_equipped
			end
		end
	end
end

ItemGridUI.is_item_hovered = function (self)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.on_hover_enter then
				local item = content["item" .. name_sufix]

				return item
			end
		end
	end
end

ItemGridUI.get_item_hovered = function (self)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.internal_is_hover then
				local item = content["item" .. name_sufix]
				local is_equipped = slot_hotspot.equipped

				return item, is_equipped
			end
		end
	end
end

ItemGridUI.is_slot_hovered = function (self)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.internal_is_hover then
				return (i - 1) * rows + k
			end
		end
	end
end

ItemGridUI.highlight_slots = function (self, enabled, optional_alpha)
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hover_name = "slot_hover" .. name_sufix
			local slot_hotspot = content[hotspot_name]
			slot_hotspot.highlight = enabled
			style[slot_hover_name].color[1] = (enabled and (optional_alpha or 255)) or 255
		end
	end
end

ItemGridUI.highlight_drop_slots = function (self, enabled)
	local widget = self._widget
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local item_icon_name = "item_icon" .. name_sufix
			local slot_hover_name = "slot_hover" .. name_sufix
			local slot_hotspot = content[hotspot_name]
			slot_hotspot.highlight = enabled
			local alpha = (slot_hotspot.internal_is_hover and 255) or 100
			style[slot_hover_name].color[1] = (enabled and alpha) or 255
		end
	end
end

ItemGridUI.is_item_dragged = function (self)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local dragged_item, slot_index = nil

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local item_icon_name = "item_icon" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot[item_icon_name] and slot_hotspot.on_drag_stopped then
				local item = content["item" .. name_sufix]
				dragged_item = item

				break
			end
		end
	end

	return dragged_item
end

ItemGridUI.is_dragging_item = function (self)
	local widget = self._widget
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local dragged_item = nil

	for i = 1, rows, 1 do
		for k = 1, columns, 1 do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local item_icon_name = "item_icon" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot[item_icon_name] and slot_hotspot.is_dragging then
				local item = content["item" .. name_sufix]
				dragged_item = item

				break
			end
		end
	end

	return dragged_item
end

ItemGridUI.update = function (self, dt, t)
	local input_pressed = self:_handle_page_arrow_pressed()
end

ItemGridUI.destroy = function (self)
	return
end

return
