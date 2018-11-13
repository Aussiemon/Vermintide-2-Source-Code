require("scripts/ui/views/hero_view/loot_item_unit_previewer")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_loot_definitions")
local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"
local widget_definitions = definitions.widgets
local gamepad_tooltip_widget_definitions = definitions.gamepad_tooltip_widgets
local input_desc_widget_definitions = definitions.input_description_widgets
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
local loot_option_positions_by_amount = definitions.loot_option_positions_by_amount
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
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.player = local_player
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes:get(display_name, "career")
	self.career_index = career_index
	self.profile_index = profile_index
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
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.loot_ui_renderer, input_service, 4, gui_layer, generic_input_actions.default, true)

	self.menu_input_description:set_input_description(generic_input_actions.chest_not_selected)
	self:create_ui_elements(params)

	self.viewport_widget = UIWidget.init(viewport_widget_definition)

	self:_setup_camera()
	self:set_chest_title_alpha_progress(0)

	self._enter_animation_duration = 0

	self:populate_items()
	self:_setup_info_window()

	DEBUG_MODE = script_data.debug_loot_opening

	self:play_sound("play_gui_chestroom_start")
	self:disable_player_world()
	self:_setup_input_buttons()

	self._console_selection_index = 1
	self._draw_input_desc_widgets = true
end

HeroViewStateLoot._setup_input_buttons = function (self)
	local input_service = Managers.input:get_service("hero_view")
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local icon_style_input_1 = input_1_widget.style.texture_id
	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2]
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture
	local icon_style_input_2 = input_2_widget.style.texture_id
	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2]
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

HeroViewStateLoot._set_gamepad_input_buttons_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local input_arrow_1_widget = widgets_by_name.input_arrow_next
	local input_arrow_2_widget = widgets_by_name.input_arrow_previous
	input_1_widget.content.visible = visible
	input_2_widget.content.visible = visible
	input_arrow_1_widget.content.visible = visible
	input_arrow_2_widget.content.visible = visible
end

HeroViewStateLoot.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

HeroViewStateLoot.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

HeroViewStateLoot.populate_items = function (self)
	local widgets_by_name = self._widgets_by_name
	local hero_name = self.hero_name
	local career_index = self.career_index

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
	local real_items = self:_get_items_by_filter(item_filter)
	local real_item_read_index = 1

	table.sort(real_items, sort_func)

	local items = {}
	local grid_widget = widgets_by_name.item_grid
	local item_grid = ItemGridUI:new(settings_by_screen, grid_widget, hero_name, career_index)
	local placeholder_items = {}

	item_grid:disable_locked_items(true)
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(sort_func)
	item_grid:change_category("loot")

	if self._current_page then
		local current_page, total_pages = item_grid:get_page_info()
		local page_index = math.min(self._current_page, total_pages)

		item_grid:set_item_page(page_index)
	end

	self._item_grid = item_grid
	local first_item = item_grid:get_item_in_slot(1, 1)

	self:_select_grid_item(first_item)
end

HeroViewStateLoot._get_items_by_filter = function (self, item_filter)
	local backend_items = Managers.backend:get_interface("items")
	local items = backend_items:get_filtered_items(item_filter)

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
end

HeroViewStateLoot._can_open_chests = function (self)
	local backend_items = Managers.backend:get_interface("items")
	local items = backend_items:get_all_backend_items()
	local item_count = 0

	for _, item in pairs(items) do
		if item.data.item_type ~= "weapon_skin" then
			item_count = item_count + 1
		end
	end

	local can_open = item_count < UISettings.max_inventory_items

	return can_open
end

HeroViewStateLoot.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

HeroViewStateLoot.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
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
	local input_desc_widgets = {}
	local input_desc_widgets_by_name = {}

	for name, widget_definition in pairs(input_desc_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		input_desc_widgets[#input_desc_widgets + 1] = widget
		input_desc_widgets_by_name[name] = widget
	end

	self._input_desc_widgets = input_desc_widgets
	self._input_desc_widgets_by_name = input_desc_widgets_by_name
	local gamepad_tooltip_widgets = {}
	local gamepad_tooltip_widgets_by_name = {}

	for name, widget_definition in pairs(gamepad_tooltip_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		gamepad_tooltip_widgets[#gamepad_tooltip_widgets + 1] = widget
		gamepad_tooltip_widgets_by_name[name] = widget
	end

	self._gamepad_tooltip_widgets = gamepad_tooltip_widgets
	self._gamepad_tooltip_widgets_by_name = gamepad_tooltip_widgets_by_name
	self._continue_button_widget = UIWidget.init(continue_button_definition)

	UIRenderer.clear_scenegraph_queue(self.loot_ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	widgets_by_name.item_cap_warning_text.content.visible = false

	self:_setup_reward_option_widgets()
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

	self:_position_camera()
end

HeroViewStateLoot.set_camera_position = function (self, position)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_position(camera, position)
end

HeroViewStateLoot.set_camera_rotation = function (self, rotation)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.set_local_rotation(camera, rotation)
end

HeroViewStateLoot.get_camera_position = function (self)
	local _, viewport = self:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

HeroViewStateLoot.get_camera_rotation = function (self)
	local _, viewport = self:get_viewport_world()
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
				item_previewer:destroy()

				data.item_previewer = nil
			end

			local world_previewer = data.world_previewer

			if world_previewer then
				world_previewer:prepare_exit()
				world_previewer:on_exit()
				world_previewer:destroy()

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

	self:play_sound("play_gui_chestroom_stop")

	if self.loot_ui_renderer then
		UIRenderer.destroy(self.loot_ui_renderer, self.loot_ui_world)
		self.world_manager:destroy_world(self.loot_ui_world)

		self.loot_ui_world = nil
		self.loot_ui_renderer = nil
	end

	self:enable_player_world()
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
end

HeroViewStateLoot.update = function (self, dt, t)
	if RELOAD_UI then
		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_update_enter_animation_time(dt, t)
	self:_update_chest_zoom_in_time(dt, t)
	self:_update_chest_zoom_out_time(dt, t)
	self:_update_camera_look_up_time(dt, t)
	self:_update_chest_open_wait_time(dt, t)
	self:_update_camera_look_down_time(dt, t)
	self:_update_continue_button_animation_time(dt, t)
	self:_handle_gamepad_activity()
	self:draw(dt)
	self:_update_transition_timer(dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		local active_reward_options = self._active_reward_options

		if active_reward_options then
			for _, data in ipairs(active_reward_options) do
				local widget = data.widget
				local content = widget.content
				local item_previewer = data.item_previewer

				if item_previewer then
					item_previewer:update(dt, t)
				end

				local world_previewer = data.world_previewer

				if world_previewer then
					world_previewer:update(dt, t)

					if content.is_loading and world_previewer:character_visible() then
						content.is_loading = false
					end
				end
			end
		end

		return wanted_state or self._new_state
	end
end

HeroViewStateLoot.post_update = function (self, dt, t)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator
	local open_loot_chest_id = self._open_loot_chest_id

	if open_loot_chest_id then
		local backend_loot = Managers.backend:get_interface("loot")
		local loot_chest_opened = backend_loot:is_loot_generated(open_loot_chest_id)

		if loot_chest_opened then
			local loot = backend_loot:get_loot(open_loot_chest_id)

			self:loot_chest_opened(loot)

			self._open_loot_chest_id = nil
		end
	end

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		local item_grid = self._item_grid

		if item_grid then
			item_grid:update(dt, t)
		end

		local active_camera_shakes = self._active_camera_shakes

		if active_camera_shakes then
			for settings, _ in pairs(active_camera_shakes) do
				self:_apply_shake_event(settings, t)
			end
		end

		self:_update_camera_shake_chest_spawn_time(dt, t)
		self:_handle_input(dt, t)
		self:_handle_gamepad_input(dt, t)
		self:_update_page_info()

		local active_reward_options = self._active_reward_options

		if active_reward_options then
			for _, data in ipairs(active_reward_options) do
				local item_previewer = data.item_previewer

				if item_previewer then
					item_previewer:post_update(dt, t)
				end

				local world_previewer = data.world_previewer

				if world_previewer then
					world_previewer:post_update(dt, t)
				end
			end
		end
	end
end

HeroViewStateLoot._update_animations = function (self, dt)
	if self._chest_presentation_active then
		local gamepad_active = Managers.input:is_device_active("gamepad")

		self:_animate_reward_options_entry(dt)

		for index, widget in ipairs(self._option_widgets) do
			local content = widget.content
			local button_hotspot = content.button_hotspot

			if not button_hotspot.disable_button then
				local rarity = content.rarity
				local anim_progress = 0
				local glow_alpha_progress = content.glow_alpha_progress or 0
				local speed = dt * 3

				if button_hotspot.on_hover_enter then
					local sound_event = (rarity and "play_gui_chest_reward_hover_start_" .. tostring(rarity)) or "play_gui_chest_reward_start"

					self:play_sound(sound_event)
				elseif button_hotspot.on_hover_exit then
					local sound_event = (rarity and "play_gui_chest_reward_hover_stop_" .. tostring(rarity)) or "play_gui_chest_reward_stop"

					self:play_sound(sound_event)
				end

				local is_console_selected = gamepad_active and self._console_selection_index == index

				if button_hotspot.is_hover or is_console_selected then
					glow_alpha_progress = math.min(glow_alpha_progress + speed, 1)
					anim_progress = math.easeOutCubic(glow_alpha_progress)
				else
					glow_alpha_progress = math.max(glow_alpha_progress - speed, 0)
					anim_progress = math.easeInCubic(glow_alpha_progress)
				end

				content.glow_alpha_progress = glow_alpha_progress
				local style = widget.style
				style.lock_glow.color[1] = style.lock_glow.default_color[1] * anim_progress
				style.lock_glow_1.color[1] = style.lock_glow_1.default_color[1] * anim_progress
				style.lock_glow_2.color[1] = style.lock_glow_2.default_color[1] * anim_progress
				style.lock_bottom_glow.color[1] = style.lock_bottom_glow.default_color[1] * anim_progress
				style.lock_bottom_glow_2.color[1] = style.lock_bottom_glow_2.default_color[1] * anim_progress
			end
		end
	end

	local widgets_by_name = self._widgets_by_name
	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_arrow_button(page_button_next, dt)
	UIWidgetUtils.animate_arrow_button(page_button_previous, dt)
end

HeroViewStateLoot.draw = function (self, dt)
	local loot_ui_renderer = self.loot_ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings
	local input_service = input_manager:get_service("hero_view")
	local gamepad_active = input_manager:is_device_active("gamepad")
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

	if self._draw_input_desc_widgets and gamepad_active then
		for _, widget in pairs(self._input_desc_widgets) do
			UIRenderer.draw_widget(loot_ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(loot_ui_renderer)

	local present_reward_options = self._present_reward_options
	local active_reward_options = self._active_reward_options

	if active_reward_options then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		for _, data in ipairs(active_reward_options) do
			local preview_widget = data.preview_widget

			if present_reward_options then
				if gamepad_active and input_service:get("special_1_hold") then
					for _, tooltip_widget in pairs(self._gamepad_tooltip_widgets) do
						UIRenderer.draw_widget(ui_top_renderer, tooltip_widget)
					end
				end

				local widget = data.widget

				UIRenderer.draw_widget(ui_top_renderer, widget)

				local frame_widget = data.frame_widget

				if frame_widget then
					UIRenderer.draw_widget(ui_top_renderer, frame_widget)
				end

				if data.opened then
					self:_activate_widget_viewport(preview_widget, true)
					UIRenderer.draw_widget(ui_top_renderer, preview_widget)
				else
					self:_activate_widget_viewport(preview_widget, false)
				end
			else
				self:_activate_widget_viewport(preview_widget, false)
			end
		end

		if present_reward_options and self._rewards_presented then
			render_settings.alpha_multiplier = self._continue_button_alpha_multiplier or 1

			UIRenderer.draw_widget(ui_top_renderer, self._continue_button_widget)
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	if gamepad_active then
		self.menu_input_description:draw(loot_ui_renderer, dt)
	end
end

HeroViewStateLoot._activate_widget_viewport = function (self, preview_widget, activate)
	if not preview_widget then
		return
	end

	local preview_widget_content = preview_widget.content

	if preview_widget_content.activated ~= activate then
		local element = preview_widget.element
		local pass_data = element.pass_data
		local viewport_pass_data = pass_data[1]
		local world = viewport_pass_data.world
		local viewport = viewport_pass_data.viewport

		if activate then
			ScriptWorld.activate_viewport(world, viewport)
			print("ENABLING LOOT PREVIEW VIEWPORT")
		else
			ScriptWorld.deactivate_viewport(world, viewport)
			print("DISABLING LOOT PREVIEW VIEWPORT")
		end

		preview_widget_content.activated = activate
	end
end

HeroViewStateLoot._set_debug_buttons_disable_state = function (self, is_disabled)
	local debug_widgets = self._debug_widgets

	for _, widget in ipairs(debug_widgets) do
		local content = widget.content
		local hotspot = content.hotspot or content.button_hotspot
		hotspot.disable_button = is_disabled
	end
end

HeroViewStateLoot._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.hotspot or content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroViewStateLoot._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.hotspot or content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
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
end

HeroViewStateLoot._select_grid_item = function (self, item, t)
	local widgets_by_name = self._widgets_by_name
	local item_grid = self._item_grid

	item_grid:set_item_selected(item)

	if item then
		local item_data = item.data
		local chest_category = item_data.chest_category
		local chest_tier = item_data.chest_tier
		local chests_by_category = LootChestData.chests_by_category
		local unit_name, sound_event = nil

		for key, chests_data in pairs(chests_by_category) do
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
			self:play_sound(sound_event)
			self:_spawn_chest_unit(unit_name, nil, t)
		end

		local _, display_name, _ = UIUtils.get_ui_information_from_item(item)
		local item_type = item_data.item_type
		local info_text_box_text_id = item_data.info_text_box_text_id or "loot_opening_screen_desc"
		widgets_by_name.info_text_box.content.text = info_text_box_text_id
		widgets_by_name.chest_title.content.text = Localize(display_name)
		widgets_by_name.chest_sub_title.content.text = Localize(item_type)

		self:set_chest_title_alpha_progress(1)
		self.menu_input_description:set_input_description(generic_input_actions.chest_selected)
	else
		self:set_chest_title_alpha_progress(0)
		self.menu_input_description:set_input_description(generic_input_actions.chest_not_selected)
	end

	self._selected_item = item
	local can_open = self:_can_open_chests()
	self._open_chests_enabled = can_open
	widgets_by_name.item_cap_warning_text.content.visible = not can_open and item ~= nil
	widgets_by_name.open_button.content.button_hotspot.disable_button = not can_open or item == nil

	if not can_open then
		self.menu_input_description:set_input_description(generic_input_actions.chest_not_selected)
	end
end

HeroViewStateLoot._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self.wwise_world, sound_event)
end

HeroViewStateLoot._handle_gamepad_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local input_service = self.input_manager:get_service("hero_view")
	local item_grid = self._item_grid

	if not self._chest_presentation_active and not self._opening_chest then
		item_grid:handle_gamepad_selection(input_service)

		local selected_item = item_grid:selected_item()

		if selected_item ~= self._selected_item then
			self:_select_grid_item(selected_item)
		end

		local page_index = self._current_page
		local total_pages = self._total_pages

		if page_index and total_pages then
			if page_index < total_pages and input_service:get(INPUT_ACTION_NEXT) then
				item_grid:set_item_page(page_index + 1)
				self:_play_sound("play_gui_equipment_inventory_next_click")

				local first_item = item_grid:get_item_in_slot(1, 1)

				item_grid:set_item_selected(first_item)
			elseif page_index > 1 and input_service:get(INPUT_ACTION_PREVIOUS) then
				item_grid:set_item_page(page_index - 1)
				self:_play_sound("play_gui_equipment_inventory_next_click")

				local first_item = item_grid:get_item_in_slot(1, 1)

				item_grid:set_item_selected(first_item)
			end
		end
	elseif self._reward_option_animation_complete and not self._rewards_presented and not input_service:get("special_1_hold") then
		if input_service:get("move_left") then
			local find_next_index = false
			self._console_selection_index = self:_find_console_selection_index(find_next_index)
		elseif input_service:get("move_right") then
			local find_next_index = true
			self._console_selection_index = self:_find_console_selection_index(find_next_index)
		end

		if input_service:get("confirm_press", true) then
			self:open_reward_option(self._console_selection_index)
		end
	end
end

HeroViewStateLoot._find_console_selection_index = function (self, next_index)
	local active_reward_options = self._active_reward_options
	local num_rewards = #active_reward_options

	if next_index then
		local new_index = self._console_selection_index
		local potential_index = new_index

		for i = 1, num_rewards - 1, 1 do
			potential_index = 1 + potential_index % num_rewards

			if not active_reward_options[potential_index].widget.content.button_hotspot.disable_button then
				new_index = potential_index

				break
			end
		end

		return new_index
	else
		local new_index = self._console_selection_index
		local potential_index = new_index

		for i = 1, num_rewards - 1, 1 do
			potential_index = potential_index - 1

			if potential_index < 1 then
				potential_index = num_rewards
			end

			if not active_reward_options[potential_index].widget.content.button_hotspot.disable_button then
				new_index = potential_index

				break
			end
		end

		return new_index
	end
end

HeroViewStateLoot._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("hero_view")
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local parent = self.parent
	local item_grid = self._item_grid
	local open_button = widgets_by_name.open_button
	local close_button = widgets_by_name.close_button
	local continue_button = self._continue_button_widget

	UIWidgetUtils.animate_default_button(open_button, dt)
	UIWidgetUtils.animate_default_button(close_button, dt)
	UIWidgetUtils.animate_default_button(continue_button, dt)

	local back_button_pressed = gamepad_active and input_service:get("back_menu")

	if self._wait_for_backend_reload then
		self._wait_for_backend_reload = math.max(self._wait_for_backend_reload - dt, 0)

		if self._wait_for_backend_reload == 0 then
			self._wait_for_backend_reload = nil

			self:_set_debug_buttons_disable_state(false)
			self:populate_items()
		end

		return
	end

	if self._chest_presentation_active then
		for index, widget in ipairs(self._option_widgets) do
			if self:_is_button_pressed(widget) then
				self:open_reward_option(index)

				break
			end
		end

		if self._rewards_presented and (self:_is_button_pressed(continue_button) or input_service:get("toggle_menu") or back_button_pressed) then
			self:play_sound("play_gui_chest_opening_return")

			self._opening_chest = nil
			self._chest_presentation_active = nil
			self._present_reward_options = nil
			self._chest_zoom_out_duration = 0
			self._camera_look_down_duration = 0
			self._reward_option_animation_complete = nil

			self:set_continue_button_animation_progress(0)
			self:_reset_gamepad_tooltips()

			self._console_selection_index = 1
			local active_reward_options = self._active_reward_options

			if active_reward_options then
				for _, data in ipairs(active_reward_options) do
					local widget = data.widget
					local preview_widget = data.preview_widget
					local background_widget = data.background_widget
					local item_previewer = data.item_previewer

					if item_previewer then
						item_previewer:destroy()

						data.item_previewer = nil
					end

					local world_previewer = data.world_previewer

					if world_previewer then
						world_previewer:prepare_exit()
						world_previewer:on_exit()
						world_previewer:destroy()

						data.world_previewer = nil
					end

					table.clear(data)

					data.widget = widget
					data.preview_widget = preview_widget
					data.background_widget = background_widget
				end
			end

			self:populate_items()
		end
	elseif not self._opening_chest then
		local page_button_next = widgets_by_name.page_button_next
		local page_button_previous = widgets_by_name.page_button_previous

		if self:_is_button_hovered(page_button_next) or self:_is_button_hovered(page_button_previous) then
			self:play_sound("play_gui_inventory_next_hover")
		end

		if self:_is_button_pressed(page_button_next) then
			local next_page_index = self._current_page + 1

			item_grid:set_item_page(next_page_index)
			self:play_sound("play_gui_equipment_inventory_next_click")
		elseif self:_is_button_pressed(page_button_previous) then
			local next_page_index = self._current_page - 1

			item_grid:set_item_page(next_page_index)
			self:play_sound("play_gui_equipment_inventory_next_click")
		end

		if item_grid:is_item_hovered() then
			self:play_sound("play_gui_inventory_item_hover")
		end

		local allow_single_press = true
		local item = item_grid:is_item_pressed(allow_single_press)

		if item and (not self._selected_item or self._selected_item.backend_id ~= item.backend_id) then
			self:_select_grid_item(item, t)
		end

		local open_button_pressed = gamepad_active and self._open_chests_enabled and input_service:get("confirm_press")

		if (self:_is_button_pressed(open_button) or open_button_pressed) and self._selected_item then
			self:_open_chest(self._selected_item)
		elseif self:_is_button_pressed(close_button) or input_service:get("toggle_menu") or back_button_pressed then
			parent:close_menu()
			self:play_sound("Play_hud_select")
		end

		if DEBUG_MODE then
			local debug_pressed = false
			local debug_widgets_by_name = self._debug_widgets_by_name

			if self:_is_button_pressed(debug_widgets_by_name.debug_add_chest_1) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot:generate_loot_chest("normal", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			local console_input = false

			if PLATFORM == "ps4" then
				console_input = Pad1.pressed(Pad1.button_index("triangle"))
			else
				console_input = Pad1.pressed(Pad1.button_index("y"))
			end

			if console_input then
				local backend_loot = Managers.backend:get_interface("loot")
				local hero_attributes = Managers.backend:get_interface("hero_attributes")
				local start_experience = hero_attributes:get("wood_elf", "experience")

				backend_loot:generate_end_of_level_loot(true, true, "hardest", "ussingen", math.random(0, 3), math.random(0, 2), math.random(0, 2), "wood_elf", start_experience, start_experience + 100, nil, nil)
			end

			if self:_is_button_pressed(debug_widgets_by_name.debug_add_chest_2) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot:generate_loot_chest("hard", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if self:_is_button_pressed(debug_widgets_by_name.debug_add_chest_3) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot:generate_loot_chest("harder", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if self:_is_button_pressed(debug_widgets_by_name.debug_add_chest_4) then
				local backend_loot = Managers.backend:get_interface("loot")

				backend_loot:generate_loot_chest("hardest", math.random(0, 3), math.random(0, 2), math.random(0, 2), nil, DEBUG_MODE)

				debug_pressed = true
			end

			if debug_pressed then
				self:_set_debug_buttons_disable_state(true)

				self._wait_for_backend_reload = 0.2
			end
		end
	end
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
		widgets_by_name.page_button_next.content.hotspot.disable_button = current_page == total_pages
		widgets_by_name.page_button_previous.content.hotspot.disable_button = current_page == 1
	end
end

local rarity_sound_mapping = {
	common = "play_hud_rewards_tier1",
	exotic = "play_hud_rewards_tier3",
	rare = "play_hud_rewards_tier2",
	unique = "play_hud_rewards_tier4"
}

HeroViewStateLoot.open_reward_option = function (self, index)
	local active_reward_options = self._active_reward_options
	local reward_option = active_reward_options[index]
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
		reward_option = reward_option
	}
	local widget = reward_option.widget
	local content = widget.content
	local button_hotspot = content.button_hotspot
	button_hotspot.disable_button = true

	self:_start_animation("open_loot_widget", "open_loot_widget", widget, params)

	self._num_rewards_opened = self._num_rewards_opened + 1

	if self._num_rewards_opened == #active_reward_options then
		self._rewards_presented = true
		self._continue_button_animation_duration = 0

		self.menu_input_description:set_input_description(generic_input_actions.loot_presented)
	end

	local rarity = content.rarity
	local sound_event = rarity_sound_mapping[rarity]

	if sound_event then
		self:play_sound(sound_event)
	end

	self:_setup_gamepad_tooltip(index, reward_option)

	local find_next_index = true
	self._console_selection_index = self:_find_console_selection_index(find_next_index)
end

HeroViewStateLoot._setup_gamepad_tooltip = function (self, index, reward_option)
	local widget = self._gamepad_tooltip_widgets_by_name["item_tooltip_" .. index]

	if widget then
		local reward_option_widget = reward_option.widget
		local reward_option_widget_content = reward_option_widget.content
		widget.content.item = reward_option_widget_content.item
	end
end

HeroViewStateLoot._reset_gamepad_tooltips = function (self)
	for _, widget in pairs(self._gamepad_tooltip_widgets) do
		local widget_content = widget.content
		widget_content.item = nil
	end
end

HeroViewStateLoot._setup_rewards = function (self, rewards)
	local backend_items = Managers.backend:get_interface("items")
	local reward_options = self._reward_options
	local active_reward_options = {}
	local num_rewards = #rewards
	local loot_option_positions = loot_option_positions_by_amount[num_rewards]
	local ui_scenegraph = self.ui_scenegraph

	for index, data in ipairs(reward_options) do
		local widget = data.widget
		local content = widget.content
		local style = widget.style

		table.clear(content.item_hotspot)
		table.clear(content.item_hotspot_2)

		local backend_id = rewards[index]

		if backend_id then
			local option_position = loot_option_positions[index]
			local scenegraph_id = widget.scenegraph_id
			local local_position = ui_scenegraph[scenegraph_id].local_position
			local_position[1] = option_position[1]
			local_position[2] = option_position[2]
			local item = backend_items:get_item_from_id(backend_id)
			local item_data = item.data
			local item_key = item_data.key
			local item_rarity = backend_items:get_item_rarity(backend_id)
			local item_type = item_data.item_type
			local slot_type = item_data.slot_type
			local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)
			local background_widget = data.background_widget
			background_widget.style.background.color = Colors.get_color_table_with_alpha(item_rarity, 255)
			local rarity_frame_texture = UISettings.item_rarity_textures[item_rarity]
			local rarity_glow_color_data = glow_rarity_colors[item_rarity]
			data.reward_backend_id = backend_id
			data.reward_key = item_key
			data.opened = false
			content.is_loading = false
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
			content.item_hotspot_2.allow_multi_hover = true
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

			self:_apply_color_to_glow_style(style.lock_bottom_glow, glow_color_back)
			self:_apply_color_to_glow_style(style.lock_bottom_glow_2, glow_color_front)
			self:_apply_color_to_glow_style(style.lock_glow, glow_color_back)
			self:_apply_color_to_glow_style(style.lock_glow_1, glow_color_center)
			self:_apply_color_to_glow_style(style.lock_glow_2, glow_color_front)
			self:_apply_color_to_glow_style(style.final_glow, glow_color_back)
			self:_apply_color_to_glow_style(style.final_glow_1, glow_color_center)
			self:_apply_color_to_glow_style(style.final_glow_2, glow_color_front)

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
				local preview_position = {
					0,
					0,
					0
				}
				local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, index)
				data.item_previewer = item_previewer
			elseif slot_type == "hat" then
				local preview_widget = data.preview_widget
				local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, UISettings.hero_hat_camera_position_by_character, index)

				world_previewer:on_enter(preview_widget)
				world_previewer:force_hide_character()

				local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)
				local career_settings = CareerSettings[career_name]
				local base_skin = career_settings.base_skin
				local item_name = item_data.key

				self:_spawn_hero_with_hat(world_previewer, profile_name, career_index, base_skin, item_name)

				data.world_previewer = world_previewer
				content.is_loading = true
			elseif slot_type == "skin" then
				local preview_widget = data.preview_widget
				local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, UISettings.hero_skin_camera_position_by_character, index)

				world_previewer:on_enter(preview_widget)
				world_previewer:force_hide_character()

				local optional_skin = item_data.name
				local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)

				self:_spawn_hero_skin(world_previewer, profile_name, career_index, optional_skin)

				data.world_previewer = world_previewer
				content.is_loading = true
			elseif slot_type == "crafting_material" or slot_type == "deed" or slot_type == "trinket" or slot_type == "necklace" or slot_type == "ring" then
				local texture_name = nil

				if slot_type == "trinket" then
					texture_name = "loot_image_trinket"
				elseif slot_type == "necklace" then
					texture_name = "loot_image_jewellery"
				elseif slot_type == "ring" then
					texture_name = "loot_image_charm"
				elseif slot_type == "deed" then
					texture_name = "loot_image_deed"
				end

				if slot_type == "crafting_material" then
					local amount = backend_items:get_item_amount(backend_id)
					content.amount_text = "x" .. tostring(amount)
				end

				local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
				content.image = texture_name
				style.image.texture_size[1] = texture_settings.size[1]
				style.image.texture_size[2] = texture_settings.size[2]
			elseif slot_type == "frame" then
				local profile = SPProfiles[self.profile_index]
				local career_settings = profile.careers[self.career_index]
				local portrait_image = career_settings.portrait_image
				local item_template = ItemMasterList[item_key]
				local portrait_frame = item_template.temporary_template
				local scenegraph_id = "loot_option_" .. index .. "_center"
				local scale = 1.5
				local frame_widget = self:_create_player_portrait(scenegraph_id, portrait_frame, portrait_image, "", scale)
				data.frame_widget = frame_widget
			end

			active_reward_options[#active_reward_options + 1] = data
		end
	end

	self._active_reward_options = active_reward_options
	self._present_reward_options = true

	self:_set_background_blur_progress(1)
end

HeroViewStateLoot._get_hero_wield_info_by_item = function (self, item)
	local item_data = item.data
	local can_wield = item_data.can_wield
	local career_name = can_wield[1]

	for _, profile_settings in ipairs(SPProfiles) do
		local careers = profile_settings.careers

		for index, career_settings in ipairs(careers) do
			if career_settings.name == career_name then
				local profile_name = profile_settings.display_name
				local profile_index = FindProfileIndex(profile_name)
				local career_index = career_settings.sort_order

				return profile_name, profile_index, career_name, career_index
			end
		end
	end
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
end

HeroViewStateLoot._spawn_hero_skin = function (self, world_previewer, hero_name, career_index, optional_skin)
	local callback = callback(self, "cb_hero_unit_spawned_skin_preview", world_previewer, hero_name, career_index)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroViewStateLoot._spawn_hero_with_hat = function (self, world_previewer, hero_name, career_index, optional_skin, item_name)
	local callback = callback(self, "cb_hero_unit_spawned_hat_preview", world_previewer, hero_name, career_index, item_name)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroViewStateLoot.cb_hero_unit_spawned_skin_preview = function (self, world_previewer, hero_name, career_index)
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_idle_animation = career_settings.preview_idle_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_name in ipairs(preview_items) do
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			world_previewer:equip_item(item_name, slot)
		end

		if preview_wield_slot then
			world_previewer:wield_weapon_slot(preview_wield_slot)
		end
	end

	if preview_idle_animation then
		world_previewer:play_character_animation(preview_idle_animation)
	end
end

HeroViewStateLoot.cb_hero_unit_spawned_hat_preview = function (self, world_previewer, hero_name, career_index, hat_item_name)
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_idle_animation = career_settings.preview_idle_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items
	local hat_slot = InventorySettings.slots_by_name.slot_hat

	world_previewer:equip_item(hat_item_name, hat_slot)

	if preview_items then
		for _, item_name in ipairs(preview_items) do
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type

			if slot_type ~= "melee" and slot_type ~= "ranged" and slot_type ~= "hat" then
				local slot_names = InventorySettings.slot_names_by_type[slot_type]
				local slot_name = slot_names[1]
				local slot = InventorySettings.slots_by_name[slot_name]

				world_previewer:equip_item(item_name, slot)
			end
		end
	end
end

HeroViewStateLoot._create_player_portrait = function (self, scenegraph_id, portrait_frame, portrait_image, player_level_text, optional_scale)
	local definition = UIWidgets.create_portrait_frame(scenegraph_id, portrait_frame, player_level_text, optional_scale or 1, nil, portrait_image)
	local widget = UIWidget.init(definition)

	return widget
end

HeroViewStateLoot._set_background_blur_progress = function (self, progress)
	local world, viewport = self:get_viewport_world()
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", progress * 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", progress * 0.75)
		ShadingEnvironment.apply(shading_env)
	end
end

HeroViewStateLoot.play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateLoot._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
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
	self:_reset_camera()

	local backend_loot = Managers.backend:get_interface("loot")
	local hero_name = self.hero_name
	local backend_id = selected_item.backend_id
	self._open_loot_chest_id = backend_loot:open_loot_chest(hero_name, backend_id)

	self.menu_input_description:set_input_description(nil)

	self._draw_input_desc_widgets = false
	self._chest_zoom_in_duration = 0
	self._chest_zoom_out_duration = nil

	if self._chest_unit then
		local anim_name = "loot_chest_open"

		Unit.flow_event(self._chest_unit, anim_name)
	end

	local selected_item_data = selected_item.data
	local chest_category = selected_item_data.chest_category
	local chest_tier = selected_item_data.chest_tier
	local chests_by_category = LootChestData.chests_by_category
	self._opening_chest = true
	self._rewards_presented = false
	local unit_name = nil

	for key, chests_data in pairs(chests_by_category) do
		if key == chest_category then
			local chest_unit_names = chests_data.chest_unit_names

			for index, chest_unit_name in ipairs(chest_unit_names) do
				if index == chest_tier then
					local sound_event = "play_gui_chest_open_" .. key .. "_" .. tostring(index)

					self:play_sound(sound_event)

					return
				end
			end
		end
	end
end

HeroViewStateLoot.loot_chest_opened = function (self, loot)
	local selected_item = self._selected_item
	local num_loot = loot and #loot
	local has_chest = BackendUtils.has_loot_chest()

	if not has_chest then
		local world = self.world_manager:world("level_world")

		LevelHelper:flow_event(world, "local_player_opened_all_loot_chests")
	end

	self:_start_reward_presentation(loot)
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

	self:_setup_rewards(self._chest_loot)

	self._chest_presentation_active = true
	self._num_rewards_opened = 0
	self._selected_item = nil

	self:set_reward_options_height_progress(0)
end

HeroViewStateLoot._animate_reward_options_entry = function (self, dt)
	local reward_options_entry_progress = self._reward_options_entry_progress

	if not reward_options_entry_progress then
		return
	end

	local progress = math.min(reward_options_entry_progress + dt, 1)

	self:set_reward_options_height_progress(progress)

	if progress == 1 then
		self._reward_options_entry_progress = nil

		self.menu_input_description:set_input_description(generic_input_actions.chest_opened)

		self._draw_input_desc_widgets = true
		self._reward_option_animation_complete = true
	else
		self._reward_options_entry_progress = progress
	end
end

HeroViewStateLoot.set_reward_options_height_progress = function (self, progress)
	local w, h = UIResolution()
	local progress_1 = math.min(progress * 1.1, 1)
	local progress_2 = math.min(progress * 1.3, 1)
	local progress_3 = progress
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.loot_option_1.local_position[2] = -h * (1 - math.catmullrom(math.easeOutCubic(progress_1), 0, 0, 1, -1.8))
	ui_scenegraph.loot_option_2.local_position[2] = -h * (1 - math.catmullrom(math.easeOutCubic(progress_2), 0, 0, 1, -1.8))
	ui_scenegraph.loot_option_3.local_position[2] = -h * (1 - math.catmullrom(math.easeOutCubic(progress_3), 0, 0, 1, -1.8))
end

HeroViewStateLoot._spawn_chest_unit = function (self, unit_name, instant_spawn, t)
	local world = self:get_viewport_world()

	if self._chest_unit then
		World.destroy_unit(world, self._chest_unit)
	end

	local unit = World.spawn_unit(world, unit_name, Vector3(0, 0, 10))
	local link_unit = self:get_world_link_unit()

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
end

HeroViewStateLoot.set_camera_zoom = function (self, progress)
	local camera_pose = self._camera_pose:unbox()
	local translation = Matrix4x4.translation(camera_pose)
	local rotation = Matrix4x4.rotation(camera_pose)
	local max_distance = 0.5
	local distance = max_distance * progress
	local dir = Quaternion.forward(rotation)
	local position = translation + dir * distance

	self:set_camera_position(position)
end

HeroViewStateLoot.set_grid_animation_progress = function (self, progress)
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.info_root.local_position[1] = 400 * progress
	ui_scenegraph.item_grid_root.local_position[1] = -400 * progress
	ui_scenegraph.open_button.local_position[2] = 30 - 200 * progress
	ui_scenegraph.close_button.local_position[2] = 30 - 200 * progress
	self._grid_alpha_multiplier = 1 - progress
end

HeroViewStateLoot.set_continue_button_animation_progress = function (self, progress)
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.continue_button.local_position[2] = -170 + 200 * progress
	self._continue_button_alpha_multiplier = progress
end

HeroViewStateLoot.set_chest_title_alpha_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local alpha = 255 * progress
	widgets_by_name.chest_title.style.text.text_color[1] = alpha
	widgets_by_name.chest_title.style.text_shadow.text_color[1] = alpha
	widgets_by_name.chest_sub_title.style.text.text_color[1] = alpha
	widgets_by_name.chest_sub_title.style.text_shadow.text_color[1] = alpha
	self._chest_title_alpha_progress = progress
end

HeroViewStateLoot._update_enter_animation_time = function (self, dt, t)
	local center_animation_duration = self._enter_animation_duration

	if not center_animation_duration then
		return
	end

	center_animation_duration = center_animation_duration + dt
	local progress = math.min(center_animation_duration / CHEST_PRESENTATION_ZOOM_OUT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self:set_grid_animation_progress(1 - animation_progress)

	if progress == 1 then
		self._enter_animation_duration = nil
	else
		self._enter_animation_duration = center_animation_duration
	end
end

HeroViewStateLoot._update_continue_button_animation_time = function (self, dt, t)
	local continue_button_animation_duration = self._continue_button_animation_duration

	if not continue_button_animation_duration then
		return
	end

	continue_button_animation_duration = continue_button_animation_duration + dt
	local progress = math.min(continue_button_animation_duration / CHEST_PRESENTATION_ZOOM_OUT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self:set_continue_button_animation_progress(animation_progress)

	if progress == 1 then
		self._continue_button_animation_duration = nil
	else
		self._continue_button_animation_duration = continue_button_animation_duration
	end
end

HeroViewStateLoot._update_camera_look_up_time = function (self, dt, t)
	local camera_look_up_duration = self._camera_look_up_duration

	if not camera_look_up_duration then
		return
	end

	local previous_progress = math.min(camera_look_up_duration / CHEST_PRESENTATION_LOOK_UP_TIME, 1)
	local previous_animation_progress = math.easeCubic(previous_progress)
	camera_look_up_duration = camera_look_up_duration + dt
	local progress = math.min(camera_look_up_duration / CHEST_PRESENTATION_LOOK_UP_TIME, 1)
	local animation_progress = math.easeCubic(progress)
	local degrees = 60
	local previous_angle = math.degrees_to_radians(degrees * previous_animation_progress)
	local angle = math.degrees_to_radians(degrees * animation_progress)
	local animation_rotation = Quaternion(Vector3.right(), angle - previous_angle)
	local current_rotation = self:get_camera_rotation()
	local new_rotation = Quaternion.multiply(current_rotation, animation_rotation)

	self:set_camera_rotation(new_rotation)

	self.background_fade_widget.style.rect.color[1] = animation_progress * 200

	if progress == 1 then
		if self._chest_unit then
			Unit.set_unit_visibility(self._chest_unit, false)
		end

		self._camera_look_up_duration = nil
	else
		self._camera_look_up_duration = camera_look_up_duration
	end
end

HeroViewStateLoot._update_camera_look_down_time = function (self, dt, t)
	local camera_look_down_duration = self._camera_look_down_duration

	if not camera_look_down_duration then
		return
	end

	local previous_progress = math.min(camera_look_down_duration / CHEST_PRESENTATION_LOOK_DOWN_TIME, 1)
	local previous_animation_progress = math.easeOutCubic(previous_progress)
	camera_look_down_duration = camera_look_down_duration + dt
	local progress = math.min(camera_look_down_duration / CHEST_PRESENTATION_LOOK_DOWN_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)
	local degrees = -60
	local previous_angle = math.degrees_to_radians(degrees * previous_animation_progress)
	local angle = math.degrees_to_radians(degrees * animation_progress)
	local animation_rotation = Quaternion(Vector3.right(), angle - previous_angle)
	local current_rotation = self:get_camera_rotation()
	local new_rotation = Quaternion.multiply(current_rotation, animation_rotation)

	self:set_camera_rotation(new_rotation)

	self.background_fade_widget.style.rect.color[1] = (1 - animation_progress) * 200

	if progress == 1 then
		self._camera_look_down_duration = nil
	else
		self._camera_look_down_duration = camera_look_down_duration
	end
end

HeroViewStateLoot._reset_camera = function (self)
	self._camera_look_down_duration = nil
	self.background_fade_widget.style.rect.color[1] = 0

	self:_position_camera()
end

HeroViewStateLoot._update_chest_open_wait_time = function (self, dt, t)
	local chest_open_wait_duration = self._chest_open_wait_duration

	if not chest_open_wait_duration then
		return
	end

	chest_open_wait_duration = chest_open_wait_duration + dt
	local progress = math.min(chest_open_wait_duration / CHEST_PRESENTATION_OPEN_WAIT_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	if progress == 1 then
		self._camera_look_up_duration = 0
		self._reward_options_entry_progress = 0

		self:play_sound("play_gui_chest_reward_enter")

		self._chest_open_wait_duration = nil
	else
		self._chest_open_wait_duration = chest_open_wait_duration
	end
end

HeroViewStateLoot._update_chest_zoom_in_time = function (self, dt, t)
	local chest_zoom_in_duration = self._chest_zoom_in_duration

	if not chest_zoom_in_duration then
		return
	end

	chest_zoom_in_duration = chest_zoom_in_duration + dt
	local progress = math.min(chest_zoom_in_duration / CHEST_PRESENTATION_ZOOM_IN_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self:set_camera_zoom(animation_progress)
	self:set_grid_animation_progress(animation_progress)
	self:set_chest_title_alpha_progress(1 - animation_progress)

	if progress == 1 then
		self._chest_zoom_in_duration = nil
		self._chest_open_wait_duration = 0
	else
		self._chest_zoom_in_duration = chest_zoom_in_duration
	end
end

HeroViewStateLoot._update_chest_zoom_out_time = function (self, dt, t)
	local chest_zoom_out_duration = self._chest_zoom_out_duration

	if not chest_zoom_out_duration then
		return
	end

	chest_zoom_out_duration = chest_zoom_out_duration + dt
	local progress = 1 - math.min(chest_zoom_out_duration / CHEST_PRESENTATION_ZOOM_OUT_TIME, 1)
	local animation_progress = math.easeInCubic(progress)

	self:set_camera_zoom(animation_progress)
	self:set_grid_animation_progress(animation_progress)

	if progress == 0 then
		self._chest_zoom_out_duration = nil
	else
		self._chest_zoom_out_duration = chest_zoom_out_duration
	end
end

HeroViewStateLoot._update_camera_shake_chest_spawn_time = function (self, dt, t)
	local camera_shake_chest_spawn_duration = self._camera_shake_chest_spawn_duration

	if not camera_shake_chest_spawn_duration then
		return
	end

	camera_shake_chest_spawn_duration = camera_shake_chest_spawn_duration + dt
	local progress = math.min(camera_shake_chest_spawn_duration / CAMERA_SHAKE_CHEST_SPAWN_TIME, 1)

	if progress == 1 then
		self._camera_shake_chest_spawn_duration = nil

		self:add_camera_shake(camera_entry_shake_settings, t, 1)
	else
		self._camera_shake_chest_spawn_duration = camera_shake_chest_spawn_duration
	end
end

HeroViewStateLoot.add_camera_shake = function (self, settings, start_time, scale)
	local data = {}
	local current_rot = self:get_camera_rotation()
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
	data.camera_rotation_boxed = QuaternionBox(current_rot)
	self._active_camera_shakes = {
		[data] = true
	}
end

HeroViewStateLoot._apply_shake_event = function (self, settings, t)
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
		self._active_camera_shakes[settings] = nil
	end
end

HeroViewStateLoot._calculate_perlin_value = function (self, x, settings)
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

HeroViewStateLoot._interpolated_noise = function (self, x, settings)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = self:_smoothed_noise(x_floored, settings)
	local v2 = self:_smoothed_noise(x_floored + 1, settings)

	return math.lerp(v1, v2, remainder)
end

HeroViewStateLoot._smoothed_noise = function (self, x, settings)
	return self:_noise(x, settings) / 2 + self:_noise(x - 1, settings) / 4 + self:_noise(x + 1, settings) / 4
end

HeroViewStateLoot._noise = function (self, x, settings)
	local next_seed, _ = Math.next_random(x + settings.seed)
	local _, value = Math.next_random(next_seed)

	return value * 2 - 1
end

HeroViewStateLoot._get_card_spawn_position = function (self)
	local camera_position = self:get_camera_position()
	local camera_rotation = self:get_camera_rotation()
	local camera_forward = Quaternion.forward(camera_rotation)
	local link_unit = self:get_world_link_unit()
	local world_position = Unit.world_position(link_unit, 0)
	world_position.x = camera_position.x
	world_position.z = world_position.z - 0.12
	world_position.y = world_position.y

	return world_position
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
	local career_index = self.career_index
	local profile_index = self.profile_index
	local profile_settings = SPProfiles[profile_index]
	local character_name = profile_settings.character_name
	local career_settings = profile_settings.careers[career_index]
	local portrait_image = career_settings.portrait_image
	local player = self.player
	local player_unit = player.player_unit
	local player_level = ExperienceSettings.get_player_level(player)
	local player_level_text = (player_level and tostring(player_level)) or "-"
	local portrait_frame = "default"
	local portrait_widget = self:_create_portrait_frame_widget(portrait_frame, portrait_image, player_level_text)
	self._portrait_widget = portrait_widget
	self._widgets_by_name.info_text_title.content.text = Localize(character_name)
end

HeroViewStateLoot._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self.gamepad_active_last_frame == nil

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			self:_set_gamepad_input_buttons_visibility(true)
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		self:_set_gamepad_input_buttons_visibility(false)
	end
end

return
