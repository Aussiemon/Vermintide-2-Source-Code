﻿-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_loadout_console.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false

HeroWindowLoadoutConsole = class(HeroWindowLoadoutConsole)
HeroWindowLoadoutConsole.NAME = "HeroWindowLoadoutConsole"

HeroWindowLoadoutConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowLoadoutConsole")

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
	self._equipment_items = {}

	self:create_ui_elements(params, offset)
	self:_show_weapon_disclaimer(false)

	if Managers.mechanism:mechanism_setting("should_display_weapon_disclaimer") then
		self:_show_weapon_disclaimer(true)
	end

	self.hero_name = params.hero_name
	self.career_index = params.career_index

	self:_start_transition_animation("on_enter")
end

HeroWindowLoadoutConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowLoadoutConsole.create_ui_elements = function (self, params, offset)
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

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 5, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)

	widgets_by_name.loadout_grid.content.profile_index = self.params.profile_index
	widgets_by_name.loadout_grid.content.career_index = self.params.career_index
end

HeroWindowLoadoutConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowLoadoutConsole")

	self.ui_animator = nil

	self._menu_input_description:destroy()

	self._menu_input_description = nil
end

HeroWindowLoadoutConsole._input_service = function (self)
	local parent = self.parent

	if parent:is_friends_list_active() then
		return FAKE_INPUT_SERVICE
	end

	return parent:window_input_service()
end

HeroWindowLoadoutConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_update_loadout_sync()
	self:_update_selected_loadout_slot_index()
	self:_update_input_description()
	self:_handle_input(dt, t)
	self:_handle_gamepad_input(dt, t)
	self:draw(dt)
end

HeroWindowLoadoutConsole.post_update = function (self, dt, t)
	return
end

HeroWindowLoadoutConsole._update_input_description = function (self)
	local params = self.params
	local hero_statistics_active = self.params.hero_statistics_active
	local input_desc = "default"

	if hero_statistics_active then
		input_desc = "details"
	elseif not self:_is_selected_item_customizable() then
		input_desc = "default_no_customization"
	end

	if self._current_input_desc ~= input_desc then
		self._menu_input_description:change_generic_actions(generic_input_actions[input_desc])

		self._current_input_desc = input_desc
	end
end

HeroWindowLoadoutConsole._update_animations = function (self, dt)
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

HeroWindowLoadoutConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowLoadoutConsole._handle_gamepad_input = function (self, dt, t)
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		return
	end

	local parent = self.parent
	local input_service = self:_input_service()
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local selected_row, selected_column

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.is_selected then
				selected_row = i
				selected_column = k

				break
			end
		end
	end

	if selected_row and selected_column then
		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			parent:set_selected_loadout_slot_index(selected_row - 1)
			self:_play_sound("play_gui_equipment_inventory_hover")
		elseif selected_row < rows and input_service:get("move_down_hold_continuous") then
			parent:set_selected_loadout_slot_index(selected_row + 1)
			self:_play_sound("play_gui_equipment_inventory_hover")
		end
	end

	if input_service:get("confirm", true) then
		self:_play_sound("play_gui_equipment_selection_click")
		parent:set_layout_by_name("equipment_selection")
	elseif input_service:get("refresh", true) and self:_is_selected_item_customizable() then
		self:_play_sound("play_gui_equipment_selection_click")

		local item = self:_get_selected_item()

		if item then
			self:_customize_item(item)
		end
	end
end

HeroWindowLoadoutConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local slot_index_hovered = self:_is_equipment_slot_hovered()

	if slot_index_hovered then
		parent:set_selected_loadout_slot_index(slot_index_hovered)
		self:_play_sound("play_gui_equipment_selection_hover")
	end

	local slot_index_pressed = self:_is_equipment_slot_pressed()

	if slot_index_pressed then
		self:_play_sound("play_gui_equipment_selection_click")
		parent:set_layout_by_name("equipment_selection")
	end

	local customize_item_pressed = self:_is_customize_item_pressed()

	if customize_item_pressed then
		self:_play_sound("play_gui_equipment_selection_click")
		self:_customize_item(customize_item_pressed)
	end
end

HeroWindowLoadoutConsole._customize_item = function (self, item)
	local item_data = item.data
	local slot_type = item_data.slot_type

	self.params.item_to_customize = item

	self.parent:set_layout_by_name("item_customization")
end

HeroWindowLoadoutConsole._update_selected_loadout_slot_index = function (self)
	local index = self.parent:get_selected_loadout_slot_index()

	if index ~= self._selected_loadout_slot_index then
		self:_set_equipment_slot_selected(index)

		self._selected_loadout_slot_index = index
	end
end

HeroWindowLoadoutConsole._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self:_populate_loadout()

		self._loadout_sync_id = loadout_sync_id
	end
end

HeroWindowLoadoutConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowLoadoutConsole.draw = function (self, dt)
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

HeroWindowLoadoutConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowLoadoutConsole._setup_slot_icons = function (self)
	local slots = InventorySettings.slots_by_slot_index

	for _, slot in pairs(slots) do
		local index = slot.ui_slot_index

		if index then
			local widget = self._widgets_by_name.loadout_grid
			local content = widget.content
			local name_sufix = "_1_" .. tostring(index)
			local item_icon_name = "item_icon" .. name_sufix
			local hotspot_name = "hotspot" .. name_sufix
			local item_tooltip_name = "item_tooltip" .. name_sufix
			local slot_icon_name = "slot_icon" .. name_sufix
			local slot_type = slot.type
			local icon_texture = slot_icon_by_type[slot_type] or "tabs_icon_all_selected"

			content[slot_icon_name] = icon_texture
		end
	end
end

HeroWindowLoadoutConsole._populate_loadout = function (self)
	local hero_name = self.hero_name
	local slots = InventorySettings.slots_by_slot_index
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name

	for _, slot in pairs(slots) do
		local slot_name = slot.name

		self:_clear_item_slot(slot)

		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			self:_equip_item_presentation(item, slot)
		end
	end
end

HeroWindowLoadoutConsole._equip_item_presentation = function (self, item, slot)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local slot_index = slot.slot_index
	local ui_slot_index = slot.ui_slot_index
	local widgets_by_name = self._widgets_by_name

	if ui_slot_index then
		self._equipment_items[slot_index] = item

		local widget = widgets_by_name.loadout_grid
		local content = widget.content
		local style = widget.style
		local name_sufix = "_" .. tostring(slot_index) .. "_1"
		local item_icon_name = "item_icon" .. name_sufix
		local hotspot_name = "hotspot" .. name_sufix
		local item_tooltip_name = "item_tooltip" .. name_sufix
		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

		content[item_tooltip_name] = display_name
		content["item" .. name_sufix] = item

		local backend_id = item.backend_id
		local rarity = item.rarity
		local backend_items = Managers.backend:get_interface("items")

		if rarity then
			local rarity_texture_name = "rarity_texture" .. name_sufix

			content[rarity_texture_name] = UISettings.item_rarity_textures[rarity]
		end

		local item_content = content[hotspot_name]

		item_content[item_icon_name] = inventory_icon
	end
end

HeroWindowLoadoutConsole._clear_item_slot = function (self, slot)
	local slot_type = slot.type
	local slot_index = slot.slot_index
	local ui_slot_index = slot.ui_slot_index
	local widgets_by_name = self._widgets_by_name

	if ui_slot_index then
		self._equipment_items[slot_index] = nil

		local widget = widgets_by_name.loadout_grid
		local content = widget.content
		local style = widget.style
		local name_sufix = "_" .. tostring(slot_index) .. "_1"
		local item_icon_name = "item_icon" .. name_sufix
		local hotspot_name = "hotspot" .. name_sufix
		local item_tooltip_name = "item_tooltip" .. name_sufix

		content[item_tooltip_name] = nil
		content["item" .. name_sufix] = nil

		local item_content = content[hotspot_name]

		item_content[item_icon_name] = nil
	end
end

HeroWindowLoadoutConsole._is_equipment_slot_right_clicked = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.on_right_click then
				return i
			end
		end
	end
end

HeroWindowLoadoutConsole._is_customize_item_pressed = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "customize_hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.on_pressed then
				return content["item" .. name_sufix]
			end
		end
	end
end

HeroWindowLoadoutConsole._is_selected_item_customizable = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.is_selected then
				return not content["item" .. name_sufix .. "_disabled"]
			end
		end
	end
end

HeroWindowLoadoutConsole._get_selected_item = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.is_selected then
				return content["item" .. name_sufix]
			end
		end
	end
end

HeroWindowLoadoutConsole._is_equipment_slot_pressed = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.on_pressed then
				return i
			end
		end
	end
end

HeroWindowLoadoutConsole._is_equipment_slot_hovered = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			if slot_hotspot.on_hover_enter then
				return i
			end
		end
	end
end

HeroWindowLoadoutConsole._set_equipment_slot_selected = function (self, row_index)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			slot_hotspot.is_selected = row_index and row_index == i
			slot_hotspot.highlight = slot_hotspot.is_selected
		end
	end
end

HeroWindowLoadoutConsole._enable_selection_highlight = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			slot_hotspot.highlight = slot_hotspot.is_selected
		end
	end
end

HeroWindowLoadoutConsole._disable_selection_highlight = function (self)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns

	for i = 1, rows do
		for k = 1, columns do
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hotspot = content[hotspot_name]

			slot_hotspot.highlight = false
		end
	end
end

HeroWindowLoadoutConsole._is_equipment_slot_hovered_by_type = function (self, item_type)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local rows = content.rows
	local columns = content.columns
	local slots = InventorySettings.slots_by_ui_slot_index

	for i = 1, rows do
		for k = 1, columns do
			local slot_settings = slots[k]

			if slot_settings.type == item_type then
				local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
				local hotspot_name = "hotspot" .. name_sufix
				local slot_hotspot = content[hotspot_name]

				if slot_hotspot.internal_is_hover then
					return k
				end
			end
		end
	end
end

HeroWindowLoadoutConsole._highlight_equipment_slot_by_type = function (self, item_type)
	local widget = self._widgets_by_name.loadout_grid
	local content = widget.content
	local style = widget.style
	local rows = content.rows
	local columns = content.columns
	local slots = InventorySettings.slots_by_ui_slot_index

	for i = 1, rows do
		for k = 1, columns do
			local slot_settings = slots[k]
			local name_sufix = "_" .. tostring(i) .. "_" .. tostring(k)
			local hotspot_name = "hotspot" .. name_sufix
			local slot_hover_name = "slot_hover" .. name_sufix
			local slot_hotspot = content[hotspot_name]
			local enabled = slot_settings.type == item_type

			slot_hotspot.highlight = enabled

			local alpha = slot_hotspot.internal_is_hover and 255 or 100

			style[slot_hover_name].color[1] = enabled and alpha or 255
		end
	end
end

HeroWindowLoadoutConsole._show_weapon_disclaimer = function (self, should_show)
	local disclaimer_text_content = self._widgets_by_name.disclaimer_text.content
	local disclaimer_text_background_content = self._widgets_by_name.disclaimer_text_background.content

	disclaimer_text_background_content.visible = should_show
	disclaimer_text_content.visible = should_show
end
