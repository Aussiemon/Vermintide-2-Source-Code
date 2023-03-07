local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_character_summary_definitions")
local widget_definitions = definitions.widgets
local career_info_widget_definitions = definitions.career_info_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_talent_widget = definitions.create_talent_widget
local create_stat_widget = definitions.create_stat_widget
local create_hero_widget = definitions.create_hero_widget
local create_hero_icon_widget = definitions.create_hero_icon_widget
local LIST_SPACING = definitions.list_spacing
local DO_RELOAD = false
local TALENTS_POSITION_DURATION = 0.3
HeroWindowCharacterSummary = class(HeroWindowCharacterSummary)
HeroWindowCharacterSummary.NAME = "HeroWindowCharacterSummary"

HeroWindowCharacterSummary.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCharacterSummary")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._animations = {}

	self:_create_ui_elements(params)
	self:_start_transition_animation("on_enter")
	self:_setup_title_texts()
	self:_toggle_statistics(false)
	self:_setup_hero_selection_widgets()
	self:_set_career_selection_state(false)
end

HeroWindowCharacterSummary._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowCharacterSummary._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local carrer_info_widgets = {}
	local carrer_info_widgets_by_name = {}

	for name, widget_definition in pairs(career_info_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		carrer_info_widgets[#carrer_info_widgets + 1] = widget
		carrer_info_widgets_by_name[name] = widget
	end

	self._carrer_info_widgets = carrer_info_widgets
	self._carrer_info_widgets_by_name = carrer_info_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)

	self._scrollbar_logic:set_gamepad_scroll_enabled(true)

	widgets_by_name.hero_selection_warning.content.visible = false
end

HeroWindowCharacterSummary.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCharacterSummary")

	self.ui_animator = nil

	self:_commit_talent_changes()
end

HeroWindowCharacterSummary._input_service = function (self)
	local parent = self._parent

	if parent:is_friends_list_active() then
		return parent.fake_input_service
	end

	return parent:window_input_service()
end

HeroWindowCharacterSummary.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	local player = Managers.player:local_player()
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		self:_update_hero_sync()
	end

	self:_update_scroll_position()
	self:_update_animations(dt)
	self:_draw(dt)

	local input_service = self:_input_service()

	self:_handle_input(input_service, dt, t)
end

HeroWindowCharacterSummary.post_update = function (self, dt, t)
	return
end

HeroWindowCharacterSummary._handle_input = function (self, input_service, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self._parent
	local swallow_input = true
	local gamepad_active = Managers.input:is_device_active("gamepad")

	self._scrollbar_logic:update(dt, t)

	local any_pressed = Managers.input:any_input_pressed()
	local input_handled = false
	local talent_slot_widgets = self._talent_slot_widgets

	if talent_slot_widgets then
		for index, widget in ipairs(talent_slot_widgets) do
			if self:_is_button_pressed(widget) then
				self:_on_talent_slot_pressed(index)

				input_handled = true
			end
		end
	end

	local selected_talent_index = self._selected_talent_index

	if selected_talent_index then
		local talent_widgets = self._talent_widgets
		local widgets = talent_widgets[selected_talent_index]

		for index, widget in ipairs(widgets) do
			if self:_is_button_pressed(widget) then
				self:_on_talent_pressed(selected_talent_index, index)

				input_handled = true
			end
		end
	else
		local window_button = widgets_by_name.window_button
		local hero_selection_button = widgets_by_name.hero_selection_button
		local hero_button_pressed = self:_is_button_pressed(hero_selection_button)

		if hero_button_pressed or input_service:get("special_1_press", swallow_input) or self._draw_hero_selection and input_service:get("back_menu", swallow_input) then
			input_handled = true

			self:_set_career_selection_state(not self._draw_hero_selection)
		end

		if self._draw_hero_selection then
			if self:_handle_gamepad_selection(input_service) then
				input_handled = true
			end

			if input_service:get("confirm_press", swallow_input) then
				input_handled = true

				self:_set_career_selection_state(false, true)
			end

			if not gamepad_active and not input_handled then
				local hero_widgets = self._hero_widgets

				for index, widget in ipairs(hero_widgets) do
					if self:_is_button_hovered(widget) then
						local content = widget.content
						local career_settings = content.career_settings

						self:_change_carrer(career_settings)
					end

					if self:_is_button_pressed(widget) then
						input_handled = true

						self:_set_career_selection_state(false, true)
						table.clear(widget.content.button_hotspot)
					end
				end

				if not self:_is_button_hover(window_button) then
					local previous_career_settings = self._previous_career_settings

					self:_change_carrer(previous_career_settings)
				end
			end
		elseif not input_handled then
			local scrollbar_widget = widgets_by_name.list_scrollbar
			local scrollbar_hovered = scrollbar_widget.content.scroll_bar_info.is_hover

			if self:_is_button_pressed(window_button) and not scrollbar_hovered or input_service:get("right_stick_press") then
				self:_toggle_statistics(not self._draw_statistics)
			end
		end
	end

	if not gamepad_active and not input_handled and Managers.input:any_input_pressed() then
		if self._selected_talent_index then
			self:_on_talent_slot_pressed(nil)
		elseif self._draw_hero_selection then
			self:_set_career_selection_state(false)
		end
	end
end

HeroWindowCharacterSummary._handle_gamepad_selection = function (self, input_service)
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local input_handled = false

	if selected_row and selected_column then
		local modified = false

		if input_service:get("move_left_hold_continuous") then
			if selected_column > 1 then
				selected_column = selected_column - 1
				modified = true
			end

			input_handled = true
		elseif input_service:get("move_right_hold_continuous") then
			if selected_column < num_max_columns then
				selected_column = selected_column + 1
				modified = true
			end

			input_handled = true
		end

		if input_service:get("move_up_hold_continuous") then
			if selected_row > 1 then
				selected_row = selected_row - 1
				modified = true
			end

			input_handled = true
		elseif input_service:get("move_down_hold_continuous") then
			if selected_row < num_max_rows then
				selected_row = selected_row + 1
				modified = true
			end

			input_handled = true
		end

		if modified then
			self:_set_selected_hero_by_coordinates(selected_row, selected_column)

			local career_settings = self:_selected_hero_career()

			self:_change_carrer(career_settings)
		end
	end

	return input_handled
end

HeroWindowCharacterSummary._set_career_selection_state = function (self, enabled, career_applied)
	self._draw_hero_selection = enabled
	local career_name = self._parent:current_career()

	if enabled then
		self._previous_career_settings = CareerSettings[career_name]
		local hero_widgets = self._hero_widgets

		for index, widget in ipairs(hero_widgets) do
			local content = widget.content
			local career_settings = content.career_settings

			if career_settings.name == career_name then
				self:_set_selected_hero_index(index)
			end
		end
	else
		if not career_applied then
			local previous_career_settings = self._previous_career_settings

			if previous_career_settings then
				local previous_career_name = previous_career_settings.name

				if previous_career_name ~= career_name then
					self:_change_carrer(previous_career_settings)
				end
			end
		end

		self._previous_career_settings = nil
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.summary_title.content.visible = not enabled
	widgets_by_name.hero_selection_title.content.visible = enabled
	widgets_by_name.list_scrollbar.content.visible = not enabled and self._draw_statistics or false
	self._params.changing_hero = enabled
end

HeroWindowCharacterSummary._change_carrer = function (self, career_settings)
	local parent = self._parent
	local current_career_name = parent:current_career()
	local career_name = career_settings.name

	if career_name == current_career_name then
		return
	end

	local profile_name = career_settings.profile_name
	local profile_index = FindProfileIndex(profile_name)
	local career_index = career_index_from_name(profile_index, career_name)

	parent:set_current_career(profile_index, career_index)

	local playing_career_index = parent.playing_career_index
	local playing_profile_index = parent.playing_profile_index
	local playing_current_hero = playing_career_index == career_index and playing_profile_index == profile_index
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.hero_selection_warning.content.visible = not playing_current_hero
end

HeroWindowCharacterSummary._set_selected_hero_by_coordinates = function (self, row, column)
	local hero_widgets = self._hero_widgets

	for i, widget in ipairs(hero_widgets) do
		local content = widget.content
		local correct_row = content.row == row
		local correct_column = content.column == column

		if correct_row and correct_column then
			self:_set_selected_hero_index(i)

			return
		end
	end
end

HeroWindowCharacterSummary._set_selected_hero_index = function (self, index)
	local hero_widgets = self._hero_widgets

	for i, widget in ipairs(hero_widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot
		local is_selected = i == index
		hotspot.is_selected = is_selected

		if is_selected then
			self._selected_hero_row = content.row
			self._selected_hero_column = content.column
		end
	end

	self._selected_hero_index = index
end

HeroWindowCharacterSummary._selected_hero_career = function (self)
	local selected_hero_index = self._selected_hero_index
	local hero_widgets = self._hero_widgets

	for i, widget in ipairs(hero_widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot
		local is_selected = i == selected_hero_index

		if is_selected then
			return content.career_settings
		end
	end
end

HeroWindowCharacterSummary._on_talent_pressed = function (self, row, column)
	local selected_talents = self._selected_talents

	if selected_talents[row] == 0 then
		self:_play_sound("play_gui_talent_unlock")
	else
		self:_play_sound("play_gui_talents_selection_click")
	end

	self._talent_changes_done = true
	selected_talents[row] = column
	local talent_widgets = self._talent_widgets
	local widget = talent_widgets[row][column]

	table.clear(widget.content.button_hotspot)
	self:_set_talent_selected(row, column)
	self:_on_talent_slot_pressed(row)
end

HeroWindowCharacterSummary._set_talent_selected = function (self, row, column)
	local talent_slot_widgets = self._talent_slot_widgets
	local talent_widgets = self._talent_widgets
	local row_widgets = talent_widgets[row]

	for column_index, widget in ipairs(row_widgets) do
		local content = widget.content
		local style = widget.style
		local is_selected = column_index == column
		content.selected = is_selected
		style.icon.saturated = not is_selected

		if is_selected then
			local slot_widget = talent_slot_widgets[row]
			local slot_content = slot_widget.content
			local slot_style = slot_widget.style
			slot_content.icon = content.icon
			slot_content.talent = content.talent
			slot_content.talent_id = content.talent_id
		end
	end
end

HeroWindowCharacterSummary._on_talent_slot_pressed = function (self, index)
	local selected_talent_index = nil
	local talent_slot_widgets = self._talent_slot_widgets

	for i, widget in ipairs(talent_slot_widgets) do
		local content = widget.content
		local button_hotspot = content.button_hotspot
		local was_selected = button_hotspot.is_selected
		local is_selected = not was_selected and index == i
		content.active = is_selected
		button_hotspot.is_selected = is_selected

		if is_selected then
			selected_talent_index = index
		end
	end

	self._selected_talent_index = selected_talent_index
	self._talents_position_timer = 0
	local widgets_by_name = self._widgets_by_name
	local list_scrollbar = widgets_by_name.list_scrollbar
	local list_content = list_scrollbar.content
	list_content.scroll_bar_info.disable_button = selected_talent_index ~= nil

	self:_enable_talent_row(nil)
end

HeroWindowCharacterSummary._enable_talent_row = function (self, row_index)
	local talent_widgets = self._talent_widgets

	for row, widgets in ipairs(talent_widgets) do
		for _, widget in ipairs(widgets) do
			widget.content.button_hotspot.disable_button = row ~= row_index
		end
	end
end

HeroWindowCharacterSummary._toggle_statistics = function (self, enabled)
	self._draw_statistics = enabled
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.list_scrollbar.content.visible = enabled
	local title_widget = widgets_by_name.summary_title
	title_widget.content.selected_option = enabled and 2 or 1
end

HeroWindowCharacterSummary._update_hero_sync = function (self)
	local parent = self._parent
	local loadout_sync_id = parent.loadout_sync_id
	local hero_sync_id = parent.hero_sync_id
	local talent_sync_id = parent.talent_sync_id
	local update_hero = self._hero_sync_id ~= hero_sync_id
	local update_talents = update_hero or self._talent_sync_id ~= talent_sync_id
	local update_loadout = update_hero or self._loadout_sync_id ~= loadout_sync_id
	local any_update = update_hero or update_talents or update_loadout
	local hero_name = any_update and parent:current_hero()
	local career_name = any_update and parent:current_career()

	if update_hero then
		self:_commit_talent_changes()
		self:_populate_career_info(career_name)

		self._hero_sync_id = hero_sync_id
	end

	if update_talents then
		self:_populate_talents(hero_name, career_name)

		self._talent_sync_id = talent_sync_id
	end

	if update_loadout then
		self:_sync_statistics()

		self._loadout_sync_id = loadout_sync_id
	end
end

HeroWindowCharacterSummary._commit_talent_changes = function (self)
	local talent_changes_done = self._talent_changes_done
	local selected_talents = self._selected_talents

	if talent_changes_done and selected_talents then
		local career_name = self._selected_talents_career_name
		local talent_interface = Managers.backend:get_interface("talents")

		talent_interface:set_talents(career_name, self._selected_talents)

		self._talent_changes_done = nil
		local parent = self._parent

		parent:update_talent_sync()

		self._talent_sync_id = parent.talent_sync_id
	end
end

HeroWindowCharacterSummary._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	self:_animate_title_button(dt)
	self:_update_talent_position_animation(dt)

	local talent_slot_widgets = self._talent_slot_widgets

	for i, widget in ipairs(talent_slot_widgets) do
		self:_animate_talent_widget(widget, dt)
	end

	local talent_widgets = self._talent_widgets

	for _, widgets in ipairs(talent_widgets) do
		for _, widget in ipairs(widgets) do
			self:_animate_talent_widget(widget, dt)
		end
	end

	local hero_row_hovered = nil
	local hero_widgets = self._hero_widgets

	for index, widget in ipairs(hero_widgets) do
		self:_animate_hero_widget(widget, dt)

		if index == self._selected_hero_index then
			hero_row_hovered = math.ceil(index / 3)
		end
	end

	local hero_icon_widgets = self._hero_icon_widgets

	for index, widget in ipairs(hero_icon_widgets) do
		local highlight = hero_row_hovered == index

		self:_animate_hero_icon_widget(widget, highlight, dt)
	end
end

HeroWindowCharacterSummary._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

HeroWindowCharacterSummary._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowCharacterSummary._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroWindowCharacterSummary._exit = function (self)
	self.exit = true
end

HeroWindowCharacterSummary._draw = function (self, dt)
	self:_update_visible_list_entries()

	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local talent_slot_widgets = self._talent_slot_widgets

	if talent_slot_widgets then
		local active_index = nil

		for index, widget in ipairs(talent_slot_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)

			if widget.content.active then
				active_index = index
			end
		end

		local selected_talent_index = self._selected_talent_index

		if selected_talent_index then
			local talent_widgets = self._talent_widgets

			if talent_widgets then
				local widgets = talent_widgets[selected_talent_index]

				for _, widget in ipairs(widgets) do
					UIRenderer.draw_widget(ui_top_renderer, widget)
				end
			end
		end
	end

	if self._draw_hero_selection then
		local hero_widgets = self._hero_widgets

		if hero_widgets then
			for _, widget in ipairs(hero_widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end

		local hero_icon_widgets = self._hero_icon_widgets

		if hero_icon_widgets then
			for _, widget in ipairs(hero_icon_widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	elseif self._draw_statistics then
		local widgets = self._list_widgets

		if widgets then
			for _, widget in ipairs(widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	else
		local widgets = self._carrer_info_widgets

		if widgets then
			for _, widget in ipairs(widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowCharacterSummary._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowCharacterSummary._sync_statistics = function (self)
	local template = HeroStatisticsTemplate
	local layout = UIUtils.get_hero_statistics_by_template(template)

	self:_populate_statistics(layout)
end

HeroWindowCharacterSummary._populate_talents = function (self, hero_name, career_name)
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "talent_root"
	local widget_definition = create_talent_widget(scenegraph_id)
	local talent_interface = Managers.backend:get_interface("talents")
	local current_talents = talent_interface:get_talents(career_name)
	self._selected_talents = table.clone(current_talents)
	self._talent_interface = talent_interface
	self._selected_talents_career_name = career_name
	local experience = ExperienceSettings.get_experience(hero_name)
	local hero_level = ExperienceSettings.get_level(experience)
	local slot_widgets = {}
	local talent_widgets = {}
	local career_settings = CareerSettings[career_name]
	local tree = TalentTrees[hero_name][career_settings.talent_tree_index]
	local talents = self._selected_talents
	local all_talents = Talents[hero_name]
	local width_spacing = 12
	local layer_offset = 5

	for i = 1, NumTalentRows do
		local unlock_name = "talent_point_" .. i
		local row_unlocked = ProgressionUnlocks.is_unlocked(unlock_name, hero_level)
		local talent_unlock_level = TalentUnlockLevels[unlock_name]
		local level_text = tostring(talent_unlock_level)
		local slot_widget = UIWidget.init(widget_definition)
		slot_widgets[i] = slot_widget
		local talent_size = slot_widget.content.size
		local slot_widget_offset = slot_widget.offset
		slot_widget_offset[1] = (i - 1) * (talent_size[1] + width_spacing)
		slot_widget_offset[3] = NumTalentColumns * layer_offset
		slot_widget.content.level_text = level_text
		slot_widget.content.locked = not row_unlocked
		local row_widgets = {}

		for j = 1, NumTalentColumns do
			local widget = UIWidget.init(widget_definition)
			row_widgets[#row_widgets + 1] = widget
			local talent_name = tree[i][j]
			local id = TalentIDLookup[talent_name]
			local talent_data = all_talents[id]
			local content = widget.content
			content.icon = talent_data and talent_data.icon or "icons_placeholder"
			content.talent = talent_data
			content.talent_id = id
			local offset = widget.offset
			offset[1] = (i - 1) * (talent_size[1] + width_spacing)
			offset[2] = j * talent_size[2]
			offset[3] = (NumTalentColumns - j) * layer_offset
		end

		talent_widgets[i] = row_widgets
	end

	self._talent_slot_widgets = slot_widgets
	self._talent_widgets = talent_widgets

	for i = 1, NumTalentRows do
		local selected_column = talents[i]
		local no_talent_selected = not selected_column or selected_column == 0

		for j = 1, NumTalentColumns do
			local is_selected = selected_column == j

			if is_selected then
				self:_set_talent_selected(i, j)
			end
		end
	end
end

HeroWindowCharacterSummary._populate_statistics = function (self, layout)
	local ui_renderer = self._ui_renderer
	local widgets = {}
	local scenegraph_id = "list_item"
	local masked = true
	local widget_definition = create_stat_widget(scenegraph_id, masked)
	local num_entries = #layout

	for i = 1, num_entries do
		local entry = layout[i]
		local widget = UIWidget.init(widget_definition)
		widgets[i] = widget
		local title = ""
		local name = ""
		local value = ""
		local entry_type = entry.type
		local extra_height = 0

		if entry_type == "title" then
			title = entry.display_name
			extra_height = 10
		elseif entry_type == "entry" then
			name = entry.display_name
			value = entry.value
		end

		local content = widget.content
		local style = widget.style
		content.name = UIRenderer.crop_text_width(ui_renderer, name, 300, style.name)
		content.title = UIRenderer.crop_text_width(ui_renderer, title, 300, style.title)
		content.value = value
	end

	self._list_widgets = widgets
	self._total_list_height = self:_align_list_widgets(widgets, LIST_SPACING)

	self:_initialize_scrollbar()
end

HeroWindowCharacterSummary._align_list_widgets = function (self, widgets, spacing)
	local total_height = 0
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		widget.default_offset = table.clone(offset)
		local height = size[2]
		offset[2] = -total_height
		total_height = total_height + height

		if index ~= num_widgets then
			total_height = total_height + spacing
		end
	end

	return total_height
end

HeroWindowCharacterSummary._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.item_list.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 200 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	self._list_thumb_scale = scrollbar_logic:thumb_scale()
end

HeroWindowCharacterSummary._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list_scroll_root.local_position[2] = math.round(length)
		self._scrolled_length = length
	end
end

HeroWindowCharacterSummary._update_visible_list_entries = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if not enabled then
		return
	end

	local scroll_percentage = scrollbar_logic:get_scroll_percentage()
	local scrolled_length = scrollbar_logic:get_scrolled_length()
	local scroll_length = scrollbar_logic:get_scroll_length()
	local list_window_size = scenegraph_definition.item_list.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local widget_position = math.abs(offset[2]) + size[2]
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < math.abs(offset[2]) - scrolled_length then
			is_outside = true
		end

		content.visible = not is_outside
	end
end

HeroWindowCharacterSummary._get_scrollbar_percentage_by_index = function (self, index)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.item_list.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2])
			local start_position_bottom = start_position_top + height
			local percentage_difference = 0

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				return scroll_percentage
			end
		end
	end

	return 0
end

HeroWindowCharacterSummary._setup_title_texts = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.summary_title
	local content = widget.content
	local style = widget.style
	local size = content.size
	local text_spacing = content.text_spacing
	local ui_renderer = self._ui_renderer
	local title1_width = UIUtils.get_text_width(ui_renderer, style.title_text1, content.title_text1)
	local title2_width = UIUtils.get_text_width(ui_renderer, style.title_text2, content.title_text2)
	local divider_width = UIUtils.get_text_width(ui_renderer, style.divider, content.divider)
	local widget_width = size[1]
	local start_offset = -widget_width / 2 + text_spacing
	style.title_text1.offset[1] = -widget_width + title1_width + text_spacing
	style.title_text1_shadow.offset[1] = style.title_text1.offset[1] + 2
	style.divider.offset[1] = title1_width
	style.divider_shadow.offset[1] = style.divider.offset[1] + 2
	style.title_text2.offset[1] = title1_width + divider_width
	style.title_text2_shadow.offset[1] = style.title_text2.offset[1] + 2
end

HeroWindowCharacterSummary._animate_title_button = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.summary_title
	local content = widget.content
	local style = widget.style
	local selected_option = content.selected_option

	for i = 1, 2 do
		local style_id = "title_text" .. i
		local shadow_style_id = "title_text" .. i .. "_shadow"
		local text_style = style[style_id]
		local shadow_text_style = style[shadow_style_id]
		local is_selected = i == selected_option
		local selected_progress = text_style.selected_progress or 0
		local speed = 15

		if is_selected then
			selected_progress = math.min(selected_progress + speed * dt, 1)
		else
			selected_progress = math.max(selected_progress - speed * dt, 0)
		end

		text_style.selected_progress = selected_progress
		local alpha = 255 * selected_progress
		local font_size = text_style.default_font_size + 6 * selected_progress
		text_style.font_size = font_size
		shadow_text_style.font_size = font_size
		local animated_offset = (1 - selected_progress) * 3
		text_style.offset[2] = text_style.default_offset[2] + animated_offset
		shadow_text_style.offset[2] = shadow_text_style.default_offset[2] + animated_offset
		local text_color = text_style.text_color
		local default_text_color = text_style.default_color
		local selected_text_color = text_style.selected_color

		Colors.lerp_color_tables(default_text_color, selected_text_color, selected_progress, text_color)
	end
end

HeroWindowCharacterSummary._populate_career_info = function (self, career_name)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local career_settings = CareerSettings[career_name]
	local character_selection_image = career_settings.character_selection_image
	local display_name = career_settings.display_name
	local widgets_by_name = self._carrer_info_widgets_by_name
	local career_color = Colors.color_definitions[career_name] and Colors.get_color_table_with_alpha(career_name, 255) or {
		255,
		255,
		255,
		255
	}
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability[1]
	local passive_display_name = passive_ability_data.display_name
	local passive_description = passive_ability_data.description
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_description = activated_ability_data.description
	local activated_icon = activated_ability_data.icon
	widgets_by_name.passive_title_text.content.text = Localize(passive_display_name)
	widgets_by_name.passive_description_text.content.text = Localize(passive_description)
	widgets_by_name.passive_icon.content.texture_id = passive_icon
	widgets_by_name.active_title_text.content.text = Localize(activated_display_name)
	widgets_by_name.active_description_text.content.text = Localize(activated_description)
	widgets_by_name.active_icon.content.texture_id = activated_icon
	local passive_perks = passive_ability_data.perks
	local total_perks_height = 0
	local perks_height_spacing = 0

	for i = 1, 3 do
		local widget = widgets_by_name["career_perk_" .. i]
		local content = widget.content
		local style = widget.style
		local scenegraph_id = widget.scenegraph_id
		local scenegraph = ui_scenegraph[scenegraph_id]
		local size = scenegraph.size
		local offset = widget.offset
		offset[2] = -total_perks_height
		local data = passive_perks[i]

		if data then
			local display_name = Localize(data.display_name)
			local description = Localize(data.description)
			local title_text_style = style.title_text
			local description_text_style = style.description_text
			local description_text_shadow_style = style.description_text_shadow
			content.title_text = display_name
			content.description_text = description
			local title_height = UIUtils.get_text_height(ui_renderer, size, title_text_style, display_name)
			local description_height = UIUtils.get_text_height(ui_renderer, size, description_text_style, description)
			description_text_style.offset[2] = -description_height
			description_text_shadow_style.offset[2] = -(description_height + 2)
			total_perks_height = total_perks_height + title_height + description_height + perks_height_spacing
		end

		content.visible = data ~= nil
	end
end

HeroWindowCharacterSummary._animate_talent_widget = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot or content.hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

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
	local hover_alpha = 255 * hover_progress
	style.hover_frame.color[1] = hover_alpha
	local icon_color = style.icon.color
	local icon_color_value = 200 + 55 * combined_progress
	icon_color[2] = icon_color_value
	icon_color[3] = icon_color_value
	icon_color[4] = icon_color_value
	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

HeroWindowCharacterSummary._update_talent_position_animation = function (self, dt)
	local selected_talent_index = self._selected_talent_index

	if not selected_talent_index then
		return
	end

	local talents_position_timer = self._talents_position_timer

	if not talents_position_timer then
		return
	end

	local progress, time_left = self:_get_timer_progress(talents_position_timer, TALENTS_POSITION_DURATION, dt)
	local complete = progress == 1
	local easing = math.easeOutCubic

	if complete then
		self._talents_position_timer = nil

		self:_enable_talent_row(selected_talent_index)
	else
		self._talents_position_timer = time_left
	end

	local talent_widgets = self._talent_widgets
	local widgets = talent_widgets[selected_talent_index]

	self:_set_talent_list_animation_progress(widgets, easing(progress))
end

HeroWindowCharacterSummary._get_timer_progress = function (self, time, max_time, dt)
	local time_left = time + dt
	local progress = math.min(time_left / max_time, 1)

	return progress, time_left
end

HeroWindowCharacterSummary._set_talent_list_animation_progress = function (self, widgets, progress)
	local alpha = 255 * progress

	for index, widget in ipairs(widgets) do
		local size = widget.content.size
		local offset = widget.offset
		local height_offset = size[2] * index * progress
		offset[2] = height_offset
	end
end

HeroWindowCharacterSummary._setup_hero_selection_widgets = function (self)
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local num_max_rows = #SPProfilesAbbreviation
	local num_max_columns = 0
	local hero_widget_definition = create_hero_widget("hero_root")
	local hero_icon_definition = create_hero_icon_widget("hero_icon_root")
	local icon_height_offset = 144
	local hero_width_offset = 116
	local hero_height_offset = 136

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		num_max_columns = math.max(num_max_columns, #careers)
		local icon_widget = UIWidget.init(hero_icon_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[2] = -((i - 1) * hero_height_offset)
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_highlight = hero_icon_texture .. "_glow"

		for j, career in ipairs(careers) do
			local widget = UIWidget.init(hero_widget_definition)
			hero_widgets[#hero_widgets + 1] = widget
			local offset = widget.offset
			local content = widget.content
			content.career_settings = career
			content.row = i
			content.column = j
			local portrait_image = career.portrait_image
			content.portrait = "medium_" .. portrait_image
			local is_career_unlocked = career.is_unlocked_function(hero_name, hero_level)
			content.locked = not is_career_unlocked
			content.button_hotspot.disable_button = content.locked
			offset[1] = (j - 1) * hero_width_offset
			offset[2] = -((i - 1) * hero_height_offset)

			print("lol", #hero_widgets, i, j)
		end
	end

	self._num_max_hero_rows = num_max_rows
	self._num_max_hero_columns = num_max_columns
end

HeroWindowCharacterSummary._animate_hero_widget = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot or content.hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

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
	local hover_alpha = 255 * hover_progress
	style.hover_frame.color[1] = 255 * combined_progress
	local portrait_color = style.portrait.color
	local portrait_color_value = 170 + 85 * combined_progress
	portrait_color[2] = portrait_color_value
	portrait_color[3] = portrait_color_value
	portrait_color[4] = portrait_color_value
	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

HeroWindowCharacterSummary._animate_hero_icon_widget = function (self, widget, highlight, dt)
	local content = widget.content
	local style = widget.style
	local animation_progress = content.animation_progress or 0
	local speed = 8

	if highlight then
		animation_progress = math.min(animation_progress + dt * speed, 1)
	else
		animation_progress = math.max(animation_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(animation_progress)
	local hover_easing_in_progress = math.easeInCubic(animation_progress)
	local hover_alpha = 255 * animation_progress
	style.icon_highlight.color[1] = hover_alpha
	content.animation_progress = animation_progress
end
