-- chunkname: @foundation/scripts/managers/managers.lua

local function debug_print(format, ...)
	if script_data.network_debug then
		printf("[Managers] " .. format, ...)
	end
end

local PROFILE_MANAGERS = BUILD == "dev" or BUILD == "debug"
local MANAGER_GROUP_ORDER = {
	"global",
	"venture",
	"state",
}

Managers = Managers or {
	state = {},
	venture = {},
}
ManagersCreationOrder = ManagersCreationOrder or {
	global = {},
	state = {},
	venture = {},
}

local function destroy_manager_group(manager_group_name)
	debug_print("Destroying manager group: ", manager_group_name)

	local manager_group = manager_group_name == "global" and Managers or Managers[manager_group_name]
	local manager_group_order = ManagersCreationOrder[manager_group_name]

	table.reverse(manager_group_order)

	for index, alias in ipairs(manager_group_order) do
		local manager = manager_group[alias]

		if manager and type(manager.destroy) == "function" then
			manager:destroy()
		end

		manager_group[alias] = nil
		manager_group_order[index] = nil
	end
end

local function get_iterator_forwards(array)
	return 1, #array, 1
end

local function get_iterator_backwards(array)
	return #array, 1, -1
end

local function call_on_managers(func_name, inverse_order, ...)
	debug_print("Calling function on all managers:", func_name, "inverse_order:", inverse_order)

	local iterator_type = inverse_order and get_iterator_backwards or get_iterator_forwards
	local group_id_start, group_id_end, group_id_direction = iterator_type(MANAGER_GROUP_ORDER)

	for group_id = group_id_start, group_id_end, group_id_direction do
		local manager_group_name = MANAGER_GROUP_ORDER[group_id]
		local manager_group = manager_group_name == "global" and Managers or Managers[manager_group_name]
		local manager_names = ManagersCreationOrder[manager_group_name]
		local manager_id_start, manager_id_end, manager_id_direction = iterator_type(manager_names)

		for manager_id = manager_id_start, manager_id_end, manager_id_direction do
			local manager = manager_group[manager_names[manager_id]]

			if manager and manager[func_name] then
				manager[func_name](manager, ...)
			end
		end
	end
end

Managers.destroy = function (self)
	for i = #MANAGER_GROUP_ORDER, 1, -1 do
		destroy_manager_group(MANAGER_GROUP_ORDER[i])
	end
end

Managers.state.destroy = function (self)
	destroy_manager_group("state")
end

Managers.venture.destroy = function (self)
	destroy_manager_group("venture")
end

Managers.on_round_start = function (self, ...)
	call_on_managers("on_round_start", false, ...)
end

Managers.on_round_end = function (self, ...)
	call_on_managers("on_round_end", true, ...)
end

Managers.on_venture_start = function (self, ...)
	call_on_managers("on_venture_start", false, ...)
end

Managers.on_venture_end = function (self, ...)
	call_on_managers("on_venture_end", true, ...)
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
					local ret1, ret2, ret3 = mt.update(...)

					return ret1, ret2, ret3
				end
			end
		end
	end,
	__tostring = function (managers)
		local s = "\n"

		for alias, manager in pairs(managers) do
			if type(manager) == "table" and alias ~= "state" and alias ~= "venture" then
				s = s .. "\t" .. alias .. "\n"
			end
		end

		return s
	end,
}
local mt_venture = {
	__newindex = function (managers, alias, manager)
		rawset(ManagersCreationOrder.venture, #ManagersCreationOrder.venture + 1, alias)
		rawset(managers, alias, manager)

		if manager and PROFILE_MANAGERS then
			local scope_name = alias .. "_update"
			local mt = getmetatable(manager)

			manager.update = function (...)
				local ret1, ret2, ret3 = mt.update(...)

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
	end,
}
local mt_state = {
	__newindex = function (managers, alias, manager)
		rawset(ManagersCreationOrder.state, #ManagersCreationOrder.state + 1, alias)
		rawset(managers, alias, manager)

		if manager and PROFILE_MANAGERS then
			local scope_name = alias .. "_update"
			local mt = getmetatable(manager)

			manager.update = function (...)
				local ret1, ret2, ret3 = mt.update(...)

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
	end,
}

setmetatable(Managers, mt_global)
setmetatable(Managers.venture, mt_venture)
setmetatable(Managers.state, mt_state)
