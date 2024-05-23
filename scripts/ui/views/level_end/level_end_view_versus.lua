-- chunkname: @scripts/ui/views/level_end/level_end_view_versus.lua

local definitions = local_require("scripts/ui/views/level_end/level_end_view_versus_definitions")
local widget_definitions = definitions.widget_definitions
local scenegraph_definitions = definitions.scenegraph_definitions
local animation_definitions = definitions.animation_definitions

LevelEndViewVersus = class(LevelEndViewVersus, LevelEndViewBase)

LevelEndViewVersus._setup_pages_victory = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateScoreVS = 1,
		}
	else
		return {
			EndViewStateScoreVS = 1,
		}
	end
end

LevelEndViewVersus._setup_pages_defeat = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateScoreVS = 1,
		}
	else
		return {
			EndViewStateScoreVS = 1,
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

LevelEndViewVersus.init = function (self, context)
	self._team_heroes = {}
	self._team_previewer = nil
	self._peers_with_score = {}

	LevelEndViewWeave.super.init(self, context)
end

LevelEndViewVersus._setup_pages_untrusted = function (self)
	return {
		EndViewStateScoreVS = 1,
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
		"materials/ui/ui_1080p_common",
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
	LevelEndViewVersus.super.update(self, dt, t)
	self:_start_music()
	self:_update_animations(dt, t)
	self:_update_team_previewer(dt, t)
	self:_draw(dt, t)
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
	UIRenderer.end_pass(ui_renderer)
end

LevelEndViewVersus.set_input_description = function (self, input_desc)
	self._menu_input_description:set_input_description(definitions.generic_input_actions[input_desc])
end

LevelEndViewVersus.destroy = function (self)
	LevelEndViewVersus.super.destroy(self)
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
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			camera_pose = Matrix4x4Box(pose)

			print("Found camera: " .. name)

			break
		end
	end

	self._camera_pose = camera_pose

	self:position_camera()
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
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definitions)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})
	self._ui_animations = {}
	self._portrait_widgets = {}

	self:_create_flag()
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

LevelEndViewVersus._create_flag = function (self)
	local context = self.context
	local party_composition = context.party_composition
	local my_peer_id = Network.peer_id()
	local my_unique_id = my_peer_id .. ":1"
	local my_party_id = party_composition[my_unique_id]
	local my_team = GameModeSettings.versus.party_names_lookup_by_id[my_party_id]
	local create_flag_func = definitions.create_flag_func
	local widget_definition = create_flag_func(my_team)
	local widget = UIWidget.init(widget_definition)

	self._widgets[#self._widgets + 1] = widget
	self._widgets_by_name.long_flag = widget
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

	self:_start_animation("hide_portraits", self._portrait_widgets)
end

LevelEndViewVersus.show_team = function (self)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	self:_start_animation("show_portraits", self._portrait_widgets)

	local session_scores = self.context.players_session_score
	local num_party_members = self:_setup_team_heroes(self.context.players_session_score)

	self:_setup_team_previewer(num_party_members)
end

LevelEndViewVersus._start_animation = function (self, animation_name, widgets)
	local params = {
		render_settings = self.render_settings,
	}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definitions, params)

	self._ui_animations[anim_id] = true
end

LevelEndViewVersus._setup_team_heroes = function (self, players_session_scores)
	local sorted_stat_ids = {}

	for stats_id in pairs(players_session_scores) do
		table.insert(sorted_stat_ids, stats_id)
	end

	table.sort(sorted_stat_ids)

	local num_party_members = 0
	local local_player_party_id = self.context.party_composition[PlayerUtils.unique_player_id(Network.peer_id(), 1)]
	local team_heroes = self._team_heroes
	local players_with_score = self._peers_with_score

	table.clear(team_heroes)
	table.clear(players_with_score)

	for i = 1, #sorted_stat_ids do
		local player_stat_id = sorted_stat_ids[i]
		local player_data = players_session_scores[player_stat_id]
		local peer_id = player_data.peer_id
		local local_player_id = player_data.local_player_id
		local party_id = self.context.party_composition[PlayerUtils.unique_player_id(peer_id, local_player_id)]

		if party_id and party_id == local_player_party_id then
			team_heroes[#team_heroes + 1] = self:get_hero_from_score(player_data)
			num_party_members = num_party_members + 1
		end

		players_with_score[peer_id] = true
	end

	return num_party_members
end

LevelEndViewVersus.get_hero_from_score = function (self, player_data)
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
		frame_name = player_data.portrait_frame,
		player_level = player_data.player_level,
		weapon_slot = player_data.weapon and career_settings.preview_wield_slot or nil,
		preview_items = {
			player_data.hat,
			player_data.weapon,
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

		if name and string.find(name, "character_slot_") and not string.find(name, "character_slot_enemy") then
			local position = LevelResource.unit_position(level_name, index)
			local number = tonumber(string.gsub(name, "character_slot_", ""), 10)

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
	local player_count = #team_data
	local hero_locations = self:_gather_hero_locations(num_players)

	self._team_previewer:setup_team(team_data, hero_locations)

	if table.is_empty(self._portrait_widgets) then
		self:_setup_portrait_frames(team_data, hero_locations)
	end
end

LevelEndViewVersus._setup_portrait_frames = function (self, team_data, hero_locations)
	local world, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	for i = 1, #team_data do
		local player_data = team_data[i]
		local profile_index = player_data.profile_index
		local career_index = player_data.career_index
		local world_pos = hero_locations[i]
		local pos = Camera.world_to_screen(camera, Vector3(world_pos[1], world_pos[2], world_pos[3]))

		pos = UIInverseScaleVectorToResolution(pos, true)

		local name = "portrait_frame_" .. i
		local scenegraph_id = "portrait_" .. i
		local frame_settings_name = team_data.frame_name
		local level_text = tostring(player_data.player_level)
		local scale = 1
		local retained_mode = false
		local portrait_texture = career_index and UIUtils.get_portrait_image_by_profile_index(profile_index, career_index) or "unit_frame_portrait_default"
		local widget_definition = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
		local widget = UIWidget.init(widget_definition)

		widget.offset = {
			pos[1],
			pos[2],
			widget.offset[3],
		}
		self._widgets_by_name[name] = widget
		self._portrait_widgets[#self._portrait_widgets + 1] = widget
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

	return level
end

LevelEndViewVersus.exit_to_game = function (self)
	LevelEndViewVersus.super.exit_to_game(self)
	self:play_sound(self._stop_music_event)
end
