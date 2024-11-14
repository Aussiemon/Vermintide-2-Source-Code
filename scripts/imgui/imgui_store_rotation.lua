-- chunkname: @scripts/imgui/imgui_store_rotation.lua

local layout_template = "    {\n        \"pages\": {\n          \"featured\": {\n            \"rotation_timestamp\": 1669633200,\n            \"display_name\": \"menu_store_panel_title_featured\",\n            \"grid\": [\n            ],\n            \"layout\": \"featured\",\n            \"slideshow\": [\n            ],\n            \"sound_event_enter\": \"Play_hud_store_category_front\"\n          },\n          \"dlc\": {\n            \"content\": [\n              \"bless\",\n              \"bless_upgrade\",\n              \"woods\",\n              \"woods_upgrade\",\n              \"grass\",\n              \"cog\",\n              \"cog_upgrade\",\n              \"lake\",\n              \"lake_upgrade\",\n              \"scorpion\",\n              \"holly\",\n              \"bogenhafen\",\n              \"pre_order\",\n              \"premium_career_bundle\",\n              \"premium_career_bundle_upgrade\"\n            ],\n            \"type\": \"dlc\",\n            \"display_name\": \"menu_store_panel_title_dlcs\",\n            \"layout\": \"dlc_list\",\n            \"sound_event_enter\": \"Play_hud_store_category_dlc\"\n          }\n        }\n      }\n"
local save_file_template = "    {\n        \"featured\": {\n        },\n        \"discounts\" : {\n        }\n    }\n"
local APP_IDS = {
	[1] = "795750",
	[2] = "552500",
}
local SEARCH_TYPES = table.enum("slideshow", "featured", "discount")
local relative_save_file_path = "/.shop/imgui_store_tool_save_file.json"

ImguiStoreRotation = class(ImguiStoreRotation)

local Imgui = Imgui
local DO_RELOAD = true

ImguiStoreRotation.init = function (self)
	self._fp = nil
	self._save_file = nil
	self._first_launch = true

	self:_load_saved_data()

	self._item_keys_list = {}
	self._layout_items = {}
	self._slideshow_items = {}
	self._dlc_list = {}
	self._store_dlc_list = {}
	self._search_type = SEARCH_TYPES.featured

	self:_setup_timpestamp_fields()

	self._timestamp = 0

	self:_setup_item_keys_list()
	self:_setup_dlc_list()

	self._item_search_results = table.clone(self._item_keys_list)
	self._searcheable_item_keys = {}

	self:_filter_item_keys_list()

	self._is_selecting_item = false
	self._is_selecting_slideshow_item = false
	self._selected_item_index = -1
	self._item_search_text = ""
	self._prio = 0
	self._localize = false

	self:_setup_layout_template()

	self._appid = 795750
	self._appid_idx = 1
	self._is_selecting_discount_item = false
	self._discount_amount = 0
	self._discounted_items = {}
	self._has_error_discount = false

	self:_setup_discount_begin_end_date()

	self._backend_store = Managers.backend:get_interface("peddler")
	self._itemdef_filename = ""
	self._missing_file_name = nil
	self._timestamp_error = nil
	self._tabs = {
		"Feature Page Rotation",
		"Store Discounts",
		"Create Items and Bundles",
	}
	self._selected_tab = self._tabs[1]
	self._save_successful_discount = ""
	self._save_successful_featured = ""
end

ImguiStoreRotation._cleanup_slideshow = function (self)
	local slideshow_items = {}
	local featured_items = {}

	for i = 1, #self._item_keys_list do
		local key = self._item_keys_list[i]
		local is_dlc = self:_is_a_dlc(key)
		local item = is_dlc and StoreDlcSettingsByName[key] or rawget(ItemMasterList, key)

		if not item or item.item_type ~= "bundle" and not is_dlc and not item.store_bundle_big_image then
			-- Nothing
		elseif item.item_type == "bundle" or is_dlc then
			slideshow_items[#slideshow_items + 1] = key
		end
	end

	self._slideshow_item_keys = slideshow_items
end

ImguiStoreRotation._filter_item_keys_list = function (self)
	local slideshow_items = {}
	local featured_items = {}
	local discount_item_keys = {}

	for i = 1, #self._item_keys_list do
		local key = self._item_keys_list[i]
		local is_dlc = self:_is_a_dlc(key)
		local item = is_dlc and StoreDlcSettingsByName[key] or rawget(ItemMasterList, key)

		if not item or item.item_type == "deed" then
			-- Nothing
		else
			if item.item_type == "bundle" or is_dlc then
				slideshow_items[#slideshow_items + 1] = key
				featured_items[#featured_items + 1] = key
			else
				featured_items[#featured_items + 1] = key
			end

			if item.steam_itemdefid or item.current_prices then
				discount_item_keys[#discount_item_keys + 1] = key
			end
		end
	end

	self._searcheable_item_keys.slideshow = slideshow_items
	self._searcheable_item_keys.featured = featured_items
	self._searcheable_item_keys.discount = discount_item_keys
end

ImguiStoreRotation._load_saved_data = function (self)
	self._save_data = {}

	if script_data.source_dir then
		local save_file_path = script_data.source_dir .. relative_save_file_path

		self._save_file = io.open(save_file_path, "r")

		if self._save_file then
			local text_file = self._save_file:read("*all")

			self._save_data = cjson.decode(text_file)

			self._save_file:close()
		else
			self._save_data = cjson.decode(save_file_template)
		end
	else
		Application.warning("[ImguiStoreRotation] script_data.source_dir is nil, cannot load store rotation settings, using default!")

		self._save_data = cjson.decode(save_file_template)
	end
end

ImguiStoreRotation._save_settings = function (self)
	self._save_data.featured.end_year = self._timestamp_year
	self._save_data.featured.end_month = self._timestamp_month
	self._save_data.featured.end_day = self._timestamp_day
	self._save_data.featured.timestamp = self._timestamp
	self._save_data.discounts.end_year = self._end_discount_year
	self._save_data.discounts.end_month = self._end_discount_month
	self._save_data.discounts.end_day = self._end_discount_day

	local json_obj = cjson.encode(self._save_data)

	if script_data.source_dir then
		local save_file_path = script_data.source_dir .. relative_save_file_path
		local file = assert(io.open(save_file_path, "w"))

		file:write(json_obj)
		file:close()
	else
		Application.warning("[ImguiStoreRotation] script_data.source_dir is nil, cannot save store rotation settings!")
	end
end

ImguiStoreRotation._setup_timpestamp_fields = function (self)
	self._timestamp_year = self._save_data.featured.end_year and self._save_data.featured.end_year or os.date("%Y")
	self._timestamp_month = self._save_data.featured.end_month and self._save_data.featured.end_month or os.date("%m")
	self._timestamp_day = self._save_data.featured.end_day and self._save_data.featured.end_day or os.date("%d")
	self._timestamp_hour = "12"
	self._timestamp_minutes = "00"
	self._timestamp_seconds = "00"
	self._timestamp = self._save_data.featured.timestamp and self._save_data.featured.timestamp or 0
	self._new_rotation_file_name = string.format("layout_%s_%s_%s", os.date("%Y"), os.date("%m"), os.date("%d"))
	self._new_discount_file_name = string.format("rotation_%s_%s_%s", os.date("%Y"), os.date("%m"), os.date("%d"))
end

ImguiStoreRotation._setup_discount_begin_end_date = function (self)
	self._begin_discount_year = os.date("%Y")
	self._begin_discount_month = os.date("%m")
	self._begin_discount_day = os.date("%d")
	self._end_discount_year = self._save_data.discounts.end_year and self._save_data.discounts.end_year or "00"
	self._end_discount_month = self._save_data.discounts.end_month and self._save_data.discounts.end_month or "00"
	self._end_discount_day = self._save_data.discounts.end_day and self._save_data.discounts.end_day or "00"
end

ImguiStoreRotation._setup_layout_template = function (self)
	local lua_object = cjson.decode(layout_template)

	if lua_object then
		self._lua_layout = lua_object
	end
end

ImguiStoreRotation._setup_item_keys_list = function (self)
	table.clear(self._item_keys_list)

	self._item_keys_list = table.keys(ItemMasterList)

	table.sort(self._item_keys_list)
end

ImguiStoreRotation._setup_dlc_list = function (self)
	local n = 0

	table.clear(self._dlc_list)

	for i, settings in ipairs(UnlockSettings) do
		for unlock_name, unlock_config in pairs(settings.unlocks) do
			n = n + 1
			self._dlc_list[n] = unlock_name
		end
	end

	table.sort(self._dlc_list)
	table.append(self._item_keys_list, self._dlc_list)
end

ImguiStoreRotation.is_persistent = function (self)
	return false
end

ImguiStoreRotation.update = function (self)
	if DO_RELOAD then
		self:init()

		DO_RELOAD = false
	end
end

ImguiStoreRotation.draw = function (self, is_open)
	if self._first_launch then
		local w, h = Application.resolution()

		Imgui.set_next_window_size(w * 0.8, h * 0.8)

		self._first_launch = false
	end

	local do_close = Imgui.begin_window("Create Store Rotation", "menu_bar")

	Imgui.text("This is the store rotation tool!!")
	Imgui.separator()

	if Imgui.begin_menu_bar() then
		for i, tab in ipairs(self._tabs) do
			local label = self._selected_tab ~= tab and " " .. tab .. " " or "[" .. tab .. "]"

			if Imgui.menu_item(label) then
				self._selected_tab = tab
			end
		end

		Imgui.end_menu_bar()
	end

	Imgui.begin_child_window("child_window", 0, 0, true)

	if self._selected_tab == "Feature Page Rotation" then
		self:_featured_page_tab()
	elseif self._selected_tab == "Store Discounts" then
		self:_store_rotation_discounts_tab()
	elseif self._selected_tab == "Create Items and Bundles" then
		self:_item_and_bundle_creator()
	end

	Imgui.end_child_window()
	Imgui:end_window()

	return do_close
end

ImguiStoreRotation._featured_page_tab = function (self)
	self:_do_new_file_name()
	self:_do_timestamp_settings()
	Imgui.text("Timestamp: ")
	Imgui.same_line()
	Imgui.text_colored(self._timestamp, 44, 192, 133, 255)
	Imgui.separator()
	Imgui.columns(2, true)
	self:_do_edit_buttons()
	self:_do_clear_edit_buttons()
	self:_do_save_file_button()

	if self._save_successful_featured ~= "" then
		Imgui.text_colored(self._save_successful_featured, 255, 196, 0, 255)
	end

	Imgui.next_column()
	Imgui.text("Content Preview")
	Imgui.separator()
	self:_draw_layout_slideshow_preview()
	Imgui.next_column()
	self:_handle_error_messages()
end

ImguiStoreRotation._do_edit_buttons = function (self)
	Imgui.text("Edit Feature Page Layout and Slideshow Composition")
	Imgui.dummy(2, 10)

	self._localize = Imgui.checkbox("Localize headers and descriptions in the preview", self._localize)

	Imgui.dummy(2, 10)
	Imgui.text_colored("EDIT FEATURED PAGE:", 245, 245, 207, 255)
	Imgui.dummy(2, 5)
	Imgui.text("Edit Slideshow")
	Imgui.text_colored("Add the items that will be displayed in the Store Featured Page Slideshow :", 245, 245, 207, 255)

	if Imgui.button("ADD Slideshow Item", 200, 20) then
		self._is_selecting_slideshow_item = true
		self._is_selecting_item = false

		self:_on_search_type_changed(SEARCH_TYPES.slideshow)
	end

	if self._is_selecting_slideshow_item then
		self:_draw_item_selection()

		if self._selected_item_index ~= -1 then
			local selected_item_key = self._item_search_results[self._selected_item_index]

			self._slideshow_items[#self._slideshow_items + 1] = self:_get_slideshow_item(selected_item_key)
			self._is_selecting_slideshow_item = false
			self._selected_item_index = -1
			self._item_search_text = ""
		end
	end

	if Imgui.button("REMOVE LAST Slideshow Item", 200, 20) then
		self:_remove_last_added_item(self._slideshow_items)
	end

	Imgui.dummy(2, 10)
	Imgui.text("Edit Featured Items")
	Imgui.text_colored("Add the items to highlight as featured in the Store Featured Page :", 245, 245, 207, 255)

	if Imgui.button("ADD Featured Item", 200, 20) then
		self._is_selecting_item = true
		self._is_selecting_slideshow_item = false

		self:_on_search_type_changed(SEARCH_TYPES.featured)
	end

	if self._is_selecting_item then
		self:_draw_item_selection()

		if self._selected_item_index ~= -1 then
			local selected_item_key = self._item_search_results[self._selected_item_index]

			self._layout_items[#self._layout_items + 1] = self:_get_layout_item(selected_item_key)
			self._is_selecting_item = false
			self._selected_item_index = -1
			self._item_search_text = ""
		end
	end

	if Imgui.button("REMOVE LAST Featured Item", 200, 20) then
		self:_remove_last_added_item(self._layout_items)
	end
end

ImguiStoreRotation._do_item_selection = function (self)
	if self._is_selecting_item or self._is_selecting_slideshow_item then
		self:_draw_item_selection()

		if self._selected_item_index ~= -1 then
			local selected_item_key = self._item_search_results[self._selected_item_index]

			if self._is_selecting_item then
				self._layout_items[#self._layout_items + 1] = self:_get_layout_item(selected_item_key)
				self._is_selecting_item = false
			end

			if self._is_selecting_slideshow_item then
				self._slideshow_items[#self._slideshow_items + 1] = self:_get_slideshow_item(selected_item_key)
				self._is_selecting_slideshow_item = false
			end

			self._selected_item_index = -1
			self._item_search_text = ""
		end
	end
end

ImguiStoreRotation._do_save_file_button = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("Preview the featured page rotation, before saving your changes and uploading them.")

	if Imgui.button("PREVIEW CHANGES", 250, 35) then
		self:_preview_changes()
	end

	Imgui.dummy(2, 10)
	Imgui.text("Save the edits to the feature page layout in to a file.")

	if Imgui.button("SAVE FILE AND COPY TO CLIPBOARD", 250, 50) then
		self:_save_to_file()
	end

	Imgui.text("All the edits will be copied to the clipboard as text.")
end

ImguiStoreRotation._preview_changes = function (self)
	local backend_store = Managers.backend:get_interface("peddler")

	if backend_store:has_force_override() then
		return
	end

	local has_error = false
	local timestamp, is_valid = self:_calculate_timestamp(self._timestamp_year, self._timestamp_month, self._timestamp_day, self._timestamp_hour, self._timestamp_minutes, self._timestamp_seconds)

	if not is_valid then
		self._timestamp_error = true
		has_error = true
	end

	if not has_error then
		self._timestamp = timestamp
		self._lua_layout.pages.featured.rotation_timestamp = self._timestamp

		self:_save_layout_items(self._layout_items)
		self:_save_slideshow_items(self._slideshow_items)

		local lua_layout_object = self._lua_layout
		local json_object = cjson.encode(lua_layout_object)

		backend_store:force_layout_override(json_object)
	end
end

ImguiStoreRotation._draw_layout_slideshow_preview = function (self)
	Imgui.dummy(2, 10)
	Imgui.text_colored("LAYOUT ITEMS: " .. tostring(#self._layout_items), 0, 179, 255, 255)
	Imgui.dummy(2, 10)

	if #self._layout_items ~= 0 then
		self:_draw_selcted_layout_items(self._layout_items)
	end

	Imgui.text_colored("SLIDESHOW ITEMS: " .. tostring(#self._slideshow_items), 0, 179, 255, 255)
	Imgui.dummy(2, 10)

	if #self._slideshow_items ~= 0 then
		self:_draw_selcted_slideshow_items(self._slideshow_items)
	end
end

ImguiStoreRotation._do_new_file_name = function (self)
	self._new_rotation_file_name = Imgui.input_text("New Rotation File Name ", self._new_rotation_file_name)

	Imgui.dummy(2, 10)
end

local function _is_steam_item(item)
	return item.steam_itemdefid and true or false
end

ImguiStoreRotation._is_a_dlc = function (self, key)
	local is_dlc = table.find(self._dlc_list, key)

	return is_dlc
end

ImguiStoreRotation._get_layout_item = function (self, key)
	local layout_item = {}
	local is_dlc = self:_is_a_dlc(key)

	if is_dlc then
		layout_item.id = key
		layout_item.type = "dlc"
	else
		local item = rawget(ItemMasterList, key)
		local is_steam_item = _is_steam_item(item)

		if is_steam_item then
			layout_item.steam_itemdefid = item.steam_itemdefid
			layout_item.id = key
			layout_item.type = "item"
			layout_item.key = key
		else
			layout_item.id = key
			layout_item.type = "item"
		end
	end

	return layout_item
end

ImguiStoreRotation._get_slideshow_item = function (self, key)
	local slideshow_item = {}
	local product_type, header, texture, product_id, description, prio
	local is_dlc = self:_is_a_dlc(key)
	local product_type = is_dlc and "dlc" or "item"
	local item = is_dlc and StoreDlcSettingsByName[key] or rawget(ItemMasterList, key)

	if not item or item.item_type ~= "bundle" and not is_dlc and not item.store_bundle_big_image then
		slideshow_item.error_text = "Item " .. key .. " Cannot be used as a slideshow item."

		return slideshow_item
	end

	if item.item_type == "bundle" or is_dlc then
		local found = false

		for i = 1, #StoreDlcSettings do
			local settings = StoreDlcSettings[i]

			if settings.dlc_name == key or settings.name == key then
				if not settings.slideshow_texture then
					slideshow_item.error_text = "Item " .. key .. " Cannot be used as a slideshow item."

					return slideshow_item
				end

				product_type = "item"
				header = settings.name
				texture = settings.slideshow_texture
				product_id = key
				description = settings.information_text
				found = true
			end
		end

		if not found then
			header = item.display_name
			texture = item.store_bundle_big_image and string.match(item.store_bundle_big_image, "[^/]+$") or ""
			product_id = key
			description = item.description
		end
	else
		header = item.display_name
		texture = item.store_bundle_big_image and string.match(item.store_bundle_big_image, "[^/]+$") or ""
		product_id = key
		description = item.description
	end

	local is_steam_item = _is_steam_item(item)

	if is_steam_item then
		slideshow_item.steam_itemdefid = item.steam_itemdefid
	end

	slideshow_item.product_type = product_type
	slideshow_item.header = header
	slideshow_item.texture = texture
	slideshow_item.product_id = product_id
	slideshow_item.description = description

	local prio = self._prio + 100

	slideshow_item.prio = prio
	self._prio = prio

	return slideshow_item
end

ImguiStoreRotation._draw_item_selection = function (self)
	Imgui.text("Select Item")

	local index, results, text = ImguiX.combo_search(self._selected_item_index, self._item_search_results, self._item_search_text, self._searcheable_item_keys[self._search_type])

	self._selected_item_index = index
	self._item_search_results = results
	self._item_search_text = text
end

ImguiStoreRotation._draw_selcted_layout_items = function (self, items_list)
	for i = 1, #items_list do
		local item = items_list[i]
		local item_id = item.key or item.id

		if self._localize then
			local item = rawget(ItemMasterList, item_id)
			local name = Localize(item.display_name)

			Imgui.text_colored("Featured Item: " .. name, 245, 245, 207, 255)
		else
			Imgui.text_colored("Featured Item: " .. item_id, 245, 245, 207, 255)
		end

		Imgui.dummy(2, 5)

		for key, value in pairs(item) do
			Imgui.text_colored(key .. " : ", 0, 186, 112, 255)
			Imgui.same_line()
			Imgui.text_colored(tostring(value), 0, 193, 212, 255)
		end

		Imgui.dummy(2, 5)
	end
end

ImguiStoreRotation._draw_selcted_slideshow_items = function (self, items_list)
	for i = 1, #items_list do
		local item = items_list[i]

		if not item.error_text then
			local item_id = item.product_id or item.dlc_name

			Imgui.text_colored("Slideshow Item: " .. item_id, 245, 245, 207, 255)
		end

		Imgui.dummy(2, 5)

		for key, value in pairs(item) do
			if item.error_text then
				Imgui.text_colored(key .. " : " .. value, 255, 0, 0, 255)
			elseif self._localize and (key == "header" or key == "description") then
				Imgui.text_colored(key .. " : ", 0, 186, 112, 255)
				Imgui.same_line()
				Imgui.text_colored(Localize(value), 0, 193, 212, 255)
			else
				Imgui.text_colored(key .. " : ", 0, 186, 112, 255)
				Imgui.same_line()
				Imgui.text_colored(tostring(value), 0, 193, 212, 255)
			end
		end

		Imgui.dummy(2, 5)
	end
end

ImguiStoreRotation._do_timestamp_settings = function (self)
	Imgui.text("Set End Date, This will be used for the countdown displayed at the top of the Store Feature Page ")
	Imgui.dummy(2, 10)
	Imgui.columns(6, false)

	self._timestamp_year = Imgui.input_text("<-Year", self._timestamp_year)

	Imgui.next_column()

	self._timestamp_month = Imgui.input_text("<-Month", self._timestamp_month)

	Imgui.next_column()

	self._timestamp_day = Imgui.input_text("<-Day", self._timestamp_day)

	Imgui.next_column()

	self._timestamp_hour = Imgui.input_text("<-Hour", self._timestamp_hour)

	Imgui.next_column()

	self._timestamp_minutes = Imgui.input_text("<-Min", self._timestamp_minutes)

	Imgui.next_column()

	self._timestamp_seconds = Imgui.input_text("<-Secs", self._timestamp_seconds)

	Imgui.next_column()

	if Imgui.button("Preview Timestamp", 150, 20) then
		self._timestamp = self:_calculate_timestamp(self._timestamp_year, self._timestamp_month, self._timestamp_day, self._timestamp_hour, self._timestamp_minutes, self._timestamp_seconds)
	end
end

local function _has_valid_input_date(year, month, day, hour, minutes, seconds)
	if year == "" or tonumber(year) < tonumber(os.date("%Y")) then
		return false
	elseif month == "" or tonumber(month) > 12 or tonumber(month) < 1 then
		return false
	elseif not day or day == "" or tonumber(day) > 31 or tonumber(day) < 1 then
		return false
	elseif hour and (hour == "" or tonumber(hour) > 23 or tonumber(hour) < 0) then
		return false
	elseif minutes and (minutes == "" or tonumber(minutes) > 59 or tonumber(minutes) < 0) then
		return false
	elseif seconds and (seconds == "" or tonumber(seconds) > 59 or tonumber(seconds) < 0) then
		return false
	end

	return true
end

ImguiStoreRotation._calculate_timestamp = function (self, year, month, day, hour, minutes, seconds)
	local has_valid_input_date = _has_valid_input_date(year, month, day, hour, minutes, seconds)

	if not has_valid_input_date then
		return 0, false
	end

	local is_daylight_saving_time = false
	local timestamp = os.time({
		day = day,
		month = month,
		year = year,
		hour = hour,
		min = minutes,
		sec = seconds,
		isdst = is_daylight_saving_time,
	})

	self._timestamp_error = false

	return timestamp, true
end

ImguiStoreRotation._save_layout_items = function (self, layout_items)
	if table.is_empty(layout_items) then
		return
	end

	local layout_grid = self._lua_layout.pages.featured.grid

	table.clear(layout_grid)

	for _, value in pairs(layout_items) do
		layout_grid[#layout_grid + 1] = value
	end

	self._lua_layout.pages.featured.grid = layout_grid

	table.dump(self._lua_layout.pages.featured, "FEATURED", 5)
end

ImguiStoreRotation._save_slideshow_items = function (self, slideshow_items)
	if table.is_empty(slideshow_items) then
		return
	end

	local slideshow = self._lua_layout.pages.featured.slideshow

	table.clear(slideshow)

	for _, value in pairs(slideshow_items) do
		if value.error_text then
			-- Nothing
		else
			slideshow[#slideshow + 1] = value
		end
	end

	self._lua_layout.pages.featured.slideshow = slideshow

	table.dump(self._lua_layout.pages.featured, "FEATURED", 5)
end

ImguiStoreRotation._remove_last_added_item = function (self, table)
	table[#table] = nil
end

ImguiStoreRotation._do_clear_edit_buttons = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("Clear Edits")
	Imgui.text_colored("Clear the edits made, the uses can delete a whole section or the entire edits. ", 245, 245, 207, 255)

	if Imgui.button("Clear Featured Items", 180, 20) then
		table.clear(self._layout_items)
	end

	if Imgui.button("Clear Slideshow Items", 180, 20) then
		table.clear(self._slideshow_items)

		self._prio = 0
	end

	if Imgui.button("Clear All", 180, 20) then
		table.clear(self._layout_items)
		table.clear(self._slideshow_items)
	end
end

ImguiStoreRotation._save_to_file = function (self)
	local has_error = false

	if self._new_rotation_file_name == "" then
		self._missing_file_name = true
		has_error = true
	end

	local timestamp, is_valid = self:_calculate_timestamp(self._timestamp_year, self._timestamp_month, self._timestamp_day, self._timestamp_hour, self._timestamp_minutes, self._timestamp_seconds)

	if not is_valid then
		self._timestamp_error = true
		has_error = true
	end

	if not has_error then
		self._timestamp = timestamp
		self._lua_layout.pages.featured.rotation_timestamp = self._timestamp

		self:_save_layout_items(self._layout_items)
		self:_save_slideshow_items(self._slideshow_items)

		local lua_layout_object = self._lua_layout
		local json_object = cjson.encode(lua_layout_object)
		local project_source = script_data.source_dir

		self._fp = assert(io.open(project_source .. "/.shop/rotation/" .. self._new_rotation_file_name .. ".json", "w"))

		self._fp:write(json_object)
		self._fp:close()
		Clipboard.put(json_object)

		self._save_successful_featured = "File saved successfully at\n" .. project_source .. "/.shop/rotation/" .. self._new_rotation_file_name .. ".json"

		self:_save_settings()
	end
end

ImguiStoreRotation._calculate_discount = function (self, price_string, discount)
	local PRICE_STR = price_string:gsub("%s+", "")
	local float_discount = discount / 100
	local begin_date = string.format("%s%s%sT110000Z", self._begin_discount_year, self._begin_discount_month, self._begin_discount_day)
	local end_date = string.format("%s%s%sT110000Z", self._end_discount_year, self._end_discount_month, self._end_discount_day)
	local out = SteamItemService.apply_discounts(PRICE_STR, float_discount, begin_date, end_date)

	print(out)

	return out
end

ImguiStoreRotation._make_item_def = function (self, key, item, discount)
	local steam_id = item.steam_itemdefid
	local original_price = SteamInventory.get_item_definition_property(steam_id, "price")

	return {
		hidden = false,
		item_quality = 2,
		marketable = false,
		purchase_limit = 1,
		store_hidden = false,
		tradable = false,
		type = "item",
		itemdefid = item.steam_itemdefid,
		display_type = SteamInventory.get_item_definition_property(steam_id, "display_type"),
		name = Localize(item.display_name),
		price = self:_calculate_discount(original_price, discount),
		description = Localize(item.description),
		name_color = SteamInventory.get_item_definition_property(steam_id, "name_color"),
		background_color = SteamInventory.get_item_definition_property(steam_id, "background_color"),
		icon_url = SteamInventory.get_item_definition_property(steam_id, "icon_url"),
	}
end

ImguiStoreRotation._make_bundle_def = function (self, key, item, discount)
	local steam_id = item.steam_itemdefid
	local original_price = SteamInventory.get_item_definition_property(steam_id, "price")

	return {
		hidden = false,
		item_quality = 2,
		marketable = false,
		store_hidden = false,
		tradable = false,
		type = "bundle",
		use_bundle_price = true,
		itemdefid = item.steam_itemdefid,
		display_type = SteamInventory.get_item_definition_property(steam_id, "display_type"),
		bundle = SteamInventory.get_item_definition_property(steam_id, "bundle"),
		name = Localize(item and item.display_name or "not_assigned"),
		price = self:_calculate_discount(original_price, discount),
		description = Localize(item and item.description or "not_assigned"),
		name_color = SteamInventory.get_item_definition_property(steam_id, "name_color"),
		background_color = SteamInventory.get_item_definition_property(steam_id, "background_color"),
		icon_url = SteamInventory.get_item_definition_property(steam_id, "icon_url"),
	}
end

ImguiStoreRotation._generate_discounted_item = function (self, key, item, discount)
	if item.item_type ~= "bundle" then
		return self:_make_item_def(key, item, discount)
	else
		return self:_make_bundle_def(key, item, discount)
	end
end

ImguiStoreRotation._draw_dicount_begin_and_end_fields = function (self)
	Imgui.text("Setup Discount Begin and End Date")
	Imgui.text_colored("Set the start date from when the an item should be on sale", 245, 245, 207, 255)
	Imgui.text("Begin Date")
	Imgui.columns(3, false)
	Imgui.set_column_width(300)

	self._begin_discount_year = Imgui.input_text("Begin Year", self._begin_discount_year)

	Imgui.next_column()
	Imgui.set_column_width(300)

	self._begin_discount_month = Imgui.input_text("Begin Month", self._begin_discount_month)

	Imgui.next_column()
	Imgui.set_column_width(300)

	self._begin_discount_day = Imgui.input_text("Begin Day", self._begin_discount_day)

	Imgui.columns(0, false)
	Imgui.text("End Date")
	Imgui.text_colored("Set the end date from when the sale on the item should end", 245, 245, 207, 255)
	Imgui.columns(3, false)

	self._end_discount_year = Imgui.input_text("End Year", self._end_discount_year)

	Imgui.next_column()
	Imgui.set_column_width(300)

	self._end_discount_month = Imgui.input_text("End Month", self._end_discount_month)

	Imgui.next_column()
	Imgui.set_column_width(300)

	self._end_discount_day = Imgui.input_text("End Day", self._end_discount_day)

	Imgui.next_column()
end

ImguiStoreRotation._store_rotation_discounts_tab = function (self)
	Imgui.text("Store Rotation Discounts")
	Imgui.text_colored("This tab only supports discounting STEAM ITEMS.\nSupport to discount PLAYFAB items will be added in the near future.", 255, 0, 0, 255)
	Imgui.dummy(2, 5)
	Imgui.text_colored("Set the file name and the Steam Application ID (This field is prefilled to be the 'Vermintide 2 Internal Test' Steam App ID: 795750)", 245, 245, 207, 255)
	self:_do_discount_rotation_file_name()
	self:_draw_dicount_begin_and_end_fields()
	Imgui.dummy(2, 5)
	Imgui.separator()
	Imgui.columns(2, true)
	Imgui.text("Edit Discounts")
	self:_do_edit_discounts_button()

	local is_valid_end_date = _has_valid_input_date(self._end_discount_year, self._end_discount_month, self._end_discount_day)

	self:_do_discount_item_selection(is_valid_end_date)
	self:_handle_discount_page_errors(is_valid_end_date)
	self:_do_clear_discount_edit_buttons()
	self:_do_save_discounted_items_button()

	if self._save_successful_discount ~= "" then
		Imgui.text_colored(self._save_successful_discount, 255, 196, 0, 255)
	end

	Imgui.next_column()
	Imgui.text("Preview Discounted Items")
	Imgui.separator()
	self:_do_preview_discounted_items()
	Imgui.next_column()
	Imgui.columns(0, false)
end

ImguiStoreRotation._do_discount_rotation_file_name = function (self)
	Imgui.dummy(2, 3)

	self._new_discount_file_name = Imgui.input_text("Steam Discount File Name", self._new_discount_file_name)

	local current_indx = Imgui.combo("Steam App Id", self._appid_idx, APP_IDS, 2)

	if current_indx ~= self._appid_idx then
		self._appid = APP_IDS[current_indx]
		self._appid_idx = current_indx
	end

	Imgui.dummy(2, 5)
	Imgui.separator()
end

ImguiStoreRotation._do_edit_discounts_button = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("Edit Discounts")
	Imgui.text_colored("Select an item and set the anount of which it should be discounted by", 245, 245, 207, 255)

	if Imgui.button("DISCOUNT Item", 200, 20) then
		self._is_selecting_discount_item = true

		self:_on_search_type_changed(SEARCH_TYPES.discount)
	end

	if Imgui.button("REMOVE LAST Item", 200, 20) then
		self:_remove_last_added_item(self._discounted_items)
	end
end

ImguiStoreRotation._on_search_type_changed = function (self, search_type)
	self._search_type = search_type
	self._item_search_results = table.clone(self._searcheable_item_keys[search_type])
end

ImguiStoreRotation._do_discount_item_selection = function (self, is_valid_end_date)
	if self._is_selecting_discount_item then
		Imgui.dummy(2, 5)
		Imgui.text_colored("OBS! PRESS ENTER", 255, 0, 0, 255)
		Imgui.same_line()
		Imgui.text("after inputting the discoiunt to apply it")

		self._discount_amount = Imgui.input_int("Discount amount", self._discount_amount)

		self:_draw_item_selection()

		if self._selected_item_index ~= -1 then
			local is_valid_discount = self._discount_amount > 0 and self._discount_amount <= 100

			if is_valid_discount and is_valid_end_date then
				local selected_item_key = self._item_search_results[self._selected_item_index]
				local item = rawget(ItemMasterList, selected_item_key)

				fassert(item, "Item %s is not in the ItemMasterList", selected_item_key)

				local is_steam_item = _is_steam_item(item)

				self._is_playfab_item = not is_steam_item

				if is_steam_item then
					local discount = self._discount_amount
					local item = self:_generate_discounted_item(selected_item_key, item, discount)
					local temp_item = {}

					temp_item.key = selected_item_key
					temp_item.item = item
					self._discounted_items[#self._discounted_items + 1] = temp_item
					self._has_error_discount = false
					self._selected_item_index = -1
					self._item_search_text = ""
					self._is_selecting_discount_item = false
				else
					self._has_error_discount = true
				end
			else
				self._has_error_discount = true
				self._selected_item_index = -1
				self._item_search_text = ""
			end
		end
	end
end

ImguiStoreRotation._handle_discount_page_errors = function (self, is_valid_end_date)
	if self._has_error_discount then
		local error_text = ""

		if self._discount_amount <= 0 then
			error_text = string.format("ERROR: You are tring to discount an item by %d,\nThe discount amount must be greater than 0", self._discount_amount)
		elseif self._discount_amount > 100 then
			error_text = string.format("ERROR: You are tring to discount an item by %d,\nThe discount amount must be less then or equal to 100", self._discount_amount)
		end

		if not is_valid_end_date then
			error_text = error_text .. "\n" .. string.format("ERROR: You are tring to set a discount time with an invalid end date,\nThe date cannot be %s-%s-%s", self._end_discount_year, self._end_discount_month, self._end_discount_day)
		end

		if self._is_playfab_item then
			error_text = error_text .. "\n" .. "ERROR: The Item you are trying to discount is a Playfab item.\nCurrently this tool does not support discounting Playfab items."
		end

		if error_text then
			Imgui.text_colored(error_text, 255, 0, 0, 255)
		end
	end
end

ImguiStoreRotation._do_clear_discount_edit_buttons = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("Clear All Discounted Items")
	Imgui.text_colored("Delete all the edited discounted items.", 245, 245, 207, 255)

	if Imgui.button("Clear Discounted Items", 200, 20) then
		table.clear(self._discounted_items)
	end
end

ImguiStoreRotation._do_save_discounted_items_button = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("Save Discounts")
	Imgui.text_colored("Save the discounted items to a JSON file, that can be easily uploaded to Steam.", 245, 245, 207, 255)

	if Imgui.button("SAVE DISCOUNTS TO FILE", 250, 50) then
		self:_save_discounts_to_file()
	end
end

ImguiStoreRotation._do_preview_discounted_items = function (self)
	Imgui.dummy(2, 10)
	Imgui.text("DISCOUNTED ITEMS: " .. #self._discounted_items)

	if not table.is_empty(self._discounted_items) then
		self:_draw_discounted_items(self._discounted_items)
	end
end

ImguiStoreRotation._get_from_to_discount_price = function (self, steam_itemdefid)
	local backend_store = self._backend_store
	local preview_price_tamplate_string = "Discounted by %d percent from %.2f %s to %.2f %s"
	local current_price, currency = backend_store:get_steam_item_price(steam_itemdefid)
	local discounted_price = current_price - math.floor(current_price * (self._discount_amount / 100))
	local preview_string = string.format(preview_price_tamplate_string, self._discount_amount, current_price * 0.01, currency, discounted_price * 0.01, currency)

	return preview_string
end

ImguiStoreRotation._draw_discounted_items = function (self, items_list)
	for i = 1, #items_list do
		local discounted_item = items_list[i]
		local item = discounted_item.item
		local selected_item = discounted_item.key

		Imgui.text_colored("Discounted Item: " .. selected_item, 245, 245, 207, 255)

		local preview_string = self:_get_from_to_discount_price(item.itemdefid)

		Imgui.text(preview_string)
		Imgui.dummy(2, 5)

		for key, value in pairs(item) do
			if item.error_text then
				Imgui.text_colored(key .. " : " .. value, 255, 0, 0, 255)
			else
				Imgui.text_colored(key .. " : ", 0, 186, 112, 255)
				Imgui.same_line()
				Imgui.text_colored(tostring(value), 0, 193, 212, 255)
			end
		end

		Imgui.dummy(2, 5)
	end
end

ImguiStoreRotation._get_rotation_items = function (self)
	local items = {}

	for i = 1, #self._discounted_items do
		local temp_item = self._discounted_items[i]

		items[#items + 1] = temp_item.item
	end

	return items
end

ImguiStoreRotation._save_discounts_to_file = function (self)
	if not self._has_error_discount then
		local items = self:_get_rotation_items()
		local json_object = cjson.encode({
			appid = self._appid,
			items = items,
		})

		json_object = json_object:gsub("\\/", "/")

		local project_source = script_data.source_dir

		self._fp = assert(io.open(project_source .. "/.shop/rotation/" .. self._new_discount_file_name .. ".json", "w"))

		self._fp:write(json_object)
		self._fp:close()

		self._save_successful_discount = "File saved succsessfully at\n" .. project_source .. "/.shop/rotation/" .. self._new_discount_file_name .. ".json"

		self:_save_settings()
	end
end

ImguiStoreRotation._item_and_bundle_creator = function (self)
	Imgui.text("Item Creator Tab")
	Imgui.text_colored("OBS! The items must first have been created in their respective ItemMasterList!", 255, 0, 0, 255)

	self._itemdef_filename = Imgui.input_text("Item Definition File Name", self._itemdef_filename)
end

ImguiStoreRotation._handle_error_messages = function (self)
	if self._timestamp_error then
		Imgui.text_colored("Achtung!!: ", 255, 0, 0, 255)
		Imgui.same_line()
		Imgui.text("Something is wrong with the date you have given, something seems to be missing!")
	end

	if self._missing_file_name then
		if self._new_rotation_file_name ~= "" then
			self._missing_file_name = nil
		end

		Imgui.text_colored("Achtung!!: ", 255, 0, 0, 255)
		Imgui.same_line()
		Imgui.text("No new file name has been given please name your file before saving!")
	end
end
