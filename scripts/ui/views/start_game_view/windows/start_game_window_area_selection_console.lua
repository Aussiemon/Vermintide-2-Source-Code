-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_area_selection_console.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_area_selection_console_definitions")
local widget_definitions = definitions.widgets
local area_widget_definitions = definitions.area_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

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
		snap_pixel_positions = true,
	}
	self._has_exited = false

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}
	self._ui_animation_callbacks = {}

	self:create_ui_elements(params, offset)

	self._area_unavailable = true

	self.parent:set_input_description("select_area_confirm")
	self:_setup_area_widgets()
	self:_update_area_option()
end

StartGameWindowAreaSelectionConsole.create_ui_elements = function (self, params, offset)
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

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowAreaSelectionConsole._setup_area_widgets = function (self)
	local sorted_area_settings = {}

	for _, settings in pairs(AreaSettings) do
		if not settings.exclude_from_area_selection then
			sorted_area_settings[#sorted_area_settings + 1] = settings
		end
	end

	local function sort_func(a, b)
		return a.sort_order < b.sort_order
	end

	table.sort(sorted_area_settings, sort_func)

	local num_areas = #sorted_area_settings
	local widget_size = scenegraph_definition.area_root.size
	local widget_width = widget_size[1]
	local spacing = 50
	local total_width = widget_width * num_areas + spacing * (num_areas - 1)
	local width_offset = -(total_width / 2) + widget_width / 2
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}

	for i = 1, num_areas do
		local settings = sorted_area_settings[i]
		local widget = self._area_widgets[i]

		assigned_widgets[i] = widget

		local level_image = settings.level_image
		local content = widget.content

		content.icon = level_image

		local unlocked = true
		local dlc_name = settings.dlc_name

		if dlc_name then
			unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		local name = settings.name

		content.locked = not unlocked
		content.area_name = name

		local highest_completed_difficulty_index = math.huge
		local acts = settings.acts

		for j = 1, #acts do
			local act_name = acts[j]
			local difficulty_index = LevelUnlockUtils.highest_completed_difficulty_index_by_act(statistics_db, stats_id, act_name)

			if difficulty_index < highest_completed_difficulty_index then
				highest_completed_difficulty_index = difficulty_index
			end
		end

		local frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(highest_completed_difficulty_index)

		content.frame = frame_texture

		local offset = widget.offset

		offset[1] = width_offset
		width_offset = width_offset + widget_width + spacing
	end

	self._active_area_widgets = assigned_widgets
end

StartGameWindowAreaSelectionConsole._select_area_by_name = function (self, area_name)
	local active_area_widgets = self._active_area_widgets
	local idx = 1

	if active_area_widgets then
		for i = 1, #active_area_widgets do
			local widget = active_area_widgets[i]
			local content = widget.content
			local is_selected = content.area_name == area_name
			local button_hotspot = widget.content.button_hotspot

			button_hotspot.is_selected = is_selected
			idx = is_selected and i or idx
		end
	end

	self._selected_area_name = area_name
	self._selected_area_index = idx

	self:_set_area_presentation_info(area_name)

	self._area_unavailable = area_name == nil
end

StartGameWindowAreaSelectionConsole._set_area_presentation_info = function (self, area_name)
	local title_text = ""
	local description_text = ""
	local unlocked = true
	local settings = AreaSettings[area_name]

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

	if not unlocked then
		self.parent:set_input_description("select_area_buy")

		widgets_by_name.not_owned_text.content.visible = true
		widgets_by_name.requirements_not_met_text.content.visible = false
	else
		local requirements_fulfilled = true

		if settings.unlock_requirement_function then
			local local_player = Managers.player:local_player()
			local stats_id = local_player:stats_id()
			local statistics_db = Managers.player:statistics_db()

			requirements_fulfilled = settings.unlock_requirement_function(statistics_db, stats_id)
		end

		if requirements_fulfilled then
			self.parent:set_input_description("select_area_confirm")

			widgets_by_name.requirements_not_met_text.content.visible = false
		else
			self.parent:set_input_description("select_area_base")

			widgets_by_name.requirements_not_met_text.content.visible = true
			widgets_by_name.requirements_not_met_text.content.text = settings.unlock_requirement_description
		end

		widgets_by_name.not_owned_text.content.visible = false
	end

	local parent = self.parent
	local video_player = parent:get_video_player_by_name(area_name)
	local video_settings = settings.video_settings
	local material_name = video_settings.material_name

	self:_assign_video_player(material_name, video_player)

	local menu_sound_event = settings.menu_sound_event

	self:_play_sound(menu_sound_event)
end

StartGameWindowAreaSelectionConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAreaSelectionConsole")

	self.ui_animator = nil

	self.parent:set_input_description(nil)

	self._has_exited = true

	self:_destroy_video_widget()
	self:_play_sound("Stop_hud_menu_area_music")
end

StartGameWindowAreaSelectionConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
end

StartGameWindowAreaSelectionConsole.post_update = function (self, dt, t)
	self:draw(dt)
end

StartGameWindowAreaSelectionConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local active_area_widgets = self._active_area_widgets

	if active_area_widgets then
		for i = 1, #active_area_widgets do
			local widget = active_area_widgets[i]

			self:_animate_area_widget(widget, dt)
		end
	end

	local ui_animations = self._ui_animations
	local ui_animation_callbacks = self._ui_animation_callbacks

	for animation_name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[animation_name] = nil

			if ui_animation_callbacks[animation_name] then
				ui_animation_callbacks[animation_name]()

				ui_animation_callbacks[animation_name] = nil
			end
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

StartGameWindowAreaSelectionConsole._update_area_option = function (self)
	local area_name = self.parent:get_selected_area_name()

	if area_name ~= self._selected_area_name then
		self:_select_area_by_name(area_name)
	end
end

StartGameWindowAreaSelectionConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local input_service = parent:window_input_service()
	local active_area_widgets = self._active_area_widgets
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
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
		for i = 1, #active_area_widgets do
			local widget = active_area_widgets[i]

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

	local gamepad_confirm_pressed = not mouse_active and input_service:get("confirm_press", true)

	if not self._area_unavailable and gamepad_confirm_pressed then
		self:_on_select_button_pressed()
	end

	if input_service:get("toggle_menu", true) or input_service:get("back_menu", true) then
		local layout_name = "custom_game"

		self.parent:set_layout_by_name(layout_name)
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
		local requirements_fulfilled = true

		if settings.unlock_requirement_function then
			local local_player = Managers.player:local_player()
			local stats_id = local_player:stats_id()
			local statistics_db = Managers.player:statistics_db()

			requirements_fulfilled = settings.unlock_requirement_function(statistics_db, stats_id)
		end

		if requirements_fulfilled then
			local parent = self.parent
			local new_layout_name = "mission_selection"

			parent:set_selected_area_name(area_name)
			parent:set_layout_by_name(new_layout_name)
		end
	else
		local store_page_url = settings.store_page_url

		self:_show_storepage(store_page_url, dlc_name)
	end

	self:_play_sound("Play_hud_menu_area_start")
end

StartGameWindowAreaSelectionConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_area_widgets = self._active_area_widgets

	if active_area_widgets then
		for i = 1, #active_area_widgets do
			local widget = active_area_widgets[i]

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

StartGameWindowAreaSelectionConsole._assign_video_player = function (self, material_name, video_player)
	self:_destroy_video_widget()

	local scenegraph_id = "video"
	local video_widget_definition = UIWidgets.create_fixed_aspect_video(scenegraph_id, material_name)
	local video_widget = UIWidget.init(video_widget_definition)

	video_widget.content.video_content.video_player = video_player

	local ui_top_renderer = self.ui_top_renderer
	local world = ui_top_renderer.world

	World.add_video_player(world, video_player)

	self._video_widget = video_widget
	self._video_created = true
	self._draw_video_next_frame = true

	local background_widget = self._widgets_by_name.background
	local background_widget_style = background_widget.style
	local color = background_widget_style.rect.color

	self._ui_animations.fade_in = UIAnimation.init(UIAnimation.function_by_time, color, 1, 255, 0, 1, math.easeOutCubic)
end

StartGameWindowAreaSelectionConsole._destroy_video_widget = function (self)
	local widget = self._video_widget

	if widget then
		local ui_top_renderer = self.ui_top_renderer
		local video_player = widget.content.video_content.video_player
		local world = ui_top_renderer.world

		World.remove_video_player(world, video_player)

		self._video_widget = nil
	end

	self._video_created = nil
end

StartGameWindowAreaSelectionConsole._animate_area_widget = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local input_speed = 20
	local is_selected = hotspot.is_selected
	local input_progress = hotspot.input_progress or 0
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local speed = 8
	local hover_progress = hotspot.hover_progress or 0
	local is_hover = hotspot.is_hover

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local selection_progress = hotspot.selection_progress or 0

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	local hover_alpha = 255 * combined_progress

	style.icon_glow.color[1] = hover_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowAreaSelectionConsole._show_storepage = function (self, url, dlc_name)
	local platform = PLATFORM

	if IS_WINDOWS and rawget(_G, "Steam") then
		if url then
			Steam.open_url(url)
		end
	elseif IS_XB1 then
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
	elseif IS_PS4 then
		local user_id = Managers.account:user_id()

		if dlc_name then
			local product_label = Managers.unlock:ps4_dlc_product_label(dlc_name)

			if product_label then
				Managers.system_dialog:open_commerce_dialog(NpCommerceDialog.MODE_PRODUCT, user_id, {
					product_label,
				})
			else
				Application.error(string.format("[StartGameWindowAreaSelection:_show_storepage] No product_id for dlc: %s", dlc_name))
			end
		else
			Application.error("[StartGameWindowAreaSelection:_show_storepage] No dlc name")
		end
	end
end
