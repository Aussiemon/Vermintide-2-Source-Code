require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_background_console_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local camera_position_by_character = definitions.camera_position_by_character
local loading_overlay_widget_definitions = definitions.loading_overlay_widgets
local object_sets_per_layout = {
	event = {
		weekly = true
	},
	adventure = {
		quick_play = true
	},
	custom_game = {
		custom_game = true
	},
	heroic_deeds = {
		deeds = true
	},
	twitch = {
		mixer = true
	},
	lobby_browser = {
		quick_play = true
	}
}
StartGameWindowBackgroundConsole = class(StartGameWindowBackgroundConsole)
StartGameWindowBackgroundConsole.NAME = "StartGameWindowBackgroundConsole"

StartGameWindowBackgroundConsole.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowBackgroundConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_object_sets()
end

StartGameWindowBackgroundConsole._create_viewport_definition = function (self)
	return {
		scenegraph_id = "root_fit",
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 990,
				viewport_name = "character_preview_viewport",
				clear_screen_on_create = true,
				level_name = "levels/ui_keep_menu/world",
				enable_sub_gui = false,
				fov = 50,
				world_name = "character_preview",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS
				},
				object_sets = LevelResource.object_set_names("levels/ui_keep_menu/world"),
				camera_position = {
					0,
					0,
					0
				},
				camera_lookat = {
					0,
					0,
					0
				}
			}
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true
			}
		}
	}
end

StartGameWindowBackgroundConsole.create_ui_elements = function (self, params, offset)
	self._viewport_widget_definition = self:_create_viewport_definition()

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local loading_overlay_widgets = {}
	local loading_overlay_widgets_by_name = {}

	for name, widget_definition in pairs(loading_overlay_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		loading_overlay_widgets[#loading_overlay_widgets + 1] = widget
		loading_overlay_widgets_by_name[name] = widget
	end

	self._loading_overlay_widgets = loading_overlay_widgets
	self._loading_overlay_widgets_by_name = loading_overlay_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowBackgroundConsole._setup_object_sets = function (self)
	local level_name = self._viewport_widget_definition.style.viewport.level_name
	local object_set_names = LevelResource.object_set_names(level_name)
	self._object_sets = {}

	for i = 1, #object_set_names, 1 do
		local object_set_name = object_set_names[i]
		self._object_sets[object_set_name] = LevelResource.unit_indices_in_object_set(level_name, object_set_name)
	end
end

StartGameWindowBackgroundConsole.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowBackgroundConsole")

	self.ui_animator = nil

	if self.world_previewer then
		self.world_previewer:prepare_exit()
		self.world_previewer:on_exit()
		self.world_previewer:destroy()
	end

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end
end

StartGameWindowBackgroundConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:draw(dt)

	if self.world_previewer then
		local disable_hero_unit_input = true

		self.world_previewer:update(dt, t, disable_hero_unit_input)

		local layout_name = self.parent:get_selected_game_mode_layout_name()

		if layout_name ~= self._current_layout_name then
			self._current_layout_name = layout_name

			self:_update_object_sets(layout_name)
		end
	end
end

StartGameWindowBackgroundConsole._update_object_sets = function (self, layout_name)
	local object_set_to_enable = object_sets_per_layout[layout_name]
	local enabled_object_sets_string = "[StartGameWindowBackgroundConsole] Enabling the following object sets:"

	for object_set_name, _ in pairs(object_set_to_enable) do
		enabled_object_sets_string = string.format("%s %s", enabled_object_sets_string, object_set_name)
	end

	print(enabled_object_sets_string)

	for object_set_name, object_set_units in pairs(self._object_sets) do
		local enable_visibility = object_set_to_enable[object_set_name] or false

		self.world_previewer:show_level_units(object_set_units, enable_visibility)
	end
end

StartGameWindowBackgroundConsole.post_update = function (self, dt, t)
	if not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)
		self._fadeout_loading_overlay = true
	end

	self:_update_loading_overlay_fadeout_animation(dt)

	if not self.initialized and self._viewport_widget then
		local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, camera_position_by_character)
		local hero_name = nil

		world_previewer:on_enter(self._viewport_widget, hero_name)

		self.world_previewer = world_previewer
		self.initialized = true
	end

	if self.world_previewer then
		self.world_previewer:post_update(dt, t)
	end
end

StartGameWindowBackgroundConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	self.ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowBackgroundConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	if self._show_loading_overlay then
		local loading_overlay_widgets = self._loading_overlay_widgets

		for i = 1, #loading_overlay_widgets, 1 do
			local widget = loading_overlay_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		local ui_renderer = self.ui_renderer

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
		UIRenderer.end_pass(ui_renderer)
	end
end

StartGameWindowBackgroundConsole._update_loading_overlay_fadeout_animation = function (self, dt)
	if not self._fadeout_loading_overlay then
		return
	end

	local start = 255
	local target = 0
	local speed = 9
	local progress = math.min(1, (self._fadeout_progress or 0) + speed * dt)
	local alpha = math.lerp(start, target, math.easeInCubic(progress))
	local loading_overlay_widgets_by_name = self._loading_overlay_widgets_by_name
	local loading_overlay = loading_overlay_widgets_by_name.loading_overlay
	local loading_overlay_loading_glow = loading_overlay_widgets_by_name.loading_overlay_loading_glow
	local loading_overlay_loading_frame = loading_overlay_widgets_by_name.loading_overlay_loading_frame
	loading_overlay.style.rect.color[1] = alpha
	loading_overlay_loading_glow.style.texture_id.color[1] = alpha
	loading_overlay_loading_frame.style.texture_id.color[1] = alpha
	self._fadeout_progress = progress

	if progress == 1 then
		self._fadeout_loading_overlay = nil
		self._fadeout_progress = nil
		self._show_loading_overlay = false
	end
end

return
