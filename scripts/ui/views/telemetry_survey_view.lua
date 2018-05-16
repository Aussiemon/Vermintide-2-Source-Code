local definitions = local_require("scripts/ui/views/telemetry_survey_view_definitions")
TelemetrySurveyView = class(TelemetrySurveyView)
local SURVEY_TIMEOUT = 20

TelemetrySurveyView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.world_manager = ingame_ui_context.world_manager
	self.time_manager = ingame_ui_context.time_manager
	self.peer_id = ingame_ui_context.peer_id
	self.is_server = ingame_ui_context.is_server
	self.active = false
	self.opened = false
	self.timed_out = false
	self.transition_to = nil
	self.survey_answered = false
	self.survey_confirmed = false
	self.session_rating = 0
	self.survey_context = nil
	self.end_time = nil

	self:create_ui_elements()

	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	local input_manager = self.input_manager

	input_manager:create_input_service("telemetry_survey", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("telemetry_survey", "keyboard")
	input_manager:map_device_to_service("telemetry_survey", "mouse")
	input_manager:map_device_to_service("telemetry_survey", "gamepad")
end

TelemetrySurveyView.input_service = function (self)
	return self.input_manager:get_service("telemetry_survey")
end

TelemetrySurveyView.set_transition = function (self, transition)
	self.transition_to = transition
end

TelemetrySurveyView.set_survey_context = function (self, survey_context)
	self.survey_context = survey_context
end

TelemetrySurveyView.get_survey_context = function (self)
	return self.survey_context
end

TelemetrySurveyView.is_survey_answered = function (self)
	return self.survey_answered and self.survey_confirmed
end

TelemetrySurveyView.is_survey_timed_out = function (self)
	return self.timed_out
end

TelemetrySurveyView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.background_1 = UIWidget.init(definitions.widget_definitions.background_1)
	self.background_2 = UIWidget.init(definitions.widget_definitions.background_2)
	self.headers = UIWidget.init(definitions.widget_definitions.headers)
	local survey_ratings = {}

	for i = 1, 5, 1 do
		survey_ratings[i] = UIWidget.init(definitions.survey_rating_definitions(i))
	end

	self.survey_ratings = survey_ratings
	self.continue_button = UIWidget.init(definitions.widget_definitions.continue_button)
end

TelemetrySurveyView.destroy = function (self)
	if self.active then
		self:set_active(false)
	end
end

TelemetrySurveyView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

TelemetrySurveyView.on_enter = function (self)
	self.timed_out = false
	self.survey_confirmed = false

	self:set_active(not self.active)
end

TelemetrySurveyView.on_exit = function (self)
	self:set_active(not self.active)
	self:play_sound("Play_hud_button_close")

	self.opened = false

	if self.survey_answered and self.survey_confirmed then
		self:record_telemetry_survey()
	end

	self.session_rating = 0
end

TelemetrySurveyView.transition = function (self)
	if self.transition_to ~= nil then
		self.ingame_ui:handle_transition(self.transition_to)
	end
end

TelemetrySurveyView.record_telemetry_survey = function (self)
	assert(self.session_rating ~= 0, "Session rating was never set!")

	local player = Managers.player:player_from_peer_id(self.peer_id)

	Managers.telemetry.event:session_rating(player, self.session_rating)
end

TelemetrySurveyView.update = function (self, dt)
	if not self.active then
		return
	end

	local input_service = self.input_manager:get_service("ingame_menu")
	local curr_time = self.time_manager:time("game")
	local time_left = self.end_time - curr_time

	self:update_rating_buttons()
	self:update_time_text(time_left)
	self:update_button_disabled()
	self:handle_interaction(dt)
	self:draw(dt)

	if self.end_time <= curr_time then
		self.timed_out = true

		self:transition()
	end
end

TelemetrySurveyView.update_time_text = function (self, time_left)
	self.headers.content.time_left = tostring(math.round(time_left, 0))
end

TelemetrySurveyView.update_rating_buttons = function (self)
	local survey_ratings = self.survey_ratings

	for i = #survey_ratings, 1, -1 do
		local button = survey_ratings[i]
		local is_clicked = button.content.button_hotspot.is_clicked == 0

		if is_clicked then
			self.session_rating = i
			self.survey_answered = true
		elseif i <= self.session_rating then
			button.content.button_hotspot.is_selected = true
		else
			button.content.button_hotspot.is_selected = false
		end
	end
end

TelemetrySurveyView.update_button_disabled = function (self)
	self.continue_button.content.disabled = not self.survey_answered
	local is_disabled = self.continue_button.content.disabled
	local text_style = self.continue_button.style.text
	local text_color = (is_disabled and text_style.disabled_color) or text_style.base_color
	text_style.text_color = text_color
end

TelemetrySurveyView.set_active = function (self, active)
	self.active = active
	local input_manager = self.input_manager

	if active then
		ShowCursorStack.push()
		input_manager:block_device_except_service("telemetry_survey", "keyboard")
		input_manager:block_device_except_service("telemetry_survey", "mouse")
		input_manager:block_device_except_service("telemetry_survey", "gamepad")

		self.end_time = self.time_manager:time("game") + SURVEY_TIMEOUT
	else
		ShowCursorStack.pop()
		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
	end
end

TelemetrySurveyView.handle_interaction = function (self, dt)
	if self.opened then
		local is_disabled = self.continue_button.content.disabled

		if not is_disabled then
			local on_release = self.continue_button.content.button_hotspot.on_release
			local on_hover_enter = self.continue_button.content.button_hotspot.on_hover_enter
			local input_service = self.input_manager:get_service("telemetry_survey")

			if self.continue_button.content.button_hotspot.on_hover_enter then
				self:play_sound("Play_hud_hover")
			end

			if input_service:get("confirm") or on_release then
				self.survey_confirmed = true

				self:transition()
			end
		end
	else
		self.opened = true
	end
end

TelemetrySurveyView.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("telemetry_survey")
	local survey_ratings = self.survey_ratings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_top_renderer, self.background_1)
	UIRenderer.draw_widget(ui_top_renderer, self.background_2)
	UIRenderer.draw_widget(ui_top_renderer, self.headers)
	UIRenderer.draw_widget(ui_top_renderer, self.continue_button)

	for i = 1, #survey_ratings, 1 do
		UIRenderer.draw_widget(ui_top_renderer, survey_ratings[i])
	end

	UIRenderer.end_pass(ui_top_renderer)
end

return
