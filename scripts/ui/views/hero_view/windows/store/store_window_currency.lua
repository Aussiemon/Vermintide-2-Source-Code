local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_currency_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_item_definition = definitions.create_item_definition
local INPUT_ACTION_NEXT = "cycle_next"
local INPUT_ACTION_PREVIOUS = "cycle_previous"
local INPUT_ACTION_PURCHASE = "show_gamercard"
local DO_RELOAD = false
StoreWindowCurrency = class(StoreWindowCurrency)
StoreWindowCurrency.NAME = "StoreWindowCurrency"

StoreWindowCurrency.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowCurrency")

	self._params = params
	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_top_renderer
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
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
end

StoreWindowCurrency._get_layout_settings_by_name = function (self, name)
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts

	for _, settings in ipairs(window_layouts) do
		if settings.name == name then
			return settings
		end
	end
end

StoreWindowCurrency.create_ui_elements = function (self, params, offset)
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

	self:_update_item_list()
end

StoreWindowCurrency.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowCurrency")

	self.ui_animator = nil
end

StoreWindowCurrency.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:draw(dt)
end

StoreWindowCurrency.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StoreWindowCurrency._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StoreWindowCurrency._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowCurrency._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end
end

StoreWindowCurrency._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StoreWindowCurrency._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StoreWindowCurrency._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StoreWindowCurrency._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:window_input_service()
	local list_index = self:_list_index_pressed()

	if list_index then
		self:_on_list_index_selected(list_index)
	end

	self:_animate_list_entries(dt)
end

StoreWindowCurrency.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local list_widgets = self._list_widgets

	if list_widgets then
		for _, widget in ipairs(list_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StoreWindowCurrency._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StoreWindowCurrency._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
	end
end

StoreWindowCurrency._list_index_pressed = function (self)
	local list_widgets = self._list_widgets

	if list_widgets then
		for index, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return index
			end
		end
	end
end

StoreWindowCurrency._animate_list_entries = function (self, dt)
	local list_widgets = self._list_widgets

	for _, widget in ipairs(list_widgets) do
		local content = widget.content
		local style = widget.style

		self:_animate_list_entry(content, style, dt)
	end
end

StoreWindowCurrency._animate_list_entry = function (self, content, style, dt)
	local hotspot = content.button_hotspot or content.hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 14
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress
	style.hover_frame.color[1] = hover_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StoreWindowCurrency._get_items_by_filter = function (self, item_filter)
	local backend_items = Managers.backend:get_interface("items")
	local items = backend_items:get_filtered_items(item_filter)

	return items
end

StoreWindowCurrency._update_item_list = function (self)
	local items = self:_get_items_by_filter("can_wield_es_knight")
	local layout = {}
	local counter = 1

	for backend_id, item in pairs(items) do
		if counter == 6 then
			break
		end

		local entry = {
			item = item,
			size = {
				300,
				788
			}
		}
		layout[counter] = entry
		counter = counter + 1
	end

	self._layout = layout

	self:_create_item_widgets(layout)
end

StoreWindowCurrency._on_list_index_selected = function (self, index)
	local layout = self._layout
	local entry = layout[index]
	local item = entry.item
	self._params.selected_item = item
	local list_widgets = self._list_widgets

	if list_widgets then
		for i, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot then
				local is_selected = i == index
				hotspot.is_selected = is_selected
			end
		end
	end
end

StoreWindowCurrency._create_item_widgets = function (self, layout)
	local widgets = {}
	local backend_items = Managers.backend:get_interface("items")
	local item_rarity_textures = UISettings.item_rarity_textures
	local item_type_store_icons = UISettings.item_type_store_icons

	for i, entry in ipairs(layout) do
		local widget = self:_create_item_widget(entry)
		local item = entry.item
		local inventory_icon, display_name, description = UIUtils.get_ui_information_from_item(item)
		local item_data = item.data
		local rarity = item_data.rarity
		local item_type = item_data.item_type
		local backend_id = item.backend_id

		if backend_id then
			rarity = backend_items:get_item_rarity(backend_id)
		end

		local item_background_texture = item_rarity_textures[rarity]
		local title = Localize(display_name)
		local name = Localize(display_name)
		local content = widget.content
		content.icon = inventory_icon
		local item_type_icon = item_type_store_icons[item_type] or item_type_store_icons.default
		content.type_tag_icon = item_type_icon
		widgets[i] = widget
	end

	self._list_widgets = widgets

	self:_align_item_widgets()
end

StoreWindowCurrency._align_item_widgets = function (self)
	local spacing = 10
	local total_width = -spacing
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local content = widget.content
		local size = content.size
		local width = size[1]
		total_width = total_width + width + spacing
	end

	local start_position_x = -(total_width / 2)

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		offset[1] = start_position_x
		start_position_x = start_position_x + size[1] + spacing
	end

	print("total_width", total_width)

	self._total_width = math.max(total_width, 0)
end

StoreWindowCurrency._create_item_widget = function (self, data)
	local scenegraph_id = "item_root"
	local size = data.size
	local definition = create_item_definition(scenegraph_id, size)
	local widget = UIWidget.init(definition)

	return widget
end

StoreWindowCurrency._update_hotspot_progress = function (self, hotspot, dt)
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

return
