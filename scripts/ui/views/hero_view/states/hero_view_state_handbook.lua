-- chunkname: @scripts/ui/views/hero_view/states/hero_view_state_handbook.lua

require("scripts/ui/helpers/handbook_logic")
require("scripts/settings/handbook_settings")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_handbook_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local achievement_window_size = definitions.achievement_window_size
local category_tab_info = definitions.category_tab_info
local generic_input_actions = definitions.generic_input_actions
local console_cursor_definition = definitions.console_cursor_definition
local ACHIEVEMENT_WINDOW_HEIGHT = achievement_window_size[2]

HeroViewStateHandbook = class(HeroViewStateHandbook)
HeroViewStateHandbook.NAME = "HeroViewStateHandbook"

HeroViewStateHandbook.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateHandbook")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = false,
	}
	self._voting_manager = ingame_ui_context.voting_manager
	SaveData.seen_handbook_pages = SaveData.seen_handbook_pages or {}

	local input_service = self:input_service()

	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self._ui_top_renderer, input_service, 5, 100, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)

	self._current_page = 1
	self._total_pages = 1

	self:play_sound("Play_gui_handbook_open")
	Managers.input:enable_gamepad_cursor()
	self:_create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end
end

HeroViewStateHandbook.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateHandbook")
	self._handbook_logic:delete()
	Managers.input:disable_gamepad_cursor()
end

HeroViewStateHandbook._create_ui_elements = function (self)
	local num_categories = #HandbookSettings.outline
	local category_tab_widget_definitions = definitions.create_category_tab_widgets_func(num_categories)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._console_cursor_widget = UIWidget.init(console_cursor_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._category_tab_widgets = UIUtils.create_widgets(category_tab_widget_definitions)

	for _, widget in pairs(self._category_tab_widgets) do
		self:_reset_tab(widget)
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._category_scrollbar = ScrollBarLogic:new(self._widgets_by_name.category_scrollbar)

	local blueprint_context = {
		scenegraph_id = "achievement_root",
		ui_renderer = self._ui_renderer,
		world = self._ingame_ui_context.world,
	}

	self._handbook_logic = HandbookLogic:new(blueprint_context, definitions.content_blueprints)

	self:_setup_layout()

	self._widgets_by_name.achievement_scrollbar.content.visible = true
	self._widgets_by_name.category_scrollbar.content.visible = true

	self:_update_categories_scroll_height(0)

	local tab_widget = self._category_tab_widgets[1]

	self:_activate_tab(tab_widget, 1, 1, true)
end

HeroViewStateHandbook._reset_tabs = function (self)
	for _, widget in ipairs(self._category_tab_widgets) do
		self:_reset_tab(widget)
	end
end

HeroViewStateHandbook._setup_layout = function (self)
	local category_tab_widgets = self._category_tab_widgets
	local num_tab_widgets = #category_tab_widgets
	local outline = HandbookSettings.outline

	for i = 1, num_tab_widgets do
		local widget = category_tab_widgets[i]

		self:_reset_tab(widget)

		local category = outline[i]

		if category then
			self:_setup_tab_widget(widget, category)
		end
	end
end

HeroViewStateHandbook._setup_tab_widget = function (self, widget, category)
	local children = category.children
	local content = widget.content

	content.title_text = Localize(category.display_name)
	content.children = category.children
	content.new = false

	if children then
		local list_content = content.list_content
		local tab_list_entry_size = category_tab_info.tab_list_entry_size
		local num_children = #children
		local tabs_height = tab_list_entry_size[2] * num_children

		content.tabs_height = tabs_height

		for i = 1, num_children do
			local pages = children[i]
			local first_page = pages[1]
			local page_settings = HandbookSettings.pages[first_page]
			local new = not SaveData.seen_handbook_pages[first_page]

			if new then
				content.new = true
			end

			local entry_content = list_content[i]

			entry_content.text = Localize(page_settings.display_name)
			entry_content.new = new
			entry_content.pages = pages
		end

		local list_style = widget.style.list_style

		list_style.num_draws = num_children
	end

	widget.content.visible = true
end

HeroViewStateHandbook._reset_tab = function (self, widget)
	local content = widget.content
	local list_style = widget.style.list_style

	content.active = false
	content.list_content.active = false
	content.button_hotspot.is_selected = false
	content.visible = false
	content.new = false
	list_style.num_draws = 0

	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self._ui_scenegraph[list_scenegraph_id]

	list_scenegraph.size[2] = 0
	widget.alpha_multiplier = 0
	widget.alpha_fade_in_delay = nil
	widget.alpha_fade_multipler = 5
end

HeroViewStateHandbook._update_categories_scroll_height = function (self, optional_scroll_value)
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
	end
end

HeroViewStateHandbook._get_category_entries_height = function (self)
	local num_tabs = #self._category_tab_widgets
	local tab_size = category_tab_info.tab_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_height = math.max(tab_size[2] * num_tabs + tab_list_entry_spacing * (num_tabs - 1), 0)

	return tab_height + self:_get_active_tabs_height()
end

HeroViewStateHandbook._get_active_tabs_height = function (self)
	local active_tab = self._active_tab
	local num_sub_tabs = active_tab and active_tab.style.list_style.num_draws or 0
	local tab_list_entry_size = category_tab_info.tab_list_entry_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_list_height = math.max(tab_list_entry_size[2] * num_sub_tabs + tab_list_entry_spacing * (num_sub_tabs - 1), 0)

	return tab_list_height
end

HeroViewStateHandbook._get_active_category_height = function (self)
	local active_tab = self._active_tab_index or 1
	local num_tabs = active_tab - 1
	local tab_size = category_tab_info.tab_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tab_start_height = math.max(tab_size[2] * num_tabs + tab_list_entry_spacing * (num_tabs - 1), 0)
	local tab_list_height = self:_get_active_tabs_height()

	return tab_start_height, tab_size[2] + tab_list_entry_spacing + tab_list_height
end

HeroViewStateHandbook._setup_scrollbar = function (self, height, optional_value)
	local widget = self._widgets_by_name.achievement_scrollbar
	local scenegraph_id = widget.scenegraph_id
	local scrollbar_size_y = self._ui_scenegraph[scenegraph_id].size[2]
	local percentage = math.min(scrollbar_size_y / height, 1)

	widget.content.scroll_bar_info.bar_height_percentage = percentage

	self:_set_scrollbar_value(optional_value or 0)

	local scroll_step_multiplier = 2
	local scroll_amount = math.max(110 / self._total_scroll_height, 0) * scroll_step_multiplier

	self._widgets_by_name.achievement_window.content.scroll_amount = scroll_amount
end

HeroViewStateHandbook._update_mouse_scroll_input = function (self)
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
		local current_scroll_value = self._scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self:_set_scrollbar_value(mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self:_set_scrollbar_value(scroll_bar_value)
		end
	end
end

HeroViewStateHandbook._set_scrollbar_value = function (self, value)
	if value then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.achievement_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info

		widget_scroll_bar_info.value = value
		widgets_by_name.achievement_window.content.scroll_value = value

		local total_scroll_height = self._total_scroll_height
		local height_scrolled = total_scroll_height * value

		self._ui_scenegraph.achievement_root.position[2] = math.floor(height_scrolled)
		self._scroll_value = value
	end
end

HeroViewStateHandbook._update_achievement_read_index = function (self, fraction)
	return
end

HeroViewStateHandbook._update_category_scroll_position = function (self)
	local scrollbar_logic = self._category_scrollbar
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._category_scrolled_length then
		self._ui_scenegraph.category_root.local_position[2] = math.round(length)
		self._category_scrolled_length = length
	end
end

HeroViewStateHandbook._setup_achievement_entries_animations = function (self)
	local fade_in_delay = 0.05
	local global_fade_in_delay = 0
	local alpha_fade_multipler = 4
	local achievement_widgets = self._achievement_widgets

	for _, widget in ipairs(achievement_widgets) do
		widget.alpha_multiplier = 0
		widget.alpha_fade_in_delay = global_fade_in_delay
		widget.alpha_fade_multipler = alpha_fade_multipler
		global_fade_in_delay = global_fade_in_delay + fade_in_delay
	end
end

HeroViewStateHandbook.transitioning = function (self)
	return not not self._exiting
end

HeroViewStateHandbook._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

HeroViewStateHandbook.input_service = function (self)
	return self.parent:input_service()
end

HeroViewStateHandbook.update = function (self, dt, t)
	local input_service = self._input_blocked and FAKE_INPUT_SERVICE or self:input_service()
	local is_gamepad_active = Managers.input:is_device_active("gamepad")

	self._ui_animator:update(dt)

	local widgets_by_name = self._widgets_by_name
	local exit_button = widgets_by_name.exit_button

	UIWidgetUtils.animate_default_button(exit_button, dt)

	local parent = self.parent
	local transitioning = parent:transitioning()
	local wanted_state = parent:wanted_state()

	if not self._transition_timer then
		if not transitioning then
			if self:_has_active_level_vote() then
				local ignore_sound_on_close_menu = true

				self:close_menu(ignore_sound_on_close_menu)
			else
				self:_handle_input(input_service, is_gamepad_active, dt, t)
			end
		end

		local has_state = wanted_state or self._new_state

		if has_state then
			parent:clear_wanted_state()

			return has_state
		end
	end

	if self._exiting then
		return
	end

	self:draw(input_service, is_gamepad_active, dt)
end

HeroViewStateHandbook._has_active_level_vote = function (self)
	local voting_manager = self._voting_manager
	local is_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

HeroViewStateHandbook._handle_input = function (self, input_service, is_gamepad_active, dt, t)
	local widgets_by_name = self._widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local input_pressed = input_service:get("toggle_menu")
	local input_close_pressed = is_gamepad_active and input_service:get("back")

	if input_pressed or UIUtils.is_button_pressed(exit_button) or input_close_pressed then
		self:play_sound("Play_hud_hover")
		self:close_menu()

		self._exiting = true

		return
	end

	if UIUtils.is_button_hover_enter(exit_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

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

				self:_on_tab_list_pressed(i, content, content.pages)
			end

			hotspot.is_selected = active_list_index == i
		end
	end

	local achievement_widgets = self._achievement_widgets

	if achievement_widgets then
		self:_update_mouse_scroll_input()
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	self:_set_gamepad_input_buttons_visibility(is_gamepad_active)
	UIWidgetUtils.animate_arrow_button(page_button_next, dt)
	UIWidgetUtils.animate_arrow_button(page_button_previous, dt)

	if UIUtils.is_button_hover_enter(page_button_next) or UIUtils.is_button_hover_enter(page_button_previous) then
		self:play_sound("play_gui_inventory_next_hover")
	end

	if UIUtils.is_button_pressed(page_button_next) or input_service:get("cycle_next") then
		local next_page_index = self._current_page + 1

		if next_page_index <= self._total_pages then
			self:_go_to_page(next_page_index)
			self:play_sound("play_gui_cosmetics_inventory_next_click")
		end
	elseif UIUtils.is_button_pressed(page_button_previous) or input_service:get("cycle_previous") then
		local next_page_index = self._current_page - 1

		if next_page_index >= 1 then
			self:_go_to_page(next_page_index)
			self:play_sound("play_gui_cosmetics_inventory_next_click")
		end
	end
end

HeroViewStateHandbook._go_to_page = function (self, page_index)
	local page_name = self._active_pages[page_index]
	local page_settings = HandbookSettings.pages[page_name]

	if not page_settings then
		return
	end

	local entry_widgets, total_height = self._handbook_logic:create_entry_widgets(page_settings)

	total_height = total_height + 150
	self._achievement_widgets = entry_widgets
	self._total_scroll_height = math.max(total_height - ACHIEVEMENT_WINDOW_HEIGHT, 0)
	self._scroll_value = nil

	self:_setup_scrollbar(total_height)
	self:_setup_achievement_entries_animations()

	self._current_page = page_index

	self:_update_page_info()
end

HeroViewStateHandbook._on_tab_list_pressed = function (self, list_index, content, pages, ignore_sound)
	if list_index == self._active_list_index then
		return
	end

	self._active_pages = pages
	self._active_list_index = list_index
	self._total_pages = #pages

	self:_go_to_page(1)

	if content.new then
		content.new = false

		local page1 = pages[1]

		SaveData.seen_handbook_pages[page1] = true

		local any_new = false

		for _, entry in ipairs(content.parent.list_content) do
			if entry.new then
				any_new = true

				break
			end
		end

		content.parent.new = any_new
	end

	if not ignore_sound then
		self:play_sound("Play_gui_handbook_click")
	end
end

HeroViewStateHandbook._tab_pressed = function (self, widget, index, tab_list_index, ignore_sound)
	local was_active = self._active_tab == widget

	self:_deactivate_active_tab()

	if not was_active then
		self:_activate_tab(widget, index, tab_list_index, ignore_sound)
	end
end

HeroViewStateHandbook._activate_tab = function (self, widget, index, tab_list_index, ignore_sound)
	self._active_tab = widget
	self._active_tab_index = index

	local content = widget.content
	local style = widget.style
	local list_style = style.list_style
	local num_draws = list_style.num_draws
	local list_scenegraph_id = list_style.scenegraph_id
	local list_scenegraph = self._ui_scenegraph[list_scenegraph_id]
	local tab_active_size = category_tab_info.tab_active_size
	local tab_list_entry_size = category_tab_info.tab_list_entry_size
	local tab_list_entry_spacing = category_tab_info.tab_list_entry_spacing
	local tabs_height = math.max(tab_list_entry_size[2] * num_draws + tab_list_entry_spacing * (num_draws - 1), 0)

	list_scenegraph.size[1] = tab_active_size[1]
	list_scenegraph.size[2] = tabs_height
	content.button_hotspot.is_selected = true
	content.active = true
	content.list_content.active = true
	self._active_list_index = nil
	tab_list_index = tab_list_index or 1

	if tab_list_index then
		local pages = content.children[tab_list_index]
		local entry_content = content.list_content[tab_list_index]

		entry_content.parent = content

		self:_on_tab_list_pressed(tab_list_index, entry_content, pages, true)

		if not ignore_sound then
			self:play_sound("Play_gui_achivements_menu_select_category")
		end
	else
		self._active_list_index = nil

		if not ignore_sound then
			self:play_sound("Play_gui_achivements_menu_expand_category")
		end
	end

	self:_update_categories_scroll_height()
end

HeroViewStateHandbook._deactivate_active_tab = function (self)
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
	local list_scenegraph = self._ui_scenegraph[list_scenegraph_id]
	local tab_size = category_tab_info.tab_size

	list_scenegraph.size[1] = tab_size[1]
	list_scenegraph.size[2] = 0
	content.active = false
	content.list_content.active = false
	content.button_hotspot.is_selected = false
end

HeroViewStateHandbook.close_menu = function (self, ignore_sound_on_close_menu)
	if not ignore_sound_on_close_menu then
		self:play_sound("Play_gui_achivements_menu_close")
	end

	ignore_sound_on_close_menu = true

	local no_fade = true

	self.parent:close_menu(nil, ignore_sound_on_close_menu, no_fade)
end

HeroViewStateHandbook._update_page_info = function (self)
	local widgets_by_name = self._widgets_by_name
	local current_page = self._current_page
	local total_pages = self._total_pages

	widgets_by_name.page_text_left.content.text = tostring(current_page)
	widgets_by_name.page_text_right.content.text = tostring(total_pages)
	widgets_by_name.page_button_next.content.hotspot.disable_button = current_page == total_pages
	widgets_by_name.page_button_previous.content.hotspot.disable_button = current_page == 1

	local has_pages = total_pages > 1

	widgets_by_name.page_button_next.content.visible = has_pages
	widgets_by_name.page_button_previous.content.visible = has_pages
	widgets_by_name.input_icon_next.content.visible = has_pages
	widgets_by_name.input_icon_previous.content.visible = has_pages
	widgets_by_name.input_arrow_next.content.visible = has_pages
	widgets_by_name.input_arrow_previous.content.visible = has_pages
	widgets_by_name.page_text_center.content.visible = has_pages
	widgets_by_name.page_text_left.content.visible = has_pages
	widgets_by_name.page_text_right.content.visible = has_pages
	widgets_by_name.page_text_area.content.visible = has_pages

	self._menu_input_description:set_input_description(has_pages and generic_input_actions.has_pages or nil)
end

HeroViewStateHandbook._set_gamepad_input_buttons_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local has_pages = self._total_pages > 1

	visible = visible and has_pages

	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local input_arrow_1_widget = widgets_by_name.input_arrow_next
	local input_arrow_2_widget = widgets_by_name.input_arrow_previous

	input_1_widget.content.visible = visible
	input_2_widget.content.visible = visible
	input_arrow_1_widget.content.visible = visible
	input_arrow_2_widget.content.visible = visible
end

HeroViewStateHandbook.draw = function (self, input_service, is_gamepad_active, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local base_alpha_multiplier = render_settings.alpha_multiplier or 1

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or base_alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local achievement_widgets = self._achievement_widgets

	if achievement_widgets then
		for i = 1, #achievement_widgets do
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

	render_settings.alpha_multiplier = base_alpha_multiplier

	if is_gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)
	end
end

HeroViewStateHandbook.play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateHandbook._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._ingame_ui_context.wwise_world,
		render_settings = self._render_settings,
	}
	local widgets

	self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end

HeroViewStateHandbook.block_input = function (self)
	self._input_blocked = true
end

HeroViewStateHandbook.unblock_input = function (self)
	self._input_blocked = false
end

HeroViewStateHandbook.input_blocked = function (self)
	return self._input_blocked
end
