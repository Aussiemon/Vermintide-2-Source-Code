local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_summary_definitions")
local widget_definitions = definitions.widgets
local mutator_widget_definitions = definitions.mutator_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false

local function get_text_height(ui_renderer, size, ui_style, ui_content, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = ui_content.text_start_index or 1
	local max_texts = ui_content.max_texts or #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min))*inv_scale*num_texts

	return full_font_height
end

StartGameWindowMutatorSummary = class(StartGameWindowMutatorSummary)
StartGameWindowMutatorSummary.NAME = "StartGameWindowMutatorSummary"
StartGameWindowMutatorSummary.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorSummary")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
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

	self._active_mutator_widgets = {}
	self.previous_selected_backend_id = self.parent:get_selected_heroic_deed_backend_id()

	return 
end
StartGameWindowMutatorSummary.create_ui_elements = function (self, params, offset)
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
	local mutator_widgets = {}
	local mutator_widgets_by_name = {}

	for name, widget_definition in pairs(mutator_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		mutator_widgets[#mutator_widgets + 1] = widget
		mutator_widgets_by_name[name] = widget
	end

	self._mutator_widgets = mutator_widgets
	self._mutator_widgets_by_name = mutator_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.confirm_button.content.button_hotspot.disable_button = true
	widgets_by_name.game_option_1.content.visible = false
	widgets_by_name.game_option_placeholder.content.visible = true

	return 
end
StartGameWindowMutatorSummary.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorSummary")

	self.ui_animator = nil

	if not self.confirm_button_pressed then
		self.parent:set_selected_heroic_deed_backend_id(self.previous_selected_backend_id)
	end

	return 
end
StartGameWindowMutatorSummary.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_selected_item_backend_id(self)
	self.draw(self, dt)

	return 
end
StartGameWindowMutatorSummary.post_update = function (self, dt, t)
	return 
end
StartGameWindowMutatorSummary._update_animations = function (self, dt)
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
StartGameWindowMutatorSummary._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowMutatorSummary._handle_input = function (self, dt, t)
	if not self._selected_backend_id then
		return 
	end

	local confirm_button = self._widgets_by_name.confirm_button

	UIWidgetUtils.animate_default_button(confirm_button, dt)

	if self._is_button_pressed(self, confirm_button) then
		self.confirm_button_pressed = true

		self.parent:set_layout(3)
	end

	return 
end
StartGameWindowMutatorSummary._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self._present_item_by_backend_id(self, backend_id)
	end

	return 
end
StartGameWindowMutatorSummary._present_item_by_backend_id = function (self, backend_id)
	if not backend_id then
		return 
	end

	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.game_option_1
	widget.content.visible = true
	widgets_by_name.game_option_placeholder.content.visible = false
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface.get_item_from_id(item_interface, backend_id)
	local item_data = item_interface.get_item_masterlist_data(item_interface, backend_id)
	local display_name = item_data.display_name
	widget.content.deed_title = Localize(display_name)
	local level_key = item.level_key
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	widget.content.option_text_1 = Localize(level_display_name)
	local difficulty_key = item.difficulty
	local difficulty_settings = DifficultySettings[difficulty_key]
	local difficulty_display_name = difficulty_settings.display_name
	widget.content.option_text_2 = Localize(difficulty_display_name)
	local mutators = item_data.mutators

	self._add_mutator_entries(self, mutators)

	local rewards = item_data.rewards

	self._add_mutator_rewards(self, rewards)

	widgets_by_name.confirm_button.content.button_hotspot.disable_button = false

	return 
end
StartGameWindowMutatorSummary._add_mutator_rewards = function (self, rewards)
	local widgets_by_name = self._widgets_by_name
	local num_rewards = #rewards
	local spacing = 20
	local start_offset = -(num_rewards - 1)*(spacing*0.5 + 40)

	for i = 1, 2, 1 do
		local widget_name = "reward_item_" .. i
		local widget = widgets_by_name[widget_name]
		local content = widget.content
		local item_key = rewards[i]
		content.visible = item_key ~= nil

		if item_key then
			local hotspot_content = content.button_hotspot
			local style = widget.style
			local item_data = ItemMasterList[item_key]
			local inventory_icon = item_data.inventory_icon
			local rarity = item_data.rarity
			local slot_type = item_data.slot_type
			content.item_icon = inventory_icon
			content.item_frame = "item_frame"
			content.rarity_texture = UISettings.item_rarity_textures[rarity]
			content.item = item_data
			widget.offset[1] = start_offset
			start_offset = start_offset + 80 + spacing
		end
	end

	return 
end
StartGameWindowMutatorSummary._add_mutator_entries = function (self, entries)
	local active_mutator_widgets = self._active_mutator_widgets

	table.clear(active_mutator_widgets)

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local mutator_widgets = self._mutator_widgets
	local entry_spacing = 10
	local total_length = 0

	for index, name in ipairs(entries) do
		local widget = mutator_widgets[index]
		local scenegraph_id = widget.scenegraph_id
		local content = widget.content
		local offset = widget.offset
		local style = widget.style
		local text_style = style.text
		local text_size = ui_scenegraph[scenegraph_id].size
		text_size[2] = 0
		local mutator_template = MutatorTemplates[name]
		local display_name = mutator_template.display_name
		local description = mutator_template.description
		local icon = mutator_template.icon
		local title_text = (display_name and Localize(display_name)) or "n/a"
		local description_text = (description and Localize(description)) or "n/a"
		local text = title_text
		content.text = text
		content.icon = icon or "icons_placeholder"
		local text_height = get_text_height(ui_renderer, text_size, text_style, content, text)
		text_size[2] = math.max(text_height, 30)
		offset[2] = -total_length
		total_length = total_length + text_size[2] + entry_spacing
		active_mutator_widgets[index] = widget
	end

	return 
end
StartGameWindowMutatorSummary._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowMutatorSummary.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._active_mutator_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowMutatorSummary._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end

return 
