-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_area_selection_console_v2.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_area_selection_console_v2_definitions")
local widget_definitions = definitions.widgets
local area_widget_definitions = definitions.area_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local STATIC_HEADER = true

StartGameWindowAreaSelectionConsoleV2 = class(StartGameWindowAreaSelectionConsoleV2)
StartGameWindowAreaSelectionConsoleV2.NAME = "StartGameWindowAreaSelectionConsoleV2"

StartGameWindowAreaSelectionConsoleV2.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAreaSelectionConsoleV2")

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
	self._params = params
	self._offset = offset

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

StartGameWindowAreaSelectionConsoleV2.create_ui_elements = function (self, params, offset)
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
	local widget = UIWidget.init(definitions.main_campaign_widget)

	area_widgets[#area_widgets + 1] = widget
	area_widgets_by_name.main_campaign = widget

	for name, widget_definition in pairs(area_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		area_widgets[#area_widgets + 1] = widget
		area_widgets_by_name[name] = widget
	end

	self._area_widgets = area_widgets
	self._area_widgets_by_name = area_widgets_by_name
	self._level_image_widgets = {}

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowAreaSelectionConsoleV2._setup_area_widgets = function (self)
	local sorted_area_settings = {}
	local max_widgets = definitions.grid_settings[1] * definitions.grid_settings[2]

	for _, settings in pairs(AreaSettings) do
		if not settings.exclude_from_area_selection then
			sorted_area_settings[#sorted_area_settings + 1] = settings
		end

		if #sorted_area_settings == max_widgets then
			break
		end
	end

	local function sort_func(a, b)
		return a.sort_order < b.sort_order
	end

	table.sort(sorted_area_settings, sort_func)

	local num_areas = #sorted_area_settings
	local widget_size = scenegraph_definition.area_root_1.size
	local widget_width = widget_size[1]
	local spacing = 30
	local base_offset = -705
	local base_area_offset = 280
	local width_offset = base_area_offset
	local grid_settings = definitions.grid_settings
	local selection_grid = {}
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}

	for i = 1, num_areas do
		local settings = sorted_area_settings[i]
		local widget = i == 1 and self._widgets_by_name.main_campaign or self._area_widgets[i]

		assigned_widgets[i] = widget

		local level_image = settings.level_image
		local content = widget.content
		local style = widget.style

		content.icon = level_image

		local unlocked = true
		local dlc_name = settings.dlc_name

		if dlc_name then
			unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		local name = settings.name

		content.locked = not unlocked
		content.area_name = name
		content.area_desc = settings.long_description_text or self:_create_random_desc()

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

		if i == 1 then
			local y_offset = math.floor((num_areas - 1) / grid_settings[1])

			offset[1] = base_offset
			offset[2] = -y_offset * (widget_width + spacing) * 0.5
			style.divider.texture_size[2] = (y_offset + 1) * (widget_width + spacing)
			selection_grid[i] = {}
			selection_grid[i][#selection_grid[i] + 1] = widget
		else
			local x_offset = (i - 2) % grid_settings[1]
			local y_offset = math.floor((i - 2) / grid_settings[1])

			offset[1] = base_offset + x_offset * (widget_width + spacing) + base_area_offset * math.sign(i - 1)
			offset[2] = -y_offset * (widget_width + spacing)
			width_offset = width_offset + widget_width + spacing

			local column_index = 2 + (i - 2) % grid_settings[1]

			selection_grid[column_index] = selection_grid[column_index] or {}
			selection_grid[column_index][#selection_grid[column_index] + 1] = widget
		end
	end

	self._active_area_widgets = assigned_widgets
	self._selection_grid = selection_grid
	self._selected_grid_index = {
		1,
		1,
	}
end

StartGameWindowAreaSelectionConsoleV2._create_random_desc = function (self)
	local num_texts = 1 + Math.random(5)
	local base_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut fringilla in nulla eu rutrum. "
	local text = ""

	for i = 1, num_texts do
		text = text .. base_text
	end

	return text
end

StartGameWindowAreaSelectionConsoleV2._select_area_by_name = function (self, area_name)
	local selection_grid = self._selection_grid
	local area_desc = " "
	local grid_idx = self._selected_grid_index

	if selection_grid then
		for i = 1, #selection_grid do
			local column = selection_grid[i]

			for j = 1, #column do
				local widget = column[j]
				local content = widget.content
				local is_selected = content.area_name == area_name
				local button_hotspot = widget.content.button_hotspot

				button_hotspot.is_selected = is_selected
				grid_idx = is_selected and {
					i,
					j,
				} or grid_idx
				area_desc = is_selected and content.area_desc or area_desc
			end
		end
	end

	self._selected_area_name = area_name
	self._selected_grid_index = grid_idx

	self:_set_area_presentation_info(area_name, area_desc)

	self._area_unavailable = area_name == nil
end

StartGameWindowAreaSelectionConsoleV2._set_area_presentation_info = function (self, area_name, area_desc)
	local title_text = ""
	local description_text = ""
	local area_type_text = ""
	local unlocked = true
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local statistics_db = Managers.player:statistics_db()
	local settings = AreaSettings[area_name]

	if settings then
		local dlc_name = settings.dlc_name

		if dlc_name then
			unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		title_text = Localize(settings.display_name)
		description_text = Localize(settings.description_text)
		area_type_text = unlocked and (settings.area_type or settings.sort_order == 1 and "area_selection_campaign" or "area_selection_side_quest") or "dlc1_2_dlc_level_locked_tooltip"
	end

	local widgets_by_name = self._widgets_by_name

	widgets_by_name.area_title.content.text = title_text
	widgets_by_name.area_desc.content.text = area_desc
	widgets_by_name.area_type.content.text = area_type_text
	widgets_by_name.area_type.content.dlc_locked = not unlocked
	widgets_by_name.area_type.content.locked = not unlocked

	if STATIC_HEADER then
		local area_desc_widget = widgets_by_name.area_desc
		local area_desc_style = area_desc_widget.style

		area_desc_style.text.area_size = {
			1200,
			225,
		}
		area_desc_style.text.vertical_alignment = "top"
		area_desc_style.text.dynamic_font_size_word_wrap = true
		area_desc_style.text_shadow.area_size = {
			1200,
			225,
		}
		area_desc_style.text_shadow.vertical_alignment = "top"
		area_desc_style.text_shadow.dynamic_font_size_word_wrap = true
		widgets_by_name.area_title.offset[2] = 200
		widgets_by_name.title_divider.offset[2] = 200
		widgets_by_name.area_type.offset[2] = 200
	else
		local text_height = UIUtils.get_text_height(self.ui_renderer, widgets_by_name.area_desc.style.text.area_size, widgets_by_name.area_desc.style.text, area_desc)

		widgets_by_name.area_title.offset[2] = text_height
		widgets_by_name.title_divider.offset[2] = text_height
		widgets_by_name.area_type.offset[2] = text_height
	end

	local act_spacing = 40
	local level_spacing = 5
	local acts = settings.acts
	local offset = 0

	table.clear(self._level_image_widgets)

	for _, act in ipairs(acts) do
		local act = GameActs[act]

		for _, level in ipairs(act) do
			local level_settings = LevelSettings[level]
			local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_settings.level_id)
			local level_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_settings.level_id)
			local level_image_widget = UIWidget.init(definitions.create_level_image_func(level_settings.small_level_image or level_settings.level_id .. "_small_image", level_difficulty_index > 0))

			level_image_widget.offset[1] = offset
			offset = offset + level_spacing + level_image_widget.style.level_image.texture_size[1]
			level_image_widget.style.level_image.saturated = not level_unlocked
			level_image_widget.style.level_image.color = level_unlocked and level_image_widget.style.level_image.unlocked_color or level_image_widget.style.level_image.locked_color
			level_image_widget.content.completed = level_difficulty_index > 0
			level_image_widget.content.boss_level = level_settings.boss_level
			self._level_image_widgets[#self._level_image_widgets + 1] = level_image_widget
		end

		offset = offset + act_spacing
	end

	if not unlocked then
		self.parent:set_input_description("select_area_buy")
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

			widgets_by_name.area_type.content.locked = false
		else
			self.parent:set_input_description("select_area_base")

			widgets_by_name.area_type.content.text = settings.unlock_requirement_description
			widgets_by_name.area_type.content.locked = true
		end
	end

	local parent = self.parent
	local video_player = parent:get_video_player_by_name(area_name)
	local video_settings = settings.video_settings
	local material_name = video_settings.material_name

	self:_assign_video_player(material_name, video_player)

	local menu_sound_event = settings.menu_sound_event

	self:_play_sound(menu_sound_event)
end

StartGameWindowAreaSelectionConsoleV2.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAreaSelectionConsoleV2")

	self.ui_animator = nil

	self.parent:set_input_description(nil)

	self._has_exited = true

	self:_destroy_video_widget()
	self:_play_sound("Stop_hud_menu_area_music")
end

StartGameWindowAreaSelectionConsoleV2.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
end

StartGameWindowAreaSelectionConsoleV2.post_update = function (self, dt, t)
	self:draw(dt)
end

StartGameWindowAreaSelectionConsoleV2._update_animations = function (self, dt)
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

StartGameWindowAreaSelectionConsoleV2._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowAreaSelectionConsoleV2._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowAreaSelectionConsoleV2._update_area_option = function (self)
	local area_name = self.parent:get_selected_area_name()

	if area_name ~= self._selected_area_name then
		self:_select_area_by_name(area_name)
	end
end

StartGameWindowAreaSelectionConsoleV2._handle_input = function (self, dt, t)
	local parent = self.parent
	local input_service = parent:window_input_service()
	local active_area_widgets = self._active_area_widgets
	local selection_grid = self._selection_grid
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		local current_area_column = self._selected_grid_index[1]
		local current_area_row = self._selected_grid_index[2]
		local current_num_columns = #selection_grid
		local current_num_rows = #selection_grid[current_area_column]

		if input_service:get("move_left") then
			local index = math.clamp(current_area_column - 1, 1, current_num_columns)
			local num_rows = #selection_grid[index]
			local widget = selection_grid[index][math.min(current_area_row, num_rows)]
			local content = widget.content
			local area_name = content.area_name

			if self._selected_area_name ~= area_name then
				self:_select_area_by_name(area_name)
			end
		elseif input_service:get("move_right") then
			local index = math.clamp(current_area_column + 1, 1, current_num_columns)
			local num_rows = #selection_grid[index]
			local widget = selection_grid[index][math.min(current_area_row, num_rows)]
			local content = widget.content
			local area_name = content.area_name

			if self._selected_area_name ~= area_name then
				self:_select_area_by_name(area_name)
			end
		elseif input_service:get("move_down") then
			local index = current_area_row + 1
			local widget = selection_grid[current_area_column][index]

			while not widget and current_area_column > 1 do
				current_area_column = current_area_column - 1
				widget = selection_grid[current_area_column][index]
			end

			local content = widget and widget.content
			local area_name = content and content.area_name or self._selected_area_name

			if self._selected_area_name ~= area_name then
				self:_select_area_by_name(area_name)
			end
		elseif input_service:get("move_up") then
			local index = math.clamp(current_area_row - 1, 1, current_num_rows)
			local widget = selection_grid[current_area_column][index]
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
end

StartGameWindowAreaSelectionConsoleV2._on_select_button_pressed = function (self)
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

StartGameWindowAreaSelectionConsoleV2.draw = function (self, dt)
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

	local level_image_widgets = self._level_image_widgets

	if level_image_widgets then
		for i = 1, #level_image_widgets do
			local widget = level_image_widgets[i]

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

StartGameWindowAreaSelectionConsoleV2._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowAreaSelectionConsoleV2._assign_video_player = function (self, material_name, video_player)
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

	local background_widget = self._widgets_by_name.foreground
	local background_widget_style = background_widget.style
	local color = background_widget_style.rect.color

	self._ui_animations.fade_in = UIAnimation.init(UIAnimation.function_by_time, color, 1, 255, 0, 0.5, math.easeInCubic)
end

StartGameWindowAreaSelectionConsoleV2._destroy_video_widget = function (self)
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

StartGameWindowAreaSelectionConsoleV2._animate_area_widget = function (self, widget, dt)
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

StartGameWindowAreaSelectionConsoleV2._show_storepage = function (self, url, dlc_name)
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
