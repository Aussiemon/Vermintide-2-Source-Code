local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_grid_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local SELECTION_INPUT = "confirm_press"
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

local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"
StartGameWindowMutatorGridConsole = class(StartGameWindowMutatorGridConsole)
StartGameWindowMutatorGridConsole.NAME = "StartGameWindowMutatorGridConsole"

StartGameWindowMutatorGridConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorGridConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
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

	local hero_name = "empire_soldier"
	local career_index = 1
	local item_grid = ItemGridUI:new(grid_settings, self._widgets_by_name.item_grid, hero_name, career_index)

	item_grid:change_category("heroic_deeds")
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)
	self:_setup_input_buttons()

	self._item_grid = item_grid
	self._previously_selected_backend_id = self.parent:get_selected_heroic_deed_backend_id()

	self.parent:set_input_description("select_heroic_deed")
	self:_start_transition_animation("on_enter")

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		self.parent:set_selected_heroic_deed_backend_id(nil)
	end
end

StartGameWindowMutatorGridConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowMutatorGridConsole.create_ui_elements = function (self, params, offset)
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

StartGameWindowMutatorGridConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorGridConsole")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	self.parent:set_input_description(nil)

	if (self._previously_selected_backend_id and not self._selected_backend_id) or not self._confirm_selection then
		self.parent:set_selected_heroic_deed_backend_id(self._previously_selected_backend_id)
	end

	self._confirm_selection = nil
end

StartGameWindowMutatorGridConsole.update = function (self, dt, t)
	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_update_page_info()
	self:_update_selected_item_backend_id()
	self:_handle_input(dt, t)
	self:_handle_gamepad_activity()
	self:draw(dt)
end

StartGameWindowMutatorGridConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowMutatorGridConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

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

StartGameWindowMutatorGridConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowMutatorGridConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowMutatorGridConsole._handle_input = function (self, dt, t)
	local input_service = self.parent:window_input_service()
	local item_grid = self._item_grid

	if item_grid:handle_gamepad_selection(input_service) then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	local selected_item = item_grid:selected_item()

	if selected_item and selected_item.backend_id ~= self._selected_backend_id then
		self.parent:set_selected_heroic_deed_backend_id(selected_item.backend_id)
	end

	if item_grid:is_item_hovered() then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	local allow_single_press = true
	local item = item_grid:is_item_pressed(allow_single_press)

	if item then
		self:_play_sound("play_gui_lobby_button_04_heroic_deed_inventory_click")

		local backend_id = item.backend_id

		self.parent:set_selected_heroic_deed_backend_id(backend_id)

		self._selected_backend_id = backend_id
		self._confirm_selection = true

		self.parent:set_layout_by_name("heroic_deeds")
	end

	local widgets_by_name = self._widgets_by_name
	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	if self:_is_button_hovered(page_button_next) or self:_is_button_hovered(page_button_previous) then
		self:_play_sound("play_gui_inventory_next_hover")
	end

	local next_page_index = self._current_page

	if self:_is_button_pressed(page_button_next) or input_service:get(INPUT_ACTION_NEXT) then
		next_page_index = math.min(next_page_index + 1, self._total_pages)
	elseif self:_is_button_pressed(page_button_previous) or input_service:get(INPUT_ACTION_PREVIOUS) then
		next_page_index = math.max(next_page_index - 1, 1)
	end

	if next_page_index ~= self._current_page then
		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_equipment_inventory_next_click")

		local first_item = self._item_grid:get_item_in_slot(1, 1)

		if first_item then
			self.parent:set_selected_heroic_deed_backend_id(first_item.backend_id)
		end
	end

	if input_service:get(SELECTION_INPUT) then
		self._confirm_selection = true

		self.parent:set_layout_by_name("heroic_deeds")
	end
end

StartGameWindowMutatorGridConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowMutatorGridConsole._update_selected_item_backend_id = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local parent = self.parent
	local item_grid = self._item_grid

	if gamepad_active then
		local backend_id = parent:get_selected_heroic_deed_backend_id()

		if backend_id ~= self._selected_backend_id then
			self._selected_backend_id = backend_id

			item_grid:set_backend_id_selected(backend_id)
		elseif not backend_id then
			local first_item = item_grid:get_item_in_slot(1, 1)

			if first_item then
				parent:set_selected_heroic_deed_backend_id(first_item.backend_id)
			end
		end
	elseif self._selected_backend_id then
		parent:set_selected_heroic_deed_backend_id(nil)
		item_grid:set_backend_id_selected(nil)

		self._selected_backend_id = nil
	end
end

StartGameWindowMutatorGridConsole.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowMutatorGridConsole._update_page_info = function (self)
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

StartGameWindowMutatorGridConsole._setup_input_buttons = function (self)
	local input_service = self.parent:window_input_service()
	local widgets_by_name = self._widgets_by_name
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local input_1_widget = widgets_by_name.input_icon_next
	local icon_style_input_1 = input_1_widget.style.texture_id
	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2]
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local input_2_widget = widgets_by_name.input_icon_previous
	local icon_style_input_2 = input_2_widget.style.texture_id
	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2]
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

StartGameWindowMutatorGridConsole._set_gamepad_input_buttons_visibility = function (self, visible)
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

StartGameWindowMutatorGridConsole._handle_gamepad_activity = function (self)
	local force_update = self.gamepad_active_last_frame == nil
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			self:_set_gamepad_input_buttons_visibility(true)
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		self:_set_gamepad_input_buttons_visibility(false)
	end
end

return
