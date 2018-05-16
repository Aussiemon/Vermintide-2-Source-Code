local definitions = local_require("scripts/ui/hud_ui/level_countdown_ui_definitions")
local DO_RELOAD = true
LevelCountdownUI = class(LevelCountdownUI)

LevelCountdownUI.init = function (self, ingame_ui_context)
	self.level_transition_handler = ingame_ui_context.level_transition_handler
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.camera_manager = ingame_ui_context.camera_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.is_server = ingame_ui_context.is_server
	self.world_manager = ingame_ui_context.world_manager
	self.input_manager = ingame_ui_context.input_manager
	self.matchmaking_manager = Managers.matchmaking
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()

	self.colors = {
		normal = Colors.get_table("font_default"),
		selected = Colors.get_table("font_title")
	}

	self.network_event_delegate:register(self, "rpc_start_game_countdown", "rpc_stop_enter_game_countdown")
end

LevelCountdownUI.create_ui_elements = function (self)
	DO_RELOAD = false
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.countdown_widget = UIWidget.init(definitions.widgets.fullscreen_countdown)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

LevelCountdownUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()

		self.colors = {
			normal = Colors.get_table("font_default"),
			selected = Colors.get_table("font_title")
		}
	end

	if not self.is_in_inn then
		return
	end

	local ui_suspended = self.ingame_ui.menu_suspended

	if ui_suspended then
		return
	end

	local start_time, max_start_time = self:_get_start_time()

	if start_time and max_start_time then
		if self:update_enter_game_counter(start_time, max_start_time, dt) then
			self:draw(dt)

			if not self._timer_active then
				self.ingame_ui:handle_transition("close_active")

				self._timer_active = true
			end
		else
			self.last_timer_value = max_start_time
			self._timer_active = false
		end
	end
end

LevelCountdownUI.is_enter_game = function (self)
	return false
end

LevelCountdownUI.draw = function (self, dt)
	local input_service = self.input_manager:get_service("ingame_menu")
	local ui_renderer = self.ui_renderer

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.countdown_widget)

	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale

	UIRenderer.end_pass(ui_renderer)
end

LevelCountdownUI.rpc_start_game_countdown = function (self, sender)
	self.ingame_ui:handle_transition("close_active")
	self:start_enter_game_counter()
end

LevelCountdownUI.rpc_stop_enter_game_countdown = function (self, sender)
	self:stop_enter_game_countdown()
end

LevelCountdownUI.start_enter_game_counter = function (self)
	self.enter_game_started = true
	self.enter_game = true
	self.anim_t = 0
	self.last_timer_value = 0
	local widget = self.countdown_widget
	local widget_content = widget.content
	widget_content.timer_text = 0
	local input_manager = self.input_manager

	self:play_sound("Play_hud_matchmaking_countdown_enter")
end

LevelCountdownUI.stop_enter_game_countdown = function (self)
	self.enter_game = nil
	self.enter_game_started = nil
	self.last_timer_value = nil
	self._timer_active = nil
end

LevelCountdownUI.update_enter_game_counter = function (self, start_time, max_start_time, dt)
	local widget = self.countdown_widget
	local widget_content = widget.content
	local widget_style = widget.style
	local colors = self.colors
	local new_timer_value = math.round(start_time)
	local draw = new_timer_value ~= max_start_time

	if new_timer_value ~= self.last_timer_value then
		if new_timer_value ~= 0 then
			self:play_sound("Play_hud_matchmaking_countdown")

			widget_content.timer_text = new_timer_value
			self.color_timer = 0
		else
			self:play_sound("Play_hud_matchmaking_countdown_final")

			widget_content.timer_text = ""
		end

		self.last_timer_value = new_timer_value

		Colors.lerp_color_tables(colors.normal, colors.selected, 0, widget_style.timer_text.text_color)
	else
		local color_timer = self.color_timer

		if color_timer then
			local total_color_time = 0.5
			color_timer = math.min(color_timer + dt, total_color_time)
			local color_progress = color_timer / total_color_time
			self.color_timer = color_timer

			Colors.lerp_color_tables(colors.normal, colors.selected, color_progress, widget_style.timer_text.text_color)
		end
	end

	if start_time <= 0 then
		self.matchmaking_manager:countdown_completed()
	end

	return draw
end

LevelCountdownUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

LevelCountdownUI.destroy = function (self)
	self.network_event_delegate:unregister(self)
	self:stop_enter_game_countdown()
end

LevelCountdownUI.set_waystone_activation = function (enable)
	local waystone_unit = LevelCountdownUI._get_waystone_unit()

	if waystone_unit == nil then
		return
	end

	local event = (enable and "activate") or "deactivate"

	Unit.flow_event(waystone_unit, event)
end

LevelCountdownUI._get_start_time = function (self)
	if not self._waystone_unit then
		self._waystone_unit = LevelCountdownUI._get_waystone_unit()
	end

	local unit = self._waystone_unit

	if Unit.alive(unit) then
		local status_extension = ScriptUnit.extension(unit, "props_system")

		if status_extension then
			local max_start_time = status_extension:end_time()
			local current_start_time = status_extension:end_time_left()

			return current_start_time, max_start_time
		end
	end
end

LevelCountdownUI._get_waystone_unit = function ()
	local world_manager = Managers.world

	if world_manager:has_world("level_world") then
		local map_unit = nil
		local world = world_manager:world("level_world")
		local level_name = "levels/inn/world"
		local level = ScriptWorld.level(world, level_name)

		if level then
			local units = Level.units(level)

			for i, level_unit in ipairs(units) do
				if Unit.has_data(level_unit, "game_start_waystone") then
					return level_unit
				end
			end
		end
	end
end

return
