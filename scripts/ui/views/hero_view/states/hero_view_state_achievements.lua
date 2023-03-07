require("scripts/ui/reward_popup/reward_popup_ui")
require("scripts/helpers/search_utils")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_achievements_definitions")
local widget_definitions = definitions.widgets
local overlay_widget_definitions = definitions.overlay_widgets
local summary_widget_definitions = definitions.summary_widgets
local search_widget_definitions = definitions.search_widget_definitions
local quest_widget_definitions = definitions.quest_widgets
local achievement_widget_definitions = definitions.achievement_widgets
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
local generic_input_actions = definitions.generic_input_actions
local console_cursor_definition = definitions.console_cursor_definition
local quest_scrollbar_bottom_inset = definitions.quest_scrollbar_bottom_inset
local create_search_filters_widget = definitions.create_search_filters_widget
local CHECKLIST_ENTRY_HEIGHT = checklist_entry_size[2]
local ACHIEVEMENT_DEFAULT_HEIGHT = achievement_entry_size[2]
local ACHIEVEMENT_WINDOW_HEIGHT = achievement_window_size[2]
local ACHIEVEMENT_PRESENTATION_AMOUNT = achievement_presentation_amount
local ACHIEVEMENT_SPACING = achievement_spacing
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
		snap_pixel_positions = false
	}
	self.wwise_world = params.wwise_world
	self.ingame_ui = ingame_ui_context.ingame_ui
	self._quest_manager = Managers.state.quest
	self._achievement_manager = Managers.state.achievement
	self._claimable_challenge_widgets = {}
	self._quest_rewards_fail_reason = nil
	self._search_query = ""
	self._reward_presentation_queue = {}
	local reward_params = {
		wwise_world = self.wwise_world,
		ui_renderer = self.ui_renderer,
		ui_top_renderer = self.ui_top_renderer,
		input_manager = self.input_manager
	}
	self._timer_title = Localize("achv_menu_summary_quest_refresh")
	self._active_quest_tab_timer_type = "daily"
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
	local input_service = self:input_service()
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 5, 100, generic_input_actions.default)

	self.menu_input_description:set_input_description(nil)

	self.hero_name = display_name
	self.career_index = career_index
	self.profile_index = profile_index
	self.is_server = self.parent.is_server
	self._current_gamepad_input_selection = {
		1,
		1
	}
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params)
	self._achievement_manager:setup_achievement_data()
	self:_setup_achievement_progress_overview()
	self:_setup_quest_summary_progress()

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	self:_update_buttons_new_status()

	local summary_button = self._widgets_by_name.summary_button

	self:_on_layout_button_pressed(summary_button, nil, "summary")
	self:play_sound("Play_gui_achivements_menu_open")
	Managers.input:enable_gamepad_cursor()
	self:_create_filter_input_service()
end

HeroViewStateAchievements._create_filter_input_service = function (self)
	local input_manager = Managers.input

	input_manager:create_input_service("achievement_filter", "IngameMenuKeymaps", "IngameMenuFilters", {
		hero_view = false
	})
	input_manager:map_device_to_service("achievement_filter", "gamepad")
end

HeroViewStateAchievements.get_filter_input_service = function (self)
	return Managers.input:get_service("achievement_filter")
end

HeroViewStateAchievements._update_buttons_new_status = function (self)
	local quest_layout = self:_get_layout("quest")
	self._widgets_by_name.quests_button.content.new = self:_has_any_unclaimed_completed_challenge_in_category(quest_layout)
	local achievement_layout = self:_get_layout("achievements")
	self._widgets_by_name.achievements_button.content.new = self:_has_any_unclaimed_completed_challenge_in_category(achievement_layout)
end

HeroViewStateAchievements._update_summary_quest_timers = function (self, dt)
	local layout_type = "quest"
	local layout = self:_get_layout(layout_type)
	local categories = layout.categories
	local widget_prefix_timer = "summary_quest_bar_timer_"
	local summary_widgets_by_name = self._summary_widgets_by_name

	for category_index, category in ipairs(categories) do
		local name = category.name
		local entries = category.entries
		local quest_type = category.quest_type
		local max_entry_amount = category.max_entry_amount or 1
		local has_entries = entries ~= nil
		local time_left_in_seconds = nil

		if quest_type == "daily" then
			time_left_in_seconds = self._quest_manager:time_until_new_daily_quest()
		elseif quest_type == "weekly" then
			time_left_in_seconds = self._quest_manager:time_until_new_weekly_quest()
		elseif quest_type == "event" then
			time_left_in_seconds = self._quest_manager:time_left_on_event_quest()
		end

		local time_text = nil

		if time_left_in_seconds and time_left_in_seconds > 0 then
			time_text = UIUtils.format_duration(time_left_in_seconds)
		else
			time_text = Localize("achv_menu_summary_quests_unavailable")
			time_left_in_seconds = 0
		end

		local timer_widget_name = widget_prefix_timer .. tostring(category_index)
		local timer_widget = summary_widgets_by_name[timer_widget_name]
		local timer_widget_content = timer_widget.content
		timer_widget_content.text = time_text
		local previous_time_in_seconds = timer_widget_content.previous_time_in_seconds or math.huge
		timer_widget_content.previous_time_in_seconds = time_left_in_seconds
		local update_quest_summary = previous_time_in_seconds < time_left_in_seconds

		if update_quest_summary then
			local quests_tab_index = 1
			local daily_quest_tab_list_index = 1
			local update_active_quest_tab = self._active_tab_index == quests_tab_index

			if update_active_quest_tab then
				local tab_widget = self._category_tab_widgets[quests_tab_index]

				self:_setup_layout("quest")
				self:_activate_tab(tab_widget, quests_tab_index, daily_quest_tab_list_index, true)
			end

			self:_setup_quest_summary_progress()
		end

		if self._active_quest_tab_timer_type == quest_type then
			local time_left_text = self._additional_quest_widgets_by_name.time_left_text
			time_left_text.content.text = self._timer_title .. " " .. time_text
		end
	end
end

HeroViewStateAchievements.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._console_cursor_widget = UIWidget.init(console_cursor_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._overlay_widgets, self._overlay_widgets_by_name = UIUtils.create_widgets(overlay_widget_definitions)
	self._summary_widgets, self._summary_widgets_by_name = UIUtils.create_widgets(summary_widget_definitions)
	self._additional_quest_widgets, self._additional_quest_widgets_by_name = UIUtils.create_widgets(quest_widget_definitions)
	self._additional_achievement_widgets, self._additional_achievement_widgets_by_name = UIUtils.create_widgets(achievement_widget_definitions)
	self._search_widgets, self._search_widgets_by_name = UIUtils.create_widgets(search_widget_definitions)
	self._category_tab_widgets = UIUtils.create_widgets(category_tab_widget_definitions)

	for _, widget in pairs(self._category_tab_widgets) do
		self:_reset_tab(widget)
	end

	local search_filters_widget = UIWidget.init(create_search_filters_widget("search_filters", self.ui_renderer, UISettings.achievement_search_definitions))
	self._search_widgets[#self._search_widgets + 1] = search_filters_widget
	self._search_widgets_by_name.filters = search_filters_widget

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	local quest_category_window = self._additional_quest_widgets_by_name.left_window

	self:_set_uvs_scale_progress(quest_category_window.scenegraph_id, quest_category_window.content.texture_id.uvs, 1)

	local achievement_category_window = self._additional_achievement_widgets_by_name.left_window

	self:_set_uvs_scale_progress(achievement_category_window.scenegraph_id, achievement_category_window.content.texture_id.uvs, 1)

	self._category_scrollbar = ScrollBarLogic:new(self._widgets_by_name.category_scrollbar)
end

local function get_category_summary_totals(achievement_manager, category, total, claimed, has_unclaimed)
	local entries = category.entries

	if entries then
		local count = #entries
		total = total + count

		for i = 1, count do
			local data = achievement_manager:get_data_by_id(entries[i])

			if data.claimed then
				claimed = claimed + 1
			elseif data.completed then
				has_unclaimed = true
			end
		end
	end

	local sub_categories = category.categories

	if sub_categories then
		for i = 1, #sub_categories do
			total, claimed, has_unclaimed = get_category_summary_totals(achievement_manager, sub_categories[i], total, claimed, has_unclaimed)
		end
	end

	return total, claimed, has_unclaimed
end

HeroViewStateAchievements._setup_achievement_progress_overview = function (self)
	local achievement_manager = self._achievement_manager
	local progress_overview = {}
	local achievement_outline = achievement_manager:outline()

	for i, category in ipairs(achievement_outline.categories) do
		if category.present_progression then
			local category_progress_data = {
				display_name = category.name
			}
			category_progress_data.amount, category_progress_data.amount_claimed, category_progress_data.has_unclaimed = get_category_summary_totals(achievement_manager, category, 0, 0, false)
			progress_overview[i] = category_progress_data
		end
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
	local achievement_window_button = summary_widgets_by_name.summary_right_window_button
	local quest_window_button = summary_widgets_by_name.summary_left_window_button
	local play_sound = false

	if UIUtils.is_button_hover_enter(quests_button) or UIUtils.is_button_hover_enter(quest_window_button) then
		self:play_sound("Play_gui_achivements_menu_hover_epic")
	end

	if UIUtils.is_button_hover_enter(achievements_button) or UIUtils.is_button_hover_enter(achievement_window_button) then
		play_sound = true
	end

	if UIUtils.is_button_hover_enter(summary_button) then
		play_sound = true
	end

	if UIUtils.is_button_hover(quests_button) then
		quest_window_button.content.has_focus = true
	else
		quest_window_button.content.has_focus = false
	end

	if UIUtils.is_button_hover(quest_window_button) then
		quests_button.content.has_focus = true
	else
		quests_button.content.has_focus = false
	end

	if UIUtils.is_button_hover(achievements_button) then
		achievement_window_button.content.has_focus = true
	else
		achievement_window_button.content.has_focus = false
	end

	if UIUtils.is_button_hover(achievement_window_button) then
		achievements_button.content.has_focus = true
	else
		achievements_button.content.has_focus = false
	end

	if play_sound then
		self:play_sound("play_gui_equipment_button_hover")
	end
end

HeroViewStateAchievements._on_layout_button_pressed = function (self, widget, window_widget, layout_type, tab_widget_index)
	local widgets_by_name = self._widgets_by_name
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button

	if window_widget then
		window_widget.content.has_focus = false

		table.clear(window_widget.content.button_hotspot)
	end

	quests_button.content.button_hotspot.is_selected = false
	summary_button.content.button_hotspot.is_selected = false
	achievements_button.content.button_hotspot.is_selected = false
	widget.content.button_hotspot.is_selected = true
	widget.content.has_focus = false

	if layout_type == "summary" then
		if not self._looping_summary_sounds then
			self:play_sound("Play_gui_achivements_menu_flag_loop")
			self:play_sound("Play_gui_achivements_menu_daily_quest_loop")

			self._looping_summary_sounds = true
		end

		self._draw_summary = true

		self:_deactivate_active_tab()
		self:_reset_tabs()

		self._achievement_widgets = nil
		self._widgets_by_name.achievement_scrollbar.content.visible = false
		self._widgets_by_name.category_scrollbar.content.visible = false
		self._search_widgets_by_name.input.content.visible = false
		self._search_widgets_by_name.filters.content.visible = false
	else
		if layout_type == "achievements" then
			self._additional_type_widgets = self._additional_achievement_widgets
			self._additional_type_widgets_by_name = self._additional_achievement_widgets_by_name
		else
			self._additional_type_widgets = self._additional_quest_widgets
			self._additional_type_widgets_by_name = self._additional_quest_widgets_by_name
		end

		if self._looping_summary_sounds then
			self:play_sound("Stop_gui_achivements_menu_flag_loop")
			self:play_sound("Stop_gui_achivements_menu_daily_quest_loop")

			self._looping_summary_sounds = false
		end

		self._draw_summary = false

		self:_setup_layout(layout_type)

		self._widgets_by_name.achievement_scrollbar.content.visible = true
		self._widgets_by_name.category_scrollbar.content.visible = true
		self._search_widgets_by_name.input.content.visible = true

		self:_update_categories_scroll_height(0)

		tab_widget_index = tab_widget_index or 1
		local tab_widget = self._category_tab_widgets[tab_widget_index]

		self:_activate_tab(tab_widget, tab_widget_index, nil, true)
	end

	self._achievement_layout_type = layout_type
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

	for i = 1, num_tab_widgets do
		local data = categories[i]
		local widget = category_tab_widgets[i]

		self:_reset_tab(widget)
		self:_setup_tab_widget(widget, data)
	end

	self._achievement_layout_type = layout_type
end

HeroViewStateAchievements._setup_tab_widget = function (self, tab_widget, data)
	if data then
		local name = data.name
		local display_name = Localize(name)
		tab_widget.content.title_text = display_name
		tab_widget.content.data = data
		tab_widget.content.new = self:_has_any_unclaimed_completed_challenge_in_category(data)
		local categories = data.categories
		local entries = data.entries

		if categories then
			self:_populate_tab(tab_widget, categories)
		end

		local disable_button = false

		if not entries and not categories then
			disable_button = true
		end

		tab_widget.content.visible = true
		tab_widget.content.button_hotspot.disable_button = disable_button
	end
end

HeroViewStateAchievements._get_layout = function (self, layout_type)
	if layout_type == "achievements" then
		return self._achievement_manager:outline()
	elseif layout_type == "quest" then
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
	content.new = false
	list_style.num_draws = 0
	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self.ui_scenegraph[list_scenegraph_id]
	list_scenegraph.size[2] = 0
	widget.alpha_multiplier = 0
	widget.alpha_fade_in_delay = nil
	widget.alpha_fade_multipler = 5
end

local function has_unclaimed_challenge(challenge_manager, base_category)
	local unlock_manager = Managers.unlock
	local entries = base_category.entries

	if entries then
		for i = 1, #entries do
			local data = challenge_manager:get_data_by_id(entries[i])

			if data.completed and not data.claimed then
				local required_dlc = data.required_dlc
				local required_dlc_extra = data.required_dlc_extra
				local is_unlocked = (not required_dlc or unlock_manager:is_dlc_unlocked(required_dlc)) and (not required_dlc_extra or unlock_manager:is_dlc_unlocked(required_dlc_extra))

				if is_unlocked then
					return true
				end
			end
		end
	end

	local categories = base_category.categories

	if categories then
		for i = 1, #categories do
			if has_unclaimed_challenge(challenge_manager, categories[i]) then
				return true
			end
		end
	end

	return false
end

HeroViewStateAchievements._has_any_unclaimed_completed_challenge_in_category = function (self, base_data)
	local category_type = base_data.type
	local challenge_manager = nil

	if category_type == "achievements" then
		challenge_manager = self._achievement_manager
	elseif category_type == "quest" then
		challenge_manager = self._quest_manager
	else
		ferror("Invalid category type: %q", category_type)
	end

	return has_unclaimed_challenge(challenge_manager, base_data)
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
		content.new = self:_has_any_unclaimed_completed_challenge_in_category(entry)
	end

	style.num_draws = num_categories
end

HeroViewStateAchievements._get_fake_currency_item = function (self, currency_code, amount)
	local template = nil

	if currency_code == "SM" then
		local item_key = "shillings_"
		local amount = amount

		if amount == 1 then
			item_key = item_key .. "01"
		elseif amount == 5 then
			item_key = item_key .. "02"
		elseif amount == 10 then
			item_key = item_key .. "03"
		elseif amount == 25 then
			item_key = item_key .. "04"
		elseif amount == 50 then
			item_key = item_key .. "05"
		elseif amount == 100 then
			item_key = item_key .. "06"
		elseif amount >= 1 and amount < 50 then
			item_key = item_key .. "small"
		elseif amount >= 50 and amount < 100 then
			item_key = item_key .. "medium"
		elseif amount >= 100 then
			item_key = item_key .. "large"
		end

		local data = Currencies[item_key]
		template = {
			data = data
		}
	else
		fassert(false, "Unsupported currency code '%s'", currency_code)
	end

	local fake_item = table.clone(template)

	return fake_item
end

HeroViewStateAchievements._create_entries = function (self, entries, entry_type, entry_subtype)
	local quest_manager = self._quest_manager
	local achievement_manager = self._achievement_manager
	self._claimable_challenge_widgets = {}
	self._has_claimable_filtered_challenges = nil
	local widget_definition, manager = nil
	local can_close = false

	if entry_type == "quest" then
		widget_definition = quest_entry_definition
		can_close = entry_subtype == "daily" and quest_manager:can_refresh_daily_quest()
		manager = quest_manager
	else
		widget_definition = achievement_entry_definition
		manager = achievement_manager
	end

	local needle = self._search_query
	local query = self._search_widgets_by_name.filters.content.query

	print("[HeroViewStateAchievements] Using search query: ", needle)

	needle = SearchUtils.extract_queries(needle, UISettings.achievement_search_definitions, query)
	local temp_content = {}
	local claimable_achievement_widgets = {}
	local unclaimable_achievement_widgets = {}

	for i = 1, #entries do
		local entry_id = entries[i]
		local entry_data = manager:get_data_by_id(entry_id)

		if needle ~= nil and not SearchUtils.simple_search(needle, entry_data.name) and not SearchUtils.simple_search(needle, entry_data.desc) then
			-- Nothing
		else
			local completed = (entry_data.completed or script_data.set_all_challenges_claimable) and not script_data["eac-untrusted"]

			if query.completed ~= nil and query.completed == not completed then
				-- Nothing
			else
				local claimed = entry_data.claimed

				if query.claimed == nil or query.claimed ~= not claimed then
					local unlocked = true
					local locked_text = Localize("dlc_not_owned") .. ":"
					local dlc_name = nil
					local required_dlc = entry_data.required_dlc

					if required_dlc and not Managers.unlock:is_dlc_unlocked(required_dlc) then
						local settings = StoreDlcSettingsByName[required_dlc]

						if settings then
							locked_text = locked_text .. "\n" .. Localize(settings.name)
							dlc_name = settings.dlc_name
						end

						unlocked = false
					end

					local required_dlc_extra = entry_data.required_dlc_extra

					if required_dlc_extra and not Managers.unlock:is_dlc_unlocked(required_dlc_extra) then
						local settings = StoreDlcSettingsByName[required_dlc_extra]

						if settings then
							locked_text = locked_text .. "\n" .. Localize(settings.name)
							dlc_name = settings.dlc_name
						end

						unlocked = false
					end

					if query.locked ~= nil and query.locked == unlocked then
						-- Nothing
					else
						table.clear(temp_content)

						local reward = entry_data.reward

						if reward then
							if type(reward) == "string" then
								local item_key = reward
								local item_template = ItemMasterList[item_key]
								local fake_item = {
									data = item_template
								}
								temp_content.reward_item = fake_item
								temp_content.reward_icon = item_template.inventory_icon
								temp_content.reward_icon_background = UISettings.item_rarity_textures[item_template.rarity]
							elseif type(reward) == "table" then
								local reward_type = reward.reward_type

								if reward_type == "item" or CosmeticUtils.is_cosmetic_item(reward_type) then
									local item_key = reward.item_name
									local item_template = ItemMasterList[item_key]
									local custom_data = reward.custom_data
									local fake_item = {
										data = item_template
									}

									if custom_data then
										if custom_data.power_level then
											fake_item.power_level = tonumber(custom_data.power_level)
										end

										if custom_data.rarity then
											fake_item.rarity = custom_data.rarity
										end
									end

									temp_content.reward_item = fake_item
									temp_content.reward_icon = item_template.inventory_icon
									temp_content.reward_icon_background = UISettings.item_rarity_textures[fake_item.rarity or item_template.rarity]
								elseif reward_type == "keep_decoration_painting" then
									local decoration_name = reward.decoration_name
									local painting_data = Paintings[decoration_name]
									local rarity = reward.rarity or painting_data.rarity or "plentiful"
									local fake_item = {
										data = {
											item_type = "keep_decoration_painting",
											slot_type = "keep_decoration_painting",
											information_text = "information_text_painting",
											matching_item_key = "keep_decoration_painting",
											can_wield = CanWieldAllItemTemplates,
											rarity = rarity,
											display_name = painting_data.display_name,
											description = painting_data.description
										},
										painting = decoration_name
									}
									temp_content.reward_item = fake_item
									temp_content.reward_icon = painting_data.icon
									temp_content.reward_icon_background = UISettings.item_rarity_textures[rarity]
								elseif reward_type == "weapon_skin" then
									local weapon_skin_name = reward.weapon_skin_name
									local weapon_skin_data = WeaponSkins.skins[weapon_skin_name]
									local rarity = weapon_skin_data.rarity or "plentiful"
									local fake_item = {
										data = {
											item_type = "weapon_skin",
											slot_type = "weapon_skin",
											information_text = "information_weapon_skin",
											matching_item_key = weapon_skin_data.item_type,
											can_wield = CanWieldAllItemTemplates,
											rarity = rarity
										},
										skin = weapon_skin_name
									}
									local icon = weapon_skin_data.inventory_icon
									temp_content.reward_item = fake_item
									temp_content.reward_icon = icon
									temp_content.is_illusion = true
									temp_content.reward_icon_background = UISettings.item_rarity_textures[rarity]
								elseif reward_type == "currency" then
									local fake_item = self:_get_fake_currency_item(reward.currency_code, reward.amount)
									local icon = fake_item.data.icon
									local background = UISettings.item_rarity_textures[fake_item.data.rarity]
									temp_content.reward_item = fake_item
									temp_content.reward_icon = icon
									temp_content.reward_icon_background = background
								end
							end

							if query.reward ~= nil then
								local data = temp_content.reward_item.data
								local reward_type = data.slot_type or data.item_type
							end
						else
							local widget = UIWidget.init(widget_definition)
							local content = widget.content
							local style = widget.style

							table.merge(content, temp_content)

							if not unlocked then
								if dlc_name then
									content.dlc_name = dlc_name
								else
									locked_text = locked_text .. "\n" .. Localize("lb_unknown")
								end

								content.locked_text = locked_text
							end

							local requirements = entry_data.requirements
							local progress = entry_data.progress
							content.locked = not unlocked
							content.can_close = can_close and not completed
							content.completed = completed
							content.claimed = claimed
							content.id = entry_id
							content.original_order_index = i
							local name = entry_data.name
							local display_name = name
							content.title = display_name
							local description = entry_data.desc
							local description_text = description
							content.description = description_text
							local icon = entry_data.icon or "icons_placeholder"
							content.icon = icon
							local expand_height = 10

							if requirements and #requirements > 0 then
								local requirements_height = self:_set_requirements(widget, requirements)
								expand_height = expand_height + requirements_height
								content.expandable = true
							else
								content.expandable = false
							end

							self:_set_achievement_expand_height(widget, expand_height)

							if progress and not completed and not claimed then
								self:_set_widget_bar_progress(widget, progress[1], progress[2])

								content.draw_bar = true
							else
								content.draw_bar = false
							end

							style.reward_icon.saturated = claimed

							if not completed then
								Colors.darker(style.icon.color, 1.94)
								Colors.darker(style.progress_bar.color, 1.43)
								Colors.darker(style.background.color, 1.43)
								Colors.darker(style.icon_background.color, 1.43)
								Colors.darker(style.reward_background.color, 1.43)
								Colors.darker(style.side_detail_left.color, 1.43)
								Colors.darker(style.side_detail_right.color, 1.43)
							end

							if completed and not claimed and unlocked then
								claimable_achievement_widgets[#claimable_achievement_widgets + 1] = widget
								self._claimable_challenge_widgets[#self._claimable_challenge_widgets + 1] = widget
							else
								unclaimable_achievement_widgets[#unclaimable_achievement_widgets + 1] = widget
							end

							if claimable_achievement_widgets and #claimable_achievement_widgets ~= 0 then
								self._has_claimable_filtered_challenges = true
							else
								self._has_claimable_filtered_challenges = false
							end
						end
					end
				end
			end
		end
	end

	if #unclaimable_achievement_widgets > 1 then
		table.sort(unclaimable_achievement_widgets, function (a, b)
			local a_content = a.content
			local b_content = b.content

			if a_content.claimed == b_content.claimed then
				return a_content.original_order_index < b_content.original_order_index
			else
				return not a_content.claimed
			end
		end)
	end

	table.append(claimable_achievement_widgets, unclaimable_achievement_widgets)

	self._achievement_widgets = claimable_achievement_widgets
	self.scroll_value = nil

	self:_update_achievements_scroll_height()
	self:_setup_achievement_entries_animations()

	if self._achievement_widgets[1] then
		self:_hide_empty_entries_warning()
	else
		self:_show_empty_entries_warning()
	end
end

HeroViewStateAchievements._show_empty_entries_warning = function (self)
	local additional_type_widgets_by_name = self._additional_type_widgets_by_name
	local overlay_widget = additional_type_widgets_by_name.overlay
	local overlay_text_widget = additional_type_widgets_by_name.overlay_text
	local overlay_fade_widget = additional_type_widgets_by_name.overlay_fade
	overlay_widget.content.visible = true
	overlay_fade_widget.content.visible = true
	overlay_text_widget.content.visible = true
end

HeroViewStateAchievements._hide_empty_entries_warning = function (self)
	local additional_type_widgets_by_name = self._additional_type_widgets_by_name
	local overlay_widget = additional_type_widgets_by_name.overlay
	local overlay_text_widget = additional_type_widgets_by_name.overlay_text
	local overlay_fade_widget = additional_type_widgets_by_name.overlay_fade
	overlay_widget.content.visible = false
	overlay_fade_widget.content.visible = false
	overlay_text_widget.content.visible = false
end

HeroViewStateAchievements._set_widget_bar_progress = function (self, widget, current, required)
	local content = widget.content
	local style = widget.style
	local progress_bar_style = style.progress_bar
	local default_size = progress_bar_style.default_size
	local texture_size = progress_bar_style.texture_size
	texture_size[1] = default_size[1] * current / required
	content.progress_text = string.format("%d/%d", current, required)
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

		Colors.set(entry_style.checkbox_marker.color, completed and 255 or 0, 0, 0, 0)
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

HeroViewStateAchievements._update_achievements_scroll_height = function (self, optional_scroll_value)
	local total_height = self:_get_achievement_entries_height()
	self.total_scroll_height = math.max(total_height - ACHIEVEMENT_WINDOW_HEIGHT, 0)

	self:_setup_scrollbar(total_height, optional_scroll_value)
	self:_align_achievement_entries()
end

HeroViewStateAchievements._update_categories_scroll_height = function (self, optional_scroll_value)
	local window_size = scenegraph_definition.category_window_mask.size
	local scrollbar_size = scenegraph_definition.category_scrollbar.size
	local scrollbar_logic = self._category_scrollbar
	local draw_length = window_size[2]
	local content_length = self:_get_category_entries_height()
	local scrollbar_length = scrollbar_size[2]
	local step_size = 220
	local scroll_step_multiplier = 1

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)

	if optional_scroll_value then
		scrollbar_logic:set_scroll_percentage(optional_scroll_value)
	else
		local active_tab_start, active_tab_size = self:_get_active_category_height()

		scrollbar_logic:scroll_to_fit(active_tab_start, active_tab_size)
	end
end

HeroViewStateAchievements._get_achievement_entries_height = function (self, start_index)
	start_index = start_index or 1
	local total_height = 0
	local achievement_widgets = self._achievement_widgets

	for index = start_index, #achievement_widgets do
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

	local scrollbar_bottom_inset = 0

	if self._achievement_layout_type == "quest" then
		scrollbar_bottom_inset = quest_scrollbar_bottom_inset
	end

	return total_height + scrollbar_bottom_inset
end

HeroViewStateAchievements._get_category_entries_height = function (self)
	local num_tabs = #self._category_tab_widgets
	local tab_size = category_tab_info.tab_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_height = math.max(tab_size[2] * num_tabs + tab_list_entry_spacing * (num_tabs - 1), 0)

	return tab_height + self:_get_active_tabs_height()
end

HeroViewStateAchievements._get_active_tabs_height = function (self)
	local active_tab = self._active_tab
	local num_sub_tabs = active_tab and active_tab.style.list_style.num_draws or 0
	local tab_list_entry_size = category_tab_info.tab_list_entry_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_list_height = math.max(tab_list_entry_size[2] * num_sub_tabs + tab_list_entry_spacing * (num_sub_tabs - 1), 0)

	return tab_list_height
end

HeroViewStateAchievements._get_active_category_height = function (self)
	local active_tab = self._active_tab_index or 1
	local num_tabs = active_tab - 1
	local tab_size = category_tab_info.tab_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_start_height = math.max(tab_size[2] * num_tabs + tab_list_entry_spacing * (num_tabs - 1), 0)
	local tab_list_height = self:_get_active_tabs_height()

	return tab_start_height, tab_size[2] + tab_list_entry_spacing + tab_list_height
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

	for index = 1, num_achievements do
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

HeroViewStateAchievements._update_category_scroll_position = function (self)
	local scrollbar_logic = self._category_scrollbar
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._category_scrolled_length then
		self.ui_scenegraph.category_root.local_position[2] = math.round(length)
		self._category_scrolled_length = length
	end
end

HeroViewStateAchievements._on_achievement_pressed = function (self, widget)
	if self._claim_all then
		return
	end

	local content = widget.content
	local style = widget.style
	local offset = widget.offset
	local can_close = content.can_close
	local close_button_hotspot = content.close_button_hotspot
	local progress_button_hotspot = content.progress_button_hotspot

	if can_close and close_button_hotspot.is_hover then
		local id = content.id
		local quest_refresh_poll_id = self._quest_manager:refresh_daily_quest(id)
		self._quest_refresh_poll_id = quest_refresh_poll_id

		self:block_input()
		self:play_sound("Play_gui_achivements_menu_destroy_item")
	elseif progress_button_hotspot.is_hover then
		progress_button_hotspot.is_hover = false

		if content.locked then
			content.dlc_on_claim = true

			self:play_sound("Play_gui_locked_content")
		else
			self:_claim_reward(widget)
		end
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

		self:_update_achievements_scroll_height(new_scroll_fraction)
	end
end

HeroViewStateAchievements._claim_reward = function (self, widget)
	local content = widget.content
	local id = content.id
	local reward_poll_id, reason = nil
	local achievement_layout_type = self._achievement_layout_type

	if achievement_layout_type == "achievements" then
		reward_poll_id = self:_claim_achievement_reward(id)
	else
		reward_poll_id, reason = self:_claim_quest_reward(id)
	end

	if reward_poll_id then
		self:play_sound("Play_gui_achivements_menu_claim_reward")

		widget.content.claiming = true
		self._reward_claim_widget = widget

		self:block_input()

		self._reward_poll_id = reward_poll_id
		self._reward_poll_type = achievement_layout_type
	elseif reason then
		printf("[HeroViewStateAchievements] %s", reason)
	end
end

HeroViewStateAchievements._claim_multiple_rewards = function (self, challenge_widgets)
	local reward_poll_claim_all_id, reason = nil
	local challenges_ids = {}

	for i = 1, #challenge_widgets do
		local widget = challenge_widgets[i]
		local id = widget.content.id
		challenges_ids[i] = id
		widget.content.claiming = true
	end

	local achievement_layout_type = self._achievement_layout_type

	if achievement_layout_type == "achievements" then
		reward_poll_claim_all_id = self:_claim_multiple_achievement_rewards(challenges_ids)
	else
		reward_poll_claim_all_id, reason = self:_claim_multiple_quest_rewards(challenges_ids)
	end

	self._reward_poll_claim_all_id = reward_poll_claim_all_id
	self._reward_poll_type = achievement_layout_type
	self._quest_rewards_fail_reason = reason
end

HeroViewStateAchievements._claim_quest_reward = function (self, id)
	local quest_manager = self._quest_manager
	local can_claim, claim_error = quest_manager:can_claim_quest_rewards(id)

	if not can_claim then
		print("[HeroViewStateAchievements]:_claim_quest_reward()", can_claim, claim_error, id)

		return nil, nil
	end

	local claim_id, reason = quest_manager:claim_reward(id)

	return claim_id, reason
end

HeroViewStateAchievements._claim_multiple_quest_rewards = function (self, keys)
	local quest_manager = self._quest_manager
	local can_claim, claimable_quest_keys, claim_error = quest_manager:can_claim_multiple_quest_rewards(keys)

	if not can_claim then
		print("[HeroViewStateAchievements]:_claim_quest_reward()", can_claim, claim_error, keys)

		return nil, nil
	end

	local claim_id, reason = quest_manager:claim_multiple_quest_rewards(keys)

	return claim_id, reason
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

HeroViewStateAchievements._claim_multiple_achievement_rewards = function (self, achievements_ids)
	local achievement_manager = self._achievement_manager
	local claimable_achievements, unclaimable_achievements, error_message = achievement_manager:can_claim_all_achievement_rewards(achievements_ids)

	if not claimable_achievements and not unclaimable_achievements then
		printf("[HeroViewStateAchievements]: Failed to claim achievement: %s", error_message)

		return nil
	end

	if unclaimable_achievements then
		for i = 1, #unclaimable_achievements do
			printf("[HeroViewStateAchievements]: %s, %s", error_message, unclaimable_achievements[i])
		end
	end

	if claimable_achievements then
		local claim_id = achievement_manager:claim_multiple_rewards(claimable_achievements)

		return claim_id
	end
end

HeroViewStateAchievements._is_polling = function (self)
	return self._reward_poll_id or self._quest_refresh_poll_id or self._reward_poll_claim_all_id
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
		local quest_window_button = self._widgets_by_name.quest_window_button

		self:_on_layout_button_pressed(quests_button, quest_window_button, "quest")
	end
end

HeroViewStateAchievements._poll_rewards = function (self, dt)
	local reward_poll_id = self._reward_poll_id

	if not reward_poll_id then
		return
	end

	local is_polling_reward = nil
	local polling_type = self._reward_poll_type

	if polling_type == "quest" then
		local quest_manager = self._quest_manager
		is_polling_reward = quest_manager:polling_quest_reward()
	elseif polling_type == "achievements" then
		local achievement_manager = self._achievement_manager
		is_polling_reward = achievement_manager:polling_reward()
	else
		ferror("Unknown reward_poll_type (%s)", polling_type)
	end

	if not is_polling_reward then
		self:_on_reward_claimed(reward_poll_id, polling_type)

		self._reward_poll_id = nil
		self._reward_poll_type = nil
	end
end

HeroViewStateAchievements._poll_all_rewards = function (self, dt)
	local reward_poll_claim_all_id = self._reward_poll_claim_all_id

	if not reward_poll_claim_all_id then
		return
	end

	local is_polling_reward = nil
	local polling_type = self._reward_poll_type

	if not self._reward_poll_type then
		return
	end

	if polling_type == "quest" then
		local quest_manager = self._quest_manager
		is_polling_reward = quest_manager:polling_quest_reward()
	elseif polling_type == "achievements" then
		local achievement_manager = self._achievement_manager
		is_polling_reward = achievement_manager:polling_reward()
	else
		ferror("Unknown reward_poll_type (%s)", polling_type)
	end

	if not is_polling_reward then
		self:_on_all_rewards_claimed(reward_poll_claim_all_id, polling_type)

		self._reward_poll_claim_all_id = nil
		self._reward_poll_type = nil
	end
end

HeroViewStateAchievements._on_reward_claimed = function (self, reward_poll_id, polling_type)
	local widget = self._reward_claim_widget
	local content = widget.content
	local style = widget.style
	content.claimed = true
	content.claiming = false
	style.reward_icon.saturated = true
	self._reward_claim_widget = nil

	self:_setup_reward_presentation(reward_poll_id, polling_type)

	if polling_type == "quest" then
		self:_setup_layout("quest")

		local tab_widget = self._active_tab
		local tab_index = self._active_tab_index

		self:_activate_tab(tab_widget, tab_index, 1, true)
	end

	self:_update_new_status_for_current_tab()
	self:_update_buttons_new_status()

	local idx = table.index_of(self._claimable_challenge_widgets, widget)

	table.swap_delete(self._claimable_challenge_widgets, idx)
	self:_handle_claim_all_challenges()
end

HeroViewStateAchievements._on_all_rewards_claimed = function (self, reward_poll_id, polling_type)
	local rewards_widgets = self._claimable_challenge_widgets

	for i = 1, #rewards_widgets do
		local widget = rewards_widgets[i]
		local content = widget.content
		local style = widget.style
		content.claimed = true
		content.claiming = false
		style.reward_icon.saturated = true
	end

	self._claimable_challenge_widgets = nil
	self._has_claimable_filtered_challenges = nil

	self:_setup_reward_presentation(reward_poll_id, polling_type)

	if polling_type == "quest" then
		self:_setup_layout("quest")

		local tab_widget = self._active_tab
		local tab_index = self._active_tab_index

		self:_activate_tab(tab_widget, tab_index, 1, true)
	end

	self:_handle_claim_all_challenges()
	self:_update_new_status_for_current_tab()
	self:_update_buttons_new_status()
end

HeroViewStateAchievements._update_new_status_for_current_tab = function (self)
	if self._achievement_layout_type == "achievements" then
		local achievement_list = {}

		local function fill_achievement_list(data)
			if data.entries then
				for _, achievement_id in ipairs(data.entries) do
					achievement_list[#achievement_list + 1] = achievement_id
				end
			end

			if data.categories then
				for _, category in ipairs(data.categories) do
					fill_achievement_list(category)
				end
			end
		end

		local active_tab = self._active_tab
		local data = active_tab.content.data

		fill_achievement_list(data)
		self._achievement_manager:setup_achievement_data_from_list(achievement_list)
		self:_setup_tab_widget(active_tab, data)

		return
	end

	if self._achievement_layout_type == "quest" then
		local layout = self:_get_layout(self._achievement_layout_type)
		local categories = layout.categories
		local category_tab_widgets = self._category_tab_widgets
		local num_tab_widgets = #category_tab_widgets

		for i = 1, num_tab_widgets do
			local new_data = categories[i]
			local widget = category_tab_widgets[i]

			self:_setup_tab_widget(widget, new_data)
		end
	end
end

HeroViewStateAchievements._setup_reward_presentation = function (self, reward_poll_id, polling_type)
	local backend_manager = Managers.backend
	local item_interface = backend_manager:get_interface("items")
	local rewards = nil

	if polling_type == "quest" then
		local quest_interface = backend_manager:get_interface("quests")
		local quest_rewards = quest_interface:get_quest_rewards(reward_poll_id)
		rewards = quest_rewards.loot
	elseif polling_type == "achievements" then
		local loot_interface = backend_manager:get_interface("loot")
		rewards = loot_interface:get_loot(reward_poll_id)
	else
		ferror("Unknown reward_polling_type (%s)", polling_type)
	end

	local num_rewards = #rewards

	if num_rewards > 0 then
		local presentation_data = {}

		for _, data in ipairs(rewards) do
			local reward_type = data.type

			if reward_type == "item" or CosmeticUtils.is_cosmetic_item(reward_type) then
				local backend_id = data.backend_id
				local amount = data.amount
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
			elseif reward_type == "keep_decoration_painting" then
				local keep_decoration_name = data.keep_decoration_name
				local painting_data = Paintings[keep_decoration_name]
				local display_name = painting_data.display_name
				local description = painting_data.description
				local icon = painting_data.icon
				local description = {}
				local entry = {}
				description[1] = Localize(display_name)
				description[2] = Localize("achv_menu_reward_claimed_title")
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
				entry[#entry + 1] = {
					widget_type = "icon",
					value = icon
				}
				presentation_data[#presentation_data + 1] = entry
			elseif reward_type == "weapon_skin" then
				local weapon_skin_name = data.weapon_skin_name
				local weapon_skin_data = WeaponSkins.skins[weapon_skin_name]
				local rarity = weapon_skin_data.rarity or "plentiful"
				local display_name = weapon_skin_data.display_name
				local description = weapon_skin_data.description
				local icon = weapon_skin_data.inventory_icon
				local description = {}
				local entry = {}
				description[1] = Localize(display_name)
				description[2] = Localize("achv_menu_reward_claimed_title")
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
				entry[#entry + 1] = {
					widget_type = "weapon_skin",
					value = {
						icon = icon,
						rarity = rarity
					}
				}
				presentation_data[#presentation_data + 1] = entry
			elseif reward_type == "currency" then
				local fake_item = self:_get_fake_currency_item(data.currency_code, data.amount)
				local description = {}
				local _, display_name, _ = UIUtils.get_ui_information_from_item(fake_item)
				description[1] = Localize(display_name)
				description[2] = string.format(Localize("achv_menu_curreny_reward_claimed"), data.amount)
				local entry = {
					[#entry + 1] = {
						widget_type = "description",
						value = description
					},
					[#entry + 1] = {
						widget_type = "icon",
						value = fake_item.data.icon
					}
				}
				presentation_data[#presentation_data + 1] = entry
			end
		end

		self:_present_reward(presentation_data)
	else
		self:unblock_input()
	end
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

HeroViewStateAchievements._setup_achievement_entries_animations = function (self)
	local start_index = self._achievement_draw_index

	if not start_index then
		return
	end

	local achievement_widgets = self._achievement_widgets
	local end_index = math.min(start_index + ACHIEVEMENT_PRESENTATION_AMOUNT + 1, #achievement_widgets)
	local fade_in_delay = 0.05
	local global_fade_in_delay = 0
	local alpha_fade_multipler = 4

	for index, widget in ipairs(achievement_widgets) do
		local animate = start_index <= index and index <= end_index

		if animate then
			widget.alpha_multiplier = 0
			widget.alpha_fade_in_delay = global_fade_in_delay
			widget.alpha_fade_multipler = alpha_fade_multipler
			global_fade_in_delay = global_fade_in_delay + fade_in_delay
		else
			widget.alpha_multiplier = 1
		end
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

	if self._looping_summary_sounds then
		self:play_sound("Stop_gui_achivements_menu_flag_loop")
		self:play_sound("Stop_gui_achivements_menu_daily_quest_loop")

		self._looping_summary_sounds = false
	end

	Managers.input:disable_gamepad_cursor()
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
	local input_service = self._input_blocked and FAKE_INPUT_SERVICE or self:input_service()

	if self.reward_popup then
		self.reward_popup:update(dt)
		self:_handle_queued_presentations()
	end

	self:_update_summary_quest_timers(dt)
	self:draw(input_service, dt)
	self:_update_transition_timer(dt)
	self:_handle_claim_all_challenges()
	self:_handle_gamepad_activity()

	local transitioning = self.parent:transitioning()
	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		if not transitioning then
			if self:_has_active_level_vote() and not self:_displaying_reward_presentation() and not self:_is_polling() then
				local ignore_sound_on_close_menu = true

				self:close_menu(ignore_sound_on_close_menu)
			else
				self:_handle_input(dt, t)
				self:_handle_input_desc()
				self:_poll_quest_refresh(dt)
				self:_poll_rewards(dt)
				self:_poll_all_rewards(dt)
				self._quest_manager:update_quests()
			end
		end

		if wanted_state or self._new_state then
			self.parent:clear_wanted_state()

			return wanted_state or self._new_state
		end
	end

	if self._claim_all then
		self:_claim_multiple_rewards(self._claimable_challenge_widgets)

		self._claim_all = false
	end
end

HeroViewStateAchievements._has_active_level_vote = function (self)
	local voting_manager = self.voting_manager
	local is_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

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
	local summary_widgets_by_name = self._summary_widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button
	local achievement_window_button = summary_widgets_by_name.summary_right_window_button
	local quest_window_button = summary_widgets_by_name.summary_left_window_button

	UIWidgetUtils.animate_default_button(exit_button, dt)
	UIWidgetUtils.animate_option_button(quests_button, dt)
	UIWidgetUtils.animate_default_button(summary_button, dt)
	UIWidgetUtils.animate_option_button(achievements_button, dt)
	self:_animate_window_button(quest_window_button, dt)
	self:_animate_window_button(achievement_window_button, dt)

	local summary_quest_book = self._summary_widgets_by_name.summary_quest_book
	local book_disabled = summary_quest_book.content.disabled

	if not book_disabled then
		local book_progress = 0.5 + math.sin(Managers.time:time("ui") * 2) * 0.5
		local book_anim_progress = math.easeOutCubic(book_progress)
		summary_quest_book.offset[2] = book_anim_progress * 6
	else
		summary_quest_book.offset[2] = 0
	end
end

HeroViewStateAchievements._set_button_force_hover = function (self, widget, forced)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot
	hotspot.force_hover = forced
end

HeroViewStateAchievements._handle_gamepad_filter_input = function (self, dt, t)
	if not self._gamepad_filter_active then
		return false
	end

	local input_service = self:get_filter_input_service()
	local current_row = self._current_gamepad_input_selection[2]
	local current_column = self._current_gamepad_input_selection[1]
	local filter_widget = self._search_widgets_by_name.filters
	local filter_content = filter_widget.content

	if input_service:get("back") or input_service:get("refresh") then
		self:_enable_gamepad_filters(false)
	elseif input_service:get("confirm") then
		local search_definition = UISettings.achievement_search_definitions[current_row]
		local query_key = search_definition.key
		local query_value = search_definition[current_column][1]

		if filter_content.query[query_key] == query_value then
			filter_content.query[query_key] = nil
		else
			filter_content.query[query_key] = query_value
		end

		local input_content = self._search_widgets_by_name.input.content

		self:_do_search(input_content.search_query)
	else
		local search_definitions = UISettings.achievement_search_definitions
		local max_rows = #search_definitions
		local max_columns = #search_definitions[current_row]

		if input_service:get("move_down") then
			current_row = math.min(current_row + 1, max_rows)
		elseif input_service:get("move_up") then
			current_row = math.max(current_row - 1, 1)
		elseif input_service:get("move_right") then
			current_column = math.min(current_column + 1, max_columns)
		elseif input_service:get("move_left") then
			current_column = math.max(current_column - 1, 1)
		end

		if current_row ~= self._current_gamepad_input_selection[2] or current_column ~= self._current_gamepad_input_selection[1] then
			local max_columns = #search_definitions[current_row]
			current_column = math.min(current_column, max_columns)
			filter_content.gamepad_button_index = {
				current_column,
				current_row
			}
			self._current_gamepad_input_selection[2] = current_row
			self._current_gamepad_input_selection[1] = current_column
		end
	end

	return true
end

HeroViewStateAchievements._enable_gamepad_filters = function (self, enable)
	self._gamepad_filter_active = enable
	self._gamepad_filer_selection_index = 1
	local filter_widget = self._search_widgets_by_name.filters
	filter_widget.content.visible = enable

	if enable then
		self:block_input()
	else
		self:unblock_input()
	end
end

HeroViewStateAchievements._handle_input = function (self, dt, t)
	if self:_handle_gamepad_filter_input(dt, t) then
		return
	end

	local input_service = self._input_blocked and FAKE_INPUT_SERVICE or self:input_service()

	if self:_handle_search_input(dt, t, input_service) then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_pressed = input_service:get("toggle_menu")
	local input_close_pressed = gamepad_active and input_service:get("back")
	local widgets_by_name = self._widgets_by_name
	local summary_widgets_by_name = self._summary_widgets_by_name
	local achievement_widgets = self._additional_achievement_widgets_by_name
	local quest_widgets = self._additional_quest_widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local quests_button = widgets_by_name.quests_button
	local summary_button = widgets_by_name.summary_button
	local achievements_button = widgets_by_name.achievements_button
	local achievement_window_button = summary_widgets_by_name.summary_right_window_button
	local quest_window_button = summary_widgets_by_name.summary_left_window_button
	local claim_all_button = self._achievement_layout_type == "achievements" and achievement_widgets.claim_all_achievements or quest_widgets.claim_all_quests

	self:_handle_layout_buttons_hovered()

	local achievement_layout_type = self._achievement_layout_type
	local activate_gamepad_filters = gamepad_active and input_service:get("refresh")

	if activate_gamepad_filters and achievement_layout_type ~= "summary" then
		self:_enable_gamepad_filters(true)

		return
	end

	if UIUtils.is_button_hover_enter(exit_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

	if UIUtils.is_button_pressed(summary_button) then
		self:_on_layout_button_pressed(summary_button, nil, "summary")
		self:play_sound("Play_gui_achivements_menu_summary_tab")
	end

	if UIUtils.is_button_pressed(quests_button) or UIUtils.is_button_pressed(quest_window_button) then
		local tab_widget_index = nil
		local layout = self:_get_layout("quest")
		local summary_widgets_by_name = self._summary_widgets_by_name

		for index = 1, #layout.categories do
			local widget = summary_widgets_by_name["summary_quest_bar_background_" .. index]

			if UIUtils.is_button_pressed(widget) then
				tab_widget_index = index

				break
			end
		end

		self:_on_layout_button_pressed(quests_button, quest_window_button, "quest", tab_widget_index)
		self:play_sound("Play_gui_achivements_menu_quest_tab")
	end

	if UIUtils.is_button_pressed(achievements_button) or UIUtils.is_button_pressed(achievement_window_button) then
		local tab_widget_index = nil
		local achievement_outline = self._achievement_manager:outline()
		local summary_widgets_by_name = self._summary_widgets_by_name

		for index = 1, #achievement_outline.categories do
			local widget = summary_widgets_by_name["summary_achievement_bar_" .. index]

			if UIUtils.is_button_pressed(widget) then
				tab_widget_index = index

				break
			end
		end

		self:_on_layout_button_pressed(achievements_button, achievement_window_button, "achievements", tab_widget_index)
		self:play_sound("Play_gui_achivements_menu_achivements_tab")
	end

	local within_display_range = UIUtils.is_button_hover(claim_all_button, "hover_hotspot")

	if UIUtils.is_button_pressed(claim_all_button) and within_display_range then
		self._claim_all = true
	end

	UIWidgetUtils.animate_default_button(claim_all_button, dt)
	self:_animate_claim_button(claim_all_button, within_display_range, dt, t)
	self._category_scrollbar:update(dt, t, false)
	self:_update_category_scroll_position()

	for index, widget in ipairs(self._category_tab_widgets) do
		local visible = widget.content.visible

		if visible then
			UIWidgetUtils.animate_default_button(widget, dt)

			if UIUtils.is_button_hover_enter(widget) then
				self:play_sound("Play_gui_achivements_menu_hover_category")
			end

			if UIUtils.is_button_pressed(widget) then
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

		for i = 1, num_draws do
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
	local hovering_achievement_window = UIUtils.is_button_hover(achievement_window)
	local achievement_widgets = self._achievement_widgets
	local achievement_draw_index = self._achievement_draw_index

	if achievement_widgets and achievement_draw_index then
		self:_update_mouse_scroll_input()

		if hovering_achievement_window then
			local start_index = achievement_draw_index
			local end_index = math.min(achievement_draw_index + ACHIEVEMENT_PRESENTATION_AMOUNT + 1, #achievement_widgets)

			for i = start_index, end_index do
				local widget = achievement_widgets[i]

				if UIUtils.is_button_hover_enter(widget) then
					self:play_sound("Play_gui_achivements_menu_hover_item")
				end

				if UIUtils.is_button_hover(widget) then
					widget.content.reward_button_hotspot.draw = true
					local dlc_lock_hotspot = widget.content.dlc_lock_hotspot

					if dlc_lock_hotspot then
						dlc_lock_hotspot.draw = true
					end
				end

				if UIUtils.is_button_pressed(widget) then
					self:_on_achievement_pressed(widget)
				end

				local dlc_lock_hotspot = widget.content.dlc_lock_hotspot

				if dlc_lock_hotspot and dlc_lock_hotspot.on_release and widget.content.dlc_name then
					dlc_lock_hotspot.on_release = false

					Managers.unlock:open_dlc_page(widget.content.dlc_name)
				end
			end
		end
	end

	if input_pressed or UIUtils.is_button_pressed(exit_button) or input_close_pressed then
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

	self:_create_entries(entries, list_type, sub_category.quest_type)

	self._active_list_index = list_index

	if not ignore_sound then
		self:play_sound("Play_gui_achivements_menu_select_category")
	end
end

HeroViewStateAchievements._tab_pressed = function (self, widget, index, tab_list_index, ignore_sound)
	if self._active_tab and self._active_tab ~= widget then
		self:_deactivate_active_tab()
	end

	self:_activate_tab(widget, index, tab_list_index, ignore_sound)
end

HeroViewStateAchievements._activate_tab = function (self, widget, index, tab_list_index, ignore_sound)
	self._active_tab = widget
	self._active_tab_index = index

	self:_update_new_status_for_current_tab()

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

	if data then
		local quest_type = data.quest_type

		if quest_type == "daily" then
			self._timer_title = Localize("achv_menu_summary_quest_refresh")
			self._active_quest_tab_timer_type = "daily"
		elseif quest_type == "weekly" then
			self._timer_title = Localize("achv_menu_summary_quest_refresh")
			self._active_quest_tab_timer_type = "weekly"
		elseif quest_type == "event" then
			self._timer_title = Localize("join_popup_timer_title") .. ":"
			self._active_quest_tab_timer_type = "event"
		end
	end

	if entries then
		local list_type = data.type
		self._active_list_index = nil

		self:_create_entries(entries, list_type, data.quest_type)

		content.active = false
		content.list_content.active = false
	else
		self:_show_empty_entries_warning()

		self._achievement_widgets = nil
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
			local list_index = tab_list_index or 1

			self:_on_tab_list_pressed(list_index, true)
		end
	elseif not ignore_sound then
		self:play_sound("Play_gui_achivements_menu_select_category")
	end

	self:_update_categories_scroll_height()
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

	self:_update_categories_scroll_height()
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
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.draw_all_widgets(ui_renderer, self._search_widgets)

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if self:_is_polling() then
		for _, widget in ipairs(self._overlay_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	if self._draw_summary then
		for _, widget in ipairs(self._summary_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	elseif self._additional_type_widgets then
		for _, widget in ipairs(self._additional_type_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	local achievement_widgets = self._achievement_widgets
	local achievement_draw_index = self._achievement_draw_index

	if achievement_widgets and achievement_draw_index then
		local start_index = achievement_draw_index
		local end_index = math.min(achievement_draw_index + ACHIEVEMENT_PRESENTATION_AMOUNT + 1, #achievement_widgets)

		for i = start_index, end_index do
			local widget = achievement_widgets[i]

			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			local alpha_multiplier = widget.alpha_multiplier
			local alpha_fade_in_delay = widget.alpha_fade_in_delay

			if alpha_fade_in_delay then
				alpha_fade_in_delay = math.max(alpha_fade_in_delay - dt, 0)

				if alpha_fade_in_delay > 0 then
					widget.alpha_fade_in_delay = alpha_fade_in_delay
				else
					widget.alpha_fade_in_delay = nil
				end

				render_settings.alpha_multiplier = 0
			elseif alpha_multiplier then
				local alpha_fade_multipler = widget.alpha_fade_multipler or 1
				alpha_multiplier = math.min(alpha_multiplier + dt * alpha_fade_multipler, 1)
				render_settings.alpha_multiplier = math.easeInCubic(alpha_multiplier)
				widget.alpha_multiplier = alpha_multiplier
				widget.offset[1] = -40 * (1 - alpha_multiplier)
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	for _, widget in ipairs(self._category_tab_widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		local alpha_multiplier = widget.alpha_multiplier
		local alpha_fade_in_delay = widget.alpha_fade_in_delay

		if alpha_fade_in_delay then
			alpha_fade_in_delay = math.max(alpha_fade_in_delay - dt, 0)

			if alpha_fade_in_delay > 0 then
				widget.alpha_fade_in_delay = alpha_fade_in_delay
			else
				widget.alpha_fade_in_delay = nil
			end

			render_settings.alpha_multiplier = 0
		elseif alpha_multiplier then
			local alpha_fade_multipler = widget.alpha_fade_multipler or 1
			alpha_multiplier = math.min(alpha_multiplier + dt * alpha_fade_multipler, 1)
			render_settings.alpha_multiplier = math.easeInCubic(alpha_multiplier)
			widget.alpha_multiplier = alpha_multiplier
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)
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
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", enabled and 1 or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", enabled and 0.75 or 0)
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

HeroViewStateAchievements._set_summary_achievement_categories_progress = function (self, progress_data)
	local summary_widgets_by_name = self._summary_widgets_by_name
	local name = "summary_achievement_bar_"

	for index, data in ipairs(progress_data) do
		local display_name = data.display_name
		local amount = data.amount
		local amount_claimed = data.amount_claimed
		local progress = amount_claimed / amount
		local value_text = tostring(amount_claimed) .. "/" .. tostring(amount)
		local title_text = Localize(display_name)
		local widget_name = name .. tostring(index)
		local widget = summary_widgets_by_name[widget_name]
		local content = widget.content
		local style = widget.style
		content.title_text = title_text
		content.value_text = value_text
		content.has_star = data.has_unclaimed
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
	if self:_is_reward_presentation_complete() or #self._reward_presentation_queue == 0 and not self:_displaying_reward_presentation() then
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

HeroViewStateAchievements._setup_quest_summary_progress = function (self)
	local layout_type = "quest"
	local layout = self:_get_layout(layout_type)
	local categories = layout.categories
	local quest_manager = self._quest_manager
	local can_refresh_quest = quest_manager:can_refresh_daily_quest()
	local unlock_manager = Managers.unlock
	local summary_widgets_by_name = self._summary_widgets_by_name
	local widget_prefix_bar = "summary_quest_bar_"
	local widget_prefix_title = "summary_quest_bar_title_"
	local widget_prefix_timer = "summary_quest_bar_timer_"
	local alpha = 255
	local default_title_color = Colors.get_color_table_with_alpha("font_title", 255)
	local disabled_title_color = {
		255,
		80,
		80,
		80
	}
	local any_available_quests = false

	for category_index, category in ipairs(categories) do
		local name = category.name
		local entries = category.entries
		local quest_type = category.quest_type
		local max_entry_amount = category.max_entry_amount or 1

		if category.max_dlc_entries then
			for dlc, extra in pairs(category.max_dlc_entries) do
				if unlock_manager:is_dlc_unlocked(dlc) then
					max_entry_amount = max_entry_amount + extra
				end
			end
		end

		local has_entries = entries ~= nil
		local timer_active = true

		if quest_type == "event" then
			max_entry_amount = has_entries and #entries or 0
			timer_active = has_entries
		end

		local timer_widget_name = widget_prefix_timer .. tostring(category_index)
		local timer_widget = summary_widgets_by_name[timer_widget_name]
		local timer_text_color = timer_widget.style.text.text_color

		Colors.copy_to(timer_text_color, timer_active and default_title_color or disabled_title_color)

		local title_widget_name = widget_prefix_title .. tostring(category_index)
		local title_widget = summary_widgets_by_name[title_widget_name]
		title_widget.content.text = Localize(name)
		local title_text_color = title_widget.style.text.text_color

		Colors.copy_to(title_text_color, has_entries and default_title_color or disabled_title_color)

		local bar_widget_name = widget_prefix_bar .. tostring(category_index)
		local bar_widget = summary_widgets_by_name[bar_widget_name]
		local bar_style = bar_widget.style
		local bar_content = bar_widget.content
		local refresh_icon_color = bar_style.refresh_icon.color
		bar_content.slot = quest_type == "event" and "achievement_symbol_book_event_skull" or "achievement_symbol_book"
		local draw_refresh_icon = quest_type == "daily" and can_refresh_quest and has_entries
		refresh_icon_color[1] = draw_refresh_icon and alpha or 0
		local locked_count = 0
		local available_count = 0
		local completed_count = 0

		for index = 1, max_entry_amount do
			local quest_id = has_entries and entries[index]
			local data = quest_id and quest_manager:get_data_by_id(quest_id)
			local locked = not data
			local claimed = data and data.claimed
			local completed = data and data.completed
			local required_dlc = data and data.required_dlc

			if required_dlc then
				locked = not unlock_manager:is_dlc_unlocked(required_dlc)
			end

			if locked then
				locked_count = locked_count + 1
			elseif completed then
				completed_count = completed_count + 1
				any_available_quests = true
			else
				available_count = available_count + 1
				any_available_quests = true
			end
		end

		bar_content.cooldown_lock = quest_type == "daily"
		bar_content.locked_text = "x" .. locked_count
		bar_content.available_text = "x" .. available_count
		bar_content.completed_text = "x" .. completed_count
		bar_content.has_locked = locked_count > 0
		bar_content.has_available = available_count > 0
		bar_content.has_completed = completed_count > 0
	end

	local summary_quest_book = summary_widgets_by_name.summary_quest_book
	summary_quest_book.content.disabled = not any_available_quests
end

HeroViewStateAchievements._animate_window_button = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local has_focus = content.has_focus
	local is_hover = hotspot.is_hover or has_focus
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
	style.hover_frame.color[1] = hover_alpha
	local scenegraph_id = widget.scenegraph_id
	local background_uvs = content.background.uvs

	self:_set_uvs_scale_progress(scenegraph_id, background_uvs, combined_progress)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

HeroViewStateAchievements._set_uvs_scale_progress = function (self, scenegraph_id, uvs, progress)
	local scenegraph_size = self.ui_scenegraph[scenegraph_id].size
	local pixel_zoom = 10
	local width_zoom_fraction = pixel_zoom / scenegraph_size[1] * progress
	local height_zoom_fraction = pixel_zoom / scenegraph_size[2] * progress
	uvs[1][1] = height_zoom_fraction
	uvs[1][2] = width_zoom_fraction
	uvs[2][1] = 1 - height_zoom_fraction
	uvs[2][2] = 1 - width_zoom_fraction
end

HeroViewStateAchievements._handle_input_desc = function (self)
	local query = self._search_widgets_by_name.filters.content.query
	local input_desc = nil

	if self._achievement_layout_type ~= "summary" then
		if self._gamepad_filter_active then
			-- Nothing
		elseif not table.is_empty(query) then
			input_desc = "filter_available"
		else
			input_desc = "filter_unavailable"
		end
	end

	if input_desc ~= self._current_input_desc then
		self.menu_input_description:set_input_description(generic_input_actions[input_desc])

		self._current_input_desc = input_desc
	end
end

HeroViewStateAchievements._handle_search_input = function (self, dt, t, input_service)
	local input_content = self._search_widgets_by_name.input.content
	local filters_content = self._search_widgets_by_name.filters.content

	if input_content.clear_hotspot.on_pressed then
		input_content.text_index = 1
		input_content.caret_index = 1
		input_content.search_query = ""
	end

	if filters_content.query_dirty then
		self:_do_search(input_content.search_query)

		filters_content.query_dirty = false
	end

	local do_toggle = input_content.search_filters_hotspot.on_pressed

	if filters_content.visible and (input_service:get("toggle_menu", true) or input_service:get("back", true)) then
		do_toggle = true
	end

	if do_toggle then
		local filters_active = not filters_content.visible
		filters_content.visible = filters_active
		input_content.filters_active = filters_active

		return false
	end

	if input_service:get("special_1") and self._achievement_layout_type ~= "summary" and not table.is_empty(filters_content.query) then
		table.clear(filters_content.query)
		self:_do_search(input_content.search_query)
	end

	if not self._keyboard_id then
		input_content.input_active = false

		if input_content.hotspot.on_pressed then
			input_content.input_active = true

			if IS_WINDOWS then
				self:_set_input_blocked(true)

				self._keyboard_id = true
			elseif IS_XB1 then
				local title = Localize("lb_search")

				XboxInterface.show_virtual_keyboard(self._search_query, title)

				self._keyboard_id = true
			elseif IS_PS4 then
				local user_id = Managers.account:user_id()
				local title = Localize("lb_search")
				local position = definitions.virtual_keyboard_anchor_point
				self._keyboard_id = Managers.system_dialog:open_virtual_keyboard(user_id, title, self._search_query, position)
			end

			return true
		end

		return filters_content.visible
	end

	Managers.chat:block_chat_input_for_one_frame()

	if IS_WINDOWS then
		local keystrokes = Keyboard.keystrokes()
		input_content.search_query, input_content.caret_index = KeystrokeHelper.parse_strokes(input_content.search_query, input_content.caret_index, "insert", keystrokes)

		if input_service:get("execute_chat_input", true) then
			self:_do_search(input_content.search_query)
			self:_set_input_blocked(false)

			input_content.input_active = false
			self._keyboard_id = nil
		elseif input_service:get("toggle_menu", true) or self._achievement_layout_type == "summary" then
			self:_set_input_blocked(false)

			input_content.input_active = false
			self._keyboard_id = nil
		end
	elseif IS_XB1 then
		if not XboxInterface.interface_active() then
			local search_query = XboxInterface.get_keyboard_result()
			input_content.caret_index = #search_query

			self:_do_search(search_query)

			self._keyboard_id = nil
		end
	elseif IS_PS4 then
		local done, success, search_query = Managers.system_dialog:poll_virtual_keyboard(self._keyboard_id)

		if done then
			if success then
				input_content.caret_index = #search_query

				self:_do_search(search_query)
			end

			self._keyboard_id = nil
		end
	end

	if input_content.hotspot.on_pressed then
		return true
	end

	return filters_content.visible
end

HeroViewStateAchievements._do_search = function (self, search_query)
	self._search_query = search_query
	self._search_widgets_by_name.input.content.search_query = search_query
	local layout_type = self._achievement_layout_type
	local layout = self:_get_layout(layout_type)
	local entries = {}

	for _, category in pairs(layout.categories) do
		if category.entries then
			table.append(entries, category.entries)
		end

		if category.categories then
			for _, sub_category in pairs(category.categories) do
				table.append(entries, sub_category.entries)
			end
		end
	end

	self:_create_entries(entries, layout_type, nil)
	self:play_sound("Play_hud_select")
end

HeroViewStateAchievements._set_input_blocked = function (self, blocked)
	local input_manager = Managers.input

	if blocked then
		input_manager:block_device_except_service("hero_view", "keyboard", 1, "search")
		input_manager:block_device_except_service("hero_view", "mouse", 1, "search")
		input_manager:block_device_except_service("hero_view", "gamepad", 1, "search")
	else
		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
		input_manager:block_device_except_service("hero_view", "keyboard", 1)
		input_manager:block_device_except_service("hero_view", "mouse", 1)
		input_manager:block_device_except_service("hero_view", "gamepad", 1)
	end

	self.parent:set_input_blocked(blocked)
end

HeroViewStateAchievements._handle_claim_all_challenges = function (self)
	local achievement_layout_type = self._achievement_layout_type
	local active_tab_index = self._active_tab_index
	local active_list_index = self._active_list_index
	local layout = self:_get_layout(achievement_layout_type)
	local achievement_widgets = self._additional_achievement_widgets_by_name
	local quest_widgets = self._additional_quest_widgets_by_name
	local claim_all_button = achievement_layout_type == "achievements" and achievement_widgets.claim_all_achievements or quest_widgets.claim_all_quests
	local active_tab = self._active_tab

	if not active_tab then
		return
	end

	local categories = layout.categories

	if not categories then
		return
	end

	local category = categories[active_tab_index]

	if not category then
		return
	end

	local sub_categories = category.categories
	local sub_category = sub_categories and sub_categories[active_list_index]
	local has_unclaimed_challenges = false

	if sub_category and active_list_index then
		has_unclaimed_challenges = self:_has_any_unclaimed_completed_challenge_in_category(sub_category)
	else
		has_unclaimed_challenges = self:_has_any_unclaimed_completed_challenge_in_category(category)
	end

	local has_claimable_widgets = self._claimable_challenge_widgets and #self._claimable_challenge_widgets > 0 and true or false

	if has_claimable_widgets and (has_unclaimed_challenges or self._has_claimable_filtered_challenges) and not script_data["eac-untrusted"] and not self:_is_polling() then
		claim_all_button.content.visible = true
	else
		claim_all_button.content.visible = false
	end
end

HeroViewStateAchievements._animate_claim_button = function (self, widget, within_display_range, dt, t)
	local visible = widget.content.visible

	if not visible then
		return
	end

	local offset = widget.offset
	local style = widget.style
	local cooldown_duration = 2
	local should_glow = offset[2] < 0 and not within_display_range and true or false

	if offset[2] < 10 and within_display_range then
		self._button_hide_cooldown = nil
		local increment = 200 * dt

		if offset[2] < 10 then
			offset[2] = offset[2] + increment
		end
	end

	if not within_display_range then
		if not self._button_hide_cooldown then
			self._button_hide_cooldown = t
		end

		local increment = 200 * dt

		if offset[2] < -20 then
			self._button_hide_cooldown = nil
		elseif t >= self._button_hide_cooldown + cooldown_duration then
			offset[2] = offset[2] - increment
		end
	end

	if should_glow then
		style.button_glow.color[1] = 195 + 60 * math.sin(7.5 * Managers.time:time("ui"))
	end
end

HeroViewStateAchievements._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._gamepad_active_last_frame ~= gamepad_active then
		self:_enable_gamepad_filters(false)

		local filter_widget = self._search_widgets_by_name.filters
		local filter_content = filter_widget.content
		filter_widget.scenegraph_id = gamepad_active and "gamepad_search_filters" or "search_filters"
	end

	self._gamepad_active_last_frame = gamepad_active
end
