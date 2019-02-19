require("scripts/ui/views/level_end/states/end_view_state_summary")
require("scripts/ui/views/level_end/states/end_view_state_score")
require("scripts/ui/views/level_end/states/end_view_state_chest")
require("scripts/ui/reward_popup/reward_popup_ui")

local definitions = local_require("scripts/ui/views/level_end/level_end_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local generic_input_actions = definitions.generic_input_actions
local debug_draw_scenegraph = false
local debug_menu = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local RPCS = {
	"rpc_signal_end_of_level_done"
}
LevelEndView = class(LevelEndView)

LevelEndView.init = function (self, context)
	local game_won = context.game_won
	local rewards = context.rewards
	self.game_won = game_won
	self.game_mode_key = context.game_mode_key
	self._world = context.world
	self._world_viewport = context.world_viewport
	self.player_manager = context.player_manager
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self.ingame_ui = context.ingame_ui
	self.profile_synchronizer = context.profile_synchronizer
	self.peer_id = context.peer_id
	self.local_player_id = context.local_player_id
	self.rewards = rewards
	self.context = context
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self._lobby = context.lobby
	self.is_server = context.is_server
	local is_untrusted = script_data["eac-untrusted"]
	self._is_untrusted = is_untrusted

	if not is_untrusted then
		self.level_up_rewards = self:_get_level_up_rewards()
		self.deed_rewards = self:_get_deed_rewards()
		self.keep_decoration_rewards = self:_get_keep_decoration_rewards()
		self.event_rewards = self:_get_event_rewards()
	end

	local world = context.world
	self.wwise_world = Managers.world:wwise_world(world)
	context.wwise_world = self.wwise_world
	local input_manager = context.input_manager
	self.input_manager = input_manager
	self._reward_presentation_queue = {}
	self.reward_popup = RewardPopupUI:new(context)
	local index_by_state_name, state_name_by_index = self:_setup_pages(game_won, rewards)
	self._index_by_state_name = index_by_state_name
	self._state_name_by_index = state_name_by_index

	self:create_ui_elements()

	self._state_machine_params = {
		parent = self,
		context = context,
		game_won = game_won,
		game_mode_key = self.game_mode_key
	}

	self:_setup_camera()

	self._done_peers = {}
	self.waiting_to_start = true
	self._wants_to_exit_to_game = nil
	self._started_exit = nil

	if self._lobby == nil then
		self:left_lobby()
	end
end

LevelEndView.register_rpcs = function (self, network_event_delegate)
	self._registered_rpcs = true

	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
end

LevelEndView.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._registered_rpcs = false
end

LevelEndView._request_state_change = function (self, state_name)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()
	local current_state_name = current_state.NAME
	local direction = nil
	local new_state_index = self._index_by_state_name[state_name]
	local current_state_index = self._index_by_state_name[current_state_name]

	if current_state_index < new_state_index then
		direction = "left"
	else
		direction = "right"
	end

	current_state:exit(direction)

	self._new_state_name = state_name
end

LevelEndView._handle_state_exit = function (self)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()

	if current_state:exit_done() then
		self:_setup_state_machine(self._new_state_name)

		self._new_state_name = nil
	end
end

LevelEndView._setup_state_machine = function (self, optional_start_state_name, initial)
	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	local state_name = optional_start_state_name or "EndViewStateSummary"
	local state_index = self._index_by_state_name[state_name]
	local start_state = rawget(_G, state_name)
	local profiling_debugging_enabled = false
	local state_machine_params = self._state_machine_params
	state_machine_params.initial_state = initial
	local direction = nil

	if not initial then
		local previous_state_name = self._current_state_name
		local previous_state_index = self._index_by_state_name[previous_state_name]

		if previous_state_index < state_index then
			direction = "left"
		else
			direction = "right"
		end
	end

	state_machine_params.direction = direction
	self._current_state_name = state_name
	self._machine = StateMachine:new(self, start_state, state_machine_params, profiling_debugging_enabled)
end

LevelEndView.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager

	if self.reward_popup then
		self.reward_popup:set_input_manager(input_manager)
	end

	local state = self._machine:state()

	state:set_input_manager(input_manager)
end

LevelEndView.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

LevelEndView.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

LevelEndView.start = function (self)
	self:_activate_viewport()

	self.waiting_to_start = nil
	self.state_auto_change = true

	self:_proceed_to_next_auto_state(1, #self._state_name_by_index)
	self:play_sound("play_gui_chestroom_start")

	self._playing_music = nil
	self._start_music_event = (self.game_won and "Play_won_music") or "Play_lost_music"
	self._stop_music_event = (self.game_won and "Stop_won_music") or "Stop_lost_music"
end

LevelEndView.on_enter = function (self)
	return
end

LevelEndView.on_exit = function (self)
	if not self._is_untrusted then
		local difficulty_key = Managers.state.difficulty:get_difficulty()
		local chest_settings = LootChestData.chests_by_category[difficulty_key]
		local chests_package_name = chest_settings.package_name

		Managers.package:unload(chests_package_name, "global")
	end
end

LevelEndView._get_level_up_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local items_by_level = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "level_up_reward") == 1 then
			local data = string.split(reward_name, ";")
			local level = tonumber(data[2])
			local index = tonumber(data[3])

			if not items_by_level[level] then
				items_by_level[level] = {}
			end

			items_by_level[level][index] = item
		end
	end

	return items_by_level
end

LevelEndView._get_deed_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local deed_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "deed_reward") == 1 then
			deed_rewards[#deed_rewards + 1] = item
		end
	end

	return deed_rewards
end

LevelEndView._get_event_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local event_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "event_reward") == 1 then
			event_rewards[#event_rewards + 1] = item
		end
	end

	return event_rewards
end

LevelEndView._get_keep_decoration_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local keep_decoration_rewards = {}

	for reward_name, item in pairs(end_of_level_rewards) do
		if string.find(reward_name, "keep_decoration_painting") == 1 then
			keep_decoration_rewards[#keep_decoration_rewards + 1] = item
		end
	end

	return keep_decoration_rewards
end

LevelEndView._set_end_timer = function (self, time)
	local widget = self._dynamic_widgets.timer_text
	time = math.ceil(time)
	local time_text = string.format("%02d:%02d", math.floor(time / 60), time % 60)
	widget.content.text = string.format(Localize("timer_prefix_time_left") .. ": %s", time_text)
end

LevelEndView._update_end_level_vote = function (self, dt)
	local voting_manager = Managers.state.voting
	local can_vote = not self._voted and voting_manager:vote_in_progress()
	self._ready_button_widget.content.button_hotspot.disable_button = not can_vote

	if not can_vote then
		self._retry_button_widget.content.button_hotspot.disable_button = true
	end

	local vote_time_left = voting_manager:vote_time_left()

	if vote_time_left then
		self:_set_end_timer(vote_time_left)
	end
end

LevelEndView._vote_to_leave_game = function (self)
	local voting_manager = Managers.state.voting

	voting_manager:vote(1)

	self._voted = true
end

LevelEndView._exit_to_game = function (self)
	self:play_sound(self._stop_music_event)

	self._exit_timer = 2
	self._started_exit = true
end

LevelEndView.done = function (self)
	return self._wants_to_exit_to_game
end

LevelEndView._push_mouse_cursor = function (self)
	if not self._cursor_visible then
		ShowCursorStack.push()

		self._cursor_visible = true

		self:_start_animation("ready_button_entry")
	end
end

LevelEndView._pop_mouse_cursor = function (self)
	if self._cursor_visible then
		ShowCursorStack.pop()

		self._cursor_visible = nil
	end
end

LevelEndView._setup_pages = function (self, game_won, rewards)
	local index_by_state_name = nil

	if self._is_untrusted then
		index_by_state_name = {
			EndViewStateScore = 1
		}
	elseif game_won then
		local end_of_level_rewards = rewards.end_of_level_rewards
		local chest = end_of_level_rewards.chest

		if chest then
			index_by_state_name = {
				EndViewStateChest = 2,
				EndViewStateScore = 3,
				EndViewStateSummary = 1
			}
		else
			index_by_state_name = {
				EndViewStateSummary = 1,
				EndViewStateScore = 2
			}
		end
	else
		index_by_state_name = {
			EndViewStateSummary = 1,
			EndViewStateScore = 2
		}
	end

	local state_name_by_index = {}

	for state_name, index in pairs(index_by_state_name) do
		state_name_by_index[index] = state_name
	end

	return index_by_state_name, state_name_by_index
end

LevelEndView.create_ui_elements = function (self)
	self.ui_animations = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._static_widgets = {}
	self._dynamic_widgets = {
		timer_text = UIWidget.init(widget_definitions.timer_text),
		timer_bg = UIWidget.init(widget_definitions.timer_bg)
	}

	if debug_menu then
		self._page_selector_widget = UIWidget.init(UIWidgets.create_page_dot_selector("page_selector", #self._state_name_by_index))
	end

	self._retry_button_widget = UIWidget.init(widget_definitions.retry_button)
	self._ready_button_widget = UIWidget.init(widget_definitions.ready_button)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	local input_service = self.input_manager:get_service("end_of_level")
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_renderer, input_service, 5, 10, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)

	self.active = true

	if self.game_won then
		self._ready_button_widget.scenegraph_id = "ready_button_alone"
	end
end

LevelEndView._activate_viewport = function (self)
	local world, viewport = self:get_viewport_world()

	ScriptWorld.activate_viewport(world, viewport)
end

LevelEndView._setup_camera = function (self)
	local camera_pose = nil
	local level_name = "levels/end_screen/world"
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == "end_screen_camera" then
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)
			camera_pose = Matrix4x4Box(pose)

			print("Found camera: " .. name)
		end
	end

	self._camera_pose = camera_pose

	self:_position_camera()
end

LevelEndView.get_world_link_unit = function (self)
	local level_name = "levels/end_screen/world"
	local world = self:get_viewport_world()
	local level = ScriptWorld.level(world, level_name)

	if level then
		local units = Level.units(level)

		for i, level_unit in ipairs(units) do
			local unit_name = Unit.get_data(level_unit, "name")

			if unit_name and unit_name == "loot_chest_spawn" then
				return level_unit
			end
		end
	end
end

LevelEndView.get_viewport_world = function (self)
	return self._world, self._world_viewport
end

local cam_shake_settings = {
	persistance = 1,
	fade_out = 0.5,
	amplitude = 0.9,
	seed = 0,
	duration = 0.5,
	fade_in = 0.1,
	octaves = 7
}

LevelEndView.add_camera_shake = function (self, settings, start_time, scale)
	local data = {}
	local current_rot = self:get_camera_rotation()
	local settings = settings or cam_shake_settings
	local duration = settings.duration
	local fade_in = settings.fade_in
	local fade_out = settings.fade_out
	duration = (duration or 0) + (fade_in or 0) + (fade_out or 0)
	data.shake_settings = settings
	data.start_time = start_time
	data.end_time = duration and start_time + duration
	data.fade_in_time = fade_in and start_time + fade_in
	data.fade_out_time = fade_out and data.end_time - fade_out
	data.seed = settings.seed or Math.random(1, 100)
	data.scale = scale or 1
	data.camera_rotation_boxed = QuaternionBox(current_rot)
	self._active_camera_shakes = {
		[data] = true
	}
end

LevelEndView._apply_shake_event = function (self, settings, t)
	local active_camera_shakes = self._active_camera_shakes
	local start_time = settings.start_time
	local end_time = settings.end_time
	local fade_in_time = settings.fade_in_time
	local fade_out_time = settings.fade_out_time

	if fade_in_time and t <= fade_in_time then
		settings.fade_progress = math.clamp((t - start_time) / (fade_in_time - start_time), 0, 1)
	elseif fade_out_time and fade_out_time <= t then
		settings.fade_progress = math.clamp((end_time - t) / (end_time - fade_out_time), 0, 1)
	end

	local pitch_noise_value = self:_calculate_perlin_value(t - settings.start_time, settings) * settings.scale
	local yaw_noise_value = self:_calculate_perlin_value(t - settings.start_time + 10, settings) * settings.scale
	local starting_rotation = settings.camera_rotation_boxed:unbox()
	local deg_to_rad = math.pi / 180
	local yaw_offset = Quaternion(Vector3.up(), yaw_noise_value * deg_to_rad)
	local pitch_offset = Quaternion(Vector3.right(), pitch_noise_value * deg_to_rad)
	local total_offset = Quaternion.multiply(yaw_offset, pitch_offset)
	local rotation = Quaternion.multiply(starting_rotation, total_offset)

	self:set_camera_rotation(rotation)

	if settings.end_time and settings.end_time <= t then
		active_camera_shakes[settings] = nil
	end
end

LevelEndView._calculate_perlin_value = function (self, x, settings)
	local total = 0
	local shake_settings = settings.shake_settings
	local persistance = shake_settings.persistance
	local number_of_octaves = shake_settings.octaves

	for i = 0, number_of_octaves, 1 do
		local frequency = 2^i
		local amplitude = persistance^i
		total = total + self:_interpolated_noise(x * frequency, settings) * amplitude
	end

	local amplitude_multiplier = shake_settings.amplitude or 1
	local fade_multiplier = settings.fade_progress or 1
	total = total * amplitude_multiplier * fade_multiplier

	return total
end

LevelEndView._interpolated_noise = function (self, x, settings)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = self:_smoothed_noise(x_floored, settings)
	local v2 = self:_smoothed_noise(x_floored + 1, settings)

	return math.lerp(v1, v2, remainder)
end

LevelEndView._smoothed_noise = function (self, x, settings)
	return self:_noise(x, settings) / 2 + self:_noise(x - 1, settings) / 4 + self:_noise(x + 1, settings) / 4
end

LevelEndView._noise = function (self, x, settings)
	local next_seed, _ = Math.next_random(x + settings.seed)
	local _, value = Math.next_random(next_seed)

	return value * 2 - 1
end

LevelEndView.set_camera_position = function (self, position)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_position(camera, position)
end

LevelEndView.set_camera_rotation = function (self, rotation)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_rotation(camera, rotation)
end

LevelEndView.get_camera_position = function (self)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

LevelEndView.get_camera_rotation = function (self)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.rotation(camera)
end

LevelEndView._position_camera = function (self, optional_pose)
	local world, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)
	local camera_pose = optional_pose or self._camera_pose:unbox()

	if camera_pose then
		local fov = 65

		Camera.set_vertical_fov(camera, (math.pi * fov) / 180)
		ScriptCamera.set_local_pose(camera, camera_pose)
		ScriptCamera.force_update(world, camera)
	end
end

LevelEndView.set_camera_zoom = function (self, progress)
	local camera_pose = self._camera_pose:unbox()
	local translation = Matrix4x4.translation(camera_pose)
	local rotation = Matrix4x4.rotation(camera_pose)
	local max_distance = 0.5
	local distance = max_distance * progress
	local dir = Quaternion.forward(rotation)
	local position = translation + dir * distance

	self:set_camera_position(position)
end

LevelEndView._setup_viewport_camera = function (self)
	local world, viewport = self:get_viewport_world()
	local level_camera_unit = World.unit_by_name(world, "camera")
	local level_camera_rot = Unit.world_rotation(level_camera_unit, 0)
	local level_camera_pos = Unit.world_position(level_camera_unit, 0)
	local level_camera_look = Quaternion.forward(level_camera_rot)
	level_camera_pos = level_camera_pos - level_camera_look * 3
	local viewport_camera = ScriptViewport.camera(viewport)

	ScriptCamera.set_local_rotation(viewport_camera, level_camera_rot)
	ScriptCamera.set_local_position(viewport_camera, level_camera_pos)
end

LevelEndView.draw = function (self, dt, input_service)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")
	local waiting_to_start = self.waiting_to_start
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if debug_draw_scenegraph then
		UISceneGraph.debug_render_scenegraph(ui_renderer, ui_scenegraph)
	end

	for _, widget in ipairs(self._static_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._page_selector_widget then
		UIRenderer.draw_widget(ui_renderer, self._page_selector_widget)
	end

	if self._started_force_shutdown then
		for name, widget in pairs(self._dynamic_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	if self._cursor_visible then
		UIRenderer.draw_widget(ui_renderer, self._ready_button_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if self._cursor_visible and gamepad_active then
		local ready_available = not self._ready_button_widget.content.button_hotspot.disable_button

		if ready_available then
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

LevelEndView.update = function (self, dt, t)
	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	local active_camera_shakes = self._active_camera_shakes

	if active_camera_shakes then
		for settings, _ in pairs(active_camera_shakes) do
			self:_apply_shake_event(settings, t)
		end
	end

	local input_service = self:input_service()

	if self.active then
		if self._started_force_shutdown then
			self:_update_force_shutdown(dt)
		end

		if self._started_exit then
			self:_update_exit(dt)
		end

		self:_update_animations(dt, t)
		self:draw(dt, input_service)

		if self.reward_popup then
			self.reward_popup:update(dt)
		end

		self:_handle_queued_presentations()

		if self._machine then
			self._machine:update(dt, t)

			if self._new_state_name then
				self:_handle_state_exit()
			elseif self.state_auto_change then
				self:_handle_state_auto_change()
			elseif self._page_selector_widget then
				local index = self:_is_page_selector_pressed()

				if index then
					local state_name = self._state_name_by_index[index]

					self:_request_state_change(state_name)
				end
			end
		end
	end

	UIWidgetUtils.animate_default_button(self._retry_button_widget, dt)
	UIWidgetUtils.animate_default_button(self._ready_button_widget, dt)

	if not self._playing_music then
		self._playing_music = true

		self:play_sound(self._start_music_event)
	end

	local button_pressed = false

	if self:_is_button_hover_enter(self._retry_button_widget) or self:_is_button_hover_enter(self._ready_button_widget) then
		self:play_sound("play_gui_start_menu_button_hover")
	end

	if self:_is_button_pressed(self._retry_button_widget) and not button_pressed then
		self:_retry_level()

		button_pressed = true
	end

	if self:_is_button_pressed(self._ready_button_widget) and not button_pressed then
		self:play_sound("play_gui_mission_summary_button_return_to_keep_click")

		if self._left_lobby then
			self:_exit_to_game()
		else
			self:_signal_done()
		end

		button_pressed = true
	end

	if not button_pressed and self._cursor_visible then
		self:_update_gamepad_input(dt, t)
	end
end

LevelEndView._update_gamepad_input = function (self, dt, t)
	local input_service = self:input_service()
	local button_available = not self._ready_button_widget.content.button_hotspot.disable_button

	if button_available and (input_service:get("refresh") or Managers.invite:has_invitation()) then
		self:play_sound("play_gui_mission_summary_button_return_to_keep_click")

		if self._left_lobby then
			self:_exit_to_game()
		else
			self:_signal_done()
		end
	end
end

LevelEndView.input_enabled = function (self)
	return not self._ready_button_widget.content.button_hotspot.disable_button
end

LevelEndView.set_input_description = function (self, input_desc)
	local input_desc = definitions.generic_input_actions[input_desc]

	self._menu_input_description:set_input_description(input_desc)
end

LevelEndView._handle_state_auto_change = function (self)
	local state_machine = self._machine

	if not state_machine then
		return
	end

	local current_state = state_machine:state()
	local state_name = current_state.NAME
	local state_name_by_index = self._state_name_by_index
	local index_by_state_name = self._index_by_state_name
	local current_state_index = index_by_state_name[state_name]
	local num_states = #state_name_by_index

	if self._next_auto_state_index then
		if current_state:exit_done() then
			self:_proceed_to_next_auto_state(self._next_auto_state_index, num_states)
		end
	else
		local new_state_index = nil
		local displaying_reward_presentation = self:displaying_reward_presentation()

		if not displaying_reward_presentation then
			if current_state_index < num_states and current_state:done() then
				new_state_index = current_state_index + 1
			end

			if new_state_index then
				current_state:exit()

				self._next_auto_state_index = new_state_index
			end
		end
	end
end

LevelEndView._proceed_to_next_auto_state = function (self, index, num_states)
	local new_state = self._state_name_by_index[index]

	self:_setup_state_machine(new_state, true)

	if index == num_states then
		self.state_auto_change = false

		self:_push_mouse_cursor()
	end

	self._next_auto_state_index = nil
end

LevelEndView._update_animations = function (self, dt, t)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end
end

LevelEndView.transitioning = function (self)
	if self.exiting then
		return true
	else
		return not self.active
	end
end

LevelEndView.left_lobby = function (self)
	self._left_lobby = true
	self._lobby = nil

	if self._done_peers[Network.peer_id()] then
		self:_exit_to_game()
	end
end

LevelEndView.destroy = function (self)
	if self._registered_rpcs then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	self.ui_animator = nil

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	if self.reward_popup then
		self.reward_popup:destroy()

		self.reward_popup = nil
	end

	self:_pop_mouse_cursor()
	self:play_sound("play_gui_chestroom_stop")
	self:play_sound("unmute_all_world_sounds")
end

LevelEndView.input_service = function (self)
	return (self:displaying_reward_presentation() and fake_input_service) or self.input_manager:get_service("end_of_level")
end

LevelEndView.menu_input_service = function (self)
	return (self.input_blocked and fake_input_service) or self:input_service()
end

LevelEndView.set_input_blocked = function (self, blocked)
	self.input_blocked = blocked
end

LevelEndView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

LevelEndView._is_button_pressed = function (self, widget)
	local button_hotspot = widget.content.button_hotspot

	if button_hotspot.on_release then
		button_hotspot.on_release = nil

		return true
	end
end

LevelEndView._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

LevelEndView._is_page_selector_pressed = function (self)
	local widget = self._page_selector_widget
	local content = widget.content
	local amount = content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot = content[hotspot_name]

		if hotspot.on_release and not hotspot.is_selected then
			return i
		end
	end
end

LevelEndView._set_page_selector_selection = function (self, index)
	local widget = self._page_selector_widget
	local content = widget.content
	local amount = content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot = content[hotspot_name]
		hotspot.is_selected = index == i
	end
end

LevelEndView._start_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._dynamic_widgets

	return self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end

LevelEndView.enable_chat = function (self)
	return true
end

LevelEndView.active_input_service = function (self)
	return (self.input_blocked and fake_input_service) or self:input_service()
end

LevelEndView._retry_level = function (self)
	if self.is_server then
		Managers.state.game_mode:retry_level()
	else
		self._retry_button_widget.content.button_hotspot.disabled = true
	end
end

LevelEndView._signal_done = function (self)
	if not self._left_lobby then
		if self.is_server then
			local lobby = self._lobby
			local lobby_members = lobby:members()

			if lobby_members then
				local members = lobby_members:get_members()
				local own_peer_id = Network.peer_id()

				for i, peer_id in ipairs(members) do
					if peer_id ~= own_peer_id then
						RPC.rpc_signal_end_of_level_done(peer_id)
					end
				end
			end
		else
			local lobby = self._lobby
			local host = lobby:lobby_host()

			RPC.rpc_signal_end_of_level_done(host)
		end
	end

	self._ready_button_widget.content.button_hotspot.disable_button = true

	self:_peer_signaled_done(Network.peer_id())
end

LevelEndView._peer_signaled_done = function (self, peer_id)
	if not self._started_force_shutdown then
		self:_start_force_shutdown()
	end

	self._done_peers[peer_id] = true
end

LevelEndView._start_force_shutdown = function (self)
	self._started_force_shutdown = true
	self._force_shutdown_timer = 10
end

LevelEndView._update_force_shutdown = function (self, dt)
	self._force_shutdown_timer = math.max(0, self._force_shutdown_timer - dt)

	self:_set_end_timer(self._force_shutdown_timer)

	if self._force_shutdown_timer == 0 then
		self:_exit_to_game()
	elseif not self._left_lobby then
		local all_done = true
		local lobby_members = self._lobby:members()

		if lobby_members then
			local members = self._lobby:members():get_members()

			for i, peer_id in ipairs(members) do
				if not self._done_peers[peer_id] then
					all_done = false

					break
				end
			end
		end

		if all_done then
			self:_exit_to_game()
		end
	end

	if self._started_exit then
		self._started_force_shutdown = false
	end
end

LevelEndView._update_exit = function (self, dt)
	self._exit_timer = math.max(0, self._exit_timer - dt)

	if self._exit_timer == 0 then
		self._started_exit = false
		self._wants_to_exit_to_game = true
	end
end

LevelEndView._present_reward = function (self, data)
	local reward_popup = self.reward_popup

	if self:displaying_reward_presentation() then
		local reward_presentation_queue = self._reward_presentation_queue
		reward_presentation_queue[#reward_presentation_queue + 1] = data
	else
		reward_popup:display_presentation(data)
	end
end

LevelEndView._handle_queued_presentations = function (self)
	if self:_is_reward_presentation_complete() or (#self._reward_presentation_queue == 0 and not self:displaying_reward_presentation()) then
		local reward_presentation_queue = self._reward_presentation_queue
		local num_queued_rewards = #reward_presentation_queue

		if num_queued_rewards > 0 then
			local next_reward = table.remove(reward_presentation_queue, 1)

			self:_present_reward(next_reward)
		else
			self._reward_presentation_done = true
		end
	end
end

LevelEndView.displaying_reward_presentation = function (self)
	return self.reward_popup:is_presentation_active()
end

LevelEndView._is_reward_presentation_complete = function (self)
	return self.reward_popup:is_presentation_complete()
end

LevelEndView.reward_presentation_done = function (self)
	return self._reward_presentation_done
end

LevelEndView.present_level_up = function (self, hero_name, hero_level)
	local level_unlocks = ProgressionUnlocks.get_level_unlocks(hero_level, hero_name)
	local level_up_rewards = self.level_up_rewards[hero_level]
	local has_level_up_unlocks = level_unlocks and #level_unlocks > 0
	local has_level_up_rewards = level_up_rewards and #level_up_rewards > 0
	local presentation_data = nil

	if has_level_up_rewards or has_level_up_unlocks then
		presentation_data = {}
	end

	if has_level_up_unlocks then
		for index, template in ipairs(level_unlocks) do
			local entry = {}
			local title = template.title
			local description = template.description

			if title and description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = {
						Localize(title),
						Localize(description)
					}
				}
			elseif title then
				entry[#entry + 1] = {
					widget_type = "title",
					value = Localize(title)
				}
			elseif description then
				entry[#entry + 1] = {
					widget_type = "title",
					value = Localize(description)
				}
			end

			entry[#entry + 1] = {
				value = template.value,
				widget_type = template.unlock_type
			}
			presentation_data[#presentation_data + 1] = entry
		end
	end

	if has_level_up_rewards then
		local item_interface = Managers.backend:get_interface("items")

		for index, item in ipairs(level_up_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			if item_type == "loot_chest" then
				description[1] = Localize(display_name)
				description[2] = Localize("end_screen_chest_received")
			else
				description[1] = Localize(item_type)
				description[2] = Localize("reward_weapon")
			end

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item
			}
			presentation_data[#presentation_data + 1] = entry
		end
	end

	if presentation_data then
		self:_present_reward(presentation_data)
	end
end

LevelEndView.present_additional_rewards = function (self)
	local deed_rewards = self.deed_rewards
	local num_deed_rewards = #deed_rewards
	local item_interface = Managers.backend:get_interface("items")

	if num_deed_rewards > 0 then
		local presentation_data = {
			{
				{
					widget_type = "title",
					value = Localize("deed_completed_title")
				}
			}
		}

		for _, item in ipairs(deed_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			if item_type == "loot_chest" then
				description[1] = Localize(display_name)
				description[2] = Localize("end_screen_chest_received")
			else
				description[1] = Localize(item_type)
				description[2] = Localize("reward_weapon")
			end

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end

	local keep_decoration_rewards = self.keep_decoration_rewards
	local num_keep_decoration_rewards = #keep_decoration_rewards

	if num_keep_decoration_rewards > 0 then
		local presentation_data = {}

		for _, item in ipairs(keep_decoration_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local item_data = item_interface:get_item_masterlist_data(backend_id)
			local item_type = item_data.item_type
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)

			if item_type == "keep_decoration_painting" then
				description[1] = Localize(display_name)
				description[2] = Localize("keep_decoration_painting_recieved")
			end

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end

	local event_rewards = self.event_rewards
	local num_event_rewards = #event_rewards

	if num_event_rewards > 0 then
		local presentation_data = {}

		for _, item in ipairs(event_rewards) do
			local entry = {}
			local backend_id = item.backend_id
			local reward_item = item_interface:get_item_from_id(backend_id)
			local description = {}
			local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)
			description[1] = Localize(display_name)
			description[2] = Localize("end_screen_you_received")

			if description then
				entry[#entry + 1] = {
					widget_type = "description",
					value = description
				}
			end

			entry[#entry + 1] = {
				widget_type = "item",
				value = item
			}
			presentation_data[#presentation_data + 1] = entry
		end

		self:_present_reward(presentation_data)
	end
end

LevelEndView.present_chest_rewards = function (self)
	local end_of_level_rewards = self.context.rewards.end_of_level_rewards
	local item_interface = Managers.backend:get_interface("items")
	local chest = end_of_level_rewards.chest

	if chest then
		local backend_id = chest.backend_id
		local reward_item = item_interface:get_item_from_id(backend_id)
		local item_data = item_interface:get_item_masterlist_data(backend_id)
		local _, display_name, _ = UIUtils.get_ui_information_from_item(reward_item)
		local item_name = item_data.name
		local presentation_data = {
			{
				{
					widget_type = "description",
					value = {
						Localize(display_name),
						Localize("end_screen_chest_received")
					}
				},
				{
					widget_type = "loot_chest",
					value = item_name
				}
			}
		}

		self:_present_reward(presentation_data)
	end

	local bonus_chest = end_of_level_rewards.bonus_chest

	if bonus_chest then
		local backend_id = bonus_chest.backend_id
		local item_data = item_interface:get_item_masterlist_data(backend_id)
		local item_name = item_data.name
		local presentation_data = {
			{
				{
					widget_type = "title",
					value = Localize("end_screen_quick_play_bonus")
				}
			},
			{
				{
					widget_type = "title",
					value = Localize("end_screen_you_received")
				},
				{
					widget_type = "loot_chest",
					value = item_name
				}
			}
		}

		self:_present_reward(presentation_data)
	end
end

LevelEndView.rpc_signal_end_of_level_done = function (self, sender)
	if self.is_server then
		local lobby = self._lobby
		local members = lobby:members():get_members()
		local my_peer_id = Network.peer_id()

		for i, peer_id in ipairs(members) do
			if peer_id ~= sender and peer_id ~= my_peer_id then
				RPC.rpc_signal_end_of_level_done(peer_id)
			end
		end
	end

	self:_peer_signaled_done(sender)
end

return
