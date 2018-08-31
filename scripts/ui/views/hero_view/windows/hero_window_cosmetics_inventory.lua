local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_cosmetics_inventory_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false

local function item_sort_func(item_1, item_2)
	local item_data_1 = item_1.data
	local item_data_2 = item_2.data
	local item_1_rarity = item_1.rarity or item_data_1.rarity
	local item_2_rarity = item_2.rarity or item_data_2.rarity
	local item_rarity_order = UISettings.item_rarity_order
	local item_1_rarity_order = item_rarity_order[item_1_rarity]
	local item_2_rarity_order = item_rarity_order[item_2_rarity]
	local item_1_backend_id = item_1.backend_id
	local item_2_backend_id = item_2.backend_id
	local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
	local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

	if item_1_favorited == item_2_favorited then
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
	elseif item_1_favorited then
		return true
	else
		return false
	end
end

HeroWindowCosmeticsInventory = class(HeroWindowCosmeticsInventory)
HeroWindowCosmeticsInventory.NAME = "HeroWindowCosmeticsInventory"

HeroWindowCosmeticsInventory.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCosmeticsInventory")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)
	self._item_grid = item_grid

	item_grid:mark_equipped_items(true)
	item_grid:mark_locked_items(true)
	item_grid:disable_locked_items(true)
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)
end

HeroWindowCosmeticsInventory.create_ui_elements = function (self, params, offset)
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

	self:_assign_tab_icons()
end

HeroWindowCosmeticsInventory._assign_tab_icons = function (self)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_suffix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_suffix
		local icon_name = "icon" .. name_suffix
		local hotspot_content = widget_content[hotspot_name]
		local category = category_settings[i]
		local icon = category.icon
		hotspot_content[icon_name] = icon
	end
end

HeroWindowCosmeticsInventory.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCosmeticsInventory")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil
end

HeroWindowCosmeticsInventory.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_selected_cosmetic_slot_index()
	self:_update_loadout_sync()
	self:_update_page_info()
	self:draw(dt)
end

HeroWindowCosmeticsInventory.post_update = function (self, dt, t)
	return
end

HeroWindowCosmeticsInventory._update_animations = function (self, dt)
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

HeroWindowCosmeticsInventory._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCosmeticsInventory._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowCosmeticsInventory._is_inventory_tab_hovered = function (self)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_enter then
			return i
		end
	end
end

HeroWindowCosmeticsInventory._is_inventory_tab_pressed = function (self)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_release and not hotspot_content.is_selected then
			return i
		end
	end
end

HeroWindowCosmeticsInventory._select_tab_by_category_index = function (self, index)
	local widget = self._widgets_by_name.item_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		hotspot_content.is_selected = i == index
	end
end

HeroWindowCosmeticsInventory._handle_input = function (self, dt, t)
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
		parent:_set_loadout_item(item)
		self:_play_sound("play_gui_equipment_equip_hero")

		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "skin" then
			parent:update_skin_sync()
		end
	end

	local item_tabs = widgets_by_name.item_tabs

	UIWidgetUtils.animate_default_icon_tabs(item_tabs, dt)

	local tab_index_hovered = self:_is_inventory_tab_hovered()

	if tab_index_hovered then
		self:_play_sound("play_gui_inventory_tab_hover")
	end

	local tab_index_pressed = self:_is_inventory_tab_pressed()

	if tab_index_pressed and tab_index_pressed ~= self._selected_cosmetic_slot_index then
		parent:set_selected_cosmetic_slot_index(tab_index_pressed)
		self:_play_sound("play_gui_inventory_tab_click")
	elseif Managers.input:is_device_active("gamepad") then
		local input_service = Managers.input:get_service("hero_view")
		local widget = self._widgets_by_name.item_tabs
		local widget_content = widget.content
		local amount = widget_content.amount
		local current_index = parent._selected_cosmetic_slot_index or 1

		if input_service:get("cycle_previous") and current_index > 1 then
			parent:set_selected_cosmetic_slot_index(current_index - 1)
			self:_play_sound("play_gui_cosmetics_selection_click")
		elseif input_service:get("cycle_next") and current_index < amount then
			parent:set_selected_cosmetic_slot_index(current_index + 1)
			self:_play_sound("play_gui_cosmetics_selection_click")
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
		self:_play_sound("play_gui_cosmetics_inventory_next_click")
	elseif self:_is_button_pressed(page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_cosmetics_inventory_next_click")
	end
end

HeroWindowCosmeticsInventory._update_page_info = function (self)
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

HeroWindowCosmeticsInventory._update_selected_cosmetic_slot_index = function (self)
	local index = self.parent:get_selected_cosmetic_slot_index()

	if index ~= self._selected_cosmetic_slot_index then
		self._selected_cosmetic_slot_index = index

		self:_change_category_by_index(index)
	end
end

HeroWindowCosmeticsInventory._update_loadout_sync = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._loadout_sync_id = loadout_sync_id

		item_grid:update_items_status()
	end
end

HeroWindowCosmeticsInventory._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCosmeticsInventory.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowCosmeticsInventory._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCosmeticsInventory._change_category_by_index = function (self, index, force_update)
	self:_select_tab_by_category_index(index)

	if force_update then
		index = self._current_category_index or 1
	end

	if self._current_category_index == index then
		return
	end

	self._current_category_index = index
	local category_setting = category_settings[index]
	local category_name = category_setting.name
	local display_name = category_setting.display_name

	self._item_grid:change_category(category_name)

	self._widgets_by_name.item_grid_header.content.text = display_name

	return true
end

return
