local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_inventory_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"
HeroWindowCraftingInventoryConsole = class(HeroWindowCraftingInventoryConsole)
HeroWindowCraftingInventoryConsole.NAME = "HeroWindowCraftingInventoryConsole"

HeroWindowCraftingInventoryConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCraftingInventoryConsole")

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

	self:_setup_input_buttons()

	local item_grid = ItemGridUI:new(crafting_recipes, self._widgets_by_name.item_grid, self.hero_name, self.career_index)
	self._item_grid = item_grid

	item_grid:mark_equipped_items(true)
	item_grid:mark_locked_items(true)
	item_grid:disable_locked_items(false)
	item_grid:disable_item_drag()

	local inventory_sync_id = self.parent.inventory_sync_id
	self._inventory_sync_id = inventory_sync_id

	self:_start_transition_animation("on_enter")
	self.parent:set_inventory_grid(item_grid)
end

HeroWindowCraftingInventoryConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowCraftingInventoryConsole.create_ui_elements = function (self, params, offset)
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
end

HeroWindowCraftingInventoryConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCraftingInventoryConsole")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil
end

HeroWindowCraftingInventoryConsole._input_service = function (self)
	local parent = self.parent

	if parent:is_friends_list_active() then
		return FAKE_INPUT_SERVICE
	end

	return parent:window_input_service()
end

HeroWindowCraftingInventoryConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_handle_gamepad_input(dt, t)
	self:_update_inventory_items()
	self:_update_disabled_item_icon()
	self:_update_disabled_backend_ids()
	self:_update_page_info()
	self:_handle_gamepad_activity()
	self:_update_selected_item_tooltip()
	self:draw(dt)
end

HeroWindowCraftingInventoryConsole.post_update = function (self, dt, t)
	return
end

HeroWindowCraftingInventoryConsole._update_animations = function (self, dt)
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
	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_arrow_button(page_button_next, dt)
	UIWidgetUtils.animate_arrow_button(page_button_previous, dt)
end

HeroWindowCraftingInventoryConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCraftingInventoryConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowCraftingInventoryConsole._handle_gamepad_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local parent = self.parent
	local input_service = self:_input_service()
	local item_grid = self._item_grid
	local handled = item_grid:handle_gamepad_selection(input_service)

	if handled then
		self:_play_sound("play_gui_craft_forge_hover")
	end

	if input_service:get("confirm", true) then
		local selected_item = item_grid:selected_item()

		if selected_item then
			local backend_id = selected_item.backend_id
			self._pressed_backend_id = backend_id
			local is_drag_item = false

			parent:set_pressed_item_backend_id(backend_id, is_drag_item)
		end
	end

	local page_index = self._current_page
	local total_pages = self._total_pages

	if page_index and total_pages then
		if page_index < total_pages and input_service:get(INPUT_ACTION_NEXT) then
			item_grid:set_item_page(page_index + 1)
			self:_play_sound("play_gui_craft_inventory_next")

			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(first_item)
		elseif page_index > 1 and input_service:get(INPUT_ACTION_PREVIOUS) then
			item_grid:set_item_page(page_index - 1)
			self:_play_sound("play_gui_craft_inventory_next")

			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(first_item)
		end
	end
end

HeroWindowCraftingInventoryConsole._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self.parent
	local item_grid = self._item_grid
	local allow_single_press = false
	local item, is_equipped = item_grid:is_item_pressed(allow_single_press)

	if item_grid:is_item_hovered() then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if self._pressed_backend_id and parent:get_pressed_item_backend_id() == self._pressed_backend_id then
		parent:set_pressed_item_backend_id(nil)

		self._pressed_backend_id = nil
	end

	if item then
		local backend_id = item.backend_id
		self._pressed_backend_id = backend_id
		local is_drag_item = false

		parent:set_pressed_item_backend_id(backend_id, is_drag_item)
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	if self:_is_button_hovered(page_button_next) or self:_is_button_hovered(page_button_previous) then
		self:_play_sound("play_gui_inventory_next_hover")
	end

	if self:_is_button_pressed(page_button_next) then
		local next_page_index = self._current_page + 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_craft_inventory_next")
	elseif self:_is_button_pressed(page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_craft_inventory_next")
	end

	self:_handle_recipe_inputs(dt, t)
end

HeroWindowCraftingInventoryConsole._handle_recipe_inputs = function (self, dt, t)
	local input_service = self:_input_service()
	local local_crafting_recipes_by_name = crafting_recipes_by_name
	local recipe = local_crafting_recipes_by_name[self._selected_craft_page_name]

	if recipe and recipe.input_func then
		recipe.input_func(self, input_service)
	end
end

HeroWindowCraftingInventoryConsole._update_page_info = function (self)
	local current_page, total_pages = self._item_grid:get_page_info()

	if current_page ~= self._current_page or total_pages ~= self._total_pages then
		self._total_pages = total_pages
		self._current_page = current_page
		current_page = current_page or 1
		total_pages = total_pages or 1
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.page_text_left.content.text = tostring(current_page)
		widgets_by_name.page_text_right.content.text = tostring(total_pages)
		widgets_by_name.page_button_next.content.hotspot.disable_button = current_page == total_pages
		widgets_by_name.page_button_previous.content.hotspot.disable_button = current_page == 1
	end
end

HeroWindowCraftingInventoryConsole._update_crafting_material_panel = function (self)
	local backend_items = Managers.backend:get_interface("items")
	local material_textures = UISettings.crafting_material_icons_small
	local material_order = UISettings.crafting_material_order
	local widgets_by_name = self._widgets_by_name
	local index = 1

	for index, item_key in ipairs(material_order) do
		local texture = material_textures[item_key]
		local item_filter = "item_key == " .. item_key
		local items = backend_items:get_filtered_items(item_filter)
		local item = items and items[1]
		local backend_id = item and item.backend_id
		local amount = (backend_id and backend_items:get_item_amount(backend_id)) or 0
		local widget = widgets_by_name["material_text_" .. index]
		local content = widget.content
		local amount_text = nil

		if amount >= 1000 then
			amount_text = "+999"
		else
			amount_text = tostring(amount)
		end

		content.text = amount_text
		content.icon = texture

		if not content.item then
			content.item = item or {
				data = table.clone(ItemMasterList[item_key])
			}
		end
	end
end

HeroWindowCraftingInventoryConsole._update_inventory_items = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local inventory_sync_id = parent.inventory_sync_id
	local selected_craft_page_name = parent:get_selected_craft_page()
	local optional_craft_item_filter = parent:get_craft_optional_item_filter()

	if inventory_sync_id ~= self._inventory_sync_id or selected_craft_page_name ~= self._selected_craft_page_name or self._optional_craft_item_filter ~= optional_craft_item_filter then
		if selected_craft_page_name ~= self._selected_craft_page_name then
			self:_change_category_by_name(selected_craft_page_name)
		elseif optional_craft_item_filter then
			self:change_item_filter(optional_craft_item_filter, true)
			self:_handle_gamepad_activity(true)
			self:_update_selected_item_tooltip(true)
		else
			self:_change_category_by_index(nil, true)
		end

		self._inventory_sync_id = inventory_sync_id
		self._selected_craft_page_name = selected_craft_page_name
		self._optional_craft_item_filter = optional_craft_item_filter

		self:_update_crafting_material_panel()
	end
end

HeroWindowCraftingInventoryConsole._update_disabled_item_icon = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local icon = parent:disabled_item_icon()

	if icon ~= self._disabled_item_icon then
		self._disabled_item_icon = icon

		item_grid:set_locked_items_icon(icon)
	end
end

HeroWindowCraftingInventoryConsole._update_disabled_backend_ids = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local disabled_backend_ids_sync_id = parent.disabled_backend_ids_sync_id

	if disabled_backend_ids_sync_id ~= self._disabled_backend_ids_sync_id then
		self._disabled_backend_ids_sync_id = disabled_backend_ids_sync_id

		item_grid:clear_locked_items()

		local disabled_backend_ids = self.parent:get_disabled_backend_ids()

		for backend_id, _ in pairs(disabled_backend_ids) do
			item_grid:lock_item_by_id(backend_id, true)
		end

		item_grid:update_items_status()
	end
end

HeroWindowCraftingInventoryConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCraftingInventoryConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self:_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowCraftingInventoryConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCraftingInventoryConsole._change_category_by_name = function (self, name)
	for i, recipe in ipairs(crafting_recipes) do
		if recipe.name == name then
			self:_change_category_by_index(i)

			break
		end
	end
end

HeroWindowCraftingInventoryConsole._change_category_by_index = function (self, index, force_update)
	if force_update then
		index = self._current_category_index or 1
	end

	if self._current_category_index == index and not force_update then
		return
	end

	self._current_category_index = index
	local item_grid = self._item_grid
	local recipe_setting = crafting_recipes[index]
	local recipe_name = recipe_setting.name
	local item_sort_func = recipe_setting.item_sort_func

	if item_sort_func then
		item_grid:apply_item_sorting_function(item_sort_func)
	end

	item_grid:change_category(recipe_name, force_update)
	self:_handle_gamepad_activity(true)
	self:_update_selected_item_tooltip(true)

	return true
end

HeroWindowCraftingInventoryConsole.change_item_filter = function (self, item_filter, change_page)
	change_page = change_page or change_page == nil

	self._item_grid:change_item_filter(item_filter, change_page)
end

HeroWindowCraftingInventoryConsole._update_selected_item_tooltip = function (self, forced_update)
	local selected_item = self._item_grid:selected_item()
	local backend_id = selected_item and selected_item.backend_id

	if backend_id ~= self._selected_backend_id or forced_update then
		local widget = self._widgets_by_name.item_tooltip
		widget.content.item = selected_item
	end

	self._selected_backend_id = backend_id
end

HeroWindowCraftingInventoryConsole._setup_input_buttons = function (self)
	local input_service = self.parent:window_input_service()
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local icon_style_input_1 = input_1_widget.style.texture_id
	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2]
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture
	local icon_style_input_2 = input_2_widget.style.texture_id
	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2]
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

HeroWindowCraftingInventoryConsole._set_gamepad_input_buttons_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local input_arrow_1_widget = widgets_by_name.input_arrow_next
	local input_arrow_2_widget = widgets_by_name.input_arrow_previous
	input_1_widget.content.visible = visible
	input_2_widget.content.visible = visible
	input_arrow_1_widget.content.visible = visible
	input_arrow_2_widget.content.visible = visible
end

HeroWindowCraftingInventoryConsole._handle_gamepad_activity = function (self, forced_update)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	forced_update = forced_update or self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or forced_update then
			self.gamepad_active_last_frame = true
			local item_grid = self._item_grid
			local selected_item_backend_id = nil
			local selected_item = item_grid:selected_item()

			if selected_item and item_grid:has_item(selected_item) then
				selected_item_backend_id = selected_item.backend_id
			else
				local first_item = item_grid:get_item_in_slot(1, 1)
				selected_item_backend_id = first_item and first_item.backend_id
			end

			if selected_item_backend_id then
				item_grid:set_backend_id_selected(selected_item_backend_id)
			else
				item_grid:set_item_selected(nil)
			end

			self:_set_gamepad_input_buttons_visibility(true)
		end
	elseif self.gamepad_active_last_frame or forced_update then
		self.gamepad_active_last_frame = false
		local item_grid = self._item_grid

		item_grid:set_item_selected(nil)
		self:_set_gamepad_input_buttons_visibility(false)
	end
end

return
