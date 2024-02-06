﻿-- chunkname: @scripts/imgui/imgui_objectives_debug.lua

local SHOULD_RELOAD = true

ImguiObjectivesDebug = class(ImguiObjectivesDebug)

ImguiObjectivesDebug.init = function (self)
	self._objectives = {}
	self._timer = 0
	self._objective_system = nil
	self._initialized = false
	self._is_versus = false
	self._is_weave = false
	self._objective_lists = nil
end

ImguiObjectivesDebug._initialize = function (self)
	local weave_manager = Managers.weave

	if weave_manager:get_active_weave() then
		self._objective_system = Managers.state.entity:system("weave_objective_system")
		self._is_weave = true
	elseif Managers.mechanism:current_mechanism_name() == "versus" then
		self._objective_system = Managers.state.entity:system("versus_objective_system")
		self._is_versus = true
		self._timer_paused = false
	end

	self._num_main_objectives = self._objective_system:num_main_objectives()
	self._initialized = true
end

ImguiObjectivesDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if not self._initialized then
		self:_initialize()
	end

	self._objective_lists = self._objective_system:objective_lists()
	self._num_completed_main_objectives = self._objective_system:num_completed_main_objectives()
	self._current_objectives_index = self._objective_system:current_objective_index()
	self._num_current_sub_objectives = self._objective_system:num_current_sub_objectives()
	self._num_current_completed_sub_objectives = self._objective_system:num_current_completed_sub_objectives()

	if self._is_versus then
		self:_update_versus()
	elseif self._is_weave then
		self:_update_weave()
	end
end

ImguiObjectivesDebug._update_versus = function (self)
	local mechanism = Managers.mechanism:game_mechanism()

	if mechanism then
		self._timer = mechanism:win_conditions():round_timer()
	end
end

ImguiObjectivesDebug.is_persistent = function (self)
	return true
end

ImguiObjectivesDebug._temp = function (self, data, current_objectives, depth)
	depth = depth or 1

	for key, value in pairs(data) do
		if depth == 1 or type(value) == "table" and value.is_objective_root then
			if Imgui.tree_node(key, current_objectives and not value.completed) then
				self:_temp(value, current_objectives, depth + 1)

				if current_objectives and not value.completed then
					Imgui.indent()

					if Imgui.button("Complete Objective") then
						self._objective_system:complete_objective(key)
					end

					Imgui.unindent()
				end

				Imgui.tree_pop()
			end
		else
			Imgui.indent()

			if type(value) == "table" then
				if table.size(value) > 0 then
					Imgui.text(key .. ":")
					self:_temp(value, current_objectives, depth + 1)
				else
					Imgui.text(key .. ": {}")
				end
			else
				Imgui.text(key .. ": " .. tostring(value))
			end

			Imgui.unindent()
		end
	end
end

ImguiObjectivesDebug._same_line_dummy = function (self, x, y)
	Imgui.same_line()
	Imgui.dummy(x, y)
	Imgui.same_line()
end

ImguiObjectivesDebug._draw_versus = function (self, is_open)
	Imgui.text("Timer")
	Imgui.indent()
	Imgui.text("Pause")
	self:_same_line_dummy(0, 0)

	self._timer_paused = Imgui.checkbox("  ", self._timer_paused)
	script_data.versus_objective_timer_paused = self._timer_paused

	Imgui.text("Time")
	self:_same_line_dummy(7, 0)

	local new_time = Imgui.slider_float(" ", self._timer, 0, 600)

	if math.abs(new_time - self._timer) > math.epsilon then
		Managers.mechanism:game_mechanism():win_conditions():set_time(new_time)

		self._timer = new_time
	end

	Imgui.unindent()
	Imgui.dummy(0, 16)

	local obj_system = self._objective_system

	Imgui.text(string.format("Total Num Main Objectives: %q", obj_system._total_num_main_objectives))
	Imgui.text(string.format("Num Completed Main Objectives: %q", obj_system._num_completed_main_objectives))
	Imgui.text(string.format("Num Completed Sub Objectives: %q", obj_system._num_completed_sub_objectives))
	Imgui.text(string.format("Current Num Completed Main Objectives: %q", obj_system._current_num_completed_main_objectives))
	Imgui.text(string.format("Current Num Completed Sub Objectives: %q", obj_system._current_num_completed_sub_objectives))
	Imgui.text(string.format("Current Num Sub Objectives: %q", obj_system._current_num_sub_objectives))
	Imgui.text(string.format("Current Num Optional Sub Objectives: %q", obj_system._current_num_optional_sub_objectives))
	Imgui.text(string.format("Current Objective Index: %q", obj_system._current_objective_index))
end

ImguiObjectivesDebug.draw = function (self, is_open)
	local do_close = Imgui.begin_window("Objectives Debug")

	Imgui.text(string.format("Completed Objectives: %s/%s", self._num_completed_main_objectives, self._num_main_objectives))
	Imgui.dummy(0, 16)

	if self._is_versus then
		self:_draw_versus(is_open)
	end

	Imgui.dummy(0, 16)
	Imgui.text("Objectives")
	Imgui.indent()

	if self._objective_lists then
		for index, objectives in ipairs(self._objective_lists) do
			if index == self._current_objectives_index then
				Imgui.text(tostring(index))
			elseif index < self._current_objectives_index then
				Imgui.text_colored(tostring(index), 0, 255, 0, 255)
			else
				Imgui.text_colored(tostring(index), 255, 0, 0, 255)
			end

			self:_temp(objectives, index == self._current_objectives_index)
		end
	end

	Imgui.unindent()
	Imgui.end_window()

	return do_close
end
