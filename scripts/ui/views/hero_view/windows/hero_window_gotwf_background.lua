require("scripts/ui/views/menu_world_previewer")
require("scripts/settings/hero_statistics_template")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_background_definitions")
local widget_definitions = definitions.widgets
local viewport_widget_definitions = definitions.viewport_widgets
local background_rect = definitions.background_rect
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local camera_position_by_character = definitions.camera_position_by_character
local loading_overlay_widget_definitions = definitions.loading_overlay_widgets
HeroWindowGotwfBackground = class(HeroWindowGotwfBackground)
HeroWindowGotwfBackground.NAME = "HeroWindowGotwfBackground"

HeroWindowGotwfBackground.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowGotwfBackground")

	local ingame_ui_context = params.ingame_ui_context
	self._params = params
	self._parent = params.parent
	self._world = ingame_ui_context.world
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._hero_name = params.hero_name
	self._career_index = params.career_index
	self._skin_sync_id = self._parent.skin_sync_id
	self._camera_move_duration = UISettings.console_menu_camera_move_duration
	self._animations = {}
	self._animation_callbacks = {}

	self:_create_ui_elements(params, offset)
end

HeroWindowGotwfBackground._start_animation = function (self, animation_name)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowGotwfBackground._create_viewport_definition = function (self)
	return {
		scenegraph_id = "screen",
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 2,
				viewport_name = "character_preview_viewport",
				clear_screen_on_create = true,
				level_name = "levels/gifts_of_the_wolf_father/gifts_of_wolf_father",
				enable_sub_gui = false,
				fov = 50,
				world_name = "character_preview",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS
				},
				object_sets = LevelResource.object_set_names("levels/gifts_of_the_wolf_father/gifts_of_wolf_father"),
				camera_position = {
					10,
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

HeroWindowGotwfBackground._create_ui_elements = function (self, params, offset)
	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local viewport_widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(viewport_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		viewport_widgets[#viewport_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._viewport_widgets = viewport_widgets
	self._widgets_by_name = widgets_by_name
	local loading_overlay_widgets = {}
	local loading_overlay_widgets_by_name = {}

	for name, widget_definition in pairs(loading_overlay_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		loading_overlay_widgets[#loading_overlay_widgets + 1] = widget
		loading_overlay_widgets_by_name[name] = widget
	end

	self._loading_overlay_widgets = loading_overlay_widgets
	self._loading_overlay_widgets_by_name = loading_overlay_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	if self._is_in_inn then
		local package_name = "resource_packages/dlcs/gotwf_store_resources"
		local package_reference_name = "gotwf_store_resources"
		local load_cb = callback(self, "_package_loaded")
		local asynchronous = true
		local prioritize = true

		Managers.package:load(package_name, package_reference_name, load_cb, asynchronous, prioritize)

		self._package_name = package_name
		self._package_reference_name = package_reference_name
		self._show_loading_overlay = true
		self._params.loading_package = true
	else
		self._background_widget = UIWidget.init(background_rect)
	end
end

HeroWindowGotwfBackground._package_loaded = function (self)
	self._viewport_widget_definition = self:_create_viewport_definition()
	self._fadeout_loading_overlay = true
end

HeroWindowGotwfBackground.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowGotwfBackground")

	self._ui_animator = nil

	if self._world_previewer then
		self._world_previewer:prepare_exit()
		self._world_previewer:on_exit()
		self._world_previewer:destroy()
	end

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	if self._package_reference_name and Managers.package:has_loaded(self._package_name, self._package_reference_name) then
		Managers.package:unload(self._package_name, self._package_reference_name)

		self._package_name = nil
		self._package_reference_name = nil
	end
end

HeroWindowGotwfBackground.update = function (self, dt, t)
	self:_update_pan(dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt, t)
end

HeroWindowGotwfBackground._update_pan = function (self, dt, t)
	if not self._world_previewer then
		return
	end

	self._start_t = self._start_t or 0
	local speed = 0.0025
	local pan_length = 38
	local fade_time = 1
	local pan_time = 1 / speed
	self._start_t = self._start_t + dt * speed
	local offset = self._start_t * pan_length % pan_length

	self._world_previewer:set_default_position({
		z = 53,
		y = 266,
		x = -62 + offset
	})
	self._world_previewer:set_lookat_target(Vector3Box(offset, 0, 53))

	local disable_hero_unit_input = true

	self._world_previewer:update(dt, t, disable_hero_unit_input)

	local widget = self._widgets_by_name.background_fade
	widget.content.progress = offset / pan_length
	widget.content.fade_start = (pan_time - fade_time) / pan_time
end

HeroWindowGotwfBackground.post_update = function (self, dt, t)
	if self._viewport_widget_definition and not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)
		local world = Managers.world:world("character_preview")
		local is_tutorial = false
		local is_in_inn = self._is_in_inn
		local mechanism_key = Managers.mechanism:current_mechanism_name()
		local current_layout_name = self._parent:get_layout_name()

		self._parent:create_layout_renderer(current_layout_name, world, is_tutorial, is_in_inn, mechanism_key)
	end

	self:_update_loading_overlay_fadeout_animation(dt)

	if not self._initialized and self._viewport_widget then
		local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, camera_position_by_character, "HeroWindowGotwfBackground")

		world_previewer:on_enter(self._viewport_widget, self._hero_name)
		world_previewer:set_default_position({
			z = 53,
			x = -62,
			y = 266
		})
		world_previewer:set_lookat_target(Vector3Box(0, 0, 53))

		self._world_previewer = world_previewer
		self._initialized = true
	end

	if self._world_previewer then
		self._world_previewer:post_update(dt, t)
	end
end

HeroWindowGotwfBackground._update_animations = function (self, dt)
	self._ui_animator:update(dt)

	local animations = self._animations
	local animation_callbacks = self._animation_callbacks
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
			local anim_cb = animation_callbacks[animation_name]

			if anim_cb then
				anim_cb()

				animation_callbacks[animation_name] = nil
			end
		end
	end
end

HeroWindowGotwfBackground._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local viewport_renderer = self._parent:get_layout_renderer()
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	if self._show_loading_overlay then
		for _, widget in ipairs(self._loading_overlay_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
		UIRenderer.end_pass(ui_renderer)
	elseif self._background_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
		UIRenderer.draw_widget(ui_renderer, self._background_widget)
		UIRenderer.end_pass(ui_renderer)
	end

	if viewport_renderer then
		UIRenderer.begin_pass(viewport_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

		for _, widget in ipairs(self._viewport_widgets) do
			UIRenderer.draw_widget(viewport_renderer, widget)
		end

		UIRenderer.end_pass(viewport_renderer)
	end
end

HeroWindowGotwfBackground._update_loading_overlay_fadeout_animation = function (self, dt)
	if not self._fadeout_loading_overlay then
		return
	end

	local loading_overlay_widgets_by_name = self._loading_overlay_widgets_by_name
	local start = 255
	local target = 0
	local speed = 2
	local progress = math.min(1, (self._fadeout_progress or 0) + speed * dt)
	local alpha = math.lerp(start, target, math.easeInCubic(progress))
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
		self._params.loading_package = false
	end
end
