local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_inventory_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
HeroWindowInventory = class(HeroWindowInventory)
HeroWindowInventory.NAME = "HeroWindowInventory"
HeroWindowInventory.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowInventory")

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
	local item_grid = ItemGridUI:new(crafting_recipes, self._widgets_by_name.item_grid, self.hero_name, self.career_index)
	self._item_grid = item_grid

	item_grid.mark_equipped_items(item_grid, true)
	item_grid.mark_locked_items(item_grid, true)
	item_grid.disable_locked_items(item_grid, true)
	item_grid.disable_item_drag(item_grid)

	local inventory_sync_id = self.parent.inventory_sync_id
	self._inventory_sync_id = inventory_sync_id

	return 
end
HeroWindowInventory.create_ui_elements = function (self, params, offset)
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

	return 
end
HeroWindowInventory.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowInventory")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	return 
end
HeroWindowInventory.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._item_grid:update(dt, t)
	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_inventory_items(self)
	self._update_disabled_backend_ids(self)
	self._update_page_info(self)
	self.draw(self, dt)

	return 
end
HeroWindowInventory.post_update = function (self, dt, t)
	return 
end
HeroWindowInventory._update_animations = function (self, dt)
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
HeroWindowInventory._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
HeroWindowInventory._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end

	return 
end
HeroWindowInventory._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self.parent
	local item_grid = self._item_grid
	local allow_single_press = false
	local item_pressed = item_grid.is_item_pressed(item_grid, allow_single_press)
	local item_dragged = item_grid.is_item_dragged(item_grid)
	local item = item_pressed or item_dragged

	if item_grid.is_item_hovered(item_grid) then
		self._play_sound(self, "play_gui_inventory_item_hover")
	end

	if item then
		local backend_id = item.backend_id
		self._pressed_backend_id = backend_id
		local is_drag_item = item_dragged ~= nil

		parent.set_pressed_item_backend_id(parent, backend_id, is_drag_item)
	elseif self._pressed_backend_id then
		if parent.get_pressed_item_backend_id(parent) == self._pressed_backend_id then
			parent.set_pressed_item_backend_id(parent, nil)
		end

		self._pressed_backend_id = nil
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
		self._play_sound(self, "play_gui_craft_inventory_next_click")
	elseif self._is_button_pressed(self, page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid.set_item_page(item_grid, next_page_index)
		self._play_sound(self, "play_gui_craft_inventory_next_click")
	end

	return 
end
HeroWindowInventory._update_page_info = function (self)
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
HeroWindowInventory._update_inventory_items = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local inventory_sync_id = parent.inventory_sync_id
	local selected_craft_page_name = parent.get_selected_craft_page(parent)
	local optional_craft_item_filter = parent.get_craft_optional_item_filter(parent)

	if inventory_sync_id ~= self._inventory_sync_id or selected_craft_page_name ~= self._selected_craft_page_name or self._optional_craft_item_filter ~= optional_craft_item_filter then
		if selected_craft_page_name ~= self._selected_craft_page_name then
			self._change_category_by_name(self, selected_craft_page_name)
		elseif optional_craft_item_filter then
			self.change_item_filter(self, optional_craft_item_filter, true)
		else
			self._change_category_by_index(self, nil, true)
		end

		self._inventory_sync_id = inventory_sync_id
		self._selected_craft_page_name = selected_craft_page_name
		self._optional_craft_item_filter = optional_craft_item_filter
	end

	return 
end
HeroWindowInventory._update_disabled_backend_ids = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local disabled_backend_ids_sync_id = parent.disabled_backend_ids_sync_id

	if disabled_backend_ids_sync_id ~= self._disabled_backend_ids_sync_id then
		self._disabled_backend_ids_sync_id = disabled_backend_ids_sync_id

		item_grid.clear_locked_items(item_grid)

		local disabled_backend_ids = self.parent:get_disabled_backend_ids()

		for backend_id, _ in pairs(disabled_backend_ids) do
			item_grid.lock_item_by_id(item_grid, backend_id, true)
		end

		item_grid.update_items_status(item_grid)
	end

	return 
end
HeroWindowInventory._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
HeroWindowInventory.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	return 
end
HeroWindowInventory._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroWindowInventory._change_category_by_name = function (self, name)
	for i, recipe in ipairs(crafting_recipes) do
		if recipe.name == name then
			self._change_category_by_index(self, i)

			break
		end
	end

	return 
end
HeroWindowInventory._change_category_by_index = function (self, index, force_update)
	if force_update then
		index = self._current_category_index or 1
	end

	if self._current_category_index == index and not force_update then
		return 
	end

	self._current_category_index = index
	local recipe_setting = crafting_recipes[index]
	local recipe_name = recipe_setting.name
	local item_sort_func = recipe_setting.item_sort_func

	if item_sort_func then
		self._item_grid:apply_item_sorting_function(item_sort_func)
	end

	self._item_grid:change_category(recipe_name, force_update)

	return true
end
HeroWindowInventory.change_item_filter = function (self, item_filter, change_page)
	change_page = change_page or change_page == nil

	self._item_grid:change_item_filter(item_filter, change_page)

	return 
end

return 
