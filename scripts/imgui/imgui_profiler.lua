-- chunkname: @scripts/imgui/imgui_profiler.lua

ImguiProfiler = class(ImguiProfiler)

ImguiProfiler.init = function (self)
	self._filter = ""
	self._filter_applied = false
	self._auto_update_filter = false
	self._pause_on_frame_spike = false
end

ImguiProfiler.is_persistent = function (self)
	return true
end

ImguiProfiler.on_show = function (self)
	CALCULATE_AVERAGE = true
end

ImguiProfiler.on_hide = function (self)
	CALCULATE_AVERAGE = false
end

ImguiProfiler.update = function (self, t, dt)
	CALCULATE_AVERAGE = true
end

ImguiProfiler.draw = function (self)
	return
end

local INDEX = 1

FILTERED_SCOPES = {}
FILTERED_SCOPES_INDEX = 1

ImguiProfiler.post_draw = function (self)
	local do_close = Imgui.begin_window("Profiler")

	Imgui.set_window_size(700, 512, "once")

	local new_profiler_frames, confirmed = Imgui.input_int("Average over number of frames", PROFILE_FRAMES)

	if confirmed then
		PROFILE_FRAMES = new_profiler_frames
	end

	local update_filter = false
	local new_filter_text, confirmed = Imgui.input_text("Filter", self._filter)

	if confirmed then
		self._filter = new_filter_text
		self._filter_applied = self._filter ~= ""
		update_filter = true
	end

	self._auto_update_filter = Imgui.checkbox("Auto Update Filter (affects performance)", self._auto_update_filter)

	if update_filter or self._auto_update_filter then
		FILTERED_SCOPES_INDEX = 1

		local SCOPES = self._paused_scope or PROFILER_SCOPE_LOOKUP

		if self._filter ~= "" then
			self:_apply_filter(SCOPES, false)
		end
	end

	self._pause_on_frame_spike = Imgui.checkbox("Pause on frame spike", self._pause_on_frame_spike)

	if self._pause_on_frame_spike then
		self._pause_on_frame_time_text = Imgui.input_text("Pause At Frametime (ms)", self._pause_on_frame_time_text or "200")

		local last_time = self._pause_on_frame_time

		self._pause_on_frame_time = tonumber(self._pause_on_frame_time_text)

		if self._pause_on_frame_time ~= last_time then
			self._paused_scope = nil
			self._paused_frame_index = nil
		end
	else
		self._pause_on_frame_time = nil
		self._paused_scope = nil
		self._paused_frame_index = nil
	end

	Imgui.begin_child_window("Profiler Tree", 0, 0, true)

	INDEX = 1

	if self._filter_applied then
		self:_draw_filtered_scopes()
	else
		self:_draw_lookup_table(self._paused_scope or PROFILER_SCOPE_LOOKUP, false)
	end

	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiProfiler._draw_filtered_scopes = function (self)
	if FILTERED_SCOPES_INDEX > 1 then
		local is_open = Imgui.tree_node("root", true)

		for i = 1, FILTERED_SCOPES_INDEX - 1 do
			local filtered_scope = FILTERED_SCOPES[i]

			self:_draw_lookup_table(filtered_scope, false)
		end

		Imgui.tree_pop()
	else
		Imgui.text_colored(string.format("No scope includes the text %q", self._filter), 255, 128, 128, 255)
	end
end

ImguiProfiler._draw_lookup_table = function (self, in_scope, is_top_scope)
	local parent = in_scope.name

	if in_scope.frame_index and in_scope.frame_index < (self._paused_frame_index or CURRENT_FRAME_INDEX) then
		return
	end

	local is_root = false
	local is_leaf = in_scope.is_leaf ~= false
	local scope_time = self._paused_scope and in_scope.profiler_scope or in_scope.average_profiler_scope
	local profiler_suffix = scope_time and string.format("%.3f", scope_time) or ""
	local header

	if is_leaf then
		header = string.format("%s", in_scope.name, INDEX)

		if is_top_scope then
			Imgui.text_colored(header, 0, 255, 0, 255)
		else
			Imgui.text(header)
		end

		Imgui.same_line()

		if is_top_scope then
			Imgui.text_colored(profiler_suffix, 0, 255, 0, 255)
		else
			Imgui.text_colored(profiler_suffix, 192, 128, 128, 255)
		end

		return
	elseif in_scope.name then
		header = string.format("%s ##%s", in_scope.name, INDEX)
	else
		header = "root"
		is_root = true
	end

	INDEX = INDEX + 1

	local is_open = Imgui.tree_node(header, is_root)

	Imgui.same_line()

	if is_top_scope then
		Imgui.text_colored(profiler_suffix, 0, 255, 0, 255)
	else
		Imgui.text_colored(profiler_suffix, 192, 128, 128, 255)
	end

	if is_open then
		local top_value = -1
		local top_scope = ""
		local total_frame_time = 0
		local SORTED_SCOPES = {}

		for _, scope in pairs(in_scope) do
			if type(scope) == "table" then
				if scope.parent == parent and scope.frame_index == (self._paused_frame_index or CURRENT_FRAME_INDEX) then
					SORTED_SCOPES[#SORTED_SCOPES + 1] = scope

					local value = self._paused_scope and scope.profiler_scope or scope.average_profiler_scope or 0

					if top_value < value then
						top_value = value
						top_scope = scope
					end

					total_frame_time = total_frame_time + scope.profiler_scope
				end

				local stack = scope.stack

				if stack then
					for i = 1, stack.stack_index do
						local entry = stack[i]

						SORTED_SCOPES[#SORTED_SCOPES + 1] = entry

						local value = self._paused_scope and entry.profiler_scope or entry.average_profiler_scope or 0

						if top_value < value then
							top_value = value
							top_scope = entry
						end
					end
				end
			end
		end

		local function sort_func(a, b)
			local a_name = a.name
			local b_name = b.name

			return a_name < b_name
		end

		table.sort(SORTED_SCOPES, sort_func)

		for _, scope in ipairs(SORTED_SCOPES) do
			self:_draw_lookup_table(scope, scope == top_scope)
		end

		if is_root and not self._paused_scope and total_frame_time >= (self._pause_on_frame_time or math.huge) then
			self._paused_scope = table.clone(in_scope)
			self._paused_frame_index = CURRENT_FRAME_INDEX
		end

		Imgui.tree_pop()
	end
end

ImguiProfiler._apply_filter = function (self, in_scope)
	local parent = in_scope.name

	if in_scope.frame_index and in_scope.frame_index < (self._paused_frame_index or CURRENT_FRAME_INDEX) then
		return
	end

	INDEX = INDEX + 1

	if parent and string.find(string.lower(parent), string.lower(self._filter)) ~= nil then
		FILTERED_SCOPES[FILTERED_SCOPES_INDEX] = in_scope
		FILTERED_SCOPES_INDEX = FILTERED_SCOPES_INDEX + 1

		return
	end

	local SORTED_SCOPES = {}

	for _, scope in pairs(in_scope) do
		if type(scope) == "table" then
			if scope.parent == parent and scope.frame_index == (self._paused_frame_index or CURRENT_FRAME_INDEX) then
				SORTED_SCOPES[#SORTED_SCOPES + 1] = scope
			end

			local stack = scope.stack

			if stack then
				for i = 1, stack.stack_index do
					local entry = stack[i]

					SORTED_SCOPES[#SORTED_SCOPES + 1] = entry
				end
			end
		end
	end

	local function sort_func(a, b)
		local a_name = a.name
		local b_name = b.name

		return a_name < b_name
	end

	table.sort(SORTED_SCOPES, sort_func)

	for _, scope in ipairs(SORTED_SCOPES) do
		self:_apply_filter(scope)
	end
end

ImguiProfiler.post_update = function (self, t, dt)
	return
end
