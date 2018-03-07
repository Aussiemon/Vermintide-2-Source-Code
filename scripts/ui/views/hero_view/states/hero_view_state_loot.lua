require("scripts/ui/views/hero_view/loot_item_unit_previewer")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_loot_definitions")
local widget_definitions = definitions.widgets
local continue_button_definition = definitions.continue_button
local option_widget_definitions = definitions.option_widgets
local debug_button_widget_definitions = definitions.debug_button_widgets
local option_background_widget_definitions = definitions.option_background_widgets
local preview_widget_definitions = definitions.preview_widgets
local viewport_widget_definition = definitions.viewport_widget
local settings_by_screen = definitions.settings_by_screen
local generic_input_actions = definitions.generic_input_actions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local background_fade_definition = definitions.background_fade_definition
local camera_entry_shake_settings = {
	persistance = 0.9,
	fade_out = 0.3,
	amplitude = 1,
	duration = 0.3,
	fade_in = 0.1,
	octaves = 5.5
}
local camera_default_shake_settings = {
	persistance = 1,
	fade_out = 0.5,
	amplitude = 0.9,
	seed = 0,
	duration = 0.5,
	fade_in = 0.1,
	octaves = 7
}
local CAMERA_SHAKE_CHEST_SPAWN_TIME = 0.7
local CHEST_PRESENTATION_OPEN_WAIT_TIME = 1.2
local CHEST_PRESENTATION_ZOOM_IN_TIME = 0.8
local CHEST_PRESENTATION_ZOOM_OUT_TIME = 0.8
local CHEST_PRESENTATION_LOOK_UP_TIME = 0.9
local CHEST_PRESENTATION_LOOK_DOWN_TIME = 1
local CHEST_PRESENTATION_BONUS_WAIT_TIME = 1
local CHEST_PRESENTATION_BONUS_TIME = 2
local CHEST_PRESENTATION_EXIT_TIME = 1
local fake_input_service = {
	get = function ()
		return 
	end,
	has = function ()
		return 
	end
}
local glow_rarity_colors = {
	default = {
		front = {
			255,
			173,
			155,
			99
		},
		back = {
			255,
			255,
			223,
			154
		},
		center = {
			255,
			255,
			223,
			154
		}
	},
	plentiful = {
		front = {
			255,
			255,
			255,
			255
		},
		back = {
			255,
			255,
			255,
			255
		},
		center = {
			50,
			255,
			255,
			255
		}
	},
	common = {
		front = {
			255,
			255,
			223,
			154
		},
		back = {
			255,
			38,
			254,
			18
		},
		center = {
			150,
			38,
			254,
			18
		}
	},
	rare = {
		front = {
			255,
			154,
			255,
			219
		},
		back = {
			255,
			30,
			171,
			255
		},
		center = {
			255,
			30,
			171,
			255
		}
	},
	exotic = {
		back = {
			255,
			255,
			106,
			6
		},
		front = {
			255,
			245,
			255,
			154
		},
		center = {
			255,
			255,
			106,
			6
		}
	},
	unique = {
		front = {
			255,
			255,
			210,
			179
		},
		back = {
			255,
			254,
			25,
			18
		},
		center = {
			255,
			254,
			25,
			18
		}
	},
	promo = {
		back = {
			255,
			119,
			18,
			254
		},
		front = {
			255,
			255,
			223,
			154
		},
		center = {
			255,
			119,
			18,
			254
		}
	}
}
local skin_camera_position_by_character = {
	witch_hunter = {
		z = 0.4,
		x = 0,
		y = -1.2
	},
	bright_wizard = {
		z = 0.2,
		x = 0,
		y = -1.4
	},
	dwarf_ranger = {
		z = -0.2,
		x = 0,
		y = -1.5
	},
	wood_elf = {
		z = 0,
		x = 0,
		y = -1.2
	},
	empire_soldier = {
		z = 0.4,
		x = 0,
		y = -1.2
	},
	empire_soldier_tutorial = {
		z = 0.4,
		x = 0,
		y = -1.2
	}
}
local RELOAD_UI = false
local DEBUG_MODE = false
HeroViewStateLoot = class(HeroViewStateLoot)
HeroViewStateLoot.NAME = "HeroViewStateLoot"
HeroViewStateLoot.on_enter = function (self, params, optional_ignore_item_population)
	self.parent:clear_wanted_state()
	print("[HeroViewState] Enter Substate HeroViewStateLoot")

	self.hero_name = params.hero_name
	self.settings_by_screen = params.settings_by_screen
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.world_previewer = params.world_previewer
	self.wwise_world = params.wwise_world
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.player = local_player
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._units = {}
	self.world_manager = ingame_ui_context.world_manager
	local world = self.world_manager:create_world("loot_world", "environment/gui", nil, 980, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	World.set_data(world, "avoid_blend", true)
	ScriptWorld.deactivate(world)
	ScriptWorld.create_viewport(world, "loot_world_viewport", "overlay", 1)

	local loot_ui_renderer = self.ingame_ui:create_ui_renderer(world)
	self.loot_ui_renderer = loot_ui_renderer
	self.loot_ui_world = world
	local input_service = self.input_manager:get_service("hero_view")
	local gui_layer = UILayer.default + 30
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.loot_ui_renderer, input_service, 3, gui_layer, generic_input_actions.default)

	self.menu_input_description:set_input_description(nil)
	self.create_ui_elements(self, params)

	self.viewport_widget = UIWidget.init(viewport_widget_definition)

	self._setup_camera(self)

	self._enter_animation_duration = 0

	self.populate_items(self)
	self.set_chest_title_alpha_progress(self, 0)
	self._setup_info_window(self)

	DEBUG_MODE = script_data.debug_loot_opening

	self.play_sound(self, "play_gui_chestroom_start")
	self.disable_player_world(self)

	return 
end
HeroViewStateLoot.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end

	return 
end
HeroViewStateLoot.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end

	return 
end
HeroViewStateLoot.populate_items = function (self)
	local widgets_by_name = self._widgets_by_name
	local hero_name = self.hero_name
	local player = self.player
	local player_unit = player.player_unit
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local career_index = career_extension.career_index(career_extension)

	local function sort_func(a, b)
		local a_data = a.data
		local b_data = b.data
		local a_chest_sort_order = a_data.chest_sort_order
		local b_chest_sort_order = b_data.chest_sort_order
		local a_chest_tier = a_data.chest_tier
		local b_chest_tier = b_data.chest_tier

		if a_chest_sort_order == b_chest_sort_order then
			if a_chest_tier == b_chest_tier then
				return a.backend_id < b.backend_id
			else
				return a_chest_tier < b_chest_tier
			end
		end

		return a_chest_sort_order < b_chest_sort_order
	end

	local category_settings = settings_by_screen[1]
	local item_filter = category_settings.item_filter
	local real_items = self._get_items_by_filter(self, item_filter)
	local real_item_read_index = 1

	table.sort(real_items, sort_func)

	local items = {}
	local grid_widget = widgets_by_name.item_grid
	local item_grid = ItemGridUI:new(settings_by_screen, grid_widget, hero_name, career_index, self.hero_name, self.career_index)
	local placeholder_items = {}

	item_grid.disable_locked_items(item_grid, true)
	item_grid.disable_item_drag(item_grid)
	item_grid.apply_item_sorting_function(item_grid, sort_func)
	item_grid.change_category(item_grid, "loot")

	if self._current_page then
		local current_page, total_pages = item_grid.get_page_info(item_grid)
		local page_index = math.min(self._current_page, total_pages)

		item_grid.set_item_page(item_grid, page_index)
	end

	self._item_grid = item_grid

	self._select_grid_item(self, nil)

	return 
end
HeroViewStateLoot._get_items_by_filter = function (self, item_filter)
	local backend_items = Managers.backend:get_interface("items")
	local items = backend_items.get_filtered_items(backend_items, item_filter)

	return items
end
HeroViewStateLoot.get_background_world = function (self)
	return self.parent:get_background_world()
end
HeroViewStateLoot.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end

	return 
end
HeroViewStateLoot.wanted_menu_state = function (self)
	return self._wanted_menu_state
end
HeroViewStateLoot.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil

	return 
end
HeroViewStateLoot._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end
HeroViewStateLoot.create_ui_elements = function (self)
	if self._preview_loot_widgets then
		for _, widget in ipairs(self._preview_loot_widgets) do
			UIWidget.destroy(self.loot_ui_renderer, widget)
		end
	end

	RELOAD_UI = false
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.background_fade_widget = UIWidget.init(background_fade_definition)
	local debug_widgets = {}
	local debug_widgets_by_name = {}

	for name, widget_definition in pairs(debug_button_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		debug_widgets[#debug_widgets + 1] = widget
		debug_widgets_by_name[name] = widget
	end

	self._debug_widgets = debug_widgets
	self._debug_widgets_by_name = debug_widgets_by_name
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local option_widgets = {}
	local option_widgets_by_name = {}

	for name, widget_definition in pairs(option_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		option_widgets[#option_widgets + 1] = widget
		option_widgets_by_name[name] = widget
	end

	self._option_widgets = option_widgets
	self._option_widgets_by_name = option_widgets_by_name
	local option_background_widgets = {}
	local option_background_widgets_by_name = {}

	for name, widget_definition in pairs(option_background_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		option_background_widgets[#option_background_widgets + 1] = widget
		option_background_widgets_by_name[name] = widget
	end

	self._option_background_widgets = option_background_widgets
	self._option_background_widgets_by_name = option_background_widgets_by_name
	local preview_loot_widgets = {}
	local preview_loot_widgets_by_name = {}

	for name, widget_definition in pairs(preview_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		preview_loot_widgets[#preview_loot_widgets + 1] = widget
		preview_loot_widgets_by_name[name] = widget
	end

	self._preview_loot_widgets = preview_loot_widgets
	self._preview_loot_widgets_by_name = preview_loot_widgets_by_name
	self._continue_button_widget = UIWidget.init(continue_button_definition)

	UIRenderer.clear_scenegraph_queue(self.loot_ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self._setup_reward_option_widgets(self)

	return 
end
HeroViewStateLoot._setup_reward_option_widgets = function (self)
	local reward_options = {}

	for i = 1, 3, 1 do
		local widget_name = "loot_option_" .. i
		local background_widget_name = "loot_background_" .. i
		local data = {
			widget = self._option_widgets_by_name[widget_name],
			preview_widget = self._preview_loot_widgets_by_name[widget_name],
			background_widget = self._option_background_widgets_by_name[background_widget_name]
		}
		reward_options[i] = data
	end

	self._reward_options = reward_options

	return 
end
HeroViewStateLoot._setup_camera = function (self)
	local camera_pose = nil
	local level_name = viewport_widget_definition.style.viewport.level_name
	local unit_indices = LevelResource.unit_indices(level_name, "units/hub_elements/cutscene_camera/cutscene_camera")

	for _, index in pairs(unit_indices) do
		local unit_data = LevelResource.unit_data(level_name, index)
		local name = DynamicData.get(unit_data, "name")

		if name and name == "end_screen_camera" then
			local position = LevelResource.unit_position(level_name, index)
			local rotation = LevelResource.unit_rotation(level_name, index)
			local pose = Matrix4x4.from_quaternion_position(rotation, position)
			camera_pose = Matrix4x4Box(pose)
		end
	end

	self._camera_pose = camera_pose

	self._position_camera(self)

	return 
end
HeroViewStateLoot.set_camera_position = function (self, position)
	local _, viewport = self.get_viewport_world(self)
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_position(camera, position)
end
HeroViewStateLoot.set_camera_rotation = function (self, rotation)
	local _, viewport = self.get_viewport_world(self)
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_rotation(camera, rotation)
end
HeroViewStateLoot.get_camera_position = function (self)
	local _, viewport = self.get_viewport_world(self)
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end
HeroViewStateLoot.get_camera_rotation = function (self)
	local _, viewport = self.get_viewport_world(self)
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.rotation(camera)
end
HeroViewStateLoot.get_viewport_world = function (self)
	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	return world, viewport
end
HeroViewStateLoot._position_camera = function (self, optional_pose)
	local world, viewport = self.get_viewport_world(self)
	local camera = ScriptViewport.camera(viewport)
	local camera_pose = optional_pose or self._camera_pose:unbox()

	if camera_pose then
		local fov = 65

		Camera.set_vertical_fov(camera, (math.pi*fov)/180)
		ScriptCamera.set_local_pose(camera, camera_pose)
		ScriptCamera.force_update(world, camera)
	end

	return 
end
HeroViewStateLoot.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateLoot")

	if self.menu_input_description then
		self.menu_input_description:destroy()

		self.menu_input_description = nil
	end

	local loot_ui_renderer = self.loot_ui_renderer

	if self.viewport_widget then
		UIWidget.destroy(loot_ui_renderer, self.viewport_widget)

		self.viewport_widget = nil
	end

	local reward_options = self._reward_options

	if reward_options then
		for _, data in ipairs(reward_options) do
			local widget = data.widget
			local preview_widget = data.preview_widget
			local item_previewer = data.item_previewer

			if item_previewer then
				item_previewer.destroy(item_previewer)

				data.item_previewer = nil
			end

			local world_previewer = data.world_previewer

			if world_previewer then
				world_previewer.prepare_exit(world_previewer)
				world_previewer.on_exit(world_previewer)
				world_previewer.destroy(world_previewer)

				data.world_previewer = nil
			end

			UIWidget.destroy(loot_ui_renderer, preview_widget)
		end
	else
		local preview_loot_widgets = self._preview_loot_widgets

		for _, widget in ipairs(preview_loot_widgets) do
			UIWidget.destroy(loot_ui_renderer, widget)
		end
	end

	self._item_grid:destroy()

	self._item_grid = nil
	self.ui_animator = nil

	self.play_sound(self, "play_gui_chestroom_stop")

	if self.loot_ui_renderer then
		UIRenderer.destroy(self.loot_ui_renderer, self.loot_ui_world)
		self.world_manager:destroy_world(self.loot_ui_world)

		self.loot_ui_world = nil
		self.loot_ui_renderer = nil
	end

	self.enable_player_world(self)

	return 
end
HeroViewStateLoot._update_transition_timer = function (self, dt)
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
HeroViewStateLoot.update = function (self, dt, t)
	if RELOAD_UI then
		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._update_enter_animation_time(self, dt, t)
	self._update_chest_zoom_in_time(self, dt, t)
	self._update_chest_zoom_out_time(self, dt, t)
	self._update_camera_look_up_time(self, dt, t)
	self._update_chest_open_wait_time(self, dt, t)
	self._update_camera_look_down_time(self, dt, t)
	self._update_continue_button_animation_time(self, dt, t)
	self.draw(self, dt)
	self._update_transition_timer(self, dt)

	local wanted_state = self._wanted_state(self)

	if not self._transition_timer then
		local reward_options = self._reward_options

		if reward_options then
			for _, data in ipairs(reward_options) do
				local item_previewer = data.item_previewer

				if item_previewer then
					item_previewer.update(item_previewer, dt, t)
				end

				local world_previewer = data.world_previewer

				if world_previewer then
					world_previewer.update(world_previewer, dt, t)
				end
			end
		end

		return wanted_state or self._new_state
	end

	return 
end
HeroViewStateLoot.post_update = function (self, dt, t)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator
	local open_loot_chest_id = self._open_loot_chest_id

	if open_loot_chest_id then
		local backend_loot = Managers.backend:get_interface("loot")
		local loot_chest_opened = backend_loot.is_loot_chest_opened(backend_loot, open_loot_chest_id)

		if loot_chest_opened then
			local loot = backend_loot.get_loot_chest_rewards(backend_loot, open_loot_chest_id)

			self.loot_chest_opened(self, loot)

			self._open_loot_chest_id = nil
		end
	end

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		local item_grid = self._item_grid

		if item_grid then
			item_grid.update(item_grid, dt, t)
		end

		local active_camera_shakes = self._active_camera_shakes

		if active_camera_shakes then
			for settings, _ in pairs(active_camera_shakes) do
				self._apply_shake_event(self, settings, t)
			end
		end

		self._update_camera_shake_chest_spawn_time(self, dt, t)
		self._handle_input(self, dt, t)
		self._update_page_info(self)

		local reward_options = self._reward_options

		if reward_options then
			for _, data in ipairs(reward_options) do
				local item_previewer = data.item_previewer

				if item_previewer then
					item_previewer.post_update(item_previewer, dt, t)
				end

				local world_previewer = data.world_previewer

				if world_previewer then
					world_previewer.post_update(world_previewer, dt, t)
				end
			end
		end
	end

	return 
end
HeroViewStateLoot._update_animations = function (self, dt)
	if self._chest_presentation_active then
		self._animate_reward_options_entry(self, dt)

		for index, widget in ipairs(self._option_widgets) do
			local content = widget.content
			local button_hotspot = content.button_hotspot

			if not button_hotspot.disable_button then
				local rarity = content.rarity
				local anim_progress = 0
				local glow_alpha_progress = content.glow_alpha_progress or 0
				local speed = dt*3

				if button_hotspot.on_hover_enter then
					local sound_event = (rarity and "play_gui_chest_reward_hover_start_" .. tostring(rarity)) or "play_gui_chest_reward_start"

					self.play_sound(self, sound_event)
				elseif button_hotspot.on_hover_exit then
					local sound_event = (rarity and "play_gui_chest_reward_hover_stop_" .. tostring(rarity)) or "play_gui_chest_reward_stop"

					self.play_sound(self, sound_event)
				end

				if button_hotspot.is_hover then
					glow_alpha_progress = math.min(glow_alpha_progress + speed, 1)
					anim_progress = math.easeOutCubic(glow_alpha_progress)
				else
					glow_alpha_progress = math.max(glow_alpha_progress - speed, 0)
					anim_progress = math.easeInCubic(glow_alpha_progress)
				end

				content.glow_alpha_progress = glow_alpha_progress
				local style = widget.style
				style.lock_glow.color[1] = style.lock_glow.default_color[1]*anim_progress
				style.lock_glow_1.color[1] = style.lock_glow_1.default_color[1]*anim_progress
				style.lock_glow_2.color[1] = style.lock_glow_2.default_color[1]*anim_progress
				style.lock_bottom_glow.color[1] = style.lock_bottom_glow.default_color[1]*anim_progress
				style.lock_bottom_glow_2.color[1] = style.lock_bottom_glow_2.default_color[1]*anim_progress
			end
		end
	end

	return 
end
HeroViewStateLoot.draw = function (self, dt)
	local loot_ui_renderer = self.loot_ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings
	local input_service = input_manager.get_service(input_manager, "hero_view")
	render_settings.alpha_multiplier = 1

	UIRenderer.begin_pass(loot_ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._chest_presentation_active then
		for _, widget in ipairs(self._option_background_widgets) do
			UIRenderer.draw_widget(loot_ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = self._grid_alpha_multiplier or 1

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(loot_ui_renderer, widget)
	end

	if self._portrait_widget then
		UIRenderer.draw_widget(loot_ui_renderer, self._portrait_widget)
	end

	if DEBUG_MODE then
		for _, widget in ipairs(self._debug_widgets) do
			UIRenderer.draw_widget(loot_ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = 1

	if self.viewport_widget then
		UIRenderer.draw_widget(loot_ui_renderer, self.viewport_widget)
		UIRenderer.draw_widget(loot_ui_renderer, self.background_fade_widget)
	end

	UIRenderer.end_pass(loot_ui_renderer)

	local present_reward_options = self._present_reward_options
	local reward_options = self._reward_options

	if reward_options then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		for _, data in ipairs(reward_options) do
			if present_reward_options then
				local widget = data.widget

				UIRenderer.draw_widget(ui_top_renderer, widget)

				local frame_widget = data.frame_widget

				if frame_widget then
					UIRenderer.draw_widget(ui_top_renderer, frame_widget)
				end
			end

			local preview_widget = data.preview_widget

			UIRenderer.draw_widget(ui_top_renderer, preview_widget)
		end

		if present_reward_options and self._rewards_presented then
			render_settings.alpha_multiplier = self._continue_button_alpha_multiplier or 1

			UIRenderer.draw_widget(ui_top_renderer, self._continue_button_widget)
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	return 
end
HeroViewStateLoot._set_debug_buttons_disable_state = function (self, is_disabled)
	local debug_widgets = self._debug_widgets

	for _, widget in ipairs(debug_widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot
		hotspot.disable_button = is_disabled
	end

	return 
end
HeroViewStateLoot._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
HeroViewStateLoot._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end

	return 
end
HeroViewStateLoot._is_option_tab_selected = function (self)
	local widget = self._widgets_by_name.inventory_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_pressed then
			return i
		end
	end

	return 
end
HeroViewStateLoot._select_option_tab_by_index = function (self, index)
	local widget = self._widgets_by_name.inventory_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		hotspot_content.is_selected = i == index
	end

	return 
end
HeroViewStateLoot._select_grid_item = function (self, item, t)
	local widgets_by_name = self._widgets_by_name
	local item_grid = self._item_grid

	item_grid.set_item_selected(item_grid, item)

	if item then
		local item_data = item.data
		local chest_category = item_data.chest_category
		local chest_tier = item_data.chest_tier
		local chests_by_difficulty = LootChestData.chests_by_difficulty
		local unit_name, sound_event = nil

		for key, chests_data in pairs(chests_by_difficulty) do
			if key == chest_category then
				local chest_unit_names = chests_data.chest_unit_names

				for index, chest_unit_name in ipairs(chest_unit_names) do
					if index == chest_tier then
						unit_name = chest_unit_name
						sound_event = "play_gui_chest_appear_" .. key .. "_" .. tostring(index)

						break
					end
				end
			end
		end

		if unit_name then
			self.play_sound(self, sound_event)
			self._spawn_chest_unit(self, unit_name, nil, t)
		end

		local _, display_name, _ = UIUtils.get_ui_information_from_item(item)
		local item_type = item_data.item_type
		widgets_by_name.chest_title.content.text = Localize(display_name)
		widgets_by_name.chest_sub_title.content.text = Localize(item_type)

		self.set_chest_title_alpha_progress(self, 1)
	else
		self.set_chest_title_alpha_progress(self, 0)
	end

	self._selected_item = item
	widgets_by_name.open_button.content.button_hotspot.disable_button = item == nil

	return 
end
HeroViewStateLoot._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "hero_view")
	local parent = self.parent
	local item_grid = self._item_grid
	local open_button = widgets_by_name.open_button
	local close_button = widgets_by_name.close_button
	local continue_button = self._continue_button_widget

	UIWidgetUtils.animate_default_button(open_button, dt)
	UIWidgetUtils.animate_default_button(close_button, dt)
	UIWidgetUtils.animate_default_button(continue_button, dt)

	if self._wait_for_backend_reload then
		self._wait_for_backend_reload = math.max(self._wait_for_backend_reload - dt, 0)

		if self._wait_for_backend_reload == 0 then
			self._wait_for_backend_reload = nil

			self._set_debug_buttons_disable_state(self, false)
			self.populate_items(self)
		end

		return 
	end

	if self._chest_presentation_active then
		for index, widget in ipairs(self._option_widgets) do
			if self._is_button_pressed(self, widget) then
				self.open_reward_option(self, index)

				break
			end
		end

		if self._rewards_presented and (self._is_button_pressed(self, continue_button) or input_service.get(input_service, "toggle_menu")) then
			self.play_sound(self, "play_gui_chest_opening_return")

			self._opening_chest = nil
			self._chest_presentation_active = nil
			self._present_reward_options = nil
			self._chest_zoom_out_duration = 0
			self._camera_look_down_duration = 0

			self.set_continue_button_animation_progress(self, 0)

			local reward_options = self._reward_options

			if reward_options then
				for _, data in ipairs(reward_options) do
					local widget = data.widget
					local preview_widget = data.preview_widget
					local background_widget = data.background_widget
					local item_previewer = data.item_previewer

					if item_previewer then
						item_previewer.destroy(item_previewer)

						data.item_previewer = nil
					end

					local world_previewer = data.world_previewer

					if world_previewer then
						world_previewer.prepare_exit(world_previewer)
						world_previewer.on_exit(world_previewer)
						world_previewer.destroy(world_previewer)

						data.world_previewer = nil
					end

					table.clear(data)

					data.widget = widget
					data.preview_widget = preview_widget
					data.background_widget = background_widget
				end
			end

			self.populate_items(self)
		end
	elseif not self._opening_chest then
		local page_button_next = widgets_by_name.page_button_next
		local page_button_previous = widgets_by_name.page_button_previous

		if self._is_button_hovered(self, page_button_next) or self._is_button_hovered(self, page_button_previous) then
			self.play_sound(self, "play_gui_inventory_next_hover")
		end

		if self._is_button_pressed(self, page_button_next) then
			local next_page_index = self._current_page + 1

			item_grid.set_item_page(item_grid, next_page_index)
			self.play_sound(self, "play_gui_equipment_inventory_next_click")
		elseif self._is_button_pressed(self, page_button_previous) then
			local next_page_index = self._current_page - 1

			item_grid.set_item_page(item_grid, next_page_index)
			self.play_sound(self, "play_gui_equipment_inventory_next_click")
		end

		if item_grid.is_item_hovered(item_grid) then
			self.play_sound(self, "play_gui_inventory_item_hover")
		end

		local allow_single_press = true
		local item = item_grid.is_item_pressed(item_grid, allow_single_press)

		if item and (not self._selected_item or self._selected_item.backend_id ~= item.backend_id) then
			self._select_grid_item(self, item, t)
		end

		if self._is_button_pressed(self, open_button) and self._selected_item then
			self._open_chest(self, self._selected_item)
		elseif self._is_button_pressed(self, close_button) or input_service.get(input_service, "toggle_menu") then
			parent.close_menu(parent)
			self.play_sound(self, "Play_hud_select")
		end

		if DEBUG_MODE then
			local debug_pressed = false
			local debug_widgets_by_name = self._debug_widgets_by_name

			if self._is_button_pressed(self, debug_widgets_by_name.debug_add_chest_1) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot.generate_loot_chest(backend_loot, "normal", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if self._is_button_pressed(self, debug_widgets_by_name.debug_add_chest_2) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot.generate_loot_chest(backend_loot, "hard", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if self._is_button_pressed(self, debug_widgets_by_name.debug_add_chest_3) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot.generate_loot_chest(backend_loot, "harder", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if self._is_button_pressed(self, debug_widgets_by_name.debug_add_chest_4) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot.generate_loot_chest(backend_loot, "hardest", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if debug_pressed then
				self._set_debug_buttons_disable_state(self, true)

				self._wait_for_backend_reload = 0.2
			end
		end
	end

	return 
end
HeroViewStateLoot._update_page_info = function (self)
	local current_page, total_pages = self._item_grid:get_page_info()

	if current_page ~= self._current_page or total_pages ~= self._total_pages then
		self._total_pages = total_pages
		self._current_page = current_page
		current_page = current_page or 1
		total_pages = total_pages or 1
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.page_text_left.content.text = tostring(current_page)
		widgets_by_name.page_text_right.content.text = tostring(total_pages)
		widgets_by_name.page_button_next.content.button_hotspot.disable_button = current_page == total_pages
		widgets_by_name.page_button_previous.content.button_hotspot.disable_button = current_page == 1
	end

	return 
end
HeroViewStateLoot.open_reward_option = function (self, index)
	local reward_options = self._reward_options
	local reward_option = reward_options[index]
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
		reward_option = reward_option
	}
	local widget = reward_option.widget
	local content = widget.content
	local button_hotspot = content.button_hotspot
	button_hotspot.disable_button = true

	self._start_animation(self, "open_loot_widget", "open_loot_widget", widget, params)

	self._num_rewards_opened = self._num_rewards_opened + 1

	if self._num_rewards_opened == #reward_options then
		self._rewards_presented = true
		self._continue_button_animation_duration = 0
	end

	return 
end
HeroViewStateLoot._setup_rewards = function (self, rewards)
	local backend_items = Managers.backend:get_interface("items")
	local reward_options = self._reward_options
	local player = self.player
	local hero_name = self.hero_name

	for index, data in ipairs(reward_options) do
		local backend_id = rewards[index]
		local item = backend_items.get_item_from_id(backend_items, backend_id)
		local item_data = item.data
		local item_key = item_data.key
		local item_rarity = backend_items.get_item_rarity(backend_items, backend_id)
		local item_type = item_data.item_type
		local slot_type = item_data.slot_type
		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)
		local background_widget = data.background_widget
		background_widget.style.background.color = Colors.get_color_table_with_alpha(item_rarity, 255)
		local rarity_frame_texture = UISettings.item_rarity_textures[item_rarity]
		local rarity_glow_color_data = glow_rarity_colors[item_rarity]
		data.reward_backend_id = backend_id
		data.reward_key = item_key
		local widget = data.widget
		local content = widget.content
		local style = widget.style
		content.rarity = item_rarity
		content.item = item
		content.item_icon = inventory_icon
		content.item_icon_rarity = rarity_frame_texture
		content.item_name = Localize(display_name)
		content.item_type = Localize(item_type)
		content.presentation_complete = nil
		content.draw_frame = nil
		content.button_hotspot.disable_button = false
		content.glow_alpha_progress = 0
		style.item_name.text_color[1] = 0
		style.item_name_shadow.text_color[1] = 0
		style.item_type.text_color[1] = 0
		style.item_type_shadow.text_color[1] = 0
		style.item_icon.offset[2] = -40
		style.item_tooltip.offset[2] = -40
		style.item_type.text_color = Colors.get_color_table_with_alpha(item_rarity, 0)
		local glow_color_back = rarity_glow_color_data.back
		local glow_color_front = rarity_glow_color_data.front
		local glow_color_center = rarity_glow_color_data.center

		self._apply_color_to_glow_style(self, style.lock_bottom_glow, glow_color_back)
		self._apply_color_to_glow_style(self, style.lock_bottom_glow_2, glow_color_front)
		self._apply_color_to_glow_style(self, style.lock_glow, glow_color_back)
		self._apply_color_to_glow_style(self, style.lock_glow_1, glow_color_center)
		self._apply_color_to_glow_style(self, style.lock_glow_2, glow_color_front)
		self._apply_color_to_glow_style(self, style.final_glow, glow_color_back)
		self._apply_color_to_glow_style(self, style.final_glow_1, glow_color_center)
		self._apply_color_to_glow_style(self, style.final_glow_2, glow_color_front)

		content.lock_glow = "loot_presentation_circle_glow_" .. item_rarity
		content.final_glow = "loot_presentation_circle_glow_" .. item_rarity .. "_large"
		content.image = nil
		content.amount_text = nil
		content.item_icon_frame = "item_frame"

		if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
			local preview_widget = data.preview_widget
			local previewer_pass_data = preview_widget.element.pass_data[1]
			local viewport = previewer_pass_data.viewport
			local world = previewer_pass_data.world
			local reward = {
				data = item_data,
				backend_id = backend_id
			}
			local preview_position = {
				0,
				0,
				0
			}
			local item_previewer = LootItemUnitPreviewer:new(reward, preview_position, world, viewport, index)
			data.item_previewer = item_previewer

			if slot_type == "weapon_skin" then
				content.item_icon_frame = "item_skin_frame_03"
			end
		elseif slot_type == "skin" then
			local preview_widget = data.preview_widget
			local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, skin_camera_position_by_character, index)

			world_previewer.on_enter(world_previewer, preview_widget, hero_name)
			world_previewer.wait_for_force_unhide(world_previewer)

			local player_unit = player.player_unit
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local career_index = career_extension.career_index(career_extension)
			local optional_skin = item_data.name

			self._spawn_hero_skin_unit(self, world_previewer, hero_name, career_index, optional_skin)

			data.world_previewer = world_previewer
			content.item_icon_frame = "item_skin_frame_03"
		elseif slot_type == "crafting_material" or slot_type == "deed" or slot_type == "trinket" or slot_type == "necklace" or slot_type == "ring" then
			local texture_name = nil

			if item_key == "crafting_material_scrap" then
				texture_name = "loot_image_scrap"
			elseif item_key == "crafting_material_weapon" then
				texture_name = "loot_image_weapon_part"
			elseif item_key == "crafting_material_jewellery" then
				texture_name = "loot_image_jewellery_part"
			elseif slot_type == "trinket" then
				texture_name = "loot_image_trinket"
			elseif slot_type == "necklace" then
				texture_name = "loot_image_jewellery"
			elseif slot_type == "ring" then
				texture_name = "loot_image_charm"
			end

			if slot_type == "crafting_material" then
				local amount = backend_items.get_item_amount(backend_items, backend_id)
				content.amount_text = "x" .. tostring(amount)
			elseif slot_type == "deed" then
				texture_name = "loot_image_deed"
			end

			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
			content.image = texture_name
			style.image.texture_size[1] = texture_settings.size[1]
			style.image.texture_size[2] = texture_settings.size[2]
		elseif slot_type == "frame" then
			local profile_index = FindProfileIndex(hero_name)
			local profile = SPProfiles[profile_index]
			local player_unit = player.player_unit
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local career_index = career_extension.career_index(career_extension)
			local career_settings = profile.careers[career_index]
			local portrait_image = career_settings.portrait_image
			local portrait_frame = self._get_portrait_frame(self, player)
			local scenegraph_id = "loot_option_" .. index .. "_center"
			local scale = 1.5
			local frame_widget = self._create_player_portrait(self, scenegraph_id, portrait_frame, portrait_image, "", scale)
			data.frame_widget = frame_widget
		end
	end

	self._present_reward_options = true

	self._set_background_blur_progress(self, 1)

	return 
end
HeroViewStateLoot._apply_color_to_glow_style = function (self, style, color)
	local style_color = style.color
	local style_default_color = style.default_color
	style_color[1] = 0
	style_color[2] = color[2]
	style_color[3] = color[3]
	style_color[4] = color[4]
	style_default_color[1] = color[1]
	style_default_color[2] = color[2]
	style_default_color[3] = color[3]
	style_default_color[4] = color[4]

	return 
end
HeroViewStateLoot._spawn_hero_skin_unit = function (self, world_previewer, hero_name, career_index, optional_skin)
	local callback = callback(self, "cb_hero_unit_spawned", world_previewer, hero_name, career_index)

	world_previewer.spawn_hero_unit(world_previewer, hero_name, career_index, false, callback, 0.01, nil, optional_skin)

	return 
end
HeroViewStateLoot.cb_hero_unit_spawned = function (self, world_previewer, hero_name, career_index)
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_animation = career_settings.preview_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_name in ipairs(preview_items) do
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			world_previewer.equip_item(world_previewer, item_name, slot)
		end

		if preview_wield_slot then
			world_previewer.wield_weapon_slot(world_previewer, preview_wield_slot)
		end
	end

	if preview_animation then
		world_previewer.play_character_animation(world_previewer, preview_animation)
	end

	return 
end
HeroViewStateLoot._create_player_portrait = function (self, scenegraph_id, portrait_frame, portrait_image, player_level_text, optional_scale)
	local definition = UIWidgets.create_portrait_frame(scenegraph_id, portrait_frame, player_level_text, optional_scale or 1, nil, portrait_image)
	local widget = UIWidget.init(definition)

	return widget
end
HeroViewStateLoot._get_portrait_frame = function (self, player)
	local unit = player.player_unit
	local player_portrait_frame = "default"

	if unit and player then
		local dead_portrait_frame = "unit_frame_death"
		local network_manager = Managers.state.network
		local network_game = network_manager.game(network_manager)

		if network_game and not LEVEL_EDITOR_TEST and Unit.alive(unit) then
			if player.local_player then
				local career_extension = ScriptUnit.extension(unit, "career_system")
				local career_name = career_extension.career_name(career_extension)
				local item_interface = Managers.backend:get_interface("items")
				local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

				if item then
					local item_data = item.data
					local frame_name = item_data.temporary_template

					if not frame_name then
					end
				end
			else
				local unit_id = network_manager.unit_game_object_id(network_manager, unit)
				local frame_name_id = GameSession.game_object_field(network_game, unit_id, "frame_name")
				player_portrait_frame = NetworkLookup.cosmetics[frame_name_id]
			end
		end
	end

	return player_portrait_frame
end
HeroViewStateLoot._set_background_blur_progress = function (self, progress)
	local world, viewport = self.get_viewport_world(self)
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", progress*1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", progress*0.75)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
HeroViewStateLoot.play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroViewStateLoot._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id

	return 
end
HeroViewStateLoot._start_animation = function (self, key, animation_name, widget, optional_params)
	if not optional_params then
		local params = {
			wwise_world = self.wwise_world
		}
	end

	local animation_id = self.ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)
	self._animations[key] = animation_id

	return animation_id
end
HeroViewStateLoot._open_chest = function (self, selected_item)
	local backend_loot = Managers.backend:get_interface("loot")
	local hero_name = self.hero_name
	local backend_id = selected_item.backend_id
	self._open_loot_chest_id = backend_loot.open_loot_chest(backend_loot, hero_name, backend_id)
	self._chest_zoom_in_duration = 0
	self._chest_zoom_out_duration = nil

	if self._chest_unit then
		local anim_name = "loot_chest_open"

		Unit.flow_event(self._chest_unit, anim_name)
	end

	local selected_item_data = selected_item.data
	local chest_category = selected_item_data.chest_category
	local chest_tier = selected_item_data.chest_tier
	local chests_by_difficulty = LootChestData.chests_by_difficulty
	self._opening_chest = true
	self._rewards_presented = false
	local unit_name = nil

	for key, chests_data in pairs(chests_by_difficulty) do
		if key == chest_category then
			local chest_unit_names = chests_data.chest_unit_names

			for index, chest_unit_name in ipairs(chest_unit_names) do
				if index == chest_tier then
					local sound_event = "play_gui_chest_open_" .. key .. "_" .. tostring(index)

					self.play_sound(self, sound_event)

					return 
				end
			end
		end
	end

	return 
end
HeroViewStateLoot.loot_chest_opened = function (self, loot)
	local selected_item = self._selected_item
	local num_loot = loot and #loot
	local has_chest = BackendUtils.has_loot_chest()

	if not has_chest then
		local world = self.world_manager:world("level_world")

		LevelHelper:flow_event(world, "local_player_opened_all_loot_chests")
	end

	self._start_reward_presentation(self, loot)

	return 
end
HeroViewStateLoot._start_reward_presentation = function (self, loot)
	local unit = self._chest_unit

	if not unit then
		return 
	end

	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.loot_option_1.size[2] = 0
	ui_scenegraph.loot_option_2.size[2] = 0
	ui_scenegraph.loot_option_3.size[2] = 0
	self._chest_loot = loot

	self._setup_rewards(self, self._chest_loot)

	self._chest_presentation_active = true
	self._num_rewards_opened = 0
	self._selected_item = nil

	self.set_reward_options_height_progress(self, 0)

	return 
end
HeroViewStateLoot._animate_reward_options_entry = function (self, dt)
	local reward_options_entry_progress = self._reward_options_entry_progress

	if not reward_options_entry_progress then
		return 
	end

	local progress = math.min(reward_options_entry_progress + dt, 1)

	self.set_reward_options_height_progress(self, progress)

	if progress == 1 then
		self._reward_options_entry_progress = nil
	else
		self._reward_options_entry_progress = progress
	end

	return 
end
HeroViewStateLoot.set_reward_options_height_progress = function (self, progress)
	local w, h = UIResolution()
	local progress_1 = math.min(progress*1.1, 1)
	local progress_2 = math.min(progress*1.3, 1)
	local progress_3 = progress
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.loot_option_1.local_position[2] = -h*(math.catmullrom(math.easeOutCubic(progress_1), 0, 0, 1, -1.8) - 1)
	ui_scenegraph.loot_option_2.local_position[2] = -h*(math.catmullrom(math.easeOutCubic(progress_2), 0, 0, 1, -1.8) - 1)
	ui_scenegraph.loot_option_3.local_position[2] = -h*(math.catmullrom(math.easeOutCubic(progress_3), 0, 0, 1, -1.8) - 1)

	return 
end
HeroViewStateLoot._spawn_chest_unit = function (self, unit_name, instant_spawn, t)
	local world = self.get_viewport_world(self)

	if self._chest_unit then
		World.destroy_unit(world, self._chest_unit)
	end

	local unit = World.spawn_unit(world, unit_name)
	local link_unit = self.get_world_link_unit(self)

	World.link_unit(world, unit, 0, link_unit, 0)

	if instant_spawn then
		local anim_name = "loot_chest_init"

		Unit.flow_event(unit, anim_name)

		self._camera_shake_chest_spawn_duration = nil
	else
		local anim_name = "loot_chest_enter"

		Unit.flow_event(unit, anim_name)

		self._camera_shake_chest_spawn_duration = 0
	end

	self._current_chest_unit_name = unit_name
	self._chest_unit = unit

	return 
end
HeroViewStateLoot.get_world_link_unit = function (self)
	local level_name = viewport_widget_definition.style.viewport.level_name
	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local world = previewer_pass_data.world
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

	return 
end
HeroViewStateLoot.set_camera_zoom = function (self, progress)
	local camera_pose = self._camera_pose:unbox()
	local translation = Matrix4x4.translation(camera_pose)
	local rotation = Matrix4x4.rotation(camera_pose)
	local max_distance = 0.5
	local distance = max_distance*progress
	local dir = Quaternion.forward(rotation)
	local position = translation + dir*distance

	self.set_camera_position(self, position)

	return 
end
HeroViewStateLoot.set_grid_animation_progress = function (self, progress)
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.info_root.local_position[1] = progress*400
	ui_scenegraph.item_grid_root.local_position[1] = progress*-400
	ui_scenegraph.open_button.local_position[2] = progress*200 - 30
	ui_scenegraph.close_button.local_position[2] = progress*200 - 30
	self._grid_alpha_multiplier = progress - 1

	return 
end
HeroViewStateLoot.set_continue_button_animation_progress = function (self, progress)
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.continue_button.local_position[2] = progress*200 + -170
	self._continue_button_alpha_multiplier = progress

	return 
end
HeroViewStateLoot.set_chest_title_alpha_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local alpha = progress*255
	widgets_by_name.chest_title.style.text.text_color[1] = alpha
	widgets_by_name.chest_title.style.text_shadow.text_color[1] = alpha
	widgets_by_name.chest_sub_title.style.text.text_color[1] = alpha
	widgets_by_name.chest_sub_title.style.text_shadow.text_color[1] = alpha
	self._chest_title_alpha_progress = progress

	return 
end
HeroViewStateLoot._update_enter_animation_time = function (self, dt, t)
	local center_animation_duration = self._enter_animation_duration

	if not center_animation_duration then
		return 
	end

	center_animation_duration = center_animation_duration + dt
	local progress = math.min(center_animation_duration/CHEST_PRESENTATION_ZOOM_OUT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self.set_grid_animation_progress(self, animation_progress - 1)

	if progress == 1 then
		self._enter_animation_duration = nil
	else
		self._enter_animation_duration = center_animation_duration
	end

	return 
end
HeroViewStateLoot._update_continue_button_animation_time = function (self, dt, t)
	local continue_button_animation_duration = self._continue_button_animation_duration

	if not continue_button_animation_duration then
		return 
	end

	continue_button_animation_duration = continue_button_animation_duration + dt
	local progress = math.min(continue_button_animation_duration/CHEST_PRESENTATION_ZOOM_OUT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self.set_continue_button_animation_progress(self, animation_progress)

	if progress == 1 then
		self._continue_button_animation_duration = nil
	else
		self._continue_button_animation_duration = continue_button_animation_duration
	end

	return 
end
HeroViewStateLoot._update_camera_look_up_time = function (self, dt, t)
	local camera_look_up_duration = self._camera_look_up_duration

	if not camera_look_up_duration then
		return 
	end

	local previous_progress = math.min(camera_look_up_duration/CHEST_PRESENTATION_LOOK_UP_TIME, 1)
	local previous_animation_progress = math.easeCubic(previous_progress)
	camera_look_up_duration = camera_look_up_duration + dt
	local progress = math.min(camera_look_up_duration/CHEST_PRESENTATION_LOOK_UP_TIME, 1)
	local animation_progress = math.easeCubic(progress)
	local degrees = 60
	local previous_angle = math.degrees_to_radians(degrees*previous_animation_progress)
	local angle = math.degrees_to_radians(degrees*animation_progress)
	local animation_rotation = Quaternion(Vector3.right(), angle - previous_angle)
	local current_rotation = self.get_camera_rotation(self)
	local new_rotation = Quaternion.multiply(current_rotation, animation_rotation)

	self.set_camera_rotation(self, new_rotation)

	self.background_fade_widget.style.rect.color[1] = animation_progress*200

	if progress == 1 then
		if self._chest_unit then
			Unit.set_unit_visibility(self._chest_unit, false)
		end

		self._camera_look_up_duration = nil
	else
		self._camera_look_up_duration = camera_look_up_duration
	end

	return 
end
HeroViewStateLoot._update_camera_look_down_time = function (self, dt, t)
	local camera_look_down_duration = self._camera_look_down_duration

	if not camera_look_down_duration then
		return 
	end

	local previous_progress = math.min(camera_look_down_duration/CHEST_PRESENTATION_LOOK_DOWN_TIME, 1)
	local previous_animation_progress = math.easeOutCubic(previous_progress)
	camera_look_down_duration = camera_look_down_duration + dt
	local progress = math.min(camera_look_down_duration/CHEST_PRESENTATION_LOOK_DOWN_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)
	local degrees = -60
	local previous_angle = math.degrees_to_radians(degrees*previous_animation_progress)
	local angle = math.degrees_to_radians(degrees*animation_progress)
	local animation_rotation = Quaternion(Vector3.right(), angle - previous_angle)
	local current_rotation = self.get_camera_rotation(self)
	local new_rotation = Quaternion.multiply(current_rotation, animation_rotation)

	self.set_camera_rotation(self, new_rotation)

	self.background_fade_widget.style.rect.color[1] = (animation_progress - 1)*200

	if progress == 1 then
		self._camera_look_down_duration = nil
	else
		self._camera_look_down_duration = camera_look_down_duration
	end

	return 
end
HeroViewStateLoot._update_chest_open_wait_time = function (self, dt, t)
	local chest_open_wait_duration = self._chest_open_wait_duration

	if not chest_open_wait_duration then
		return 
	end

	chest_open_wait_duration = chest_open_wait_duration + dt
	local progress = math.min(chest_open_wait_duration/CHEST_PRESENTATION_OPEN_WAIT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	if progress == 1 then
		self._camera_look_up_duration = 0
		self._reward_options_entry_progress = 0

		self.play_sound(self, "play_gui_chest_reward_enter")

		self._chest_open_wait_duration = nil
	else
		self._chest_open_wait_duration = chest_open_wait_duration
	end

	return 
end
HeroViewStateLoot._update_chest_zoom_in_time = function (self, dt, t)
	local chest_zoom_in_duration = self._chest_zoom_in_duration

	if not chest_zoom_in_duration then
		return 
	end

	chest_zoom_in_duration = chest_zoom_in_duration + dt
	local progress = math.min(chest_zoom_in_duration/CHEST_PRESENTATION_ZOOM_IN_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self.set_camera_zoom(self, animation_progress)
	self.set_grid_animation_progress(self, animation_progress)
	self.set_chest_title_alpha_progress(self, animation_progress - 1)

	if progress == 1 then
		self._chest_zoom_in_duration = nil
		self._chest_open_wait_duration = 0
	else
		self._chest_zoom_in_duration = chest_zoom_in_duration
	end

	return 
end
HeroViewStateLoot._update_chest_zoom_out_time = function (self, dt, t)
	local chest_zoom_out_duration = self._chest_zoom_out_duration

	if not chest_zoom_out_duration then
		return 
	end

	chest_zoom_out_duration = chest_zoom_out_duration + dt
	local progress = math.min(chest_zoom_out_duration/CHEST_PRESENTATION_ZOOM_OUT_TIME, 1) - 1
	local animation_progress = math.easeInCubic(progress)

	self.set_camera_zoom(self, animation_progress)
	self.set_grid_animation_progress(self, animation_progress)

	if progress == 0 then
		self._chest_zoom_out_duration = nil
	else
		self._chest_zoom_out_duration = chest_zoom_out_duration
	end

	return 
end
HeroViewStateLoot._update_camera_shake_chest_spawn_time = function (self, dt, t)
	local camera_shake_chest_spawn_duration = self._camera_shake_chest_spawn_duration

	if not camera_shake_chest_spawn_duration then
		return 
	end

	camera_shake_chest_spawn_duration = camera_shake_chest_spawn_duration + dt
	local progress = math.min(camera_shake_chest_spawn_duration/CAMERA_SHAKE_CHEST_SPAWN_TIME, 1)

	if progress == 1 then
		self._camera_shake_chest_spawn_duration = nil

		self.add_camera_shake(self, camera_entry_shake_settings, t, 1)
	else
		self._camera_shake_chest_spawn_duration = camera_shake_chest_spawn_duration
	end

	return 
end
HeroViewStateLoot.add_camera_shake = function (self, settings, start_time, scale)
	local data = {}
	local settings = settings or camera_default_shake_settings
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
	self._active_camera_shakes = {
		[data] = true
	}

	return 
end
HeroViewStateLoot._apply_shake_event = function (self, settings, t)
	local active_camera_shakes = self._active_camera_shakes
	local start_time = settings.start_time
	local end_time = settings.end_time
	local fade_in_time = settings.fade_in_time
	local fade_out_time = settings.fade_out_time

	if fade_in_time and t <= fade_in_time then
		settings.fade_progress = math.clamp((t - start_time)/(fade_in_time - start_time), 0, 1)
	elseif fade_out_time and fade_out_time <= t then
		settings.fade_progress = math.clamp((end_time - t)/(end_time - fade_out_time), 0, 1)
	end

	local pitch_noise_value = self._calculate_perlin_value(self, t - settings.start_time, settings)*settings.scale
	local yaw_noise_value = self._calculate_perlin_value(self, t - settings.start_time + 10, settings)*settings.scale
	local current_rot = self.get_camera_rotation(self)
	local deg_to_rad = math.pi/180
	local yaw_offset = Quaternion(Vector3.up(), yaw_noise_value*deg_to_rad)
	local pitch_offset = Quaternion(Vector3.right(), pitch_noise_value*deg_to_rad)
	local total_offset = Quaternion.multiply(yaw_offset, pitch_offset)
	local rotation = Quaternion.multiply(Quaternion.identity(), total_offset)

	self.set_camera_rotation(self, rotation)

	if settings.end_time and settings.end_time <= t then
		active_camera_shakes[settings] = nil
	end

	return 
end
HeroViewStateLoot._calculate_perlin_value = function (self, x, settings)
	local total = 0
	local shake_settings = settings.shake_settings
	local persistance = shake_settings.persistance
	local number_of_octaves = shake_settings.octaves

	for i = 0, number_of_octaves, 1 do
		local frequency = 2^i
		local amplitude = persistance^i
		total = total + self._interpolated_noise(self, x*frequency, settings)*amplitude
	end

	local amplitude_multiplier = shake_settings.amplitude or 1
	local fade_multiplier = settings.fade_progress or 1
	total = total*amplitude_multiplier*fade_multiplier

	return total
end
HeroViewStateLoot._interpolated_noise = function (self, x, settings)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = self._smoothed_noise(self, x_floored, settings)
	local v2 = self._smoothed_noise(self, x_floored + 1, settings)

	return math.lerp(v1, v2, remainder)
end
HeroViewStateLoot._smoothed_noise = function (self, x, settings)
	return self._noise(self, x, settings)/2 + self._noise(self, x - 1, settings)/4 + self._noise(self, x + 1, settings)/4
end
HeroViewStateLoot._noise = function (self, x, settings)
	local next_seed, _ = Math.next_random(x + settings.seed)
	local _, value = Math.next_random(next_seed)

	return value*2 - 1
end
HeroViewStateLoot._get_card_spawn_position = function (self)
	local camera_position = self.get_camera_position(self)
	local camera_rotation = self.get_camera_rotation(self)
	local camera_forward = Quaternion.forward(camera_rotation)
	local link_unit = self.get_world_link_unit(self)
	local world_position = Unit.world_position(link_unit, 0)
	world_position.x = camera_position.x
	world_position.z = world_position.z - 0.12
	world_position.y = world_position.y

	return world_position
end
HeroViewStateLoot._get_portrait_frame = function (self, player)
	local unit = player.player_unit
	local player_portrait_frame = "default"

	if unit and player then
		local dead_portrait_frame = "unit_frame_death"
		local network_manager = Managers.state.network
		local network_game = network_manager.game(network_manager)

		if network_game and not LEVEL_EDITOR_TEST and Unit.alive(unit) then
			if player.local_player then
				local career_extension = ScriptUnit.extension(unit, "career_system")
				local career_name = career_extension.career_name(career_extension)
				local item_interface = Managers.backend:get_interface("items")
				local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

				if item then
					local item_data = item.data
					local frame_name = item_data.temporary_template

					if not frame_name then
					end
				end
			else
				local unit_id = network_manager.unit_game_object_id(network_manager, unit)
				local frame_name_id = GameSession.game_object_field(network_game, unit_id, "frame_name")
				player_portrait_frame = NetworkLookup.cosmetics[frame_name_id]
			end
		end
	end

	return player_portrait_frame
end
HeroViewStateLoot._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, player_level_text)
	local widget_definition = UIWidgets.create_portrait_frame("info_portrait_root", frame_settings_name, player_level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end
HeroViewStateLoot._setup_info_window = function (self)
	local hero_name = self.hero_name
	local player = self.player
	local player_unit = player.player_unit
	local career_extension = ScriptUnit.extension(player_unit, "career_system")
	local career_index = career_extension.career_index(career_extension)
	local profile_index = FindProfileIndex(hero_name)
	local profile_settings = SPProfiles[profile_index]
	local character_name = profile_settings.character_name
	local career_settings = profile_settings.careers[career_index]
	local portrait_image = career_settings.portrait_image
	local player_level = ExperienceSettings.get_player_level(player)
	local player_level_text = (player_level and tostring(player_level)) or "-"
	local portrait_frame = self._get_portrait_frame(self, player)
	local portrait_widget = self._create_portrait_frame_widget(self, portrait_frame, portrait_image, player_level_text)
	self._portrait_widget = portrait_widget
	self._widgets_by_name.info_text_title.content.text = Localize(character_name)

	return 
end

return 
