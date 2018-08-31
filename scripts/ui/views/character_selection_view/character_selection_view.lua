require("scripts/ui/views/hero_view/item_grid_ui")
require("scripts/ui/views/character_selection_view/states/character_selection_state_character")
require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/character_selection_view/character_selection_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local settings_by_screen = definitions.settings_by_screen
local attachments = definitions.attachments
local flow_events = definitions.flow_events

local function dprint(...)
	print("[CharacterSelectionView]", ...)
end

local DO_RELOAD = true
local debug_draw_scenegraph = false
local debug_menu = true
CharacterSelectionView = class(CharacterSelectionView)
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}

CharacterSelectionView.init = function (self, ingame_ui_context)
	self.world = ingame_ui_context.world
	self.player_manager = ingame_ui_context.player_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.is_server = ingame_ui_context.is_server
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.world_manager = ingame_ui_context.world_manager
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("character_selection_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("character_selection_view", "keyboard")
	input_manager:map_device_to_service("character_selection_view", "mouse")
	input_manager:map_device_to_service("character_selection_view", "gamepad")

	self.world_previewer = MenuWorldPreviewer:new(ingame_ui_context, UISettings.hero_selection_camera_position_by_character)

	self.world_previewer:force_stream_highest_mip_levels()

	local state_machine_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		world_previewer = self.world_previewer,
		settings_by_screen = settings_by_screen,
		input_service = fake_input_service
	}
	self._state_machine_params = state_machine_params
	self.units = {}
	self.attachment_units = {}
	self.unit_states = {}
	self.ui_animations = {}
	self.ingame_ui_context = ingame_ui_context
	DO_RELOAD = false

	self:show_hero_panel()
end

CharacterSelectionView.initial_profile_view = function (self)
	return self.ingame_ui.initial_profile_view
end

CharacterSelectionView._setup_state_machine = function (self, state_machine_params, optional_start_state, optional_start_sub_state)
	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	local start_state = optional_start_state or CharacterSelectionStateCharacter
	local profiling_debugging_enabled = false
	state_machine_params.allow_back_button = not self:initial_profile_view()
	state_machine_params.start_state = optional_start_sub_state
	self._machine = GameStateMachine:new(self, start_state, state_machine_params, profiling_debugging_enabled)
	self._state_machine_params = state_machine_params
end

CharacterSelectionView.wanted_state = function (self)
	return self._wanted_state
end

CharacterSelectionView.clear_wanted_state = function (self)
	self._wanted_state = nil
end

CharacterSelectionView.input_service = function (self, ignore_input_blocked)
	if ignore_input_blocked then
		return self.input_manager:get_service("character_selection_view")
	else
		return (self._input_blocked and fake_input_service) or self.input_manager:get_service("character_selection_view")
	end
end

CharacterSelectionView.set_input_blocked = function (self, blocked)
	self._input_blocked = blocked
end

CharacterSelectionView.input_blocked = function (self)
	return self._input_blocked
end

CharacterSelectionView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

CharacterSelectionView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._static_widgets = {}
	self._title_widget = UIWidget.init(widget_definitions.title_text)
	self._hero_name_text_widget = UIWidget.init(widget_definitions.hero_name_text)
	self._hero_level_text_widget = UIWidget.init(widget_definitions.hero_level_text)
	self._hero_prestige_level_text_widget = UIWidget.init(widget_definitions.hero_prestige_level_text)
	self._title_description_widget = UIWidget.init(widget_definitions.title_description_text)
	self._exit_button_widget = UIWidget.init(widget_definitions.exit_button)

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, definitions.animations)
end

CharacterSelectionView.get_background_world = function (self)
	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	return world, viewport
end

CharacterSelectionView.show_hero_world = function (self)
	if not self._draw_menu_world then
		self._draw_menu_world = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

CharacterSelectionView.hide_hero_world = function (self)
	if self._draw_menu_world then
		self._draw_menu_world = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

CharacterSelectionView.show_hero_panel = function (self)
	self._draw_menu_panel = true

	self:set_input_blocked(false)
end

CharacterSelectionView.hide_hero_panel = function (self)
	self._draw_menu_panel = false

	self:set_input_blocked(true)
end

CharacterSelectionView.draw = function (self, dt, input_service)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

	if debug_draw_scenegraph then
		UISceneGraph.debug_render_scenegraph(ui_top_renderer, ui_scenegraph)
	end

	if self._draw_menu_panel then
		UIRenderer.draw_widget(ui_top_renderer, self._exit_button_widget)

		for _, widget in ipairs(self._static_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	if self.viewport_widget and self._draw_menu_world then
		UIRenderer.draw_widget(ui_top_renderer, self.viewport_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

CharacterSelectionView.post_update = function (self, dt, t)
	self._machine:post_update(dt, t)
	self.world_previewer:post_update(dt, t)
end

CharacterSelectionView.update = function (self, dt, t)
	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	local requested_screen_change_data = self._requested_screen_change_data

	if requested_screen_change_data then
		local screen_name = requested_screen_change_data.screen_name
		local sub_screen_name = requested_screen_change_data.sub_screen_name

		self:_change_screen_by_name(screen_name, sub_screen_name)

		self._requested_screen_change_data = nil
	end

	local is_sub_menu = true
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")
	local input_blocked = self:input_blocked()
	local input_service = (input_blocked and not gamepad_active and fake_input_service) or input_manager:get_service("character_selection_view")
	self._state_machine_params.input_service = input_service
	local transitioning = self:transitioning()

	self.ui_animator:update(dt)
	self.world_previewer:update(dt, t)

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	if not transitioning then
		self:_handle_mouse_input(dt, t, input_service)
		self:_handle_exit(dt, input_service)
	end

	self._machine:update(dt, t)
	self:draw(dt, input_service)
end

CharacterSelectionView.on_enter = function (self, menu_state_name, menu_sub_state_name)
	ShowCursorStack.push()

	local input_manager = self.input_manager

	input_manager:block_device_except_service("character_selection_view", "keyboard", 1)
	input_manager:block_device_except_service("character_selection_view", "mouse", 1)
	input_manager:block_device_except_service("character_selection_view", "gamepad", 1)

	local params = self._state_machine_params
	params.initial_state = true

	self:create_ui_elements()

	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)

	self:set_current_hero(profile_index)

	self.waiting_for_post_update_enter = true
	self._on_enter_transition = {
		menu_state_name = menu_state_name,
		menu_sub_state_name = menu_sub_state_name
	}

	if self:initial_profile_view() then
		self:hide_hero_panel()
	else
		self:show_hero_panel()
	end

	self:play_sound("hud_in_inventory_state_on")
	self:play_sound("play_gui_amb_hero_screen_loop_begin")

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local player_unit = local_player and local_player.player_unit

	if player_unit then
		local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

		if inventory_extension then
			inventory_extension:check_and_drop_pickups("enter_inventory")
		end
	end

	UISettings.hero_fullscreen_menu_on_enter()
end

CharacterSelectionView.set_current_hero = function (self, profile_index)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	self._hero_name = display_name
	local params = self._state_machine_params
	params.hero_name = display_name
	self._hero_name_text_widget.content.text = Localize(character_name)
	self._hero_level_text_widget.content.text = Localize(display_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local prestige = hero_attributes:get(display_name, "prestige")

	self:set_prestige_level(prestige)
end

CharacterSelectionView._get_sorted_players = function (self)
	local human_players = self.player_manager:human_players()
	local player_order = {}

	for _, player in pairs(human_players) do
		player_order[#player_order + 1] = player
	end

	table.sort(player_order, function (a, b)
		return a.local_player and not b.local_player
	end)

	return player_order
end

CharacterSelectionView.set_prestige_level = function (self, prestige)
	if prestige > 0 then
		self._hero_prestige_level_text_widget.content.text = "Prestige level: " .. prestige
	else
		self._hero_prestige_level_text_widget.content.text = ""
	end
end

CharacterSelectionView._handle_mouse_input = function (self, dt, t, input_service)
	return
end

CharacterSelectionView._is_selection_widget_pressed = function (self, widget)
	local content = widget.content
	local steps = content.steps

	for i = 1, steps, 1 do
		local hotspot_name = "hotspot_" .. i
		local hotspot = content[hotspot_name]

		if hotspot.on_release then
			return true, i
		end
	end
end

CharacterSelectionView.hotkey_allowed = function (self, input, mapping_data)
	if self:input_blocked() then
		return false
	end

	local transition_state = mapping_data.transition_state
	local transition_sub_state = mapping_data.transition_sub_state
	local state_machine = self._machine

	if state_machine then
		local current_state = state_machine:state()
		local current_state_name = current_state.NAME
		local current_screen_settings = self:_get_screen_settings_by_state_name(current_state_name)
		local name = current_screen_settings.name

		if name == transition_state then
			local active_sub_settings_name = current_state.active_settings_name and current_state:active_settings_name()

			if not transition_sub_state or transition_sub_state == active_sub_settings_name then
				return true
			elseif transition_sub_state then
				current_state:requested_screen_change_by_name(transition_sub_state)
			end
		elseif transition_state then
			self:requested_screen_change_by_name(transition_state, transition_sub_state)
		else
			return true
		end
	end

	return false
end

CharacterSelectionView._get_screen_settings_by_state_name = function (self, state_name)
	for index, screen_settings in ipairs(settings_by_screen) do
		if screen_settings.state_name == state_name then
			return screen_settings
		end
	end
end

CharacterSelectionView.requested_screen_change_by_name = function (self, screen_name, sub_screen_name)
	self._requested_screen_change_data = {
		screen_name = screen_name,
		sub_screen_name = sub_screen_name
	}
end

CharacterSelectionView._change_screen_by_name = function (self, screen_name, sub_screen_name)
	local settings, settings_index = nil

	for index, screen_settings in ipairs(settings_by_screen) do
		if screen_settings.name == screen_name then
			settings = screen_settings
			settings_index = index

			break
		end
	end

	assert(settings_index, "[CharacterSelectionView] - Could not find state by name %s", screen_name)

	self._title_widget.content.text = settings.display_name
	self._title_description_widget.content.text = settings.description
	local state_name = settings.state_name
	local state = rawget(_G, state_name)

	if self._machine and not sub_screen_name then
		self._wanted_state = state
	else
		self:_setup_state_machine(self._state_machine_params, state, sub_screen_name)
	end

	if settings.draw_background_world then
		self:show_hero_world()
	else
		self:hide_hero_world()
	end

	local camera_position = settings.camera_position

	if camera_position then
		self.world_previewer:set_camera_axis_offset("x", camera_position[1], 0.5, math.easeOutCubic)
		self.world_previewer:set_camera_axis_offset("y", camera_position[2], 0.5, math.easeOutCubic)
		self.world_previewer:set_camera_axis_offset("z", camera_position[3], 0.5, math.easeOutCubic)
	end

	local camera_rotation = settings.camera_rotation

	if camera_rotation then
		self.world_previewer:set_camera_rotation_axis_offset("x", camera_rotation[1], 0.5, math.easeOutCubic)
		self.world_previewer:set_camera_rotation_axis_offset("y", camera_rotation[2], 0.5, math.easeOutCubic)
		self.world_previewer:set_camera_rotation_axis_offset("z", camera_rotation[3], 0.5, math.easeOutCubic)
	end
end

CharacterSelectionView._change_screen_by_index = function (self, index)
	local screen_settings = settings_by_screen[index]
	local settings_name = screen_settings.name

	self:_change_screen_by_name(settings_name)
end

CharacterSelectionView.post_update_on_enter = function (self)
	assert(self.viewport_widget == nil)

	self.viewport_widget = UIWidget.init(widget_definitions.viewport)
	self.waiting_for_post_update_enter = nil

	self.world_previewer:on_enter(self.viewport_widget, self._hero_name)

	local on_enter_transition = self._on_enter_transition

	if on_enter_transition and on_enter_transition.menu_state_name then
		self:_change_screen_by_name(on_enter_transition.menu_state_name, on_enter_transition.menu_sub_state_name)

		self._on_enter_transition = nil
	else
		self:_change_screen_by_index(1)
	end
end

CharacterSelectionView.post_update_on_exit = function (self)
	self.world_previewer:prepare_exit()
	self.world_previewer:on_exit()

	if self.viewport_widget then
		UIWidget.destroy(self.ui_top_renderer, self.viewport_widget)

		self.viewport_widget = nil
	end
end

CharacterSelectionView.on_exit = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)
	ShowCursorStack.pop()

	self.exiting = nil

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	self:hide_hero_world()
	self:play_sound("hud_in_inventory_state_off")
	self:play_sound("play_gui_amb_hero_screen_loop_end")
	UISettings.hero_fullscreen_menu_on_exit()
end

CharacterSelectionView.exit = function (self, return_to_game)
	local exit_transition = (self:initial_profile_view() and "exit_initial_character_selection") or "exit_menu"

	self.ingame_ui:transition_with_fade(exit_transition)
	self:play_sound("Play_hud_button_close")

	self.exiting = true
end

CharacterSelectionView.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

CharacterSelectionView.suspend = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.suspended = true
	local viewport_name = "player_1"
	local world = Managers.world:world("level_world")
	local viewport = ScriptWorld.viewport(world, viewport_name)

	ScriptWorld.activate_viewport(world, viewport)

	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	ScriptWorld.deactivate_viewport(world, viewport)
end

CharacterSelectionView.unsuspend = function (self)
	self.input_manager:block_device_except_service("character_selection_view", "keyboard", 1)
	self.input_manager:block_device_except_service("character_selection_view", "mouse", 1)
	self.input_manager:block_device_except_service("character_selection_view", "gamepad", 1)

	self.suspended = nil

	if self.viewport_widget then
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)

		local previewer_pass_data = self.viewport_widget.element.pass_data[1]
		local viewport = previewer_pass_data.viewport
		local world = previewer_pass_data.world

		ScriptWorld.activate_viewport(world, viewport)
	end
end

CharacterSelectionView._handle_exit = function (self, dt, input_service)
	local initial_profile_view = self:initial_profile_view()
	local exit_button_widget = self._exit_button_widget

	UIWidgetUtils.animate_default_button(exit_button_widget, dt)

	if not initial_profile_view then
		if exit_button_widget.content.button_hotspot.on_hover_enter then
			self:play_sound("play_gui_start_menu_button_hover")
		end

		if exit_button_widget.content.button_hotspot.on_release or input_service:get("toggle_menu") then
			self:play_sound("play_gui_start_menu_button_click")
			self:close_menu(not self.exit_to_game)
		end
	end
end

CharacterSelectionView.close_menu = function (self, return_to_main_screen)
	local return_to_game = not return_to_main_screen

	self:exit(return_to_game)
end

CharacterSelectionView.destroy = function (self)
	if self.viewport_widget then
		UIWidget.destroy(self.ui_top_renderer, self.viewport_widget)

		self.viewport_widget = nil
	end

	self.ingame_ui_context = nil
	self.ui_animator = nil
	local viewport_name = "player_1"
	local world = Managers.world:world("level_world")
	local viewport = ScriptWorld.viewport(world, viewport_name)

	ScriptWorld.activate_viewport(world, viewport)

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end
end

CharacterSelectionView._is_button_pressed = function (self, widget)
	local button_hotspot = widget.content.button_hotspot

	if button_hotspot.on_release then
		button_hotspot.on_release = false

		return true
	end
end

return
