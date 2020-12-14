ImguiCallInterceptor = class(ImguiCallInterceptor)

local function pack(...)
	return {
		n = select("#", ...),
		...
	}
end

local b = {}

local function CAPTURE_RETURN_VALUES(entry, ...)
	entry.rets = pack(...)

	return ...
end

__INTERCEPT_CALLS__ = setmetatable(__INTERCEPT_CALLS__ or {}, {
	__call = function (self, obj, method, enabled)
		if type(obj) == "string" then
			enabled = method

			for line in obj:gmatch("[^\r\n]+") do
				local obj_name, method = string.match(obj, "([%w_]+)[%:%.]([%w_]+)")

				self(rawget(_G, obj_name), method, enabled)
			end

			return
		end

		local func = obj[method]
		local log = {
			hits = 0,
			buffer = 50,
			enabled = enabled == nil or not not enabled
		}

		local function decorator(...)
			if not log.enabled then
				return func(...)
			end

			log.hits = log.hits + 1
			local t = Application.time_since_launch()
			local entry = {
				i = log.hits,
				time = string.format("%d:%.4f", math.floor(t / 60), t % 60),
				args = pack(...)
			}
			log[#log + 1] = entry

			while log.buffer < #log do
				table.remove(log, 1)
			end

			return CAPTURE_RETURN_VALUES(entry, func(...))
		end

		obj[method] = decorator
		self[string.format("%s.%s", table.find(_G, obj) or obj, method)] = log
	end
})

ImguiCallInterceptor.init = function (self)
	self._is_persistent = false
	self._obj_name = ""
	self._method_name = ""
end

ImguiCallInterceptor.update = function (self)
	return
end

local USAGE = [[
Usage:
	func = __INTERCEPT_CALLS__[[
		UtilTable.func
		ClassTable:method
		instance_table:method
	]]
	(Note: there's no difference between `.` or `:`)

Description:
	Intercept calls and show input/output data.

Example:
	__INTERCEPT_CALLS__ "WwiseWorld.trigger_event"
]]

ImguiCallInterceptor.draw = function (self)
	Imgui.begin_window("Call Interceptor")
	Imgui.set_window_size(800, 600, "once")

	if Imgui.tree_node("[[ Call Interceptor Options ]]") then
		self._is_persistent = Imgui.checkbox("Is persistent", not not self._is_persistent)
		self._obj_name = Imgui.input_text("Object", self._obj_name)
		self._method_name = Imgui.input_text("Method", self._method_name)

		if Imgui.button("Intercept") and pcall(__INTERCEPT_CALLS__, rawget(_G, self._obj_name), self._method_name) then
			self._obj_name = ""
			self._method_name = ""
		end

		for line in string.gmatch(USAGE, "[^\n\r]+") do
			if string.find(line, "^\t") then
				Imgui.text(line)
			else
				Imgui.text_colored(line, 200, 200, 233, 255)
			end
		end

		Imgui.tree_pop()
	end

	for path, log in pairs(__INTERCEPT_CALLS__) do
		if Imgui.tree_node(path) then
			log.enabled = Imgui.checkbox("Capturing", log.enabled)

			Imgui.same_line(50)

			if Imgui.button("Clear log") then
				for i = 1, #log, 1 do
					log[i] = nil
				end
			end

			Imgui.same_line(50)
			Imgui.text("Total calls: " .. log.hits)

			log.buffer = Imgui.input_int("Buffer size", log.buffer)

			for i = #log, 1, -1 do
				local entry = log[i]

				if Imgui.tree_node(string.format("[Call %3d]", entry.i)) then
					local args = entry.args

					if args.n > 0 and Imgui.tree_node("Arguments", true) then
						for j = 1, args.n, 1 do
							ImguiLuaScratchpad:_inspect_pair(j, args[j])
						end

						Imgui.tree_pop()
					end

					local rets = entry.rets

					if rets.n > 0 and Imgui.tree_node("Returns", true) then
						for j = 1, rets.n, 1 do
							ImguiLuaScratchpad:_inspect_pair(j, rets[j])
						end

						Imgui.tree_pop()
					end

					Imgui.tree_pop()
				end
			end

			Imgui.tree_pop()
		end
	end

	Imgui.end_window()
end

ImguiCallInterceptor.is_persistent = function (self)
	return self._is_persistent
end

return
