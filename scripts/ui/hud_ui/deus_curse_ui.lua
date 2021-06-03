local definitions = local_require("scripts/ui/hud_ui/deus_curse_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local scenegraph_methods = definitions.scenegraph_methods
local text_background_width = definitions.text_background_width
local CURSE_INITIAL_ACTIVATION_DELAY_DIFF = -2
DeusCurseUI = class(DeusCurseUI)

DeusCurseUI.init = function (self, parent, ingame_ui_context)
	local mechanism = Managers.mechanism:game_mechanism()
	self._curse = mechanism and mechanism:get_current_node_curse()
	self._theme = mechanism and mechanism:get_current_node_theme()
	self._has_curse = self._curse and self._theme

	if not script_data.debug_enabled and not self._has_curse then
		return
	end

	self._world = ingame_ui_context.world_manager:world("level_world")
	self._player_unit = ingame_ui_context.player.player_unit
	self._mission_system = Managers.state.entity:system("mission_system")

	Managers.state.event:register(self, "gm_event_round_started", "on_round_started")

	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.wwise_world = Managers.world:wwise_world(self._world)
	self._animations = {}
	self.render_settings = {
		snap_pixel_positions = true
	}

	self:create_ui_elements()

	if self._has_curse then
		self:show_curse_info(self._theme, self._curse)
	end
end

DeusCurseUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._description_widget = UIWidget.init(definitions.widget_definitions.description_widget)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

DeusCurseUI.destroy = function (self)
	Managers.state.event:unregister("gm_event_round_started", self)

	self.ui_animator = nil
end

DeusCurseUI.update = function (self, dt, t)
	if not script_data.debug_enabled and not self._has_curse then
		return
	end

	local timer = self._timer

	if timer then
		local new_timer = timer - dt

		if new_timer > 0 then
			self._timer = new_timer
		else
			self._timer = nil

			self:on_timer_ended()
		end
	end

	local resolution_modified = self._has_curse and RESOLUTION_LOOKUP.modified

	if resolution_modified and self._timer ~= nil then
		self:show_curse_info(self._theme, self._curse)
	end

	if self._has_curse then
		self:draw(dt)
		self:update_animations(dt)
	end
end

DeusCurseUI.on_timer_ended = function (self)
	self:_clear_animations()
	self:_start_animation("curse_description_animation", "description_end")

	if not self._player_unit then
		return
	end

	local hud_extension = ScriptUnit.extension(self._player_unit, "hud_system")

	hud_extension:block_current_location_ui(false)
	self._mission_system:block_mission_ui(false)
end

DeusCurseUI.show_curse_info = function (self, theme, curse)
	local game_mode_manager = Managers.state.game_mode
	local round_started = game_mode_manager:is_round_started()
	local display_time = self:_get_display_time()
	self._timer = (round_started and display_time) or math.huge
	local mutator_data = MutatorTemplates[curse]
	local curse_name = Localize(mutator_data.display_name)
	local curse_description = Localize(mutator_data.description)
	local theme_settings = DeusThemeSettings[theme]
	local theme_color = theme_settings.curse_description_color
	local icon = theme_settings.icon
	local title_text = Localize(theme_settings.curse_title)

	self:_update_description_widget(title_text, curse_name, curse_description, icon, theme_color)
	self:_start_animation("curse_description_animation", "description_start")

	self._has_curse = true

	if not self._player_unit then
		return
	end

	local hud_extension = ScriptUnit.extension(self._player_unit, "hud_system")

	hud_extension:block_current_location_ui(true)
	self._mission_system:block_mission_ui(true)
end

DeusCurseUI._update_description_widget = function (self, title_text, curse_name, curse_description, icon, color)
	local content = self._description_widget.content
	content.theme_icon = icon
	content.title_text = title_text
	content.curse_name = curse_name
	content.area_text_content = curse_description
	local text_height = UIUtils.get_text_height(self.ui_renderer, {
		text_background_width,
		0
	}, self._description_widget.style.area_text_style, curse_description)

	scenegraph_methods.change_widget_height(text_height)

	local style = self._description_widget.style
	style.top_detail_glow.color = color
	style.bottom_glow.color = color
	style.bottom_edge_glow.color = color
	style.top_glow.color = color
	style.top_edge_glow.color = color
end

DeusCurseUI.on_round_started = function (self)
	self._timer = self:_get_display_time()
end

DeusCurseUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._description_widget)
	UIRenderer.end_pass(ui_renderer)
end

DeusCurseUI._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local anim_id = self.ui_animator:start_animation(animation_name, self._description_widget, scenegraph_definition, params)
	self._animations[key] = anim_id
end

DeusCurseUI.update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

DeusCurseUI._get_display_time = function (self)
	return MutatorCommonSettings.deus.initial_activation_delay + CURSE_INITIAL_ACTIVATION_DELAY_DIFF
end

DeusCurseUI._clear_animations = function (self)
	for _, animation_id in pairs(self._animations) do
		self.ui_animator:stop_animation(animation_id)
	end

	table.clear(self._animations)
end

return
