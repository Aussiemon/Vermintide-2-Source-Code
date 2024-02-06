﻿-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_weave.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition

StartGameWindowWeave = class(StartGameWindowWeave)
StartGameWindowWeave.NAME = "StartGameWindowWeave"

StartGameWindowWeave.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeave")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id

	self:create_ui_elements(params, offset)
	self.parent:set_play_button_enabled(true)
end

StartGameWindowWeave.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self.ui_scenegraph = ui_scenegraph

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowWeave.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeave")

	self.ui_animator = nil
end

StartGameWindowWeave.update = function (self, dt, t)
	self:draw(dt)
end

StartGameWindowWeave.post_update = function (self, dt, t)
	return
end

StartGameWindowWeave.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
