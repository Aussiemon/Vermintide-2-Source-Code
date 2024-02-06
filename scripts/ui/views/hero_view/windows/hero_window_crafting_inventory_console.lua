-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_crafting_inventory_console.lua

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_inventory_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local pc_filter_widget_definitions = definitions.pc_filter_widgets
local create_search_input_widget = definitions.create_search_input_widget
local create_search_filters_widget = definitions.create_search_filters_widget
local DO_RELOAD = false
local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"

HeroWindowCraftingInventoryConsole = class(HeroWindowCraftingInventoryConsole)
HeroWindowCraftingInventoryConsole.NAME = "HeroWindowCraftingInventoryConsole"

HeroWindowCraftingInventoryConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCraftingInventoryConsole")

	self.params = params
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
	self._animations = {}

	self:create_ui_elements(params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	params = {
		profile_index = self.profile_index,
		career_index = self.career_index,
	}

	self:_setup_input_buttons()

	local item_grid = ItemGridUI:new(crafting_recipes, self._widgets_by_name.item_grid, self.hero_name, self.career_index, params)

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
		render_settings = self.render_settings,
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

	local widget_definition = create_search_input_widget(self)
	local widget = UIWidget.init(widget_definition)

	widgets[#widgets + 1] = widget
	widgets_by_name.input = widget
	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	local widget_definition = create_search_filters_widget("search_filters", self.ui_top_renderer, self, UISettings.inventory_filter_definitions)

	self._filter_widget = UIWidget.init(widget_definition)

	local pc_filter_widgets = {}
	local pc_filter_widgets_by_name = {}

	for name, widget_definition in pairs(pc_filter_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		pc_filter_widgets[#pc_filter_widgets + 1] = widget
		pc_filter_widgets_by_name[name] = widget
	end

	self._pc_filter_widgets = pc_filter_widgets
	self._pc_filter_widgets_by_name = pc_filter_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.item_tooltip.content.profile_index = self.params.profile_index
	widgets_by_name.item_tooltip.content.career_index = self.params.career_index

	self:_set_input_blocked(false)
end

HeroWindowCraftingInventoryConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCraftingInventoryConsole")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	self.parent:set_filter_selected(false)
	self.parent:set_filter_active(false)
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
	self:_update_filter_status()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_handle_gamepad_input(dt, t)
	self:_update_inventory_items()
	self:_update_disabled_item_icon()
	self:_update_disabled_backend_ids()
	self:_update_page_info()
	self:_handle_gamepad_activity()
	self:_update_selected_item_tooltip()
	self:_update_filter_reset()
	self:_handle_filer_widgets_sounds()
	self:draw(dt)

	if self._do_delayed_search then
		local filter_widget_content = self._filter_widget.content
		local input_content = self._widgets_by_name.input.content

		self:_do_search(input_content.search_query, filter_widget_content.query)

		self._do_delayed_search = false
	end
end

HeroWindowCraftingInventoryConsole._update_filter_status = function (self)
	local filter_disabled, search_disabled = self.parent:filter_search_disabled()
	local widget = self._widgets_by_name.input
	local widget_content = widget.content

	widget_content.hotspot.disable_button = search_disabled
	widget_content.clear_hotspot.disable_button = search_disabled
	widget_content.search_filters_hotspot.disable_button = filter_disabled
end

HeroWindowCraftingInventoryConsole._update_filter_reset = function (self, force_reset)
	local filter_reset = self.parent:filter_reset()

	if filter_reset or force_reset then
		local filter_widget = self._filter_widget
		local filter_widget_content = filter_widget.content

		table.clear(filter_widget_content.query.sort)
		table.clear(filter_widget_content.query.filter)

		filter_widget_content.query.only_new = nil

		local input_widget = self._widgets_by_name.input
		local input_content = input_widget.content

		input_content.search_query, input_content.caret_index, input_content.text_index = "", 1, 1

		self:_do_search(input_content.search_query, filter_widget_content.query)
		self:_set_filter_selected(false)
	end
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
	UIWidgetUtils.animate_default_button(self._pc_filter_widgets_by_name.apply_button, dt)
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

HeroWindowCraftingInventoryConsole._handle_filter_input = function (self, input_service, dt, t)
	local filter_active = self.parent:filter_active()

	if not filter_active then
		return false
	end

	if input_service:get("toggle_menu", true) then
		self.parent:set_filter_active(false)

		return false
	end

	local filter_widget = self._filter_widget
	local filter_content = filter_widget.content

	if filter_content.close_filter_hotspot.on_pressed then
		self.parent:set_filter_active(false)

		return false
	elseif not filter_content.area_hotspot.is_hover and input_service:get("left_press", true) then
		local input_widget = self._widgets_by_name.input
		local input_content = input_widget.content

		self:_do_search(input_content.search_query, filter_content.query)
		self.parent:set_filter_active(false)

		return false
	end

	if UIUtils.is_button_pressed(self._pc_filter_widgets_by_name.apply_button) then
		local input_widget = self._widgets_by_name.input
		local input_content = input_widget.content

		self:_do_search(input_content.search_query, filter_content.query)
		self.parent:set_filter_active(false)

		return false
	end
end

HeroWindowCraftingInventoryConsole._handle_filer_widgets_sounds = function (self)
	local filter_widget = self._filter_widget
	local search_widget = self._widgets_by_name.input

	if search_widget and UIUtils.is_button_hover_enter(search_widget, "search_filters_hotspot") then
		self:_play_sound("play_gui_filter_tab_hover")
	end

	if filter_widget then
		if UIUtils.is_button_pressed(filter_widget, "reset_filter_hotspot") then
			self:_play_sound("play_gui_filter_reset")
		end

		local sort_by_names = {
			[1] = "rarity",
			[2] = "power_level",
		}

		for i = 1, #sort_by_names do
			local name = sort_by_names[i]

			if UIUtils.is_button_hover_enter(filter_widget, "sort_items_" .. name .. "_hotspot") then
				self:_play_sound("play_gui_filter_sort_type_hover")
			end

			if UIUtils.is_button_pressed(filter_widget, "sort_items_" .. name .. "_hotspot") then
				self:_play_sound("play_gui_filter_sort_type")
			end
		end

		for rarity, settings in pairs(RaritySettings) do
			if UIUtils.is_button_hover_enter(filter_widget, rarity .. "_hotspot") then
				self:_play_sound("play_gui_filter_rarity_hover")
			end

			if UIUtils.is_button_pressed(filter_widget, rarity .. "_hotspot") then
				self:_play_sound("play_gui_filter_rarity_click")
			end
		end

		if UIUtils.is_button_hover_enter(filter_widget, "checkbox_hotspot") then
			self:_play_sound("play_gui_filter_rarity_hover")
		end

		if UIUtils.is_button_pressed(filter_widget, "checkbox_hotspot") then
			self:_play_sound("play_gui_filter_rarity_click")
		end
	end
end

HeroWindowCraftingInventoryConsole._handle_gamepad_filter_input = function (self, input_service, dt, t)
	local filter_active = self.parent:filter_active()
	local filter_selected = self.parent:filter_selected()

	if filter_active then
		input_service:get("back_menu", true)

		local filter_widget = self._filter_widget
		local filter_content = filter_widget.content
		local current_gamepad_index = filter_content.current_gamepad_index or {
			1,
			1,
		}
		local gamepad_input_matrix = filter_content.gamepad_input_matrix
		local rows = #gamepad_input_matrix
		local columns = #gamepad_input_matrix[current_gamepad_index[1]]

		if input_service:get("move_down_hold_continuous") then
			current_gamepad_index[1] = math.clamp(current_gamepad_index[1] + 1, 1, rows)

			local columns = #gamepad_input_matrix[current_gamepad_index[1]]

			current_gamepad_index[2] = math.clamp(current_gamepad_index[2], 1, columns)
		elseif input_service:get("move_up_hold_continuous") then
			current_gamepad_index[1] = math.clamp(current_gamepad_index[1] - 1, 1, rows)

			local columns = #gamepad_input_matrix[current_gamepad_index[1]]

			current_gamepad_index[2] = math.clamp(current_gamepad_index[2], 1, columns)
		elseif input_service:get("move_right_hold_continuous") then
			current_gamepad_index[2] = math.clamp(current_gamepad_index[2] + 1, 1, columns)
		elseif input_service:get("move_left_hold_continuous") then
			current_gamepad_index[2] = math.clamp(current_gamepad_index[2] - 1, 1, columns)
		end

		if input_service:get("confirm", true) then
			local row = current_gamepad_index[1]
			local column = current_gamepad_index[2]
			local selected_hotspot = gamepad_input_matrix[row][column]

			filter_content[selected_hotspot].gamepad_pressed = true
			self._do_delayed_search = true
		elseif input_service:get("special_1", true) then
			self:_update_filter_reset(true)
		elseif input_service:get("back", true) then
			filter_content.current_gamepad_index[1] = 1
			filter_content.current_gamepad_index[2] = 1

			local input_widget = self._widgets_by_name.input
			local input_content = input_widget.content

			self:_do_search(input_content.search_query, filter_content.query)
			self.parent:set_filter_active(false)
			self:_set_filter_selected(true)
		end
	elseif filter_selected then
		local first_item = self._item_grid:get_item_in_slot(1, 1)

		if first_item and input_service:get("move_down_hold_continuous") then
			self:_set_filter_selected(false)
		elseif input_service:get("special_1", true) then
			self:_update_filter_reset(true)
		elseif input_service:get("confirm") then
			self.parent:set_filter_active(true)
			self.parent:set_filter_selected(false)
		end
	else
		local filter_disabled = self.parent:filter_search_disabled()

		if not filter_disabled then
			local selected_row = self._item_grid:get_selected_item_grid_slot()

			if selected_row == 1 and input_service:get("move_up_hold_continuous") then
				self:_set_filter_selected(true)

				return true
			end
		end
	end

	return filter_active or filter_selected
end

HeroWindowCraftingInventoryConsole.filter_selected = function (self)
	return self.parent:filter_selected()
end

HeroWindowCraftingInventoryConsole.filter_active = function (self)
	return self.parent:filter_active()
end

HeroWindowCraftingInventoryConsole._set_filter_selected = function (self, selected)
	local item_grid = self._item_grid
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if selected then
		item_grid:set_item_selected(nil)
	elseif gamepad_active then
		local first_item = item_grid:get_item_in_slot(1, 1)

		item_grid:set_item_selected(first_item)
	end

	self.parent:set_filter_selected(selected)
end

HeroWindowCraftingInventoryConsole._handle_input = function (self, dt, t)
	local input_service = self:_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		if self:_handle_search_input(dt, t) then
			return
		end

		if self:_handle_filter_input(input_service, dt, t) then
			return
		end

		local widgets_by_name = self._widgets_by_name
		local parent = self.parent
		local item_grid = self._item_grid
		local allow_single_press = false
		local item = item_grid:is_item_pressed(allow_single_press)

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
	end

	self:_handle_recipe_inputs(dt, t)
end

HeroWindowCraftingInventoryConsole._handle_gamepad_input = function (self, dt, t)
	local parent = self.parent
	local input_service = self:_input_service()
	local item_grid = self._item_grid
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active or self.parent.parent:input_blocked() then
		return
	end

	if IS_CONSOLE and self:_handle_search_input(dt, t) then
		return
	end

	if self:_handle_gamepad_filter_input(input_service, dt, t) then
		return
	end

	if input_service:get("confirm", true) then
		local selected_item = item_grid:selected_item()

		if selected_item then
			local backend_id = selected_item.backend_id

			self._pressed_backend_id = backend_id

			local is_drag_item = false

			parent:set_pressed_item_backend_id(backend_id, is_drag_item)
		end
	elseif self._pressed_backend_id and parent:get_pressed_item_backend_id() == self._pressed_backend_id then
		parent:set_pressed_item_backend_id(nil)

		self._pressed_backend_id = nil
	elseif item_grid:handle_gamepad_selection(input_service) then
		self:_play_sound("play_gui_craft_forge_hover")
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

HeroWindowCraftingInventoryConsole._set_input_blocked = function (self, blocked)
	local input_manager = Managers.input

	if blocked then
		input_manager:block_device_except_service("hero_view", "keyboard", 1, "search")
		input_manager:block_device_except_service("hero_view", "mouse", 1, "search")
		input_manager:block_device_except_service("hero_view", "gamepad", 1, "search")
	else
		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
		input_manager:block_device_except_service("hero_view", "keyboard", 1)
		input_manager:block_device_except_service("hero_view", "mouse", 1)
		input_manager:block_device_except_service("hero_view", "gamepad", 1)
	end

	self.parent.parent:set_input_blocked(blocked)
end

HeroWindowCraftingInventoryConsole._handle_search_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self:_input_service()
	local input_widget = self._widgets_by_name.input
	local input_content = input_widget.content

	if not gamepad_active then
		if input_content.clear_hotspot.on_pressed then
			input_content.search_query, input_content.caret_index, input_content.text_index = "", 1, 1

			self:_do_search(input_content.search_query)

			return true
		elseif input_content.search_filters_hotspot.on_pressed then
			self:_play_sound("play_gui_filter_tab_click")

			input_content.input_active = false
			self._keyboard_id = nil

			self:_set_input_blocked(false)
			self.parent:set_filter_active(true)

			return true
		end
	end

	if not self._keyboard_id then
		input_content.input_active = false

		local filter_selected = self.parent:filter_selected()
		local toggle_keyboard_pressed = gamepad_active and filter_selected and input_service:get("refresh") and not IS_WINDOWS

		if input_content.hotspot.on_pressed or toggle_keyboard_pressed then
			input_content.input_active = true

			if IS_WINDOWS then
				self:_set_input_blocked(true)

				self._keyboard_id = true
			elseif IS_XB1 then
				local title = Localize("lb_search")

				XboxInterface.show_virtual_keyboard(self._search_query, title)

				self._keyboard_id = true
			elseif IS_PS4 then
				local user_id = Managers.account:user_id()
				local title = Localize("lb_search")
				local position = definitions.virtual_keyboard_anchor_point

				self._keyboard_id = Managers.system_dialog:open_virtual_keyboard(user_id, title, self._search_query, position)
			end

			return true
		end

		return false
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	Managers.chat:block_chat_input_for_one_frame()

	if IS_WINDOWS then
		local keystrokes = Keyboard.keystrokes()

		input_content.search_query, input_content.caret_index = KeystrokeHelper.parse_strokes(input_content.search_query, input_content.caret_index, "insert", keystrokes)

		if input_service:get("execute_chat_input", true) then
			self:_do_search(input_content.search_query)

			input_content.input_active = false
			self._keyboard_id = nil

			self:_set_input_blocked(false)
		elseif input_service:get("toggle_menu", true) then
			input_content.input_active = false
			self._keyboard_id = nil

			self:_set_input_blocked(false)
		end
	elseif IS_XB1 then
		if not XboxInterface.interface_active() then
			local search_query = XboxInterface.get_keyboard_result()

			input_content.caret_index = gamepad_active and 1 or #search_query

			self:_do_search(search_query)

			self._keyboard_id = nil

			local first_item = self._item_grid:get_item_in_slot(1, 1)

			self:_set_filter_selected(first_item == nil)
		end
	elseif IS_PS4 then
		local done, success, search_query = Managers.system_dialog:poll_virtual_keyboard(self._keyboard_id)

		if done then
			if success then
				input_content.caret_index = gamepad_active and 1 or #search_query

				self:_do_search(search_query)
			end

			self._keyboard_id = nil

			local first_item = self._item_grid:get_item_in_slot(1, 1)

			self:_set_filter_selected(first_item == nil)
		end
	end

	if input_content.hotspot.on_pressed then
		return true
	end

	return self._keyboard_id
end

local EMPTY_TABLE = {}

HeroWindowCraftingInventoryConsole._do_search = function (self, search_query, filter_query)
	self._search_query = search_query
	self._filter_query = filter_query or self._filter_query or EMPTY_TABLE

	local search_widget = self._widgets_by_name.input
	local search_widget_content = search_widget.content

	search_widget_content.search_query = search_query

	local local_crafting_recipes_by_name = crafting_recipes_by_name
	local recipe = local_crafting_recipes_by_name[self._selected_craft_page_name]
	local item_filter = recipe.item_filter
	local hero_specific_filter = recipe.hero_specific_filter
	local career_specific_filter = recipe.career_specific_filter

	if hero_specific_filter then
		local temp_item_filter = item_filter and "and " .. item_filter or ""

		item_filter = "can_wield_by_current_hero " .. temp_item_filter
	end

	if self._filter_query.filter then
		for name, disable in pairs(self._filter_query.filter) do
			if disable then
				item_filter = item_filter .. " and not is_" .. name
			end
		end
	end

	if self._filter_query.only_new then
		item_filter = item_filter .. " and is_new"
	end

	self:change_item_filter(item_filter, true, search_query)

	if self._filter_query.sort then
		local sort_function

		for name, type in pairs(self._filter_query.sort) do
			local sort_function_name = name .. "_" .. type

			sort_function = UIUtils[sort_function_name]

			break
		end

		local items = self._item_grid:items()

		if sort_function and #items > 1 then
			table.sort(items, sort_function)
		end

		self._item_grid:set_item_page(1)
	end

	self:_play_sound("Play_hud_select")
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
		local amount = backend_id and backend_items:get_item_amount(backend_id) or 0
		local widget = widgets_by_name["material_text_" .. index]
		local content = widget.content
		local amount_text

		if amount < 10000 then
			amount_text = tostring(amount)
		elseif amount < 100000 then
			amount_text = string.format("%.1fk", amount * 0.001)
		else
			amount_text = "+99k"
		end

		content.text = amount_text
		content.icon = texture

		if not content.item then
			content.item = item or {
				data = table.clone(ItemMasterList[item_key]),
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
			self._selected_craft_page_name = selected_craft_page_name

			self:_change_category_by_name(selected_craft_page_name)
		elseif optional_craft_item_filter then
			self:change_item_filter(optional_craft_item_filter, true)
			self:_handle_gamepad_activity(true)
			self:_update_selected_item_tooltip(true)
		else
			self:_change_category_by_index(nil, true)
		end

		self._inventory_sync_id = inventory_sync_id
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
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local filter_active = self.parent:filter_active()

	if filter_active then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_top_renderer, self._filter_widget)

		if not gamepad_active then
			for _, widget in ipairs(self._pc_filter_widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	input_service = filter_active and FAKE_INPUT_SERVICE or input_service

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

	local filter_widget = self._filter_widget
	local input_widget = self._widgets_by_name.input
	local filter_content = filter_widget.content
	local input_content = input_widget.content
	local search_query = input_content.search_query
	local filter_query = filter_content.query

	if search_query ~= "" or not table.is_empty(filter_query.sort) or not table.is_empty(filter_query.filter) or filter_query.only_new then
		self:_do_search(search_query, filter_query)
	end

	self:_handle_gamepad_activity(true)
	self:_update_selected_item_tooltip(true)

	return true
end

HeroWindowCraftingInventoryConsole.change_item_filter = function (self, item_filter, change_page, optional_search_query)
	change_page = change_page or change_page == nil

	self._item_grid:change_item_filter(item_filter, change_page, optional_search_query)
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
		input_1_texture_data.size[2],
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture

	local icon_style_input_2 = input_2_widget.style.texture_id

	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2],
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
	if self.parent.parent:input_blocked() then
		return
	end

	local mouse_active = Managers.input:is_device_active("mouse")

	forced_update = forced_update or self.gamepad_active_last_frame == nil

	if not mouse_active then
		if not self.gamepad_active_last_frame or forced_update then
			self.gamepad_active_last_frame = true

			local item_grid = self._item_grid
			local selected_item_backend_id
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
