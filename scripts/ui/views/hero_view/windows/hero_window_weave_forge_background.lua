-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_weave_forge_background.lua

require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_background_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false

HeroWindowWeaveForgeBackground = class(HeroWindowWeaveForgeBackground)
HeroWindowWeaveForgeBackground.NAME = "HeroWindowWeaveForgeBackground"

HeroWindowWeaveForgeBackground.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowWeaveForgeBackground")

	self._params = params
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._ingame_ui_context = ingame_ui_context
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)

	local hero_name = params.hero_name
	local career_index = params.career_index
	local profile_index = params.profile_index
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name

	self._career_name = career_name
	self._hero_name = hero_name
end

HeroWindowWeaveForgeBackground._setup_definitions = function (self)
	if self._parent:gamepad_style_active() then
		definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_background_console_definitions")
	else
		definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_background_definitions")
	end

	widget_definitions = definitions.widgets
	scenegraph_definition = definitions.scenegraph_definition
	animation_definitions = definitions.animation_definitions
end

HeroWindowWeaveForgeBackground.create_ui_elements = function (self, params, offset)
	self:_setup_definitions()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

HeroWindowWeaveForgeBackground.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowWeaveForgeBackground")

	self._ui_animator = nil
end

HeroWindowWeaveForgeBackground.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_draw(dt)
end

HeroWindowWeaveForgeBackground.post_update = function (self, dt, t)
	return
end

HeroWindowWeaveForgeBackground._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowWeaveForgeBackground._draw = function (self, dt)
	local ui_renderer = self._parent:get_ui_renderer()
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
