require("scripts/ui/views/level_end/level_end_view_base")
require("scripts/ui/views/level_end/states/end_view_state_summary")
require("scripts/ui/views/level_end/states/end_view_state_score")
require("scripts/ui/views/level_end/states/end_view_state_chest")
require("scripts/ui/reward_popup/reward_popup_ui")

for _, dlc in pairs(DLCSettings) do
	local files = dlc.end_view_state

	if files then
		for _, file in ipairs(files) do
			require(file)
		end
	end
end

local definitions = local_require("scripts/ui/views/level_end/level_end_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local generic_input_actions = definitions.generic_input_actions
local weave_widget_definitions = definitions.weave_widget_definitions
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
LevelEndView = class(LevelEndView, LevelEndViewBase)

LevelEndView.init = function (self, context)
	LevelEndView.super.init(self, context)

	self._weave_render_settings = {
		snap_pixel_positions = true
	}
end

LevelEndView.start = function (self)
	LevelEndView.super.start(self)
	self:play_sound("play_gui_chestroom_start")

	self._playing_music = nil
	self._start_music_event = (self.game_won and "Play_won_music") or "Play_lost_music"
	self._stop_music_event = (self.game_won and "Stop_won_music") or "Stop_lost_music"
end

LevelEndView.setup_pages = function (self, game_won, rewards)
	local index_by_state_name = nil

	if self._is_untrusted then
		index_by_state_name = self:_setup_pages_untrusted()
	elseif game_won then
		index_by_state_name = self:_setup_pages_victory(rewards)
	else
		index_by_state_name = self:_setup_pages_defeat()
	end

	return index_by_state_name
end

LevelEndView._setup_pages_untrusted = function (self)
	local index_by_state_name = {
		EndViewStateScore = 1
	}

	return index_by_state_name
end

LevelEndView._setup_pages_victory = function (self, rewards)
	local index_by_state_name = {}
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

	return index_by_state_name
end

LevelEndView._setup_pages_defeat = function (self)
	local index_by_state_name = {
		EndViewStateSummary = 1,
		EndViewStateScore = 2
	}

	return index_by_state_name
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

	local retry_button_def = UIWidgets.create_default_button("retry_button", scenegraph_definition.retry_button.size, nil, nil, Localize((self.game_won and "button_replay") or "button_retry"), 32, nil, nil, nil, true)
	self._retry_button_widget = UIWidget.init(retry_button_def)
	self._ready_button_widget = UIWidget.init(widget_definitions.ready_button)
	self._retry_checkboxes_widget = UIWidget.init(widget_definitions.retry_checkboxes)
	self._reload_checkboxes_widget = UIWidget.init(widget_definitions.reload_checkboxes)
	self._weave_widgets = {}

	for name, widget_definition in pairs(weave_widget_definitions) do
		self._weave_widgets[name] = UIWidget.init(widget_definition)
	end

	self._dead_space_filler_mask = UIWidget.init(widget_definitions.dead_space_filler_mask)
	self._dead_space_filler_unmask = UIWidget.init(widget_definitions.dead_space_filler_unmask)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	local input_service = self.input_manager:get_service("end_of_level")
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_renderer, input_service, 5, 10, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)

	self.active = true
	self._ready_button_widget.scenegraph_id = "ready_button_alone"
end

LevelEndView.draw_weave_widgets = function (self, dt, input_service)
	local is_weave = self.context.game_mode_key == "weave"
	local is_quickplay = self.context.is_quickplay

	if not is_weave or not is_quickplay then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self._weave_render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._dead_space_filler_mask)
	UIRenderer.draw_widget(ui_renderer, self._dead_space_filler_unmask)

	for _, widget in pairs(self._weave_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
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
	LevelEndView.super.update(self, dt, t)

	local input_service = self:input_service()

	self:draw_weave_widgets(dt, input_service)

	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	self:_update_animations(dt, t)
	self:draw(dt, input_service)
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

	if self:_is_button_pressed(self._ready_button_widget) and not button_pressed then
		self:play_sound("play_gui_mission_summary_button_return_to_keep_click")

		if self._left_lobby then
			self:exit_to_game()
		else
			self:signal_done(false)
		end

		button_pressed = true
	end

	if not button_pressed and self._cursor_visible then
		self:_update_gamepad_input(dt, t)
	end

	self:_poll_testify_requests()
end

LevelEndView._update_gamepad_input = function (self, dt, t)
	local input_service = self:input_service()
	local button_available = not self._ready_button_widget.content.button_hotspot.disable_button

	if button_available and (input_service:get("refresh") or Managers.invite:has_invitation()) then
		self:play_sound("play_gui_mission_summary_button_return_to_keep_click")

		if self._left_lobby then
			self:exit_to_game()
		else
			self:signal_done(false)
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

LevelEndView.destroy = function (self)
	LevelEndView.super.destroy(self)
end

LevelEndView._start_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._dynamic_widgets

	return self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end

LevelEndView.active_input_service = function (self)
	return (self.input_blocked and fake_input_service) or self:input_service()
end

LevelEndView._retry_level = function (self)
	if self.is_server then
		self:signal_done(true)
	else
		self:signal_done(true)

		self._retry_button_widget.content.button_hotspot.disabled = true
	end
end

LevelEndView.signal_done = function (self, do_reload)
	LevelEndView.super.signal_done(self, do_reload)

	if self._signaled_done then
		return
	end

	self._ready_button_widget.content.button_hotspot.disable_button = true
	self._retry_button_widget.content.button_hotspot.disable_button = true
end

LevelEndView.peer_signaled_done = function (self, peer_id, do_reload)
	LevelEndView.super.peer_signaled_done(self, peer_id, do_reload)

	local widget_content = nil

	if do_reload then
		widget_content = self._retry_checkboxes_widget.content
	else
		widget_content = self._reload_checkboxes_widget.content
	end

	widget_content.votes = widget_content.votes + 1
end

LevelEndView._set_end_timer = function (self, time)
	local widget = self._dynamic_widgets.timer_text
	time = math.ceil(time)
	local time_text = string.format("%02d:%02d", math.floor(time / 60), time % 60)
	widget.content.text = string.format(Localize("timer_prefix_time_left") .. ": %s", time_text)
end

LevelEndView.update_force_shutdown = function (self, dt)
	self._force_shutdown_timer = math.max(0, self._force_shutdown_timer - dt)

	self:_set_end_timer(self._force_shutdown_timer)

	if self._force_shutdown_timer == 0 and not self._signaled_done then
		self:signal_done(false)

		self._signaled_done = true
		self._ready_button_widget.content.button_hotspot.disable_button = true
		self._retry_button_widget.content.button_hotspot.disable_button = true
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
			self:exit_to_game()
		end
	end

	if self._started_exit then
		self._started_force_shutdown = false
	end
end

local level_name = "levels/end_screen/world"

LevelEndView._setup_camera = function (self)
	local camera_pose = nil
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

LevelEndView.spawn_level = function (self, context, world)
	local game_won = context.game_won
	local object_set = (game_won and "flow_victory") or "flow_defeat"
	local object_sets = {
		object_set
	}
	local level = ScriptWorld.load_level(world, level_name, object_sets, nil, nil, nil)

	Level.spawn_background(level)

	return level
end

LevelEndView._push_mouse_cursor = function (self)
	if not self._cursor_visible then
		ShowCursorStack.push()

		self._cursor_visible = true

		self:_start_animation("ready_button_entry_alone")
	end
end

LevelEndView.input_enabled = function (self)
	return not self._ready_button_widget.content.button_hotspot.disable_button
end

LevelEndView._poll_testify_requests = function (self)
	if Testify:poll_request("close_level_end_screen") then
		self:exit_to_game()
		Testify:respond_to_request("close_level_end_screen")
	end
end

return
