local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_cosmetics_inventory_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
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
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)
	self._item_grid = item_grid

	item_grid.mark_equipped_items(item_grid, true)
	item_grid.mark_locked_items(item_grid, true)
	item_grid.disable_locked_items(item_grid, true)
	item_grid.disable_item_drag(item_grid)

	return 
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

	self._assign_tab_icons(self)

	return 
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

	return 
end
HeroWindowCosmeticsInventory.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCosmeticsInventory")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	return 
end
HeroWindowCosmeticsInventory.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._item_grid:update(dt, t)
	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_selected_cosmetic_slot_index(self)
	self._update_loadout_sync(self)
	self._update_page_info(self)
	self.draw(self, dt)

	return 
end
HeroWindowCosmeticsInventory.post_update = function (self, dt, t)
	return 
end
HeroWindowCosmeticsInventory._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
HeroWindowCosmeticsInventory._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
HeroWindowCosmeticsInventory._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end

	return 
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

	return 
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

	return 
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

	return 
end
HeroWindowCosmeticsInventory._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self.parent
	local item_grid = self._item_grid
	local allow_single_press = false
	local item = item_grid.is_item_pressed(item_grid, allow_single_press)

	if item_grid.is_item_hovered(item_grid) then
		self._play_sound(self, "play_gui_inventory_item_hover")
	end

	if item then
		parent._set_loadout_item(parent, item)
	end

	local item_tabs = widgets_by_name.item_tabs

	UIWidgetUtils.animate_default_icon_tabs(item_tabs, dt)

	local tab_index_hovered = self._is_inventory_tab_hovered(self)

	if tab_index_hovered then
		self._play_sound(self, "play_gui_inventory_tab_hover")
	end

	local tab_index_pressed = self._is_inventory_tab_pressed(self)

	if tab_index_pressed and tab_index_pressed ~= self._selected_cosmetic_slot_index then
		parent.set_selected_cosmetic_slot_index(parent, tab_index_pressed)
		self._play_sound(self, "play_gui_inventory_tab_click")
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_default_button(page_button_next, dt)
	UIWidgetUtils.animate_default_button(page_button_previous, dt)

	if self._is_button_hovered(self, page_button_next) or self._is_button_hovered(self, page_button_previous) then
		self._play_sound(self, "play_gui_inventory_next_hover")
	end

	if self._is_button_pressed(self, page_button_next) then
		local next_page_index = self._current_page + 1

		item_grid.set_item_page(item_grid, next_page_index)
		self._play_sound(self, "play_gui_cosmetics_inventory_next_click")
	elseif self._is_button_pressed(self, page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid.set_item_page(item_grid, next_page_index)
		self._play_sound(self, "play_gui_cosmetics_inventory_next_click")
	end

	return 
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

	return 
end
HeroWindowCosmeticsInventory._update_selected_cosmetic_slot_index = function (self)
	local index = self.parent:get_selected_cosmetic_slot_index()

	if index ~= self._selected_cosmetic_slot_index then
		self._selected_cosmetic_slot_index = index

		self._change_category_by_index(self, index)
	end

	return 
end
HeroWindowCosmeticsInventory._update_loadout_sync = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._loadout_sync_id = loadout_sync_id

		item_grid.update_items_status(item_grid)
	end

	return 
end
HeroWindowCosmeticsInventory._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
HeroWindowCosmeticsInventory.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

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

	return 
end
HeroWindowCosmeticsInventory._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroWindowCosmeticsInventory._change_category_by_index = function (self, index, force_update)
	self._select_tab_by_category_index(self, index)

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
