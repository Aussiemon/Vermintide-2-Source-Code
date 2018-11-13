local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_grid_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local grid_settings = {
	{
		wield = true,
		name = "heroic_deeds",
		display_name = "heroic_deeds",
		item_filter = "slot_type == deed",
		hero_specific_filter = false,
		item_types = {
			"deed"
		},
		icon = UISettings.slot_icons.melee
	}
}

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

StartGameWindowMutatorGrid = class(StartGameWindowMutatorGrid)
StartGameWindowMutatorGrid.NAME = "StartGameWindowMutatorGrid"

StartGameWindowMutatorGrid.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorGrid")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
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

	self:create_ui_elements(params, offset)

	local hero_name = "empire_soldier"
	local career_index = 1
	local item_grid = ItemGridUI:new(grid_settings, self._widgets_by_name.item_grid, hero_name, career_index)

	item_grid:change_category("heroic_deeds")
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)

	self._item_grid = item_grid
end

StartGameWindowMutatorGrid.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_scenegraph = ui_scenegraph
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

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowMutatorGrid.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorGrid")
	self._item_grid:destroy()

	self._item_grid = nil
end

StartGameWindowMutatorGrid.update = function (self, dt, t)
	self._item_grid:update(dt, t)
	self:_update_page_info()
	self:_update_selected_item_backend_id()
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowMutatorGrid.post_update = function (self, dt, t)
	return
end

StartGameWindowMutatorGrid._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowMutatorGrid._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowMutatorGrid._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local item_grid = self._item_grid
	local allow_single_press = true
	local item = item_grid:is_item_pressed(allow_single_press)

	if item_grid:is_item_hovered() then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if item then
		self:_play_sound("play_gui_lobby_button_04_heroic_deed_inventory_click")

		local backend_id = item.backend_id

		self.parent:set_selected_heroic_deed_backend_id(backend_id)
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

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

StartGameWindowMutatorGrid._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowMutatorGrid._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self._item_grid:set_backend_id_selected(backend_id)
	elseif not backend_id then
		local first_item = self._item_grid:get_item_in_slot(1, 1)

		if first_item then
			self.parent:set_selected_heroic_deed_backend_id(first_item.backend_id)
		end
	end
end

StartGameWindowMutatorGrid.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowMutatorGrid._update_page_info = function (self)
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

return
