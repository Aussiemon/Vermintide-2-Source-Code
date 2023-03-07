require("scripts/ui/views/level_end/level_end_view_base")
require("scripts/ui/views/level_end/states/end_view_state_summary")
require("scripts/ui/views/team_previewer")

local definitions = local_require("scripts/ui/views/level_end/level_end_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local generic_input_actions = definitions.generic_input_actions
local debug_draw_scenegraph = false
local debug_menu = false
local level_end_view_weave_testify = script_data.testify and require("scripts/ui/views/level_end/level_end_view_weave_testify")
LevelEndViewWeave = class(LevelEndViewWeave, LevelEndViewBase)

LevelEndViewWeave.init = function (self, context)
	self._team_heroes = {}
	self._team_previewer = nil
	self._peers_with_score = {}

	LevelEndViewWeave.super.init(self, context)
end

LevelEndViewWeave.start = function (self)
	LevelEndViewWeave.super.start(self)

	self._playing_music = nil
	self._start_music_event = self.game_won and "Play_won_music" or "Play_lost_music"
	self._stop_music_event = self.game_won and "Stop_won_music" or "Stop_lost_music"
end

LevelEndViewWeave.destroy = function (self)
	LevelEndViewWeave.super.destroy(self)
	self:_destroy_team_previewer()
end

LevelEndViewWeave.setup_pages = function (self, game_won, rewards)
	local index_by_state_name = nil

	if self._is_untrusted then
		index_by_state_name = self:_setup_pages_untrusted()
	elseif game_won then
		index_by_state_name = self:_setup_pages_victory(rewards)
	else
		index_by_state_name = self:_setup_pages_defeat(rewards)
	end

	return index_by_state_name
end

LevelEndViewWeave._setup_pages_untrusted = function (self)
	return {
		EndViewStateWeave = 1
	}
end

LevelEndViewWeave._setup_pages_victory = function (self, rewards)
	return {
		EndViewStateSummary = 2,
		EndViewStateWeave = 1
	}
end

LevelEndViewWeave._setup_pages_defeat = function (self, rewards)
	return {
		EndViewStateSummary = 1
	}
end

LevelEndViewWeave.create_ui_elements = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	if self.game_won then
		local weave_manager = Managers.weave
		local num_players = weave_manager:get_num_players()

		self:_setup_team_heroes(self.context.players_session_score, num_players)
		self:_setup_team_previewer(num_players)
	end
end

LevelEndViewWeave.update = function (self, dt, t)
	LevelEndViewWeave.super.update(self, dt, t)
	self:_update_team_previewer(dt, t)
	self:_update_camera_look_up(dt, t)

	if not self._playing_music then
		self._playing_music = true

		self:play_sound(self._start_music_event)
	end

	if script_data.testify then
		Testify:poll_requests_through_handler(level_end_view_weave_testify, self)
	end
end

LevelEndViewWeave.set_input_description = function (self, input_desc)
	local input_desc = definitions.generic_input_actions[input_desc]

	self._menu_input_description:set_input_description(input_desc)
end

LevelEndViewWeave.destroy = function (self)
	LevelEndViewWeave.super.destroy(self)
end

LevelEndViewWeave.active_input_service = function (self)
	return self.input_blocked and FAKE_INPUT_SERVICE or self:input_service()
end

LevelEndViewWeave._retry_level = function (self)
	if self.is_server then
		self:signal_done(true)
	else
		self:signal_done(true)
	end
end

LevelEndViewWeave.do_retry = function (self)
	if not GameSettingsDevelopment.allow_retry_weave then
		return false
	end

	local do_reload_cnt = 0
	local num_votes = table.size(self._wants_reload)

	for peer_id, wants_reload in pairs(self._wants_reload) do
		if wants_reload then
			do_reload_cnt = do_reload_cnt + 1
		end
	end

	if do_reload_cnt >= num_votes * 0.5 then
		self:_setup_weave_data()

		return true
	end
end

LevelEndViewWeave._setup_weave_data = function (self)
	local weave_manager = Managers.weave
	local current_objective_index = 1
	local current_weave = weave_manager:get_active_weave()
	local current_weave_template = WeaveSettings.templates[current_weave]
	local current_objective = current_weave_template.objectives[current_objective_index]
	local level_key = current_objective.level_id
	local game_mode = "weave"
	local mechanism = "weave"

	if self.is_server then
		Managers.mechanism:choose_next_state(game_mode)
		Managers.mechanism:progress_state()

		local difficulty_key = current_weave_template.difficulty_key
		local act_key = nil
		local private_game = true
		local quick_game = false
		local eac_authorized = false

		if DEDICATED_SERVER then
			local eac_server = Managers.matchmaking.network_server:eac_server()
			eac_authorized = EACServer.state(eac_server, Network.peer_id()) == "trusted"
		else
			local eac_state = EAC.state()

			fassert(eac_state ~= nil, "EAC state wasn't set.")

			eac_authorized = eac_state == "trusted"
		end

		Managers.matchmaking:set_matchmaking_data(level_key, difficulty_key, act_key, game_mode, private_game, quick_game, eac_authorized, nil, mechanism)
	end

	Managers.weave:set_next_weave(current_weave)
	Managers.weave:set_next_objective(current_objective_index)
end

local unit_x = 0.07
local unit_x_seperation = 1.36
local unit_y = -1.9
local unit_y_seperation = 0.15
local unit_z = 0
local hero_locations = {
	{
		{
			unit_x,
			unit_y,
			unit_z
		}
	},
	{
		{
			unit_x + unit_x_seperation * 0.5,
			unit_y + unit_y_seperation * 0.5,
			unit_z
		},
		{
			unit_x + unit_x_seperation * -0.5,
			unit_y + unit_y_seperation * -0.5,
			unit_z
		}
	},
	{
		{
			unit_x + unit_x_seperation * 1,
			unit_y + unit_y_seperation * 1,
			unit_z
		},
		{
			unit_x + unit_x_seperation * 0,
			unit_y + unit_y_seperation * 0,
			unit_z
		},
		{
			unit_x + unit_x_seperation * -1,
			unit_y + unit_y_seperation * -1,
			unit_z
		}
	},
	{
		{
			unit_x + unit_x_seperation * 1.5,
			unit_y + unit_y_seperation * 1.5,
			unit_z
		},
		{
			unit_x + unit_x_seperation * 0.5,
			unit_y + unit_y_seperation * 0.5,
			unit_z
		},
		{
			unit_x + unit_x_seperation * -0.5,
			unit_y + unit_y_seperation * -0.5,
			unit_z
		},
		{
			unit_x + unit_x_seperation * -1.5,
			unit_y + unit_y_seperation * -1.5,
			unit_z
		}
	}
}

LevelEndViewWeave._destroy_team_previewer = function (self)
	if self._team_previewer then
		self._team_previewer:on_exit()

		self._team_previewer = nil
	end
end

LevelEndViewWeave._update_team_previewer = function (self, dt, t)
	local team_previewer = self._team_previewer

	if team_previewer then
		team_previewer:update(dt, t)
		team_previewer:post_update(dt, t)
	end
end

LevelEndViewWeave._setup_team_previewer = function (self, num_players)
	if self._team_previewer then
		return
	end

	local world, viewport = self:get_viewport_world()
	self._team_previewer = TeamPreviewer:new(self.context, world, viewport)
	local team_data = self._team_heroes
	local player_count = #team_data

	self._team_previewer:setup_team(team_data, hero_locations[num_players])
end

LevelEndViewWeave._setup_team_heroes = function (self, players_session_scores, num_players)
	local sorted_stat_ids = {}

	for stats_id in pairs(players_session_scores) do
		table.insert(sorted_stat_ids, stats_id)
	end

	table.sort(sorted_stat_ids)

	local team_heroes = self._team_heroes
	local players_with_score = self._peers_with_score

	table.clear(team_heroes)
	table.clear(players_with_score)

	for i = 1, num_players do
		local player_stat_id = sorted_stat_ids[i]

		if player_stat_id then
			local player_data = players_session_scores[player_stat_id]
			team_heroes[#team_heroes + 1] = self:get_hero_from_score(player_data)
			local peer_id = player_data.peer_id
			players_with_score[peer_id] = true
		end
	end
end

LevelEndViewWeave.get_hero_from_score = function (self, player_data)
	local profile_index = player_data.profile_index
	local career_index = player_data.career_index
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]

	return {
		profile_index = profile_index,
		career_index = career_index,
		hero_name = career_settings.profile_name,
		skin_name = player_data.hero_skin,
		weapon_slot = player_data.weapon and career_settings.preview_wield_slot or nil,
		preview_items = {
			player_data.hat,
			player_data.weapon
		}
	}
end

local level_name = "levels/end_screen_victory/world"

LevelEndViewWeave.setup_camera = function (self)
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

	self:position_camera(nil, 45)
end

LevelEndViewWeave.start_camera_look_up = function (self, transition_delay, transition_duration, degrees)
	self._camera_look_up_time = -transition_delay
	self._camera_look_up_duration = transition_duration
	self._camera_look_up_degrees = degrees
end

LevelEndViewWeave._update_camera_look_up = function (self, dt, t)
	local camera_look_up_time = self._camera_look_up_time

	if not camera_look_up_time then
		return
	end

	local camera_look_up_duration = self._camera_look_up_duration
	local camera_look_up_degrees = self._camera_look_up_degrees
	local previous_progress = math.clamp(camera_look_up_time / camera_look_up_duration, 0, 1)
	local previous_animation_progress = math.easeCubic(previous_progress)
	camera_look_up_time = camera_look_up_time + dt
	local progress = math.clamp(camera_look_up_time / camera_look_up_duration, 0, 1)
	local animation_progress = math.easeCubic(progress)
	local previous_angle = math.degrees_to_radians(camera_look_up_degrees * previous_animation_progress)
	local angle = math.degrees_to_radians(camera_look_up_degrees * animation_progress)
	local animation_rotation = Quaternion(Vector3.right(), angle - previous_angle)
	local current_rotation = self:get_camera_rotation()
	local new_rotation = Quaternion.multiply(current_rotation, animation_rotation)

	self:set_camera_rotation(new_rotation)

	if progress == 1 then
		self._camera_look_up_time = nil
	else
		self._camera_look_up_time = camera_look_up_time
	end
end

LevelEndViewWeave.spawn_level = function (self, context, world)
	local object_sets = {}
	local position, rotation, shading_callback, mood_setting = nil
	local time_sliced_spawn = false
	local level = ScriptWorld.spawn_level(world, level_name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	Level.spawn_background(level)

	return level
end

LevelEndViewWeave.exit_to_game = function (self)
	self:play_sound(self._stop_music_event)

	self._exit_timer = 0.5
	self._started_exit = true
end

LevelEndViewWeave.update_force_shutdown = function (self, dt)
	self._force_shutdown_timer = math.max(0, self._force_shutdown_timer - dt)

	if self._force_shutdown_timer == 0 and not self._signaled_done then
		self:signal_done(false)

		self._signaled_done = true
	elseif not self._left_lobby then
		local all_done = true
		local lobby_members = self._lobby:members()

		if lobby_members then
			local members = lobby_members:get_members()

			for i = 1, #members do
				local peer_id = members[i]
				local is_done = self._done_peers[peer_id]
				local has_result = self._peers_with_score[peer_id]

				if not is_done and has_result then
					all_done = false

					break
				end
			end
		end

		self._all_signaled_done = all_done
	end

	if self._started_exit then
		self._started_force_shutdown = false
	end
end

LevelEndViewWeave.get_all_signaled_done = function (self)
	return self._all_signaled_done
end
