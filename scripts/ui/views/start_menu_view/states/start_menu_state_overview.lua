require("scripts/settings/profiles/sp_profiles")

local definitions = local_require("scripts/ui/views/start_menu_view/states/definitions/start_menu_state_overview_definitions")
local widget_definitions = definitions.widgets
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local console_cursor_definition = definitions.console_cursor_definition
local DO_RELOAD = false
local menu_functions = {
	function (this)
		local input_manager = Managers.input

		input_manager:block_device_except_service("options_menu", "gamepad")
		this:_activate_view("options_view")
	end,
	function (this)
		Managers.state.difficulty:set_difficulty("normal", 0)
		Managers.state.game_mode:start_specific_level("prologue")
	end,
	function (this)
		this:_activate_view("credits_view")
	end,
	function (this)
		this:_activate_view("cinematics_view")
	end
}
StartMenuStateOverview = class(StartMenuStateOverview)
StartMenuStateOverview.NAME = "StartMenuStateOverview"

StartMenuStateOverview.on_enter = function (self, params)
	self.parent:clear_wanted_state()
	print("[HeroViewState] Enter Substate StartMenuStateOverview")

	self._hero_name = params.hero_name
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.is_server = ingame_ui_context.is_server
	self.world_previewer = params.world_previewer
	self.wwise_world = params.wwise_world
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.local_player = local_player
	self._animations = {}
	self._ui_animations = {}
	self._available_profiles = {}

	self:_init_menu_views()

	local parent = self.parent
	local input_service = self:input_service(true)
	local gui_layer = UILayer.default + 30
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 3, gui_layer, generic_input_actions.default)

	self.menu_input_description:set_input_description(nil)
	self:create_ui_elements(params)
	self:_start_transition_animation("on_enter", "on_enter")

	self._hero_preview_skin = nil
	self.use_user_skins = true
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local hero_name = self._hero_name

	if hero_name then
		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local career_index = hero_attributes:get(hero_name, "career") or 1

		self:_populate_career_page(hero_name, career_index)
	end

	Managers.input:enable_gamepad_cursor()
end

StartMenuStateOverview.create_ui_elements = function (self, params)
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

	if script_data.settings.use_beta_mode and IS_XB1 then
		local tutorial_button = widgets_by_name.tutorial_button
		local tutorial_button_content = tutorial_button.content
		tutorial_button_content.button_hotspot.disable_button = true
	end

	self._console_cursor = UIWidget.init(console_cursor_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

StartMenuStateOverview._get_skin_item_data = function (self, index, career_index)
	local profile_settings = SPProfiles[index]
	local skin_name = profile_settings.careers[career_index].base_skin

	return Cosmetics[skin_name]
end

StartMenuStateOverview._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

StartMenuStateOverview.on_exit = function (self, params)
	Managers.input:disable_gamepad_cursor()

	if self._active_view then
		self:exit_current_view()
	end

	if self.menu_input_description then
		self.menu_input_description:destroy()

		self.menu_input_description = nil
	end

	self.ui_animator = nil

	print("[HeroViewState] Exit Substate StartMenuStateOverview")
end

StartMenuStateOverview._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

StartMenuStateOverview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local active_view = self._active_view

	if active_view then
		self._views[active_view]:update(dt, t)
	elseif not self._prepare_exit then
		self:_handle_input(dt, t)
		self:_handle_keyboard_input(dt, t)
	end

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		if self.world_previewer:has_units_spawned() then
			self._prepare_exit = true
		elseif not self._prepare_exit then
			return wanted_state or self._new_state
		end
	end

	self:draw(dt)
end

StartMenuStateOverview.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		if self._prepare_exit then
			self._prepare_exit = false

			self.world_previewer:prepare_exit()
		elseif self._spawn_hero then
			self._spawn_hero = nil
			local hero_name = self._selected_hero_name or self._hero_name

			self:_spawn_hero_unit(hero_name)
		end
	end
end

StartMenuStateOverview.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local parent = self.parent
	local input_service = self:input_service(true)
	local render_settings = self.render_settings
	local snap_pixel_positions = render_settings.snap_pixel_positions

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._player_portrait_widget then
		UIRenderer.draw_widget(ui_top_renderer, self._player_portrait_widget)
	end

	if not self._active_view then
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartMenuStateOverview._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartMenuStateOverview._spawn_hero_unit = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self.career_index
	local callback = callback(self, "cb_hero_unit_spawned", hero_name)

	world_previewer:request_spawn_hero_unit(hero_name, self.career_index, not self.use_user_skins, callback)
end

StartMenuStateOverview.cb_hero_unit_spawned = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_idle_animation = career_settings.preview_idle_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_data in ipairs(preview_items) do
			local item_name = item_data.item_name
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			world_previewer:equip_item(item_name, slot)
		end

		if preview_wield_slot then
			world_previewer:wield_weapon_slot(preview_wield_slot)
		end
	end

	if self.use_user_skins then
		local career_name = career_settings.name
		local item = BackendUtils.get_loadout_item(career_name, "slot_hat")

		if item then
			local item_data = item.data
			local item_name = item_data.name
			local backend_id = item.backend_id
			local slot = InventorySettings.slots_by_name.slot_hat

			world_previewer:equip_item(item_name, slot, backend_id)
		end
	end

	if preview_idle_animation then
		self.world_previewer:play_character_animation(preview_idle_animation)
	end
end

StartMenuStateOverview._populate_career_page = function (self, hero_name, career_index)
	local profile_index = FindProfileIndex(hero_name)
	local profile_settings = SPProfiles[profile_index]
	local character_name = profile_settings.character_name
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local name = career_settings.name
	local portrait_image = career_settings.portrait_image
	local display_name = career_settings.display_name
	local icon = career_settings.icon
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_career_name.content.text = Localize(display_name)
	self._spawn_hero = true
	self.career_index = career_index
	local level = nil

	if Managers.mechanism:current_mechanism_name() == "versus" then
		local experience = ExperienceSettings.get_versus_profile_experience()
		level = ExperienceSettings.get_versus_profile_level_from_experience(experience)
	else
		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local exp = hero_attributes:get(hero_name, "experience") or 0
		level = ExperienceSettings.get_level(exp)
	end

	self:_set_hero_info(Localize(character_name), level)

	local player_portrait_frame = self:_get_portrait_frame(profile_index, career_index)

	self:_create_player_portrait(portrait_image, level, player_portrait_frame)
end

StartMenuStateOverview._get_portrait_frame = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local player_portrait_frame = "default"
	local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

	if item then
		local item_data = item.data
		local frame_name = item_data.temporary_template
		player_portrait_frame = frame_name or player_portrait_frame
	end

	return player_portrait_frame
end

StartMenuStateOverview._set_hero_info = function (self, name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = name
	widgets_by_name.info_hero_level.content.text = Localize("level") .. ": " .. level
end

StartMenuStateOverview._create_player_portrait = function (self, portrait_image, level, player_portrait_frame)
	local level_text = level and tostring(level) or "-"
	local scale = 1
	local retained_mode = false
	local definition = UIWidgets.create_portrait_frame("portrait_root", player_portrait_frame, level_text, scale, retained_mode, portrait_image)
	local widget = UIWidget.init(definition)
	self._player_portrait_widget = widget
end

StartMenuStateOverview._set_select_button_enabled = function (self, enabled)
	self._widgets_by_name.select_button.content.button_hotspot.disable_button = not enabled
end

StartMenuStateOverview._clear_keyboard_selection = function (self, button_grid)
	local widgets_by_name = self._widgets_by_name

	for i, data in ipairs(button_grid) do
		for j, button_name in ipairs(data) do
			local widget = widgets_by_name[button_name]
			widget.content.button_hotspot.is_selected = false
		end
	end

	self._keyboard_grid_selection = nil
end

StartMenuStateOverview._handle_keyboard_input = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local mouse_active = Managers.input:is_device_active("mouse")
	local button_grid = {
		{
			"play_button",
			"options_button",
			"tutorial_button",
			"cinematics_button",
			"credits_button",
			"quit_button"
		},
		{
			"hero_button"
		}
	}

	if mouse_active or gamepad_active then
		self:_clear_keyboard_selection(button_grid)

		return
	end

	local button_funcs = {
		play_button = function ()
			self.parent:close_menu()
		end,
		options_button = function ()
			menu_functions[1](self)
		end,
		tutorial_button = function ()
			menu_functions[2](self)
		end,
		cinematics_button = function ()
			menu_functions[4](self)
		end,
		credits_button = function ()
			menu_functions[3](self)
		end,
		quit_button = function ()
			Boot.quit_game = true
		end,
		hero_button = function ()
			self.parent:requested_screen_change_by_name("character")
		end
	}
	local keyboard_grid_selection = self._keyboard_grid_selection or {}
	local index_x = keyboard_grid_selection[1] or 1
	local index_y = keyboard_grid_selection[2] or 1
	local input_service = self:input_service(true)

	if input_service:get("move_down_hold_continuous") then
		index_y = index_y + 1
	elseif input_service:get("move_up_hold_continuous") then
		index_y = index_y - 1
	elseif input_service:get("move_right_hold_continuous") then
		index_x = index_x + 1
	elseif input_service:get("move_left_hold_continuous") then
		index_x = index_x - 1
	elseif input_service:get("confirm_press") then
		local button_name = button_grid[index_x][index_y]
		local func = button_funcs[button_name]

		if func then
			func()
			self:_play_sound("play_gui_start_menu_button_click")
		end
	end

	index_x = math.clamp(index_x, 1, #button_grid)
	index_y = math.clamp(index_y, 1, #button_grid[index_x])
	local widgets_by_name = self._widgets_by_name

	if index_x ~= keyboard_grid_selection[1] or index_y ~= keyboard_grid_selection[2] then
		for grid_index_x, data in ipairs(button_grid) do
			for grid_index_y, button_name in ipairs(data) do
				local widget = widgets_by_name[button_name]
				local button_hotspot = widget.content.button_hotspot
				button_hotspot.is_selected = grid_index_x == index_x and grid_index_y == index_y
			end
		end

		keyboard_grid_selection[1] = index_x
		keyboard_grid_selection[2] = index_y
		self._keyboard_grid_selection = keyboard_grid_selection

		self:_play_sound("play_gui_start_menu_button_hover")
	end
end

StartMenuStateOverview._handle_input = function (self, dt, t)
	local input_service = self:input_service(true)
	local widgets_by_name = self._widgets_by_name
	local play_button = widgets_by_name.play_button
	local hero_button = widgets_by_name.hero_button
	local quit_button = widgets_by_name.quit_button
	local credits_button = widgets_by_name.credits_button
	local options_button = widgets_by_name.options_button
	local tutorial_button = widgets_by_name.tutorial_button
	local cinematics_button = widgets_by_name.cinematics_button

	UIWidgetUtils.animate_default_button(play_button, dt)
	UIWidgetUtils.animate_default_button(hero_button, dt)
	UIWidgetUtils.animate_default_button(quit_button, dt)
	UIWidgetUtils.animate_default_button(credits_button, dt)
	UIWidgetUtils.animate_default_button(cinematics_button, dt)
	UIWidgetUtils.animate_default_button(options_button, dt)
	UIWidgetUtils.animate_default_button(tutorial_button, dt)

	if self:_is_button_hover_enter(play_button) or self:_is_button_hover_enter(hero_button) or self:_is_button_hover_enter(quit_button) or self:_is_button_hover_enter(credits_button) or self:_is_button_hover_enter(options_button) or self:_is_button_hover_enter(tutorial_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	elseif self:_is_button_hover_enter(cinematics_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self:_is_button_pressed(hero_button) then
		self:_play_sound("play_gui_start_menu_button_click")
		self.parent:requested_screen_change_by_name("character")
	elseif self:_is_button_pressed(play_button) then
		self:_play_sound("play_gui_start_menu_button_click")
		self.parent:close_menu()
	elseif self:_is_button_pressed(options_button) then
		self:_play_sound("play_gui_start_menu_button_click")
		menu_functions[1](self)
		self:_play_sound("play_gui_start_menu_button_click")
	elseif self:_is_button_pressed(tutorial_button) then
		menu_functions[2](self)
		self:_play_sound("play_gui_start_menu_button_click")
	elseif self:_is_button_pressed(cinematics_button) then
		menu_functions[4](self)
		self:_play_sound("play_gui_start_menu_button_click")
	elseif self:_is_button_pressed(credits_button) then
		menu_functions[3](self)
	elseif self:_is_button_pressed(quit_button) then
		self:_play_sound("play_gui_start_menu_button_click")

		Boot.quit_game = true
	end

	if Development.parameter("tobii_button") then
		self:_handle_tobii_button(dt)
	end
end

StartMenuStateOverview._handle_tobii_button = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local tobii_button = widgets_by_name.tobii_button

	UIWidgetUtils.animate_default_button(tobii_button, dt)

	if self:_is_button_pressed(tobii_button) then
		self:_play_sound("play_gui_start_menu_button_click")

		local tobii_contest_url = "https://vermintide2beta.com/?utm_medium=referral&utm_campaign=vermintide2beta&utm_source=ingame#challenge"

		Application.open_url_in_browser(tobii_contest_url)
	end
end

StartMenuStateOverview.game_popup_active = function (self)
	return self._show_play_popup
end

StartMenuStateOverview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartMenuStateOverview._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartMenuStateOverview._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StartMenuStateOverview._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartMenuStateOverview.get_camera_position = function (self)
	local world, viewport = self.parent:get_background_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

StartMenuStateOverview.get_camera_rotation = function (self)
	local world, viewport = self.parent:get_background_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.rotation(camera)
end

StartMenuStateOverview.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

StartMenuStateOverview._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

StartMenuStateOverview._on_option_button_hover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[2]
	local target_color_value = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	for i = 2, 4 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[i] = target_color_value
		end
	end
end

StartMenuStateOverview._on_option_button_dehover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = 100
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_color_value / 255 * total_time

	for i = 2, 4 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[1] = target_color_value
		end
	end
end

StartMenuStateOverview.play_sound = function (self, event)
	return
end

StartMenuStateOverview._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartMenuStateOverview._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartMenuStateOverview._init_menu_views = function (self)
	local ingame_ui_context = self.ingame_ui_context
	self._views = {
		credits_view = CreditsView:new(ingame_ui_context),
		options_view = OptionsView:new(ingame_ui_context),
		cinematics_view = CinematicsView:new(ingame_ui_context)
	}

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()
		end
	end
end

StartMenuStateOverview._activate_view = function (self, new_view)
	self._active_view = new_view
	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		Managers.input:disable_gamepad_cursor()
		views[new_view]:on_enter()
	end
end

StartMenuStateOverview.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil
	local input_service = self:input_service(true)
	local input_service_name = input_service.name
	local input_manager = Managers.input

	input_manager:block_device_except_service(input_service_name, "keyboard")
	input_manager:block_device_except_service(input_service_name, "mouse")
	input_manager:block_device_except_service(input_service_name, "gamepad")
	Managers.input:enable_gamepad_cursor()
end

StartMenuStateOverview.input_service = function (self, ignore_view_input)
	if not ignore_view_input then
		local active_view = self._active_view
		local views = self._views
		local view = views[active_view]

		if view then
			return view:input_service()
		end
	end

	return self.parent:input_service(true)
end
