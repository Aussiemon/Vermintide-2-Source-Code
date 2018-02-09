DebugHelper = DebugHelper or {}
DebugHelper.remove_debug_stuff = function ()
	Commands.script = function ()
		return 
	end
	Commands.console = function ()
		return 
	end
	Commands.game_speed = function ()
		return 
	end
	Commands.fov = function ()
		return 
	end
	Commands.free_flight_settings = function ()
		return 
	end
	Commands.lag = function ()
		return 
	end
	Commands.location = function ()
		return 
	end
	Commands.next_level = function ()
		return 
	end

	return 
end
DebugHelper.enable_physics_dump = function ()
	local physics_namespaces = {
		"PhysicsWorld",
		"Actor",
		"Mover"
	}

	for _, namespace in pairs(physics_namespaces) do
		local namespace_to_debug = _G[namespace]

		for func_name, func in pairs(namespace_to_debug) do
			if type(func) == "function" then
				namespace_to_debug[func_name] = function (...)
					local output = string.format("%s.%s() : ", namespace, func_name)

					print(output, select(2, ...))

					return func(...)
				end
			end
		end
	end

	return 
end

return 
