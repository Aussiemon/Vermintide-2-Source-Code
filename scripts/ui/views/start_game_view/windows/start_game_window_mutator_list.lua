-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_list_definitions")
local widget_definitions = definitions.widgets
local summary_widget_definitions = definitions.summary_widgets
local mutator_widget_definitions = definitions.mutator_widgets
local overlay_widget_definitions = definitions.overlay_widgets
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

StartGameWindowMutatorList = class(StartGameWindowMutatorList)
StartGameWindowMutatorList.NAME = "StartGameWindowMutatorList"
StartGameWindowMutatorList.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorList")

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
	self._ui_animations = {}

	self.create_ui_elements(self, params, offset)

	self._active_mutator_widgets = {}

	return 
end
StartGameWindowMutatorList.create_ui_elements = function (self, params, offset)

	-- decompilation error in this vicinity
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
	local summary_widgets = {}
	local summary_widgets_by_name = {}

	for name, widget_definition in pairs(summary_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		summary_widgets[#summary_widgets + 1] = widget
		summary_widgets_by_name[name] = widget
	end

	self._summary_widgets = summary_widgets
	self._summary_widgets_by_name = summary_widgets_by_name
	local mutator_widgets = {}
	local mutator_widgets_by_name = {}

	for name, widget_definition in pairs(mutator_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		mutator_widgets[#mutator_widgets + 1] = widget
		mutator_widgets_by_name[name] = widget
	end

	self._mutator_widgets = mutator_widgets
	self._mutator_widgets_by_name = mutator_widgets_by_name
	local overlay_widgets = {}
	local overlay_widgets_by_name = {}

	for name, widget_definition in pairs(overlay_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		overlay_widgets[#overlay_widgets + 1] = widget
		overlay_widgets_by_name[name] = widget
	end

	self._overlay_widgets = overlay_widgets
	self._overlay_widgets_by_name = overlay_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.play_button.content.button_hotspot.disable_button = true
	local overlay_button = overlay_widgets_by_name.overlay_button
	local anim = self._animate_pulse(self, overlay_button.style.glow_frame.color, 1, 255, 100, 2)

	UIWidget.animate(overlay_button, anim)

	if self._has_deed_items(self) then
		overlay_button.content.button_hotspot.disable_button = false
	else
		overlay_button.content.button_hotspot.disable_button = true
	end

	return 
end
StartGameWindowMutatorList._has_deed_items = function (self)
	local item_interface = Managers.backend:get_interface("items")
	local item_filter = "slot_type == melee"
	local items = item_interface.get_filtered_items(item_interface, item_filter)

	return items and 0 < #items
end
StartGameWindowMutatorList.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorList")

	self.ui_animator = nil

	return 
end
StartGameWindowMutatorList.update = function (self, dt, t)
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
StartGameWindowMutatorList.post_update = function (self, dt, t)
	return 
end
StartGameWindowMutatorList._update_animations = function (self, dt)
	self._update_game_options_hover_effect(self)

	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	ui_animator.update(ui_animator, dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
StartGameWindowMutatorList._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowMutatorList._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end
StartGameWindowMutatorList._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end
StartGameWindowMutatorList._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end
StartGameWindowMutatorList._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local summary_widgets_by_name = self._summary_widgets_by_name
	local overlay_widgets_by_name = self._overlay_widgets_by_name

	if self._is_button_pressed(self, summary_widgets_by_name.game_option_1) or self._is_button_pressed(self, overlay_widgets_by_name.overlay_button) then
		self.parent:set_layout(7)
	elseif self._is_button_pressed(self, widgets_by_name.play_button) and self._selected_backend_id then
		self.parent:play(t)
	end

	return 
end
StartGameWindowMutatorList._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self._present_item_by_backend_id(self, backend_id)
	end

	return 
end
StartGameWindowMutatorList._present_item_by_backend_id = function (self, backend_id)
	if not backend_id then
		return 
	end

	local summary_widgets_by_name = self._summary_widgets_by_name
	local widget = summary_widgets_by_name.game_option_1
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

	self._widgets_by_name.play_button.content.button_hotspot.disable_button = false

	return 
end
StartGameWindowMutatorList._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowMutatorList.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._selected_backend_id then
		for _, widget in ipairs(self._summary_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		for _, widget in ipairs(self._active_mutator_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	else
		for _, widget in ipairs(self._overlay_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
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
StartGameWindowMutatorList._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
StartGameWindowMutatorList._add_mutator_rewards = function (self, rewards)
	local summary_widgets_by_name = self._summary_widgets_by_name
	local num_rewards = #rewards
	local spacing = 20
	local start_offset = -(num_rewards - 1)*(spacing*0.5 + 40)

	for i = 1, 2, 1 do
		local widget_name = "reward_item_" .. i
		local widget = summary_widgets_by_name[widget_name]
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
StartGameWindowMutatorList._add_mutator_entries = function (self, entries)
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
StartGameWindowMutatorList._update_game_options_hover_effect = function (self)
	local widgets_by_name = self._widgets_by_name
	local summary_widgets_by_name = self._summary_widgets_by_name
	local overlay_widgets_by_name = self._overlay_widgets_by_name
	local game_option_1_widget = summary_widgets_by_name.game_option_1

	if self._is_button_hover_enter(self, game_option_1_widget) then
		self._on_option_button_hover_enter(self, game_option_1_widget, 1)
	elseif self._is_button_hover_exit(self, game_option_1_widget) then
		self._on_option_button_hover_exit(self, game_option_1_widget, 1)
	end

	local overlay_button_widget = overlay_widgets_by_name.overlay_button

	if self._is_button_hover_enter(self, overlay_button_widget) then
		self._on_option_button_hover_enter(self, overlay_button_widget, 2)
	elseif self._is_button_hover_exit(self, overlay_button_widget) then
		self._on_option_button_hover_exit(self, overlay_button_widget, 2)
	end

	return 
end
StartGameWindowMutatorList._on_option_button_hover_enter = function (self, widget, index, instant)
	self._create_style_animation_enter(self, widget, 255, "glow", index, instant)
	self._create_style_animation_exit(self, widget, 0, "button_hover_rect", index, instant)

	return 
end
StartGameWindowMutatorList._on_option_button_hover_exit = function (self, widget, index, instant)
	self._create_style_animation_exit(self, widget, 0, "glow", index, instant)
	self._create_style_animation_enter(self, widget, 30, "button_hover_rect", index, instant)

	return 
end
StartGameWindowMutatorList._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return 
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = (current_color_value/target_color_value - 1)*total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
end
StartGameWindowMutatorList._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]

	if not pass_style then
		return 
	end

	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = current_color_value/255*total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
end
StartGameWindowMutatorList._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end
StartGameWindowMutatorList._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
StartGameWindowMutatorList._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return 
