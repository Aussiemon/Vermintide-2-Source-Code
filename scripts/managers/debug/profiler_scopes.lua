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

	for ii = 0, 2 + depth do
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
end

function profiler_scopes_dump()
	profiler_scopes_trace()

	dump_light = true
	dump = true
end

function profiler_scopes_dump_light()
	profiler_scopes_trace()

	dump_light = true
end

if Development.parameter("validate_profiling_scopes") or Development.parameter("debug_profiling_scopes") then
	Application.warning("Enabling profile scope validation")
	profiler_scopes_dump_light()
end
