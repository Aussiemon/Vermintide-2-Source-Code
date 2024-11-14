-- chunkname: @scripts/ui/views/demo_title_ui.lua

require("scripts/ui/views/demo_character_previewer")

local definitions = local_require("scripts/ui/views/demo_title_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local career_widget_definitions = definitions.career_widget_definitions
local attract_mode_video = definitions.attract_mode_video
local dead_space_filler = definitions.dead_space_filler_widget
local create_vide_func = definitions.create_video_func
local start_game_button_widget = definitions.start_game_button_widget
local back_button_widget = definitions.back_button_widget
local console_cursor_definition = definitions.console_cursor_definition
local press_start_widget = definitions.press_start_widget
local single_widget_definitions = definitions.single_widget_definitions

DemoTitleUI = class(DemoTitleUI)

local WORLD_GUI_RESOLUTION = 1920
local CAMERA_TRANSITION_TIME = 2
local VIDEO_REFERENCE_NAME = "DemoTitleUI"

DemoTitleUI.init = function (self, world, viewport, parent)
	self._world = world
	self._viewport = viewport
	self._parent = parent
	self._attract_mode_active = false
	self._character_previewers = {}
	self._fps = 0
	self._fps_cooldown = 0
	self._draw_information_text = false

	self:_setup_gui()
	self:_setup_level()
	self:_collect_cameras()
	self:_position_camera()
	self:_setup_world_gui(parent)
	self:_create_ui_elements()
	self:_setup_input()
end

DemoTitleUI.menu_input_enabled = function (self)
	return true
end

DemoTitleUI._setup_gui = function (self)
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._ui_renderer = UIRenderer.create(self._world, "material", "materials/ui/ui_1080p_hud_single_textures", "material", "materials/ui/ui_1080p_title_screen", "material", "materials/ui/ui_1080p_start_screen", "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_versus_available_common", "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_chat", "material", attract_mode_video.video_name)

	local materials = {}

	for _, settings in pairs(CareerSettings) do
		local video = settings.video

		materials[#materials + 1] = "material"
		materials[#materials + 1] = video.resource
	end

	self._career_video_ui_renderer = UIRenderer.create(self._world, unpack(materials))

	UISetupFontHeights(self._ui_renderer.gui)
end

DemoTitleUI._setup_world_gui = function (self)
	self._world_gui = World.create_world_gui(self._world, Matrix4x4.identity(), WORLD_GUI_RESOLUTION, WORLD_GUI_RESOLUTION, "material", "materials/ui/ui_1080p_demo_textures", "immediate")

	local camera_poses = self._camera_poses
	local pose = camera_poses[DemoSettings.starting_camera_name] or Matrix4x4Box(Matrix4x4.identity())
	local position = Matrix4x4.translation(pose:unbox())
	local rotation = Matrix4x4.rotation(pose:unbox())
	local forward = Quaternion.forward(rotation)
	local new_pose = Matrix4x4.from_quaternion_position(rotation, position + forward * 1.5)

	Gui.move(self._world_gui, new_pose)
end

DemoTitleUI._setup_level = function (self)
	local level_name = DemoSettings.level_name
	local spawned_object_sets = {}
	local available_level_sets = LevelResource.object_set_names(level_name)

	for key, set in ipairs(available_level_sets) do
		if set == "shadow_lights" then
			spawned_object_sets[#spawned_object_sets + 1] = set
		elseif string.sub(set, 1, 5) == "flow_" then
			spawned_object_sets[#spawned_object_sets + 1] = set
		elseif string.sub(set, 1, 5) == "team_" then
			spawned_object_sets[#spawned_object_sets + 1] = set
		end
	end

	local position, rotation, mood_setting
	local spawn_time_sliced = false

	self._level = ScriptWorld.spawn_level(self._world, DemoSettings.level_name, spawned_object_sets, position, rotation, callback(self, "shading_callback"), mood_setting, spawn_time_sliced)

	Level.spawn_background(self._level)
end

DemoTitleUI.shading_callback = function (self, world, shading_env, viewport)
	for name, settings in pairs(OutlineSettings.colors) do
		local c = settings.color
		local color = Vector3(c[2] / 255, c[3] / 255, c[4] / 255)
		local multiplier = settings.outline_multiplier

		if settings.pulsate then
			multiplier = settings.outline_multiplier * 0.5 + math.sin(Managers.time:time("ui") * settings.pulse_multiplier) * settings.outline_multiplier * 0.5
		end

		ShadingEnvironment.set_vector3(shading_env, settings.variable, color)
		ShadingEnvironment.set_scalar(shading_env, settings.outline_multiplier_variable, multiplier)
	end
end

DemoTitleUI._collect_cameras = function (self)
	self._camera_poses = {}

	local unit_indices = LevelResource.unit_indices(DemoSettings.level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(DemoSettings.level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name ~= "" then
			assert(not self._camera_poses[name], string.format("[StateTitleScreen] There are two cameras with the same name: %s", name))

			local position = LevelResource.unit_position(DemoSettings.level_name, index)
			local rotation = LevelResource.unit_rotation(DemoSettings.level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)

			self._camera_poses[name] = Matrix4x4Box(pose)

			print("Found camera: " .. name)
		end
	end
end

DemoTitleUI._position_camera = function (self)
	local camera = ScriptViewport.camera(self._viewport)
	local starting_camera_name = DemoSettings.starting_camera_name
	local camera_pose = starting_camera_name and self._camera_poses[starting_camera_name]

	if camera_pose then
		ScriptCamera.set_local_pose(camera, camera_pose:unbox())
		ScriptCamera.force_update(self._world, camera)
	end

	self._scatter_system = World.scatter_system(self._world)
	self._scatter_system_observer = ScatterSystem.make_observer(self._scatter_system, Matrix4x4.translation(camera_pose:unbox()), Matrix4x4.rotation(camera_pose:unbox()))
end

DemoTitleUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._attract_video = UIWidget.init(UIWidgets.create_splash_video(attract_mode_video, VIDEO_REFERENCE_NAME))
	self._widgets = {}

	for name, widget in pairs(widget_definitions) do
		self._widgets[name] = UIWidget.init(widget)
	end

	self._career_widgets = {}

	for name, widget in pairs(career_widget_definitions) do
		self._career_widgets[name] = UIWidget.init(widget)
	end

	self._dead_space_filler_widget = UIWidget.init(dead_space_filler)
	self._start_game_button_widget = UIWidget.init(start_game_button_widget)
	self._back_button_widget = UIWidget.init(back_button_widget)

	local default_career = DemoSettings.characters[1]

	self:_populate_career_page(default_career.profile_name, default_career.career_index)

	self._console_cursor = UIWidget.init(definitions.console_cursor_definition)
	self._press_start_widget = UIWidget.init(press_start_widget)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	local text_style = {
		font_size = 18,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		word_wrap = true,
		text_color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			0,
			0,
			2,
		},
	}

	self._information_text = UIWidget.init(UIWidgets.create_simple_text("n/a", "information_text", nil, nil, text_style))
	self._user_gamertag_widget = UIWidget.init(UIWidgets.create_simple_rect_text("user_gamertag", "Gamertag not assigned"))
	self._change_profile_input_icon_widget = UIWidget.init(UIWidgets.create_simple_texture("xbone_button_icon_x", "change_profile_input_icon"))
	self._change_profile_input_text_widget = UIWidget.init(UIWidgets.create_simple_rect_text("change_profile_input_text", Localize("xb1_switch_profile"), 20))
	self._ui_animations = {}
	self._ui_animation_cb = {}
	self._ui_animations.reset = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.right_side_root.local_position, 1, self._ui_scenegraph.right_side_root.local_position[1], 450, 0, math.easeOutCubic)
end

DemoTitleUI._populate_career_page = function (self, profile_name, career_index)
	local profile_index = FindProfileIndex(profile_name)
	local profile_settings = SPProfiles[profile_index]
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local name = career_settings.name
	local display_name = career_settings.display_name
	local description = career_settings.description
	local icon = career_settings.icon
	local passive_ability_data = CareerUtils.get_passive_ability_by_career(career_settings)
	local activated_ability_data = CareerUtils.get_ability_data_by_career(career_settings, 1)
	local passive_display_name = passive_ability_data.display_name
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_icon = activated_ability_data.icon

	self._widgets.info_passive_icon.content.texture_id = passive_icon
	self._widgets.info_ability_icon.content.texture_id = activated_icon
	self._widgets.info_passive_title.content.text = Localize(passive_display_name)
	self._widgets.info_passive_description.content.text = UIUtils.get_ability_description(passive_ability_data)
	self._widgets.info_ability_title.content.text = Localize(activated_display_name)
	self._widgets.info_ability_description.content.text = UIUtils.get_ability_description(activated_ability_data)

	local video = career_settings.video
	local material_name = video.material_name
	local resource = video.resource

	self:_setup_video_player(material_name, resource)

	self._displayed_profile = profile_name

	local portrait_image = career_settings.portrait_image
	local frame_settings_name = "default"
	local definition = UIWidgets.create_portrait_frame("player_portrait", frame_settings_name, "-", 1, nil, portrait_image)
	local widget = UIWidget.init(definition, self._ui_renderer)

	self._career_widgets.player_portrait = widget

	local career_display_name = career_settings.display_name

	self:_set_career_widget_text("player_career_name", career_display_name)

	local ingame_display_name = profile_settings.ingame_display_name

	self:_set_career_widget_text("player_hero_name", ingame_display_name)
end

DemoTitleUI._set_career_widget_text = function (self, widget_name, text)
	local widget = self._career_widgets[widget_name]

	widget.content.text = text
end

DemoTitleUI._destroy_career_video_player = function (self)
	local ui_renderer = self._career_video_ui_renderer
	local widget = self._video_widget

	if ui_renderer and widget then
		UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME, self._world)
	end

	self._video_created = nil
end

DemoTitleUI._setup_video_player = function (self, material_name, resource)
	self:_destroy_career_video_player()
	UIRenderer.create_video_player(self._career_video_ui_renderer, VIDEO_REFERENCE_NAME, self._world, resource, true)

	local widget_definition = create_vide_func("info_window_video", material_name)
	local widget = UIWidget.init(widget_definition)

	self._video_widget = widget
	self._video_created = true

	local video_widget_content = self._video_widget.content

	video_widget_content.video_player_reference = VIDEO_REFERENCE_NAME
end

DemoTitleUI._setup_input = function (self)
	self._input_manager = Managers.input

	self._input_manager:create_input_service("main_menu", "TitleScreenKeyMaps", "TitleScreenFilters")
	self._input_manager:map_device_to_service("main_menu", "gamepad")
	self._input_manager:map_device_to_service("main_menu", "keyboard")
	self._input_manager:map_device_to_service("main_menu", "mouse")
end

DemoTitleUI._setup_characters = function (self)
	self._character_previewers = {}

	local physics_world = World.physics_world(self._world)
	local camera_pose = self._camera_poses[DemoSettings.camera_end_position]
	local unboxed_camera_pose = camera_pose:unbox()
	local camera_pos = Matrix4x4.translation(unboxed_camera_pose)
	local camera_rotation = Matrix4x4.rotation(unboxed_camera_pose)
	local camera_forward = Quaternion.forward(camera_rotation)
	local camera_forward_flat = Vector3.flat(camera_forward)
	local camera_flat_inverse_rotation = Quaternion.look(-camera_forward_flat, Vector3.up())
	local camera_right = Quaternion.right(camera_rotation)
	local camera_right_flat = Vector3.flat(camera_right)
	local characters = DemoSettings.characters

	for _, character_data in pairs(characters) do
		local character_offset_position = character_data.position_offset:unbox()
		local pos = camera_pos + camera_right_flat * character_offset_position[1] + camera_forward_flat * character_offset_position[2] + Vector3.up() * character_offset_position[3]
		local is_hit, hit_pos, hit_distance, normal = PhysicsWorld.immediate_raycast(physics_world, pos, Vector3(0, 0, -1), 5, "closest", "collision_filter", "filter_ai_mover")

		if is_hit then
			pos[3] = hit_pos[3]

			local position = Vector3Box(pos)
			local rotation = QuaternionBox(Quaternion.multiply(camera_flat_inverse_rotation, character_data.rotation:unbox()))
			local zoom_offset = character_data.zoom_offset
			local profile_name = character_data.profile_name
			local career_index = character_data.career_index

			self._character_previewers[profile_name] = DemoCharacterPreviewer:new(self._world, profile_name, career_index, position, rotation, zoom_offset)
		end
	end
end

DemoTitleUI._play_sound = function (self, event)
	return Managers.music:trigger_event(event)
end

DemoTitleUI.get_ui_renderer = function (self)
	return self._ui_renderer
end

DemoTitleUI.in_transition = function (self)
	return self._camera_transition
end

DemoTitleUI._recreate_characters = function (self)
	for profile_name, character_previewer in pairs(self._character_previewers) do
		character_previewer:destroy()
	end

	self._character_previewers = {}

	self:_setup_characters()
end

local DO_RELOAD = false

DemoTitleUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
		self:_recreate_characters()

		self._attract_mode_active = false
		DO_RELOAD = false
	end

	if table.is_empty(self._character_previewers) then
		self:_setup_characters()
	end

	self:_update_scatter(dt, t)
	self:_update_input(dt, t)
	self:_update_camera(dt, t)
	self:_update_career_information(dt, t)
	self:_update_animation(dt, t)
	self:_update_start_game(dt, t)
	self:_update_back(dt, t)
	self:_draw_3d_logo(dt, t)
	self:_draw(dt, t)
	self:_draw_fps(dt, t)
	self:_update_character_previewers(dt, t)
end

DemoTitleUI._update_scatter = function (self, dt, t)
	if self._scatter_system then
		local viewport = ScriptWorld.viewport(self._world, "title_screen_viewport")
		local camera = ScriptViewport.camera(viewport)
		local camera_pose = ScriptCamera.pose(camera)

		ScatterSystem.move_observer(self._scatter_system, self._scatter_system_observer, Matrix4x4.translation(camera_pose), Matrix4x4.rotation(camera_pose))
	end
end

DemoTitleUI._update_input = function (self, dt, t)
	if self._selected_profile then
		local input_service = Managers.input:get_service("main_menu")

		if (input_service:get("back", true) or self._back_pressed) and not self:in_transition() then
			local character_previewer = self._character_previewers[self._selected_profile]

			character_previewer:reset_state()
			self:animate_to_camera(DemoSettings.camera_end_position, nil, nil, 0.5)

			self._input_disabled = false
			self._back_pressed = false
		end
	end
end

DemoTitleUI._update_character_previewers = function (self, dt, t)
	for _, character_previewer in pairs(self._character_previewers) do
		character_previewer:update(self._ui_activated and not self._selected_profile and not self._camera_transition, dt, t)
	end

	if not self._ui_activated then
		return
	end

	local button_content = self._start_game_button_widget.content
	local hotspot = button_content.button_hotspot

	if hotspot.is_hover or self._input_disabled then
		return
	end

	local button_content = self._back_button_widget.content
	local hotspot = button_content.button_hotspot

	if hotspot.is_hover or self._input_disabled then
		return
	end
end

DemoTitleUI._update_start_game = function (self, dt, t)
	if self._camera_transition and self._selected_profile then
		return
	end

	local button_content = self._start_game_button_widget.content
	local hotspot = button_content.button_hotspot

	if hotspot.on_release then
		self._start_pressed = true
		self._input_disabled = true
	end
end

DemoTitleUI._update_back = function (self, dt, t)
	if self._camera_transition and self._selected_profile then
		return
	end

	local button_content = self._back_button_widget.content
	local hotspot = button_content.button_hotspot

	if hotspot.on_release then
		self._back_pressed = true
		self._input_disabled = true
	end
end

DemoTitleUI._update_career_information = function (self, dt, t)
	if self._input_disabled then
		return
	end

	local is_selected = false

	self._selected_profile = nil

	for profile_name, character_previewer in pairs(self._character_previewers) do
		if character_previewer:is_pressed() then
			if not self._ui_animations.animate_in then
				self._ui_animations = {}

				local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.right_side_root.local_position, 1, self._ui_scenegraph.right_side_root.local_position[1], 0, 0.4, math.easeInCubic)

				self._ui_animations.animate_in = animation

				local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.portrait_base.local_position, 1, self._ui_scenegraph.portrait_base.local_position[1], 0, 0.4, math.easeInCubic)

				self._ui_animations.animate_in_portrait = animation

				local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.button_root.local_position, 2, self._ui_scenegraph.button_root.local_position[2], 0, 0.4, math.easeInCubic)

				self._ui_animations.animate_in_buttons = animation
			end

			if self._displayed_profile ~= profile_name then
				local profile_name, career_index = character_previewer:profile_information()

				self:_populate_career_page(profile_name, career_index)
			end

			is_selected = true
		end

		if character_previewer:is_pressed() then
			if character_previewer:was_pressed_this_frame() then
				local pose = character_previewer:pressed_pose()

				self:animate_to_camera(nil, pose, callback(character_previewer, "cb_on_select_animation_complete"), 0.5)
				character_previewer:outline_unit(false)
			end

			self._selected_profile = profile_name
		end
	end

	if not is_selected and self._selected_profile and self._displayed_profile ~= self._selected_profile then
		local character_previewer = self._character_previewers[self._selected_profile]
		local profile_name, career_index = character_previewer:profile_information()

		self:_populate_career_page(profile_name, career_index)
	end

	self._ui_animation_cb = self._ui_animation_cb or {}
	self._ui_animations = self._ui_animations or {}

	if not self._ui_animations.animate_out and not self._ui_animations.delay and not is_selected and not self._selected_profile then
		local function animation_cb(self)
			local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.right_side_root.local_position, 1, self._ui_scenegraph.right_side_root.local_position[1], 450, 0.3, math.easeOutCubic)

			self._ui_animations = {}
			self._ui_animations.animate_out = animation

			local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.portrait_base.local_position, 1, self._ui_scenegraph.portrait_base.local_position[1], -450, 0.3, math.easeOutCubic)

			self._ui_animations.animate_out_portrait = animation

			local animation = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.button_root.local_position, 2, self._ui_scenegraph.button_root.local_position[2], -200, 0.3, math.easeInCubic)

			self._ui_animations.animate_out_buttons = animation
		end

		self._ui_animations.delay = UIAnimation.init(UIAnimation.function_by_time, {
			0,
			0,
			0,
		}, 1, 0, 0, 0, math.easeInCubic)
		self._ui_animation_cb.delay = animation_cb
	end
end

DemoTitleUI._update_animation = function (self, dt, t)
	for animation_name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			if self._ui_animation_cb[animation_name] then
				self._ui_animation_cb[animation_name](self)

				self._ui_animation_cb[animation_name] = nil
			end

			self._ui_animations[animation_name] = nil
		end
	end
end

DemoTitleUI._update_camera = function (self, dt, t)
	if self._camera_transition then
		self._timer = self._timer or 0

		local source_camera_pose = self._camera_poses.current_pose
		local target_camera_pose = self._target_camera_pose

		if self._target_camera_name then
			target_camera_pose = self._camera_poses[self._target_camera_name]
		end

		if not source_camera_pose or not target_camera_pose then
			self._camera_transition = false
			self._timer = nil

			return
		end

		local time = self._ref_time or CAMERA_TRANSITION_TIME

		self._timer = math.clamp(self._timer + dt, 0, time)

		local progress = math.smoothstep(self._timer / time, 0, 1)
		local pose = Matrix4x4.lerp(source_camera_pose:unbox(), target_camera_pose:unbox(), progress)
		local camera = ScriptViewport.camera(self._viewport)

		ScriptCamera.set_local_pose(camera, pose)
		ScriptCamera.force_update(self._world, camera)

		if self._timer == time then
			self._camera_transition = false
			self._timer = 0

			if self._camera_animation_cb then
				self._camera_animation_cb()

				self._camera_animation_cb = nil
			end
		end
	end

	local w, h = Gui.resolution()
	local camera_poses = self._camera_poses
	local pose = camera_poses[DemoSettings.starting_camera_name] or Matrix4x4Box(Matrix4x4.identity())
	local position = Matrix4x4.translation(pose:unbox())
	local rotation = Matrix4x4.rotation(pose:unbox())
	local forward = Quaternion.forward(rotation)
	local scale_value = w / 1920 * 0.5
	local new_pose = Matrix4x4.from_quaternion_position(rotation, position + forward * scale_value)

	Gui.move(self._world_gui, new_pose)
end

DemoTitleUI._draw_3d_logo = function (self, dt, t)
	local base_size = Vector2(1920, 1080)
	local w, h = Gui.resolution()

	Gui.bitmap(self._world_gui, "vermintide_2_logo_demo", Vector3(-base_size[1] * w / WORLD_GUI_RESOLUTION * 0.5, -base_size[2] * w / WORLD_GUI_RESOLUTION * 0.3, 1), Vector2(base_size[1] * w / WORLD_GUI_RESOLUTION, base_size[2] * w / WORLD_GUI_RESOLUTION))
end

DemoTitleUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local career_video_ui_renderer = self._career_video_ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("main_menu")
	local gamepad_active = self._input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	if self._destroy_video_player then
		UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)

		self._destroy_video_player = nil
	elseif self._attract_mode_enabled then
		if not self._attract_video.content.video_completed then
			if not ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
				UIRenderer.create_video_player(ui_renderer, VIDEO_REFERENCE_NAME, self._world, attract_mode_video.video_name, attract_mode_video.loop)
			else
				if not self._sound_started then
					if attract_mode_video.sound_start then
						Managers.music:trigger_event(attract_mode_video.sound_start)
					end

					self._sound_started = true
				end

				UIRenderer.draw_widget(ui_renderer, self._attract_video)
				UIRenderer.draw_widget(ui_renderer, self._dead_space_filler_widget)
			end
		elseif ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
			UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)

			self._sound_started = false

			if attract_mode_video.sound_stop then
				Managers.music:trigger_event(attract_mode_video.sound_stop)
			end
		end
	else
		if self._draw_information_text then
			UIRenderer.draw_widget(ui_renderer, self._information_text)
		end

		if self._draw_gamertag then
			UIRenderer.draw_widget(ui_renderer, self._user_gamertag_widget)

			if not self._switch_profile_blocked then
				UIRenderer.draw_widget(ui_renderer, self._change_profile_input_icon_widget)
				UIRenderer.draw_widget(ui_renderer, self._change_profile_input_text_widget)
			end
		end
	end

	if self._ui_activated then
		if gamepad_active then
			UIRenderer.draw_widget(ui_renderer, self._console_cursor)
		end

		for name, widget in pairs(self._widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		for name, widget in pairs(self._career_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIWidgetUtils.animate_default_button(self._start_game_button_widget, dt)
		UIWidgetUtils.animate_default_button(self._back_button_widget, dt)
		UIRenderer.draw_widget(ui_renderer, self._start_game_button_widget)
		UIRenderer.draw_widget(ui_renderer, self._back_button_widget)
	elseif not self._entering and not self:in_transition() then
		UIRenderer.draw_widget(ui_renderer, self._press_start_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if self._video_widget and self._ui_activated then
		UIRenderer.begin_pass(career_video_ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

		if not self._video_created then
			UIRenderer.draw_widget(career_video_ui_renderer, self._video_widget)
		end

		self._video_created = nil

		UIRenderer.end_pass(career_video_ui_renderer)
	end
end

local debug_font = "arial"
local debug_font_mtrl = "materials/fonts/" .. debug_font
local debug_font_size = 32
local position = {}
local white_color = Colors.color_definitions.white
local black_color = Colors.color_definitions.black
local red_color = Colors.color_definitions.red
local test_fps = 0
local test_fps_n = 0

DemoTitleUI._draw_fps = function (self, dt, t)
	if BUILD == "release" then
		return
	end

	self._old_fps = self._old_fps or 0
	self._fps = self._fps or 0
	self._fps_cooldown = self._fps_cooldown or 0

	local ui_top_renderer = self._ui_renderer
	local fps = self._old_fps

	self._fps_cooldown = self._fps_cooldown + dt
	test_fps = test_fps + 1 / dt
	test_fps_n = test_fps_n + 1

	if self._fps_cooldown > 1 then
		self._old_fps = self._fps
		self._fps = test_fps / test_fps_n
		test_fps = 0
		test_fps_n = 0
		self._fps_cooldown = 0
	end

	self._old_fps = math.lerp(self._old_fps, self._fps, dt * 0.2)

	local text = string.format("%.2f FPS", fps)
	local color
	local red_cap = 30
	local platform = PLATFORM

	if IS_CONSOLE then
		red_cap = 28
	end

	if fps < red_cap then
		color = red_color
	else
		color = white_color
	end

	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local res_width, res_height = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h

	res_width = res_width * inv_scale
	res_height = res_height * inv_scale

	local text_size = debug_font_size
	local width, height = UIRenderer.text_size(ui_top_renderer, text, debug_font_mtrl, text_size)
	local x = res_width - width - (debug_font_size - 16)
	local y = height + 16

	position[1] = x
	position[2] = y
	position[3] = 899

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), color)

	position[1] = x + 2
	position[2] = y - 2
	position[3] = 898

	UIRenderer.draw_text(ui_top_renderer, text, debug_font_mtrl, text_size, debug_font, Vector3(unpack(position)), black_color)
end

DemoTitleUI.activate_career_ui = function (self, activate)
	self._ui_activated = activate
	self._selected_profile = nil
	self._ui_animations.reset = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.right_side_root.position, 1, self._ui_scenegraph.right_side_root.position[1], 450, 0, math.easeOutCubic)

	if not activate then
		for _, character_previewer in pairs(self._character_previewers) do
			character_previewer:reset_state()
		end
	end
end

DemoTitleUI.animate_to_camera = function (self, camera_name, pose, cb, time)
	local camera = ScriptViewport.camera(self._viewport)
	local camera_pose = ScriptCamera.pose(camera)

	self._camera_poses.current_pose = Matrix4x4Box(camera_pose)
	self._target_camera_name = camera_name
	self._target_camera_pose = pose
	self._camera_transition = true
	self._camera_animation_cb = cb
	self._ref_time = time
end

DemoTitleUI.enter_attract_mode = function (self)
	self._attract_mode_enabled = true
	self._sound_started = false
	self._attract_video.content.video_content.video_completed = false
end

DemoTitleUI.exit_attract_mode = function (self)
	self._attract_mode_enabled = false
	self._destroy_video_player = true
end

DemoTitleUI.video_completed = function (self)
	return self._attract_video.content.video_content.video_completed
end

DemoTitleUI.attract_mode = function (self)
	return self._attract_mode_enabled
end

DemoTitleUI.is_ready = function (self)
	for _, character_previewer in pairs(self._character_previewers) do
		if not character_previewer:character_spawned() then
			return false
		end
	end

	return true
end

DemoTitleUI.should_start = function (self)
	return self._start_pressed
end

DemoTitleUI.selected_profile = function (self)
	return self._selected_profile
end

DemoTitleUI.set_start_pressed = function (self, pressed)
	self._entering = pressed
end

DemoTitleUI.clear_playgo_status = function (self)
	return
end

DemoTitleUI.set_playgo_status = function (self)
	return
end

DemoTitleUI.show_menu = function (self)
	return
end

DemoTitleUI.clear_user_name = function (self)
	return
end

DemoTitleUI.current_menu_index = function (self)
	return
end

DemoTitleUI.active_menu_selection = function (self)
	return
end

DemoTitleUI.set_menu_item_enable_state_by_index = function (self)
	return
end

DemoTitleUI.destroy = function (self)
	for profile_name, character_previewer in pairs(self._character_previewers) do
		character_previewer:destroy()
	end

	self._character_previewers = {}

	print("destroying demo_ui")
	ScriptWorld.destroy_level_from_reference(self._world, self._level)
	UIRenderer.destroy(self._ui_renderer, self._world)
	UIRenderer.destroy(self._career_video_ui_renderer, self._world)
	World.destroy_gui(self._world, self._world_gui)
end

DemoTitleUI.set_information_text = function (self, optinal_text)
	return
end

DemoTitleUI.set_user_name = function (self, username)
	self._draw_gamertag = true
	self._user_gamertag_widget.content.text = username

	if IS_PS4 then
		self._switch_profile_blocked = true
	end
end

DemoTitleUI.clear_user_name = function (self)
	self._draw_gamertag = nil
	self._switch_profile_blocked = nil
end

DemoTitleUI.set_update_offline_data_enabled = function (self, enable)
	return
end

DemoTitleUI.disable_input = function (self, disable)
	return
end

DemoTitleUI.set_game_type = function (self, game_type)
	return
end
