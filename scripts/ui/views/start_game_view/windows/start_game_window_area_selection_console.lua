local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_area_selection_console_definitions")
local widget_definitions = definitions.widgets
local map_size = definitions.map_size
local area_widget_definitions = definitions.area_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

local DO_RELOAD = false
StartGameWindowAreaSelectionConsole = class(StartGameWindowAreaSelectionConsole)
StartGameWindowAreaSelectionConsole.NAME = "StartGameWindowAreaSelectionConsole"

StartGameWindowAreaSelectionConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAreaSelectionConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.world_manager = ingame_ui_context.world_manager
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._has_exited = false
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)

	params.return_layout_index = self.parent:get_selected_game_mode_index()
	self._area_unavailable = true

	self:_setup_area_widgets()
	self:_update_area_option()
	self.parent:set_input_description("select_area_confirm")
end

StartGameWindowAreaSelectionConsole.create_ui_elements = function (self, params, offset)
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
	local area_widgets = {}
	local area_widgets_by_name = {}

	for name, widget_definition in pairs(area_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		area_widgets[#area_widgets + 1] = widget
		area_widgets_by_name[name] = widget
	end

	self._area_widgets = area_widgets
	self._area_widgets_by_name = area_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowAreaSelectionConsole._setup_area_widgets = function (self)
	local ui_scenegraph = self.ui_scenegraph
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}
	local sorted_area_settings = {}

	for area_name, settings in pairs(AreaSettings) do
		local sort_order = settings.sort_order
		sorted_area_settings[sort_order] = settings
	end

	local num_areas = #sorted_area_settings
	local widget_size = scenegraph_definition.area_root.size
	local widget_width = widget_size[1]
	local spacing = 100
	local total_width = widget_width * num_areas + spacing * (num_areas - 1)
	local width_offset = -(total_width / 2) + widget_width / 2

	for index, settings in ipairs(sorted_area_settings) do
		local widget = self._area_widgets[index]
		assigned_widgets[index] = widget
		local content = widget.content
		local description_text = settings.description_text
		local display_name = settings.display_name
		local level_image = settings.level_image
		local dlc_name = settings.dlc_name
		local name = settings.name
		local acts = settings.acts
		content.icon = level_image
		local unlocked = true

		if dlc_name then
			unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		content.locked = not unlocked
		content.area_name = name
		local highest_completed_difficulty_index = math.huge

		for _, act_name in ipairs(acts) do
			local difficulty_index = LevelUnlockUtils.highest_completed_difficulty_index_by_act(statistics_db, stats_id, act_name)

			if difficulty_index < highest_completed_difficulty_index then
				highest_completed_difficulty_index = difficulty_index
			end
		end

		local frame_texture = self:_get_selection_frame_by_difficulty_index(highest_completed_difficulty_index)
		content.frame = frame_texture
		local offset = widget.offset
		local scenegraph_id = widget.scenegraph_id
		offset[1] = width_offset
		width_offset = width_offset + widget_width + spacing
	end

	self._active_area_widgets = assigned_widgets
end

StartGameWindowAreaSelectionConsole._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local difficulty_manager = Managers.state.difficulty
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowAreaSelectionConsole._select_area_by_name = function (self, area_name)
	local active_area_widgets = self._active_area_widgets
	local idx = 1

	if active_area_widgets then
		for index, widget in ipairs(active_area_widgets) do
			local content = widget.content
			local is_selected = content.area_name == area_name
			local button_hotspot = widget.content.button_hotspot
			button_hotspot.is_selected = is_selected

			if is_selected then
				idx = index or idx
			end
		end
	end

	self._selected_area_name = area_name
	self._selected_area_index = idx

	self:_set_area_presentation_info(area_name)

	self._area_unavailable = area_name == nil
end

StartGameWindowAreaSelectionConsole._set_area_presentation_info = function (self, area_name)
	local settings = AreaSettings[area_name]
	local title_text = ""
	local description_text = ""
	local unlocked = true

	if settings then
		local dlc_name = settings.dlc_name

		if dlc_name then
			unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		title_text = Localize(settings.display_name)
		description_text = Localize(settings.description_text)
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.area_title.content.text = title_text
	widgets_by_name.description_text.content.text = description_text
	widgets_by_name.not_owned_text.content.visible = not unlocked
	local video_settings = settings.video_settings
	local material_name = video_settings.material_name
	local resource = video_settings.resource

	self:_setup_video_player(material_name, resource)

	local menu_sound_event = settings.menu_sound_event

	self:_play_sound(menu_sound_event)
end

StartGameWindowAreaSelectionConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAreaSelectionConsole")

	self.ui_animator = nil

	self.parent:set_input_description(nil)

	self._has_exited = true

	self:_destroy_video_player()

	params.return_layout_index = nil

	self:_play_sound("Stop_hud_menu_area_music")
end

StartGameWindowAreaSelectionConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_handle_input(dt, t)
end

StartGameWindowAreaSelectionConsole.post_update = function (self, dt, t)
	self:draw(dt)
end

StartGameWindowAreaSelectionConsole._update_animations = function (self, dt)
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
	local active_area_widgets = self._active_area_widgets

	if active_area_widgets then
		for _, widget in ipairs(active_area_widgets) do
			self:_animate_area_widget(widget, dt)
		end
	end
end

StartGameWindowAreaSelectionConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowAreaSelectionConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowAreaSelectionConsole._is_stepper_button_pressed = function (self, widget)
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

StartGameWindowAreaSelectionConsole._update_area_option = function (self)
	local area_name = self.parent:get_selected_area_name()

	if area_name ~= self._selected_area_name then
		self:_select_area_by_name(area_name)
	end
end

StartGameWindowAreaSelectionConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.parent:window_input_service()
	local widgets_by_name = self._widgets_by_name
	local active_area_widgets = self._active_area_widgets

	if gamepad_active then
		local num_areas = #active_area_widgets
		local current_area_index = self._selected_area_index

		if input_service:get("move_left") then
			local index = math.clamp(current_area_index - 1, 1, num_areas)
			local widget = active_area_widgets[index]
			local content = widget.content
			local area_name = content.area_name

			if self._selected_area_name ~= area_name then
				self:_select_area_by_name(area_name)
			end
		elseif input_service:get("move_right") then
			local index = math.clamp(current_area_index + 1, 1, num_areas)
			local widget = active_area_widgets[index]
			local content = widget.content
			local area_name = content.area_name

			if self._selected_area_name ~= area_name then
				self:_select_area_by_name(area_name)
			end
		end
	elseif active_area_widgets then
		for index, widget in ipairs(active_area_widgets) do
			if self:_is_button_hovered(widget) then
				local content = widget.content
				local area_name = content.area_name

				if self._selected_area_name ~= area_name then
					self:_select_area_by_name(area_name)
				end
			end

			if self:_is_button_pressed(widget) and not self._area_unavailable then
				self:_on_select_button_pressed()

				return
			end
		end
	end

	local gamepad_confirm_pressed = gamepad_active and input_service:get("confirm_press", true)

	if not self._area_unavailable and gamepad_confirm_pressed then
		self:_on_select_button_pressed()
	end
end

StartGameWindowAreaSelectionConsole._on_select_button_pressed = function (self)
	local area_name = self._selected_area_name
	local settings = AreaSettings[area_name]
	local unlocked = true
	local dlc_name = settings.dlc_name

	if dlc_name then
		unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
	end

	if unlocked then
		local parent = self.parent
		local selected_layout_name = parent:get_layout_name()
		local new_layout_name = "mission_selection"

		if selected_layout_name == "area_selection" then
			new_layout_name = "mission_selection"
		end

		parent:set_selected_area_name(area_name)
		parent:set_layout_by_name(new_layout_name)
	else
		local store_page_url = settings.store_page_url

		self:_show_storepage(store_page_url, dlc_name)
	end

	self:_play_sound("Play_hud_menu_area_start")
end

StartGameWindowAreaSelectionConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowAreaSelectionConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_area_widgets = self._active_area_widgets

	if active_area_widgets then
		for _, widget in ipairs(active_area_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	if not self._draw_video_next_frame then
		if self._video_widget and not self._has_exited then
			if not self._video_created then
				UIRenderer.draw_widget(ui_top_renderer, self._video_widget)
			else
				self._video_created = nil
			end
		end
	elseif self._draw_video_next_frame then
		self._draw_video_next_frame = nil
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowAreaSelectionConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowAreaSelectionConsole._setup_video_player = function (self, material_name, resource)
	self:_destroy_video_player()

	local ui_top_renderer = self.ui_top_renderer

	if not ui_top_renderer.video_player then
		local set_loop = true
		local world = ui_top_renderer.world

		UIRenderer.create_video_player(ui_top_renderer, ui_top_renderer.world, resource, set_loop)
	end

	local scenegraph_id = "video"
	local widget_definition = UIWidgets.create_video(scenegraph_id, material_name)
	local widget = UIWidget.init(widget_definition)
	self._video_widget = widget
	self._video_created = true
	self._draw_video_next_frame = true
end

StartGameWindowAreaSelectionConsole._destroy_video_player = function (self)
	local ui_top_renderer = self.ui_top_renderer
	local widget = self._video_widget

	if widget then
		UIWidget.destroy(ui_top_renderer, widget)

		self._video_widget = nil
	end

	if ui_top_renderer and ui_top_renderer.video_player then
		local world = ui_top_renderer.world

		UIRenderer.destroy_video_player(ui_top_renderer, world)
	end

	self._video_created = nil
end

StartGameWindowAreaSelectionConsole._animate_area_widget = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
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
	style.icon_glow.color[1] = hover_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowAreaSelectionConsole._show_storepage = function (self, url, dlc_name)
	local platform = PLATFORM

	if platform == "win32" and rawget(_G, "Steam") then
		if url then
			Steam.open_url(url)
		end
	elseif platform == "xb1" then
		local user_id = Managers.account:user_id()

		if dlc_name then
			local product_id = Managers.unlock:dlc_id(dlc_name)

			if product_id then
				XboxLive.show_product_details(user_id, product_id)
			else
				Application.error(string.format("[StartGameWindowAreaSelection:_show_storepage] No product_id for dlc: %s", dlc_name))
			end
		else
			Application.error("[StartGameWindowAreaSelection:_show_storepage] No dlc name")
		end
	elseif platform == "ps4" then
		local user_id = Managers.account:user_id()

		if dlc_name then
			local product_label = Managers.unlock:ps4_dlc_product_label(dlc_name)

			if product_label then
				Managers.system_dialog:open_commerce_dialog(NpCommerceDialog.MODE_PRODUCT, user_id, {
					product_label
				})
			else
				Application.error(string.format("[StartGameWindowAreaSelection:_show_storepage] No product_id for dlc: %s", dlc_name))
			end
		else
			Application.error("[StartGameWindowAreaSelection:_show_storepage] No dlc name")
		end
	end
end

return
