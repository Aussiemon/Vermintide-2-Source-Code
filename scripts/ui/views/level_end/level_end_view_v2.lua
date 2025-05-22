-- chunkname: @scripts/ui/views/level_end/level_end_view_v2.lua

require("scripts/ui/views/level_end/level_end_view_base")
require("scripts/ui/views/level_end/states/end_view_state_parading")
require("scripts/ui/views/level_end/states/end_view_state_summary")
require("scripts/ui/views/level_end/states/end_view_state_score")
require("scripts/ui/views/level_end/states/end_view_state_chest")
require("scripts/ui/reward_popup/reward_popup_ui")

local definitions = local_require("scripts/ui/views/level_end/level_end_view_v2_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local generic_input_actions = definitions.generic_input_actions
local weave_widget_definitions = definitions.weave_widget_definitions
local debug_draw_scenegraph = false
local debug_menu = false
local level_end_view_testify = script_data.testify and require("scripts/ui/views/level_end/level_end_view_testify")
local unit_x = 0.07
local unit_x_seperation = 1.36
local unit_y = -1.5
local unit_y_seperation = 0.15
local unit_z = 0
local hero_locations = {
	{
		{
			unit_x,
			unit_y,
			unit_z,
		},
	},
	{
		{
			unit_x + unit_x_seperation * 0.5,
			unit_y + unit_y_seperation * 0.5,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * -0.5,
			unit_y + unit_y_seperation * -0.5,
			unit_z,
		},
	},
	{
		{
			unit_x + unit_x_seperation * 1,
			unit_y + unit_y_seperation * 1,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * 0,
			unit_y + unit_y_seperation * 0,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * -1,
			unit_y + unit_y_seperation * -1,
			unit_z,
		},
	},
	{
		{
			unit_x + unit_x_seperation * 1,
			unit_y + unit_y_seperation * 1.5,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * 0.25,
			unit_y + unit_y_seperation * 0.25 + 0.5,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * -0.25,
			unit_y + unit_y_seperation * -0.25 + 0.5,
			unit_z,
		},
		{
			unit_x + unit_x_seperation * -1,
			unit_y + unit_y_seperation * -1.5,
			unit_z,
		},
	},
}

LevelEndView = class(LevelEndView, LevelEndViewBase)

LevelEndView.init = function (self, context)
	self._weave_render_settings = {
		snap_pixel_positions = true,
	}
	self._team_heroes = {}
	self._team_previewer = nil

	local peers_with_score = {}

	if context.players_session_score then
		for peer_id in pairs(context.players_session_score) do
			peers_with_score[peer_id] = true
		end
	end

	self._peers_with_score = peers_with_score

	LevelEndView.super.init(self, context)
	Managers.transition:force_fade_in()
end

LevelEndView.start = function (self)
	LevelEndView.super.start(self)
	self:play_sound("play_gui_chestroom_start")

	self._playing_music = nil
	self._start_music_event = self.game_won and "Play_won_music" or "Play_lost_music"
	self._stop_music_event = self.game_won and "Stop_won_music" or "Stop_lost_music"
end

LevelEndView.setup_pages = function (self, game_won, rewards)
	local index_by_state_name

	if self._is_untrusted then
		index_by_state_name = self:_setup_pages_untrusted()
	elseif game_won then
		index_by_state_name = self:_setup_pages_victory(rewards)
	else
		index_by_state_name = self:_setup_pages_defeat(rewards)
	end

	return index_by_state_name
end

LevelEndView._setup_pages_untrusted = function (self)
	local index_by_state_name = {
		EndViewStateScore = 1,
	}

	return index_by_state_name
end

LevelEndView._setup_pages_victory = function (self, rewards)
	local index_by_state_name = {}
	local end_of_level_rewards = rewards.end_of_level_rewards
	local chest = end_of_level_rewards.chest

	index_by_state_name.EndViewStateParading = table.size(index_by_state_name) + 1
	index_by_state_name.EndViewStateSummary = table.size(index_by_state_name) + 1

	if chest then
		index_by_state_name.EndViewStateChest = table.size(index_by_state_name) + 1
	end

	index_by_state_name.EndViewStateScore = table.size(index_by_state_name) + 1

	return index_by_state_name
end

LevelEndView.show_team = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	if self.game_won then
		self:_setup_team_heroes(self.context.players_session_score)
		self:_setup_team_previewer()
	end
end

LevelEndView.hide_team = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end
end

LevelEndView.loading_complete = function (self)
	return self._team_previewer and self._team_previewer:loading_done()
end

LevelEndView._setup_pages_defeat = function (self)
	local index_by_state_name = {}

	index_by_state_name.EndViewStateSummary = table.size(index_by_state_name) + 1
	index_by_state_name.EndViewStateScore = table.size(index_by_state_name) + 1

	return index_by_state_name
end

LevelEndView.create_ui_elements = function (self)
	self.ui_animations = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._static_widgets = {}
	self._dynamic_widgets = {
		timer_text = UIWidget.init(widget_definitions.timer_text),
		timer_bg = UIWidget.init(widget_definitions.timer_bg),
	}

	if debug_menu then
		self._page_selector_widget = UIWidget.init(UIWidgets.create_page_dot_selector("page_selector", #self._state_name_by_index))
	end

	local retry_button_def = UIWidgets.create_default_button("retry_button", scenegraph_definition.retry_button.size, nil, nil, Localize(self.game_won and "button_replay" or "button_retry"), 32, nil, nil, nil, true)

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

LevelEndView._setup_team_heroes = function (self, players_session_scores)
	local sorted_stat_ids = {}

	for stats_id in pairs(players_session_scores) do
		table.insert(sorted_stat_ids, stats_id)
	end

	table.sort(sorted_stat_ids)

	local num_players = table.size(players_session_scores)
	local team_heroes = self._team_heroes
	local players_with_score = self._peers_with_score

	table.clear(team_heroes)
	table.clear(players_with_score)

	for i = 1, num_players do
		local player_stat_id = sorted_stat_ids[i]

		if player_stat_id then
			local player_data = players_session_scores[player_stat_id]

			team_heroes[#team_heroes + 1] = self:_get_hero_from_score(player_data)

			local peer_id = player_data.peer_id

			players_with_score[peer_id] = true
		end
	end
end

LevelEndView._get_hero_from_score = function (self, player_data)
	local profile_index = player_data.profile_index
	local career_index = player_data.career_index
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]
	local weapon_pose_anim_event, weapon_pose_weapon, weapon_pose_slot
	local weapon_pose = player_data.weapon_pose and player_data.weapon_pose.item_name

	if weapon_pose then
		local item = ItemMasterList[weapon_pose]

		if item then
			local skin_name = player_data.weapon_pose.skin_name
			local parent_item_name = item.parent
			local parent_item = rawget(ItemMasterList, parent_item_name)

			if parent_item then
				weapon_pose_weapon = {
					item_name = parent_item_name,
					skin_name = skin_name,
				}
				weapon_pose_slot = parent_item.slot_type
				weapon_pose_anim_event = item.data.anim_event
			end
		end
	end

	return {
		profile_index = profile_index,
		career_index = career_index,
		hero_name = career_settings.profile_name,
		skin_name = player_data.hero_skin,
		weapon_slot = weapon_pose_slot or player_data.weapon and career_settings.preview_wield_slot or nil,
		weapon_pose_anim_event = weapon_pose_anim_event,
		preview_items = {
			player_data.hat,
			weapon_pose_weapon or player_data.weapon,
		},
	}
end

LevelEndView._destroy_team_previewer = function (self)
	if self._team_previewer then
		self._team_previewer:on_exit()

		self._team_previewer = nil
	end
end

LevelEndView._update_team_previewer = function (self, dt, t)
	local team_previewer = self._team_previewer

	if team_previewer then
		team_previewer:update(dt, t)
		team_previewer:post_update(dt, t)
	end
end

LevelEndView._setup_team_previewer = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	local world, viewport = self:get_viewport_world()

	self._team_previewer = TeamPreviewer:new(self.context, world, viewport)

	local team_data = self._team_heroes
	local player_count = #team_data
	local hero_locations = self:_gather_hero_locations()

	self._team_previewer:setup_team(team_data, hero_locations)
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

	if self:state_machine_completed() then
		UIRenderer.draw_widget(ui_renderer, self._ready_button_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if self:state_machine_completed() and gamepad_active then
		local ready_available = not self._ready_button_widget.content.button_hotspot.disable_button

		if ready_available then
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

LevelEndView.update = function (self, dt, t)
	LevelEndView.super.update(self, dt, t)
	self:_update_team_previewer(dt, t)
	self:_update_fade(dt, t)
	self:_update_story(dt, t)

	local input_service = self:input_service()

	self:draw_weave_widgets(dt, input_service)

	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	self:_update_input(dt, t)
	self:_update_animations(dt, t)
	self:draw(dt, input_service)

	if not self._playing_music then
		self._playing_music = true

		self:play_sound(self._start_music_event)
	end

	if script_data.testify then
		Testify:poll_requests_through_handler(level_end_view_testify, self)
	end
end

LevelEndView._update_fade = function (self, dt, t)
	if self._fade_out_triggered then
		return
	end

	if self._team_previewer and not self._team_previewer:loading_done() then
		Managers.transition:force_fade_in()
	else
		Managers.transition:fade_out(2)

		self._fade_out_triggered = true
	end
end

LevelEndView._update_input = function (self, dt, t)
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

	UIWidgetUtils.animate_default_button(self._retry_button_widget, dt)
	UIWidgetUtils.animate_default_button(self._ready_button_widget, dt)
end

LevelEndView.destroy = function (self, keep_variables)
	self:_destroy_team_previewer()
	LevelEndView.super.destroy(self, keep_variables)
	Managers.state.event:unregister("set_flow_object_set_enabled", self)

	self._ui_scenegraph = nil
end

LevelEndView.active_input_service = function (self)
	return self.input_blocked and FAKE_INPUT_SERVICE or self:input_service()
end

LevelEndView._start_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = self._dynamic_widgets

	return self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end

LevelEndView._retry_level = function (self)
	self:signal_done(true)

	if not self.is_server then
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

	local widget_content

	if do_reload then
		widget_content = self._retry_checkboxes_widget.content
	else
		widget_content = self._reload_checkboxes_widget.content
	end

	widget_content.votes = widget_content.votes + 1
end

LevelEndView._set_end_timer = function (self, time)
	self._dynamic_widgets.timer_text.content.text = Localize("timer_prefix_time_left") .. ": " .. UIUtils.format_time(math.ceil(time))
end

LevelEndView.update_force_shutdown = function (self, dt)
	self._force_shutdown_timer = math.max(0, self._force_shutdown_timer - dt)

	self:_set_end_timer(self._force_shutdown_timer)

	if self._force_shutdown_timer == 0 and not self._signaled_done then
		self:signal_done(false)

		self._signaled_done = true
		self._signal_done_fallback_timer = 15
		self._ready_button_widget.content.button_hotspot.disable_button = true
		self._retry_button_widget.content.button_hotspot.disable_button = true
	elseif not self._left_lobby then
		if self._signal_done_fallback_timer then
			self._signal_done_fallback_timer = math.max(0, self._signal_done_fallback_timer - dt)
		end

		local all_done = true
		local lobby_members = self._lobby:members()

		if lobby_members then
			local members = self._lobby:members():get_members()
			local peers_with_score = self._peers_with_score

			for i = 1, #members do
				local peer_id = members[i]

				if not self._done_peers[peer_id] and (not peers_with_score or peers_with_score[peer_id]) then
					all_done = false

					break
				end
			end
		end

		if all_done or self._signal_done_fallback_timer and self._signal_done_fallback_timer <= 0 then
			self:exit_to_game()
		end
	end

	if self._started_exit then
		self._started_force_shutdown = false
	end
end

local level_name = "levels/end_screen_victory/parading_screen"

LevelEndView.setup_camera = function (self)
	local camera_name = self.game_won and "pose_camera" or "end_screen_camera"
	local camera_pose, camera_index
	local camera_unit_resource = self.game_won and "units/hub_elements/cutscene_camera/cutscene_camera_env_controls" or "units/hub_elements/cutscene_camera/cutscene_camera"
	local unit_indices = LevelResource.unit_indices(level_name, camera_unit_resource)

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == camera_name then
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local forward = Quaternion.forward(rotation)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			camera_pose = Matrix4x4Box(pose)
			camera_index = index

			print("Found camera: " .. name)

			break
		end
	end

	self._camera_pose = camera_pose
	self._camera_index = camera_index

	self:position_camera()
end

LevelEndView.get_camera_pose = function (self)
	return self._camera_pose:unbox()
end

LevelEndView.start_story_camera = function (self, story_name, optional_loop, optional_speed, optional_manual_control)
	self._storyteller = World.storyteller(self._world)

	self:stop_playing_story(self._story_id)

	local story_id = Storyteller.play_level_story(self._storyteller, self._level, story_name)

	self._story_id = story_id

	Storyteller.set_speed(self._storyteller, story_id, optional_speed or 1)
	Storyteller.set_loop_mode(self._storyteller, story_id, optional_loop and Storyteller.LOOP or Storyteller.NONE)

	self._story_timer = 0
	self._manual_control = optional_manual_control
	self._story_length = Storyteller.length(self._storyteller, story_id)

	return story_id
end

LevelEndView.stop_playing_story = function (self, story_id)
	if not story_id or not self._storyteller or not Storyteller.is_playing(self._storyteller, story_id) then
		return
	end

	Storyteller.stop(self._storyteller, story_id)

	self._story_id = nil
end

LevelEndView.is_playing_story = function (self, story_id)
	if not self._storyteller or not story_id then
		return false
	end

	local is_playing = Storyteller.is_playing(self._storyteller, story_id)

	return is_playing
end

LevelEndView._update_story = function (self, dt, t)
	if not self._storyteller or not self._story_id then
		return
	end

	Storyteller.set_speed(self._storyteller, self._story_id, self._state_speed_mult)

	if self._manual_control then
		Storyteller.set_time(self._storyteller, self._story_id, self._story_timer)
	end

	local unit = Level.unit_by_index(self._level, self._camera_index)
	local camera_pose = Unit.world_pose(unit, 0)

	self._camera_pose = Matrix4x4Box(camera_pose)

	self:position_camera()

	local story_time = Storyteller.time(self._storyteller, self._story_id)

	if story_time >= self._story_length then
		self:stop_playing_story(self._story_id)

		self._storyteller = nil
	end
end

LevelEndView.set_story_time = function (self, time)
	self._story_timer = time
end

LevelEndView._gather_hero_locations = function (self)
	local hero_locations = {}
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/versus_podium_character_spawn")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and string.find(name, "spawn_point") then
			local position = LevelResource.unit_position(level_name, index)
			local spawn_index = tonumber(string.gsub(name, "spawn_point_", ""), 10)

			hero_locations[spawn_index] = {
				position[1],
				position[2],
				position[3],
			}
		end
	end

	for i = 1, 4 do
		hero_locations[i] = hero_locations[i] or {
			0,
			0,
			0,
		}
	end

	return hero_locations
end

LevelEndView.create_world = function (self, context)
	local world_name = "end_screen"
	local shading_environment = "environment/ui_end_screen"
	local layer = 2
	local flags = self:get_world_flags()
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(flags))
	local top_world = Managers.world:world("top_ingame_view")

	return world, top_world
end

LevelEndView.spawn_level = function (self, context, world)
	local object_sets = {}
	local position, rotation, shading_callback, mood_setting
	local time_sliced_spawn = false
	local level = ScriptWorld.spawn_level(world, level_name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	Level.spawn_background(level)
	Level.trigger_level_loaded(level)
	self:_register_object_sets(level, level_name)

	local game_won = context.game_won
	local object_set = game_won and "flow_victory" or "flow_defeat"

	self:_show_object_set(object_set, level)

	return level
end

LevelEndView.get_world_link_unit = function (self)
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

LevelEndView._push_mouse_cursor = function (self)
	if not self._cursor_visible then
		ShowCursorStack.show("LevelEndViewBase")

		self._cursor_visible = true

		self:_start_animation("ready_button_entry_alone")
	end
end

LevelEndViewBase._pop_mouse_cursor = function (self)
	if self._cursor_visible then
		ShowCursorStack.hide("LevelEndViewBase")

		self._cursor_visible = nil
	end
end

LevelEndView.input_enabled = function (self)
	return not self._ready_button_widget.content.button_hotspot.disable_button
end
