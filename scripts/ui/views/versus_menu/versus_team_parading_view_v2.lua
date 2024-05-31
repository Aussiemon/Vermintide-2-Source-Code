-- chunkname: @scripts/ui/views/versus_menu/versus_team_parading_view_v2.lua

require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/versus_menu/versus_team_parading_view_v2_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local bottom_widgets_definitions = definitions.bottom_widgets_definitions
local top_widgets_definitions = definitions.top_widgets_definitions
local team_portrait_frame_widgets = definitions.team_portrait_frame_widgets
local transition_widget_definitions = definitions.transition_widget_definitions
local animation_definitions = definitions.animation_definitions
local create_player_name_career_text = definitions.create_player_name_career_text
local view_settings = definitions.view_settings
local dlc_settings = DLCSettings.carousel

VersusTeamParadingViewV2 = class(VersusTeamParadingViewV2)
VersusTeamParadingViewV2.NAME = "VersusTeamParadingViewV2"

VersusTeamParadingViewV2.init = function (self, ingame_ui_context)
	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._ingame_ui_context = ingame_ui_context
	self._input_service_name = "ingame_menu"
	self._current_state = "none"
	self._team_heroes = {}

	local world = ingame_ui_context.world_manager:world("level_world")

	self.wwise_world = Managers.world:wwise_world(world)
end

VersusTeamParadingViewV2.on_enter = function (self, params)
	print("[VersusTeamParadingViewV2] Enter Versus Team Parading view")

	self._party_selection_logic = Managers.state.game_mode:game_mode():party_selection_logic()

	self._party_selection_logic:set_ingame_ui(self._ingame_ui)
	ShowCursorStack.push()

	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:block_device_except_service(input_service_name, "keyboard", 1)
	input_manager:block_device_except_service(input_service_name, "mouse", 1)
	input_manager:block_device_except_service(input_service_name, "gamepad", 1)

	self._animations = {}
	self.render_settings = {
		snap_pixel_positions = true,
	}

	self:_create_ui_elements(params)
	self:_set_transition_widgets_alpha_multiplier(0)
end

VersusTeamParadingViewV2.on_exit = function (self)
	print("[VersusTeamParadingViewV2] Exit character selection view")
	ShowCursorStack.pop()

	local input_manager = self._input_manager

	input_manager:device_unblock_all_services("keyboard", 1)
	input_manager:device_unblock_all_services("mouse", 1)
	input_manager:device_unblock_all_services("gamepad", 1)

	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self:_play_sound("vs_unmute_reset_all")
end

VersusTeamParadingViewV2._create_ui_elements = function (self, params)
	self._viewport_widget_definition = self:_create_viewport_definition()

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._bottom_widgets = {}
	self._top_widgets = {}
	self._transition_widgets = {}
	self._team_portrait_frame_widgets = {}
	self._player_name_widgets = {}
	self._widgets_by_name = {}

	UIUtils.create_widgets(bottom_widgets_definitions, self._bottom_widgets, self._widgets_by_name)
	UIUtils.create_widgets(top_widgets_definitions, self._top_widgets, self._widgets_by_name)
	UIUtils.create_widgets(transition_widget_definitions, self._transition_widgets, self._widgets_by_name)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

VersusTeamParadingViewV2.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self.input_manager
	local input_service = self:input_service()
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
		UIRenderer.end_pass(ui_renderer)
	end

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	self:_draw_widgets(self._bottom_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	self:_draw_widgets(self._top_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	self:_draw_widgets(self._player_name_widgets, render_settings, ui_top_renderer, alpha_multiplier)

	if self._current_state ~= "none" then
		self:_draw_widgets(self._transition_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	end

	if self._team_portrait_frame_widgets then
		self:_draw_widgets(self._team_portrait_frame_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	end

	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

VersusTeamParadingViewV2.update = function (self, dt, t)
	self:draw(dt)
end

VersusTeamParadingViewV2.post_update = function (self, dt, t)
	if DO_RELOAD then
		self:_destroy_team_previewer()
		self:_create_ui_elements(self._params)
	end

	if not self._party_id then
		if self:_setup_teams_party_data() then
			self:_create_team_portrait_frames(self._party_id, self._local_player_party_data)
			self:_create_player_name_widgets(self._party_id)
			self:_set_team_name_widget_colors_and_text(self._party_id)
		else
			return
		end
	end

	if not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)

		local world = self:_get_viewport_world(self._viewport_widget)
		local camera = self:_get_viewport_camera(self._viewport_widget)
		local level = self:_get_viewport_level(self._viewport_widget)

		self:_setup_camera_nodes_data(level)
		self:_setup_initial_camera(world, camera)
	end

	if #self._team_heroes == 0 and not self._team_previewer then
		self:_setup_team_heroes(self._party_id, self._local_player_party_data)
		self:_setup_team_previewer(true)
	end

	if self._team_previewer and not DO_RELOAD then
		local input_disabled = true

		self:_update_team_previewer(dt, t)
	end

	self:_update_parading_phases(dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt, t)
end

VersusTeamParadingViewV2._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

VersusTeamParadingViewV2._set_transition_widgets_alpha_multiplier = function (self, alpha_multiplier)
	local transition_widgets = self._transition_widgets

	for _, widget in ipairs(transition_widgets) do
		widget.alpha_multiplier = alpha_multiplier
	end
end

VersusTeamParadingViewV2._setup_teams_party_data = function (self)
	local peer_id, local_player_id = self._peer_id, self._local_player_id
	local party, party_id = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	if party_id == 0 then
		return false
	end

	local player_status = Managers.party:get_player_status(peer_id, local_player_id)

	self._slot_id = player_status.slot_id
	self._party = party
	self._party_id = party_id
	self._is_spectator = party.name == "spectators"

	local local_player_party_data = Managers.party:get_party(party_id)
	local opponents_party_id = self:_get_opponent_party_id()

	self._opponents_party_id = opponents_party_id

	local opponents_party_data = Managers.party:get_party(opponents_party_id)

	self._local_player_party_data = local_player_party_data
	self._opponents_party_data = opponents_party_data

	return true
end

VersusTeamParadingViewV2._draw_widgets = function (self, widgets, render_settings, ui_renderer, alpha_multiplier)
	if not widgets then
		return
	end

	for _, widget in ipairs(widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

VersusTeamParadingViewV2._set_new_camera_pose = function (self, camera, new_pose)
	ScriptCamera.set_local_pose(camera, new_pose:unbox())
end

VersusTeamParadingViewV2._create_team_portrait_frames = function (self, party_id, party_data)
	table.clear(self._team_portrait_frame_widgets)

	if not party_data then
		return
	end

	local pick_party_data = self._party_selection_logic:get_party_data(party_id)
	local picker_list = pick_party_data.picker_list
	local slots_data = party_data.slots_data

	for i, picker in ipairs(picker_list) do
		local slot_id = picker.slot_id
		local slot_data = slots_data[slot_id]
		local status = picker.status

		if status then
			local profile_index = status.selected_profile_index
			local career_index = status.selected_career_index
			local profile = SPProfiles[profile_index]
			local scenegraph_node_name = "player_portrait_anchor_" .. i

			if profile then
				local careers = profile.careers
				local career_settings = careers[career_index]
				local is_bot = picker.is_bot
				local portrait_frame_name = slot_data.slot_frame ~= "n/a" and slot_data.slot_frame or "frame_0000"
				local level_text = is_bot and "BOT" or "-"
				local portrait_image = career_settings.portrait_image
				local widget_definition = UIWidgets.create_portrait_frame(scenegraph_node_name, portrait_frame_name, level_text, 1, nil, portrait_image)
				local widget = UIWidget.init(widget_definition, self._ui_top_renderer)
				local widget_content = widget.content

				widget_content.frame_settings_name = portrait_frame_name
				widget.offset = {
					0,
					0,
					20,
				}
				self._team_portrait_frame_widgets[#self._team_portrait_frame_widgets + 1] = widget
			end
		end
	end
end

VersusTeamParadingViewV2._create_player_name_widgets = function (self, party_id)
	local pick_party_data = self._party_selection_logic:get_party_data(party_id)
	local picker_list = pick_party_data.picker_list

	for i, picker in ipairs(picker_list) do
		local status = picker.status
		local player_name, career_name
		local profile_index = status.selected_profile_index
		local career_index = status.selected_career_index
		local profile = SPProfiles[profile_index]
		local scenegraph_node_name = "player_portrait_anchor_" .. i

		if profile then
			local careers = profile.careers
			local career_settings = careers[career_index]

			career_name = career_settings.display_name
		end

		player_name = status.player and self:_set_player_name(status.player) or "BOT"
		career_name = career_name or "NO_CAREER"

		local widget_definition = create_player_name_career_text(scenegraph_node_name)
		local widget = UIWidget.init(widget_definition)
		local content = widget.content

		content.player_name = player_name
		content.career_name = career_name
		self._player_name_widgets[#self._player_name_widgets + 1] = widget
	end
end

VersusTeamParadingViewV2._update_parading_phases = function (self, dt, t)
	local current_state = self._current_state

	if current_state == "none" then
		self:_change_state("parade_local_player_team")
	elseif current_state == "parade_local_player_team" then
		if not self._parading_duration then
			self._parading_duration = t + Managers.state.game_mode:setting("parading_times").local_player

			self:_start_animation("on_enter", "on_enter_local_player")
			self:_play_parading_sfx(true)
		end

		if t > self._parading_duration then
			self._parading_duration = nil

			self:_change_state("team_transition")
			self:_play_sound("Play_menu_versus_parading_versus_whoosh")
		end
	elseif current_state == "team_transition" then
		if not self._parading_duration then
			self._parading_duration = t + Managers.state.game_mode:setting("parading_times").team_transition

			self:_start_animation("transition", "team_transition_fade_in")
		end

		if t > self._parading_duration - 0.25 then
			self:_start_animation("transition", "team_transition_fade_out")
		end

		if t > self._parading_duration then
			self._parading_duration = nil

			self:_change_state("parade_opponent_team")
			self:_play_parading_sfx(false)
		end
	elseif current_state == "parade_opponent_team" then
		if not self._parading_duration then
			self._parading_duration = t + Managers.state.game_mode:setting("parading_times").opponent_transition

			self:_start_animation("opponent_parading", "on_enter_opponent_team")
		end

		if t > self._parading_duration then
			self._parading_duration = nil

			self:_change_state("show_match_info")
		end
	elseif current_state == "show_match_info" and not self._parading_duration then
		self._parading_duration = t + Managers.state.game_mode:setting("parading_times").show_match_info
	end
end

VersusTeamParadingViewV2._get_heroes_spawn_locations = function (self, party_id)
	local spawn_point_unit_prefix = party_id == self._party_id and "character_slot_0" or "character_slot_enemy_0"
	local unit = "units/hub_elements/versus_podium_character_spawn"
	local level_name = self:_get_viewport_level_name()
	local unit_indices = LevelResource.unit_indices(level_name, unit)
	local hero_locations = {}

	for i = 1, 4 do
		for _, index in pairs(unit_indices) do
			local unit_data = LevelResource.unit_data(level_name, index)
			local name = DynamicData.get(unit_data, "name")

			if name and name == spawn_point_unit_prefix .. i then
				local position = LevelResource.unit_position(level_name, index)
				local x, y, z = Vector3.to_elements(position)
				local table_vector = {
					x,
					y,
					z,
				}

				hero_locations[#hero_locations + 1] = table_vector
			end
		end
	end

	fassert(#hero_locations ~= 0, "[VersusTeamParadingViewV2:_get_heroes_spawn_locations], No hero locations have been found. Check if unit: %s is present in level: %s and has the script data varaible \"name\" set to the correct name.", unit, level_name)

	return hero_locations
end

VersusTeamParadingViewV2._setup_initial_camera = function (self, world, camera)
	if world then
		local ref_camera_data = self._cameras.parading_camera_01

		self._camera = camera

		local fov = Camera.vertical_fov(ref_camera_data.camera)

		Camera.set_vertical_fov(camera, fov)
		ScriptCamera.set_local_pose(camera, ref_camera_data.camera_pose:unbox())
		ScriptCamera.force_update(world, camera)
	end
end

VersusTeamParadingViewV2._setup_camera_nodes_data = function (self, level)
	local data = {}
	local init_camera_unit = Level.flow_variable(level, "initial_camera")
	local parading_camera_01_unit = Level.flow_variable(level, "parading_position_01")
	local parading_camera_02_unit = Level.flow_variable(level, "parading_position_02")
	local init_camera_pose = Matrix4x4Box(Unit.local_pose(init_camera_unit, 0))
	local parading_camera_01_pose = Matrix4x4Box(Unit.local_pose(parading_camera_01_unit, 0))
	local parading_camera_02_pose = Matrix4x4Box(Unit.local_pose(parading_camera_02_unit, 0))
	local init_camera = Unit.camera(init_camera_unit, "camera")
	local parading_camera_01 = Unit.camera(parading_camera_01_unit, "camera")
	local parading_camera_02 = Unit.camera(parading_camera_02_unit, "camera")

	data.initial_camera = {
		camera_unit = init_camera_unit,
		camera_pose = init_camera_pose,
		camera = init_camera,
	}
	data.parading_camera_01 = {
		camera_unit = parading_camera_01_unit,
		camera_pose = parading_camera_01_pose,
		camera = parading_camera_01,
	}
	data.parading_camera_02 = {
		camera_unit = parading_camera_02_unit,
		camera_pose = parading_camera_02_pose,
		camera = parading_camera_02,
	}
	self._cameras = data
end

VersusTeamParadingViewV2._setup_team_previewer = function (self, spawn_on_setup)
	if self._team_previewer then
		return
	end

	local spawn_on_setup = spawn_on_setup or false
	local world = self:_get_viewport_world(self._viewport_widget)
	local viewport = self:_get_viewport(self._viewport_widget)

	self._team_previewer = TeamPreviewer:new(self._ingame_ui_context, world, viewport)

	local team_data = self._team_heroes
	local hero_locations = self:_get_heroes_spawn_locations(self._party_id)

	self._team_previewer:setup_team(team_data, hero_locations, spawn_on_setup)
end

VersusTeamParadingViewV2._setup_team_heroes = function (self, party_id, party_data)
	local pick_party_data = self._party_selection_logic:get_party_data(party_id)
	local picker_list = pick_party_data.picker_list
	local team_heroes = self._team_heroes

	table.clear(team_heroes)

	for i, picker in ipairs(picker_list) do
		local hero_data = self:_get_hero_previewer_data(picker, party_data)

		team_heroes[#team_heroes + 1] = hero_data or true
	end
end

VersusTeamParadingViewV2._update_team_previewer = function (self, dt, t)
	local team_previewer = self._team_previewer

	if team_previewer then
		team_previewer:update(dt, t)
		team_previewer:post_update(dt, t)
	end
end

VersusTeamParadingViewV2._destroy_team_previewer = function (self)
	if self._team_previewer and self._viewport_widget then
		self._team_previewer:on_exit()

		self._team_previewer = nil

		table.clear(self._team_heroes)
	end
end

VersusTeamParadingViewV2._create_viewport_definition = function (self)
	return {
		scenegraph_id = "screen",
		element = UIElements.Viewport,
		style = {
			viewport = {
				clear_screen_on_create = true,
				enable_sub_gui = false,
				fov = 50,
				layer = 990,
				shading_environment = "environment/ui_end_screen",
				viewport_name = "versus_parading_preview_viewport",
				world_name = "versus_parading_preview",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS,
				},
				level_name = view_settings.level_name,
				object_sets = LevelResource.object_set_names(view_settings.level_name),
				camera_position = {
					0,
					0,
					0,
				},
				camera_lookat = {
					0,
					0,
					0,
				},
			},
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
	}
end

VersusTeamParadingViewV2._get_hero_previewer_data = function (self, picker, party_data)
	local status = picker.status
	local profile_index = status.selected_profile_index
	local career_index = status.selected_career_index
	local profile_data = SPProfiles[profile_index]

	if not profile_data or profile_data.affiliation == "dark_pact" then
		return nil
	end

	local slot_id = picker.slot_id
	local slot_data = party_data.slots_data[slot_id]
	local profile_data = SPProfiles[profile_index]

	if profile_data then
		local careers = profile_data.careers
		local career_settings = careers[career_index]
		local preview_animation = career_settings.preview_animation
		local preview_wield_slot = career_settings.preview_wield_slot
		local hero_name = career_settings.profile_name
		local weapon = slot_data["slot_" .. preview_wield_slot]
		local hat = slot_data.slot_hat
		local preview_items = {
			career_settings.preview_items[1],
			{
				item_name = hat ~= "n/a" and hat or career_settings.preview_items[2].item_name,
			},
		}
		local skin_name = slot_data.slot_skin ~= "n/a" and slot_data.slot_skin or career_settings.base_skin

		return {
			profile_index = profile_index,
			career_index = career_index,
			skin_name = skin_name,
			hero_name = hero_name,
			weapon_slot = preview_wield_slot,
			preview_items = preview_items,
			preview_animation = preview_animation,
		}
	end

	return nil
end

VersusTeamParadingViewV2._get_viewport = function (self, viewport_widget)
	local pass_data = viewport_widget.element.pass_data[1]

	return pass_data.viewport
end

VersusTeamParadingViewV2._get_viewport_world = function (self, viewport_widget)
	local pass_data = viewport_widget.element.pass_data[1]

	return pass_data.world, pass_data.world_name
end

VersusTeamParadingViewV2._get_viewport_level = function (self, viewport_widget)
	local pass_data = viewport_widget.element.pass_data[1]

	return pass_data.level
end

VersusTeamParadingViewV2._get_viewport_level_name = function (self)
	return view_settings.level_name
end

VersusTeamParadingViewV2._get_viewport_camera = function (self, viewport_widget)
	local pass_data = viewport_widget.element.pass_data[1]

	return pass_data.camera
end

VersusTeamParadingViewV2._get_viewport_name = function (self, viewport_widget)
	local pass_data = viewport_widget.element.pass_data[1]

	return pass_data.viewport_name
end

VersusTeamParadingViewV2._get_opponent_party_id = function (self)
	return self._party_id == 1 and 2 or 1
end

VersusTeamParadingViewV2._set_camera_pose = function (self, world, camera, new_pose)
	ScriptCamera.set_local_pose(camera, new_pose:unbox())
	ScriptCamera.force_update(world, camera)
end

VersusTeamParadingViewV2.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

VersusTeamParadingViewV2._change_state = function (self, new_state)
	self._current_state = new_state
end

VersusTeamParadingViewV2._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self.render_settings,
		self = self,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

VersusTeamParadingViewV2._set_player_name = function (self, player)
	local player_name = player:name()
	local player_name_length = UTF8Utils.string_length(player_name)

	if player_name_length > 18 then
		player_name = string.sub(player_name, 1, 18) .. "..."
	end

	return player_name
end

VersusTeamParadingViewV2._change_team_info = function (self, party_data)
	local opponent_team_id = self:_get_opponent_party_id()

	self:_setup_team_heroes(opponent_team_id, party_data)

	local hero_locations = self:_get_heroes_spawn_locations(opponent_team_id)

	self._team_previewer:setup_team(self._team_heroes, hero_locations, true)

	local new_camera_data = self._cameras.parading_camera_02
	local world = self:_get_viewport_world(self._viewport_widget)
	local camera = self._camera
	local new_pose = new_camera_data.camera_pose

	self:_set_camera_pose(world, camera, new_pose)
	self:_set_opponent_team_names_and_portraits(opponent_team_id, party_data)
end

VersusTeamParadingViewV2._set_team_names_and_careers = function (self, party_id)
	local pick_party_data = self._party_selection_logic:get_party_data(party_id)
	local picker_list = pick_party_data.picker_list

	for i, picker in ipairs(picker_list) do
		local status = picker.status
		local player_name, career_name
		local profile_index = status.selected_profile_index
		local career_index = status.selected_career_index
		local profile = SPProfiles[profile_index]

		if profile then
			local careers = profile.careers
			local career_settings = careers[career_index]

			career_name = career_settings.display_name
		end

		player_name = status.player and self:_set_player_name(status.player) or "BOT"
		career_name = career_name or "NO_CAREER"

		local widget = self._player_name_widgets[i]
		local style = widget.style
		local content = widget.content

		content.player_name = player_name
		content.career_name = career_name
		style.player_name.text_color = Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	end
end

VersusTeamParadingViewV2._set_opponent_team_names_and_portraits = function (self, party_id, party_data)
	self:_create_team_portrait_frames(party_id, party_data)
	self:_set_team_names_and_careers(party_id)
	self:_set_team_name_widget_colors_and_text(party_id)
end

VersusTeamParadingViewV2._set_team_name_widget_colors_and_text = function (self, party_id)
	local team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[party_id]
	local is_local_player_team = self._party_id == party_id
	local ui_settings = dlc_settings.teams_ui_assets[team_name_key]
	local team_color = is_local_player_team and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local top_detail = self._widgets_by_name.top_background_detail

	top_detail.content.divider_edge_left = is_local_player_team and "divider_horizontal_hero_end_blue" or "divider_horizontal_hero_end_red"
	top_detail.content.divider_mid = is_local_player_team and "divider_horizontal_hero_middle_blue" or "divider_horizontal_hero_middle_red"
	top_detail.content.divider_edge_right.texture_id = is_local_player_team and "divider_horizontal_hero_end_blue" or "divider_horizontal_hero_end_red"

	local team_banner = self._widgets_by_name.team_flag

	team_banner.content.texture_id = is_local_player_team and ui_settings.local_flag_long_texture or ui_settings.opponent_flag_long_texture
	team_banner.offset[1] = is_local_player_team and 30 or 1658

	local bottom_detail_widget = self._widgets_by_name.bottom_background_detail

	bottom_detail_widget.content.divider_edge_left = is_local_player_team and "divider_horizontal_hero_end_blue" or "divider_horizontal_hero_end_red"
	bottom_detail_widget.content.divider_mid = is_local_player_team and "divider_horizontal_hero_middle_blue" or "divider_horizontal_hero_middle_red"
	bottom_detail_widget.content.divider_edge_right.texture_id = is_local_player_team and "divider_horizontal_hero_end_blue" or "divider_horizontal_hero_end_red"
end

VersusTeamParadingViewV2._play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

VersusTeamParadingViewV2._play_parading_sfx = function (self, local_player_team)
	local party_id = local_player_team and self._party_id or self:_get_opponent_party_id()
	local team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[party_id]
	local parading_sfx = "Play_menu_versus_parading_" .. (team_name_key == "team_hammers" and "hammers" or "skulls")

	self:_play_sound(parading_sfx)
end
