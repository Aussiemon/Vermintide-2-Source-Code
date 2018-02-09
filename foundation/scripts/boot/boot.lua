if not LEVEL_EDITOR_TEST then
	LEVEL_EDITOR_TEST = false
end

local function import(lib)
	for k, v in pairs(lib) do
		_G[k] = v
	end

	return 
end

if s3d then
	import(s3d)
end

BUILD = Application.build()
PLATFORM = Application.platform()
Application.build = function ()
	error("Trying to use BUILD, use global variable BUILD instead.")

	return 
end
Application.platform = function ()
	error("Trying to use Application.platform(), use global variable PLATFORM instead.")

	return 
end

if ijdbg then
	print("Using ijdbg")
	ijdbg.init()
end

if not PROFILER_SCOPES_INITED then
	local ProfilerScopes = {}
	PROFILER_SCOPES_INITED = true
	local profiler_start = Profiler.start
	Profiler.start = function (scope_name)
		ProfilerScopes[scope_name] = true

		profiler_start(scope_name)

		return 
	end
end

GLOBAL_FRAME_INDEX = GLOBAL_FRAME_INDEX or 0

function project_setup()
	return 
end

function pre_update()
	return 
end

local function base_require(path, ...)
	for _, s in ipairs({
		...
	}) do
		require(string.format("foundation/scripts/%s/%s", path, s))
	end

	return 
end

local function init_development_parameters()
	require("foundation/scripts/util/user_setting")
	Development.init_user_settings()
	require("foundation/scripts/util/application_parameter")
	Development.init_application_parameters({
		Application.argv()
	}, true)
	require("foundation/scripts/util/development_parameter")
	Development.init_parameters()

	local max_param_string_length = 0

	for param, value in pairs(script_data) do
		max_param_string_length = math.max(max_param_string_length, #param)
	end

	local sorted_params = {}

	for param, value in pairs(script_data) do
		if type(value) == "table" then
			local formatted_string = string.format("script_data.%%-%ds = {", max_param_string_length)
			local output = string.format(formatted_string, param)

			for i = 1, #value, 1 do
				output = output .. ", " .. tostring(value[i])
			end

			output = output .. " }"
			sorted_params[#sorted_params + 1] = output
		else
			local formatted_string = string.format("script_data.%%-%ds = %%s", max_param_string_length)
			sorted_params[#sorted_params + 1] = string.format(formatted_string, param, tostring(value))
		end
	end

	table.sort(sorted_params, function (a, b)
		return a < b
	end)
	print("*****************************************************************")
	print("**                Initial contents of script_data              **")

	for i = 1, #sorted_params, 1 do
		print(sorted_params[i])
	end

	print("*****************************************************************")

	return 
end

Boot = Boot or {}
local controlled_exit = false
Boot.setup = function (self)
	local platform = PLATFORM

	if platform == "win32" or platform == "macosx" then
		Window.set_focus()
		Window.set_mouse_focus(true)
	end

	print(Application.sysinfo())
	self._init_package_manager(self)
	init_development_parameters()

	local window_title = Development.parameter("window-title")

	if window_title and platform == "win32" then
		Window.set_title(window_title)
	end

	self._require_scripts(self)
	FrameTable.init()
	self._init_managers(self)

	local start_state, params = project_setup()

	self._setup_statemachine(self, start_state, params)

	return 
end
Boot._init_package_manager = function (self)
	base_require("managers", "managers", "package/package_manager")

	Managers.package = PackageManager

	Managers.package:init()
	Managers.package:load("foundation/resource_packages/boot", "boot")

	return 
end
Boot._require_scripts = function (self)
	Profiler.start("Boot:_require_scripts()")
	base_require("util", "verify_plugins", "clipboard", "error", "patches", "class", "callback", "rectangle", "state_machine", "visual_state_machine", "misc_util", "stack", "grow_queue", "table", "math", "vector3", "quaternion", "script_world", "script_viewport", "script_camera", "script_unit", "frame_table", "path")
	base_require("debug", "table_trap")
	base_require("managers", "world/world_manager", "player/player", "free_flight/free_flight_manager", "state/state_machine_manager", "time/time_manager", "token/token_manager")
	Profiler.stop("Boot:_require_scripts()")

	return 
end
Boot._init_managers = function (self)
	Profiler.start("Boot:_init_managers()")

	Managers.time = TimeManager:new()
	Managers.world = WorldManager:new()
	Managers.token = TokenManager:new()
	Managers.state_machine = StateMachineManager:new()

	Profiler.stop("Boot:_init_managers()")

	return 
end
Boot.pre_update = function (self, dt)
	return 
end
Boot.update = function (self, dt)
	GLOBAL_FRAME_INDEX = GLOBAL_FRAME_INDEX + 1

	Managers.time:update(dt)

	local t = Managers.time:time("main")

	Profiler.start("Lua machine pre-update")
	self._machine:pre_update(dt, t)
	Profiler.stop("Lua machine pre-update")
	Managers.package:update(dt, t)
	Profiler.start("Lua token update")
	Managers.token:update(dt, t)
	Profiler.stop("Lua token update")
	Profiler.start("Lua machine update")
	self._machine:update(dt, t)
	Profiler.stop("Lua machine update")
	Profiler.start("Visual state machine update")
	Managers.state_machine:update(dt)
	Profiler.stop("Visual state machine update")
	Profiler.start("Lua world update")
	Managers.world:update(dt, t)
	Profiler.stop("Lua world update")

	if self.quit_game then
		controlled_exit = true

		Application.quit()
	end

	if LEVEL_EDITOR_TEST and Keyboard.pressed(Keyboard.button_index("f5")) then
		Application.console_send({
			type = "stop_testing"
		})
	end

	return 
end
Boot.is_controlled_exit = function (self)
	return controlled_exit
end
Boot.post_update = function (self, dt)
	self._machine:post_update(dt)
	FrameTable.swap_tables()
	FrameTable.clear_tables()

	return 
end
Boot.render = function (self)
	Managers.world:render()
	self._machine:render()

	return 
end
Boot._setup_statemachine = function (self, start_state, params)
	Profiler.start("Boot:_setup_statemachine()")

	self._machine = StateMachine:new(self, start_state, params, true)

	Profiler.stop("Boot:_setup_statemachine()")

	return 
end
Boot.shutdown = function (self)
	self._machine:destroy(true)
	Managers:destroy()

	return 
end

function init()
	Script.set_index_offset(0)
	Boot:setup()

	return 
end

function update(dt)
	local dt = Managers.time:scaled_delta_time(dt)

	Profiler.start("LUA pre_update")
	pre_update(dt)
	Profiler.stop("LUA pre_update")
	Profiler.start("LUA update")
	Boot:update(dt)
	Profiler.stop("LUA update")
	Profiler.start("LUA post_update")
	Boot:post_update(dt)
	Profiler.stop("LUA post_update")

	return 
end

function render()
	Boot:render()

	return 
end

function shutdown()
	Boot:shutdown()

	return 
end

ReplayBoot = ReplayBoot or {}
ReplayBoot.init = function (self)
	Application.set_time_step_policy("throttle", 60, "no_smoothing", "debt_payback", 0)

	self._packages = {}

	for _, name in ipairs(ExtendedReplay.packages_to_load()) do
		print("Loading package " .. name)

		local package = Application.resource_package(name)

		package.load(package)
		package.flush(package)
		table.insert(self._packages, package)
	end

	base_require("util", "verify_plugins", "clipboard", "error", "patches", "class", "callback", "rectangle", "misc_util", "stack", "grow_queue", "table", "math", "vector3", "quaternion", "frame_table", "path", "script_extended_replay")
	base_require("managers", "managers", "replay/replay_manager")

	self._world = Application.new_world("replay")

	ExtendedReplay.set_world(self._world)

	Managers.replay = ReplayManager:new(self._world)

	return 
end
ReplayBoot.update = function (self, dt)
	dt = Managers.replay:update(dt)

	World.update(self._world, dt)

	return 
end
ReplayBoot.render = function (self)
	local render_objects = ExtendedReplay.render_objects()

	if render_objects then
		local camera = Managers.replay:overriding_camera() or render_objects.camera

		Application.render_world(self._world, camera, render_objects.viewport, render_objects.shading_environment)
	end

	return 
end
ReplayBoot.shutdown = function (self)
	Managers:destroy()
	Application.release_world(self._world)

	for _, package in ipairs(self._packages) do
		package.unload(package)
		Application.release_resource_package(package)
	end

	return 
end

function replay_init()
	ReplayBoot:init()

	return 
end

function replay_update(dt)
	ReplayBoot:update(dt)

	return 
end

function replay_render()
	ReplayBoot:render()

	return 
end

function replay_shutdown()
	ReplayBoot:shutdown()

	return 
end

return 
