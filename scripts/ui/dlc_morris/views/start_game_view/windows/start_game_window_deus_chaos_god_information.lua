local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_chaos_god_information_definitions")
local widget_definitions = definitions.widgets
StartGameWindowDeusChaosGodInformation = class(StartGameWindowDeusChaosGodInformation)

StartGameWindowDeusChaosGodInformation.on_enter = function (self, params, offset)
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._animations = {}
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements(definitions, params, offset)

	self._should_draw = false

	self:_start_animation("on_enter", self._widgets_by_name.god_info_widget)
end

StartGameWindowDeusChaosGodInformation.on_exit = function (self, params)
	table.clear(self)
end

StartGameWindowDeusChaosGodInformation._create_ui_elements = function (self, definitions, params, offset)
	self._scenegraph_definition = definitions.scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	self._refresh_time = 0
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)
	self:_setup_belakor_information()
end

StartGameWindowDeusChaosGodInformation._start_animation = function (self, animation_name, widget, params)
	params = params or {}
	params.render_settings = self._render_settings
	self._animations[animation_name] = self._ui_animator:start_animation(animation_name, widget, self._scenegraph_definition, params)
end

StartGameWindowDeusChaosGodInformation.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_update_time_left()
	self:_update_journey()

	if self._should_draw then
		self:_draw(dt, t)
	end
end

StartGameWindowDeusChaosGodInformation._update_journey = function (self)
	local selected_journey = self._parent:get_selected_level_id() or self._journey_name

	if selected_journey ~= self._journey_name then
		self._journey_name = selected_journey

		self:_update_theme()
		self:_update_belakor_status()
	end
end

StartGameWindowDeusChaosGodInformation.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusChaosGodInformation._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			animations[animation_name] = nil
		end
	end
end

StartGameWindowDeusChaosGodInformation._draw = function (self, dt, t)
	local ui_renderer = self._ui_top_renderer
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, input_service, dt, nil, self._render_settings)

	for i = 1, #self._widgets do
		local widget = self._widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowDeusChaosGodInformation._refresh_journey_data = function (self)
	local backend_deus = Managers.backend:get_interface("deus")
	local journey_cycle = backend_deus:get_journey_cycle()
	self._journey_cycle = journey_cycle
	self._refresh_time = journey_cycle.remaining_time + journey_cycle.time_of_update

	self:_update_theme()
end

StartGameWindowDeusChaosGodInformation._update_time_left = function (self)
	local current_time = Managers.time:time("main")
	local remaining_time = self._refresh_time - current_time
	local widget = self._widgets_by_name.god_info_widget
	local widget_content = widget.content

	if remaining_time > 120 then
		local days = remaining_time / 86400
		local hours = remaining_time / 3600 % 24
		local minutes = remaining_time / 60 % 60
		local fmt = Localize("deus_start_game_mod_timer")
		widget_content.subtitle = string.format(fmt, days, hours, minutes)
	else
		local fmt = Localize("deus_start_game_mod_timer_seconds")

		if remaining_time < 0 then
			remaining_time = 0

			self:_refresh_journey_data()
		end

		widget_content.subtitle = string.format(fmt, remaining_time)
	end

	self:_update_belakor_time_left()
end

StartGameWindowDeusChaosGodInformation._update_theme = function (self, initial_delay)
	local journey_name = self._journey_name
	local journey_cycle = self._journey_cycle
	local all_journey_data = journey_cycle.journey_data
	local current_journey_data = all_journey_data[journey_name]
	local dominant_god = current_journey_data and current_journey_data.dominant_god
	local theme_settings = dominant_god and DeusThemeSettings[dominant_god]

	if not theme_settings then
		self._should_draw = false

		return
	end

	self._should_draw = true
	local current_window_layout_settings = self._parent:get_current_window_layout_settings()

	if current_window_layout_settings and current_window_layout_settings.should_draw_god_info then
		self._should_draw = current_window_layout_settings.should_draw_god_info(self._ingame_ui_context)
	end

	self:_start_animation("set_theme", self._widgets_by_name.god_info_widget, {
		theme_settings = theme_settings
	})
end

StartGameWindowDeusChaosGodInformation._setup_belakor_information = function (self)
	self._belakor_refresh_time = 0
	self._is_refreshing_belakor = false
	local belakor_widget = self._widgets_by_name.belakor_info_widget
	belakor_widget.content.visible = false

	self:_refresh_belakor_curse_data()
end

StartGameWindowDeusChaosGodInformation._refresh_belakor_curse_data = function (self)
	local backend_deus = Managers.backend:get_interface("deus")
	local belakor_data = backend_deus:get_belakor_cycle()

	if not belakor_data then
		return false
	end

	self._belakor_data = belakor_data
	self._belakor_refresh_time = belakor_data.remaining_time + belakor_data.time_of_update

	Managers.state.event:trigger("_update_additional_curse_frame", self._belakor_data.journey_name)
end

StartGameWindowDeusChaosGodInformation._update_belakor_time_left = function (self)
	local current_time = Managers.time:time("main")
	local backend_deus = Managers.backend:get_interface("deus")
	local belakor_active_in_expedition = backend_deus:deus_journey_with_belakor(self._journey_name)
	local belakor_remaining_time = math.max(self._belakor_refresh_time - current_time, 0)

	if belakor_active_in_expedition then
		local belakor_widget = self._widgets_by_name.belakor_info_widget
		local belakor_widget_content = belakor_widget.content

		if belakor_remaining_time > 120 then
			local hours = belakor_remaining_time / 3600 % 24
			local minutes = belakor_remaining_time / 60 % 60
			local hrs = Localize("datetime_hours_short")
			local min = Localize("datetime_minutes_short")
			belakor_widget_content.subtitle = string.format(hrs, hours) .. " " .. string.format(min, minutes)
		else
			local fmt = Localize("deus_start_game_mod_timer_seconds")
			belakor_widget_content.subtitle = string.format(fmt, belakor_remaining_time)
		end
	end

	if belakor_remaining_time <= 0 then
		if self._is_refreshing_belakor then
			if backend_deus:has_loaded_belakor_data() then
				self._is_refreshing_belakor = false

				self:_refresh_belakor_curse_data()
				self:_update_belakor_status()
			end
		else
			self._is_refreshing_belakor = true

			backend_deus:refresh_belakor_cycle()
		end
	end
end

StartGameWindowDeusChaosGodInformation._update_belakor_status = function (self)
	local backend_deus = Managers.backend:get_interface("deus")
	local belakor_active_in_expedition = backend_deus:deus_journey_with_belakor(self._journey_name)
	local widget = self._widgets_by_name.belakor_info_widget

	if belakor_active_in_expedition then
		self:_start_animation("set_theme_belakor", widget, {
			theme_settings = DeusThemeSettings.belakor
		})
	end

	widget.content.visible = belakor_active_in_expedition
end
