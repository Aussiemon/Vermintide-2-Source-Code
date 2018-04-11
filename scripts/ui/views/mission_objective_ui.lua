local definitions = local_require("scripts/ui/views/mission_objective_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
MissionObjectiveUI = class(MissionObjectiveUI)
MissionObjectiveUI.init = function (self, ingame_ui_context)
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
		snap_pixel_positions = true
	}

	self.create_ui_elements(self)
	rawset(_G, "mission_objective_ui", self)

	return 
end
local DO_RELOAD = true
MissionObjectiveUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._mission_widget = UIWidget.init(definitions.widget_definitions.mission_widget)
	self.current_mission_objective = nil

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	DO_RELOAD = false

	return 
end
MissionObjectiveUI.destroy = function (self)
	self.ui_animator = nil

	rawset(_G, "mission_objective_ui", nil)

	return 
end
MissionObjectiveUI.update = function (self, dt)
	if DO_RELOAD then
		self.create_ui_elements(self)
	end

	self.update_animations(self, dt)
	self.next_mission_objective(self, dt)

	if self.current_mission_objective or self._animations.mission_animation then
		self.draw(self, dt)
	end

	return 
end
MissionObjectiveUI.add_mission_objective = function (self, mission_name, text)
	local saved_mission_objectives = self.saved_mission_objectives

	for _, mission_data in pairs(saved_mission_objectives) do
		if mission_data.mission_name == mission_name then
			return 
		end
	end

	self.saved_mission_objectives[#self.saved_mission_objectives + 1] = {
		mission_name = mission_name,
		text = text
	}

	return 
end
MissionObjectiveUI._clear_animations = function (self)
	for animation_name, animation_id in pairs(self._animations) do
		self.ui_animator:stop_animation(animation_id)
	end

	table.clear(self._animations)

	return 
end
MissionObjectiveUI.complete_mission = function (self, mission_name, remove_immediately)
	if remove_immediately then
		self._clear_animations(self)
		self._remove_mission_objective(self, mission_name)
	else
		self._remove_mission_objective(self, mission_name)
		self._clear_animations(self)
		self._start_animation(self, "mission_animation", "mission_end")
	end

	return 
end
MissionObjectiveUI._remove_mission_objective = function (self, mission_name)
	local index = nil

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

	return 
end
MissionObjectiveUI.update_mission = function (self, mission_name, text)
	local index = nil

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

			self._set_mission_text(self, text)
		end
	end

	return 
end
MissionObjectiveUI.next_mission_objective = function (self, dt)
	if not self.current_mission_objective and 0 < #self.saved_mission_objectives and not self._animations.mission_animation then
		local current_mission_data = self.saved_mission_objectives[1]
		self.current_mission_objective = current_mission_data.mission_name
		local widget = self._mission_widget

		self._set_mission_text(self, current_mission_data.text)
		self._start_animation(self, "mission_animation", "mission_start")
	end

	return 
end
MissionObjectiveUI.update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	ui_animator.update(ui_animator, dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
MissionObjectiveUI._set_mission_text = function (self, text)
	local content = self._mission_widget.content
	local style = self._mission_widget.style
	content.area_text_content = text
	local ui_renderer = self.ui_renderer
	local max_width = 287.5
	local max_height = 40
	content.text_height = 45

	return 
end
MissionObjectiveUI._get_text_size = function (self, ui_renderer, text, max_width, max_height, style)
	style.font_size = style.default_font_size
	local full_font_height = math.huge

	if max_height < full_font_height then
		repeat
			local font, scaled_font_size = UIFontByResolution(style)
			local font_material = font[1]
			local font_size = font[2]
			local font_name = font[3]
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

	return 
end
MissionObjectiveUI._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local anim_id = self.ui_animator:start_animation(animation_name, self._mission_widget, scenegraph_definition, params)
	self._animations[key] = anim_id

	return 
end

return 
