require("scripts/ui/views/start_game_view/windows/start_game_window_adventure")
require("scripts/ui/views/start_game_view/windows/start_game_window_adventure_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_game_mode")
require("scripts/ui/views/start_game_view/windows/start_game_window_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission_selection")
require("scripts/ui/views/start_game_view/windows/start_game_window_difficulty")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_list")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_summary")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_grid")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_login")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_game_settings")
require("scripts/ui/views/hero_view/windows/hero_window_prestige")
require("scripts/ui/views/hero_view/windows/hero_window_talents")
require("scripts/ui/views/hero_view/windows/hero_window_options")
require("scripts/ui/views/hero_view/windows/hero_window_crafting")
require("scripts/ui/views/hero_view/windows/hero_window_character_preview")
require("scripts/ui/views/hero_view/windows/hero_window_inventory")
require("scripts/ui/views/hero_view/windows/hero_window_cosmetics_inventory")
require("scripts/ui/views/hero_view/windows/hero_window_loadout_inventory")
require("scripts/ui/views/hero_view/windows/hero_window_cosmetics_loadout")
require("scripts/ui/views/hero_view/windows/hero_window_loadout")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_overview_definitions")
local windows_settings = definitions.windows
local window_layouts = definitions.window_layouts
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local game_options_settings = definitions.game_options_settings
local MAX_ACTIVE_WINDOWS = 5
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return 
	end,
	has = function ()
		return 
	end
}
HeroViewStateOverview = class(HeroViewStateOverview)
HeroViewStateOverview.NAME = "HeroViewStateOverview"
HeroViewStateOverview.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateOverview")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.wwise_world = params.wwise_world
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.player = local_player
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes.get(hero_attributes, display_name, "career")
	self.hero_name = display_name
	self.career_index = career_index
	self.profile_index = profile_index
	self._animations = {}
	self._ui_animations = {}
	self.loadout_sync_id = 0
	self.inventory_sync_id = 0
	self.talent_sync_id = 0
	self.disabled_backend_ids_sync_id = 0
	self._disabled_backend_ids = {}

	self.create_ui_elements(self, params)

	if params.initial_state then
		params.initial_state = nil

		self._start_transition_animation(self, "on_enter", "on_enter")
	end

	local window_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		windows_settings = windows_settings,
		input_service = fake_input_service,
		hero_name = self.hero_name,
		career_index = self.career_index,
		profile_index = self.profile_index,
		start_state = params.start_state
	}

	self._initial_windows_setups(self, window_params)

	return 
end
HeroViewStateOverview.create_ui_elements = function (self, params)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	return 
end
HeroViewStateOverview._initial_windows_setups = function (self, params)
	local active_windows = {}
	self._active_windows = active_windows
	self._window_params = params
	local start_state = params.start_state

	if start_state then
		self.set_layout_by_name(self, start_state)
	else
		self.set_layout(self, 1)
	end

	return 
end
HeroViewStateOverview.window_input_service = function (self)
	return (self._input_blocked and fake_input_service) or self.input_service(self)
end
HeroViewStateOverview._close_window_at_index = function (self, window_index)
	local active_windows = self._active_windows
	local params = self._window_params
	local current_window = active_windows[window_index]

	if current_window and current_window.on_exit then
		current_window.on_exit(current_window, params)
	end

	active_windows[window_index] = nil

	return 
end
HeroViewStateOverview._change_window = function (self, window_index, window_name)
	local active_windows = self._active_windows
	local params = self._window_params
	local new_window_settings = windows_settings[window_name]
	local alignment_index = new_window_settings.alignment_index or window_index
	local window_class_name = new_window_settings.class_name
	local current_window = active_windows[window_index]

	if current_window then
		if current_window.NAME == window_class_name then
			return 
		end

		self._close_window_at_index(self, window_index)
	end

	local window_class = rawget(_G, window_class_name)
	local window = window_class.new(window_class)
	local window_default_settings = UISettings.game_start_windows
	local window_size = window_default_settings.size
	local window_spacing = window_default_settings.spacing or 10
	local window_width = window_size[1]
	local total_spacing = window_spacing*2
	local total_windows_width = window_width*3
	local start_width_offset = -(total_windows_width/2 + window_width/2) - (total_spacing/2 + window_spacing)
	local window_width_offset = start_width_offset + alignment_index*window_width + alignment_index*window_spacing
	local window_offset = {
		window_width_offset,
		0,
		3
	}

	if window.on_enter then
		window.on_enter(window, params, window_offset)
	end

	active_windows[window_index] = window

	return 
end
HeroViewStateOverview.set_layout_by_name = function (self, name)
	for index, layout_setting in ipairs(window_layouts) do
		if layout_setting.name == name then
			self.set_layout(self, index)

			return 
		end
	end

	return 
end
HeroViewStateOverview.set_layout = function (self, index)
	local layout_setting = self._get_layout_setting(self, index)
	local windows = layout_setting.windows
	local sound_event_enter = layout_setting.sound_event_enter
	local close_on_exit = layout_setting.close_on_exit

	if sound_event_enter then
		self.play_sound(self, sound_event_enter)
	end

	self._widgets_by_name.exit_button.content.visible = close_on_exit
	self._widgets_by_name.back_button.content.visible = not close_on_exit
	self._close_on_exit = close_on_exit

	for i = 1, MAX_ACTIVE_WINDOWS, 1 do
		local window_changed = false

		for window_name, window_position_index in pairs(windows) do
			if window_position_index == i then
				self._change_window(self, window_position_index, window_name)

				window_changed = true
			end
		end

		if not window_changed then
			self._close_window_at_index(self, i)
		end
	end

	if self._selected_game_mode_index then
		self._previous_selected_game_mode_index = self._selected_game_mode_index
	end

	self._selected_game_mode_index = index

	return 
end
HeroViewStateOverview.get_selected_game_mode_index = function (self)
	return self._selected_game_mode_index
end
HeroViewStateOverview.get_previous_selected_game_mode_index = function (self)
	return self._previous_selected_game_mode_index
end
HeroViewStateOverview._get_layout_setting = function (self, index)
	return window_layouts[index]
end
HeroViewStateOverview._windows_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window.update(window, dt, t)
	end

	return 
end
HeroViewStateOverview._windows_post_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		if window.post_update then
			window.post_update(window, dt, t)
		end
	end

	return 
end
HeroViewStateOverview.enable_widget = function (self, active_window_index, widget_name, enable)
	local active_windows = self._active_windows
	local active_window = active_windows[active_window_index]
	local widget = active_window._widgets_by_name[widget_name]

	if widget then
		local widget_content = widget.content
		local button_hotspot = widget_content.button_hotspot

		if button_hotspot then
			button_hotspot.disable_button = not enable
		end
	end

	return 
end
HeroViewStateOverview.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end

	return 
end
HeroViewStateOverview._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end
HeroViewStateOverview.wanted_menu_state = function (self)
	return self._wanted_menu_state
end
HeroViewStateOverview.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil

	return 
end
HeroViewStateOverview.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateOverview")

	self.ui_animator = nil

	if self._fullscreen_effect_enabled then
		self.set_fullscreen_effect_enable_state(self, false)
	end

	local active_windows = self._active_windows
	local params = self._window_params

	for _, window in pairs(active_windows) do
		if window.on_exit then
			window.on_exit(window, params)
		end
	end

	return 
end
HeroViewStateOverview._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return 
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end

	return 
end
HeroViewStateOverview.input_service = function (self)
	return self.parent:input_service()
end
HeroViewStateOverview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	local input_manager = self.input_manager
	local input_service = self.window_input_service(self)

	self.draw(self, input_service, dt)
	self._update_transition_timer(self, dt)
	self._windows_update(self, dt, t)

	local transitioning = self.parent:transitioning()
	local wanted_state = self._wanted_state(self)

	if not self._transition_timer then
		if not transitioning then
			self._handle_input(self, dt, t)
		end

		if wanted_state or self._new_state then
			self.parent:clear_wanted_state()

			return wanted_state or self._new_state
		end
	end

	return 
end
HeroViewStateOverview.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self._update_animations(self, dt)
	self._windows_post_update(self, dt, t)

	return 
end
HeroViewStateOverview._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
HeroViewStateOverview._handle_input = function (self, dt, t)
	local input_blocked = self._input_blocked

	if input_blocked then
		return 
	end

	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service.get(input_service, "toggle_menu")
	local close_on_exit = self._close_on_exit
	local exit_button = widgets_by_name.exit_button
	local back_button = widgets_by_name.back_button

	UIWidgetUtils.animate_default_button(exit_button, dt)
	UIWidgetUtils.animate_default_button(back_button, dt)

	if close_on_exit and (input_pressed or self._is_button_pressed(self, exit_button)) then
		self.play_sound(self, "Play_hud_hover")
		self.parent:close_menu()

		return 
	elseif input_pressed or self._is_button_pressed(self, back_button) then
		self.play_sound(self, "Play_hud_hover")

		local previous_layout_key = self.get_previous_selected_game_mode_index(self)

		if previous_layout_key then
			self.set_layout(self, previous_layout_key)
		end
	end

	return 
end
HeroViewStateOverview.draw = function (self, input_service, dt)
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

	UIRenderer.end_pass(ui_renderer)

	return 
end
HeroViewStateOverview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
HeroViewStateOverview.play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroViewStateOverview._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id

	return 
end
HeroViewStateOverview.set_pressed_item_backend_id = function (self, backend_id, is_drag_item)
	self._pressed_item_backend_id = backend_id
	self._pressed_item_by_drag = (backend_id and is_drag_item) or nil

	return 
end
HeroViewStateOverview.get_disabled_backend_ids = function (self)
	return self._disabled_backend_ids
end
HeroViewStateOverview.clear_disabled_backend_ids = function (self)
	self._disabled_backend_ids = {}
	self.disabled_backend_ids_sync_id = self.disabled_backend_ids_sync_id + 1

	return 
end
HeroViewStateOverview.set_disabled_backend_id = function (self, backend_id, is_disabled)
	if is_disabled then
		self._disabled_backend_ids[backend_id] = true
	else
		self._disabled_backend_ids[backend_id] = nil
	end

	self.disabled_backend_ids_sync_id = self.disabled_backend_ids_sync_id + 1

	return 
end
HeroViewStateOverview.get_pressed_item_backend_id = function (self)
	return self._pressed_item_backend_id, self._pressed_item_by_drag
end
HeroViewStateOverview.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled

	return 
end
HeroViewStateOverview.block_input = function (self)
	self._input_blocked = true

	return 
end
HeroViewStateOverview.unblock_input = function (self)
	self._input_blocked = false

	return 
end
HeroViewStateOverview.input_blocked = function (self)
	return self._input_blocked
end
HeroViewStateOverview.set_selected_craft_page = function (self, name)
	self._selected_craft_page_name = name

	return 
end
HeroViewStateOverview.get_selected_craft_page = function (self)
	return self._selected_craft_page_name
end
HeroViewStateOverview.set_craft_optional_item_filter = function (self, item_filter)
	self._craft_optional_item_filter = item_filter

	return 
end
HeroViewStateOverview.get_craft_optional_item_filter = function (self)
	return self._craft_optional_item_filter
end
HeroViewStateOverview.set_selected_loadout_slot_index = function (self, index)
	self._selected_loadout_slot_index = index

	return 
end
HeroViewStateOverview.get_selected_loadout_slot_index = function (self)
	return self._selected_loadout_slot_index or 1
end
HeroViewStateOverview.set_selected_cosmetic_slot_index = function (self, index)
	self._selected_cosmetic_slot_index = index

	return 
end
HeroViewStateOverview.get_selected_cosmetic_slot_index = function (self)
	return self._selected_cosmetic_slot_index or 1
end
HeroViewStateOverview._set_loadout_item = function (self, item, strict_slot_type)
	local hero_name = self.hero_name
	local career_index = self.career_index
	local player_manager = self.player_manager
	local peer_id = self.peer_id
	local player = player_manager.player_from_peer_id(player_manager, peer_id)
	local unit = player.player_unit

	if not unit or not Unit.alive(unit) then
		return 
	end

	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	local resyncing_loadout = inventory_extension.resyncing_loadout(inventory_extension)

	if resyncing_loadout or not Managers.state.network:game() then
		return 
	end

	local backend_id = item.backend_id
	local item_data = item.data
	local slot_type = strict_slot_type or item_data.slot_type
	local slot = self._get_slot_by_type(self, slot_type)
	local slot_name = slot.name
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local backend_items = Managers.backend:get_interface("items")

	backend_items.set_loadout_item(backend_items, backend_id, career_name, slot_name)

	if slot_type == "melee" or slot_type == "ranged" then
		inventory_extension.create_equipment_in_slot(inventory_extension, slot_name, backend_id)
	elseif slot_type == "hat" then
		local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

		attachment_extension.create_attachment_in_slot(attachment_extension, slot_name, backend_id)
	elseif slot_type == "trinket" or slot_type == "ring" or slot_type == "necklace" then
		local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

		attachment_extension.create_attachment_in_slot(attachment_extension, slot_name, backend_id)
	end

	self.loadout_sync_id = self.loadout_sync_id + 1
	self.inventory_sync_id = self.inventory_sync_id + 1

	return 
end
HeroViewStateOverview.unequip_item_in_slot = function (self, slot_type)
	local hero_name = self.hero_name
	local career_index = self.career_index
	local slot = self._get_slot_by_type(self, slot_type)

	if not slot.unequippable then
		return false
	end

	local slot_name = slot.name
	local slot_index = slot.slot_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local item = BackendUtils.get_loadout_item(career_name, slot_name)

	if not item then
		return false
	end

	local backend_items = Managers.backend:get_interface("items")

	backend_items.set_loadout_item(backend_items, nil, career_name, slot_name)

	self.loadout_sync_id = self.loadout_sync_id + 1
	self.inventory_sync_id = self.inventory_sync_id + 1

	return true
end
HeroViewStateOverview.update_inventory_items = function (self)
	self.inventory_sync_id = self.inventory_sync_id + 1

	return 
end
HeroViewStateOverview._get_slot_by_type = function (self, slot_type)
	local slots = InventorySettings.slots_by_slot_index

	for _, slot in pairs(slots) do
		if slot_type == slot.type then
			return slot
		end
	end

	return 
end

return 
