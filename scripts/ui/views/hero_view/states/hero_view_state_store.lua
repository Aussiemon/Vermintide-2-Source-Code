require("scripts/ui/helpers/scrollbar_logic")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_store_definitions")

for name, dlc in pairs(DLCSettings) do
	local store_state_filenames = dlc.store_state_filenames

	if store_state_filenames then
		for _, filename in ipairs(store_state_filenames) do
			require(filename)
		end
	end
end

local widget_definitions = definitions.widgets
local purchase_popup_widget_definitions = definitions.purchase_popup_widgets
local purchase_confirm_widget_definitions = definitions.purchase_confirm_widgets
local list_detail_widget_definitions = definitions.list_detail_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}
local item_widget_size_by_type = {
	default = {
		260,
		220
	},
	item = {
		260,
		220
	},
	dlc = {
		800,
		220
	}
}
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
HeroViewStateStore = class(HeroViewStateStore)
HeroViewStateStore.NAME = "HeroViewStateStore"

HeroViewStateStore.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateStore")

	self._parent = params.parent
	self._gamepad_style_active = self:_setup_menu_layout()
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local is_tutorial = game_mode_key == "tutorial"
	local ingame_ui_context = params.ingame_ui_context
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.ingame_ui = ingame_ui_context.ingame_ui
	self._world_name = "store_ui_world"
	self._store_ui_world_viewport_name = "store_ui_world_viewport"
	self._store_ui_world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, 980, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.create_viewport(self._store_ui_world, self._store_ui_world_viewport_name, "overlay", 1)

	self._store_ui_renderer = self.ingame_ui:create_ui_renderer(self._store_ui_world, is_tutorial, self.is_in_inn)
	self._ingame_ui_context = ingame_ui_context
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._voting_manager = ingame_ui_context.voting_manager
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._wwise_world = params.wwise_world
	self._loaded_package_names = {}
	self._cloned_materials_by_reference = {}
	self._animations = {}
	self._ui_animations = {}

	if PLATFORM == "win32" then
		self._friends_component_ui = FriendsUIComponent:new(ingame_ui_context)
	end

	self:_create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	local window_params = {
		wwise_world = self._wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		windows_settings = self._windows_settings,
		input_service = fake_input_service,
		start_state = params.start_state,
		layout_settings = self._layout_settings
	}

	self:_initial_windows_setups(window_params)
	UISettings.hero_fullscreen_menu_on_enter()
	self:play_sound("Play_hud_store_open_menu")
	self:play_sound("Play_hud_store_ambience")
	self:_disable_player_world()
	self:_enable_store_ui_world()
end

HeroViewStateStore._setup_menu_layout = function (self)
	local use_gamepad_layout = PLATFORM == "ps4" or PLATFORM == "xb1" or Managers.input:is_device_active("gamepad") or UISettings.use_gamepad_menu_layout

	if use_gamepad_layout then
		self._layout_settings = local_require("scripts/ui/views/hero_view/states/store_window_layout")
	else
		self._layout_settings = local_require("scripts/ui/views/hero_view/states/store_window_layout")
	end

	self._windows_settings = self._layout_settings.windows
	self._window_layouts = self._layout_settings.window_layouts
	self._max_active_windows = self._layout_settings.max_active_windows

	return use_gamepad_layout
end

HeroViewStateStore.get_renderers = function (self)
	return self._store_ui_renderer, self._ui_top_renderer
end

HeroViewStateStore._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
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
	local purchase_popup_widgets = {}
	local purchase_popup_widgets_by_name = {}

	for name, widget_definition in pairs(purchase_popup_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			purchase_popup_widgets[#purchase_popup_widgets + 1] = widget
			purchase_popup_widgets_by_name[name] = widget
		end
	end

	self._purchase_popup_widgets = purchase_popup_widgets
	self._purchase_popup_widgets_by_name = purchase_popup_widgets_by_name
	local purchase_confirm_widgets = {}
	local purchase_confirm_widgets_by_name = {}

	for name, widget_definition in pairs(purchase_confirm_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			purchase_confirm_widgets[#purchase_confirm_widgets + 1] = widget
			purchase_confirm_widgets_by_name[name] = widget
		end
	end

	self._purchase_confirm_widgets = purchase_confirm_widgets
	self._purchase_confirm_widgets_by_name = purchase_confirm_widgets_by_name
	local list_detail_widgets = {}
	local list_detail_widgets_by_name = {}

	for name, widget_definition in pairs(list_detail_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			list_detail_widgets[#list_detail_widgets + 1] = widget
			list_detail_widgets_by_name[name] = widget
		end
	end

	self._list_detail_widgets = list_detail_widgets
	self._list_detail_widgets_by_name = list_detail_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._store_ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

HeroViewStateStore._disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

HeroViewStateStore._enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

HeroViewStateStore._disable_store_ui_world = function (self)
	if not self._store_ui_world_disabled then
		self._store_ui_world_disabled = true
		local world = self._store_ui_world
		local viewport_name = self._store_ui_world_viewport_name
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

HeroViewStateStore._enable_store_ui_world = function (self)
	if self._store_ui_world_disabled then
		self._store_ui_world_disabled = false
		local world = self._store_ui_world
		local viewport_name = self._store_ui_world_viewport_name
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

HeroViewStateStore.enable_ingame_overlay = function (self)
	if not self._ingame_overlay_enabled then
		self._ingame_overlay_enabled = true
		local world = Managers.world:world("level_world")

		World.set_data(world, "fullscreen_blur", 0.5)
		World.set_data(world, "greyscale", 1)
	end
end

HeroViewStateStore.disable_ingame_overlay = function (self)
	if self._ingame_overlay_enabled then
		self._ingame_overlay_enabled = false
		local world = Managers.world:world("level_world")

		World.set_data(world, "fullscreen_blur", nil)
		World.set_data(world, "greyscale", nil)
	end
end

HeroViewStateStore._initial_windows_setups = function (self, params)
	local active_windows = {}
	self._active_windows = active_windows
	self._window_params = params
	local start_state = params.start_state

	if start_state then
		self:go_to_store_path({
			start_state
		})
	else
		self:go_to_store_path({
			"featured"
		})
	end
end

HeroViewStateStore.window_input_service = function (self)
	return (self._input_blocked and fake_input_service) or self:input_service()
end

HeroViewStateStore._close_window_at_index = function (self, window_index)
	local active_windows = self._active_windows
	local params = self._window_params
	local current_window = active_windows[window_index]

	if current_window and current_window.on_exit then
		current_window:on_exit(params)
	end

	active_windows[window_index] = nil
end

HeroViewStateStore._change_window = function (self, window_index, window_name)
	local active_windows = self._active_windows
	local new_window_settings = self._windows_settings[window_name]
	local window_class_name = new_window_settings.class_name
	local always_reload = new_window_settings.always_reload
	local current_window = active_windows[window_index]

	if current_window then
		if current_window.NAME == window_class_name and not always_reload then
			return
		end

		self:_close_window_at_index(window_index)
	end

	local window_class = rawget(_G, window_class_name)
	local window = window_class:new()
	local ignore_alignment = new_window_settings.ignore_alignment
	local window_offset = nil

	if not ignore_alignment then
		local alignment_index = new_window_settings.alignment_index or window_index
		local window_default_settings = UISettings.game_start_windows
		local window_size = window_default_settings.size
		local window_spacing = window_default_settings.spacing or 10
		local window_width = window_size[1]
		local total_spacing = window_spacing * 2
		local total_windows_width = 3 * window_width
		local start_width_offset = -(total_windows_width / 2 + window_width / 2) - (total_spacing / 2 + window_spacing)
		local window_width_offset = start_width_offset + alignment_index * window_width + alignment_index * window_spacing
		window_offset = {
			window_width_offset,
			0,
			3
		}
	end

	if window.on_enter then
		local params = self._window_params

		window:on_enter(params, window_offset)
	end

	active_windows[window_index] = window
end

HeroViewStateStore.get_layout_name = function (self)
	local index = self._selected_layout_index

	for i, layout_setting in ipairs(self._window_layouts) do
		if i == index then
			return layout_setting.name
		end
	end
end

HeroViewStateStore.set_layout_by_name = function (self, name)
	for index, layout_setting in ipairs(self._window_layouts) do
		if layout_setting.name == name then
			self:set_layout(index)

			return
		end
	end
end

HeroViewStateStore.close_on_exit = function (self)
	return self._close_on_exit
end

HeroViewStateStore.set_layout = function (self, index)
	local layout_setting = self:_get_layout_setting(index)
	local windows = layout_setting.windows
	local sound_event_enter = layout_setting.sound_event_enter
	local close_on_exit = layout_setting.close_on_exit
	local input_focus_window = layout_setting.input_focus_window

	if sound_event_enter then
		self:play_sound(sound_event_enter)
	end

	self._close_on_exit = close_on_exit

	if self._selected_layout_index then
		self._previous_selected_layout_index = self._selected_layout_index
	end

	self._selected_layout_index = index

	for i = 1, self._max_active_windows, 1 do
		local window_changed = false

		for window_name, window_position_index in pairs(windows) do
			if window_position_index == i then
				self:_change_window(window_position_index, window_name)

				window_changed = true
			end
		end

		if not window_changed then
			self:_close_window_at_index(i)
		end
	end

	self:set_window_input_focus(input_focus_window)
end

HeroViewStateStore.set_window_input_focus = function (self, window_name)
	local layout_index = self._selected_layout_index
	local layout_setting = self:_get_layout_setting(layout_index)
	local window_setting = self._windows_settings[window_name]
	local window_class_name = window_setting and window_setting.class_name
	local window_found = false
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		local name = window.NAME
		local focused = name == window_class_name

		if window.set_focus then
			window:set_focus(focused)
		end

		if focused then
			window_found = true
		end
	end

	if window_name and not window_found then
		ferror("[HeroViewStateStore] - (set_window_input_focus) Could not find a window by name: %s", window_name)
	end

	self._window_focused = window_name
end

HeroViewStateStore.get_selected_layout_index = function (self)
	return self._selected_layout_index
end

HeroViewStateStore.get_previous_selected_layout_index = function (self)
	return self._previous_selected_layout_index
end

HeroViewStateStore._get_layout_setting = function (self, index)
	return self._window_layouts[index]
end

HeroViewStateStore.go_to_store_path = function (self, path_array)
	local pages = StoreLayoutConfig.pages
	local page = pages[path_array[#path_array]]
	local layout = page.layout
	local sound_event_enter = page.sound_event_enter

	if sound_event_enter then
		self:play_sound(sound_event_enter)
	end

	self._store_path_array = path_array

	self:set_layout_by_name(layout)
end

HeroViewStateStore.go_to_product = function (self, product_id, optional_path)
	local new_path = optional_path
	local dlc_settings = nil

	for _, settings in ipairs(StoreDlcSettings) do
		if settings.dlc_name == product_id then
			dlc_settings = settings

			break
		end
	end

	local current_store_path = self:get_store_path()
	local product = nil

	if dlc_settings then
		product = {
			type = "dlc",
			dlc_settings = dlc_settings,
			product_id = product_id
		}

		if not new_path then
			new_path = table.clone(current_store_path)
			new_path[#new_path + 1] = "dlc"
		end
	else
		local item = self:get_item_by_key(product_id)
		product = {
			type = "item",
			item = item,
			product_id = product_id
		}

		if not new_path then
			new_path = table.clone(current_store_path)
			new_path[#new_path + 1] = "item_details"
		end
	end

	local params = self._window_params
	params.selected_product = product

	if new_path then
		self:go_to_store_path(new_path)
	end
end

HeroViewStateStore.get_item_by_key = function (self, item_key)
	local backend_store = Managers.backend:get_interface("peddler")
	local item = backend_store:get_filtered_items("item_key == " .. item_key)

	return item[1]
end

HeroViewStateStore.get_store_path = function (self)
	return self._store_path_array
end

HeroViewStateStore._step_back_in_path = function (self)
	local store_path_array = self._store_path_array
	local num_pages = #store_path_array

	if num_pages > 1 then
		local new_path = table.clone(store_path_array)
		new_path[#new_path] = nil

		self:go_to_store_path(new_path)

		return true
	else
		return false
	end
end

HeroViewStateStore._windows_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window:update(dt, t)
	end
end

HeroViewStateStore._windows_post_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		if window.post_update then
			window:post_update(dt, t)
		end
	end
end

HeroViewStateStore.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

HeroViewStateStore._wanted_state = function (self)
	local new_state = self._parent:wanted_state()

	return new_state
end

HeroViewStateStore.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

HeroViewStateStore.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

HeroViewStateStore.requested_screen_change_by_name = function (self, state)
	self._on_close_next_state = state

	self:close_menu()
end

HeroViewStateStore.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateStore")

	self._ui_animator = nil
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui and self:is_friends_list_active() then
		friends_component_ui:deactivate_friends_ui()
	end

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	self:_close_active_windows()
	UISettings.hero_fullscreen_menu_on_exit()
	self:play_sound("Stop_hud_store_ambience")
	self:_enable_player_world()
	self:_disable_store_ui_world()
	UIRenderer.destroy(self._store_ui_renderer, self._store_ui_world)
	ScriptWorld.destroy_viewport(self._store_ui_world, self._store_ui_world_viewport_name)
	Managers.world:destroy_world(self._store_ui_world)

	self._store_ui_world = nil
	self._store_ui_renderer = nil
	self._store_ui_world_viewport_name = nil
end

HeroViewStateStore._close_active_windows = function (self)
	local active_windows = self._active_windows
	local params = self._window_params

	for _, window in pairs(active_windows) do
		if window.on_exit then
			window:on_exit(params)
		end
	end

	table.clear(active_windows)
end

HeroViewStateStore._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

HeroViewStateStore.input_service = function (self)
	return self._parent:input_service()
end

HeroViewStateStore.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	local input_manager = self._input_manager
	local input_service = self:window_input_service()
	local friends_component_ui = self._friends_component_ui
	local gamepad_active = input_manager:is_device_active("gamepad")

	if friends_component_ui and not gamepad_active and Managers.account:is_online() then
		friends_component_ui:update(dt, input_service)
	end

	self._ui_animator:update(dt)
	self:_update_animations(dt)
	self:_draw(input_service, dt)

	if self._purchase_popup_active then
		self:_draw_purchase_popup(dt)
	end

	if self._waiting_for_purchase_result then
		self:_update_confirmation_wait_presentation(dt, t)
		self:_draw_purchase_confirmation(dt)
	end

	self:_update_transition_timer(dt)
	self:_windows_update(dt, t)

	local transitioning = self._parent:transitioning()
	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		if not transitioning then
			if self:_has_active_level_vote() then
				local ignore_sound_on_close_menu = true

				self:close_menu(ignore_sound_on_close_menu)
			elseif self._purchase_popup_active then
				self:_handle_purchase_popup_input(dt, t)
			elseif not self._waiting_for_purchase_result then
				self:_handle_input(dt, t)
			end
		end

		if wanted_state then
			self._parent:clear_wanted_state()

			self._new_state = wanted_state
		else
			return self._new_state
		end
	end
end

HeroViewStateStore.is_friends_list_active = function (self)
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui then
		return friends_component_ui:is_active()
	end

	return false
end

HeroViewStateStore._handle_friend_joining = function (self)
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui then
		local join_lobby_data = friends_component_ui:join_lobby_data()

		if join_lobby_data and Managers.matchmaking:allowed_to_initiate_join_lobby() then
			Managers.matchmaking:request_join_lobby(join_lobby_data)
			self:close_menu(true)

			return true
		end
	end
end

HeroViewStateStore._has_active_level_vote = function (self)
	local voting_manager = self._voting_manager
	local active_vote_name = voting_manager:vote_in_progress()
	local is_mission_vote = active_vote_name == "game_settings_vote" or active_vote_name == "game_settings_deed_vote"

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

HeroViewStateStore.post_update = function (self, dt, t)
	self:_windows_post_update(dt, t)

	if self._new_state then
		self:_close_active_windows()
	end
end

HeroViewStateStore._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	self:_update_list_detail_animation(dt)
end

HeroViewStateStore._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

HeroViewStateStore._handle_input = function (self, dt, t)
	local input_blocked = self._input_blocked
	local window_focused = self._window_focused

	if input_blocked then
		return
	end

	if self:_handle_friend_joining() then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local input_service = self:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local close_on_exit = self._close_on_exit

	if close_on_exit and (back_pressed or input_pressed) then
		if self:_step_back_in_path() then
			self:play_sound("Play_hud_select")
		else
			self:play_sound("Play_hud_select")
			self:close_menu()

			return
		end
	elseif input_pressed or back_pressed then
		self:play_sound("Play_hud_select")

		local previous_layout_key = self:get_previous_selected_layout_index()

		if previous_layout_key then
			self:set_layout(previous_layout_key)
		end
	end
end

HeroViewStateStore._handle_purchase_popup_input = function (self, dt, t)
	if self._waiting_for_purchase_result then
		return
	end

	local widgets_by_name = self._purchase_popup_widgets_by_name
	local input_service = self:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local purchase_button = widgets_by_name.purchase_button
	local close_button = widgets_by_name.close_button

	UIWidgetUtils.animate_default_button(purchase_button, dt)
	UIWidgetUtils.animate_default_button(close_button, dt)

	if self:_is_button_hover_enter(purchase_button) or self:_is_button_hover_enter(close_button) then
		self:play_sound("Play_hud_hover")
	end

	if self:_is_button_pressed(purchase_button) then
		self:play_sound("Play_hud_store_button_buy")

		local currency_type = "SM"

		self:_purchase_item(currency_type)
	elseif self:_is_button_pressed(close_button) then
		self:play_sound("Play_hud_select")
		self:abort_item_purchase_request()
	end
end

HeroViewStateStore.close_menu = function (self, ignore_sound_on_close_menu)
	if self._on_close_next_state then
		self._parent:requested_screen_change_by_name(self._on_close_next_state)
	else
		self._parent:close_menu(nil, ignore_sound_on_close_menu)
	end
end

HeroViewStateStore._draw = function (self, input_service, dt)
	local ui_renderer = self._store_ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if self._draw_list_details then
		for _, widget in ipairs(self._list_detail_widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_top_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroViewStateStore._draw_purchase_popup = function (self, dt)
	local input_service = self:input_service()
	local ui_renderer = self._store_ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._purchase_popup_widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if self._purchase_popup_product_widget then
		UIRenderer.draw_widget(ui_top_renderer, self._purchase_popup_product_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroViewStateStore._draw_purchase_confirmation = function (self, dt)
	local input_service = self:input_service()
	local ui_renderer = self._store_ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._purchase_confirm_widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroViewStateStore._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroViewStateStore.play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroViewStateStore._start_transition_animation = function (self, key, animation_name, optional_widgets)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	}
	local widgets = optional_widgets or self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

HeroViewStateStore.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self._store_ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

HeroViewStateStore.block_input = function (self)
	self._input_blocked = true
end

HeroViewStateStore.unblock_input = function (self)
	self._input_blocked = false
end

HeroViewStateStore.input_blocked = function (self)
	return self._input_blocked
end

HeroViewStateStore.product_purchase_request = function (self, product)
	local item = product.item
	local currency_type = "SM"
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local price = current_prices[currency_type] or regular_prices[currency_type]
	local backend_store = Managers.backend:get_interface("peddler")
	local currency_amount = backend_store:get_chips(currency_type)
	local can_afford = price <= currency_amount

	if can_afford then
		self._purchase_popup_active = true
		self._product_to_purchase = product

		self:block_input()

		local scenegraph_id = "purchase_item_root"
		local masked = false
		local product_data = nil
		local widget = self:create_item_widget(product, scenegraph_id, masked)
		local content = widget.content
		local size = content.size
		widget.offset[1] = -size[1] / 2
		widget.offset[2] = size[2]
		self._purchase_popup_product_widget = widget

		self:populate_product_widget(widget, product)

		local purchase_popup_widgets_by_name = self._purchase_popup_widgets_by_name
		local _, display_name = UIUtils.get_ui_information_from_item(item)
		local item_name_text = purchase_popup_widgets_by_name.item_name_text
		item_name_text.content.text = Localize(display_name)
		local purchase_button = purchase_popup_widgets_by_name.purchase_button

		self:_set_currency_button_price(purchase_button, item, currency_type)
	end
end

HeroViewStateStore._set_currency_button_price = function (self, widget, item, currency_type)
	local backend_store = Managers.backend:get_interface("peddler")
	local currency_amount = backend_store:get_chips(currency_type)
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local price = current_prices[currency_type] or regular_prices[currency_type]
	local final_balance = currency_amount - price
	local content = widget.content
	local style = widget.style
	content.current_value = tostring(currency_amount)
	content.cost_value = tostring(price * -1)
	content.balance_value = tostring(final_balance)
	local balance_value_style = style.balance_value
	local default_text_color = balance_value_style.default_text_color
	local insufficient_text_color = balance_value_style.insufficient_text_color
	local text_color = (final_balance < 0 and insufficient_text_color) or default_text_color
	balance_value_style.text_color = text_color
end

HeroViewStateStore.abort_item_purchase_request = function (self)
	self:destroy_product_widget(self._purchase_popup_product_widget, self._product_to_purchase)

	self._purchase_popup_product_widget = nil
	self._purchase_popup_active = nil
	self._product_to_purchase = nil

	self:unblock_input()
end

HeroViewStateStore._purchase_item = function (self, currency_type)
	local product = self._product_to_purchase
	local item = product.item
	local item_key = item.key
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local price = current_prices[currency_type] or regular_prices[currency_type]
	local expected_amount = price
	local callback = callback(self, "_purchase_item_result_callback")
	local store_interface = Managers.backend:get_interface("peddler")

	store_interface:exchange_chips(item_key, currency_type, expected_amount, callback)

	self._waiting_for_purchase_result = true
	self._purchase_popup_active = nil
	local purchase_confirm_widgets_by_name = self._purchase_confirm_widgets_by_name
	purchase_confirm_widgets_by_name.loading_icon.content.fade_out = true
	local approved_widget = purchase_confirm_widgets_by_name.approved
	local declined_widget = purchase_confirm_widgets_by_name.declined
	approved_widget.content.visible = false
	declined_widget.style.texture_id.gradient_threshold = 0
end

HeroViewStateStore.products_version_id = function (self)
	return self._products_version_id or 0
end

HeroViewStateStore._purchase_item_result_callback = function (self, result, items)
	self._purchase_confirmation_anim_duration = 0
	local anim_name = "approved"

	self:_start_transition_animation(anim_name, anim_name, self._purchase_confirm_widgets_by_name)

	self._products_version_id = (self._products_version_id or 0) + 1
	local purchase_confirm_widgets_by_name = self._purchase_confirm_widgets_by_name
	purchase_confirm_widgets_by_name.approved.content.visible = true
end

HeroViewStateStore._update_confirmation_wait_presentation = function (self, dt, t)
	local purchase_confirmation_anim_duration = self._purchase_confirmation_anim_duration

	if not purchase_confirmation_anim_duration then
		return
	end

	purchase_confirmation_anim_duration = purchase_confirmation_anim_duration + dt
	local progress = math.min(purchase_confirmation_anim_duration / 2, 1)
	local animation_progress = math.easeOutCubic(progress)
	local purchase_confirm_widgets_by_name = self._purchase_confirm_widgets_by_name
	local approved_widget = purchase_confirm_widgets_by_name.approved
	local declined_widget = purchase_confirm_widgets_by_name.declined

	if progress == 1 then
		purchase_confirm_widgets_by_name.loading_icon.content.fade_out = false
		self._waiting_for_purchase_result = nil

		self:abort_item_purchase_request()
		self:play_sound("play_gui_chest_reward_enter")

		self._purchase_confirmation_anim_duration = nil
	else
		self._purchase_confirmation_anim_duration = purchase_confirmation_anim_duration
	end
end

HeroViewStateStore.create_item_widget = function (self, product, scenegraph_id, masked)
	local product_type = product.type
	local size = item_widget_size_by_type[product_type] or item_widget_size_by_type.default
	local definition = UIWidgets.create_store_item_definition(scenegraph_id, size, masked)
	local widget = UIWidget.init(definition)

	return widget
end

HeroViewStateStore.populate_product_widget = function (self, widget, product)
	local product_id = product.product_id
	local product_type = product.type

	if product_type == "item" then
		local item = product.item

		self:_populate_item_widget(widget, item, product_id)
	elseif product_type == "dlc" then
		local dlc_settings = product.dlc_settings

		self:_populate_dlc_widget(widget, dlc_settings, product_id)
	end
end

HeroViewStateStore.destroy_product_widget = function (self, widget, product)
	local content = widget.content
	local reference_name = content.reference_name

	if reference_name then
		local product_id = product.product_id
		local product_type = product.type

		if product_type == "item" then
			self:_unload_texture_by_reference(reference_name)
		elseif product_type == "dlc" then
			self:_unload_texture_by_reference(reference_name)
		end
	end
end

HeroViewStateStore._calculate_discount_textures = function (self, widget, discount)
	local content = widget.content
	local style = widget.style
	local icons_style = style.discont_number_icons
	local icons_content = content.discont_number_icons
	local texture_sizes = icons_style.texture_sizes
	local texture_offsets = icons_style.texture_offsets
	local offset = icons_style.offset
	local default_offset = icons_style.default_offset
	local total_width = 0
	local previous_offset_x = 0
	local height_spacing = 9
	local area_length = 106
	local discount_string = tostring(math.floor(discount))
	local length = string.len(discount_string) + 2

	for i = 1, length, 1 do
		local texture_name = nil

		if i == 1 then
			texture_name = "store_number_minus"
		elseif i == length then
			texture_name = "store_number_percent"
		else
			local char = string.sub(discount_string, i - 1, i - 1)
			texture_name = "store_number_" .. char
		end

		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
		local size = {
			texture_settings.size[1],
			texture_settings.size[2]
		}
		icons_content[i] = texture_name
		texture_sizes[i] = size
		local x = -(total_width * 0.5 + height_spacing * 0.5 * i)
		local y = height_spacing * i
		texture_offsets[i] = {
			x,
			y,
			0
		}
		total_width = total_width + size[1]
	end

	content.discount = true
end

HeroViewStateStore._populate_item_widget = function (self, widget, item, product_id)
	local item_rarity_textures = UISettings.item_rarity_textures
	local item_type_store_icons = UISettings.item_type_store_icons
	local inventory_icon, display_name, description = UIUtils.get_ui_information_from_item(item)
	local item_data = item.data
	local rarity = item.rarity or item_data.rarity
	local item_type = item_data.item_type
	local content = widget.content
	local style = widget.style
	local masked = style.icon.masked
	local currency_type = "SM"
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local price = current_prices[currency_type] or regular_prices[currency_type]
	local price_difference = regular_prices[currency_type] - current_prices[currency_type]

	if price_difference ~= 0 then
		local discount = price_difference / price * 100

		self:_calculate_discount_textures(widget, discount)
	end

	content.price_text = price
	local backend_items = Managers.backend:get_interface("items")
	local item_key = item.key
	local item_owned = backend_items:has_item(item_key)
	content.owned = item_owned
	local item_type_icon = item_type_store_icons[item_type] or item_type_store_icons.default
	content.type_tag_icon = (rarity and item_type_icon .. "_" .. rarity) or item_type_icon
	local can_wield = item_data.can_wield

	if can_wield then
		for _, career_name in ipairs(can_wield) do
			local career_icons = content.career_icons
			career_icons[#career_icons + 1] = "store_tag_icon_" .. career_name .. "_" .. rarity
		end
	end

	local ui_top_renderer = self._ui_top_renderer
	local top_gui = ui_top_renderer.gui
	self._reference_id = (self._reference_id or 0) + 1
	local reference_name = product_id .. "_" .. self._reference_id
	local texture_name = "store_item_icon_" .. product_id
	local package_name = "resource_packages/store/item_icons/" .. texture_name
	local package_available = Application.can_get("package", package_name)

	if package_available then
		content.reference_name = reference_name
		local new_material_name = (masked and texture_name .. "_masked") or texture_name
		local template_material_name = (masked and "template_store_diffuse_masked") or "template_store_diffuse"

		self:_create_material_instance(top_gui, new_material_name, template_material_name, reference_name)

		local function callback()
			local texture_path = "gui/1080p/single_textures/store_item_icons/" .. texture_name .. "/" .. texture_name

			self:_set_material_diffuse(top_gui, new_material_name, texture_path)

			content.icon = new_material_name
		end

		self:_load_texture_package(package_name, reference_name, callback)

		return
	end

	Application.warning("Icon package not accessable for product_id: (%s) and texture_name: (%s)", product_id, texture_name)
end

HeroViewStateStore._populate_dlc_widget = function (self, widget, settings, product_id)
	local item_rarity_textures = UISettings.item_rarity_textures
	local item_type_store_icons = UISettings.item_type_store_icons
	local display_name = settings.name
	local texture = settings.store_banner_texture
	local dlc_name = settings.dlc_name
	local item_type = "dlc"
	local currency_type = "SM"
	local style = widget.style
	local content = widget.content
	content.icon = texture
	content.price_text = "???"
	content.owned = Managers.unlock:is_dlc_unlocked(dlc_name)
	local masked = style.icon.masked
	local item_type_icon = item_type_store_icons[item_type] or item_type_store_icons.default
	content.type_tag_icon = item_type_icon
	local ui_top_renderer = self._ui_top_renderer
	local top_gui = ui_top_renderer.gui
	local package_name = settings.store_texture_package
	local banner_texture_path = settings.store_banner_texture_paths
	self._reference_id = (self._reference_id or 0) + 1
	local reference_name = product_id .. "_" .. self._reference_id
	local package_available = Application.can_get("package", package_name)

	if package_available then
		content.reference_name = reference_name
		local new_banner_material_name = (masked and "store_dlc_banner_masked_" .. product_id) or "store_dlc_banner_" .. product_id
		local banner_template_material_name = (masked and "template_store_diffuse_masked") or "template_store_diffuse"

		self:_create_material_instance(top_gui, new_banner_material_name, banner_template_material_name, reference_name)

		local function callback()
			self:_set_material_diffuse(top_gui, new_banner_material_name, banner_texture_path)

			content.icon = new_banner_material_name
		end

		self:_load_texture_package(package_name, reference_name, callback)

		return
	end

	Application.warning("DLC icon package not accessable for product_id: (%s) and package_name: (%s)", product_id, package_name)
end

HeroViewStateStore.set_list_details_visibility = function (self, visible)
	local animations = self._animations
	local ui_animator = self._ui_animator
	local animation_name = "list_detail_on_enter"

	if animations[animation_name] then
		ui_animator:stop_animation(animation_name)

		animations[animation_name] = nil
	end

	if visible and not self._draw_list_details then
		local list_detail_widgets_by_name = self._list_detail_widgets_by_name

		self:_start_transition_animation(animation_name, animation_name, list_detail_widgets_by_name)
	end

	self._draw_list_details = visible
end

HeroViewStateStore.set_list_details_length = function (self, length, animation_duration)
	local ui_scenegraph = self._ui_scenegraph
	local list_detail_widgets_by_name = self._list_detail_widgets_by_name
	local list_detail_top_left = list_detail_widgets_by_name.list_detail_top_left
	local left_detail_size = scenegraph_definition[list_detail_top_left.scenegraph_id].size
	local list_detail_top_right = list_detail_widgets_by_name.list_detail_top_right
	local right_detail_size = scenegraph_definition[list_detail_top_right.scenegraph_id].size
	local target_length = math.max(length - (left_detail_size[1] + right_detail_size[1]), 0)
	local list_detail_top_center = list_detail_widgets_by_name.list_detail_top_center
	local start_length = ui_scenegraph[list_detail_top_center.scenegraph_id].size[1]
	local list_detail_animation_data = self._list_detail_animation_data or {}
	self._list_detail_animation_data = list_detail_animation_data
	list_detail_animation_data.duration = animation_duration
	list_detail_animation_data.total_duration = animation_duration
	list_detail_animation_data.target_length = target_length
	list_detail_animation_data.start_length = start_length
end

HeroViewStateStore._update_list_detail_animation = function (self, dt)
	local list_detail_animation_data = self._list_detail_animation_data

	if not list_detail_animation_data then
		return
	end

	local duration = list_detail_animation_data.duration

	if not duration then
		return
	end

	duration = math.max(duration - dt, 0)
	local start_length = list_detail_animation_data.start_length
	local target_length = list_detail_animation_data.target_length
	local total_duration = list_detail_animation_data.total_duration
	local easing = math.easeOutCubic
	local progress = 1 - duration / total_duration
	local anim_progress = easing(progress)
	local animation_length = (target_length - start_length) * anim_progress
	local current_length = start_length + animation_length
	local list_detail_widgets_by_name = self._list_detail_widgets_by_name
	local list_detail_top_center = list_detail_widgets_by_name.list_detail_top_center
	local list_detail_bottom_center = list_detail_widgets_by_name.list_detail_bottom_center
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph[list_detail_top_center.scenegraph_id].size[1] = current_length
	ui_scenegraph[list_detail_bottom_center.scenegraph_id].size[1] = current_length

	if duration == 0 then
		list_detail_animation_data.duration = nil
	else
		list_detail_animation_data.duration = duration
	end
end

HeroViewStateStore._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

HeroViewStateStore._set_material_diffuse = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

HeroViewStateStore._load_texture_package = function (self, package_name, reference_name, callback)
	Managers.package:load(package_name, reference_name, callback, true)

	local loaded_package_names = self._loaded_package_names
	loaded_package_names[reference_name] = package_name
end

HeroViewStateStore._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[HeroViewStateStore] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

HeroViewStateStore._unload_texture_by_reference = function (self, reference_name)
	local loaded_package_names = self._loaded_package_names
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local package_name = loaded_package_names[reference_name]

	fassert(package_name, "[HeroViewStateStore] - Could not find a package to unload for reference name: (%s)", reference_name)
	Managers.package:unload(package_name, reference_name)

	loaded_package_names[reference_name] = nil

	if self:_is_unique_reference_to_material(reference_name) then
		local material_name = cloned_materials_by_reference[reference_name]
		local ui_top_renderer = self._ui_top_renderer
		local top_gui = ui_top_renderer.gui

		self:_set_material_diffuse(top_gui, material_name, PRODUCT_PLACEHOLDER_TEXTURE_PATH)
	end

	cloned_materials_by_reference[reference_name] = nil
end

HeroViewStateStore._unload_all_textures = function (self)
	local loaded_package_names = self._loaded_package_names

	for reference_name, package_name in pairs(loaded_package_names) do
		self:_unload_texture_by_reference(reference_name)
	end
end

HeroViewStateStore.animate_item_product = function (self, widget, dt, optional_hover)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot or content.hotspot
	local on_hover_enter = hotspot.on_hover_enter
	local is_hover = hotspot.is_hover

	if optional_hover ~= nil and not optional_hover then
		is_hover = false
		on_hover_enter = false
	end

	local is_selected = hotspot.is_selected
	local was_selected = hotspot.was_selected

	if not was_selected and is_selected then
		hotspot.was_selected = true
	end

	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local pulse_progress = hotspot.pulse_progress or 1
	local selection_progress = hotspot.selection_progress or 0
	local speed = ((is_hover or is_selected) and 14) or 3
	local pulse_speed = 3
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if on_hover_enter then
		pulse_progress = 0
	end

	pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)
	local pulse_easing_out_progress = math.easeOutCubic(pulse_progress)
	local pulse_easing_in_progress = math.easeInCubic(pulse_progress)

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
	local overlay_style = style.overlay

	if overlay_style then
		local overlay_alpha = 80 - 80 * combined_progress
		overlay_style.color[1] = overlay_alpha
	end

	local pulse_alpha = 255 - 255 * pulse_progress
	style.pulse_frame.color[1] = pulse_alpha
	hotspot.pulse_progress = pulse_progress
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

return
