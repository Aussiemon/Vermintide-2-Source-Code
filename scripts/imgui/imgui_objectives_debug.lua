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
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager then
		self._timer = game_mode_manager:game_mode():win_conditions():round_timer()
	end
end

ImguiObjectivesDebug.is_persistent = function (self)
	return true
end

ImguiObjectivesDebug._temp = function (self, data, current_objectives, depth)
	depth = depth or 1

	for key, value in pairs(data) do
		if depth == 1 or (type(value) == "table" and value.is_objective_root) then
			if Imgui.TreeNode(key, current_objectives and not value.completed) then
				self:_temp(value, current_objectives, depth + 1)

				if current_objectives and not value.completed then
					Imgui.Indent()

					if Imgui.Button("Complete Objective") then
						self._objective_system:complete_objective(key)
					end

					Imgui.Unindent()
				end

				Imgui.TreePop()
			end
		else
			Imgui.Indent()

			if type(value) == "table" then
				if table.size(value) > 0 then
					Imgui.Text(key .. ":")
					self:_temp(value, current_objectives, depth + 1)
				else
					Imgui.Text(key .. ": {}")
				end
			else
				Imgui.Text(key .. ": " .. tostring(value))
			end

			Imgui.Unindent()
		end
	end
end

ImguiObjectivesDebug._same_line_dummy = function (self, x, y)
	Imgui.SameLine()
	Imgui.Dummy(x, y)
	Imgui.SameLine()
end

ImguiObjectivesDebug._draw_versus = function (self, is_open)
	Imgui.Text("Timer")
	Imgui.Indent()
	Imgui.Text("Pause")
	self:_same_line_dummy(0, 0)

	self._timer_paused = Imgui.Checkbox("  ", self._timer_paused)
	script_data.versus_objective_timer_paused = self._timer_paused

	Imgui.Text("Time")
	self:_same_line_dummy(7, 0)

	local new_time = Imgui.SliderFloat(" ", self._timer, 0, 600)

	if new_time ~= self._timer then
		Managers.state.game_mode:game_mode():win_conditions():set_time(new_time)

		self._timer = new_time
	end

	Imgui.Unindent()
end

ImguiObjectivesDebug.draw = function (self, is_open)
	Imgui.Begin("Objectives Debug")
	Imgui.Text(string.format("Completed Objectives: %s/%s", self._num_completed_main_objectives, self._num_main_objectives))
	Imgui.Dummy(0, 16)

	if self._is_versus then
		self:_draw_versus(is_open)
	end

	Imgui.Dummy(0, 16)
	Imgui.Text("Objectives")
	Imgui.Indent()

	if self._objective_lists then
		for index, objectives in ipairs(self._objective_lists) do
			if index == self._current_objectives_index then
				Imgui.Text(tostring(index))
			elseif index < self._current_objectives_index then
				Imgui.TextColored(tostring(index), 0, 255, 0, 255)
			else
				Imgui.TextColored(tostring(index), 255, 0, 0, 255)
			end

			self:_temp(objectives, index == self._current_objectives_index)
		end
	end

	Imgui.Unindent()
	Imgui.End()
end

return
