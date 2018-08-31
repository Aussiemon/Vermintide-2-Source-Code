local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_inventory_console_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false
local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"

local function item_sort_func(item_1, item_2)
	local item_data_1 = item_1.data
	local item_data_2 = item_2.data
	local item_key_1 = item_data_1.key
	local item_key_2 = item_data_2.key
	local item_1_power_level = item_1.power_level or 0
	local item_2_power_level = item_2.power_level or 0
	local item_1_backend_id = item_1.backend_id
	local item_2_backend_id = item_2.backend_id
	local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
	local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

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

HeroWindowLoadoutInventoryConsole = class(HeroWindowLoadoutInventoryConsole)
HeroWindowLoadoutInventoryConsole.NAME = "HeroWindowLoadoutInventoryConsole"

HeroWindowLoadoutInventoryConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowLoadoutInventoryConsole")

	self.params = params
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
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local profile = SPProfiles[self.profile_index]
	local career_data = profile.careers[self.career_index]
	self.career_name = career_data.name
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_category_index_lookups()
	self:_setup_input_buttons()

	local item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)
	self._item_grid = item_grid

	item_grid:mark_equipped_items(true)
	item_grid:mark_locked_items(true)
	item_grid:disable_locked_items(true)
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)
	self:_set_item_compare_enable_state(false)

	local player_unit = local_player and local_player.player_unit

	if player_unit then
		local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

		if inventory_extension then
			inventory_extension:check_and_drop_pickups("enter_inventory")
		end
	end

	self:_start_transition_animation("on_enter")
end

HeroWindowLoadoutInventoryConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowLoadoutInventoryConsole.create_ui_elements = function (self, params, offset)
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
	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 7, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowLoadoutInventoryConsole._setup_category_index_lookups = function (self)
	local profile = SPProfiles[self.profile_index]
	local careers = profile.careers
	local career_index = self.career_index
	local career = careers[career_index]
	local loadout_equipment_slots = career.loadout_equipment_slots
	local career_category_settings_index_lookup = {}

	for index, name in ipairs(loadout_equipment_slots) do
		for category_index, category_setting in ipairs(category_settings) do
			if name == category_setting.name then
				career_category_settings_index_lookup[index] = category_index

				break
			end
		end
	end

	self._career_category_settings_index_lookup = career_category_settings_index_lookup
end

HeroWindowLoadoutInventoryConsole.set_focus = function (self, focused)
	self._focused = focused
	self.render_settings.alpha_multiplier = (focused and 1) or 0.5
	self._widgets_by_name.item_tooltip.content.visible = focused
end

HeroWindowLoadoutInventoryConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowLoadoutInventoryConsole")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	self._menu_input_description:destroy()

	self._menu_input_description = nil
end

HeroWindowLoadoutInventoryConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_update_selected_loadout_slot_index()
	self:_update_loadout_sync()
	self:_update_page_info()
	self:_update_input_description()

	if self._focused then
		self:_handle_gamepad_activity()
		self:_update_selected_item_tooltip()
		self:_handle_input(dt, t)
		self:_handle_gamepad_input(dt, t)
	end

	self:draw(dt)
end

HeroWindowLoadoutInventoryConsole.post_update = function (self, dt, t)
	return
end

HeroWindowLoadoutInventoryConsole._update_input_description = function (self)
	local params = self.params
	local hero_statistics_active = self.params.hero_statistics_active

	if hero_statistics_active ~= self._hero_statistics_active then
		self._hero_statistics_active = hero_statistics_active

		if hero_statistics_active then
			self._menu_input_description:change_generic_actions(generic_input_actions.details)
		else
			self._menu_input_description:change_generic_actions(generic_input_actions.default)
		end
	end
end

HeroWindowLoadoutInventoryConsole._set_item_compare_enable_state = function (self, enabled)
	self._widgets_by_name.item_tooltip_compare.content.visible = enabled
	self._draw_item_compare = enabled
end

HeroWindowLoadoutInventoryConsole._update_equipped_item_tooltip = function (self)
	local slot_index = self._selected_loadout_slot_index
	local slot = InventorySettings.slots_by_slot_index[slot_index]
	local slot_name = slot.name
	local item_interface = Managers.backend:get_interface("items")
	local backend_id = item_interface:get_loadout_item_id(self.career_name, slot_name)
	local item = backend_id and item_interface:get_item_from_id(backend_id)
	local widget = self._widgets_by_name.item_tooltip_compare
	widget.content.item = item
end

HeroWindowLoadoutInventoryConsole._update_selected_item_tooltip = function (self)
	local selected_item = self._item_grid:selected_item()
	local backend_id = selected_item and selected_item.backend_id

	if backend_id ~= self._selected_backend_id then
		local widget = self._widgets_by_name.item_tooltip
		widget.content.item = selected_item
	end

	self._selected_backend_id = backend_id
end

HeroWindowLoadoutInventoryConsole._update_animations = function (self, dt)
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

HeroWindowLoadoutInventoryConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowLoadoutInventoryConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowLoadoutInventoryConsole._handle_gamepad_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local parent = self.parent
	local input_service = self:_input_service()
	local item_grid = self._item_grid

	if item_grid:handle_gamepad_selection(input_service) then
		self:_play_sound("play_gui_equipment_button_hover")
	end

	if input_service:get("confirm", true) then
		local selected_item, is_equipped = item_grid:selected_item()

		if selected_item and item_grid:is_item_wieldable(selected_item) then
			parent:_set_loadout_item(selected_item, self._strict_slot_type)
			self:_play_sound("play_gui_equipment_equip_hero")
		end
	elseif input_service:get("special_1", true) then
		self:_set_item_compare_enable_state(not self._draw_item_compare)
	end

	local page_index = self._current_page
	local total_pages = self._total_pages

	if page_index and total_pages then
		if page_index < total_pages and input_service:get(INPUT_ACTION_NEXT) then
			item_grid:set_item_page(page_index + 1)
			self:_play_sound("play_gui_equipment_inventory_next_click")

			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(first_item)
		elseif page_index > 1 and input_service:get(INPUT_ACTION_PREVIOUS) then
			item_grid:set_item_page(page_index - 1)
			self:_play_sound("play_gui_equipment_inventory_next_click")

			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(first_item)
		end
	end
end

HeroWindowLoadoutInventoryConsole._handle_input = function (self, dt, t)
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
		parent:_set_loadout_item(item, self._strict_slot_type)
		self:_play_sound("play_gui_equipment_equip_hero")
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

HeroWindowLoadoutInventoryConsole._update_page_info = function (self)
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

HeroWindowLoadoutInventoryConsole._get_actual_loadout_category_index = function (self, index)
	return self._career_category_settings_index_lookup[index]
end

HeroWindowLoadoutInventoryConsole._update_selected_loadout_slot_index = function (self)
	local index = self.parent:get_selected_loadout_slot_index()
	local internal_slot_index = self._career_category_settings_index_lookup[index]

	if index ~= self._selected_loadout_slot_index then
		self:_change_category_by_index(index)

		self._selected_loadout_slot_index = index
		self._internal_slot_index = internal_slot_index
	end
end

HeroWindowLoadoutInventoryConsole._update_loadout_sync = function (self)
	local item_grid = self._item_grid
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._loadout_sync_id = loadout_sync_id

		item_grid:update_items_status()
		self:_update_equipped_item_tooltip()
	end
end

HeroWindowLoadoutInventoryConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowLoadoutInventoryConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self:_input_service()
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

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowLoadoutInventoryConsole._input_service = function (self)
	local parent = self.parent

	if parent:is_friends_list_active() then
		return parent.fake_input_service
	end

	return parent:window_input_service()
end

HeroWindowLoadoutInventoryConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowLoadoutInventoryConsole._change_category_by_index = function (self, index, force_update)
	local internal_slot_index = self._career_category_settings_index_lookup[index]

	if force_update then
		index = self._internal_slot_index or 1
	end

	local actual_category_setting = category_settings[index]
	local actual_category_name = actual_category_setting.name
	self._strict_slot_type = actual_category_name

	if self._internal_slot_index == internal_slot_index then
		return
	end

	local category_setting = category_settings[internal_slot_index]
	local category_name = category_setting.name
	local display_name = category_setting.display_name
	local item_grid = self._item_grid

	item_grid:change_category(category_name)

	return true
end

HeroWindowLoadoutInventoryConsole._setup_input_buttons = function (self)
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

HeroWindowLoadoutInventoryConsole._set_gamepad_input_buttons_visibility = function (self, visible)
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

HeroWindowLoadoutInventoryConsole._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local item_grid = self._item_grid
			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(first_item)
			self:_set_gamepad_input_buttons_visibility(true)
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local item_grid = self._item_grid

		item_grid:set_item_selected(nil)

		if self._draw_item_compare then
			self:_set_item_compare_enable_state(false)
		end

		self:_set_gamepad_input_buttons_visibility(false)
	end
end

return
