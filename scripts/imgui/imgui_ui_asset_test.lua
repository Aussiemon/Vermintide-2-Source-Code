-- chunkname: @scripts/imgui/imgui_ui_asset_test.lua

ImguiUIAssetCheck = class(ImguiUIAssetCheck)

local Gui, Imgui = Gui, Imgui
local DO_RELOAD = true
local ITEM_SLOT_TYPE_FILTERS = {
	bundle = true,
	charm = true,
	frame = true,
	hat = true,
	melee = true,
	ranged = true,
	skin = true,
	trinket = true,
	weapon_skin = true,
}

ImguiUIAssetCheck.init = function (self)
	self._active = false
	self._first_launch = true
	self._missing_asset_items_list = {}
	self._show_test_items = false
	self._show_bundles = true
	self._show_frames = true
	self._show_weapon_skin = true
	self._show_skin = true
	self._show_ranged = true
	self._show_hat = true
	self._show_trinket = true
	self._show_charm = true
	self._show_melee = true
end

ImguiUIAssetCheck.update = function (self)
	if DO_RELOAD then
		self:init()

		DO_RELOAD = false
	end
end

ImguiUIAssetCheck.on_show = function (self)
	self._active = true
end

ImguiUIAssetCheck.on_hide = function (self)
	self._active = false
end

ImguiUIAssetCheck.draw = function (self, is_open)
	local do_close = self:_do_main_window()

	self:_do_preview_window()

	return do_close
end

ImguiUIAssetCheck.is_persistent = function (self)
	return true
end

ImguiUIAssetCheck._do_main_window = function (self)
	if self._first_launch then
		local w, h = Application.resolution()

		Imgui.set_next_window_size(w * 0.4, h * 0.7)
	end

	local do_close = Imgui.begin_window("UI Items Asset Ckeck", "menu_bar")

	Imgui.separator()
	Imgui.dummy(2, 5)
	Imgui.text_colored("Check Items", 245, 245, 207, 255)
	self:_do_filter_settings()

	if Imgui.button("Do Check", 250, 35) then
		self:_do_asset_check()
	end

	Imgui:end_window()

	return do_close
end

ImguiUIAssetCheck._do_preview_window = function (self)
	if self._first_launch then
		local w, h = Application.resolution()

		Imgui.set_next_window_size(w * 0.4, h * 0.7)

		local x, y = Imgui.get_window_pos()

		Imgui.set_next_window_pos(x + w * 0.4 + 20, y)

		self._first_launch = false
	end

	local _, _ = Imgui.begin_window("UI Asset Check Preview", "menu_bar")

	Imgui.separator()
	Imgui.dummy(2, 5)
	Imgui.text_colored("Items Preview", 245, 245, 207, 255)

	if not table.is_empty(self._missing_asset_items_list) then
		self:_do_preview()
	end

	Imgui:end_window()
end

ImguiUIAssetCheck._do_filter_settings = function (self)
	self._show_test_items = Imgui.checkbox("Show Test Items", self._show_test_items)
	self._show_bundles = Imgui.checkbox("Show Bundles", self._show_bundles)
	self._show_frames = Imgui.checkbox("show Frames", self._show_frames)
	self._show_weapon_skin = Imgui.checkbox("show Weapon Skin", self._show_weapon_skin)
	self._show_skin = Imgui.checkbox("show Skin", self._show_skin)
	self._show_ranged = Imgui.checkbox("show Ranged", self._show_ranged)
	self._show_hat = Imgui.checkbox("show Hat", self._show_hat)
	self._show_trinket = Imgui.checkbox("show Trinket", self._show_trinket)
	self._show_charm = Imgui.checkbox("show Charm", self._show_charm)
	self._show_melee = Imgui.checkbox("show Melee", self._show_melee)
	ITEM_SLOT_TYPE_FILTERS.bundle = self._ignore_bundles
	ITEM_SLOT_TYPE_FILTERS.frame = self._show_frames
	ITEM_SLOT_TYPE_FILTERS.weapon_skin = self._show_weapon_skin
	ITEM_SLOT_TYPE_FILTERS.skin = self._show_skin
	ITEM_SLOT_TYPE_FILTERS.ranged = self._show_ranged
	ITEM_SLOT_TYPE_FILTERS.trinket = self._show_trinket
	ITEM_SLOT_TYPE_FILTERS.hat = self._show_hat
	ITEM_SLOT_TYPE_FILTERS.charm = self._show_charm
	ITEM_SLOT_TYPE_FILTERS.melee = self._show_melee

	Imgui.dummy(2, 25)
end

ImguiUIAssetCheck._do_asset_check = function (self)
	table.clear(self._missing_asset_items_list)

	for key, item in pairs(ItemMasterList) do
		if item.slot_type and ITEM_SLOT_TYPE_FILTERS[item.slot_type] then
			local inventory_icon = item.inventory_icon
			local description = item.description
			local display_name = item.display_name
			local has_icon = inventory_icon ~= nil and (inventory_icon ~= "icons_placeholder" or UIAtlasHelper.has_texture_by_name(inventory_icon))
			local has_description = description and Managers.localizer:_base_lookup(description)
			local has_display_name = display_name and Managers.localizer:_base_lookup(display_name)

			if not has_icon and not item.slot_type == "bundle" or not has_description or not has_display_name then
				if string.find(key, "test") and self._show_test_items then
					self._missing_asset_items_list[key] = item
				elseif string.find(key, "test") and not self._show_test_items then
					-- Nothing
				else
					self._missing_asset_items_list[key] = item
				end
			end
		end
	end
end

ImguiUIAssetCheck._should_add_item = function (self, slot_type)
	return
end

ImguiUIAssetCheck._do_preview = function (self)
	for key, item in pairs(self._missing_asset_items_list) do
		Imgui.text_colored(key .. " : ", 0, 186, 112, 255)
		Imgui.dummy(2, 4)
		Imgui.text_colored("Icon", 0, 193, 212, 255)
		Imgui.same_line()

		local has_icon = item.inventory_icon ~= nil and (item.inventory_icon ~= "icons_placeholder" or UIAtlasHelper.has_texture_by_name(item.inventory_icon))

		if has_icon then
			Imgui.text_colored(tostring(item.inventory_icon), 245, 245, 207, 255)
		else
			Imgui.text_colored(tostring(item.inventory_icon), 220, 20, 60, 255)
		end

		Imgui.text_colored("Description", 0, 193, 212, 255)
		Imgui.same_line()

		local has_description = item.description and Managers.localizer:_base_lookup(item.description)

		if has_description then
			Imgui.text_colored(Localize(item.description), 245, 245, 207, 255)
		else
			Imgui.text_colored(tostring(item.description), 220, 20, 60, 255)
		end

		Imgui.text_colored("Display Name", 0, 193, 212, 255)
		Imgui.same_line()

		local has_display_name = item.display_name and Managers.localizer:_base_lookup(item.display_name)

		if has_display_name then
			Imgui.text_colored(Localize(item.display_name), 245, 245, 207, 255)
		else
			Imgui.text_colored(tostring(item.display_name), 220, 20, 60, 255)
		end

		if Imgui.button("Save Item Name to Clipboard", 400, 20) then
			Clipboard.put(key)
		end

		Imgui.dummy(2, 4)
	end
end
