local function debug_print(format, ...)
	if script_data.network_debug then
		printf("[Managers] " .. format, ...)
	end
end

local PROFILE_MANAGERS = BUILD == "dev" or BUILD == "debug"
Managers = Managers or {
	state = {}
}
ManagersCreationOrder = ManagersCreationOrder or {
	global = {},
	state = {}
}

local function destroy_global_managers()
	table.reverse(ManagersCreationOrder.global)
	debug_print("Destroying global managers...")

	for index, alias in ipairs(ManagersCreationOrder.global) do
		local manager = Managers[alias]

		if manager and type(manager.destroy) == "function" then
			manager:destroy()
		end

		Managers[alias] = nil
		ManagersCreationOrder.global[index] = nil
	end
end

local function destroy_state_managers()
	table.reverse(ManagersCreationOrder.state)
	debug_print("Destroying state managers...")

	for index, alias in ipairs(ManagersCreationOrder.state) do
		local manager = Managers.state[alias]

		if manager and type(manager.destroy) == "function" then
			manager:destroy()
		end

		Managers.state[alias] = nil
		ManagersCreationOrder.state[index] = nil
	end
end

Managers.destroy = function (self)
	destroy_state_managers()
	destroy_global_managers()
end

Managers.state.destroy = function (self)
	destroy_state_managers()
end

local mt_global = {
	__newindex = function (managers, alias, manager)
		rawset(ManagersCreationOrder.global, #ManagersCreationOrder.global + 1, alias)
		rawset(managers, alias, manager)

		if manager and PROFILE_MANAGERS then
			local scope_name = alias .. "_update"
			local mt = getmetatable(manager)

			if mt then
				manager.update = function (...)
					Profiler.start(scope_name)

					local ret1, ret2, ret3 = mt.update(...)

					Profiler.stop(scope_name)

					return ret1, ret2, ret3
				end
			end
		end
	end,
	__tostring = function (managers)
		local s = "\n"

		for alias, manager in pairs(managers) do
			if type(manager) == "table" and alias ~= "state" then
				s = s .. "\t" .. alias .. "\n"
			end
		end

		return s
	end
}
local mt_state = {
	__newindex = function (managers, alias, manager)
		rawset(ManagersCreationOrder.state, #ManagersCreationOrder.state + 1, alias)
		rawset(managers, alias, manager)

		if manager and PROFILE_MANAGERS then
			local scope_name = alias .. "_update"
			local mt = getmetatable(manager)

			manager.update = function (...)
				Profiler.start(scope_name)

				local ret1, ret2, ret3 = mt.update(...)

				Profiler.stop(scope_name)

				return ret1, ret2, ret3
			end
		end
	end,
	__tostring = function (managers)
		local s = "\n"

		for alias, manager in pairs(managers) do
			if type(manager) == "table" then
				s = s .. "\t" .. alias .. "\n"
			end
		end

		return s
	end
}

setmetatable(Managers, mt_global)
setmetatable(Managers.state, mt_state)

return
