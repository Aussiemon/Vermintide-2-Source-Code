-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_loadout_inventory.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_inventory_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false

HeroWindowLoadoutInventory = class(HeroWindowLoadoutInventory)
HeroWindowLoadoutInventory.NAME = "HeroWindowLoadoutInventory"

local function item_sort_func(item_1, item_2)
	local item_data_1 = item_1.data
	local item_data_2 = item_2.data
	local item_key_1 = item_data_1.key
	local item_key_2 = item_data_2.key
	local item_1_power_level = item_1.power_level or 0
	local item_2_power_level = item_2.power_level or 0
	local item_1_backend_id = item_1.backend_id
	local item_2_backend_id = item_2.backend_id
	local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id, item_1)
	local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id, item_2)

	if item_1_favorited == item_2_favorited then
		if item_1_power_level == item_2_power_level then
			local item_1_rarity = item_1.rarity or item_data_1.rarity
			local item_2_rarity = item_2.rarity or item_data_2.rarity
			local item_rarity_order = UISettings.item_rarity_order
			local item_1_rarity_order = item_rarity_order[item_1_rarity]
			local item_2_rarity_order = item_rarity_order[item_2_rarity]

			if item_1_rarity_order == item_2_rarity_order then
				local item_type_1 = Localize(item_data_1.item_type)
				local item_type_2 = Localize(item_data_2.item_type)

				if item_type_1 == item_type_2 then
					local _, item_1_display_name = UIUtils.get_ui_information_from_item(item_1)
					local _, item_2_display_name = UIUtils.get_ui_information_from_item(item_2)
					local item_name_1 = Localize(item_1_display_name)
					local item_name_2 = Localize(item_2_display_name)

					return item_name_1 < item_name_2
				else
					return item_type_1 < item_type_2
				end
			else
				return item_1_rarity_order < item_2_rarity_order
			end
		else
			return item_2_power_level < item_1_power_level
		end
	elseif item_1_favorited then
		return true
	else
		return false
	end
end

local display_titles_by_slot_type = {
	melee = Localize("inventory_screen_melee_weapon_title"),
	ranged = Localize("inventory_screen_ranged_weapon_title"),
	necklace = Localize("inventory_screen_necklace_title"),
	trinket = Localize("inventory_screen_trinket_title"),
	ring = Localize("inventory_screen_ring_title"),
}

HeroWindowLoadoutInventory.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowLoadoutInventory")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self._categories = self:_create_item_categories(self.profile_index, self.career_index)
	self._animations = {}

	self:create_ui_elements(params, offset)

	local item_grid = ItemGridUI:new(self._categories, self._widgets_by_name.item_grid, self.hero_name, self.career_index)

	self._item_grid = item_grid

	item_grid:mark_equipped_items(true)
	item_grid:mark_locked_items(true)
	item_grid:disable_locked_items(true)
	item_grid:disable_unwieldable_items(true)
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)

	local player_unit = local_player and local_player.player_unit

	if player_unit then
		local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

		if inventory_extension then
			inventory_extension:check_and_drop_pickups("enter_inventory")
		end
	end
end

HeroWindowLoadoutInventory._create_item_categories = function (self, profile_index, career_index)
	local career_index = self.career_index
	local profile_index = self.profile_index
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local item_slot_types_by_slot_name = career.item_slot_types_by_slot_name
	local categories = {}

	for slot_name, slot_types in pairs(item_slot_types_by_slot_name) do
		local slot = InventorySettings.slots_by_name[slot_name]
		local ui_slot_index = slot.ui_slot_index

		if ui_slot_index then
			local item_filter = "( "
			local display_name = ""
			local slot_icon
			local potential_icons = {}

			for index, slot_type in ipairs(slot_types) do
				local slot_display_name = display_titles_by_slot_type[slot_type]

				display_name = display_name .. slot_display_name
				item_filter = item_filter .. "slot_type == " .. slot_type

				if index < #slot_types then
					display_name = display_name .. " - "
					item_filter = item_filter .. " or "
				else
					item_filter = item_filter .. " ) and item_rarity ~= magic"
				end

				for icon_key, icon in pairs(UISettings.slot_icons) do
					if string.find(icon_key, slot_type) then
						potential_icons[icon_key] = icon
					end
				end
			end

			for icon_key, icon in pairs(potential_icons) do
				local is_correct_icon = true

				for _, slot_type in ipairs(slot_types) do
					if not string.find(icon_key, slot_type) then
						is_correct_icon = false

						break
					end
				end

				if is_correct_icon then
					slot_icon = icon

					break
				end
			end

			local category = {
				hero_specific_filter = true,
				name = slot_name,
				display_name = display_name,
				icon = slot_icon,
				item_types = slot_types,
				slot_index = ui_slot_index,
				slot_name = slot_name,
				item_filter = item_filter,
			}

			categories[ui_slot_index] = category
		end
	end

	return categories
end

HeroWindowLoadoutInventory.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self:_setup_tab_widget()
end

HeroWindowLoadoutInventory._setup_tab_widget = function (self)
	local categories = self._categories
	local num_tabs = #categories
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local item_tabs_segments = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_vertical", {
		5,
		35,
	}, "item_tabs_segments", num_tabs - 1))
	local item_tabs_segments_top = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_top", {
		17,
		9,
	}, "item_tabs_segments_top", num_tabs - 1))
	local item_tabs_segments_bottom = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_bottom", {
		17,
		9,
	}, "item_tabs_segments_bottom", num_tabs - 1))

	widgets_by_name.item_tabs_segments = item_tabs_segments
	widgets_by_name.item_tabs_segments_top = item_tabs_segments_top
	widgets_by_name.item_tabs_segments_bottom = item_tabs_segments_bottom
	widgets[#widgets + 1] = item_tabs_segments
	widgets[#widgets + 1] = item_tabs_segments_top
	widgets[#widgets + 1] = item_tabs_segments_bottom

	local scenegraph_id = "item_tabs"
	local size = scenegraph_definition.item_tabs.size
	local widget_definition = UIWidgets.create_default_icon_tabs(scenegraph_id, size, num_tabs)
	local widget = UIWidget.init(widget_definition)

	widgets_by_name[scenegraph_id] = widget
	widgets[#widgets + 1] = widget

	local widget_content = widget.content

	for index, category in ipairs(categories) do
		local name_suffix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_suffix
		local icon_name = "icon" .. name_suffix
		local hotspot_content = widget_content[hotspot_name]
		local slot_index = category.slot_index
		local icon = category.icon

		hotspot_content[icon_name] = icon
		hotspot_content.slot_index = slot_index
	end
end

HeroWindowLoadoutInventory.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowLoadoutInventory")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil
end

HeroWindowLoadoutInventory.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_selected_loadout_slot_index()
	self:_update_loadout_sync()
	self:_update_page_info()
	self:draw(dt)
end

HeroWindowLoadoutInventory.post_update = function (self, dt, t)
	return
end

HeroWindowLoadoutInventory._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
end

HeroWindowLoadoutInventory._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowLoadoutInventory._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowLoadoutInventory._is_inventory_tab_hovered = function (self)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_enter then
			return i
		end
	end
end

HeroWindowLoadoutInventory._is_inventory_tab_pressed = function (self)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_release and not hotspot_content.is_selected then
			return i
		end
	end
end

HeroWindowLoadoutInventory._select_tab_by_slot_index = function (self, index)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		local slot_index = hotspot_content.slot_index

		hotspot_content.is_selected = index == slot_index
	end
end

HeroWindowLoadoutInventory._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self.parent
	local item_grid = self._item_grid
	local allow_single_press = false
	local item, is_equipped = item_grid:is_item_pressed(allow_single_press)
	local input_service = parent:window_input_service()

	if item_grid:handle_favorite_marking(input_service) then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if item_grid:is_item_hovered() then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if item and not is_equipped then
		parent:_set_loadout_item(item, self._strict_slot_name)
		self:_play_sound("play_gui_equipment_equip_hero")
	end

	local item_tabs = widgets_by_name.item_tabs

	UIWidgetUtils.animate_default_icon_tabs(item_tabs, dt)

	local tab_index_hovered = self:_is_inventory_tab_hovered()

	if tab_index_hovered then
		self:_play_sound("play_gui_inventory_tab_hover")
	end

	local tab_index_pressed = self:_is_inventory_tab_pressed()

	if tab_index_pressed and tab_index_pressed ~= self._category_index then
		local slot_index = self:_get_category_slot_index(tab_index_pressed)

		parent:set_selected_loadout_slot_index(slot_index)
		self:_play_sound("play_gui_inventory_tab_click")
	elseif Managers.input:is_device_active("gamepad") then
		local input_service = Managers.input:get_service("hero_view")
		local current_index = parent._selected_loadout_slot_index or 1
		local num_tabs = #self._categories

		if input_service:get("cycle_previous") and current_index > 1 then
			parent:set_selected_loadout_slot_index(current_index - 1)
			self:_play_sound("play_gui_inventory_tab_click")
		elseif input_service:get("cycle_next") and current_index < num_tabs then
			parent:set_selected_loadout_slot_index(current_index + 1)
			self:_play_sound("play_gui_inventory_tab_click")
		end
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_default_button(page_button_next, dt)
	UIWidgetUtils.animate_default_button(page_button_previous, dt)

	if self:_is_button_hovered(page_button_next) or self:_is_button_hovered(page_button_previous) then
		self:_play_sound("play_gui_inventory_next_hover")
	end

	if self:_is_button_pressed(page_button_next) then
		local next_page_index = self._current_page + 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_equipment_inventory_next_click")
	elseif self:_is_button_pressed(page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_equipment_inventory_next_click")
	end
end

HeroWindowLoadoutInventory._update_page_info = function (self)
	local current_page, total_pages = self._item_grid:get_page_info()

	if current_page ~= self._current_page or total_pages ~= self._total_pages then
		self._total_pages = total_pages
		self._current_page = current_page
		current_page = current_page or 1
		total_pages = total_pages or 1

		local widgets_by_name = self._widgets_by_name

		widgets_by_name.page_text_left.content.text = tostring(current_page)
		widgets_by_name.page_text_right.content.text = tostring(total_pages)
		widgets_by_name.page_button_next.content.button_hotspot.disable_button = current_page == total_pages
		widgets_by_name.page_button_previous.content.button_hotspot.disable_button = current_page == 1
	end
end

HeroWindowLoadoutInventory._get_category_slot_index = function (self, index)
	local categories = self._categories
	local category = categories[index]

	return category.slot_index
end

HeroWindowLoadoutInventory._get_category_index_by_slot_index = function (self, slot_index)
	local categories = self._categories

	for i, category in ipairs(categories) do
		if category.slot_index == slot_index then
			return i
		end
	end
end

HeroWindowLoadoutInventory._update_selected_loadout_slot_index = function (self)
	local slot_index = self.parent:get_selected_loadout_slot_index()
	local category_index = self:_get_category_index_by_slot_index(slot_index)

	if slot_index ~= self._selected_loadout_slot_index then
		self:_change_category_by_index(category_index)

		self._selected_loadout_slot_index = slot_index
		self._category_index = category_index
	end
end

HeroWindowLoadoutInventory._update_loadout_sync = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._loadout_sync_id = loadout_sync_id

		item_grid:update_items_status()
	end
end

HeroWindowLoadoutInventory._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowLoadoutInventory.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowLoadoutInventory._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowLoadoutInventory._change_category_by_index = function (self, index)
	self:_select_tab_by_slot_index(index)

	local categories = self._categories
	local category = categories[index]
	local category_slot_name = category.slot_name

	self._strict_slot_name = category_slot_name

	local category_name = category.name
	local display_name = category.display_name

	self._widgets_by_name.item_grid_header.content.text = display_name

	self._item_grid:change_category(category_name)

	return true
end
