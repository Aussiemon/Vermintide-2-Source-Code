-- chunkname: @scripts/ui/views/level_end/level_end_view_versus.lua

require("scripts/settings/dlcs/carousel/end_screen_award_settings")

local definitions = local_require("scripts/ui/views/level_end/level_end_view_versus_definitions")
local widget_definitions = definitions.widget_definitions
local scenegraph_definitions = definitions.scenegraph_definitions
local animation_definitions = definitions.animation_definitions
local camera_movement_functions = definitions.camera_movement_functions
local PROFILE_FOV = {
	vs_chaos_troll = 75,
	vs_rat_ogre = 75,
}
local PROFILE_OFFSET = {
	vs_rat_ogre = -0.5,
}

LevelEndViewVersus = class(LevelEndViewVersus, LevelEndViewBase)

LevelEndViewVersus._setup_pages_victory = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateParadingVS = 1,
			EndViewStateScoreVS = 2,
		}
	else
		return {
			EndViewStateParadingVS = 1,
			EndViewStateScoreVS = 2,
		}
	end
end

LevelEndViewVersus._setup_pages_defeat = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateParadingVS = 1,
			EndViewStateScoreVS = 2,
		}
	else
		return {
			EndViewStateParadingVS = 1,
			EndViewStateScoreVS = 2,
		}
	end
end

local extra_portrait_materials = {}

for _, dlc in pairs(DLCSettings) do
	local portrait_materials = dlc.portrait_materials

	if portrait_materials then
		for _, path in ipairs(portrait_materials) do
			extra_portrait_materials[#extra_portrait_materials + 1] = path
		end
	end
end

local CAMERA_TRANSITION_DELAY = 1
local CAMERA_FINAL_POSE_DELAY = 4
local MAX_AWARDS = 5

LevelEndViewVersus.init = function (self, context)
	self._team_heroes = {}
	self._team_previewer = nil
	self._peers_with_score = {}
	self._parading_done_timer = nil
	self._camera_movement_functions = table.clone(camera_movement_functions)

	LevelEndViewWeave.super.init(self, context)

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, Managers.input:get_service("end_of_level"), 3, 900, definitions.generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
	Managers.state.event:register(self, "set_flow_object_set_enabled", "event_show_flow_object_set")
	Managers.transition:force_fade_in()
end

LevelEndViewVersus._calculate_awards = function (self)
	local awards = {}
	local players_session_scores = self.context.players_session_score

	for i = 1, #EndScreenAwardSettings do
		local award_settings = EndScreenAwardSettings[i]
		local winner_stats_id, amount = award_settings.evaluate(players_session_scores)

		if winner_stats_id then
			awards[winner_stats_id] = awards[winner_stats_id] or {}
			awards[winner_stats_id][#awards[winner_stats_id] + 1] = {
				value = 10 - award_settings.prio,
				header = award_settings.name,
				sound = award_settings.sound,
				sub_header = award_settings.sub_header and string.format(award_settings.sub_header, amount),
				screen_sub_header = award_settings.screen_sub_header,
				award_material = award_settings.award_material,
				award_mask_material = award_settings.award_mask_material,
				award_settings = award_settings,
				amount = amount,
			}
		end
	end

	table.dump(players_session_scores, "PLAYERS_SESSION_SCORES", 2)
	self:_calculate_mvp(awards, players_session_scores)

	local sorted_awards = {}

	for stats_id, awards_data in pairs(awards) do
		local max_award_value = 0

		for i = 1, #awards_data do
			local award_data = awards_data[i]
			local award_value = award_data.value

			max_award_value = max_award_value < award_value and award_value or max_award_value
		end

		sorted_awards[#sorted_awards + 1] = {
			stats_id = stats_id,
			max_award_value = max_award_value,
			awards = awards_data,
		}
	end

	local function sort_func(a, b)
		local a_max_award_value = a.max_award_value
		local b_max_award_value = b.max_award_value

		return b_max_award_value < a_max_award_value
	end

	table.sort(sorted_awards, sort_func)

	self._sorted_awards = sorted_awards

	self:_save_award_stats()
	table.dump(self._sorted_awards, "AWARDS", 3)

	local scores = {}

	for stats_id, player_session_score in pairs(players_session_scores) do
		scores[#scores + 1] = player_session_score
		scores[#scores].stats_id = stats_id
	end

	local function sort_func(a, b)
		return a.stats_id > b.stats_id
	end

	table.sort(scores, sort_func)
	table.dump(scores, "SCORES", 2)
end

LevelEndViewVersus._save_award_stats = function (self)
	local stats_interface = Managers.backend:get_interface("statistics")
	local stats = stats_interface:get_stats()
	local statistics_db = StatisticsDatabase:new()
	local local_player_id = 1
	local unique_id = PlayerUtils.unique_player_id(Network.peer_id(), local_player_id)

	statistics_db:register(unique_id, "player", stats)

	local awards

	for _, award_data in ipairs(self._sorted_awards) do
		if award_data.stats_id == unique_id then
			awards = award_data.awards

			break
		end
	end

	if awards then
		for _, award in ipairs(awards) do
			local settings = award.award_settings
			local stat_key = settings.stat_key

			statistics_db:increment_stat(unique_id, stat_key)
		end
	end

	stats_interface:save_explicit(unique_id, statistics_db)
	Managers.backend:commit()
end

LevelEndViewVersus._calculate_mvp = function (self, awards, player_session_scores)
	local award_values = {}
	local local_player_id = 1
	local max_award_value = 0

	for stats_id, awards_data in pairs(awards) do
		award_values[stats_id] = 0

		for _, award_data in ipairs(awards_data) do
			award_values[stats_id] = award_values[stats_id] + award_data.value
		end

		if max_award_value < award_values[stats_id] then
			max_award_value = award_values[stats_id]
		end
	end

	local potential_mvp_stats_ids = {}

	for stats_id, award_value in pairs(award_values) do
		if award_value == max_award_value then
			potential_mvp_stats_ids[#potential_mvp_stats_ids + 1] = stats_id
		end
	end

	local party_composition = self.context.party_composition
	local players_session_scores = self.context.players_session_score
	local mvp_stats_id

	if #potential_mvp_stats_ids > 1 then
		local my_peer_id = Network.peer_id()
		local local_player_party_id = party_composition[PlayerUtils.unique_player_id(my_peer_id, local_player_id)]
		local opponent_party_id = local_player_party_id == 1 and 2 or 1
		local game_won = self.context.game_won
		local winning_party_id = game_won and local_player_party_id or not game_won and opponent_party_id or nil
		local winning_team_mvp_stats_ids = {}

		for _, stats_id in ipairs(potential_mvp_stats_ids) do
			local party_id = party_composition[stats_id]

			if party_id == winning_party_id then
				winning_team_mvp_stats_ids[#winning_team_mvp_stats_ids + 1] = stats_id
			end
		end

		local tied_mvp_stats_ids = {}

		if #winning_team_mvp_stats_ids == 1 then
			mvp_stats_id = winning_team_mvp_stats_ids[1]
		elseif #winning_team_mvp_stats_ids > 1 then
			tied_mvp_stats_ids = winning_team_mvp_stats_ids
		else
			tied_mvp_stats_ids = potential_mvp_stats_ids
		end

		if not table.is_empty(tied_mvp_stats_ids) then
			local function sort_func(a, b)
				local a_scores = players_session_scores[a].scores
				local a_kills = a_scores.damage_dealt_heroes + a_scores.vs_damage_dealt_to_pactsworn or 0
				local b_scores = players_session_scores[b].scores
				local b_kills = b_scores.damage_dealt_heroes + b_scores.vs_damage_dealt_to_pactsworn or 0

				return b_kills < a_kills
			end

			table.sort(tied_mvp_stats_ids, sort_func)

			mvp_stats_id = tied_mvp_stats_ids[1]
		end
	else
		mvp_stats_id = potential_mvp_stats_ids[1]
	end

	if mvp_stats_id then
		table.insert(awards[mvp_stats_id], 1, {
			award_mask_material = "mvp_award_mask",
			award_material = "mvp_award",
			header = "mvp",
			sound = "Play_vs_hud_eom_parading_mvp",
			value = 10,
			award_settings = EndScreenAwardSettingsLookup.vs_award_mvp,
		})
	else
		mvp_stats_id = Network.peer_id() .. ":1"
		awards[mvp_stats_id] = awards[mvp_stats_id] or {}

		table.insert(awards[mvp_stats_id], 1, {
			award_mask_material = "mvp_award_mask",
			award_material = "mvp_award",
			header = "mvp",
			sound = "Play_vs_hud_eom_parading_mvp",
			value = 10,
			award_settings = EndScreenAwardSettingsLookup.vs_award_mvp,
		})
	end

	local mvp_player_session_score = player_session_scores[mvp_stats_id] or {}
	local mvp_peer_id = mvp_player_session_score.peer_id or "DEAD"
	local total_score = 0
	local mvp_scores = mvp_player_session_score.scores

	if mvp_scores then
		for _, score in pairs(mvp_scores) do
			total_score = total_score + score
		end
	end

	self._random_seed = tonumber(mvp_peer_id, 16) + total_score
end

LevelEndViewVersus.set_input_description = function (self, description_name)
	local actions = definitions.generic_input_actions[description_name]

	self._menu_input_description:set_input_description(actions)
end

LevelEndViewVersus._setup_pages_untrusted = function (self)
	return {
		EndViewStateParadingVS = 1,
		EndViewStateScoreVS = 2,
	}
end

LevelEndViewVersus.start = function (self)
	print("[LevelEndView] Started LevelEndViewVersus")
	LevelEndViewVersus.super.start(self)

	self._start_music_event = "menu_versus_score_screen_amb_loop_start"
	self._stop_music_event = "menu_versus_score_screen_amb_loop_stop"
	self._playing_music = nil
end

LevelEndViewVersus.create_ui_renderer = function (self, context, world, top_world)
	local materials = {
		"material",
		"materials/ui/ui_1080p_carousel_atlas",
		"material",
		"materials/ui/ui_1080p_hud_atlas_textures",
		"material",
		"materials/ui/ui_1080p_hud_single_textures",
		"material",
		"materials/ui/ui_1080p_menu_atlas_textures",
		"material",
		"materials/ui/ui_1080p_menu_single_textures",
		"material",
		"materials/ui/ui_1080p_achievement_atlas_textures",
		"material",
		"materials/ui/ui_1080p_common",
		"material",
		"materials/ui/ui_1080p_versus_available_common",
		"material",
		"materials/ui/ui_1080p_versus_rewards_atlas",
		"material",
		"materials/fonts/gw_fonts",
	}
	local extra_materials = self.get_extra_materials

	if extra_materials then
		for _, extra_material in ipairs(extra_materials) do
			materials[#materials + 1] = extra_material
		end
	end

	for _, extra_portrait_material in ipairs(extra_portrait_materials) do
		materials[#materials + 1] = "material"
		materials[#materials + 1] = extra_portrait_material
	end

	local ui_renderer = UIRenderer.create(world, unpack(materials))
	local ui_top_renderer = UIRenderer.create(top_world, unpack(materials))

	return ui_renderer, ui_top_renderer
end

LevelEndViewVersus.update = function (self, dt, t)
	local dt = self:_handle_input(dt, t)

	LevelEndViewVersus.super.update(self, dt, t)
	self:_start_music()
	self:_update_animations(dt, t)
	self:_update_team_previewer(dt, t)
	self:_update_fade(dt, t)
	self:_update_camera_zoom(dt, t)
	self:_update_award_presentation(dt, t)
	self:_draw(dt, t)
end

LevelEndViewVersus._update_fade = function (self, dt, t)
	if self._fade_out_triggered then
		return
	end

	if not self._team_previewer or not self._team_previewer:loading_done() then
		Managers.transition:force_fade_in()
	else
		Managers.transition:fade_out(2)

		self._fade_out_triggered = true
	end
end

LevelEndViewVersus._update_award_presentation = function (self, dt, t)
	if not self._fade_out_triggered then
		return
	end

	if self._camera_progress < 1 then
		return
	end

	if not self._award_presentation_data then
		self:_start_award_presentation()
	end

	local award_presentation_data = self._award_presentation_data

	if not award_presentation_data then
		return
	end

	local start_pos = award_presentation_data.start_pos:unbox()
	local end_pos = award_presentation_data.end_pos:unbox()
	local neck_pose = award_presentation_data.neck_pose:unbox()
	local distance = award_presentation_data.distance
	local time = award_presentation_data.time
	local timer = award_presentation_data.timer
	local progress = 1 - timer / time
	local progress = math.easeOutCubic(progress)
	local disable_camera_rotation = award_presentation_data.disable_camera_rotation
	local translation = Vector3.lerp(start_pos, end_pos, progress)
	local neck_pos = Matrix4x4.translation(neck_pose)
	local rotation = Matrix4x4.rotation(neck_pose)
	local forward = Quaternion.forward(rotation)

	forward[3] = 0

	local offset_value = math.sin(math.pi * progress)

	translation = translation + forward * offset_value * distance

	local rotation

	if disable_camera_rotation then
		rotation = Quaternion.look(Vector3(0, -1, 0), Vector3.up())
	else
		rotation = Quaternion.look(neck_pos - translation, Vector3.up())
	end

	local new_camera_pose = Matrix4x4.from_quaternion_position(rotation, translation)

	self:position_camera(new_camera_pose, self._fov)

	local hero_previewer = self._hero_previewers[self._current_hero]
	local character_unit = hero_previewer:get_character_unit()
	local aim_constraint_anim_var = Unit.animation_find_constraint_target(character_unit, "aim_constraint_target")

	Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, translation)

	award_presentation_data.timer = math.max(timer - dt, 0)

	if not award_presentation_data.fade and award_presentation_data.timer <= 0.2 then
		Managers.transition:fade_in(8)

		award_presentation_data.fade = true
	end

	if award_presentation_data.timer == 0 then
		for _, screen_award_widget in ipairs(self._screen_award_widgets) do
			screen_award_widget.content.visible = false
		end

		local character_rotation = self._character_rotation
		local hero_previewer = self._hero_previewers[self._current_hero]

		hero_previewer:set_hero_rotation(character_rotation)
		Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, Vector3Aux.unbox(self._character_look_target))

		self._award_presentation_data = nil
		self._current_hero = self._current_hero - 1

		if self._current_hero < 1 then
			self:_trigger_end_camera()
		end
	end
end

LevelEndViewVersus._trigger_end_camera = function (self)
	local camera_pose = self._target_camera_pose:unbox()

	Matrix4x4.set_translation(camera_pose, Matrix4x4.translation(camera_pose) + Matrix4x4.forward(camera_pose) * 2)

	self._camera_pose = Matrix4x4Box(camera_pose)
	self._camera_progress = 0

	for _, hero_previewer in ipairs(self._hero_previewers) do
		hero_previewer:_set_character_visibility(true)
	end

	for _, award_widget in ipairs(self._award_widgets) do
		award_widget.content.visible = true
	end

	Managers.transition:force_fade_in()
	Managers.transition:fade_out(2)
	self:_start_animation("animate_continue_button", self._widgets_by_name, {
		cb = callback(self, "set_input_description", "continue_available"),
	})

	self._skip_camera_fade = true

	self:play_sound("Play_vs_hud_eom_parading_team")
end

LevelEndViewVersus._start_award_presentation = function (self)
	self._current_hero = self._current_hero or #self._hero_previewers

	local hero_previewer = self._hero_previewers[self._current_hero]

	if not hero_previewer then
		return
	end

	local character_unit = hero_previewer:get_character_unit()

	if not Unit.alive(character_unit) then
		return
	end

	for _, hero_previewer in ipairs(self._hero_previewers) do
		hero_previewer:_set_character_visibility(false)
	end

	hero_previewer:_set_character_visibility(true)

	for _, screen_award_widget in ipairs(self._screen_award_widgets) do
		screen_award_widget.content.visible = false
	end

	self._character_rotation = hero_previewer.character_rotation
	self._character_look_target = hero_previewer.character_look_target
	self._fov = table.is_empty(self._team_heroes[self._current_hero].breed) and 55 or nil

	local current_profile_name = hero_previewer:current_profile_name()
	local profile = PROFILES_BY_NAME[current_profile_name]

	self._fov = PROFILE_FOV[profile.display_name] or self._fov

	local profile_offset = PROFILE_OFFSET[profile.display_name] or 0

	hero_previewer:set_hero_rotation(0)

	local screen_award_widget = self._screen_award_widgets[self._current_hero]

	screen_award_widget.content.visible = true

	local award_data = screen_award_widget.content.award_data
	local sound_event = award_data.sound_event

	if sound_event then
		self:play_sound(sound_event)
	end

	local peer_id = award_data.peer_id

	if peer_id == Network.peer_id() then
		self:play_sound("Play_vs_hud_eom_parading_you")
	end

	self.render_settings.alpha_multiplier = 1

	local node_index = Unit.has_node(character_unit, "j_neck") and Unit.node(character_unit, "j_neck")

	if not node_index then
		return
	end

	local neck_pose = Unit.world_pose(character_unit, node_index)
	local node_index = Unit.has_node(character_unit, "j_hips") and Unit.node(character_unit, "j_hips")

	if not node_index then
		return
	end

	local hips_pose = Unit.world_pose(character_unit, node_index)
	local base_pose = Unit.world_pose(character_unit, 0)
	local distance = 2
	local time = 5
	local right = Vector3(-1, 0, 0)
	local forward = Matrix4x4.forward(self._camera_pose:unbox())
	local neck_pos = Matrix4x4.translation(neck_pose) + forward * profile_offset
	local hips_pos = Matrix4x4.translation(hips_pose) + forward * profile_offset
	local base_pos = Matrix4x4.translation(base_pose) + forward * profile_offset
	local random_seed, index

	random_seed, index = Math.next_random(self._random_seed, 1, #self._camera_movement_functions)
	self._random_seed = random_seed

	local movement_data = self._camera_movement_functions[index]

	self._award_presentation_data = movement_data.func(neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)

	table.remove(self._camera_movement_functions, index)
	Managers.transition:force_fade_in()
	Managers.transition:fade_out(2)
end

LevelEndViewVersus._handle_input = function (self, dt, t)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	if input_service:get("confirm_hold") then
		dt = dt * 5
	end

	local continue_button = self._widgets_by_name.continue_button

	if continue_button.content.visible then
		local gamepad_active = Managers.input:is_device_active("gamepad")

		if UIUtils.is_button_pressed(continue_button) or gamepad_active and input_service:get("refresh") or not gamepad_active and input_service:get("confirm_press") then
			self._parading_done = true

			self:play_sound("play_gui_start_menu_button_click")
		elseif UIUtils.is_button_hover_enter(continue_button) then
			self:play_sound("Play_hud_hover")
		end
	end

	return dt
end

LevelEndViewVersus.parading_done = function (self, dt, t)
	return self._parading_done
end

LevelEndViewVersus._update_camera_zoom = function (self, dt, t)
	if not self._fade_out_triggered then
		return
	end

	local camera_progress = self._camera_progress

	if camera_progress >= 1 then
		return
	end

	if self._camera_delay and t < self._camera_delay then
		return
	end

	local eased_camera_progress = math.easeOutCubic(camera_progress)
	local new_camera_pose = Matrix4x4.lerp(self._camera_pose:unbox(), self._target_camera_pose:unbox(), eased_camera_progress)

	self:position_camera(new_camera_pose)

	local speed = 0.5

	self._camera_progress = math.min(camera_progress + dt * speed, 1)

	if not self._skip_camera_fade and self._camera_progress >= 0.9 then
		Managers.transition:fade_in(5)

		self._skip_camera_fade = true
	end
end

LevelEndViewVersus._start_music = function (self)
	if self._playing_music then
		return
	end

	self:play_sound(self._start_music_event)

	self._playing_music = true
end

LevelEndViewVersus._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for anim_id, _ in pairs(self._ui_animations) do
		if ui_animator:is_animation_completed(anim_id) then
			self._ui_animations[anim_id] = nil
		end
	end

	local widget = self._widgets_by_name.continue_button

	UIWidgetUtils.animate_default_button(widget, dt)
end

LevelEndViewVersus._draw = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self:input_service()
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	UIRenderer.draw_all_widgets(ui_renderer, self._portrait_widgets)
	UIRenderer.draw_all_widgets(ui_renderer, self._award_widgets)
	UIRenderer.draw_all_widgets(ui_renderer, self._screen_award_widgets)
	UIRenderer.end_pass(ui_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_renderer, dt)
	end
end

LevelEndViewVersus.set_input_description = function (self, input_desc)
	self._menu_input_description:set_input_description(definitions.generic_input_actions[input_desc])
end

LevelEndViewVersus.destroy = function (self, keep_variables)
	LevelEndViewVersus.super.destroy(self, keep_variables)
	Managers.state.event:unregister("set_flow_object_set_enabled", self)

	self._ui_scenegraph = nil
end

LevelEndViewVersus.do_retry = function (self)
	return false
end

LevelEndViewVersus.active_input_service = function (self)
	return self.input_blocked and FAKE_INPUT_SERVICE or self:input_service()
end

LevelEndViewVersus.setup_pages = function (self, game_won, rewards)
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

LevelEndViewVersus.setup_camera = function (self)
	local camera_pose = Matrix4x4Box(Matrix4x4.identity())
	local level_name = "levels/carousel_podium/world"
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == "parading_position_01" then
			local position = LevelResource.unit_position(level_name, index) + Vector3(0, 1, 0)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			camera_pose = Matrix4x4Box(pose)

			print("Found camera: " .. name)

			break
		end
	end

	self._camera_pose = camera_pose
	self._target_camera_pose = Matrix4x4Box(Matrix4x4.multiply(camera_pose:unbox(), Matrix4x4.from_translation(Vector3(0, -2.75, 0))))
	self._camera_progress = 0

	self:position_camera(self._target_camera_pose:unbox())
end

LevelEndViewVersus._destroy_team_previewer = function (self)
	if self._team_previewer then
		self._team_previewer:on_exit()

		self._team_previewer = nil
	end
end

LevelEndViewVersus._update_team_previewer = function (self, dt, t)
	local team_previewer = self._team_previewer

	if team_previewer then
		team_previewer:update(dt, t)
		team_previewer:post_update(dt, t)
	end
end

LevelEndViewVersus.create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definitions)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})

	local continue_button = self._widgets_by_name.continue_button

	continue_button.content.visible = false
	self._ui_animations = {}
	self._portrait_widgets = {}
	self._award_widgets = {}
	self._screen_award_widgets = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

LevelEndViewVersus.hide_team = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	if not table.is_empty(self._ui_animations) then
		for anim_id, _ in pairs(self._ui_animations) do
			self._ui_animator:stop_animation(anim_id)
		end

		table.clear(self._ui_animations)
	end

	self:_start_animation("hide_awards", self._award_widgets)
end

LevelEndViewVersus.show_team = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	self:_calculate_awards()

	local num_players = self:_setup_team_heroes()

	self:_setup_team_previewer(num_players)
end

LevelEndViewVersus._start_animation = function (self, animation_name, widgets, data)
	local params = {
		render_settings = self.render_settings,
		data = data,
	}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definitions, params)

	self._ui_animations[anim_id] = true
end

LevelEndViewVersus._setup_team_heroes = function (self)
	local num_party_members = 0
	local local_player_party_id = self.context.party_composition[PlayerUtils.unique_player_id(Network.peer_id(), 1)]
	local players_session_scores = self.context.players_session_score
	local team_heroes = self._team_heroes
	local players_with_score = self._peers_with_score

	table.clear(team_heroes)
	table.clear(players_with_score)

	for i = 1, math.min(#self._sorted_awards, MAX_AWARDS) do
		local player_awards = self._sorted_awards[i]
		local player_stats_id = player_awards.stats_id
		local player_data = players_session_scores[player_stats_id]
		local peer_id = player_data.peer_id
		local party_id = self.context.party_composition[player_stats_id]

		if party_id then
			team_heroes[#team_heroes + 1] = self:get_hero_from_score(player_data, player_awards)
			num_party_members = num_party_members + 1
		end

		players_with_score[peer_id] = true
	end

	return num_party_members
end

local EMPTY_TABLE = {}

LevelEndViewVersus.get_hero_from_score = function (self, player_data, award_data)
	local profile_index = player_data.profile_index
	local career_index = player_data.career_index
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]
	local weapon_pose_weapon, weapon_pose_slot, weapon_pose_anim_event
	local weapon_pose = player_data.weapon_pose and player_data.weapon_pose.item_name

	if weapon_pose then
		local item = ItemMasterList[weapon_pose]

		if item then
			local skin_name = player_data.weapon_pose.skin_name
			local parent_item_name = item.parent
			local parent_item = rawget(ItemMasterList, parent_item_name) and ItemMasterList[parent_item_name]

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

	local weapon_item_name = player_data.weapon and player_data.weapon.item_name
	local weapon_item = ItemMasterList[weapon_item_name]
	local weapon_slot = weapon_item.slot_type
	local top_award = award_data.awards[1]
	local award_settings = top_award.award_settings or EMPTY_TABLE
	local breeds = award_settings.breeds or EMPTY_TABLE
	local upper_range = #breeds > 0 and #breeds or 1
	local random_seed, random_number = Math.next_random(self._random_seed, 1, upper_range)

	self._random_seed = random_seed

	local breed = breeds[random_number] or EMPTY_TABLE
	local breed_name = breed and breed.name
	local pactsworn_cosmetics = breed and player_data.pactsworn_cosmetics and player_data.pactsworn_cosmetics[breed_name]
	local breed_gear = pactsworn_cosmetics or breed.default_gear or EMPTY_TABLE
	local breed_weapon = breed_gear.weapon or breed_gear.slot_melee or breed_gear.slot_ranged
	local breed_weapon_item = breed_weapon and {
		item_name = breed_weapon,
	} or nil
	local breed_weapon_slot = not table.is_empty(breed_gear) and (breed_gear.weapon_slot and breed_gear.weapon_slot == "slot_melee" and "melee" or "ranged" or breed_gear.slot_melee and "melee" or "ranged")
	local breed_skin = breed_gear.skin or breed_gear.slot_skin

	return {
		stats_id = player_data.stats_id,
		player_name = player_data.name,
		peer_id = player_data.peer_id,
		profile_index = profile_index,
		career_index = career_index,
		hero_name = career_settings.profile_name,
		skin_name = breed_skin or player_data.hero_skin,
		frame_name = player_data.portrait_frame,
		player_level = player_data.player_level,
		award_material = award_settings.award_material or nil,
		versus_player_level = player_data.versus_player_level,
		weapon_slot = breed_weapon_slot or weapon_pose_slot or weapon_slot,
		breed = breed,
		weapon_pose_anim_event = weapon_pose_anim_event,
		random_seed = self._random_seed,
		preview_items = {
			table.is_empty(breed) and player_data.hat or nil,
			breed_weapon_item or weapon_pose_weapon or player_data.weapon,
		},
	}
end

LevelEndViewVersus._gather_hero_locations = function (self, num_players)
	local locations = {}
	local hero_locations = {}
	local level_name = "levels/carousel_podium/world"
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/versus_podium_character_spawn")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and string.find(name, "ceremony_slot_") then
			local position = LevelResource.unit_position(level_name, index)
			local number = tonumber(string.gsub(name, "ceremony_slot_", ""), 10)

			locations[number] = {
				position[1],
				position[2],
				position[3],
			}
		end
	end

	for i = 1, num_players do
		hero_locations[i] = locations[i] or {
			0,
			0,
			0,
		}
	end

	return hero_locations
end

LevelEndViewVersus._setup_team_previewer = function (self, num_players)
	if self._team_previewer then
		return
	end

	local world, viewport = self:get_viewport_world()

	self._team_previewer = TeamPreviewer:new(self.context, world, viewport)

	local team_data = self._team_heroes
	local hero_locations = self:_gather_hero_locations(num_players)

	self._team_previewer:setup_team(team_data, hero_locations)

	if table.is_empty(self._portrait_widgets) then
		self:_create_ceremony_award_widgets(team_data, hero_locations)
	end

	self._hero_previewers = {}

	for i = 1, num_players do
		self._hero_previewers[i] = self._team_previewer:get_hero_previewer(i)
	end
end

LevelEndViewVersus._create_ceremony_award_widgets = function (self, team_data, hero_locations)
	local world, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)
	local party_composition = self.context.party_composition
	local my_peer_id = Network.peer_id()
	local local_player_id = 1
	local local_player_party_id = party_composition[PlayerUtils.unique_player_id(my_peer_id, local_player_id)]

	for i = 1, #team_data do
		local player_data = team_data[i]
		local profile_index = player_data.profile_index
		local career_index = player_data.career_index
		local world_pos = hero_locations[i]
		local pos = Camera.world_to_screen(camera, Vector3(world_pos[1], world_pos[2], world_pos[3]))

		pos = UIInverseScaleVectorToResolution(pos, true)

		local party_id = party_composition[player_data.stats_id]
		local awards = self._sorted_awards[i]
		local award = awards.awards[1]
		local award_data = {
			camera = camera,
			world_pos = world_pos,
			player_name = player_data.player_name,
			level = player_data.versus_player_level or 0,
			peer_id = player_data.peer_id,
			is_mvp = award.header == "mvp",
			header = award.header,
			sound_event = award.sound,
			sub_header = award.sub_header or "",
			amount = award.amount or "",
			award_material = award.award_material or nil,
			award_mask_material = award.award_mask_material or nil,
			screen_sub_header = award.screen_sub_header or "",
			team_color = party_id == local_player_party_id and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
			is_local = party_id == local_player_party_id,
		}
		local scenegraph_id = "award_" .. i
		local award_widget_definition = UIWidgets.create_ceremony_award(scenegraph_id, award_data, {
			pos[1] - 145,
			200,
			0,
		})
		local award_widget = UIWidget.init(award_widget_definition)
		local scenegraph_id = "screen_award"
		local screen_award_widget_definition = UIWidgets.create_screen_ceremony_award(scenegraph_id, award_data, {
			0,
			0,
			0,
		}, self.ui_renderer)
		local screen_award_widget = UIWidget.init(screen_award_widget_definition)
		local award_name = "insignia_" .. i

		self._widgets_by_name[award_name] = award_widget
		self._award_widgets[#self._award_widgets + 1] = award_widget

		local screen_award_name = "screen_award_" .. i

		self._widgets_by_name[screen_award_name] = screen_award_widget
		self._screen_award_widgets[#self._screen_award_widgets + 1] = screen_award_widget
		award_widget.content.visible = false
		award_widget.content.widget_offset = award_widget.offset
		screen_award_widget.content.visible = false
	end
end

LevelEndViewVersus.create_world = function (self, context)
	local world_name = "end_screen"
	local shading_environment = "environment/ui_store_preview"
	local layer = 2
	local flags = self:get_world_flags()
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(flags))

	World.set_data(world, "avoid_blend", true)

	local top_world = Managers.world:world("top_ingame_view")

	return world, top_world
end

LevelEndViewVersus.spawn_level = function (self, context, world)
	local level_name = "levels/carousel_podium/world"
	local object_sets = {}
	local position, rotation, shading_callback, mood_setting
	local time_sliced_spawn = false
	local level = ScriptWorld.spawn_level(world, level_name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	Level.spawn_background(level)
	Level.trigger_level_loaded(level)
	self:_register_object_sets(level, level_name)
	Level.trigger_event(level, "ceremoni_enabled")

	return level
end

LevelEndViewVersus.event_show_flow_object_set = function (self, object_set_name, enable)
	local object_set_name = "flow_" .. object_set_name

	self:_show_object_set(object_set_name, enable)
end

LevelEndViewVersus.exit_to_game = function (self)
	LevelEndViewVersus.super.exit_to_game(self)
	self:play_sound(self._stop_music_event)
end

LevelEndViewVersus.activate_back_to_keep_button = function (self)
	local machine = self._machine
	local state = self._machine:state()

	if state.activate_back_to_keep_button then
		state:activate_back_to_keep_button()
	end

	self:set_input_description("continue_available")
end
