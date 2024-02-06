﻿-- chunkname: @scripts/ui/views/mission_objective_ui.lua

local definitions = local_require("scripts/ui/views/mission_objective_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition

MissionObjectiveUI = class(MissionObjectiveUI)

MissionObjectiveUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager

	local world = ingame_ui_context.world_manager:world("level_world")

	self.wwise_world = Managers.world:wwise_world(world)
	self.saved_mission_objectives = {}
	self.completed_mission_objectives = {}
	self.current_mission_objective = nil
	self.index_count = 0
	self._animations = {}
	self.render_settings = {
		snap_pixel_positions = true,
	}

	self:create_ui_elements()

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "ui_event_add_mission_objective", "add_mission_objective")
		event_manager:register(self, "ui_event_complete_mission", "complete_mission")
		event_manager:register(self, "ui_event_update_mission", "update_mission")
		event_manager:register(self, "ui_event_block_mission_ui", "block_mission_ui")

		local mission_system = Managers.state.entity:system("mission_system")

		if mission_system then
			mission_system:trigger_active_mission_ui_events()
		end
	end
end

local DO_RELOAD = true

MissionObjectiveUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._mission_widget = UIWidget.init(definitions.widget_definitions.mission_widget)
	self.current_mission_objective = nil

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	DO_RELOAD = false
end

MissionObjectiveUI.destroy = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("ui_event_add_mission_objective", self)
		event_manager:unregister("ui_event_complete_mission", self)
		event_manager:unregister("ui_event_update_mission", self)
		event_manager:unregister("ui_event_block_mission_ui", self)
	end

	self.ui_animator = nil
end

MissionObjectiveUI.block_mission_ui = function (self, ui_blocked)
	self._ui_blocked = ui_blocked
end

local customizer_data = {
	drag_scenegraph_id = "background",
	label = "Objectives",
	registry_key = "mission_objective",
	root_scenegraph_id = "pivot",
}

MissionObjectiveUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data)

	if self._ui_blocked then
		return
	end

	self:update_animations(dt)
	self:next_mission_objective(dt)

	if self.current_mission_objective or self._animations.mission_animation then
		self:draw(dt)
	end
end

MissionObjectiveUI.add_mission_objective = function (self, mission_name, text, duration_text)
	local saved_mission_objectives = self.saved_mission_objectives

	for _, mission_data in pairs(saved_mission_objectives) do
		if mission_data.mission_name == mission_name then
			return
		end
	end

	self.saved_mission_objectives[#self.saved_mission_objectives + 1] = {
		mission_name = mission_name,
		text = text,
		duration_text = duration_text,
	}
end

MissionObjectiveUI._clear_animations = function (self)
	for animation_name, animation_id in pairs(self._animations) do
		self.ui_animator:stop_animation(animation_id)
	end

	table.clear(self._animations)
end

MissionObjectiveUI.complete_mission = function (self, mission_name, remove_immediately)
	if remove_immediately then
		self:_clear_animations()
		self:_remove_mission_objective(mission_name)
	else
		self:_remove_mission_objective(mission_name)
		self:_clear_animations()
		self:_start_animation("mission_animation", "mission_end")
	end
end

MissionObjectiveUI._remove_mission_objective = function (self, mission_name)
	local index

	for idx, mission_data in ipairs(self.saved_mission_objectives) do
		if mission_data.mission_name == mission_name then
			index = idx

			break
		end
	end

	if index then
		local mission_data = self.saved_mission_objectives[index]

		if mission_data then
			table.remove(self.saved_mission_objectives, index)

			self.completed_mission_objectives[mission_data.mission_name] = mission_data.text
			self.current_mission_objective = nil
		end
	end
end

MissionObjectiveUI.update_mission = function (self, mission_name, text, duration_text)
	local index

	for idx, mission_data in ipairs(self.saved_mission_objectives) do
		if mission_data.mission_name == mission_name then
			index = idx

			break
		end
	end

	if index then
		local mission_data = self.saved_mission_objectives[index]

		self.saved_mission_objectives[index].text = text

		if mission_data.mission_name == self.current_mission_objective then
			local widget = self._mission_widget

			self:_set_mission_text(text, duration_text)
		end
	end
end

MissionObjectiveUI.next_mission_objective = function (self, dt)
	if not self.current_mission_objective and #self.saved_mission_objectives > 0 and not self._animations.mission_animation then
		local current_mission_data = self.saved_mission_objectives[1]

		self.current_mission_objective = current_mission_data.mission_name

		local calculate_offsets = true

		self:_set_mission_text(current_mission_data.text, current_mission_data.duration_text, calculate_offsets)
		self:_start_animation("mission_animation", "mission_start")
	end
end

MissionObjectiveUI.update_animations = function (self, dt)
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

MissionObjectiveUI._set_mission_text = function (self, text, duration_text, calculate_offsets)
	local content = self._mission_widget.content
	local style = self._mission_widget.style

	content.area_text_content = text
	content.duration_text_content = duration_text and duration_text .. " " or nil

	local ui_renderer = self.ui_renderer
	local max_width, max_height = 287.5, 40

	content.text_height = 45

	if calculate_offsets then
		local ui_scenegraph = self.ui_scenegraph

		if duration_text then
			local font, size_of_font = UIFontByResolution(style.area_text_style)
			local font_material, font_size = font[1], size_of_font
			local text_string = string.upper(content.area_text_content)
			local text_width = UIRenderer.text_size(ui_renderer, text_string, font_material, font_size)
			local duration_string = duration_text
			local duration_width = UIRenderer.text_size(ui_renderer, duration_string, font_material, font_size)
			local area_text_background_size_x = ui_scenegraph.area_text_background.size[1]
			local duration_text_background_size_x = ui_scenegraph.duration_text_background.size[1]

			ui_scenegraph.area_text_background.position[1] = duration_width * 0.5
			ui_scenegraph.duration_text_background.position[1] = -text_width * 0.5
		else
			ui_scenegraph.area_text_background.local_position[1] = 0
			ui_scenegraph.duration_text_background.local_position[1] = 0
		end
	end
end

MissionObjectiveUI._get_text_size = function (self, ui_renderer, text, max_width, max_height, style)
	style.font_size = style.default_font_size

	local full_font_height = math.huge

	if max_height < full_font_height then
		repeat
			local font, scaled_font_size = UIFontByResolution(style)
			local font_material, font_size, font_name = font[1], font[2], font[3]
			local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
			local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, max_width)
			local num_texts = #texts

			full_font_height = (font_max + math.abs(font_min)) * RESOLUTION_LOOKUP.inv_scale * num_texts
			style.font_size = math.max(style.font_size - 1, style.min_font_size)
			style.new_font_size = style.font_size

			if style.font_size == style.min_font_size then
				return full_font_height
			end
		until full_font_height <= max_height
	end

	return full_font_height
end

MissionObjectiveUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._mission_widget)
	UIRenderer.end_pass(ui_renderer)
end

MissionObjectiveUI._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
		ui_renderer = self.ui_renderer,
	}
	local anim_id = self.ui_animator:start_animation(animation_name, self._mission_widget, scenegraph_definition, params)

	self._animations[key] = anim_id
end
