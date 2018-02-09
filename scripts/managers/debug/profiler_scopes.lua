local depth = 0
local dump = false
local dump_light = false
local has_started = false
local last_started = nil
local started_scopes = {}
local started_scopes2 = {}
local overloaded = overloaded or false

local function indent(depth)
	local ind = ""

	for ii = 0, depth + 2, 1 do
		ind = ind .. "   "
	end

	return ind
end

local function get_line()
	local tb = debug.traceback()
	local result = string.match(tb, [[
	.-
	.-
	(.-)
]])

	return result
end

function profiler_scopes_trace()
	if overloaded then
		return 
	end

	overloaded = true
	local Profiler_start = Profiler.start
	Profiler.start = function (scope)
		if scope == nil then
			Application.error("Profiler with nil scope")
		end

		last_started = scope

		if dump_light then
			table.insert(started_scopes, scope)

			local str = tostring(scope)

			for i = 1, depth + 1, 1 do
				str = "+" .. str
			end

			started_scopes2[#started_scopes2 + 1] = str
		end

		if dump then
			print(indent(depth) .. "Start: " .. tostring(scope))
			print(indent(depth) .. "       " .. tostring(get_line()))
		end

		depth = depth + 1

		Profiler_start(scope)

		return 
	end
	local Profiler_stop = Profiler.stop
	Profiler.stop = function (scope)
		Profiler_stop()

		depth = depth - 1

		if scope == nil then
			Application.error("Profiler with nil scope")
		end

		local started_scope = started_scopes[#started_scopes]

		if scope and scope ~= started_scope and has_started then
			Application.error("Unmatched profiling scopes! Stopped %q, expected %q", scope, started_scope)

			if script_data.validate_profiling_scopes then
				assert(false, "Unmatched profiling scopes! Stopped %q, expected %q", scope, started_scope)
			end
		end

		if dump then
			print(indent(depth) .. "Stop:  " .. tostring(started_scope))
			print(indent(depth) .. "       " .. tostring(get_line()))
		end

		if dump_light then
			table.remove(started_scopes)

			local str = tostring(scope)

			for i = 1, depth + 1, 1 do
				str = "-" .. str
			end

			started_scopes2[#started_scopes2 + 1] = str
		end

		return 
	end
	local real_update = update

	function update(...)
		real_update(...)

		if depth ~= 0 and has_started then
			Application.error("Profiler frame exit depth = %d", depth)

			if script_data.validate_profiling_scopes then
				table.dump(started_scopes2)
				assert(false, "Unmatched profiling scopes! Depth was %q", depth)
			end
		end

		depth = 0
		has_started = true
		dump = false
		started_scopes = {}
		started_scopes2 = {}

		return 
	end

	return 
end

function profiler_scopes_dump()
	profiler_scopes_trace()

	dump_light = true
	dump = true

	return 
end

function profiler_scopes_dump_light()
	profiler_scopes_trace()

	dump_light = true

	return 
end

if Development.parameter("validate_profiling_scopes") or Development.parameter("debug_profiling_scopes") then
	Application.warning("Enabling profile scope validation")
	profiler_scopes_dump_light()
end

return 
