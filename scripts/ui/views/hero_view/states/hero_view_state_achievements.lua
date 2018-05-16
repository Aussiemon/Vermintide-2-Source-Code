require("scripts/ui/reward_popup/reward_popup_ui")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_achievements_definitions")
local widget_definitions = definitions.widgets
local overlay_widget_definitions = definitions.overlay_widgets
local summary_widget_definitions = definitions.summary_widgets
local category_tab_widget_definitions = definitions.category_tab_widgets
local category_tab_widget_definitions = definitions.category_tab_widgets
local quest_entry_definition = definitions.quest_entry_definition
local achievement_entry_definition = definitions.achievement_entry_definition
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local achievement_entry_size = definitions.achievement_entry_size
local achievement_window_size = definitions.achievement_window_size
local achievement_scrollbar_size = definitions.achievement_scrollbar_size
local checklist_entry_size = definitions.checklist_entry_size
local category_tab_info = definitions.category_tab_info
local achievement_spacing = definitions.achievement_spacing
local achievement_presentation_amount = definitions.achievement_presentation_amount
local DO_RELOAD = false
local CHECKLIST_ENTRY_HEIGHT = checklist_entry_size[2]
local ACHIEVEMENT_DEFAULT_HEIGHT = achievement_entry_size[2]
local ACHIEVEMENT_WINDOW_HEIGHT = achievement_window_size[2]
local ACHIEVEMENT_PRESENTATION_AMOUNT = achievement_presentation_amount
local ACHIEVEMENT_SPACING = achievement_spacing
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
HeroViewStateAchievements = class(HeroViewStateAchievements)
HeroViewStateAchievements.NAME = "HeroViewStateAchievements"

HeroViewStateAchievements.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateAchievements")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.voting_manager = ingame_ui_context.voting_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.wwise_world = params.wwise_world
	self.ingame_ui = ingame_ui_context.ingame_ui
	self._quest_manager = Managers.state.quest
	self._achievement_manager = Managers.state.achievement
	self._reward_presentation_queue = {}
	local reward_params = {
		wwise_world = self.wwise_world,
		ui_renderer = self.ui_renderer,
		ui_top_renderer = self.ui_top_renderer,
		input_manager = self.input_manager
	}
	self.reward_popup = RewardPopupUI:new(reward_params)

	self.reward_popup:set_input_manager(self.input_manager)

	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.player = local_player
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes:get(display_name, "career")
	self.hero_name = display_name
	self.career_index = career_index
	self.profile_index = profile_index
	self.is_server = self.parent.is_server
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params)

	self._quest_time = self._quest_manager:time_until_new_daily_quest()

	self._achievement_manager:setup_achievement_data()
	self:_setup_achievement_progress_overview()

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	local summary_button = self._widgets_by_name.summary_button

	self:_on_layout_button_pressed(summary_button, "summary")
	self:play_sound("Play_gui_achivements_menu_open")
end

HeroViewStateAchievements._update_quest_timer = function (self, dt)
	local time_left_in_seconds = self._quest_time

	if not time_left_in_seconds then
		return
	end

	local seconds = math.max(time_left_in_seconds - dt, 0)
	local minutes = math.floor(seconds / 60)
	local hours = math.floor(minutes / 60)
	local time_text = string.format("%02d:%02d:%02d", hours, minutes - hours * 60, seconds % 60)
	local summary_widgets_by_name = self._summary_widgets_by_name
	local widget = summary_widgets_by_name.summary_right_refresh_value
	local content = widget.content
	content.text = time_text
	self._quest_time = seconds
end

HeroViewStateAchievements.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local overlay_widgets = {}
	local overlay_widgets_by_name = {}

	for name, widget_definition in pairs(overlay_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			overlay_widgets[#overlay_widgets + 1] = widget
			overlay_widgets_by_name[name] = widget
		end
	end

	self._overlay_widgets = overlay_widgets
	self._overlay_widgets_by_name = overlay_widgets_by_name
	local summary_widgets = {}
	local summary_widgets_by_name = {}

	for name, widget_definition in pairs(summary_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			summary_widgets[#summary_widgets + 1] = widget
			summary_widgets_by_name[name] = widget
		end
	end

	self._summary_widgets = summary_widgets
	self._summary_widgets_by_name = summary_widgets_by_name
	local category_tab_widgets = {}

	for _, widget_definition in ipairs(category_tab_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			category_tab_widgets[#category_tab_widgets + 1] = widget

			self:_reset_tab(widget)
		end
	end

	self._category_tab_widgets = category_tab_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

HeroViewStateAchievements._setup_achievement_progress_overview = function (self)
	local achievement_manager = self._achievement_manager

	local function gather_category_progress(category, amount, amount_completed)
		if category.entries then
			local entries = category.entries

			for _, achievement_id in ipairs(entries) do
				amount = amount + 1

				if achievement_manager:get_data_by_id(achievement_id).completed then
					amount_completed = amount_completed + 1
				end
			end
		end

		if category.categories then
			for _, category_category in ipairs(category.categories) do
				amount, amount_completed = gather_category_progress(category_category, amount, amount_completed)
			end
		end

		return amount, amount_completed
	end

	local progress_overview = {}
	local achievement_outline = achievement_manager:outline()

	for i, category in ipairs(achievement_outline.categories) do
		local category_progress_data = {
			display_name = category.name
		}
		local amount, amount_completed = gather_category_progress(category, 0, 0)
		category_progress_data.amount = amount
		category_progress_data.amount_completed = amount_completed
		progress_overview[i] = category_progress_data
	end

	self:_set_summary_achievement_categories_progress(progress_overview)
end

HeroViewStateAchievements._handle_layout_buttons_hovered = function (self)
	local widgets_by_name = self._widgets_by_name
	local summary_widgets_by_name = self._summary_widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button
	local achievement_window_button = summary_widgets_by_name.summary_center_window_button
	local quest_window_button = summary_widgets_by_name.summary_right_window_button
	local play_sound = false

	if self:_is_button_hover_enter(quests_button) then
		play_sound = true
	end

	if self:_is_button_hover_enter(quest_window_button) then
		play_sound = true
	end

	if self:_is_button_hover_enter(achievements_button) then
		play_sound = true
	end

	if self:_is_button_hover_enter(achievement_window_button) then
		play_sound = true
	end

	if self:_is_button_hover_enter(summary_button) then
		play_sound = true
	end

	if play_sound then
		self:play_sound("play_gui_equipment_button_hover")
	end
end

HeroViewStateAchievements._on_layout_button_pressed = function (self, widget, layout_type)
	local widgets_by_name = self._widgets_by_name
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button
	quests_button.content.button_hotspot.force_hover = false
	summary_button.content.button_hotspot.force_hover = false
	achievements_button.content.button_hotspot.force_hover = false
	widget.content.button_hotspot.force_hover = false
	quests_button.content.button_hotspot.is_selected = false
	summary_button.content.button_hotspot.is_selected = false
	achievements_button.content.button_hotspot.is_selected = false
	widget.content.button_hotspot.is_selected = true

	if layout_type == "summary" then
		self._draw_summary = true

		self:_deactivate_active_tab()
		self:_reset_tabs()

		self._achievement_widgets = nil
		self._widgets_by_name.achievement_scrollbar.content.visible = false

		self:_populate_recent_claimed_achievements()
	else
		self._draw_summary = false

		self:_setup_layout(layout_type)

		self._widgets_by_name.achievement_scrollbar.content.visible = true
		local tab_widget_index = 1
		local tab_widget = self._category_tab_widgets[tab_widget_index]

		self:_activate_tab(tab_widget, tab_widget_index, true)
	end
end

HeroViewStateAchievements._reset_tabs = function (self)
	for _, widget in ipairs(self._category_tab_widgets) do
		self:_reset_tab(widget)
	end
end

HeroViewStateAchievements._setup_layout = function (self, layout_type)
	local category_tab_widgets = self._category_tab_widgets
	local num_tab_widgets = #category_tab_widgets
	local layout = self:_get_layout(layout_type)
	local categories = layout.categories

	for i = 1, num_tab_widgets, 1 do
		local data = categories[i]
		local widget = category_tab_widgets[i]

		self:_reset_tab(widget)

		if data then
			local name = data.name
			local display_name = Localize(name)
			widget.content.title_text = display_name
			widget.content.data = data
			local categories = data.categories

			if categories then
				self:_populate_tab(widget, categories)
			end

			widget.content.visible = true
		end
	end

	self._achievement_layout_type = layout_type
end

HeroViewStateAchievements._get_layout = function (self, layout_type)
	if layout_type == "achievements" then
		return self._achievement_manager:outline()
	else
		local quest_manager = self._quest_manager
		local quest_layout = quest_manager:get_quest_outline()

		if layout_type then
			for index, data in ipairs(quest_layout) do
				if data.type == layout_type then
					return data
				end
			end
		end

		return quest_layout
	end
end

HeroViewStateAchievements._reset_tab = function (self, widget)
	local content = widget.content
	local style = widget.style
	local list_style = widget.style.list_style
	content.active = false
	content.list_content.active = false
	content.button_hotspot.is_selected = false
	content.visible = false
	list_style.num_draws = 0
	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self.ui_scenegraph[list_scenegraph_id]
	list_scenegraph.size[2] = 0
end

HeroViewStateAchievements._populate_tab = function (self, widget, categories)
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local tab_list_entry_size = category_tab_info.tab_list_entry_size
	local num_categories = #categories
	local tabs_height = tab_list_entry_size[2] * num_categories
	content.tabs_height = tabs_height

	for index, entry in ipairs(categories) do
		local name = entry.name
		local display_name = Localize(name)
		local content = list_content[index]
		content.text = display_name
	end

	style.num_draws = num_categories
end

HeroViewStateAchievements._create_entries = function (self, entries, entry_type)
	local quest_manager = self._quest_manager
	local achievement_manager = self._achievement_manager
	local achievement_widgets = {}
	self._achievement_widgets = achievement_widgets
	local widget_definition, manager = nil
	local can_close = false

	if entry_type == "quest" then
		widget_definition = quest_entry_definition
		can_close = quest_manager:can_refresh_quest()
		manager = quest_manager
	else
		widget_definition = achievement_entry_definition
		manager = achievement_manager
	end

	local num_entries = #entries

	for i = 1, num_entries, 1 do
		local widget = UIWidget.init(widget_definition)
		local content = widget.content
		local style = widget.style
		local entry_id = entries[i]
		local entry_data = manager:get_data_by_id(entry_id)
		local requirements = entry_data.requirements
		local completed = entry_data.completed
		local progress = entry_data.progress
		local claimed = entry_data.claimed
		local reward = entry_data.reward
		content.can_close = can_close
		content.completed = completed
		content.claimed = claimed
		content.id = entry_id
		local name = entry_data.name
		local display_name = name
		content.title = display_name
		local description = entry_data.desc
		local description_text = description
		content.description = description_text
		local icon = entry_data.icon or "icons_placeholder"
		content.icon = icon

		if reward then
			local item_key = reward
			local item_template = ItemMasterList[item_key]
			local fake_item = {
				data = table.clone(item_template)
			}
			content.reward_item = fake_item
			content.reward_icon = item_template.inventory_icon
		end

		local expand_height = 10

		if requirements and #requirements > 0 then
			local requirements_height = self:_set_requirements(widget, requirements)
			expand_height = expand_height + requirements_height
			content.expandable = true
		else
			content.expandable = false
		end

		self:_set_achievement_expand_height(widget, expand_height)

		if progress and not completed then
			local accuired = progress[1]
			local required = progress[2]
			local progress_fraction = accuired / required
			local progress_text = tostring(accuired) .. "/" .. tostring(required)

			self:_set_widget_bar_progress(widget, progress_fraction, progress_text)

			content.draw_bar = true
		else
			content.draw_bar = false
		end

		style.reward_icon.saturated = claimed

		if not completed then
			local color_intensity_fraction = 0.6

			self:_set_color_intensity(style.icon.color, color_intensity_fraction - 0.1)
			self:_set_color_intensity(style.progress_bar.color, color_intensity_fraction)
			self:_set_color_intensity(style.background.color, color_intensity_fraction)
			self:_set_color_intensity(style.icon_background.color, color_intensity_fraction)
			self:_set_color_intensity(style.reward_background.color, color_intensity_fraction)
			self:_set_color_intensity(style.side_detail_left.color, color_intensity_fraction)
			self:_set_color_intensity(style.side_detail_right.color, color_intensity_fraction)
		end

		achievement_widgets[i] = widget
	end

	self.scroll_value = nil

	self:_update_scroll_height()
end

HeroViewStateAchievements._set_widget_bar_progress = function (self, widget, fraction, text)
	local content = widget.content
	local style = widget.style
	local progress_bar_style = style.progress_bar
	local default_size = progress_bar_style.default_size
	local texture_size = progress_bar_style.texture_size
	texture_size[1] = default_size[1] * fraction
	content.progress_text = text
end

HeroViewStateAchievements._set_requirements = function (self, widget, requirements)
	local content = widget.content
	local style = widget.style
	local height = CHECKLIST_ENTRY_HEIGHT
	local larges_list_amount = 0

	for index, entry in ipairs(requirements) do
		local list_index = (index - 1) % 2 + 1
		local checklist_content = content["checklist_" .. list_index]
		local checklist_style = style["checklist_" .. list_index]
		local item_styles = checklist_style.item_styles
		local num_draws = checklist_style.num_draws
		local entry_index = num_draws + 1
		local entry_content = checklist_content[entry_index]
		local entry_style = item_styles[entry_index]
		checklist_style.num_draws = entry_index

		if larges_list_amount < entry_index then
			larges_list_amount = entry_index
		end

		local name = entry.name
		local progress = entry.progress
		local completed = entry.completed
		local display_name = name

		if progress then
			local accuired = progress[1]
			local required = progress[2]
			local progress_text = " (" .. tostring(accuired) .. "/" .. tostring(required) .. ")"
			display_name = display_name .. progress_text
		end

		entry_content.text = display_name

		if completed then
			self:_set_color_values(entry_style.checkbox_marker.color, 255, 0, 0, 0)
		else
			self:_set_color_values(entry_style.checkbox_marker.color, 0, 0, 0, 0)
		end
	end

	return height + larges_list_amount * CHECKLIST_ENTRY_HEIGHT
end

HeroViewStateAchievements._set_achievement_expand_height = function (self, widget, height)
	local content = widget.content
	local style = widget.style
	content.expand_height = height
	style.expand_background.texture_size[2] = height
	style.expand_background_edge.offset[2] = -height
end

HeroViewStateAchievements._update_scroll_height = function (self, optional_scroll_value)
	local total_height = self:_get_achievement_entries_height()
	self.total_scroll_height = math.max(total_height - ACHIEVEMENT_WINDOW_HEIGHT, 0)

	self:_align_achievement_entries()
	self:_setup_scrollbar(total_height, optional_scroll_value)
end

HeroViewStateAchievements._get_achievement_entries_height = function (self, start_index)
	start_index = start_index or 1
	local total_height = 0
	local achievement_widgets = self._achievement_widgets

	for index = start_index, #achievement_widgets, 1 do
		local widget = achievement_widgets[index]
		local content = widget.content
		local widget_height = ACHIEVEMENT_DEFAULT_HEIGHT

		if index > 1 then
			widget_height = widget_height + ACHIEVEMENT_SPACING
		end

		if content.expanded then
			widget_height = widget_height + content.expand_height
		end

		total_height = total_height + widget_height
	end

	return total_height
end

HeroViewStateAchievements._setup_scrollbar = function (self, height, optional_value)
	local widget = self._widgets_by_name.achievement_scrollbar
	local scenegraph_id = widget.scenegraph_id
	local scrollbar_size_y = self.ui_scenegraph[scenegraph_id].size[2]
	local percentage = math.min(scrollbar_size_y / height, 1)
	widget.content.scroll_bar_info.bar_height_percentage = percentage

	self:_set_scrollbar_value(optional_value or 0)

	local scroll_step_multiplier = 2
	local scroll_amount = math.max(ACHIEVEMENT_DEFAULT_HEIGHT / self.total_scroll_height, 0) * scroll_step_multiplier
	self._widgets_by_name.achievement_window.content.scroll_amount = scroll_amount
end

HeroViewStateAchievements._update_mouse_scroll_input = function (self)
	local using_scrollbar = true

	if using_scrollbar then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.achievement_scrollbar
		local achievement_window_widget = widgets_by_name.achievement_window

		if widget.content.scroll_bar_info.on_pressed then
			achievement_window_widget.content.scroll_add = nil
		end

		local mouse_scroll_value = achievement_window_widget.content.scroll_value

		if not mouse_scroll_value then
			return
		end

		local scroll_bar_value = widget.content.scroll_bar_info.value
		local current_scroll_value = self.scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self:_set_scrollbar_value(mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self:_set_scrollbar_value(scroll_bar_value)
		end
	end
end

HeroViewStateAchievements._set_scrollbar_value = function (self, value)
	local current_scroll_value = self.scroll_value

	if value then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.achievement_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		widgets_by_name.achievement_window.content.scroll_value = value

		self:_update_achievement_read_index(value)

		self.scroll_value = value
	end
end

HeroViewStateAchievements._update_achievement_read_index = function (self, fraction)
	local achievement_widgets = self._achievement_widgets
	local num_achievements = #achievement_widgets
	local num_extra_achievements = num_achievements - ACHIEVEMENT_PRESENTATION_AMOUNT
	local total_scroll_height = self.total_scroll_height
	local height_scrolled = total_scroll_height * fraction
	local widgets_scrolled = 1
	local widget_height_counter = 0

	for index = 1, num_achievements, 1 do
		local widget = achievement_widgets[index]
		local content = widget.content
		local widget_height = ACHIEVEMENT_DEFAULT_HEIGHT

		if index > 1 then
			widget_height = widget_height + ACHIEVEMENT_SPACING
		end

		if content.expanded then
			widget_height = widget_height + content.expand_height
		end

		widget_height_counter = widget_height_counter + widget_height

		if height_scrolled < widget_height_counter then
			widgets_scrolled = math.max(index - 1, 1)

			break
		end
	end

	self._achievement_draw_index = widgets_scrolled
	self.ui_scenegraph.achievement_root.position[2] = math.floor(height_scrolled)
end

HeroViewStateAchievements._on_achievement_pressed = function (self, widget)
	local content = widget.content
	local style = widget.style
	local offset = widget.offset
	local can_close = content.can_close
	local close_button_hotspot = content.close_button_hotspot
	local progress_button_hotspot = content.progress_button_hotspot

	if can_close and close_button_hotspot.is_hover then
		local id = content.id
		local quest_refresh_poll_id = self._quest_manager:refresh_quest(id)
		self._quest_refresh_poll_id = quest_refresh_poll_id

		self:block_input()
	elseif progress_button_hotspot.is_hover then
		progress_button_hotspot.is_hover = false

		self:_claim_reward(widget)
	elseif content.expandable then
		if not content.expanded then
			self:play_sound("Play_gui_achivements_menu_item_expand")
		else
			self:play_sound("Play_gui_achivements_menu_item_close")
		end

		content.expanded = not content.expanded
		local expand_height = content.expand_height
		local expand_scroll_fraction = expand_height / self.total_scroll_height
		local new_achievements_height = math.max(self:_get_achievement_entries_height() - ACHIEVEMENT_WINDOW_HEIGHT, 0)
		local height_scrolled = self.total_scroll_height * self.scroll_value
		local new_scroll_fraction = math.min(height_scrolled / new_achievements_height, 1)
		local widget_window_position = ACHIEVEMENT_DEFAULT_HEIGHT + math.abs(offset[2]) - height_scrolled

		if content.expanded then
			widget_window_position = widget_window_position + expand_height
		end

		local widget_height_outside = widget_window_position - ACHIEVEMENT_WINDOW_HEIGHT

		if widget_height_outside > 0 then
			local missing_widget_fraction = widget_height_outside / new_achievements_height
			new_scroll_fraction = math.min(new_scroll_fraction + missing_widget_fraction, 1)
		end

		self:_update_scroll_height(new_scroll_fraction)
	end
end

HeroViewStateAchievements._claim_reward = function (self, widget)
	local content = widget.content
	local id = content.id
	local quest_manager = self._quest_manager
	local reward_poll_id = nil
	local achievement_layout_type = self._achievement_layout_type

	if achievement_layout_type == "achievements" then
		reward_poll_id = self:_claim_achievement_reward(id)
	else
		reward_poll_id = self:_claim_quest_reward(id)
	end

	if reward_poll_id then
		self:play_sound("Play_gui_achivements_menu_claim_reward")

		widget.content.claiming = true
		self._reward_claim_widget = widget

		self:block_input()

		self._reward_poll_id = reward_poll_id
	end
end

HeroViewStateAchievements._claim_quest_reward = function (self, id)
	local quest_manager = self._quest_manager
	local can_claim, claim_error = quest_manager:can_claim_quest_rewards(id)

	if not can_claim then
		print("[HeroViewStateAchievements]:_claim_quest_reward()", can_claim, claim_error, id)

		return nil
	end

	local claim_id = quest_manager:claim_reward(id)

	return claim_id
end

HeroViewStateAchievements._claim_achievement_reward = function (self, id)
	local achievement_manager = self._achievement_manager
	local can_claim, claim_error = achievement_manager:can_claim_achievement_rewards(id)

	if not can_claim then
		print("[HeroViewStateAchievements]:_claim_achievement_reward()", can_claim, claim_error, id)

		return nil
	end

	local claim_id = achievement_manager:claim_reward(id)

	return claim_id
end

HeroViewStateAchievements._is_polling = function (self)
	return self._reward_poll_id or self._quest_refresh_poll_id
end

HeroViewStateAchievements._poll_quest_refresh = function (self, dt)
	local quest_refresh_poll_id = self._quest_refresh_poll_id

	if not quest_refresh_poll_id then
		return
	end

	local quest_manager = self._quest_manager

	if not quest_manager:polling_quest_refresh() then
		self._quest_refresh_poll_id = nil

		self:unblock_input()

		local quests_button = self._widgets_by_name.quests_button

		self:_on_layout_button_pressed(quests_button, "quest")
	end
end

HeroViewStateAchievements._poll_rewards = function (self, dt)
	local reward_poll_id = self._reward_poll_id

	if not reward_poll_id then
		return
	end

	local quest_manager = self._quest_manager
	local polling_quest_reward = quest_manager:polling_quest_reward()
	local achievement_manager = self._achievement_manager
	local polling_achievement_reward = achievement_manager:polling_reward()

	if not polling_quest_reward and not polling_achievement_reward then
		self:_on_reward_claimed(reward_poll_id)

		self._reward_poll_id = nil
	end
end

HeroViewStateAchievements._on_reward_claimed = function (self, reward_poll_id)
	local widget = self._reward_claim_widget
	local content = widget.content
	local style = widget.style
	content.claimed = true
	content.claiming = false
	style.reward_icon.saturated = true
	local color_intensity_fraction = 1

	self:_set_color_intensity(style.icon.color, color_intensity_fraction)
	self:_set_color_intensity(style.progress_bar.color, color_intensity_fraction)
	self:_set_color_intensity(style.background.color, color_intensity_fraction)
	self:_set_color_intensity(style.icon_background.color, color_intensity_fraction)
	self:_set_color_intensity(style.reward_background.color, color_intensity_fraction)
	self:_set_color_intensity(style.side_detail_left.color, color_intensity_fraction)
	self:_set_color_intensity(style.side_detail_right.color, color_intensity_fraction)

	self._reward_claim_widget = nil

	self:_setup_reward_presentation(reward_poll_id)
end

HeroViewStateAchievements._setup_reward_presentation = function (self, reward_poll_id)
	local backend_manager = Managers.backend
	local item_interface = backend_manager:get_interface("items")
	local loot_interface = backend_manager:get_interface("loot")
	local rewards = loot_interface:get_loot(reward_poll_id)
	local num_rewards = #rewards

	if num_rewards > 0 then
		local presentation_data = {}

		for _, data in ipairs(rewards) do
			local backend_id = data[1]
			local amount = data[2]
			local entry = {}
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)
			description[1] = Localize(display_name)
			description[2] = Localize("achv_menu_reward_claimed_title")
			entry[#entry + 1] = {
				widget_type = "description",
				value = description
			}
			entry[#entry + 1] = {
				widget_type = "item",
				value = reward_item
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	else
		self:unblock_input()
	end
end

HeroViewStateAchievements._set_color_intensity = function (self, color, fraction)
	self:_set_color_values(color, nil, color[2] * fraction, color[3] * fraction, color[4] * fraction)
end

HeroViewStateAchievements._set_color_values = function (self, color, p1, p2, p3, p4)
	color[1] = p1 or color[1]
	color[2] = p2 or color[2]
	color[3] = p3 or color[3]
	color[4] = p4 or color[4]
end

HeroViewStateAchievements._align_achievement_entries = function (self)
	local total_height = 0
	local achievement_widgets = self._achievement_widgets

	for _, widget in ipairs(achievement_widgets) do
		local offset = widget.offset
		offset[2] = -total_height
		local content = widget.content
		local widget_height = ACHIEVEMENT_DEFAULT_HEIGHT + ACHIEVEMENT_SPACING

		if content.expanded then
			widget_height = widget_height + content.expand_height
		end

		total_height = total_height + widget_height
	end
end

HeroViewStateAchievements.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

HeroViewStateAchievements._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

HeroViewStateAchievements.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

HeroViewStateAchievements.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

HeroViewStateAchievements.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateAchievements")

	self.ui_animator = nil

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	if self.reward_popup then
		self.reward_popup:destroy()

		self.reward_popup = nil
	end
end

HeroViewStateAchievements._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

HeroViewStateAchievements.input_service = function (self)
	return self.parent:input_service()
end

HeroViewStateAchievements.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local input_service = (self._input_blocked and fake_input_service) or self:input_service()

	if self.reward_popup then
		self.reward_popup:update(dt)
		self:_handle_queued_presentations()
	end

	self:_update_quest_timer(dt)
	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	local transitioning = self.parent:transitioning()
	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		if not transitioning then
			if self:_has_active_level_vote() and not self:_displaying_reward_presentation() and not self:_is_polling() then
				local ignore_sound_on_close_menu = true

				self:close_menu(ignore_sound_on_close_menu)
			else
				self:_handle_input(dt, t)
				self:_poll_quest_refresh(dt)
				self:_poll_rewards(dt)
			end
		end

		if wanted_state or self._new_state then
			self.parent:clear_wanted_state()

			return wanted_state or self._new_state
		end
	end
end

HeroViewStateAchievements._has_active_level_vote = function (self)
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager:vote_in_progress()
	local is_mission_vote = active_vote_name == "game_settings_vote" or active_vote_name == "game_settings_deed_vote"

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

HeroViewStateAchievements.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)
end

HeroViewStateAchievements._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button

	UIWidgetUtils.animate_default_button(exit_button, dt)
	UIWidgetUtils.animate_option_button(quests_button, dt)
	UIWidgetUtils.animate_option_button(summary_button, dt)
	UIWidgetUtils.animate_option_button(achievements_button, dt)

	local summary_quest_book = self._summary_widgets_by_name.summary_quest_book
	local book_progress = 0.5 + math.sin(Application.time_since_launch() * 2) * 0.5
	local book_anim_progress = math.easeOutCubic(book_progress)
	summary_quest_book.offset[2] = book_anim_progress * 6
end

HeroViewStateAchievements._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

HeroViewStateAchievements._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

HeroViewStateAchievements._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroViewStateAchievements._set_button_force_hover = function (self, widget, forced)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot
	hotspot.force_hover = forced
end

HeroViewStateAchievements._handle_input = function (self, dt, t)
	local input_service = (self._input_blocked and fake_input_service) or self:input_service()
	local input_pressed = input_service:get("toggle_menu")
	local widgets_by_name = self._widgets_by_name
	local summary_widgets_by_name = self._summary_widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button
	local achievement_window_button = summary_widgets_by_name.summary_center_window_button
	local quest_window_button = summary_widgets_by_name.summary_right_window_button

	self:_handle_layout_buttons_hovered()

	if self:_is_button_hover_enter(exit_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

	if self:_is_button_pressed(summary_button) then
		self:_on_layout_button_pressed(summary_button, "summary")
		self:play_sound("Play_gui_achivements_menu_summary_tab")
	end

	if self:_is_button_pressed(quests_button) or self:_is_button_pressed(quest_window_button) then
		self:_on_layout_button_pressed(quests_button, "quest")
		self:play_sound("Play_gui_achivements_menu_quest_tab")
	end

	if self:_is_button_pressed(achievements_button) or self:_is_button_pressed(achievement_window_button) then
		self:_on_layout_button_pressed(achievements_button, "achievements")
		self:play_sound("Play_gui_achivements_menu_achivements_tab")
	end

	for index, widget in ipairs(self._category_tab_widgets) do
		local visible = widget.content.visible

		if visible then
			UIWidgetUtils.animate_default_button(widget, dt)

			if self:_is_button_hover_enter(widget) then
				self:play_sound("Play_gui_achivements_menu_hover_category")
			end

			if self:_is_button_pressed(widget) then
				self:_tab_pressed(widget, index)
			end
		end
	end

	local active_tab = self._active_tab

	if active_tab then
		local item_contents = active_tab.content.list_content
		local list_style = active_tab.style.list_style
		local num_draws = list_style.num_draws
		local active_list_index = self._active_list_index

		for i = 1, num_draws, 1 do
			local content = item_contents[i]
			local hotspot = content.button_hotspot or content.hotspot

			if hotspot.on_hover_enter then
				self:play_sound("Play_gui_achivements_menu_hover_category")
			end

			if hotspot.on_release then
				hotspot.on_release = false

				self:_on_tab_list_pressed(i)
			end

			hotspot.is_selected = active_list_index == i
		end
	end

	local achievement_window = widgets_by_name.achievement_window
	local hovering_achievement_window = self:_is_button_hover(achievement_window)
	local achievement_widgets = self._achievement_widgets
	local achievement_draw_index = self._achievement_draw_index

	if achievement_widgets and achievement_draw_index then
		self:_update_mouse_scroll_input()

		if hovering_achievement_window then
			local start_index = achievement_draw_index
			local end_index = math.min(achievement_draw_index + ACHIEVEMENT_PRESENTATION_AMOUNT + 1, #achievement_widgets)

			for i = start_index, end_index, 1 do
				local widget = achievement_widgets[i]

				if self:_is_button_hover_enter(widget) then
					self:play_sound("Play_gui_achivements_menu_hover_item")
				end

				if self:_is_button_pressed(widget) then
					self:_on_achievement_pressed(widget)
				end
			end
		end
	end

	if input_pressed or self:_is_button_pressed(exit_button) then
		self:play_sound("Play_hud_hover")
		self:close_menu()

		return
	end
end

HeroViewStateAchievements._on_tab_list_pressed = function (self, list_index, ignore_sound)
	local active_tab_index = self._active_tab_index
	local achievement_layout_type = self._achievement_layout_type
	local layout = self:_get_layout(achievement_layout_type)
	local categories = layout.categories
	local category = categories[active_tab_index]
	local sub_categories = category.categories
	local sub_category = sub_categories[list_index]
	local list_type = sub_category.type
	local entries = sub_category.entries

	self:_create_entries(entries, list_type)

	self._active_list_index = list_index

	if not ignore_sound then
		self:play_sound("Play_gui_achivements_menu_select_category")
	end
end

HeroViewStateAchievements._tab_pressed = function (self, widget, index, ignore_sound)
	if self._active_tab == widget then
		self:_activate_tab(widget, index, ignore_sound)
	else
		if self._active_tab then
			self:_deactivate_active_tab()
		end

		self:_activate_tab(widget, index, ignore_sound)
	end
end

HeroViewStateAchievements._activate_tab = function (self, widget, index, ignore_sound)
	self._active_tab = widget
	self._active_tab_index = index
	local content = widget.content
	local style = widget.style
	local list_style = style.list_style
	local num_draws = list_style.num_draws
	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self.ui_scenegraph[list_scenegraph_id]
	local tab_size = category_tab_info.tab_size
	local tab_active_size = category_tab_info.tab_active_size
	local tab_list_entry_size = category_tab_info.tab_list_entry_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tabs_height = math.max(tab_list_entry_size[2] * num_draws + tab_list_entry_spacing * (num_draws - 1), 0)
	list_scenegraph.size[1] = tab_active_size[1]
	list_scenegraph.size[2] = tabs_height
	content.button_hotspot.is_selected = true
	local data = content.data
	local entries = data and data.entries
	local categories = data and data.categories

	if entries then
		local list_type = data.type
		self._active_list_index = nil

		self:_create_entries(entries, list_type)

		content.active = false
		content.list_content.active = false
	end

	if categories then
		content.active = true
		content.list_content.active = true

		if not ignore_sound then
			self:play_sound("Play_gui_achivements_menu_expand_category")
		end

		if entries then
			self._active_list_index = nil
		else
			self:_on_tab_list_pressed(1, true)
		end
	elseif not ignore_sound then
		self:play_sound("Play_gui_achivements_menu_select_category")
	end
end

HeroViewStateAchievements._deactivate_active_tab = function (self)
	local widget = self._active_tab

	if not widget then
		return
	end

	self._active_tab = nil
	self._active_tab_index = nil
	local content = widget.content
	local style = widget.style
	local list_style = style.list_style
	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self.ui_scenegraph[list_scenegraph_id]
	local tab_size = category_tab_info.tab_size
	list_scenegraph.size[1] = tab_size[1]
	list_scenegraph.size[2] = 0
	content.active = false
	content.list_content.active = false
	content.button_hotspot.is_selected = false
end

HeroViewStateAchievements.close_menu = function (self, ignore_sound_on_close_menu)
	if not ignore_sound_on_close_menu then
		self:play_sound("Play_gui_achivements_menu_close")
	end

	ignore_sound_on_close_menu = true

	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

HeroViewStateAchievements.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if self:_is_polling() then
		for _, widget in ipairs(self._overlay_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	if self._draw_summary then
		for _, widget in ipairs(self._summary_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	local achievement_widgets = self._achievement_widgets
	local achievement_draw_index = self._achievement_draw_index

	if achievement_widgets and achievement_draw_index then
		local start_index = achievement_draw_index
		local end_index = math.min(achievement_draw_index + ACHIEVEMENT_PRESENTATION_AMOUNT + 1, #achievement_widgets)

		for i = start_index, end_index, 1 do
			local widget = achievement_widgets[i]

			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	for _, widget in ipairs(self._category_tab_widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)
end

HeroViewStateAchievements._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroViewStateAchievements.play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateAchievements._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

HeroViewStateAchievements.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

HeroViewStateAchievements.block_input = function (self)
	self._input_blocked = true
end

HeroViewStateAchievements.unblock_input = function (self)
	self._input_blocked = false
end

HeroViewStateAchievements.input_blocked = function (self)
	return self._input_blocked
end

HeroViewStateAchievements._populate_recent_claimed_achievements = function (self, achievements)
	local summary_widgets_by_name = self._summary_widgets_by_name
	local icons_widget = summary_widgets_by_name.summary_center_recent_icons
	local frames_widget = summary_widgets_by_name.summary_center_recent_frames
	local num_achievements = (achievements and #achievements) or 0
	icons_widget.style.texture_id.draw_count = num_achievements
	frames_widget.style.texture_id.draw_count = num_achievements
	local icon_content = icons_widget.content.texture_id

	if achievements then
		for index, achievement in ipairs(achievements) do
			local icon = achievement.icon
			icon_content[index] = icon
		end
	end
end

HeroViewStateAchievements._set_summary_achievement_categories_progress = function (self, progress_data)
	local summary_widgets_by_name = self._summary_widgets_by_name
	local name = "summary_achievement_bar_"

	for index, data in ipairs(progress_data) do
		local display_name = data.display_name
		local amount = data.amount
		local amount_completed = data.amount_completed
		local progress = amount_completed / amount
		local value_text = tostring(amount_completed) .. "/" .. tostring(amount)
		local title_text = Localize(display_name)
		local widget_name = name .. tostring(index)
		local widget = summary_widgets_by_name[widget_name]
		local content = widget.content
		local style = widget.style
		content.title_text = title_text
		content.value_text = value_text
		local experience_bar_style = style.experience_bar
		local bar_size = experience_bar_style.size
		local bar_default_size = experience_bar_style.default_size
		bar_size[1] = math.floor(bar_default_size[1] * progress)
	end
end

HeroViewStateAchievements._present_reward = function (self, data)
	local reward_popup = self.reward_popup

	if self:_displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue
		reward_presentation_queue[#reward_presentation_queue + 1] = data
	else
		reward_popup:display_presentation(data)

		self._reward_presentation_active = true

		self:block_input()
	end
end

HeroViewStateAchievements._handle_queued_presentations = function (self)
	if self:_is_reward_presentation_complete() or (#self._reward_presentation_queue == 0 and not self:_displaying_reward_presentation()) then
		local reward_presentation_queue = self._reward_presentation_queue
		local num_queued_rewards = #reward_presentation_queue

		if num_queued_rewards > 0 then
			local next_reward = table.remove(reward_presentation_queue, 1)

			self:_present_reward(next_reward)
		elseif self._reward_presentation_active then
			self._reward_presentation_active = false

			self:unblock_input()
		end
	end
end

HeroViewStateAchievements._displaying_reward_presentation = function (self)
	return self.reward_popup:is_presentation_active()
end

HeroViewStateAchievements._is_reward_presentation_complete = function (self)
	return self.reward_popup:is_presentation_complete()
end

HeroViewStateAchievements._reward_presentation_done = function (self)
	return not self._reward_presentation_active
end

return
